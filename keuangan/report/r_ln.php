<?php
  sleep(2);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  // $mnu = 'pendaftaran';

  $x     = $_SESSION['id_loginS'].$_GET['ns_kodeS'].$_GET['ns_namaS'];
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // belum login  
    echo 'user has been logout';
  }else{ // sudah login 
    if(!isset($_GET['token']) OR $token!==$_GET['token']){ //token salah 
      echo 'Token URL tidak sesuai';
    }else{ //token benar
      ob_start(); // digunakan untuk convert php ke html
      $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>SISTER::Keu - Laporan Neraca </title>
          </head>';
        // table content
            $kode = isset($_GET['ns_kodeS'])?$_GET['ns_kodeS']:'';
            $nama = isset($_GET['ns_namaS'])?filter($_GET['ns_namaS']):'';
            $s = '  SELECT 
                  j.detilrekening replid, 
                  dr.kode,
                  dr.nama,
                  getSaldoRekeningByTgl(j.detilrekening,"2015-11-01","2016-11-01")saldoRekening
                FROM keu_jurnal j 
                  JOIN keu_detilrekening dr on dr.replid = j.detilrekening
                  JOIN keu_transaksi t on t.replid = j.transaksi
                WHERE 
                  t.tanggal BETWEEN "'.tgl_indo6($_GET['tgl1']).'" and "'.tgl_indo6($_GET['tgl2']).'"
                GROUP BY j.detilrekening
                ORDER BY dr.kode asc,dr.nama asc';
            $e = mysql_query($s) or die(mysql_error());
            $n = mysql_num_rows($e);

            $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="39%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>Laporan Neraca</b>
                        </td>
                      </tr>
                    </table>';
            $out.='<b align="right">Tgl : '.$_GET['tgl1'].' s/d '.$_GET['tgl2'].'</b>';

            $s1=' SELECT
                kr.replid,  
                kr.nama kategorirekening,
                sj.posisi
              FROM
                keu_jenisreport jr
                JOIN keu_subjenisreport sj on sj.jenisreport = jr.replid
                JOIN keu_kategorirekening kr on kr.replid = sj.kategorirekening
              WHERE
                jr.jenisreport = "neraca" 
              ORDER BY 
                sj.posisi asc';
                // pr($s1);
            $e1 = mysql_query($s1);
            $n1 = mysql_num_rows($e1);
            
            $out.='<table width="100%" class="isi">
                    <thead>
                        <tr class="head">
                            <th>kiri</th>
                            <th>kanan</th>
                        </tr>
                    </thead>
                    <tbody>
                      <tr>';
                    // kiri -----------------------------------------------------------------------------------------------
                  $out.='<td>
                          <table class="isi">';
                    $sl='SELECT
                          sj.replid,
                          kr.nama kategorirekening
                        FROM
                          keu_subjenisreport sj
                          JOIN keu_jenisreport jr ON jr.replid = sj.jenisreport
                          JOIN keu_kategorirekening kr ON kr.replid = sj.kategorirekening
                        WHERE
                          jr.jenisreport = "neraca"
                          AND posisi = "l"';
                      $el=mysql_query($sl);
                      $grandtotall=$grandtotalr=0;
                      // looping kategorrekening ---------------------------------------------------------------------
                      
                        while ($rl=mysql_fetch_assoc($el)) {
                        $out.='<tr class=head""><td colspan="3">'.$rl['kategorirekening'].'</td></tr>';
                        $ssl='SELECT 
                              t.replid,
                              t.detilrekening,
                              sum(concat(t.operator,t.nominal))nominal
                            from (
                              SELECT
                                dr.replid,
                                CONCAT(dr.kode," - ",dr.nama)detilrekening,
                                j.nominal nominal,
                                t.tanggal,
                                j.jenisrekening,
                                dr.kategorirekening,
                                getOperatorDetRekening(j.detilrekening,j.jenisrekening)operator
                              FROM
                                keu_jurnal j 
                                JOIN keu_transaksi t on t.replid = j.transaksi
                                JOIN keu_detilrekening dr on dr.replid = j.detilrekening
                              WHERE 
                                t.tanggal BETWEEN "'.tgl_indo6($_GET['tgl1']).'"
                                AND "'.tgl_indo6($_GET['tgl2']).'"
                              ORDER BY 
                                j.detilrekening asc,
                                j.jenisrekening asc
                            )t
                            WHERE t.kategorirekening = '.$rl['replid'].'
                            GROUP BY t.replid';
                        // pr($ssl);
                        $eel=mysql_query($ssl);
                        $nnl = mysql_num_rows($eel);
                        $subtotal=0;
                        // looping detil rekekning ------------------------------------------------------------------
                        if($nnl==0){$out.='<tr><td align="center" colspan="3"> ...data kosong ...</td></tr>';}
                        else{
                          while ($rrl=mysql_fetch_assoc($eel)) {
                            $out.='<tr>
                              <td>'.$rrl['detilrekening'].'</td>
                              <td align="right">'.($rrl['nominal']<0?'<span class="fg-red">'.setuang($rrl['nominal']).'</span>':setuang($rrl['nominal'])).'</td>
                              <td></td>
                            </tr>';
                            $subtotal+=$rrl['nominal'];
                            // $subtotal=($rrl['nominal']<0?($subtotal-$rrl['nominal']):($subtotal+$rrl['nominal']));
                          }
                        }$grandtotall+=$subtotal;
                        // subtotal
                        $out.='<tr>
                          <td align="right" colspan="2">Subtotal</td>
                          <td align="right">'.setuang($subtotal).'</td>
                        </tr><tr>
                          <td colspan="3">&nbsp;</td>
                        </tr>';
                      }
                      $out.='
                        <tr>
                          <td align="right" colspan="2">Grand Total</td>
                          <td align="right">'.setuang($grandtotall).'</td>
                        </tr>
                      </table>
                    </td>';

                  // kanan  ----------------------------------------------------
                  $out.='<td valign="top" width="50%">
                    <table width="100%" class="isi">';
                    $sr='SELECT
                          sj.replid,
                          kr.nama kategorirekening
                        FROM
                          keu_subjenisreport sj
                          JOIN keu_jenisreport jr ON jr.replid = sj.jenisreport
                          JOIN keu_kategorirekening kr ON kr.replid = sj.kategorirekening
                        WHERE
                          jr.jenisreport = "neraca"
                          AND posisi = "r"';
                      $er=mysql_query($sr);
                      $grandtotall=$grandtotalr=0;
                      // looping kategorrekening ---------------------------------------------------------------------
                      while ($rr=mysql_fetch_assoc($er)) {
                        $out.='<tr class="head">';
                          $out.='<td class="fg-white bg-red" colspan="3">'.$rr['kategorirekening'].'</td>';
                          $out.='</tr>';
                        $ssr='  SELECT
                              dr.replid,
                              CONCAT(dr.kode, " - ", dr.nama) detilrekening,
                              sum(j.nominal) nominal
                            FROM
                              keu_jurnal j
                              JOIN keu_transaksi t ON t.replid = j.transaksi
                              JOIN keu_detilrekening dr ON dr.replid = j.detilrekening
                            WHERE
                              dr.kategorirekening = '.$rr['replid'].'
                              AND t.tanggal BETWEEN "'.tgl_indo6($_GET['tgl1']).'"
                              AND "'.tgl_indo6($_GET['tgl2']).'"
                            GROUP BY
                              dr.replid';
                        $eer=mysql_query($ssr);
                        $nnr= mysql_num_rows($eer);
                        $subtotal=0;
                        // looping detil rekekning ------------------------------------------------------------------
                        if($nnr==0){$out.='<tr><td align="center" colspan="3"> ...data kosong ...</td></tr>';}
                        else{
                          while ($rrr=mysql_fetch_assoc($eer)) {
                            $out.='<tr>
                              <td>'.$rrl['detilrekening'].'</td>
                              <td align="right">'.setuang($rrr['nominal']).'</td>
                              <td></td>
                            </tr>';
                            $subtotal+=$rrr['nominal'];
                          }
                        }$grandtotalr+=$subtotal;

                        // subtotal
                        $out.='<tr>
                          <td align="right" colspan="2">Subtotal</td>
                          <td align="right" class="fg-white bg-red">: '.setuang($subtotal).'</td>
                        </tr><tr>
                          <td colspan="3">&nbsp;</td>
                        </tr>';
                      }
                      // laba tahun berjalan 
                      $out.='<tr>
                        <td>Laba Tahun berjalan </td>
                        <td align="right">Rp. 500.000</td>
                        <td></td>
                      </tr>';
                      $out.='
                        <tr><td colspan="3">&nbsp;</td></tr>
                        <tr>
                          <td align="right" colspan="2">Grand Total</td>
                          <td class="bg-red fg-white" align="right">'.setuang($grandtotalr).'</td>
                        </tr>
                      </table>
                                    </td>
                                </tr>
                            </tbody>';
                      $out.='<tbody>';
                      $grandTot=0;
            $out.='</table>
            </body>'; 
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