<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu   = 'transaksi';
  $pre   = 'pkb_';
  $x     = $_SESSION['id_loginS'].$_GET['tgl1TB'].$_GET['tgl2TB'];
  $token = base64_encode($x);
  // echo '<pre>';
  // print_r($_GET);
  // echo '</pre>';
  // exit();

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
            <title>SISTER::Keu - Posisi Kas Bank'.$mnu.'</title>
          </head>';
      $out.='<body>';
      $s  = 'SELECT
                  d.replid,
                  d.kode kode,
                  d.nama nama,
                  s.nominal saldoAwal,
                  s.nominal2 saldoAkhir
                FROM
                  keu_transaksi t
                  LEFT JOIN keu_jurnal j ON t.replid = j.transaksi
                  LEFT JOIN keu_detilrekening d ON d.replid = j.rek
                  LEFT JOIN keu_kategorirekening k ON k.replid = d.kategorirekening
                  LEFT JOIN keu_saldorekening s  ON s.rekening = d.replid
                WHERE 
                  t.tahunbuku='.getTahunBuku('replid').' AND(
                    k.nama ="KAS" OR 
                    k.nama ="BANK"
                  ) AND  t.tanggal between "'.tgl_indo6($_GET['tgl1TB']).'" AND "'.tgl_indo6($_GET['tgl2TB']).'" 
                GROUP BY
                  d.kode
                ORDER BY
                  d.kategorirekening ASC,
                  d.kode ASC';
            // var_dump($s);exit();
            $e   = mysql_query($s);
            $jum = mysql_num_rows($e);
            $out ='';$totaset=0;
            if($jum!=0){  
              while($r = mysql_fetch_assoc($e)){
                // $out.='<ul class="fg-gray" style="list-style:none;">';
                  // $out.=' <span>['.$r['kode'].'] '.$r['nama'].'</span> 
                  //     <b class="place-right fg-'.($r['saldoAwal']<0?'red':($r['saldoAwal']==0?'blue':'green')).'">
                  //       Saldo Awal : Rp.'.number_format($r['saldoAwal']).'
                  //     </b>';
                    
                  $out.='<table width="100%">
                    <tr>
                      <td align="left">
                        ['.$r['kode'].'] '.$r['nama'].' 
                      </td>
                      <td align="right">
                        Saldo Awal : Rp. '.number_format($r['saldoAwal']).'
                      </td>
                    </tr>
                  </table>';
                    // tabel penerimaan -------------------------------------
                    $out.='<div>Penerimaan :</div>';
                    $out.='<table width="100%" class="table hovered bordered striped">
                                      <thead>
                                          <tr style="color:white;"class="info">
                                              <th class="text-center">Tanggal </th>
                                              <th class="text-center">No. Transaksi</th>
                                              <th class="text-center">Uraian</th>
                                              <th class="text-center">Nominal</th>
                                          </tr>
                                      </thead>
                                      <tbody class="fg-black">';
                                      $s2='SELECT 
                              t.replid,
                              t.tanggal,
                              t.nomer,
                              t.uraian,
                                  d.nama,
                                  j.nominal,
                                  j.rek,
                                  t.rekkas,
                                  t.rekitem,
                                  t.detjenistrans
                              FROM
                              keu_transaksi t 
                                  LEFT JOIN keu_jurnal j ON t.replid = j.transaksi 
                                  LEFT JOIN keu_detilrekening d ON d.replid = j.rek
                              WHERE 
                                d.replid='.$r['replid'].' AND 
                                j.jenis = "d"
                              ORDER BY
                                  d.kategorirekening ASC, 
                              d.kode ASC';
                          $e2       =mysql_query($s2);
                          $debitTot =0;
                          if(mysql_num_rows($e2)<=0){
                            $out.='<tr>
                              <td colspan="4" class="fg-red text-center">data kosong</td>
                            </tr>';
                          }else{
                            while ($r2=mysql_fetch_assoc($e2)) {
                              $debitTot+=$r2['nominal'];
                              $out.='<tr >
                                <td width="10%">'.tgl_indo5($r2['tanggal']).'</td>
                                <td  width="20%">'.$r2['nomer'].'</td>
                                <td  width="30%">'.$r2['uraian'].'</td>
                                <td style="font-weight:bold;" class="text-right fg-green" width="20%">Rp. '.number_format($r2['nominal']).'</td>
                              </tr>';
                            }
                          }$out.='</tbody>
                                      <tfoot>
                                        <tr class="info fg-white">
                                          <th colspan="3" class="text-right">Jumlah : </th>
                                          <th class="text-right">Rp. '.number_format($debitTot).'</th>
                                        </tr>
                                      </tfoot>
                                  </table>';

                    // tabel pengeluaran -------------------------------------
                    $out.='<div>Pengeluaran :</div>';
                    $out.='<table width="100%" class="table hovered bordered striped">
                                      <thead>
                                          <tr style="color:white;"class="info">
                                              <th class="text-center">Tanggal </th>
                                              <th class="text-center">No. Transaksi</th>
                                              <th class="text-center">Uraian</th>
                                              <th class="text-center">Nominal</th>
                                          </tr>
                                      </thead>
                                      <tbody class="fg-black">';
                                      $s3='SELECT 
                              t.replid,
                              t.tanggal,
                              t.nomer,
                              t.uraian,
                                  d.nama,
                                  j.nominal,
                                  j.rek,
                                  t.rekkas,
                                  t.rekitem,
                                  t.detjenistrans
                              FROM
                              keu_transaksi t 
                                  LEFT JOIN keu_jurnal j ON t.replid = j.transaksi 
                                  LEFT JOIN keu_detilrekening d ON d.replid = j.rek
                              WHERE 
                                d.replid='.$r['replid'].' AND 
                                j.jenis = "k"
                              ORDER BY
                                  d.kategorirekening ASC, 
                              d.kode ASC';
                          $e3 =mysql_query($s3);
                          $kreditTot =0;

                          if(mysql_num_rows($e3)<=0){
                            $out.='<tr>
                              <td colspan="4" class="fg-red text-center">data kosong</td>
                            </tr>';
                          }else{
                            while ($r3=mysql_fetch_assoc($e3)) {
                              $kreditTot+=$r3['nominal'];
                              $out.='<tr >
                                <td width="10%">'.tgl_indo5($r3['tanggal']).'</td>
                                <td  width="20%">'.$r3['nomer'].'</td>
                                <td  width="30%">'.$r3['uraian'].'</td>
                                <td  style="font-weight:bold;"  class="text-right fg-red" width="20%">Rp. '.number_format($r3['nominal']).'</td>
                              </tr>';
                            }
                          }$out.='</tbody>
                                      <tfoot>
                                        <tr class="info fg-white">
                                          <th colspan="3" class="text-right">Jumlah : </th>
                                          <th class="text-right">Rp. '.number_format($kreditTot).'</th>
                                        </tr>
                                      </tfoot>
                                  </table>';
                              $out.='<b class="place-right"> Saldo Akhir : Rp. '.number_format($r['saldoAkhir']).'</b><br><br>';
                              $out.='<hr>';
              }
            }
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