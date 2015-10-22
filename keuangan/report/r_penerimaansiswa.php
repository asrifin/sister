<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/func.php';
  require_once '../../lib/pagination_class.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/mpdf/mpdf.php';

  // pr($_GET);
  $mod   ='PSB';
  $x     = $_SESSION['id_loginS'].$_GET['departemenS'].$_GET['tahunajaranS'].$_GET['tingkatS'].$_GET['subtingkatS'].$_GET['biayaS'].$_GET['nopendaftaranS'].$_GET['nisnS'].$_GET['nisS'];
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
        $departemen    = (isset($_GET['departemenS']) AND $_GET['departemenS']!='')?filter($_GET['departemenS']):'';
        $tahunajaran   = (isset($_GET['tahunajaranS']) AND $_GET['tahunajaranS']!='')?filter($_GET['tahunajaranS']):'';
        $tingkat       = (isset($_GET['tingkatS']) AND $_GET['tingkatS']!='')?filter($_GET['tingkatS']):'';
        $subtingkat    = (isset($_GET['subtingkatS']) AND $_GET['subtingkatS']!='')?filter($_GET['subtingkatS']):'';
        $biaya         = (isset($_GET['biayaS']) AND $_GET['biayaS']!='')?filter($_GET['biayaS']):'';
        $nopendaftaran = (isset($_GET['nopendaftaranS']) AND $_GET['nopendaftaranS']!='')?filter($_GET['nopendaftaranS']):'';
        $nisn          = (isset($_GET['nisnS']) AND $_GET['nisnS']!='')?filter($_GET['nisnS']):'';
        $nis           = (isset($_GET['nisS']) AND $_GET['nisS']!='')?filter($_GET['nisS']):'';
        $namasiswa     = (isset($_GET['namasiswaS']) AND $_GET['namasiswaS']!='')?filter($_GET['namasiswaS']):'';
        
        // Title content
        $out.='<body>';
          $out.='<table width="100%">
                  <tr>
                    <td width="41%">
                      <img width="100" src="../../images/logo.png" alt="" />
                    </td>
                    <td>
                      <b>Penerimaan Siswa </b>
                    </td>
                  </tr>
              </table><br />';
          $t1 = getField('tahunajaran','aka_tahunajaran','replid',$tahunajaran);
          $out.='<table xclass="isi" width="100%">
                  <tr>
                    <td width="15%">Departemen</td>
                    <td>: '.getField('nama','departemen','replid',$departemen).'</td>
                  </tr>
                  <tr>
                    <td>Tahun Ajaran</td>
                    <td>: '.$t1.' - '.($t1+1).'</td>
                  </tr>
                  <tr>
                    <td>Tingkat</td>
                    <td>: '.getField('tingkat','aka_tingkat','replid',$tingkat).'</td>
                  </tr>
                  <tr>
                    <td>Sub Tingkat</td>
                    <td>: '.getField('subtingkat','aka_subtingkat','replid',$subtingkat).'</td>
                  </tr>
                  <tr>
                    <td>Biaya</td>
                    <td>: '.getField('biaya','psb_biaya','replid',$biaya).'</td>
                  </tr>
              </table><br />';
          // header
          $s = 'SELECT  
                  v.idsiswa,
                  v.namasiswa,  
                  v.nis,
                  v.nopendaftaran,
                  v.nisn,
                  db.biaya
                FROM 
                  psb_siswabiaya sb 
                  JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
                  JOIN vw_psb_siswa_kriteria v on sb.siswa = v.idsiswa 
                WHERE
                  v.status!="2" AND 
                  v.idtingkat ='.$tingkat.' AND 
                  v.idsubtingkat ='.$subtingkat.' AND 
                  v.namasiswa LIKE "%'.$namasiswa.'%" AND 
                  v.nis LIKE "%'.$nis.'%" AND 
                  v.nisn LIKE "%'.$nisn.'%" AND 
                  v.nopendaftaran LIKE "%'.$nopendaftaran.'%" and 
                  db.biaya  ='.$biaya;
                // pr($s);
            $e = mysql_query($s);
            $n = mysql_num_rows($e);
            $out.='<b>Total : '.$n.'</b>';
          $out.='<table class="isi" width="100%">
                    <tr class="head">
                      <td align="center">No. pendaftaran</td>
                      <td align="center">NISN</td>
                      <td align="center">NIS</td>
                      <td align="center">Nama</td>
                      <td align="center">Tagihan</td>
                      <td align="center">Terbayar</td>
                      <td align="center">Status</td>
                    </tr>';
            while ($r = mysql_fetch_assoc($e)) {
              $terbayarTotal      = getTerbayarTotal($r['idsiswa'],$r['biaya']);
              $biayaNett          = getBiayaNett2($r['idsiswa'],$r['biaya']);
              $status = $terbayarTotal==$biayaNett?'lunas':($terbayarTotal==0?'belum':'kurang');
              $color  = $terbayarTotal==$biayaNett?'green':($terbayarTotal==0?'red':'orange');

              $out.='<tr>
                <td align="center">'.getNoPendaftaran2($r['idsiswa']).'</td>
                <td>'.$r['nisn'].'</td>
                <td>'.$r['nis'].'</td>
                <td>'.$r['namasiswa'].'</td>
                <td align="right">'.setuang($biayaNett).'</td>
                <td align="right">'.setuang($terbayarTotal).'</td>
                <td style="background-color:'.$color.';color:white;" align="center">'.$status.'</td>
              </tr>';
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
  }
}
?>