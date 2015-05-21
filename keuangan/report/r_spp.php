<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu = 'SPP';
  $pre  ='spp_';
  $x    = $_SESSION['id_loginS'].$_GET[$pre.'kelasS'].$_GET[$pre.'nisS'].$_GET[$pre.'namaS'].$_GET[$pre.'statusS'];
  $token = base64_encode($x);
  // var_dump($token);exit();
  // var_dump($_GET['token']);exit();
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
            <title>SISTER::Keu - Pembayaran '.$mnu.'</title>
          </head>';
          $pre    ='spp';
          $status = (isset($_GET[$pre.'_statusS']) AND $_GET[$pre.'_statusS']!='') ?' AND t2.statbayar="'.filter($_GET[$pre.'_statusS']).'"':'';
          $kelas  = isset($_GET[$pre.'_kelasS'])?filter($_GET[$pre.'_kelasS']):'';
          $nis    = isset($_GET[$pre.'_nisS'])?filter($_GET[$pre.'_nisS']):'';
          $nama   = isset($_GET[$pre.'_namaS'])?filter($_GET[$pre.'_namaS']):'';
          
        // table content
          $s2   = 'SELECT
                    t2.*
                  FROM
                    psb_calonsiswa c
                    LEFT JOIN aka_siswa_kelas a on a.siswa = c.replid
                    LEFT JOIN (
                      SELECT
                        IF (t1.cicilan = t1.spp,"lunas","belum") statbayar,
                        cs.replid,
                        cs.nama,
                        t1.cicilan,
                        t1.spp,
                        cs.kelompok,
                        cs.nis
                      FROM psb_calonsiswa cs
                        LEFT JOIN (
                          SELECT
                            ss.replid,
                            p.cicilan,
                            s.spp
                          FROM
                            psb_calonsiswa ss
                            LEFT JOIN keu_pembayaran p ON p.siswa = ss.replid
                            LEFT JOIN keu_modulpembayaran m ON m.replid = p.modul
                            LEFT JOIN keu_katmodulpembayaran k ON k.replid = m.katmodulpembayaran
                            LEFT JOIN psb_setbiaya s ON s.replid = ss.setbiaya
                          WHERE
                            k.nama = "spp"
                        ) t1 ON t1.replid = cs.replid
                    ) t2 ON t2.replid = c.replid
                  WHERE
                    a.kelas = '.$kelas.'
                    AND c.nama LIKE "%'.$nama.'%"
                    AND c.nis LIKE "%'.$nis.'%" '.$status;
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
          // kelas : a,b,c
          $kelNama  = getKelas('kelas',$kelas);
          $subId    = getKelas('subtingkat',$kelas);
          // tingkat : 1,2,3
          $subNama  = getSubtingkat('subtingkat',$subId);
          $tingId   = getSubtingkat('tingkat',getSubtingkat('tingkat',$subId));
          // tingkat : sma,smp,sd  
          $tingNama = getTingkat('tingkat',$tingId);
          $tingKet  = getTingkat('keterangan',$tingId);
          // tahun ajaran 
          $thnId    = getTingkat('tahunajaran',$tingId);
          $thnNama  = getTahunAjaran('tahunajaran',$tingId);
          // departemen 
          $depId   = getTahunAjaran('departemen',$thnId);
          $depNama = getDepartemen('nama',$depId);

          $out.='<table width="100%">
                  <tr>
                    <td>Departemen </td>
                    <td>: '.$depNama.'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>Tahun Ajaran</td>
                    <td>: '.$thnNama.'</td>
                    <td align="right"></td>
                  </tr>
                  <tr>
                    <td>Jenjang</td>
                    <td>: '.$tingNama.' ('.$tingKet.')</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>Kelas</td>
                    <td>: '.$subNama.' '.$kelNama.'</td>
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
                $biaya    = getBiaya($pre,$r2['replid']);
                $terbayar = getTerbayar($pre,$r2['replid']);
                $status   = getStatusBayar($pre,$r2['replid']);
                // var_dump($status);exit();
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
                          <td align="center">'.getTglTrans($r2['replid'],$pre).'</td>
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