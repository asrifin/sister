<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/func.php';
  require_once '../../lib/pagination_class.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/mpdf/mpdf.php';

  $mod   ='Sarpras';
  $x     = $_SESSION['id_loginS'].$_GET['detail_tempatH'].$_GET['detail_kodeS'].$_GET['detail_namaS'].$_GET['detail_barkodeS'].$_GET['detail_sumberS'].$_GET['detail_hargaS'].$_GET['detail_kondisiS'].$_GET['detail_statusS'].$_GET['detail_keteranganS'];
$token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) OR  $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
$tempat     = isset($_GET['detail_tempatH'])?$_GET['detail_tempatH']:'';
        $ss = ' SELECT
                  t.nama tempat,
                  l.nama
                FROM
                  sar_tempat t
                  LEFT JOIN sar_lokasi l ON l.replid = t.lokasi
                WHERE
                  t.replid = '.$tempat;
          // print_r($ss);exit();
        $ee = mysql_query($ss);
        $rr = mysql_fetch_assoc($ee);
        // pr($ss);

        ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
          <title>SISTER::'.$mod.' '.$mnu.'</title>
        </head>';
        $replid = (isset($_GET['replid']) AND $_GET['replid']!='')?filter($_GET['replid']):'';
    
        // Title content
        $out.='<body>
               <p align="center">
                <b>
                  Data Barang berdasarkan Tempat<br>
                </b>
              </p>
              <table>
                <tr>
                  <td>Lokasi</td>
                  <td>:</td>
                  <td>'.$rr['nama'].'</td>
                </tr>
                <tr>
                  <td>Tempat</td>
                  <td>:</td>
                  <td>'.$rr['tempat'].'</td>
                </tr>
                <tr>
                  <td>Keterangan</td>
                  <td>:</td>
                  <td>'.$rr['keterangan'].'</td>
                </tr>
              </table><br>';

                $kode       = isset($_POST['detail_kodeS'])?$_POST['detail_kodeS']:'';
                $nama       = isset($_POST['detail_namaS'])?$_POST['detail_namaS']:'';
                $barkode    = isset($_POST['detail_barkodeS'])?filter($_POST['detail_barkodeS']):'';
                $harga      = isset($_POST['detail_hargaS'])?filter($_POST['detail_hargaS']):'';
                $kondisi    = isset($_POST['detail_kondisiS'])?filter($_POST['detail_kondisiS']):'';
                $sumber     = isset($_POST['detail_sumberS'])?filter($_POST['detail_sumberS']):'';
                $status     = isset($_POST['detail_statusS'])?filter($_POST['detail_statusS']):'';
                $keterangan = isset($_POST['detail_keteranganS'])?filter($_POST['detail_keteranganS']):'';
            
            $s = 'SELECT (
                    SELECT 
                      CONCAT(ll.kode,"/",gg.kode,"/",tt.kode,"/",kk.kode,"/",LPAD(b.urut,5,0))
                    from 
                      sar_katalog kk,
                      sar_grup gg,
                      sar_tempat tt,
                      sar_lokasi ll
                    where 
                      kk.replid = b.katalog AND
                      kk.grup   = gg.replid AND
                      b.tempat  = tt.replid AND
                      tt.lokasi = ll.replid
                  )as kode,
                  b.replid,
                  LPAD(b.urut,5,0) as barkode,(
                    case b.sumber
                      when 0 then "Beli"
                      when 1 then "Pemberian" 
                      when 2 then "Membuat Sendiri" 
                    end
                  )as sumber,
                  b.harga,
                  IF(b. STATUS=1,"Tersedia","Dipinjam")AS status,
                  k.nama as kondisi,
                  t.nama as tempat,
                  b.keterangan,
                  kg.nama as katalog
                  FROM
                    sar_barang b 
                    LEFT JOIN sar_kondisi k on k.replid = b.kondisi
                    LEFT JOIN sar_katalog kg on kg.replid = b.katalog
                    LEFT JOIN sar_tempat t on t.replid = b.tempat
                    WHERE
                      t.replid = '.$tempat.' AND
                      kg.nama LIKE "%'.$nama.'%" and
                      b.kode LIKE "%'.$kode.'%" and
                      b.barkode LIKE "%'.$barkode.'%" and
                      b.harga LIKE "%'.$harga.'%" and
                      b.sumber LIKE "%'.$sumber.'%" and
                      k.nama LIKE "%'.$kondisi.'%" and
                      b.status LIKE "%'.$status.'%" and
                      b.keterangan LIKE "%'.$keterangan.'%"
                    ORDER BY 
                  b.replid desc'; 

                  $e = mysql_query($s);
                  $n = mysql_num_rows($e);
                  $out.='<span align="right"><b>Total : '.$n.'</b></span>';
                  $out.='<table class="isi" width="100%">
                      <tr class="head">
                        <td align="center">Kode</td>
                        <td align="center">Nama</td>
                        <td align="center">Barcode</td>
                        <td align="center">Sumber</td>
                        <td align="center">Harga</td>
                        <td align="center">Kondisi</td>
                        <td align="center">Status</td>
                        <td align="center">Keterangan</td>
                      </tr>';

                  $nox = 1;
                  if($n==0){
                    $out.='<tr>
                      <td>-</td>
                      <td>-</td>
                      <td>-</td>
                      <td>-</td>
                      <td>-</td>
                      <td>-</td>
                      <td>-</td>
                      <td>-</td>
                    </tr>';
                  }else{
                    while ($r=mysql_fetch_assoc($e)) {
                      $out.='<tr>
                                <td>'.$r['kode'].'</td>
                                <td>'.$r['katalog'].'</td>
                                <td align="right">'.$r['barkode'].'</td>
                                <td align="right">'.$r['sumber'].'</td>
                                <td align="right">Rp. '.number_format($r['harga']).',-</td>
                                <td align="right">'.$r['kondisi'].'</td>
                                <td align="right">'.$r['status'].'</td>
                                <td>'.$r['keterangan'].'</td>
                          </tr>';
                      $nox++;
                    }
                  }
          $out.='</table>';
          // $out.='<p>Total : '.$n.'</p>';

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