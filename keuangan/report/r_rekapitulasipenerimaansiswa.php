<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/func.php';
  require_once '../../lib/pagination_class.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/mpdf/mpdf.php';

  $x     = $_SESSION['id_loginS'].$_GET['departemenS'].$_GET['tahunajaranS'].$_GET['biayaS'];
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
    
        // Title content
        $out.='<body>
                  <table  width="100%">
                    <tr>
                      <td width="30%">
                        <img width="100" src="../../images/logo.png" alt="" />
                      </td>
                      <td>
                        <b>Rekapitulasi Penerimaan Siswa</b>
                      </td>
                    </tr>
                  </table><br />';
        
        $out.='<table xstyle="background-color:red;" xclass="isi" width="100%">';
        $departemen  = getField('nama','departemen','replid',$_GET['departemenS']);
        $tahunajaran = getField('tahunajaran','aka_tahunajaran','replid',$_GET['tahunajaranS']);
        $biaya       = getField('biaya','psb_biaya','replid',$_GET['biayaS']);

        $out.='<tr>
              <td width="25%">Departemen</td>
              <td>: '.$departemen.'</td>
            </tr><tr>
              <td width="25%">Tahun Ajaran</td>
              <td>: '.$tahunajaran.' - '.($tahunajaran+1).'</td>
            </tr><tr>
              <td width="25%">Biaya</td>
              <td>: '.$biaya.'</td>
            </tr>';

        $s='SELECT 
              vk.idtingkat,
              vk.tingkat,
              IFNULL(tb.biayaTotal,0)biayaTotal,
              IFNULL(tb.biayaTerbayar,0)biayaTerbayar,
              IFNULL(tb.biayaKurang,0)biayaKurang
            FROM  
              vw_kelas vk
              LEFT JOIN (
                SELECT
                  vsk.idtingkat,
                  sum(getBiayaNett(vsb.idsiswabiaya))biayaTotal,  
                  sum(getBiayaTerbayar(vsb.idsiswabiaya))biayaTerbayar,
                  sum((getBiayaNett(vsb.idsiswabiaya)-getBiayaTerbayar(vsb.idsiswabiaya)))biayaKurang
                FROM
                  vw_siswa_biaya vsb 
                  JOIN vw_siswa_kelas vsk on vsk.idsiswa = vsb.idsiswa
                WHERE
                  vsb.idbiaya = '.$_GET['biayaS'].' and
                  vsb.iddepartemen = '.$_GET['departemenS'].' and
                  vsb.idtahunajaran='.$_GET['tahunajaranS'].'
                GROUP BY 
                  vsk.idtingkat
              )tb on tb.idtingkat = vk.idtingkat
            WHERE 
              vk.iddepartemen = '.$_GET['departemenS'].' and 
              vk.idtahunajaran = '.$_GET['tahunajaranS'].'
            GROUP BY
              vk.idtingkat
            ORDER BY
              vk.urutan asc';
              // pr($s);
        $r=fetchField2($s);
        $out.='
        </tr><tr xstyle="background-color:green" >
          <td colspan="3">
            <table style="width:100%;background-color:grey">
              <tr class="head" >
                <td align="center" rowspan="2">Tingkat</td>
                <td align="center" colspan="3">Biaya</td>
              </tr>
              <tr class="head">
                <td align="center">Terbayar</td>
                <td align="center">Kurang</td>
                <td align="center">Total</td>
              </tr>';
              //9.600 - 2.800
              $cc='';
              // vd($r);
              if(empty($r)) $out.='<tr ><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td></tr>';
              else {$no=1;
                foreach ($r as $i => $v) {
                  $tingkat= $v['tingkat'];
                  $biayaTerbayar+=$v['biayaTerbayar'];
                  $biayaKurang+=$v['biayaKurang'];
                  $biayaTotal+=$v['biayaTerbayar']+$v['biayaKurang'];
                  $out.='<tr>
                    <td>'.$no.'. '.($v['tingkat']).'</td>
                    <td align="right">'.setuang($v['biayaTerbayar']).'</td>
                    <td align="right">'.setuang($v['biayaKurang']).'</td>
                    <td align="right">'.setuang($v['biayaKurang']+$v['biayaTerbayar']).'</td>
                  </tr>';$no++;
                }$out.='<tr class="head">
                  <td align="right">biayaTotal:</td>
                  <td  align="right">'.setuang($biayaTerbayar).'</td>
                  <td  align="right">'.setuang($biayaKurang).'</td>
                  <td  align="right">'.setuang($biayaTotal).'</td>
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