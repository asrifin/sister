<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';

  $x     = $_SESSION['id_loginS'].$_GET['a_departemenS'].$_GET['a_tahunajaranS'].$_GET['a_tingkatS'].$_GET['a_namaS'].$_GET['a_rekeningS'].$_GET['a_keteranganS'];
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) OR  $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      sleep(1);
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml">
              <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>SISTER::Keu - Rencana Anggaran</title>
              </head>';
                $departemen  = (isset($_GET['a_departemenS']) && $_GET['a_departemenS']!='')?' ta.departemen='.$_GET['a_departemenS'].' AND ':'';
                $tahunajaran = (isset($_GET['a_tahunajaranS']) && $_GET['a_tahunajaranS']!='')?' t.tahunajaran='.$_GET['a_tahunajaranS'].' AND ':'';
                $tingkat     = (isset($_GET['a_tingkatS']) && $_GET['a_tingkatS']!='')?' k.tingkat='.$_GET['a_tingkatS'].' AND ':'';
                $nama        = isset($_GET['a_namaS'])?filter($_GET['a_namaS']):'';
                $rekening    = isset($_GET['a_rekeningS'])?filter($_GET['a_rekeningS']):'';
                $keterangan  = isset($_GET['a_keteranganS'])?filter($_GET['a_keteranganS']):'';

                // SUM(n.nominal)nominal,
                $s ='SELECT
                      ta.departemen,
                      t.tahunajaran,
                      k.tingkat,
                      k.replid,
                      k.nama,
                      k.keterangan,
                      r.kode,
                      round((IF (count(*) = 1, 0, count(*) / 12)),0) jmlItem
                    FROM
                      keu_kategorianggaran k
                      LEFT JOIN aka_tingkat t ON t.replid = k.tingkat
                      LEFT JOIN aka_tahunajaran ta ON ta.replid = t.tahunajaran
                      LEFT JOIN keu_detilrekening r ON r.replid = k.rekening
                      LEFT JOIN keu_detilanggaran d ON d.kategorianggaran = k.replid
                      LEFT JOIN keu_nominalanggaran n ON n.detilanggaran = d.replid
                    WHERE
                      '.$departemen.$tahunajaran.$tingkat.'
                      k.nama LIKE "%'.$nama.'%"
                      AND (
                        r.nama LIKE "%'.$rekening.'%"
                        OR r.kode LIKE "%'.$rekening.'%"
                      )AND k.keterangan LIKE "%'.$keterangan.'%"
                    GROUP BY
                      k.replid
                    ORDER BY
                      k.replid ASC';
                // print_r($s);exit();
                $e = mysql_query($s) or die(mysql_error());
                $n = mysql_num_rows($e);
                
                $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="41%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Rencana Anggaran</b>
                        </td>
                      </tr>
                </table><br />

                <table width="100%">
                  <tr>
                    <td width="15%">Departemen</td>
                    <td>: '.($departemen!=''?getDepartemen('nama',$_GET['a_departemenS']):'Semua').'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td width="15%">Tahun Ajaran </td>
                    <td>: '.($tahunajaran!=''?getTahunAjaran('tahunajaran',$_GET['a_tahunajaranS']):'Semua').'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td width="15%">Tingkat </td>
                    <td>: '.($tingkat!=''?getTingkat('tingkat',$_GET['a_tingkatS']):'Semua').'</td>
                    <td align="right"> Total : '.$n.' Kategori Anggaran</td>
                  </tr>
                </table>';

                $out.='<table class="isi" width="100%">';
                $out.='<tr class="head">
                  <td align="center">Kode</td>
                  <td align="center">Pengeluaran</td>
                  <td align="center">Jul</td>
                  <td align="center">Aug</td>
                  <td align="center">Sep</td>
                  <td align="center">Oct</td>
                  <td align="center">Nov</td>
                  <td align="center">Dec</td>
                  <td align="center">Jan</td>
                  <td align="center">Feb</td>
                  <td align="center">Mar</td>
                  <td align="center">Apr</td>
                  <td align="center">May</td>
                  <td align="center">Jun</td>
                </tr>';
                if($n==0){
                  $out.='<tr>
                    <td colspan="14" align="center">... Kategori Anggaran Kosong ....</td>
                  </tr>';
                }else{
                  $curKat = '';
                  $nox = 1;
                  while ($r=mysql_fetch_array($e)) {
                    $out.='<tr style="background-color:white;"><td rowspan="'.($r['jmlItem']+1).'">'.$r['kode'].'</td>';
                    if($curKat!=$r['replid']){
                      $out.='<td style="background-color:rgb(205,205,205);">'.$r['nama'];
                        $out.=($departemen==''?'<br />- '.getDepartemen('nama',$r['departemen']):'');
                        $out.=($tahunajaran==''?'<br />- '.getTahunAjaran('tahunajaran',$r['tahunajaran']):'');
                        $out.=($tingkat==''?'<br />- '.getTingkat('tingkat',$r['tingkat']):'');
                      $out.='</td>';
                      $out.='<td colspan="13"></td>';
                    }

                    $s2= 'SELECT 
                          d.replid,
                          d.nama,
                          d.keterangan,
                          d.hargasatuan,
                          k.nama kategorianggaran
                        FROM keu_detilanggaran d
                          LEFT JOIN keu_kategorianggaran k on k.replid = d.kategorianggaran
                        WHERE 
                          d.kategorianggaran = '.$r['replid'].'
                        GROUP BY  
                          d.replid
                        ORDER BY  
                          d.nama ASC';
                          // print_r($s2);exit();
                    $e2=mysql_query($s2);
                    // if($nox==($r['jmlItem'])){
                    // if($nox==2){
                    //   $out.='<tr><td colspan="13">masuk</td></tr>';
                    // }else{
                      while ($r2=mysql_fetch_assoc($e2)) {
                        $out.='<tr style="background-color:white;">
                                <td>'.$r2['nama'].'</td>';
                        $s3 = 'SELECT * from keu_nominalanggaran WHERE detilanggaran ='.$r2['replid'];
                        $e3 = mysql_query($s3);
                          while ($r3=mysql_fetch_assoc($e3)) {
                            $out.='<td align="right">Rp. '.number_format($r2['hargasatuan']*$r3['jml']).'</td>';
                        }
                        $out.='</tr>';
                      }
                    // }

                    // var_dump($r['jmlItem']);exit();
                    // var_dump($nox);exit();
                    $nox++;
                    $out.='</tr>';
                    // var_dump($nox);exit();
                    $curKat=$r['replid'];
                  }
                }
            $out.='</table>';
          echo $out;
  
        #generate html -> PDF ------------
          $out2 = ob_get_contents();
          ob_end_clean(); 
          $mpdf=new mPDF('c','A4-L','');   
          $mpdf->SetDisplayMode('fullpage');   
          $stylesheet = file_get_contents('../../lib/mpdf/r_cetak.css');
          $mpdf->WriteHTML($stylesheet,1);  // The parameter 1 tells that this is css/style only and no body/html/text
          $mpdf->WriteHTML($out);
          $mpdf->Output();
    }
}
?>