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
  
      $out.='<body>
          <table width="100%">
            <tr>
              <td width="39%">
                <img width="100" src="../../images/logo.png" alt="" />
              </td>
              <td>
                <b>Laporan Laba Rugi</b>
              </td>
            </tr>
          </table>';
          $out.='<b align="right">Tgl : '.$_GET['tgl1'].' s/d '.$_GET['tgl2'].'</b>';
        // table content
            $s1='SELECT
                kr.replid,  
                kr.nama kategorirekening,
                sj.posisi
              FROM
                keu_jenisreport jr
                JOIN keu_subjenisreport sj on sj.jenisreport = jr.replid
                JOIN keu_kategorirekening kr on kr.replid = sj.kategorirekening
              WHERE
                jr.jenisreport = "labarugi" 
              ORDER BY 
                sj.posisi asc';
                // pr($s1);
            $e1 = mysql_query($s1);
            $n1 = mysql_num_rows($e1);
            
            $out.='<table width="100%" class="isi">
                            <thead>
                                <tr class="head">
                                    <th width="50%" class="text-left">Rekening</th>
                                    <th width="25%" class="text-right">Nominal</th>
                                    <th  width="25%" class="text-right">Sub Total</th>
                                </tr>
                            </thead>';
                      $out.='<tbody>';
                      $grandTot=0;
                    while ($r1=mysql_fetch_assoc($e1)) {
                    $out.='<tr class="head">
                        <td colspan="3">'.$r1['kategorirekening'].'</td>
                    </tr>';
                  $s2='SELECT
                    dr.replid,
                    CONCAT(dr.kode," - ",dr.nama)detilrekening,
                    sum(j.nominal)nominal
                  FROM
                    keu_jurnal j 
                    JOIN keu_transaksi t on t.replid = j.transaksi
                    JOIN keu_detilrekening dr on dr.replid = j.detilrekening
                  WHERE
                    dr.kategorirekening ='.$r1['replid'].' and 
                    t.tanggal BETWEEN "'.tgl_indo6($_GET['tgl1']).'" and "'.tgl_indo6($_GET['tgl2']).'"
                  GROUP BY dr.replid';
                  // pr($s2);
                  $e2=mysql_query($s2);
                  $subtot=0;
                  while ($r2=mysql_fetch_assoc($e2)) {
                    $out.='<tr>
                      <td>'.$r2['detilrekening'].'</td>
                      <td  align="right">'.setuang($r2['nominal']).'</td>
                      <td></td>
                    </tr>';
                    $subtot+=$r2['nominal'];
                      $grandTot=$r1['posisi']=='r'?($grandTot-$r2['nominal']):($grandTot+$r2['nominal']);
                  }
                $out.='<tr>
                  <td colspan="2"></td>
                  <td style="background-color:lightGrey;" align="right">'.setuang($subtot).'</td>
                </tr>';
                    $out.='</tr>';
                    }
                          $out.='</tbody>
                          <tfoot>
                            <tr>
                              <th colspan="2" align="right" >'.($grandTot<0?' Rugi':'Laba').'</th>
                              <th align="right">'.setuang($grandTot).'</th>
                            </tr>
                          </tfoot>';
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
?>