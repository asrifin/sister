<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu = 'SPP';

  $x     = $_SESSION['kelasS'].$_GET['nisS'].$_GET['namaS'];
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) and $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>SISTER::Keu - Pembayaran '.$mnu.'</title>
          </head>';
          $pre    ='spp';
          $kelas  = isset($_GET[$pre.'_kelasS'])?filter($_GET[$pre.'_kelasS']):'';
          $nis    = isset($_GET[$pre.'_nisS'])?filter($_GET[$pre.'_nisS']):'';
          $nama   = isset($_GET[$pre.'_namaS'])?filter($_GET[$pre.'_namaS']):'';
          
        // table content
          $s2   = 'SELECT
                    a.replid,
                    a.siswa,
                    c.nis,
                    c.nama
                  FROM
                    aka_siswa_kelas a 
                    LEFT JOIN psb_calonsiswa c on c.replid = a.siswa 
                    LEFT JOIN aka_kelas k on k.replid = a.kelas
                  WHERE 
                    k.replid = '.$kelas.' AND 
                    c.nis LIKE "%'.$nis.'%" AND 
                    c.nama LIKE "%'.$nama.'%" 
                  ORDER BY 
                    c.nama asc';
          // var_dump($s2);
          $e2  = mysql_query($s2) or die(mysql_error());
          $n   = mysql_num_rows($e2);

          // header info 
          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="42%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Pembayaran '.$mnu.'</b>
                        </td>
                      </tr>
                    </table><br />';

          $kel   = getKelas('kelas',$kelas);
          $sub   = getSubtingkat('subtingkat',getKelas('replid',$kelas));
          $ting  = getTingkat('tingkat',getSubtingkat('replid',getKelas('replid',$kelas)));
          $ting2 = getTingkat('keterangan',getSubtingkat('replid',getKelas('replid',$kelas)));
          $thn   = getTahunAjaran('tahunajaran',getTingkat('tahunajaran',getKelas('replid',$kelas)));
          $dep   = getDepartemen('nama',getTahunAjaran('departemen',getTingkat('tahunajaran',getKelas('replid',$kelas))));
          // var_dump($thn);exit();
          $out.='<table width="100%">
                  <tr>
                    <td>Departemen </td>
                    <td>: '.$dep.'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>Tahun Ajaran</td>
                    <td>: '.$thn.'</td>
                    <td align="right"></td>
                  </tr>
                  <tr>
                    <td>Jenjang</td>
                    <td>: '.$ting2.' ('.$ting.')</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>Kelas</td>
                    <td>: '.$sub.' '.$kel.'</td>
                    <td align="right"> Total :'.$n.' Data</td>
                  </tr>
                </table>';

            $out.='<table class="isi" width="100%">
                  <tr class="head">
                    <td width="2%" align="center">No.</td>
                    <td  width="8%"  align="center">NIS</td>
                    <td  width="45%"  align="center">Nama</td>
                    <td  width="20%"  align="center">SPP</td>
                    <td  width="10%" align="center">Status</td>
                    <td  width="15%" align="center">Tanggal Bayar</td>
                  </tr>';

            $nox = 1;
            $totbayar  = 0;
            if($n==0){
              $out.='<tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
              </tr>';
            }else{
              while ($r2=mysql_fetch_assoc($e2)) {
                $biaya    = getBiaya($pre,$r2['siswa']);
                $terbayar = getTerbayar($pre,$r2['siswa']);
                $status   = getStatusBayar($pre,$r2['siswa']);
                if($status=='lunas'){ 
                  $clr = 'lightGreen';
                }else{ // belum
                  $clr = 'pink';
                }

                $out.='<tr>
                          <td align="right">'.$nox.'.</td>
                          <td  align="center">'.$r2['nis'].'</td>
                          <td>'.$r2['nama'].'</td>
                          <td align="right">Rp. '.number_format($biaya).'</td>
                          <td style="background-color:'.$clr.'"  align="center">'.$status.'</td>
                          <td align="center">'.getTglTrans($r2['siswa'],$pre).'</td>
                    </tr>';
                $nox++;
                $totbayar+=$biaya;
              }
            }
            $out.='<tr class="head">
              <td colspan="3" align="right"><b>Total : </b></td>
              <td align="right">Rp. '.number_format($totbayar).'</td>
              <td colspan="2"></td>
            </tr>';
            $out.='</table>';
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
  // ---------------------- //
  // -- created by epiii -- //
  // ---------------------- // 

?>