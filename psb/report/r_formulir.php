<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu = 'Formulir';
  $pre = 'formulir_';

  $x     = $_SESSION['id_loginS'].$_GET[$pre.'nopendaftaranS'].$_GET[$pre.'namaS'].$_GET[$pre.'statusS'].$_GET['kelompokS'];
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) OR  $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      // echo 'Token URL  sesuai';
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>SISTER::Keu - Pembayaran '.$mnu.'</title>
          </head>';
          $kelompok      = isset($_GET['kelompokS'])?filter($_GET['kelompokS']):'';
          $nopendaftaran = isset($_GET[$pre.'nopendaftaranS'])?filter($_GET[$pre.'nopendaftaranS']):'';
          $nama          = isset($_GET[$pre.'namaS'])?filter($_GET[$pre.'namaS']):'';
          $daftar        = isset($_GET[$pre.'daftarS'])?filter($_GET[$pre.'daftarS']):'';
          $status        = (isset($_GET[$pre.'statusS']) AND $_GET[$pre.'statusS']!='') ?' AND t2.statbayar="'.filter($_GET[$pre.'statusS']).'"':'';
      
        // table content
          $s2 = 'SELECT
                  t2.*
                FROM
                  psb_calonsiswa c
                  LEFT JOIN (
                    SELECT 
                      if(t1.cicilan=t1.daftar,"lunas","belum")statbayar,
                      cs.replid,
                      cs.nama, 
                      t1.cicilan,
                      t1.daftar,
                      cs.kelompok,    
                      cs.nopendaftaran    
                    FROM psb_calonsiswa cs 
                      LEFT JOIN (
                        SELECT ss.replid, p.cicilan,s.daftar
                        from  psb_calonsiswa ss
                          LEFT JOIN keu_pembayaran p on p.siswa= ss.replid
                          LEFT JOIN keu_modulpembayaran m on m.replid = p.modul
                          LEFT JOIN keu_katmodulpembayaran k on k.replid = m.katmodulpembayaran
                          LEFT JOIN psb_setbiaya s on s.replid = ss.setbiaya
                        WHERE k.nama = "formulir"
                      )t1 on t1.replid = cs.replid 
                  )t2 on t2.replid= c.replid
                WHERE
                  c.kelompok = '.$kelompok.'
                  AND c.nama LIKE "%'.$nama.'%"
                  AND c.nopendaftaran LIKE "%'.$nopendaftaran.'%"
                  '.$status;
            $e2  = mysql_query($s2) or die(mysql_error());
            $n   = mysql_num_rows($e2);

        // header info 
          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Pembayaran '.$mnu.'</b>
                        </td>
                      </tr>
                    </table><br />';

          $kel  = getKelompok('kelompok',$kelompok);
          $pros = getProses('proses',getKelompok('proses',$kelompok));
          $dep  = getDepartemen('nama',getProses('departemen',getKelompok('proses',$kelompok)));
          $out.='<table width="100%">
                  <tr>
                    <td>Departemen </td>
                    <td>: '.$dep.'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>Periode</td>
                    <td>: '.$pros.'</td>
                    <td align="right"></td>
                  </tr>
                  <tr>
                    <td>Kelompok</td>
                    <td>: '.$kel.'</td>
                    <td align="right"> Total :'.$n.' Data</td>
                  </tr>
                </table>';

            $out.='<table class="isi" width="100%">
                  <tr class="head">
                    <td align="center">No.</td>
                    <td align="center">No. Pendaftaran</td>
                    <td align="center">Nama</td>
                    <td align="center">Formulir</td>
                    <td align="center">Kurangan</td>
                    <td align="center">Status</td>
                    <td align="center">Tanggal Bayar</td>
                  </tr>';

            $nox = 1;
            $totbayar = $totkurang = 0;
            if($n==0){
              $out.='<tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
              </tr>';
            }else{
              while ($r2=mysql_fetch_assoc($e2)) {
                $biaya    = getBiaya('formulir',$r2['replid']);
                $terbayar = getTerbayar('formulir',$r2['replid']);
                $kurangan = $biaya - $terbayar;
                $status   = getStatusBayar('formulir',$r2['replid']);
                if($status=='lunas'){
                  $clr = 'lightGreen';
                }elseif($status=='kurang'){
                  $clr = 'yellow';
                }else{ // belum
                  $clr = 'pink';
                }

                $out.='<tr>
                          <td align="right">'.$nox.'.</td>
                          <td>'.$r2['nopendaftaran'].'</td>
                          <td>'.$r2['nama'].'</td>
                          <td align="right">Rp. '.number_format($biaya).'</td>
                          <td align="right">Rp. '.number_format($kurangan).'</td>
                          <td style="background-color:'.$clr.'"  align="center">'.$status.'</td>
                          <td align="center">'.getTglTrans($r2['replid'],'formulir').'</td>
                    </tr>';
                $nox++;
                $totbayar+=$biaya;
                $totkurang+=$kurangan;
              }
            }
            $out.='<tr class="head">
              <td colspan="3" align="right"><b>Total : </b></td>
              <td align="right">Rp. '.number_format($totbayar).'</td>
              <td align="right">Rp. '.number_format($totkurang).'</td>
              <td colspan="2"></td>
            </tr>';
            $out.='</table>';
            $out.='</body>';
            echo $out;
  
        #generate html -> PDF ------------
          $out2 = ob_get_contents();
          ob_end_clean(); 
          // $mpdf=new mPDF('','', 0, '', 15, 15, 16, 16, 9, 9, 'L');
          // $mpdf=new mPDF('', 'Letter', 0, '', 12.7, 12.7, 14, 12.7, 8, 8);   
          // $mpdf=new mPDF('c','4A0','');   
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