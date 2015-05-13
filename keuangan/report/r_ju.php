<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu = 'transaksi';
  $pre = 'ju_';

  echo '<pre>';
  print_r($_GET);
  echo '</pre>';
  // exit();
  $jenis==$jenis2='';
  foreach ($_GET['detjenisTB'] as $i => $v) {
    $jenis.=$v;
    $jenis2.=','.$i;
  }$jenis2=substr($jenis2,1);

  $x     = $_SESSION['id_loginS'].$_GET[$pre.'noS'].$_GET[$pre.'uraianS'].$_GET['jenisAllCB'].$jenis.$_GET['tgl1TB'].$_GET['tgl2TB'];
  $token = base64_encode($x);
  // var_dump($jenis); echo "<br />";
  // var_dump($x); echo "<br />";
  // var_dump($token); echo "<br />";
  // var_dump($_GET['token']);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) OR $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>SISTER::Keu - Jurnal Umum '.$mnu.'</title>
          </head>';
          // $kelompok      = isset($_GET['kelompokS'])?filter($_GET['kelompokS']):'';
          // $nopendaftaran = isset($_GET['nopendaftaranS'])?filter($_GET['nopendaftaranS']):'';
          // $nama          = isset($_GET['namaS'])?filter($_GET['namaS']):'';
          $ju_no     = isset($_GET['ju_noS'])?filter($_GET['ju_noS']):'';
          $ju_uraian = isset($_GET['ju_uraianS'])?filter($_GET['ju_uraianS']):'';
      
        // table content
          $s1 = 'SELECT * 
                  from keu_transaksi 
                  WHERE 
                    (nomer like "%'.$ju_no.'%" OR nomer like "%'.$ju_no.'%" ) AND
                    uraian like "%'.$ju_uraian.'%"';
            $e1  = mysql_query($s21) or die(mysql_error());
            // $n   = mysql_num_rows($e1);

          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Jurnal Umum</b>
                        </td>
                      </tr>
                    </table><br />';

            $out.='<table class="isi" width="100%">
                        <tr class="head">
                            <td class="text-center">Tanggal </td>
                            <td class="text-center">No. Jurnal/Jenis Bukti/No.Bukti</td>
                            <td class="text-center">Uraian</td>
                            <td class="text-center">Detil Jurnal</td>
                        </tr>';
            $nox = 1;
            $totbayar = 0;
            if($n==0){
              $out.='<tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
              </tr>';
            }else{
              while ($res=mysql_fetch_array($e1)) {
                $s2 = 'SELECT r.kode,r.nama,j.debet,j.kredit
                    from keu_jurnal j,keu_rekening r 
                    where 
                      j.transaksi ='.$res['replid'].' AND 
                      j.rek=r.replid
                    ORDER BY kredit  ASC';
                $e2 = mysql_query($s2);
                $tb2.='<table class="bordered striped lightBlue" width="100%">';
                    while($r2=mysql_fetch_assoc($e2)){
                      $tb2.='<tr>
                          <td>'.$r2['nama'].'</td>
                          <td>'.$r2['kode'].'</td>
                          <td>Rp. '.number_format($r2['debet']).',-</td>
                          <td>Rp. '.number_format($r2['kredit']).',-</td>
                        </tr>';
                    }$tb2.='</table>';
                $out.= '<tr>
                      <td>'.tgl_indo($res['tanggal']).'</td>
                      <td>'.ju_nomor($res['nomer'],$res['jenis'],$res['nobukti']).'</td>
                      <td>'.$res['uraian'].'</td>
                      <td style="display:visible;" class="uraianCOL">'.$tb2.'</td>
                    </tr>';
                $nox++;
                // $totbayar+=($r2['daftar']+$r2['joiningf']);
                $debet += ($r2['debet']);
                $kredit += ($r2['kredit']);
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