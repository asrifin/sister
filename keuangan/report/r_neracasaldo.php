<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  // $mnu = 'pendaftaran';

  $x     = $_SESSION['ns_kodeS'].$_GET['ns_namaS'];
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
            <title>SISTER::Keu - Neraca Saldo</title>
          </head>';
          $ns_kode      = isset($_GET['ns_kodeS'])?filter($_GET['ns_kodeS']):'';
          $ns_nama = isset($_GET['ns_namaS'])?filter($_GET['ns_namaS']):'';

        // table content
          $s2 = 'SELECT 
                      kr.kode kode,
                          kr.nama nama,
                          kj.debet debet,
                          kj.kredit kredit
                      FROM
                          keu_jurnal kj
                          LEFT JOIN keu_rekening kr ON kr.replid = kj.rek
                      WHERE
                        kr.kode like "%'.$ns_kode.'%" and
                      kr.nama like "%'.$ns_nama.'%"
                      ORDER BY
                          kr.kategorirek,
                      kr.kode';
            $e2  = mysql_query($s2) or die(mysql_error());
            $n   = mysql_num_rows($e2);

        // // header info 
        //   $s1 = 'SELECT k.kelompok,d.nama departemen, p.proses 
        //          FROM psb_kelompok k 
        //           LEFT JOIN psb_proses p on p.replid = k.proses
        //           LEFT JOIN departemen d on d.replid = p.departemen
        //         WHERE k.replid ='.$kelompok;
        //   $e1 = mysql_query($s1);
        //   $r1 = mysql_fetch_assoc($e1) or die (mysql_error());

          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Neraca Saldo</b>
                        </td>
                      </tr>
                    </table><br />';

            $out.='<table class="isi" width="100%">
                  <tr class="head">
                            <td class="text-center">Kode Rekening </td>
                            <td class="text-center">Nama Rekening</td>
                            <td class="text-center">Debet</td>
                            <td class="text-center">Kredit</td>
                  </tr>';
            $nox = 1;
            $debet = 0;
            $kredit = 0;
            if($n==0){
              $out.='<tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
              </tr>';
            }else{
              while ($r2=mysql_fetch_assoc($e2)) {
                $out.= '<tr>
                      <td>'.$r2['kode'].'</td>
                      <td>'.$r2['nama'].'</td>
                      <td>'.$r2['debet'].'</td>
                      <td>'.$r2['kredit'].'</td>
                    </tr>';
                $nox++;
                $debet+=($r2['debet']);
                $kredit+=($r2['kredit']);
              }
            }
            $out.='<tr>
              <td colspan="2" align="right"><b>Total : </b></td>
              <td align="right">Rp. '.number_format($debet).',-</td>
              <td align="right">Rp. '.number_format($kredit).',-</td>
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