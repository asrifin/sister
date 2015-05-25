<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu = 'transaksi';
  $pre = 'ju_';

  // echo '<pre>';
  // print_r($_GET);
  // echo '</pre>';
  // exit();
  $jenis==$jenis2='';
  foreach ($_GET['detjenisTB'] as $i => $v) {
    $jenis.=$v;
    $jenis2.=','.$i;
  }$jenis2=substr($jenis2,1);

  $x     = $_SESSION['id_loginS'].$_GET[$pre.'noS'].$_GET[$pre.'uraianS'].$_GET['jenisAllCB'].$jenis.$_GET['tgl1TB'].$_GET['tgl2TB'];
  $token = base64_encode($x);
  // var_dump($jenis2); 
  echo "<br />";
  // var_dump($x); echo "<br />";
  // var_dump($token); echo "<br />";
  // var_dump($_GET['token']);

  // if(!isset($_SESSION)){ // belum login  
  //   echo 'user has been logout';
  // }else{ // sudah login 
  //   if(!isset($_GET['token']) OR $token!==$_GET['token']){ //token salah 
  //     echo 'Token URL tidak sesuai';
  //   }else{ //token benar
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>SISTER::Keu - Jurnal Umum '.$mnu.'</title>
          </head>';
          $ju_no     = isset($_GET['ju_noS'])?filter($_GET['ju_noS']):'';
          $ju_uraian = isset($_GET['ju_uraianS'])?filter($_GET['ju_uraianS']):'';
          $s1 = 'SELECT *  
                FROM  keu_transaksi  
                WHERE 
                  detjenistrans IN ('.$jenis2.') AND 
                  (nomer like "%'.$ju_no.'%" OR nobukti like "%'.$ju_no.'%" ) AND
                  uraian like "%'.$ju_uraian.'%"  AND 
                  tanggal between "'.tgl_indo6($_GET['tgl1TB']).'" AND "'.tgl_indo6($_GET['tgl2TB']).'" 
                ORDER BY  
                  replid DESC';
          $e1 = mysql_query($s1);
          $n1 = mysql_num_rows($e1);
          // var_dump($e1);exit();
          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="40 %">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Jurnal Umum</b>
                        </td>
                      </tr>
                    </table><br />';
          $out.='<table width=100%"">
                  <tr>
                    <td>Tanggal : '.$_GET['tgl1TB'].' s/d '.$_GET['tgl2TB'].'</td>
                    <td align="right">Tahun Buku :</td>
                    <td width="5%" align="right">'.getTahunBuku('nama').'</td>
                  </tr>';
          $out.='</table>';
          $out.='<table class="isi" width="100%">
                    <tr class="head">
                        <td align="center">Tanggal </td>
                        <td align="center">No. Jurnal/Jenis Bukti/No.Bukti</td>
                        <td align="center">Uraian</td>
                        <td align="center">Detil Jurnal</td>
                    </tr>';
            $nox = 1;
            $totbayar = 0;
            if($n1==0){
              $out.='<tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
              </tr>';
            }else{
              while ($r1=mysql_fetch_assoc($e1)) {
                $jDetTrans = getDetJenisTrans('jenistrans','replid',$r1['detjenistrans']);
                $jTrans    = getJenisTrans('kode',$jDetTrans);
                if($jTrans=='ju'){
                  $j='ju';
                }else{
                  $j=$jTrans.'_come';
                }
                $s2 = ' SELECT replid,rek,nominal,jenis
                    FROM keu_jurnal 
                    WHERE 
                      transaksi ='.$r1['replid'].'
                    ORDER BY 
                      jenis ASC';
                $e2  = mysql_query($s2);
            // var_dump($s2);exit();  
                $tb2 ='';
                if(mysql_num_rows($e2)!=0){
                    $tb2.='<table class="isi" width="100%">
                            <tr class="head">
                              <td width="60%">Rekening</td>
                              <td width="20%">Debit</td>
                              <td width="20%">Kredit</td>
                            </tr>';
                    while($r2=mysql_fetch_assoc($e2)){
                      if($jTrans=='ju'){
                        $debit=($r2['jenis']=='d'?$r2['nominal']:0);
                        $kredit=($r2['jenis']=='k'?$r2['nominal']:0);
                      }else{
                        if($jTrans=='out'){
                          $debit=$r2['rek']==$r1['rekitem']?$r1['nominal']:0;
                          $kredit=$r2['rek']==$r1['rekkas']?$r1['nominal']:0;
                        }else{ // in
                          $debit=$r2['rek']==$r1['rekkas']?$r1['nominal']:0;
                          $kredit=$r2['rek']==$r1['rekitem']?$r1['nominal']:0;
                        }
                      }
                      $tb2.='<tr>
                              <td width="60%" >'.getRekening($r2['rek']).'</td>
                              <td width="20%" align="right" >Rp. '.number_format($debit).',-</td>
                              <td width="20%" align="right" >Rp. '.number_format($kredit).',-</td>
                            </tr>';
                    }$tb2.='</table>';
                }$out.= '<tr>
                      <td>'.tgl_indo($r1['tanggal']).'</td>
                      <td>'.$r1['nomer'].'<br>'.getDetJenisTrans2($r1['replid']).'<br>'.$r1['nobukti'].'</td>
                      <td>'.$r1['uraian'].'</td>
                      <td>'.$tb2.'</td>
                    </tr>';
              }
            }
            $out.='</table>';
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
  //   }
  // }
  // ---------------------- //
  // -- created by epiii -- //
  // ---------------------- // 

?>