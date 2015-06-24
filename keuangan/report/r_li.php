<?php
  sleep(0);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  
  $mnu = 'Laporan '.($_GET['li_jenisS']=='out'?'Pengeluaran':'Penerimaan');
  $pre = 'li_';

  $rekArr='';
  foreach ($_GET['jenisLaporanCB'] as $i => $v) {
    $rekArr.=$v;
  }
  $x = $_SESSION['id_loginS'].$_GET[$pre.'departemenS'].$_GET[$pre.'tahunajaranS'].$_GET[$pre.'tingkatS'].$_GET[$pre.'tahunS'].$_GET[$pre.'bulanS'].$_GET[$pre.'jenisS'].$rekArr;
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
            <title>SISTER::Keu - '.$mnu.'</title>
          </head>';
          $out         = $rekArr = '';
          $departemen  = isset($_GET['li_departemenS'])?filter($_GET['li_departemenS']):'';
          $tahunajaran = isset($_GET['li_tahunajaranS'])?filter($_GET['li_tahunajaranS']):'';
          $tingkat     = isset($_GET['li_tingkatS'])?filter($_GET['li_tingkatS']):'';

          $uraian     = isset($_GET['li_uraianS'])?filter($_GET['li_uraianS']):'';
          $tahun      = (isset($_GET['li_tahunS']) && $_GET['li_tahunS']!='')?' AND YEAR(t.tanggal)='.$_GET['li_tahunS']:'';
          $bulan      = (isset($_GET['li_bulanS']) && $_GET['li_bulanS']!='')?' AND MONTH(t.tanggal)='.$_GET['li_bulanS']:'';
          
          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>'.$mnu.'</b>
                        </td>
                      </tr>
                    </table><br />';

          $rekArr='';
          if(isset($_GET['jenisLaporanCB']) && count($_GET['jenisLaporanCB']>0)){
            $c = count($_GET['jenisLaporanCB'])-1;
            $ss.='rekitem IN ( ';
            foreach ($_GET['jenisLaporanCB'] as $i => $v) {
              if($i==$c) $rekArr.=$v;
              else $rekArr.=$v.',';
            }$ss.=$rekArr.')';
          
            $s='SELECT t.*
              FROM keu_transaksi t
              WHERE '.$ss.$tahun.$bulan.'
              ORDER BY t.tanggal ASC';
            $e = mysql_query($s) or die(mysql_error());
            $n = mysql_num_rows($e);
            $out.='<table width="100%">
                    <tr>
                      <td width="15%">Departemen </td>
                      <td>: '.($departemen==''?'Semua':getDepartemen('nama',$departemen)).'</td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>Tahun Ajaran</td>
                      <td>: '.($tahunajaran==''?'Semua':getTahunajaran('tahunajaran',$tahunajaran)).'</td>
                      <td align="right">Bulan : '.($_GET['li_bulanS']==''?'Semua':bln_nama($_GET['li_bulanS'],'id','c').' \''.substr($_GET['li_tahunS'],2)).'</td>
                    </tr>
                    <tr>
                      <td>Tingkat</td>
                      <td>: '.($tingkat==''?'Semua':getTingkat('tingkat',$tingkat)).'</td>
                      <td align="right"> Total : '.$n.' Data</td>
                    </tr>
                  </table>';
            $out.='<br /><b>Data Detail :</b>';
            $nox = 1;
            $out.='<table class="isi" width="100%">
                    <tr class="head">
                        <td width="10%" align="center">Tanggal </td>
                        <td width="15%" align="center">No. Jurnal/Jenis Bukti/No.Bukti</td>
                        <td width="30%" align="center">Uraian</td>
                        <td width="40%" align="center">Detil Jurnal</td>
                    </tr>';

            $nox = 1;
            if($n==0){
              $out.='<tr>
                <td align="center" colspan="4">.. Kosong ..</td>
              </tr>';
            }else{
              while ($r=mysql_fetch_assoc($e)) {
                $s2 = ' SELECT replid,rek,nominal,jenis
                        FROM keu_jurnal 
                        WHERE 
                          transaksi ='.$r['replid'].'
                        ORDER BY 
                          jenis ASC';
                $e2  = mysql_query($s2);
                $tb2 ='';
                if(mysql_num_rows($e2)!=0){
                    $tb2.='<table class="isi" width="100%">
                            <tr class="head">
                              <td width="60%">Rekening</td>
                              <td width="20%">Debit</td>
                              <td width="20%">Kredit</td>
                            </tr>';
                    while($r2=mysql_fetch_assoc($e2)){
                      $debit  =$r2['rek']==$r['rekkas']?$r['nominal']:0;
                      $kredit =$r2['rek']==$r['rekitem']?$r['nominal']:0;
                      $tb2.='<tr>
                              <td>'.getRekening($r2['rek']).'</td>
                              <td align="right">Rp. '.number_format($debit).',-</td>
                              <td align="right">Rp. '.number_format($kredit).',-</td>
                            </tr>';
                    }$tb2.='</table>';
                }
                $out.= '<tr>
                          <td width="10%" valign="top">'.tgl_indo7($r['tanggal']).'</td>
                          <td valign="top" width="15%">'.$r['nomer'].'<br>'.getDetJenisTrans2($r['replid']).'<br>'.$r['nobukti'].'</td>
                          <td valign="top" width="30%">'.$r['uraian'].'</td>
                          <td width="40%" valign="top">'.$tb2.'</td>
                        </tr>';
              }
            }
            $out.='</table>';
          $out.='</table>';
          }else{
            $out.='<table width="100%">
                <tr>
                  <td width="30%">Departemen </td>
                  <td width="30%">: '.$dep.'</td>
                  <td width="30%"></td>
                </tr>
                <tr>
                  <td width="30%">Tahun Ajaran</td>
                  <td width="30%">: '.$pros.'</td>
                  <td align="right"></td>
                </tr>
                <tr>
                  <td width="30%">Tingkat</td>
                  <td width="30%">: '.$kel.'</td>
                  <td align="right"> Total : 0 Data</td>
                </tr>
              </table>';

            $out.='<table class="isi" width="100%">
              <tr class="head">
                <td align="center">Tanggal </td>
                <td align="center">No. Jurnal/Jenis Bukti/No.Bukti</td>
                <td align="center">Uraian</td>
                <td align="center">Detil Jurnal</td>
              </tr>
              <tr>
                <td align="center" colspan="4">.. kosong ..</td>
              </tr>
            </table>';
          }
        

        // grafik jpgraph & mpdf
        if($rekArr!=''){
          $sc = 'SELECT
                  r.replid,
                  concat("(",r.kode,") ",r.nama)rekFull,
                  r.nama rekNama,
                  r.kode rekKode,
                  ifnull(SUM(t.nominal),0)nominal
                FROM
                  keu_detilrekening r 
                  LEFT JOIN  keu_transaksi t ON t.rekitem = r.replid
                WHERE
                  r.replid IN ('.$rekArr.')
                  '.$bulan.$tahun.'
                GROUP BY
                  r.replid';
              // print_r($sc);exit();
          $ec= mysql_query($sc);
          $out.='<br /><b>Data Akumulatif :</b>';
          $out.='<table class="isi" id="grafikTBL">
                <tr class="head">
                  <td align="center">Kode Akun</td>
                  <td align="center">(Nominal)</td>
                  <td align="center">Nama Akun</td>
                </tr>';
          $tot=0;
          while ($rc=mysql_fetch_assoc($ec)) {
            $out.='<tr>
                    <td align="center">'.$rc['rekKode'].'</td>
                    <td align="right">'.$rc['nominal'].'</td>
                    <td>'.$rc['rekNama'].'</td>
                  </tr>';
            $tot+=$rc['nominal'];
          }
          $out.='<tr class="head">
                  <td  align="right">Total : </td>
                  <td align="right">Rp. '.number_format($tot).'</td>
                  <td></td>
                </tr>';
          $out.='</table><br />';
          
          $out.='<jpgraph 
            title="Grafik '.$mnu.'" 
            table="grafikTBL" 
            type="pie3d" 
            percent="1"
            data-col-begin="2" 
            data-row-begin="2"
            data-col-end="2"
            data-row-end="-1"
            show-values="1" 
            width="700" 
            height="300" 
          />';
        }

          $out.='</body>';
          echo $out;
  
        #generate html -> PDF ------------
          $out2 = ob_get_contents();
          ob_end_clean(); 
          $mpdf=new mPDF('c','A4','');   
          $mpdf->useGraphs = true;
          $mpdf->SetDisplayMode('fullpage');   
          $stylesheet = file_get_contents('../../lib/mpdf/r_cetak.css');
          $mpdf->WriteHTML($stylesheet,1);  
          $mpdf->WriteHTML($out);
          $mpdf->Output();
    }
  }
?>