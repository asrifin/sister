<?php
  sleep(2);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';

  $x     = $_SESSION['id_loginS'];
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
            <title>SISTER::Keu - Laporan Laba / Rugi</title>
          </head>';
        // table content
            $pendapatanTot=$biayaTot=0;
            $s=' SELECT
                d.kode,
                d.nama,
                j.nominal
              FROM
                keu_transaksi t
                LEFT JOIN keu_jurnal j ON j.transaksi = t.replid
                LEFT JOIN keu_detilrekening d ON d.replid = j.rek
                LEFT JOIN keu_kategorirekening k ON k.replid = d.kategorirekening
              WHERE
                k.nama=';
            $s1 = $s.'"pendapatan"';
            $s2 = $s.'"biaya"';
            $e1  = mysql_query($s1);
            $n1  = mysql_num_rows($e1);
            $e2  = mysql_query($s2);
            $n2  = mysql_num_rows($e2);
            
            $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="38%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Laporan Laba / Rugi</b>
                        </td>
                        <td align="right">
                          <b>Tahun Buku : '.getTahunBuku('nama').'</b>
                        </td>
                      </tr>
                    </table><br />';

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
                $jenis = getJenisTrans('kode',getDetJenisTrans('jenistrans','replid',$r['detjenistrans']));
                $clr   ='';
                if($jenis=='ju'){ // ju
                  $debit=99;
                  $kredit=0;
                }else{
                  if($jenis=='out'){ // outcome
                    $debit  = $r['rekkas']==$r['rek']?0:$r['nominal'];
                    $kredit = $r['rekitem']==$r['rek']?0:$r['nominal'];
                  }else{ // income
                    $debit  = $r['rekkas']==$r['rek']?$r['nominal']:0;
                    $kredit = $r['rekitem']==$r['rek']?$r['nominal']:0;
                  }
                }
                $debitTot+=$debit;
                $kreditTot+=$kredit;                

                $out.= '<tr>
                      <td>'.$r['kode'].'</td>
                      <td>'.$r['nama'].'</td>
                      <td align="right">Rp. '.number_format($debit).'</td>
                      <td align="right">Rp. '.number_format($kredit).'</td>
                    </tr>';
                $nox++;
                $debet+=($r['debet']);
                $kredit+=($r['kredit']);
              }
            }
            $out.= '<tr class="head"><td colspan="2" align="right">Jumlah :</td>
              <td align="right"><b>Rp. '.number_format($debitTot).'</b></td>
              <td align="right"><b>Rp. '.number_format($kreditTot).'</b></td>
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