<?php
  sleep(2);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  // $mnu = 'pendaftaran';

  $x     = $_SESSION['id_loginS'].$_GET['ns_kodeS'].$_GET['ns_namaS'];
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
            <title>SISTER::Keu - Neraca Saldo</title>
          </head>';
        // table content
           
            $kode = isset($_GET['ns_kodeS'])?$_GET['ns_kodeS']:'';
            $nama = isset($_GET['ns_namaS'])?filter($_GET['ns_namaS']):'';
                  // -- CONCAT(dr.kode," - ",dr.nama)detilrekening,
            $s = '  SELECT 
                  j.detilrekening replid, 
                  dr.kode,
                  dr.nama,
                  getSaldoRekeningByTgl(j.detilrekening,"2015-11-01","2016-11-01")saldoRekening
                FROM keu_jurnal j 
                  JOIN keu_detilrekening dr on dr.replid = j.detilrekening
                  JOIN keu_transaksi t on t.replid = j.transaksi
                WHERE 
                  t.tanggal BETWEEN "'.tgl_indo6($_GET['tgl1']).'" and "'.tgl_indo6($_GET['tgl2']).'"
                GROUP BY j.detilrekening
                ORDER BY dr.kode asc,dr.nama asc';
            $e = mysql_query($s) or die(mysql_error());
            $n = mysql_num_rows($e);

          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Laporan Neraca Saldo</b>
                        </td>
                      </tr>
                    </table>';
          $out.='<b align="right">Tgl : '.$_GET['tgl1'].' s/d '.$_GET['tgl2'].'</b>';
          // table
          $out.='<table class="isi" width="100%">
                  <tr class="head">
                            <td align="center">Kode Rekening </td>
                            <td align="center">Nama Rekening</td>
                            <td align="center">Debet</td>
                            <td align="center">Kredit</td>
                  </tr>';
            $nox = 1;
            $debetTot = $kreditTot = 0;
            if($n==0){
              $out.='<tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
              </tr>';
            }else{
              while ($r=mysql_fetch_assoc($e)) {
                $debitTot+=($r['saldoRekening']<0?0:$r['saldoRekening']);
                $kreditTot+=($r['saldoRekening']>0?0:abs($r['saldoRekening']));
                $out.= '<tr>
                      <td align="center">'.$r['kode'].'</td>
                      <td>'.$r['nama'].'</td>
                      <td align="right">'.($r['saldoRekening']<0?'':setuang($r['saldoRekening'])).'</td>
                      <td align="right">'.($r['saldoRekening']>0?'':setuang(abs($r['saldoRekening']))).'</td>
                    </tr>';
              }
            }
            $out.= '<tr class="head"><td colspan="2" align="right">Jumlah :</td>
              <td align="right"><b>'.setuang($debitTot).'</b></td>
              <td align="right"><b>'.setuang($kreditTot).'</b></td>
            </tr>';
            $out.='</table>';
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