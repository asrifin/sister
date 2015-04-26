<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mnu  = 'DPP (Uang Pangkal)';
  $pre  ='dpp_';
  $x    = $_SESSION['id_loginS'].$_GET['angkatanS'].$_GET['nisS'].$_GET['namaS'].$_GET[$pre.'statusS'];
  $token = base64_encode($x);
  // var_dump($_GET['token']);exit();
  // var_dump($token);exit();

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
            <title>SISTER::Keu - Pembayaran '.$mnu.'</title>
          </head>';
          $angkatan = isset($_GET['angkatanS'])?filter($_GET['angkatanS']):'';
          $nis      = isset($_GET['nisS'])?filter($_GET['nisS']):'';
          $nama     = isset($_GET['namaS'])?filter($_GET['namaS']):'';
          $status   = (isset($_GET[$pre.'statusS']) AND $_GET[$pre.'statusS']!='') ?' AND t2.statbayar="'.filter($_GET[$pre.'statusS']).'"':'';

        // table content
          $s='SELECT t2.*
              FROM psb_calonsiswa c
                LEFT JOIN (
                    SELECT  
                      case 
                        when t1.cicilan = 0 OR t1.cicilan is NULL  then "belum"
                        when t1.cicilan = sb.nilai-(cs.discsaudara+cs.disctb+ifnull(sb.nilai*dt.nilai/100,0))then "lunas"
                        when t1.cicilan < sb.nilai-(cs.discsaudara+cs.disctb+ifnull(sb.nilai*dt.nilai/100,0))then "kurang"
                      end as statbayar,
                      sb.nilai-(cs.discsaudara+cs.disctb+ifnull(sb.nilai*dt.nilai/100,0))biayanet,
                      cs.replid,
                      cs.nama,
                      t1.cicilan,
                      p.angkatan,
                      cs.nis
                    FROM
                      psb_calonsiswa cs
                      LEFT JOIN psb_disctunai dt on dt.replid = cs.disctunai
                      LEFT JOIN psb_setbiaya sb on sb.replid = cs.setbiaya
                      LEFT JOIN (
                        SELECT
                          ss.replid,
                          sum(p.cicilan)cicilan
                        FROM
                          psb_calonsiswa ss
                          LEFT JOIN keu_pembayaran p ON p.siswa = ss.replid
                          LEFT JOIN keu_modulpembayaran m ON m.replid = p.modul
                          LEFT JOIN keu_katmodulpembayaran k ON k.replid = m.katmodulpembayaran
                          LEFT JOIN psb_setbiaya s ON s.replid = ss.setbiaya
                        WHERE
                          k.nama = "dpp"
                        GROUP BY  
                          ss.replid
                      ) t1 ON t1.replid = cs.replid
                      LEFT JOIN psb_kelompok k on k.replid = cs.kelompok
                      LEFT JOIN psb_proses p on p.replid = k.proses
                  ) t2 ON t2.replid = c.replid
                WHERE
                  t2.angkatan = '.$angkatan.' AND
                  t2.nama LIKE "%'.$nama.'%" AND
                  t2.nis LIKE "%'.$nis.'%" '.$status;

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