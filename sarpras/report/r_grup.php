<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';

  $x     = $_SESSION['id_loginS'].$_GET['g_lokasiS'].$_GET['g_kodeS'].$_GET['g_namaS'].$_GET['g_keteranganS'];
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // login 
    echo 'user has been logout';
  }else{ // logout
    if(!isset($_GET['token']) and $token!==$_GET['token']){
      echo 'maaf token - url tidak valid';
    }else{
        $ss = 'SELECT *  from sar_lokasi where replid='.$_GET['g_lokasiS'];
        $ee = mysql_query($ss);
        $rr = mysql_fetch_assoc($ee);
          sleep(1);
          ob_start(); // digunakan untuk convert php ke html
          $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml">
              <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>SISTER::Sar - inventaris</title>
              </head>

              <body>
                <p align="center">
                  <b>
                    Grup Barang<br>
                  </b>
                </p>
                <p align="justify">Lokasi : '.$rr['nama'].' ['.$rr['kode'].']</p>
  
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
                    $lokasi       = isset($_GET['g_lokasiS'])?filter(trim($_GET['g_lokasiS'])):'';
                    $g_kode       = isset($_GET['g_kodeS'])?filter(trim($_GET['g_kodeS'])):'';
                    $g_nama       = isset($_GET['g_namaS'])?filter(trim($_GET['g_namaS'])):'';
                    $g_keterangan = isset($_GET['g_keteranganS'])?filter(trim($_GET['g_keteranganS'])):'';

                    $s = 'SELECT
                            g.replid,
                            g.kode,
                            g.nama,
                            IFNULL(tbtot.jum,0) u_total,
                            IFNULL(tbpjm.jum,0) u_dipinjam,
                            IFNULL(tbtot.jum,0) - IFNULL(tbpjm.jum,0) u_tersedia,
                            IFNULL(tbaset.aset,0) aset,
                            g.keterangan
                          FROM
                            sar_grup g
                            LEFT JOIN (
                              SELECT 
                                k.grup,
                                count(*) jum 
                              from 
                                sar_katalog k
                                left JOIN sar_barang b on b.katalog = k.replid
                              GROUP BY
                                k.grup
                            )tbtot on tbtot.grup = g.replid
                            
                            LEFT JOIN(
                              SELECT 
                                k.grup,
                                count(*)jum
                              from 
                                sar_peminjaman pj
                                left JOIN sar_pengembalian kb on kb.peminjaman = pj.replid
                                LEFT JOIN sar_barang b on b.replid = pj.barang
                                left JOIN sar_katalog k on k.replid = b.katalog
                              WHERE
                                kb.replid is NULL
                              GROUP BY  
                                k.grup
                            )tbpjm on tbpjm.grup = g.replid
                            LEFT JOIN(
                              SELECT
                                k.grup,
                                SUM(b.harga)aset
                              from 
                                sar_barang b
                                join sar_katalog k on k.replid = b.katalog
                              GROUP BY 
                                k.grup
                            )tbaset on tbaset.grup = g.replid
                          WHERE
                            g.lokasi = '.$lokasi.' and
                            g.kode like "%'.$g_kode.'%" and
                            g.nama like "%'.$g_nama.'%" and
                            g.keterangan like "%'.$g_keterangan.'%" 
                          ORDER BY
                            g.kode asc';
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
                                  <td align="right">'.$r['u_total'].'</td>
                                  <td align="right">'.$r['u_dipinjam'].'</td>
                                  <td align="right">'.$r['u_tersedia'].'</td>
                                  <td align="right">Rp. '.number_format($r['aset']).',-</td>
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