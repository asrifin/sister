<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';

  $x     = $_SESSION['id_loginS'].$_GET['a_departemenS'].$_GET['a_tahunbukuS'].$_GET['a_namaS'].$_GET['a_nominalS'].$_GET['a_keteranganS'];
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) and $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml">
              <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>SISTER::Keu - Anggaran</title>
              </head>';
                $a_departemen = isset($_GET['a_departemenS'])?filter($_GET['a_departemenS']):'';
                $a_nama       = isset($_GET['a_namaS'])?filter($_GET['a_namaS']):'';
                $a_rekening   = isset($_GET['a_rekeningS'])?filter($_GET['a_rekeningS']):'';
                $a_keterangan = isset($_GET['a_keteranganS'])?filter($_GET['a_keteranganS']):'';
                
                $s = 'SELECT * 
                      FROM keu_kategorianggaran 
                      WHERE 
                        departemen = '.$a_departemen.' and
                        nama like"%'.$a_nama.'%" and
                        rekening like"%'.$rekening.'%" and
                        keterangan like"%'.$a_keterangan.'%"';
                
                $e = mysql_query($s) or die(mysql_error());
                $n = mysql_num_rows($e);

              $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="41%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Kategori Anggaran</b>
                        </td>
                      </tr>
                    </table><br />
                <table width="100%">
                  <tr>
                    <td width="10%">Tahun Buku </td>
                    <td>: '.getTahunBuku('nama').'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>Departemen</td>
                    <td>: '.getDepartemen('replid',filter($_GET['departemenS'])).'</td>
                    <td align="right"> Total :'.$n.' Data</td>
                  </tr>
                </table>';

                $out.='<table class="isi" width="100%">
                    <tr class="head">
                      <td align="center">Nama Kategori</td>
                      <td align="center">Rekening</td>
                      <td align="center">Keterangan</td>
                    </tr>';
                    $nox = 1;
                    if($n==0){
                      $out.='<tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                      </tr>';
                    }else{
                      while ($r=mysql_fetch_assoc($e)) {
                        // var_dump(getRekening($r['rekening']));exit();
                        $out.='<tr>
                                  <td>'.$r['nama'].'</td>
                                  <td>'.getRekening($r['rekening']).'</td>
                                  <td>'.$r['keterangan'].'</td>
                            </tr>';
                        $nox++;
                      }
                    }
            $out.='</table>';
            // $out.='<p>Total : '.$n.'</p>';
          echo $out;
  
        #generate html -> PDF ------------
          $out2 = ob_get_contents();
          ob_end_clean(); 
          $mpdf=new mPDF('c','A4','');   
          $mpdf->SetDisplayMode('fullpage');   
          $stylesheet = file_get_contents('../../lib/mpdf/r_cetak.css');
          $mpdf->WriteHTML($stylesheet,1);  // The parameter 1 tells that this is css/style only and no body/html/text
          $mpdf->WriteHTML($out);
          $mpdf->Output();
    }
}
  // ---------------------- //
  // -- created by epiii -- //
  // ---------------------- // 

?>