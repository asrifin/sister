  <?php
    session_start();
    require_once '../../lib/dbcon.php';
    require_once '../../lib/mpdf/mpdf.php';
    require_once '../../lib/tglindo.php';
    require_once '../../lib/func.php';
    $mnu = 'transaksi';
    $pre = 'ls_';
    // pr($_GET);
    
    $jenis==$jenis2='';
    // foreach ($_GET['detjenistransaksiTB'] as $i => $v) {
    foreach ($_GET['detjenisTB'] as $i => $v) {
      $jenis.=$v;
      $jenis2.=','.$i;
    }$jenis2=substr($jenis2,1);

    $x     = $_SESSION['id_loginS'].$_GET[$pre.'noS'].$_GET[$pre.'uraianS'].$_GET['jenisAllCB'].$jenis.$_GET['tgl1TB'].$_GET['tgl2TB'];
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
              <title>SISTER::Keu - Laporan Sarpras'.$mnu.'</title>
            </head>';
          $out.='<body>
                  <table width="100%">
                    <tr>
                      <td width="39%">
                        <img width="100" src="../../images/logo.png" alt="" />
                      </td>
                      <td>
                        <b>Laporan Sarpras</b>
                      </td>
                    </tr>
                    <tr>
                      <td align="right" colspan="2">
                        Tgl : '.$_GET['tgl1'].' s/d '.$_GET['tgl2'].'</b>
                      </td>
                    </tr>
                  </table>';
              $jurnalArr = $ju_detjenistrans ='';
              if(isset($_GET['jenisAllCB'])){ //select all
                $s='SELECT replid FROM keu_detjenistransaksi';
                $e=mysql_query($s);
                while($r=mysql_fetch_assoc($e)){
                  $jurnalArr.=','.$r['replid'];
                }$jurnalArr=substr($jurnalArr,1);
              }else{ // tidak select all
                if(isset($_GET['detjenisTB'])){
                  foreach ($_GET['detjenisTB'] as $i=>$v) {
                    $jurnalArr.=','.$i;
                  }$jurnalArr=substr($jurnalArr,1);
                }else{
                  $jurnalArr=0;
                }
              }$ju_detjenistrans=' AND detjenistransaksi in('.$jurnalArr.')';
              $ju_no     = isset($_GET['ju_noS'])?filter($_GET['ju_noS']):'';
              $ju_uraian = isset($_GET['ju_uraianS'])?filter($_GET['ju_uraianS']):'';
              // pr($ju_detjenistrans);
              $s= 'SELECT * 
                    from keu_transaksi
                    WHERE 
                      (idkwitansi like "%'.$ju_no.'%" OR nobukti like "%'.$ju_no.'%" ) AND
                      uraian like "%'.$ju_uraian.'%" '.$ju_detjenistrans.' AND 
                      tanggal between "'.tgl_indo6($_GET['tgl1']).'" AND "'.tgl_indo6($_GET['tgl2']).'" 
                    ORDER BY  
                      replid DESC';
                      // pr($s);
              $e=mysql_query($s);
              $n = mysql_num_rows($e);
              // pr($n);
              $out.='<table width="100%" class="isi">
                      <tr class="head">
                        <td width="12%" align="center">Tanggal</td>
                        <td width="18%" align="center">No. Jurnal/Jenis Bukti/No.Bukti</td>
                        <td align="center">Uraian</td>
                        <td align="center">Detail Transaksi</td>
                      <tr>';
              $totaset=0;
              if($n!=0){  
                while($r = mysql_fetch_assoc($e)){ 
                  $jDetTrans = getJenisTransaksi($r['detjenistransaksi']);
                  $s2 = ' SELECT *
                          FROM keu_jurnal 
                          WHERE transaksi ='.$r['replid'].'
                          ORDER BY jenisrekening ASC ';
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
                        $debit  =$r2['jenisrekening']=='d'?setuang($r2['nominal']):'-';
                        $kredit =$r2['jenisrekening']=='k'?setuang($r2['nominal']):'-';
                        $tb2.='<tr>
                                <td width="60%">'.getRekening($r2['detilrekening']).'</td>
                                <td width="20%" align="right">'.$debit.'</td>
                                <td width="20%" align="right">'.$kredit.'</td>
                              </tr>';
                      }$tb2.='</table>';
                  }$out.= '<tr>
                        <td width="12%" valign="top">'.tgl_indo5($r['tanggal']).'</td>
                        <td  width="18%" valign="top" style="font-weight:bold;">'.getNoKwitansi($r['replid']).'<br>'.$r['nobukti'].'</td>
                        <td  width="15%" valign="top">'.$r['uraian'].'</td>
                        <td width="55%">'.$tb2.'</td>
                      </tr>';
                }
              }else{ #kosong
                $out.= '<tr align="center">
                    <td  colspan=9 ><span style="color:red;text-align:center;">
                    ... data tidak ditemukan...</span></td></tr>';
              }$out.='</table>
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
  ?>