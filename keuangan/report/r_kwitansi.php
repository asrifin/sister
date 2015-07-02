<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $countx= isset($_GET['countx'])?filter($_GET['countx']):'';
  $x     = $_SESSION['id_loginS'].$_GET['detjenistransH'].$_GET['nomerH'].$countx;
  $token = base64_encode($x);

  // var_dump($x);exit();
  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) OR  $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>SISTER::Keu - Kwitansi Transaksi '.$mnu.'</title>
          </head>';
      $nomer    = isset($_GET['nomerH'])?filter($_GET['nomerH']):'';
      // grouping 
      $depan    = substr($nomer,0,3);
      $tengah   = substr($nomer,5,3);
      $belakang = substr($nomer,8,8);
      // u/ looping nomer transaksi --> query
      $start    = intval($tengah);
      $end      = intval($countx)+$start;
      // var_dump($end);exit();
      
      $out.='<body>';
      if($_GET['detjenistransH']=='ju'){
        $s1 = 'SELECT * FROM keu_transaksi WHERE nomer = "'.$nomer.'"';
        // var_dump($s1);exit();
        $e1 = mysql_query($s1) or die(mysql_error());
        $r1=mysql_fetch_assoc($e1);
        $out.='<table width="100%">
                  <tr>
                    <td width="34%">
                      <img width="100" src="../../images/logo.png" alt="" />
                    </td>
                    <td>
                      <b>Kwitansi Transaksi Jurnal Umum</b>
                    </td>
                  </tr>
                </table><br />';
          // start of header
          $out.='<table width="100%">
                    <tr>
                      <td width="20%" >Kode Transaksi </td>
                      <td>: '.$r1['nomer'].'</td>
                    </tr>
                    <tr>
                      <td>No. Bukti</td>
                      <td>: '.$r1['nobukti'].'</td>
                    </tr>
                    <tr>
                      <td>Tanggal</td>
                      <td>: '.tgl_indo8($r1['tanggal']).'</td>
                    </tr>
                    <tr>
                      <td>Uraian</td>
                      <td>: '.$r1['uraian'].'</td>
                    </tr>';
          $out.='</table>';
          $s2 = ' SELECT replid,rek,nominal,jenis
                  FROM keu_jurnal 
                  WHERE 
                    transaksi ='.$r1['replid'].'
                  ORDER BY 
                    jenis ASC';
          $e2 = mysql_query($s2);
          $out.='<table class="isi" width="100%">
                <tr class="head">
                  <td align="center">Rekening</td>
                  <td align="center">Debit</td>
                  <td align="center">Kredit</td>
                </tr>';
          while ($r2 = mysql_fetch_assoc($e2)){
            $debit  =($r2['jenis']=='d'?$r2['nominal']:0);
            $kredit =($r2['jenis']=='k'?$r2['nominal']:0);
            $out.='<tr>
              <td>'.getRekening($r2['rek']).'</td>
              <td>Rp. '.number_format($debit).'</td>
              <td>Rp. '.number_format($kredit).'</td>
            </tr>';
          }$out.='</table>';

      }else{
        $nomerArr ='';
        for ($i =$start; $i<=$end ; $i++) { 
          $nomerArr.=',"'.$depan.'-'.sprintf('%04d',$i).$belakang.'"';      
        }$nomerArr=substr($nomerArr,1);
        
        $s1 = 'SELECT * FROM keu_transaksi WHERE nomer IN ('.$nomerArr.')';
        $e1 = mysql_query($s1) or die(mysql_error());
        while($r1 = mysql_fetch_assoc($e1)){
          $jenisTrans  =getJenisTrans('nama',getDetJenisTrans('jenistrans','replid',$r1['detjenistrans']));
          $jenisTrans2 =getJenisTrans('kode',getDetJenisTrans('jenistrans','replid',$r1['detjenistrans']));
          $out.='<table width="100%">
                  <tr>
                    <td width="36%">
                      <img width="100" src="../../images/logo.png" alt="" />
                    </td>
                    <td>
                      <b>Kwitansi Transaksi '.$jenisTrans.'</b>
                    </td>
                  </tr>
                </table><br />';
          // start of header
          $out.='<table width="100%">
                    <tr>
                      <td width="20%" >Kode Transaksi </td>
                      <td>: '.$r1['nomer'].'</td>
                    </tr>
                    <tr>
                      <td>No. Bukti</td>
                      <td>: '.$r1['nobukti'].'</td>
                    </tr>
                    <tr>
                      <td>Tanggal</td>
                      <td>: '.tgl_indo8($r1['tanggal']).'</td>
                    </tr>
                    <tr>
                      <td>Uraian</td>
                      <td>: '.$r1['uraian'].'</td>
                    </tr>';
            if($jenisTrans=='pengeluaran'){
              $out.='<tr>
                      <td>Detail Anggaran</td>
                      <td>: '.getAnggaran($r1['detilanggaran']).'</td>
                    </tr>';
            }$out.='</table>';
            // end of header

            // start of detail table
            $out.='<table class="isi" width="100%">
                    <tr class="head">
                      <td align="center">Rekening</td>
                      <td align="center">Debit</td>
                      <td align="center">Kredit</td>
                    </tr>';
            $totbayar =0;

            if($jenisTrans2!='ju'){
              if($jenisTrans2=='out'){
                $debit1  =0;
                $kredit1 =$r1['nominal'];
                $debit2  =$r1['nominal'];
                $kredit2 =0;
              }else{ // in
                $debit1  =$r1['nominal'];
                $kredit1 =0;
                $debit2  =0;
                $kredit2 =$r1['nominal'];
              }
            }$out.='<tr>
                      <td>'.getRekening($r1['rekkas']).'</td>
                      <td align="right">Rp. '.number_format($debit1).'</td>
                      <td align="right">Rp. '.number_format($kredit1).'</td>
                </tr><tr>
                      <td>'.getRekening($r1['rekitem']).'</td>
                      <td align="right">Rp. '.number_format($debit2).'</td>
                      <td align="right">Rp. '.number_format($kredit2).'</td>
                </tr>';
            $out.='<tr class="head">
              <td ></td>
              <td colspan="2" align="center">Rp. '.number_format($r1['nominal']).'</td>
            </tr>';
            $out.='</table><br>';
          }// end of detail table
        }$out.='</body>';
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