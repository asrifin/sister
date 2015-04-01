<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';

  $x     = $_SESSION['id_loginS'].$_GET['k_grupS'].$_GET['k_kodeS'].$_GET['k_namaS'].$_GET['k_keteranganS'];
  $token = base64_encode($x);
  // print_r($_GET['token']);exit();
  if(!isset($_SESSION)){ // login 
    echo 'user has been logout';
  }else{ // logout
    if(!isset($_GET['token']) and $token!==$_GET['token']){
      echo 'maaf token - url tidak valid';
    }else{
        $ss = ' SELECT 
                  g.nama as grup,
                  l.nama as lokasi,
                  sum(b.harga)as totaset
                FROM 
                  sar_barang b,
                  sar_katalog k,
                  sar_lokasi l,
                  sar_grup g
                WHERE 
                  g.replid  = '.$_GET['k_grupS'].' and 
                  b.katalog = k.replid and
                  g.lokasi  = l.replid and
                  g.replid  = k.grup';
          // print_r($ss);exit();
        $ee = mysql_query($ss);
        $rr = mysql_fetch_assoc($ee);
        sleep(1);
        ob_start(); // digunakan untuk convert php ke html
        $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
          <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
              <title>SISTER::Sar - Katalog</title>
            </head>

            <body>
              <p align="center">
                <b>
                  Katalog Barang<br>
                </b>
              </p>
              <table>
                <tr>
                  <td>Grup Barang</td>
                  <td>:</td>
                  <td>'.$rr['grup'].'</td>
                </tr>
                <tr>
                  <td>Lokasi</td>
                  <td>:</td>
                  <td>'.$rr['lokasi'].'</td>
                </tr>
                <tr>
                  <td>Total Aset</td>
                  <td>:</td>
                  <td>Rp. '.number_format($rr['totaset']).',-</td>
                </tr>
              </table><br>
  
              <table class="isi" width="100%">
                  <tr class="head">
                    <td align="center">Kode</td>
                    <td align="center">Grup Barang</td>
                    <td align="center">Jumlah Unit</td>
                    <td align="center">Unit Tersedia</td>
                    <td align="center">Unit Dipinjam</td>
                    <td align="center">Total Aset</td>
                    <td align="center">Keterangan</td>
                  </tr>';
                  $k_grup       = isset($_GET['k_grupS'])?filter(trim($_GET['k_grupS'])):'';
                  $k_kode       = isset($_GET['k_kodeS'])?filter(trim($_GET['k_kodeS'])):'';
                  $k_nama       = isset($_GET['k_namaS'])?filter(trim($_GET['k_namaS'])):'';
                  $k_keterangan = isset($_GET['k_keteranganS'])?filter(trim($_GET['k_keteranganS'])):'';

                  $s =' SELECT
                          k.replid,
                          k.kode,
                          k.nama,
                          j.nama jenis,
                          COUNT(*) jum_unit,
                          SUM(b.harga) aset,
                          k.susut,
                          k.keterangan
                        FROM  
                          sar_katalog k
                          LEFT JOIN sar_jenis  j on j.replid = k.jenis
                          LEFT JOIN sar_barang b on b.katalog = k.replid
                        WHERE
                          k.grup = '.$k_grup.' and
                          k.kode like "%'.$k_kode.'%" and
                          k.nama like "%'.$k_nama.'%" and
                          k.keterangan like "%'.$k_keterangan.'%"
                        GROUP BY 
                          k.replid
                        ORDER BY
                          k.kode asc';

                  // print_r($s);exit();
                  $e = mysql_query($s);
                  $n = mysql_num_rows($e);
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
                    </tr>';
                  }else{
                    while ($r=mysql_fetch_assoc($e)) {
                      $out.='<tr>
                                <td>'.$r['kode'].'</td>
                                <td>'.$r['nama'].'</td>
                                <td align="right">'.$r['jenis'].'</td>
                                <td align="right">'.$r['jum_unit'].'</td>
                                <td align="right">Rp. '.number_format($r['aset']).',-</td>
                                <td align="right">'.$r['susut'].'</td>
                                <td>'.$r['keterangan'].'</td>
                          </tr>';
                      $nox++;
                    }
                  }
          $out.='</table>';
          $out.='<p>Total : '.$n.'</p>';
        echo $out;
  
        #generate html -> PDF ------------
          $out2 = ob_get_contents();
          ob_end_clean(); 
          $mpdf=new mPDF('c','A4','');   
          $mpdf->SetDisplayMode('fullpage');   
          $stylesheet = file_get_contents('../../lib/mpdf/r_cetak.css');
          $mpdf->WriteHTML($stylesheet,1);  // The parameter 1 tells that this is css/style only and no body/html/text
          $mpdf->WriteHTML($out);
          $mpdf->Output();
    }
}
  // ---------------------- //
  // -- created by epiii -- //
  // ---------------------- // 

?>