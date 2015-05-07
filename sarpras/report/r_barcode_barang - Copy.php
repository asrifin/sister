<style type="text/css">
.m-content {
  float:none;
  padding:5px;
  height:80px;
}
.barcode{
  float:left;
  width:94px;
  height:100px;
  margin:5px 5px 0 5px;
}
</style>
<?php
  session_start();
  require_once '../../lib/dbcon.php';
  // require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  require_once '../../lib/bar128.php';

  $x     = isset($_SESSION['id_loginS']).$_GET['b_katalogS'].$_GET['b_kodeS'].$_GET['b_barkodeS'].$_GET['b_sumberS'].$_GET['b_hargaS'].$_GET['b_kondisiS'].$_GET['b_statusS'].$_GET['b_keteranganS'];
  $token = base64_encode($x);
  if(!isset($_SESSION)){ // login 
    echo 'user has been logout';
  }else{ // logout
    if(!isset($_GET['token']) and $token!==$_GET['token']){
      echo 'maaf token - url tidak valid';
    }else{
      // $ss = ' SELECT
      //           g.replid,
      //           g.nama as grup,(
      //             SELECT nama
      //             from sar_lokasi 
      //             where replid = g.lokasi
      //           )as lokasi,
      //           IFNULL(tbjum.totbarang,0)totbarang,
      //           tbjum.susut,
      //           tbjum.nama as katalog,
      //           tbjum.totaset,
      //           tbjum.photo
      //         from 
      //           sar_grup g
      //           LEFT JOIN (
      //             SELECT 
      //               k.replid,
      //               k.grup,
      //               k.susut,
      //               k.nama,
      //               k.photo,
      //               count(*)totbarang,
      //               sum(b.harga)totaset
      //             from 
      //               sar_katalog k,
      //               sar_barang b
      //             WHERE
      //               k.replid = b.katalog AND
      //               k.replid = '.$_GET['b_katalogS'].'
      //           )tbjum on tbjum.grup = g.replid
      //         where 
      //           tbjum.replid= '.$_GET['b_katalogS'];
      //           print_r($ss);exit();
      //   $ee = mysql_query($ss) or die(mysql_error());
      //   $rr = mysql_fetch_assoc($ee);
          // var_dump($rr);exit();
        // sleep(1);
        // ob_start(); // digunakan untuk convert php ke html
            // <body OnLoad="window.print()" OnFocus="window.close()">
        $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
          <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
              <title>SISTER::Sar - Unit Barang</title>
            </head>

            <body OnLoad="window.print()">
              <p align="center">
                <b>
                  Unit Barang<br>
                </b>
              </p>';
              // <table width="100%">
              //   <tr >
              //     <td>Nama Barang</td>
              //     <td>:</td>
              //     <td>'.$rr['katalog'].'</td>
              //     <td rowspan="5"><img width="120" src="../../img/'.($rr['photo2']==''? 'no_image.jpg':'upload/'.$rr['photo2']).'" alt="" /></td>
              //     <td rowspan="5"><img width="120" src="../../img/no_image.jpg"></td>
              //   </tr>
              //   <tr>
              //     <td>Grup Barang</td>
              //     <td>:</td>
              //     <td>'.$rr['grup'].'</td>
              //   </tr>
              //   <tr>
              //     <td>Lokasi</td>
              //     <td>:</td>
              //     <td>'.$rr['lokasi'].'</td>
              //   </tr>
              //   <tr>
              //     <td>Jumlah Barang</td>
              //     <td>:</td>
              //     <td>'.$rr['totbarang'].' unit</td>
              //   </tr>
              //   <tr>
              //     <td>Total Aset</td>
              //     <td>:</td>
              //     <td>Rp. '.number_format($rr['totaset']).',-</td>
              //   </tr>
              //   <tr>
              //     <td>Penyusustan Per Th.</td>
              //     <td>:</td>
              //     <td>'.$rr['susut'].' %</td>
              //   </tr>
              // </table><br>';
  
              // <table class="isi" width="100%">
              //     <tr class="head">
              //       <td align="center">Kode</td>
              //       <td align="center">Barcode</td>
              //       <td align="center">Tempat</td>
              //       <td align="center">Sumber</td>
              //       <td align="center">Harga</td>
              //       <td align="center">Kondisi</td>
              //       <td align="center">Status</td>
              //       <td align="center">Keterangan</td>
              //     </tr>
            $b_katalog    = isset($_GET['b_katalogS'])?filter(trim($_GET['b_katalogS'])):'';
            $b_kode       = isset($_GET['b_kodeS'])?filter(trim($_GET['b_kodeS'])):'';
            $b_barkode    = isset($_GET['b_barkodeS'])?filter(trim($_GET['b_barkodeS'])):'';
            $b_harga      = isset($_GET['b_hargaS'])?filter(trim($_GET['b_hargaS'])):'';
            $b_kondisi    = isset($_GET['b_kondisiS'])?filter(trim($_GET['b_kondisiS'])):'';
            $b_sumber     = isset($_GET['b_sumberS'])?filter(trim($_GET['b_sumberS'])):'';
            $b_status     = isset($_GET['b_statusS'])?filter(trim($_GET['b_statusS'])):'';
            $b_keterangan = isset($_GET['b_keteranganS'])?filter(trim($_GET['b_keteranganS'])):'';
            
            $s = 'SELECT (
                        SELECT 
                          CONCAT(ll.kode,"/",gg.kode,"/",tt.kode,"/",kk.kode,"/",LPAD(b.urut,5,0))
                        from 
                          sar_katalog kk,
                          sar_grup gg,
                          sar_tempat tt,
                          sar_lokasi ll
                        where 
                          kk.replid = b.katalog AND
                          kk.grup   = gg.replid AND
                          b.tempat  = tt.replid AND
                          tt.lokasi = ll.replid
                      )as kode,
                      b.replid,
                      LPAD(b.urut,5,0) as barkode,(
                        case b.sumber
                          when 0 then "Beli"
                          when 1 then "Pemberian" 
                          when 2 then "Membuat Sendiri" 
                        end
                      )as sumber,
                      b.harga,
                      IF(b. STATUS=1,"Tersedia","Dipinjam")AS status,
                      k.nama as kondisi,
                      t.nama as tempat,
                      b.keterangan
                    FROM
                      sar_barang b 
                      LEFT JOIN sar_kondisi k on k.replid = b.kondisi
                      LEFT JOIN sar_tempat t on t.replid = b.tempat
                    WHERE
                      b.katalog = '.$b_katalog.' and
                      b.kode LIKE "%'.$b_kode.'%" and
                      b.barkode LIKE "%'.$b_barkode.'%" and
                      b.harga LIKE "%'.$b_harga.'%" and
                      b.sumber LIKE "%'.$b_sumber.'%" and
                      b.kondisi LIKE "%'.$b_kondisi.'%" and
                      b.status LIKE "%'.$b_status.'%" and
                      b.keterangan LIKE "%'.$b_keterangan.'%"';  

                  // var_dump($e);exit();
                  $e = mysql_query($s) or die(mysql_error());
                  $n = mysql_num_rows($e);
                  $out.=' <table border="1" width="50%">';
                  // $nox = 1;
                  if($n==0){
                    $out.=' <tr>
                              <td colspan="2">-</td>
                            </tr>';
                  }else{
                    $kolom = 2;
                    $counter = 1;
                    while ($r=mysql_fetch_assoc($e)) {
                      if (($counter-1) % $kolom == 0){
                        $out.="<tr>";
                      } 
                      // $x ='okok';
                      $x = bar128(stripcslashes($r['barkode']));
                      // var_dump($x);exit();
                      $out.="<div class='barcode'>";
                              // <font face='code128' size='10'>
                      // $out.="<div class='barcode'>";
                      $out.=$x;
                      $out.="</div>";
                            // <br />
                            // ".$r['kode']."
                      // $out.="<td align='center' cellspacing='5' style='padding: 20px' width='20%'>
                      //         <font face='code128' size='10'>
                      //         <div class='barcode'>";
                      // // $out.="<div class='barcode'>";
                      // $out.=$x;
                      // $out.="</font>
                      //       </div>
                      //       <br />
                      //       ".$r['kode']."
                      //   </td>";
                            // ".$x."</font><br />

                      if ($counter % $kolom == 0) {
                        $out.="</tr>";
                      }

                      $counter++;
                    }
                  }
          $out.='</table>';
        echo $out;
  
        #generate html -> PDF ------------
          // $out2 = ob_get_contents();
//           ob_end_clean(); 
//           $mpdf=new mPDF('c','A4','');   
//           $mpdf->SetDisplayMode('fullpage');   
//           $stylesheet = file_get_contents('../../lib/mpdf/r_cetak.css');
// // var_dump($stylesheet);exit();
//           $mpdf->WriteHTML($stylesheet,1);  // The parameter 1 tells that this is css/style only and no body/html/text
//           $mpdf->WriteHTML($out);
//           $mpdf->Output();
    }
}
  // ---------------------- //
  // -- created by epiii -- //
  // ---------------------- // 

?>