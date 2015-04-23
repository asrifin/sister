<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu = 'Formulir';

  $x     = $_SESSION['kelompokS'].$_GET['nopendaftaranS'].$_GET['namaS'].$_GET['daftarS'].$_GET['joiningfS'];
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
          $pre='formulir_';
          $kelompok      = isset($_GET['kelompokS'])?filter($_GET['kelompokS']):'';
          $nopendaftaran = isset($_GET[$pre.'nopendaftaranS'])?filter($_GET[$pre.'nopendaftaranS']):'';
          $nama          = isset($_GET[$pre.'namaS'])?filter($_GET[$pre.'namaS']):'';
          $daftar        = isset($_GET[$pre.'daftarS'])?filter($_GET[$pre.'daftarS']):'';
          // $joiningf      = isset($_GET['joiningfS'])?filter($_GET['joiningfS']):'';
      
        // table content
          $s2 = 'SELECT
                  c.replid, 
                  c.nopendaftaran,
                  c.nama,
                  b.daftar, 
                  b.joiningf,
                  IFNULL(tbx.tanggal,"-")tanggal,
                  IF(tbx.idpembayaran IS NULL,"Belum Lunas","Lunas")status
                FROM
                  psb_calonsiswa c
                  LEFT JOIN psb_setbiaya b on b.replid = c.setbiaya
                  LEFT JOIN (
                    SELECT
                      p.replid idpembayaran,
                      p.siswa,
                      t.tanggal
                    FROM
                      keu_pembayaran p
                    LEFT JOIN keu_modulpembayaran m ON m.replid = p.modul
                    LEFT JOIN keu_katmodulpembayaran k ON k.replid = m.katmodulpembayaran
                    LEFT JOIN keu_transaksi t ON t.pembayaran = p.replid
                    WHERE
                      k.nama = "pendaftaran"
                  )tbx on tbx.siswa = c.replid
                WHERE
                  c.kelompok='.$kelompok.' AND
                  c.nopendaftaran LIKE "%'.$nopendaftaran.'%" AND
                  c.nama LIKE "%'.$nama.'%" AND
                  b.daftar LIKE "%'.$daftar.'%"';
                  var_dump($s2);
            $e2  = mysql_query($s2) or die(mysql_error());
            $n   = mysql_num_rows($e2);

        // header info 
          $s1 = 'SELECT k.kelompok,d.nama departemen, p.proses 
                 FROM psb_kelompok k 
                  LEFT JOIN psb_proses p on p.replid = k.proses
                  LEFT JOIN departemen d on d.replid = p.departemen
                WHERE k.replid ='.$kelompok;
          $e1 = mysql_query($s1);
          $r1 = mysql_fetch_assoc($e1) or die (mysql_error());

          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Pembayaran '.$mnu.'</b>
                        </td>
                      </tr>
                    </table><br />';

          $out.='<table width="100%">
                  <tr>
                    <td>Departemen </td>
                    <td>: '.$r1['departemen'].'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>Periode</td>
                    <td>: '.$r1['proses'].'</td>
                    <td align="right"></td>
                  </tr>
                  <tr>
                    <td>Kelompok</td>
                    <td>: '.$r1['kelompok'].'</td>
                    <td align="right"> Total :'.$n.' Data</td>
                  </tr>
                </table>';

            $out.='<table class="isi" width="100%">
                  <tr class="head">
                    <td align="center">No. Pendaftaran</td>
                    <td align="center">Nama</td>
                    <td align="center">Formulir</td>
                    <td align="center">Status</td>
                    <td align="center">Tanggal Bayar</td>
                  </tr>';
                    // <td align="center">Jumlah</td>
                    // <td align="center">Joining Fee</td>
            $nox = 1;
            $totbayar = 0;
            if($n==0){
              $out.='<tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
              </tr>';
            }else{
              while ($r2=mysql_fetch_assoc($e2)) {
                $out.='<tr>
                          <td>'.$r2['nopendaftaran'].'</td>
                          <td>'.$r2['nama'].'</td>
                          <td align="right">Rp. '.number_format($r2['daftar']).',-</td>
                          <td>'.$r2['status'].'</td>
                          <td align="center">'.($r['tanggal']=='-'?'-':tgl_indo5($r2['tanggal'])).'</td>
                    </tr>';
                          // <td align="right">Rp. '.number_format($r2['joiningf']).',-</td>
                          // <td align="right">Rp. '.number_format($r2['joiningf']+$r2['daftar']).',-</td>
                $nox++;
                // $totbayar+=($r2['daftar']+$r2['joiningf']);
                $totbayar+=$r2['daftar'];
              }
            }
            $out.='<tr>
              <td colspan="2" align="right"><b>Total : </b></td>
              <td align="right">Rp. '.number_format($totbayar).',-</td>
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