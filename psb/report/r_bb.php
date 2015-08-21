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
            $detilrekening = (isset($_GET[$pre.'detilrekeningS']) AND $_GET[$pre.'detilrekeningS']!='')?' AND  d.replid = '.$_GET[$pre.'detilrekeningS']:'';
            $s1 ='SELECT
                      d.replid,
                      d.kode kode,
                      d.nama nama,
                      s.nominal2 saldo
                    FROM
                      keu_transaksi t
                      LEFT JOIN keu_jurnal j ON t.replid = j.transaksi
                      LEFT JOIN keu_detilrekening d ON d.replid = j.rek
                      LEFT JOIN keu_saldorekening s ON s.rekening = d.replid
                    WHERE 
                      t.tahunbuku='.getTahunBuku('replid').'
                      '.$detilrekening.'
                    GROUP BY
                      d.kode
                    ORDER BY
                      d.kategorirekening ASC,
                      d.kode ASC';
            $e1 = mysql_query($s1) or die(mysql_error());
            $n1 = mysql_num_rows($e1);
            // var_dump($detilrekening);exit();
            
            $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Laporan Buku Besar</b>
                        </td>
                        <td align="right">
                          <b>Tahun Buku : '.getTahunBuku('nama').'</b>
                        </td>
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
                      ['.$r1['kode'].'] '.$r1['nama'].' 
                    </td>
                    <td align="right">
                      Rp. '.number_format($r1['saldo']).'
                    </td>
                  </tr>
                </table>';
                // $out.='<li style="list-style:none;">['.$r1['kode'].'] '.$r1['nama'].'</li>';
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
                      d.replid='.$r1['replid'].'
                    ORDER BY
                      d.kategorirekening ASC, 
                      d.kode ASC';
                  // print_r($s2);exit();

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
                  $jenis = getJenisTrans('kode',getDetJenisTrans('jenistrans','replid',$r2['detjenistrans']));
                  if($jenis=='ju'){ // ju
                    $debit=99;
                    $kredit=0;
                  }else{
                    if($jenis=='out'){ // outcome
                      $debit  = $r2['rekkas']==$r2['rek']?0:$r2['nominal'];
                      $kredit = $r2['rekitem']==$r2['rek']?0:$r2['nominal'];
                    }else{ // income
                      $debit  = $r2['rekkas']==$r2['rek']?$r2['nominal']:0;
                      $kredit = $r2['rekitem']==$r2['rek']?$r2['nominal']:0;
                    }
                  }
                  $debitTot+=$debit;
                  $kreditTot+=$kredit;
                  $out.='<tr >
                    <td>'.tgl_indo5($r2['tanggal']).'</td>
                    <td>'.$r2['nomer'].'</td>
                    <td>'.$r2['uraian'].'</td>
                    <td align="right">Rp. '.number_format($debit).'</td>
                    <td align="right">Rp. '.number_format($kredit).'</td>
                  </tr>';
                }$out.='</tbody>
                        <tfoot>
                          <tr class="head">
                            <th align="right" colspan="3">Jumlah</th>
                            <th align="right">Rp. '.number_format($debitTot).'</th>
                            <th align="right">Rp. '.number_format($kreditTot).'</th>
                          </tr>
                          <tr class="head">
                            <th align="right" colspan="3">Selisih</th>
                            <th align="center" colspan="2">Rp. '.number_format($debitTot-$kreditTot).'</th>
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