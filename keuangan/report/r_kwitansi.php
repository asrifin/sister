<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $x     = $_SESSION['id_loginS'].$_GET['nomerH'];
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
            <title>SISTER::Keu - Kwitansi Transaksi '.$mnu.'</title>
          </head>';
          $nomer = isset($_GET['nomerH'])?filter($_GET['nomerH']):'';
        // keterangan transaksi
          $s1 = 'SELECT * FROM keu_transaksi WHERE nomer = "'.$nomer.'"';
          $e1 = mysql_query($s1) or die(mysql_error());
          $r1 = mysql_fetch_assoc($e1);
          $jenisTrans=getJenisTrans('nama',getDetJenisTrans('jenistrans','replid',$r1['detjenistrans']));
          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Kwitansi Transaksi '.$jenisTrans.'</b>
                        </td>
                      </tr>
                    </table><br />';

          $out.='<table width="100%">
                  <tr>
                    <td width="20%" >Kode Transaksi </td>
                    <td>: '.$r1['nomer'].'</td>
                  </tr>
                  <tr>
                    <td>No. Bukti</td>
                    <td>: '.$r1['nobukti'].'</td>
                  </tr>
                  <tr>
                    <td>Tanggal</td>
                    <td>: '.tgl_indo5($r1['tanggal']).'</td>
                  </tr>
                  <tr>
                    <td>Rekening Kas</td>
                    <td>: '.getRekening($r1['rekkas']).'</td>
                  </tr>
                  <tr>';
          if($jenisTrans=='pengeluaran'){
            $out.='<td>Anggaran</td>
                    <td>: '.getAnggaran($r1['detilanggaran']).'</td>
                  </tr>';
          }
          $out.='</table>';

            $out.='<table class="isi" width="100%">
                  <tr class="head">
                    <td align="center">Rekening</td>
                    <td align="center">Nominal</td>
                    <td align="center">Uraian</td>
                  </tr>';
            $totbayar =0;
            $nox      = 1;
            $s2       ='SELECT * from keu_jurnal WHERE transaksi='.$r1['replid'];
            $e2       =mysql_query($s2);
            while ($r2 =mysql_fetch_assoc($e2)) {
              $out.='<tr>
                        <td>'.getRekening($r2['rek']).'</td>
                        <td align="right">Rp. '.number_format($r1['nominal']).'</td>
                        <td>'.$r1['uraian'].'</td>
                  </tr>';
              $totbayar+=$r2['nominal'];
            }
            $out.='<tr class="head">
              <td align="right"><b>Total : </b></td>
              <td align="right">Rp. '.number_format($totbayar).'</td>
              <td></td>
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