<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';

  // $x     = $_SESSION['id_loginS'].$_GET[$pre.'kategorianggaranH'].$_GET[$pre.'tahunajaranS'].$_GET[$pre.'tingkatS'].$_GET[$pre.'namaS'].$_GET[$pre.'keteranganS'];
  $mnu = 'Detil Anggaran';
  $pre = 'd_';
  $x     = $_SESSION['id_loginS'].$_GET[$pre.'kategorianggaranH'].$_GET[$pre.'namaS'].$_GET[$pre.'keteranganS'];
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
                <title>SISTER::Keu - Detail Anggaran</title>
              </head>';
                $kategorianggaran = isset($_GET[$pre.'kategorianggaranH'])?filter($_GET[$pre.'kategorianggaranH']):'';
                $nama             = isset($_GET[$pre.'namaS'])?filter($_GET[$pre.'namaS']):'';
                $keterangan       = isset($_GET[$pre.'keteranganS'])?filter($_GET[$pre.'keteranganS']):'';

                // sum(n.nominal)totNominal
                $s = 'SELECT 
                        d.replid,
                        d.nama,
                        d.keterangan
                      FROM keu_detilanggaran d
                        LEFT JOIN keu_nominalanggaran n on n.detilanggaran = d.replid
                      WHERE 
                        d.kategorianggaran ='.$kategorianggaran.' and 
                        d.nama LIKE"%'.$nama.'%" AND 
                        d.keterangan LIKE"%'.$keterangan.'%"
                      GROUP BY  
                        d.replid';
                        // print_r($s);exit();
                $e = mysql_query($s) or die(mysql_error());
                $n = mysql_num_rows($e);

              // header's info
              $katAnggNama = getKatAnggaran2('nama',$kategorianggaran);
              $katAnggKet  = getKatAnggaran2('keterangan',$kategorianggaran);
                $tingId      = getKatAnggaran2('tingkat',$kategorianggaran);
              $tingNama    = getTingkat('tingkat',$tingId);
              $tingKet     = getTingkat('keterangan',$tingId);
                $tAjaranId   = getTingkat('tahunajaran',$tingId);
              $tAjaranNama = getTahunAjaran('tahunajaran',$tAjaranId);
                $depId       = getTahunAjaran('departemen',$tAjaranId);
              $depNama     = getDepartemen('nama',$depId);

              $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="41%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Detil Anggaran</b>
                        </td>
                      </tr>
                    </table><br />

                <table width="100%">
                  <tr>
                    <td>Departemen</td>
                    <td>: '.$depNama.'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td width="16%">Tahun Ajaran </td>
                    <td>: '.$tAjaranNama.'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td width="16%">Tingkat</td>
                    <td>: '.$tingNama.' ('.$tingKet.')</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td width="16%">Kategori</td>
                    <td>: '.$katAnggNama.' ('.$katAnggKet.')</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td width="16%">Tot. Anggaran</td>
                    <td>: Rp. '.number_format(getKatAnggaran($kategorianggaran,'kuotaNum')).'</td>
                    <td align="right"> Total :'.$n.' Data</td>
                  </tr>
                </table>';


                $out.='<table class="isi" width="100%">
                    <tr class="head">
                      <td align="center">Item</td>
                      <td align="center">Kuota</td>
                      <td align="center">Terpakai</td>
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
                        // $kuota        =getKuotaAnggaran($r['replid']); 
                        $kuotaNum     ='Rp. '.number_format(getDetAnggaran($r['replid'],'kuotaNum')); 
                        $terpakaiNum  ='Rp. '.number_format(getDetAnggaran($r['replid'],'terpakaiNum')); 
                        $terpakaiPerc = getDetAnggaran($r['replid'],'terpakaiPerc'); 
                        
                        if($terpakaiPerc>75) {$clr='red';}
                        elseif($terpakaiPerc>50) {$clr='orange';}
                        elseif($terpakaiPerc>25) {$clr='yellow';}
                        elseif($terpakaiPerc>0 OR $terpakaiPerc<25) {$clr='green';}
                        $out.='<tr>
                                  <td>'.$r['nama'].'</td>
                                  <td align="right">'.$kuotaNum.'</td>
                                  <td align="right">'.$terpakaiNum.' ('.$terpakaiPerc.' %)</td>
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