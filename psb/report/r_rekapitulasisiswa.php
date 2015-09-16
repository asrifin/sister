<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/func.php';
  require_once '../../lib/pagination_class.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/mpdf/mpdf.php';

  $mod   ='PSB';
  $x     = $_SESSION['id_loginS'].$_GET['departemenS'].$_GET['tahunajaranS'];
  $token = base64_encode($x);

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
          <title>SISTER::'.$mod.' - '.$mnu.'</title>
        </head>';
        $replid = (isset($_GET['replid']) AND $_GET['replid']!='')?filter($_GET['replid']):'';
    
        // Title content
        $out.='<body>
                  <table  width="100%">
                    <tr>
                      <td width="30%">
                        <img width="100" src="../../images/logo.png" alt="" />
                      </td>
                      <td>
                        <b>Rekapitulasi Pendaftaran Siswa Baru</b>
                      </td>
                    </tr>
                  </table><br />';
        
        $out.='<table xstyle="background-color:red;" xclass="isi" width="100%">';
        $departemen  = getField('nama','departemen','replid',$_GET['departemenS']);
        $tahunajaran = getField('tahunajaran','aka_tahunajaran','replid',$_GET['tahunajaranS']);

        $out.='<tr>
              <td width="25%">Departemen</td>
              <td>: '.$departemen.'</td>
            </tr><tr>
              <td width="25%">Tahun Ajaran</td>
              <td>: '.$tahunajaran.' - '.($tahunajaran+1).'</td>
            </tr>';

        $s='SELECT 
              t.replid,
              t.tingkat,
              ifnull(tb.belum,0)belum,
              ifnull(tb.sudah,0)sudah
            from 
              aka_tingkat t 
              LEFT JOIN (
                SELECT 
                  sum(tb2.status="0")belum,
                  sum(tb2.status="1")sudah,
                  tb2.tingkat
                FROM (
                  SELECT
                    siswa.replid,
                    siswa.status,
                    tingkat.replid tingkat
                  FROM
                    psb_siswa siswa
                    JOIN psb_siswabiaya siswabiaya on siswabiaya.siswa = siswa.replid
                    JOIN psb_detailbiaya detailbiaya on detailbiaya.replid = siswabiaya.detailbiaya
                    JOIN psb_biaya biaya on biaya.replid = detailbiaya.biaya
                    JOIN aka_subtingkat subtingkat on subtingkat.replid = detailbiaya.subtingkat
                    JOIN aka_tingkat tingkat on tingkat.replid = subtingkat.tingkat
                    JOIN psb_detailgelombang detailgelombang on detailgelombang.replid = detailbiaya.detailgelombang
                    JOIN psb_gelombang gelombang on gelombang.replid = detailgelombang.gelombang
                    JOIN aka_tahunajaran tahunajaran on tahunajaran.replid = detailgelombang.tahunajaran
                    JOIN psb_golongan golongan on golongan.replid = detailbiaya.golongan
                    JOIN departemen departemen  on departemen.replid = detailgelombang.departemen 
                  Where 
                    siswa.status != "2" and detailgelombang.tahunajaran = '.$_GET['tahunajaranS'].' and departemen.replid='.$_GET['departemenS'].'
                  GROUP BY
                    siswa.replid
                )tb2 
                GROUP BY tb2.tingkat
              )tb on tb.tingkat = t.replid
            ORDER BY t.urutan ASC';
        $r=fetchField2($s);
        // <tr xclass="head"><td colspan="3">Biaya Siswa</td>
        $out.='
        </tr><tr xstyle="background-color:green" >
          <td colspan="3">
            <table style="width:100%;background-color:grey">
              <tr class="head" >
                <td align="center" rowspan="2">Tingkat</td>
                <td align="center" colspan="3">Jumlah Siswa</td>
              </tr>
              <tr class="head">
                <td align="center">Diterima</td>
                <td align="center">Belum Diterima</td>
                <td align="center">Total</td>
              </tr>';
              //9.600 - 2.800
              $cc='';
              // vd($r);
              if(empty($r)) $out.='<tr ><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td></tr>';
              else {$no=1;
                foreach ($r as $i => $v) {
                  $tingkat= $v['tingkat'];
                  $belum+=$v['belum'];
                  $sudah+=$v['sudah'];
                  $total+=$v['belum']+$v['sudah'];
                  $out.='<tr>
                    <td>'.$no.'. '.($v['tingkat']).'</td>
                    <td align="center">'.($v['sudah']).'</td>
                    <td align="center">'.($v['belum']).'</td>
                    <td align="center">'.($v['sudah']+$v['belum']).'</td>
                  </tr>';$no++;
                }$out.='<tr class="head">
                  <td align="right">Total:</td>
                  <td  align="center">'.$sudah.'</td>
                  <td  align="center">'.$belum.'</td>
                  <td  align="center">'.$total.'</td>
                </tr>';
              }
              // pr($cc);
            $out.='</table>
          </td>
        </tr>
        <tr><td colspan="3">&nbsp;</td></tr>';

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
}
  }
?>