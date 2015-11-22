<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu   = 'transaksi';
  $pre   = 'pkb_';
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
            <title>SISTER::Keu - Laporan Kas Bank </title>
          </head>';
      $out.='<body>
              <table width="100%">
                <tr>
                  <td width="39%">
                    <img width="100" src="../../images/logo.png" alt="" />
                  </td>
                  <td>
                    <b>Laporan Kas Bank</b>
                  </td>
                </tr>
              </table>'; 
            $pkb_detilrekening = (isset($_GET['pkb_detilrekeningS']) AND $_GET['pkb_detilrekeningS']!='')?' dr.replid = '.$_GET['pkb_detilrekeningS'].' AND ':'';
            $s  = 'SELECT 
                  j.detilrekening replid, 
                  CONCAT(dr.kode," - ",dr.nama)detilrekening,
                  sr.nominal
                FROM keu_jurnal j 
                  JOIN keu_detilrekening dr on dr.replid = j.detilrekening
                  JOIN keu_saldorekening sr on dr.replid = sr.detilrekening
                  JOIN keu_kategorirekening kr  on kr.replid = dr.kategorirekening
                  JOIN keu_transaksi t on t.replid = j.transaksi
                WHERE 
                  (kr.nama LIKE "%KAS%" OR kr.nama LIKE "%BANK%" )  and 
                  t.tanggal BETWEEN "'.tgl_indo6($_GET['tgl1']).'" and "'.tgl_indo6($_GET['tgl2']).'"
                GROUP BY j.detilrekening
                ORDER BY dr.kode asc,dr.nama asc';
                  // pr($sql);
            $e   = mysql_query($s);
            $jum = mysql_num_rows($e);
            $totaset=0;
            if($jum!=0){  
              while($r = mysql_fetch_assoc($e)){
                  $out.=' <div>'.$r['detilrekening'].'</div> ';
                    // tabel penerimaan -------------------------------------
                    $out.='<table width="100%">
                            <tr>
                                <td>Penerimaan : </td>
                                <td align="right"> Saldo Awal : '.setuang($r['nominal']).'</td>
                            </tr>
                          </table>';
                              $out.='<table width="100%" class="isi">
                                      <thead>
                                          <tr class="head">
                                              <th class="center">Tanggal </th>
                                              <th class="center">No. Transaksi</th>
                                              <th class="center">Uraian</th>
                                              <th class="center">Nominal</th>
                                          </tr>
                                      </thead>
                                      <tbody class="fg-black">';
                        $s2='SELECT
                              j.nominal,
                              t.tanggal,
                              t.uraian,
                              t.replid idTransaksi
                            FROM
                              keu_jurnal j
                              JOIN keu_transaksi t ON t.replid = j.transaksi
                            WHERE
                              j.detilrekening = '.$r['replid'].'
                              AND j.jenisrekening ="d" 
                              AND t.tanggal BETWEEN "'.tgl_indo6($_GET['tgl1']).'"
                              AND "'.tgl_indo6($_GET['tgl2']).'"
                            ORDER BY
                              t.tanggal ASC';
                              // pr($s2);
                          $e2       =mysql_query($s2);
                          $masukTot =0;
                          if(mysql_num_rows($e2)<=0){
                            $out.='<tr>
                              <td colspan="4" align="center">data kosong</td>
                            </tr>';
                          }else{
                            while ($r2=mysql_fetch_assoc($e2)) {
                              $masukTot+=$r2['nominal'];
                              $out.='<tr >
                                <td width="10%">'.tgl_indo5($r2['tanggal']).'</td>
                                <td  width="20%">'.getNoKwitansi($r2['idTransaksi']).'</td>
                                <td  width="30%">'.$r2['uraian'].'</td>
                                <td align="right" width="20%">'.setuang($r2['nominal']).'</td>
                              </tr>';
                            }
                          }$out.='</tbody>
                                      <tfoot>
                                        <tr class="info fg-white">
                                          <th colspan="3"  align="right" >Jumlah : </th>
                                          <th  align="right" >'.setuang($masukTot).'</th>
                                        </tr>
                                      </tfoot>
                                  </table>';

                    // tabel pengeluaran -------------------------------------
                    $out.='<div>Pengeluaran :</div>';
                              $out.='<table width="100%" class="isi">
                                      <thead>
                                          <tr class="head">
                                              <th align="center">Tanggal </th>
                                              <th align="center">No. Transaksi</th>
                                              <th align="center">Uraian</th>
                                              <th align="center">Nominal</th>
                                          </tr>
                                      </thead>
                                      <tbody class="fg-black">';
                          $s3='SELECT
                              j.nominal,
                              t.tanggal,
                              t.uraian,
                              t.replid idTransaksi
                            FROM
                              keu_jurnal j
                              JOIN keu_transaksi t ON t.replid = j.transaksi
                            WHERE
                              j.detilrekening = '.$r['replid'].'
                              AND j.jenisrekening ="k" 
                              AND t.tanggal BETWEEN "'.tgl_indo6($_GET['tgl1']).'"
                              AND "'.tgl_indo6($_GET['tgl2']).'"
                            ORDER BY
                              t.tanggal ASC';
                          $e3 =mysql_query($s3);
                          $keluarTot =0;

                          if(mysql_num_rows($e3)<=0){
                            $out.='<tr>
                              <td colspan="4" align="center">data kosong</td>
                            </tr>';
                          }else{
                            while ($r3=mysql_fetch_assoc($e3)) {
                              $keluarTot+=$r3['nominal'];
                              $out.='<tr>
                                <td width="10%">'.tgl_indo5($r3['tanggal']).'</td>
                                <td  width="20%">'.getNoKwitansi($r3['idTransaksi']).'</td>
                                <td  width="30%">'.$r3['uraian'].'</td>
                                <td align="right" width="20%">'.setuang($r3['nominal']).'</td>
                              </tr>';
                            }
                          }$out.='</tbody>
                                      <tfoot>
                                        <tr class="info fg-white">
                                          <th colspan="3" align="right">Jumlah : </th>
                                          <th align="right">'.setuang($keluarTot).'</th>
                                        </tr>
                                      </tfoot>
                                  </table>';
                              $saldoAkhir = $r['nominal']+$masukTot-$keluarTot;
                          $out.='<table width="100%">
                                  <tr>
                                      <td align="right"> Saldo Akhir : '.setuang($saldoAkhir).'</td>
                                  </tr>
                                </table>';
                          $out.='<hr>';
              }
            }else{ #kosong
              $out.= '<tr align="center">
                  <td  colspan=9 ><span style="color:red;text-align:center;">
                  ... data tidak ditemukan...</span></td></tr>';
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
?>