<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  require_once '../../lib/fpdf/code128.php';
  // require_once '../../lib/fpdf/html_table.php';

  $x     = isset($_SESSION['id_loginS']).$_GET['b_katalogS'].$_GET['b_kodeS'].$_GET['b_barkodeS'].$_GET['b_sumberS'].$_GET['b_hargaS'].$_GET['b_kondisiS'].$_GET['b_statusS'].$_GET['b_keteranganS'];
  $token = base64_encode($x);
  if(!isset($_SESSION)){ // login 
    echo 'user has been logout';
  }else{ // logout
    if(!isset($_GET['token']) and $token!==$_GET['token']){
      echo 'maaf token - url tidak valid';
    }else{
      // $pdf = new FPDF('L','mm','A4');
      // $pdf=new PDF_Code128();
      // $pdf->AddPage();
      // $pdf->SetFont('Arial','',6);
      // $pdf->Ln();
      // $pdf->Cell(40,10,'Hello World!');
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
                      LPAD(b.urut,5,0) as barkode
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

                  $e = mysql_query($s) or die(mysql_error());
                  $n = mysql_num_rows($e);
      $pdf = new FPDF('L','mm','A4');
      $pdf=new PDF_Code128();
      $pdf->AddPage();
      $pdf->SetFont('Arial','',6);
      $pdf->Ln();

              $barkode = $r['barkode'];
$pdf->Code128(50,20,$code,80,20);
          //         $out.=' <table border="1" width="50%">';
          //         // $nox = 1;
          //         if($n==0){
          //           $out.=' <tr>
          //                     <td colspan="2">-</td>
          //                   </tr>';
          //         }else{
          //           $kolom = 2;
          //           $counter = 1;
          //           while ($r=mysql_fetch_assoc($e)) {
          //             if (($counter-1) % $kolom == 0){
          //               $out.="<tr>";
          //             } 
          //             // $x = bar128(stripcslashes($r['barkode']));
          //             $out.="<td align='center' cellspacing='5' style='padding: 20px' width='20%'>";
          //             // $out.="<div class='barcode'>";
          //             $out.=$r['barkode'];
          //             $out.="<br />
          //                   ".$r['kode']."
          //               </td>";

          //             if ($counter % $kolom == 0) {
          //               $out.="</tr>";
          //             }

          //             $counter++;
          //           }
          //         }
          // $out.='</table>';
        // echo $out;
      

      // $pdf->WriteHTML($out);
      $pdf->Output();
  
    }
}
  // ---------------------- //
  // -- created by epiii -- //
  // ---------------------- // 

?>