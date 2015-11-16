<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu   = 'transaksi';
  $pre   = 'bb_';
  $x     = $_SESSION['id_loginS'].$_GET[$pre.'detilrekeningS'];
  $token = base64_encode($x);

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
            $bb_detilrekening = (isset($_GET['bb_detilrekeningS']) AND $_GET['bb_detilrekeningS']!='')?' dr.replid = '.$_GET['bb_detilrekeningS'].' AND ':'';
            $s1= 'SELECT 
                  j.detilrekening replid, 
                  CONCAT(dr.kode," - ",dr.nama)detilrekening
                FROM keu_jurnal j 
                  JOIN keu_detilrekening dr on dr.replid = j.detilrekening
                  JOIN keu_transaksi t on t.replid = j.transaksi
                WHERE 
                  '.$bb_detilrekening.'
                  t.tanggal BETWEEN "'.tgl_indo6($_GET['tgl1']).'" and "'.tgl_indo6($_GET['tgl2']).'"
                GROUP BY j.detilrekening
                ORDER BY dr.kode asc,dr.nama asc';
                // pr($s1);
            $e1 = mysql_query($s1) or die(mysql_error());
            $n1 = mysql_num_rows($e1);
            $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Laporan Buku Besar</b>
                        </td>
                        <td align="right">Tgl : '.$_GET['tgl1'].' s/d '.$_GET['tgl2'].'</td>
                      </tr>
                    </table>';
            if($n1==0){
              $out.='<b align="center">Tidak ditemukan data Transaksi</b>';
            }else{
              // $out.='<ul>';
              while ($r1=mysql_fetch_array($e1)) {
                $out.='<table width="100%">
                  <tr>
                    <td align="left">
                      '.$r1['detilrekening'].' 
                    </td>
                  </tr>
                </table>';
                // $out.='<li style="list-style:none;">['.$r1['kode'].'] '.$r1['nama'].'</li>';
                 $s2='SELECT
                        t.replid,
                        t.tanggal,
                        t.idkwitansi,
                        t.uraian,
                        d.nama namarekening,
                        d.kode koderekening,
                        j.nominal,
                        j.detilrekening,
                        t.detjenistransaksi,
                        j.jenisrekening
                      FROM
                        keu_transaksi t
                        LEFT JOIN keu_jurnal j ON t.replid = j.transaksi
                        LEFT JOIN keu_detilrekening d ON d.replid = j.detilrekening
                      WHERE
                        d.replid ='.$r1['replid'].'
                      ORDER BY
                        d.kategorirekening ASC,
                        d.kode ASC';
                        // pr($s2);
                $e2 = mysql_query($s2) or die(mysql_error());
                $out.='<table width="100%" class="isi">
                      <thead>
                          <tr class="head">
                              <th width="12%">Tanggal </th>
                              <th width="18%">No. Transaksi</th>
                              <th width="30%">Uraian</th>
                              <th width="20%">Debet</th>
                              <th width="20%">Kredit</th>
                          </tr>
                      </thead>
                      <tbody>';
                $debitTot=$kreditTot=0;
                while ($r2=mysql_fetch_assoc($e2)) {
                  $debit  = $r2['jenisrekening']=='d'?setuang($r2['nominal']):'';
                  $kredit = $r2['jenisrekening']=='k'?setuang($r2['nominal']):'';
                  $debitTot+=$debit==''?0:$r2['nominal'];
                  $kreditTot+=$kredit==''?0:$r2['nominal'];
                  $out.='<tr >
                    <td width="10%">'.tgl_indo5($r2['tanggal']).'</td>
                    <td  width="20%">'.getNoKwitansi($r2['replid']).'</td>
                    <td  width="30%">'.$r2['uraian'].'</td>
                    <td  align="right" width="20%">'.$debit.'</td>
                    <td  align="right" width="20%">'.$kredit.'</td>
                  </tr>';
                }
                $selisihDebit  = ($debitTot-$kreditTot)>=0?setuang($debitTot-$kreditTot):'';
                $selisihKredit = ($debitTot-$kreditTot)<0?setuang(abs($debitTot-$kreditTot)):'';
                $out.='</tbody>
                      <tfoot>
                        <tr class="head">
                          <th colspan="3" align="right">Total</th>
                          <th align="right">'.($debitTot!=0?setuang($debitTot):'').'</th>
                          <th align="right">'.($kreditTot!=0?setuang($kreditTot):'').'</th>
                        </tr>
                        <tr class="head">
                          <th colspan="3" align="right">Grand Total</th>
                          <th align="right">'.$selisihDebit.'</th>
                          <th align="right">'.$selisihKredit.'</th>
                        </tr>
                      </tfoot>
                    </table><br />';
              }
              // $out.='</ul>';
            }
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