<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';

  $mnu = 'Detil Anggaran';
  $pre = 'd_';
  $x     = $_SESSION['id_loginS'].$_GET[$pre.'kategorianggaranH'].$_GET[$pre.'tahunajaranS'].$_GET[$pre.'tingkatS'].$_GET[$pre.'namaS'].$_GET[$pre.'keteranganS'];
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) OR  $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml">
              <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>SISTER::Keu - Anggaran</title>
              </head>';
                $kategorianggaran = isset($_GET[$pre.'kategorianggaranH'])?filter($_GET[$pre.'kategorianggaranH']):'';
                $tahunajaran      = isset($_GET[$pre.'tahunajaranS'])?filter($_GET[$pre.'tahunajaranS']):'';
                $tingkat          = isset($_GET[$pre.'tingkatS'])?filter($_GET[$pre.'tingkatS']):'';
                $nama             = isset($_GET[$pre.'namaS'])?filter($_GET[$pre.'namaS']):'';
                $keterangan       = isset($_GET[$pre.'keteranganS'])?filter($_GET[$pre.'keteranganS']):'';

                $s = 'SELECT 
                        d.replid,
                        d.nama,
                        d.keterangan,
                        sum(n.nominal)totNominal
                      FROM keu_detilanggaran d
                        LEFT JOIN keu_nominalanggaran n on n.detilanggaran = d.replid
                      WHERE 
                        d.kategorianggaran ='.$kategorianggaran.' and 
                        d.tingkat = '.$tingkat.' AND
                        d.nama LIKE"%'.$nama.'%" AND 
                        d.keterangan LIKE"%'.$keterangan.'%"
                      GROUP BY  
                        d.replid';
                        // print_r($kategorianggaran);exit();
                $e = mysql_query($s) or die(mysql_error());
                $n = mysql_num_rows($e);

              // header's info
              $depId           = getKatAnggaran('departemen',$kategorianggaran);
              $katAnggaranNama = getKatAnggaran('nama',$kategorianggaran);
              $katAnggaranKet  = getKatAnggaran('keterangan',$kategorianggaran);
              $katAnggaranThn  = getTahunAjaran('tahunajaran',$tahunajaran);
              $depNama         = getDepartemen('nama',$depId);
              $tingNama        = getTingkat('tingkat',$tingkat);
              $tingKet         = getTingkat('keterangan',$tingkat);
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
                    <td width="10%">Tahun Buku </td>
                    <td>: '.getTahunBuku('nama').'</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td width="10%">Kategori</td>
                    <td>: '.$katAnggaranNama.' ('.$katAnggaranKet.')</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td width="10%">Tingkat</td>
                    <td>: '.$tingNama.'('.$tingKet.')</td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>Departemen</td>
                    <td>: '.$depNama.'</td>
                    <td align="right"> Total :'.$n.' Data</td>
                  </tr>
                </table>';
                $out.='<table class="isi" width="100%">
                    <tr class="head">
                      <td align="center">Anggaran</td>
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
                        $kuota        =getKuotaAnggaran($r['replid']); 
                        $terpakaiPerc =intval($kuota['terpakaiPerc']);
                        // var_dump(intval($terpakaiPerc));exit();
                        if($terpakaiPerc>75) {$clr='red';}
                        elseif($terpakaiPerc>50) {$clr='orange';}
                        elseif($terpakaiPerc>25) {$clr='yellow';}
                        elseif($terpakaiPerc>0 OR $terpakaiPerc<25) {$clr='green';}
                        $out.='<tr>
                                  <td>'.$r['nama'].'</td>
                                  <td align="right">Rp. '.number_format($kuota['kuotaNum']).'</td>
                                  <td align="right"> Rp. '.number_format($kuota['terpakaiNum']).' ('.$kuota['terpakaiPerc'].' %)</td>
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