<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/func.php';
  require_once '../../lib/pagination_class.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/mpdf/mpdf.php';

  // pr($_GET);
  $mod   ='PSB';
  $x     = $_SESSION['id_loginS'].$_GET['idsiswabiaya'];
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) OR  $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
          <title>SISTER::'.$mod.' - '.$mnu.'</title>
        </head>';
        $idsiswabiaya = (isset($_GET['idsiswabiaya']) AND $_GET['idsiswabiaya']!='')?filter($_GET['idsiswabiaya']):'';
        $s = 'SELECT
                s.namasiswa,
                s.nis,
                b.biaya,
                s.nisn,
                sb.isAngsur2,
                if(sb.isAngsur2=1,concat("Angsur ",a.angsuran," x"),"Kontan")carabayar,
                d.nama departemen,
                s.nopendaftaran,
                CONCAT(t.tingkat," - ",st.subtingkat,"",k.kelas)kelas,
                concat(ta.tahunajaran," - ",ta.tahunajaran+1) tahunajaran,
                db.nominal biayaAwal,
                (db.nominal-getBiayaNett(sb.replid))diskonTotal,
                getBiayaNett(sb.replid)biayaNett,
                round(getBiayaNett(sb.replid)/a.angsuran,0) angsurNom
              FROM
                psb_siswa s
                LEFT JOIN psb_siswabiaya sb ON sb.siswa = s.replid
                LEFT JOIN psb_angsuran a ON a.replid = sb.angsuran
                LEFT JOIN psb_detailbiaya db ON db.replid = sb.detailbiaya
                LEFT JOIN psb_biaya b ON b.replid = db.biaya
                LEFT JOIN psb_detailgelombang dg ON dg.replid = db.detailgelombang
                LEFT JOIN aka_tahunajaran ta ON ta.replid = dg.tahunajaran
                LEFT JOIN departemen d  ON d.replid = dg.departemen
                LEFT JOIN aka_siswakelas sk ON sk.siswa = s.replid 
                LEFT JOIN aka_detailkelas dk ON dk.replid = sk.detailkelas 
                LEFT JOIN aka_kelas k ON k.replid = dk.kelas
                LEFT JOIN aka_subtingkat st ON st.replid = k.subtingkat
                LEFT JOIN aka_tingkat t ON t.replid = st.tingkat
              WHERE
                sb.replid ='.$idsiswabiaya.'  
              GROUP BY
                s.replid';
           // pr($s);
        $e = mysql_query($s);
        $r = mysql_fetch_assoc($e);
        // Title content
        $out.='<body>
                  <table  width="100%">
                    <tr>
                      <td xwidth="40%">
                        <img width="100" src="../../images/logo2.png" alt="" />
                      </td>
                      <td colspan="2">
                        <small>
                          Jl. Raya Sukomanunggal Jaya No. 33 A Surabaya 60187 <br />
                          Telp. (031) 732 5999 | fax. (031) 734 5464 <br />
                          Jl. Raya Kali Rungkut No.5 Ruko Rungkut Megah Raya A-25 Surabaya 60293 <br />
                          Telp. (031) 879 8896 | fax. (031) 879 8896 <br />
                          www.elyon.sch.id | info@elyon.sch.id 
                        </small>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" align="center"><hr /></td>
                    </tr>
                    <tr>
                      <td colspan="3" align="center">Invoice Pembayaran '.$r['biaya'].' Siswa</td>
                    </tr>
                    <tr>
                      <td colspan="3" align="center"><hr /></td>
                    </tr>
                    <tr>
                      <td>Departemen </td>
                      <td>: '.$r['departemen'].' </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>Tahun Ajaran </td>
                      <td>: '.$r['tahunajaran'].' </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>Nama </td>
                      <td>: '.$r['namasiswa'].' </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>Kelas </td>
                      <td>: '.$r['kelas'].' </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>NIS </td>
                      <td>: '.$r['nis'].' </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td colspan="3"><hr /></td>
                    </tr>
                    <tr>
                      <td colspan="3">Rincian </td>
                    </tr>
                    <!--<tr>
                      <td>* Biaya </td>
                      <td>: '.$r['biaya'].' </td>
                      <td></td>
                    </tr>-->
                    <tr>
                      <td>* Bayar </td>
                      <td>: '.$r['carabayar'].' </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>* Nominal Awal </td>
                      <td>: '.setuang($r['biayaAwal']).' </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>* Diskon </td>
                      <td>: '.setuang($r['diskonTotal']).' </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>* Nominal Nett </td>
                      <td '.($r['isAngsur2']!=1?'style="background-color:lightBlue;"':'').'>: '.($r['isAngsur2']!=1?setuang($r['biayaNett']):'').'</td>
                      <td '.($r['isAngsur2']==1?'style="background-color:lightBlue;"':'').'  align="right"> '.($r['isAngsur2']==1?setuang($r['biayaNett']):'').' </td>
                    </tr>';
                if($r['isAngsur2']==1){  
                  $out.='<tr>
                      <td colspan="3">History Pembayaran </td>
                    </tr>
                    <tr class="head">
                      <td  align="center">Angsuran </td>
                      <td align="center">Tanggal </td>
                      <td align="center">Nominal </td>
                    </tr>';

                  $s2 ='SELECT p.replid, p.tanggal,p.nominal
                       FROM keu_penerimaansiswa p 
                       WHERE p.siswabiaya = '.$idsiswabiaya.'
                       ORDER BY p.tanggal ASC, p.replid ASC';
                  $e2  = mysql_query($s2);
                  $n2  = mysql_num_rows($e2);
                  $arr = array();
                  $totNominal=0;$angsuranKe=0;
                  if($n2==0) $out.='<tr><td align="center" colspan="3">Kosong</td></tr>';
                  else {
                    while ($r2=mysql_fetch_assoc($e2)){
                      $angsuranKe++;
                      $out.='<tr style="background-color:lightGrey;">
                          <td align="center">'.$angsuranKe.' </td>
                          <td align="center">'.tgl_indo5($r2['tanggal']).' </td>
                          <td align="right">'.setuang($r2['nominal']).' </td>
                        </tr>';
                      $totNominal+=$r2['nominal'];  
                    }
                  }
                  $out.='<tr class="head">
                      <td colspan="2" align="center">Total Terbayar </td>
                      <td style="background-color:lightBlue;" align="right">'.setuang($totNominal).'</td>
                    </tr><tr>
                      <td>* Total Kurangan </td>
                      <td>: </td>
                      <td style="background-color:lightBlue;" align="right">'.setuang(intval($r['biayaNett'])-$totNominal).'</td>
                    </tr>';
                }
                $out.='<tr>
                      <td >* Tagihan '.($r['isAngsur2']==1?' Angsuran ke-'.($angsuranKe==0?1:$angsuranKe+1):'').'</td>
                      <td '.($r['isAngsur2']!=1?'style="background-color:pink;"':'').'>: '.($r['isAngsur2']!=1?setuang($r['biayaNett']):'').'</td>
                      <td  '.($r['isAngsur2']==1?'align="right" style="background-color:pink;"':'').' >'.($r['isAngsur2']==1?setuang($r['angsurNom']):'').'</td>
                    </tr><tr>
                      <td>* Terbilang</td>
                      <td colspan="2">: '.Terbilang(($r['isAngsur2']==1?$r['angsurNom']:$r['biayaNett'])).' Rupiah</td>
                    </tr>
                  </table>';
                  // pr(intval($r['biayaNett']));
        $out.='</body>';
        echo $out;
  
        #generate html -> PDF ------------
          $out2 = ob_get_contents();
          ob_end_clean(); 
          $mpdf=new mPDF('c','A4','');   
          $mpdf->SetDisplayMode('fullpage');   
          $stylesheet = file_get_contents('../../lib/mpdf/r_cetak.css');
          $mpdf->WriteHTML($stylesheet,1);  
          $mpdf->WriteHTML($out);
          $mpdf->Output();
  }
}
?>