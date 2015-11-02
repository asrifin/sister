<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/func.php';
  require_once '../../lib/pagination_class.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/mpdf/mpdf.php';

  // pr($_GET);
  $mod   ='PSB';
  $x     = $_SESSION['id_loginS'].$_GET['idsiswabiayaTB'].$_GET['idpenerimaansiswa'];
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
          <title>SISTER::'.$mod.' - '.$mnu.'</title>
        </head>';
        // $replid = (isset($_GET['replid']) AND $_GET['replid']!='')?filter($_GET['replid']):'';
        $idpenerimaansiswa = (isset($_GET['idpenerimaansiswa']) AND $_GET['idpenerimaansiswa']!='')?filter($_GET['idpenerimaansiswa']):'';
        $idsiswabiaya = (isset($_GET['idsiswabiayaTB']) AND $_GET['idsiswabiayaTB']!='')?filter($_GET['idsiswabiayaTB']):'';
        $s = 'SELECT
                p.nominal,
                p.tanggal,
                b.biaya,
                s.namasiswa
              FROM
                keu_penerimaansiswa p
                JOIN psb_siswabiaya sb ON sb.replid = p.siswabiaya
                JOIN psb_detailbiaya db ON db.replid = sb.detailbiaya
                JOIN psb_biaya b ON b.replid = db.biaya
                JOIN psb_siswa s ON s.replid = sb.siswa
              WHERE
                p.replid = '.$idpenerimaansiswa;
        $e = mysql_query($s);
        $r = mysql_fetch_assoc($e);
        // pr($r);
        // Title content
        $out.='<body>
                  <table  width="100%">
                    <tr>
                      <td xwidth="50%">
                        <img width="120" src="../../images/logo2.png" alt="" />
                      </td>
                      <td>
                        <b>ELYON CHRISTIAN SCHOOL </b><br />
                        <small>
                          Jl. Raya Sukomanunggal Jaya No. 33 A Surabaya 60187 <br />
                          Telp. (031) 732 5999 | fax. (031) 734 5464 <br />
                          Jl. Raya Kali Rungkut No.5 Ruko Rungkut Megah Raya A-25 Surabaya 60293 <br />
                          Telp. (031) 879 8896 | fax. (031) 879 8896 <br />
                          www.elyon.sch.id | info@elyon.sch.id 
                        </small>
                      <hr />
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="right">No. Kwitansi : '.kwitansiPenerimaanSiswa($idpenerimaansiswa).'</td>
                    </tr>
                    <tr>
                      <td>Sudah terima dari </td>
                      <td>: '.$r['namasiswa'].' </td>
                    </tr>
                    <tr>
                      <td>Sebanyak </td>
                      <td>: '.Terbilang($r['nominal']).' Rupiah </td>
                    </tr>
                    <tr>
                      <td>Untuk  </td>
                      <td>: Pembayaran '.$r['biaya'].' </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="right">Surabaya, '.tgl_indo8($r['tanggal']).'  </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="right">ttd  </td>
                    </tr>
                    <tr>
                      <td>Terbilang </td>
                      <td>: '.setuang($r['nominal']).' </td>
                    </tr>
                  </table>';
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
?>