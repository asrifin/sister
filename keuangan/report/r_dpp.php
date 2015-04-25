<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu = 'DPP (Uang Pangkal)';
// var_dump($mnu);exit();
  $x     = $_SESSION['kelompokS'].$_GET['nopendaftaranS'].$_GET['namaS'].$_GET['daftarS'].$_GET['joiningfS'];
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) and $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>SISTER::Keu - Pembayaran '.$mnu.'</title>
          </head>';
          $angkatan = isset($_GET['angkatanS'])?filter($_GET['angkatanS']):'';
          $nis      = isset($_GET['nisS'])?filter($_GET['nisS']):'';
          $nama     = isset($_GET['namaS'])?filter($_GET['namaS']):'';
      
        // table content
            // a.angkatan,
          $s = 'SELECT
                    c.replid,
                    c.nis,
                    c.nama,
                    c.kelompok
                  FROM
                    psb_calonsiswa c
                    LEFT JOIN psb_kelompok k on k.replid  = c.kelompok
                    LEFT JOIN psb_proses p on p.replid  = k.proses
                  WHERE
                    p.angkatan = '.$angkatan.'
                    AND c.nis LIKE "%'.$nis.'%"
                    AND c.nama LIKE "%'.$nama.'%"
                  ORDER BY
                    c.nama asc';
          //   var_dump($s);exit();
          $e = mysql_query($s) or die(mysql_error());
          $n = mysql_num_rows($e);

        // header info 
          $departemen = getDepartemen('nama',getAngkatan('departemen',$angkatan));
          $angkatanx  = getAngkatan('angkatan',$angkatan); 
          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="32%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Pembayaran '.$mnu.'</b>
                        </td>
                      </tr>
                    </table><br />';

          $out.='<table width="100%">
                  <tr>
                    <td width="10%">Departemen </td>
                    <td>: '.$departemen.'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>Angkatan </td>
                    <td>: '.$angkatanx.'</td>
                    <td align="right"> Total :'.$n.' Data</td>
                  </tr>
                </table>';

            $out.='<table class="isi" width="100%">
                  <tr class="head">
                    <td align="center">no.</td>
                    <td align="center">NIS</td>
                    <td align="center">Nama</td>
                    <td align="center">DPP</td>
                    <td align="center">Kurangan</td>
                    <td align="center">Status</td>
                    <td align="center">Tanggal Bayar</td>
                  </tr>';
            $nox = 1;
            $totdpp = 0;
            $totkurang = 0;
            if($n==0){
              $out.='<tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
              </tr>';
            }else{
              while ($r=mysql_fetch_assoc($e)) {
                $dpp      = getBiaya('dpp',$r['replid'])-getDiscTotal('dpp',$r['replid']);
                $kurangan = $dpp-getTerbayar('dpp',$r['replid']);
                $status   = getStatusBayar('dpp',$r['replid']);
                if($status=='lunas'){
                  $clr = 'lightGreen';
                }elseif($status=='kurang'){
                  $clr = 'yellow';
                }else{ // belum
                  $clr = 'pink';
                }

                $out.='<tr>
                          <td align="right">'.$nox.'.</td>
                          <td>'.$r['nis'].'</td>
                          <td>'.$r['nama'].'</td>
                          <td align="right">Rp. '.number_format($dpp).',-</td>
                          <td align="right">Rp. '.number_format($kurangan).',-</td>
                          <td style="background-color:'.$clr.'" align="center">'.$status.'</td>
                          <td align="center">'.getTglTrans($r['replid'],'dpp').'</td>
                    </tr>';
                $nox++;
                $totdpp+=$dpp;
                $totkurang+=$kurangan;
              }
            }
            $out.='<tr class="head">
              <td colspan="3" align="right"><b>Total : </b></td>
              <td align="right">Rp. '.number_format($totdpp).',-</td>
              <td align="right">Rp. '.number_format($totkurang).',-</td>
              <td colspan="2"></td>
            </tr>';
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
  // ---------------------- //
  // -- created by epiii -- //
  // ---------------------- // 

?>