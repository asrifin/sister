<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';
  $mod   ='PSB';
  $mnu   = 'Calon Siswa';
  $x     = $_SESSION['id_loginS'].$_GET['replid'];
  $token = base64_encode($x);
  // var_dump($token);exit();
  // var_dump($$_GET['token']);exit();

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
          $replid = (isset($_GET['replid']) AND $_GET['replid']!='')?filter($_GET['replid']):'';
      
        // table content
        $s = 'SELECT 
              /* Data  Siswa*/
              c.*,
              if(c.kelamin="L","Laki-laki","Perempuan")kelamin,
              c.nama namaSiswa,
              
              /* pembayaran*/
              b.material,
              b.tuition,
              b.registration,
              
              /* Data Ortu*/
              a.nama namaAyah,
              a.warga kebangsaanAyah,
              a.tmplahir tmplahirAyah,
              a.tgllahir tgllahirAyah,
              a.pekerjaan pekerjaanAyah,
              a.telpon telponAyah,
              a.pinbb pinbbAyah,
              a.email emailAyah,
              i.nama namaIbu,
              i.warga kebangsaanIbu,
              i.tmplahir tmplahirIbu,
              i.tgllahir tgllahirIbu,
              i.pekerjaan pekerjaanIbu,
              i.telpon telponIbu,
              i.pinbb pinbbIbu,
              i.email emailIbu,
              
              /* Data Ortu*/
              d.nama namaDarurat,
              d.hubungan,
              d.telpon telponDarurat,

              /* kakek nenek*/
              k.kakek_nama namaKakek,
              k.nenek_nama namaNenek
           FROM psb_calonsiswa c 
              LEFT JOIN psb_calonsiswa_ayah a ON a.calonsiswa = c.replid
              LEFT JOIN psb_calonsiswa_ibu i ON i.calonsiswa = c.replid
              LEFT JOIN psb_calonsiswa_kontakdarurat d ON d.calonsiswa = c.replid
              LEFT JOIN psb_calonsiswa_keluarga k ON k.calonsiswa = c.replid
              LEFT JOIN psb_setbiaya b ON b.replid = c.setbiaya
           WHERE 
            c.replid='.$replid;
// var_dump($s);exit();
          $e = mysql_query($s) or die(mysql_error());
          $n = mysql_num_rows($e);
          $out.='<body>
                    <table width="100%">
                      <tr>
                        <td width="43%">
                          <img width="100" src="../../images/logo.png" alt="" />
                        </td>
                        <td>
                          <b>'.$mnu.'</b>
                        </td>
                      </tr>
                    </table><br />';
            $r=mysql_fetch_assoc($e);
            $out.='<table xclass="isi" width="100%">';
            
            $proses   = getProses('tahunajaran',$r['kelompok']);
            $kelompok = getKelompok ('kelompok',$r['kelompok']);
            $kriteria = getField('tingkat','aka_tingkat','replid',$r['tingkat']);
            $golongan = getField('golongan','psb_golongan','replid',$r['golongan']);
            // var_dump($proses);exit();
            // bioadata siswa
              $out.='
                  <tr class="head">
                    <td colspan="3">Kriteria Siswa</td>
                  </tr><tr>
                    <td width="20%">Tahun Ajaran</td>
                    <td>: '.$proses.'</td>
                  </tr><tr>
                    <td width="20%">Kelompok</td>
                    <td>: '.$kelompok.'</td>
                  </tr><tr>
                    <td width="20%">Kriteria</td>
                    <td>: '.$kriteria.'</td>
                  </tr><tr>
                    <td width="20%">Golongan</td>
                    <td>: '.$golongan.'</td>
                  </tr>';
              // Pembayaran 
              $out.='
                  <tr class="head">
                    <td colspan="3">Pembayaran</td>
                  </tr><tr>
                    <td width="20%">Registration Fee</td>
                    <td>: '.setuang(getBiayaNet('registration',$r['replid'])).' ('.($r['angsuran']==1?'cash':$r['angsuran'].'x angsuran').')</td>
                  </tr><tr>
                    <td width="20%">Material Fee</td>
                    <td>: '.setuang(getBiaya('material',$r['replid'])).'</td>
                  </tr><tr>
                    <td width="20%">Tuition Fee</td>
                    <td>: '.setuang(getBiaya('tuition',$r['replid'])).'</td>
                  </tr>';
              // bio data calon siswa
              $out.='
                  <tr class="head">
                    <td colspan="3">Biodata Siswa</td>
                  </tr><tr>
                    <td width="20%">No. Pendaftaran</td>
                    <td>: '.getNoPendaftaran($replid,$r['kelompok'])['akhir'].'</td>
                    <td align="right" rowspan="5"><img height="120" src="../img/upload/'.$r['photo'].'" alt="" /></td>
                  </tr><tr>
                    <td width="20%">Nama Lengkap</td>
                    <td>: '.$r['nama'].'</td>
                  </tr><tr>
                    <td width="20%">Jenis Kelamin</td>
                    <td>: '.$r['kelamin'].'</td>
                  </tr><tr>
                    <td width="20%">Tempat, Tgl Lahir</td>
                    <td>: '.$r['tmplahir'].', '.tgl_indo8($r['tgllahir']).'</td>
                  </tr><tr>
                    <td width="20%">Agama</td>
                    <td>: '.getAgama($r['agama']).'</td>
                  </tr><tr>
                    <td width="20%">Alamat</td>
                    <td colspan="2">: '.$r['alamat'].'</td>
                  </tr><tr>
                    <td width="20%">No. telp</td>
                    <td colspan="2">: '.$r['telpon'].'</td>
                  </tr><tr>
                    <td width="20%">Asal Sekolah</td>
                    <td colspan="2">: '.$r['sekolahasal'].'</td>
                  </tr><tr>
                    <td width="20%">Golongan Darah</td>
                    <td colspan="2">: '.$r['darah'].'</td>
                  </tr><tr>
                    <td width="20%">Penyakit</td>
                    <td colspan="2">: '.$r['kesehatan'].'</td>
                  </tr><tr>
                    <td width="20%">Catatan kesehatan</td>
                    <td colspan="2">: '.$r['ketkesehatan'].'</td>
                  </tr>

                  ';
              $out.='
                  <tr class="head">
                    <td colspan="3">Keluarga</td>
                  </tr><tr>
                    <td width="20%">Ayah</td>
                    <td colspan="2">: '.$r['namaAyah'].'</td>
                  </tr><tr>
                    <td width="20%">Kebangasaan Ayah</td>
                    <td colspan="2">: '.$r['warga'].'</td>
                  </tr><tr>
                    <td width="20%">Tempat. Tg Lahir Ayah</td>
                    <td colspan="2">: '.$r['tmplahir'].', '.tgl_indo8($r['tgllahirAyah']).'</td>
                  </tr><tr>
                    <td width="20%">Pekerjaan Ayah</td>
                    <td colspan="2">: '.$r['pekerjaanAyah'].'</td>
                  </tr><tr>
                    <td width="20%">No. Telpon Ayah</td>
                    <td colspan="2">: '.$r['telponAyah'].'</td>
                  </tr><tr>
                    <td width="20%">Pin BB Ayah</td>
                    <td colspan="2">: '.$r['pinbbAyah'].'</td>
                  </tr><tr>
                    <td width="20%">Email Ayah</td>
                    <td colspan="2">: '.$r['emailAyah'].'</td>
                  </tr>

                  <tr>
                    <td width="20%">Ibu</td>
                    <td colspan="2">: '.$r['namaIbu'].'</td>
                  </tr><tr>
                    <td width="20%">Kebangasaan Ibu</td>
                    <td colspan="2">: '.$r['warga'].'</td>
                  </tr><tr>
                    <td width="20%">Tempat. Tg Lahir Ibu</td>
                    <td colspan="2">: '.$r['tmplahir'].', '.tgl_indo8($r['tgllahirIbu']).'</td>
                  </tr><tr>
                    <td width="20%">Pekerjaan Ibu</td>
                    <td colspan="2">: '.$r['pekerjaanIbu'].'</td>
                  </tr><tr>
                    <td width="20%">No. Telpon Ibu</td>
                    <td colspan="2">: '.$r['telponIbu'].'</td>
                  </tr><tr>
                    <td width="20%">Pin BB Ibu</td>
                    <td colspan="2">: '.$r['pinbbIbu'].'</td>
                  </tr><tr>
                    <td width="20%">Email Ibu</td>
                    <td colspan="2">: '.$r['emailIbu'].'</td>
                  </tr>

                  <tr>
                    <td width="20%">Kakek</td>
                    <td colspan="2">: '.$r['namaKakek'].'</td>
                  </tr><tr>
                    <td width="20%">Nenek</td>
                    <td colspan="2">: '.$r['namaNenek'].'</td>
                  </tr>';

              $out.='<tr class="head">
                    <td colspan="3" width="20%">Kontak Darurat (Selain Orang Tua)</td>
                  </tr><tr>
                    <td width="20%">Nama</td>
                    <td colspan="2">: '.$r['namaDarurat'].'</td>
                  </tr><tr>
                    <td width="20%">Hubungan </td>
                    <td colspan="2">: '.$r['hubungan'].'</td>
                  </tr><tr>
                    <td width="20%">Telpon</td>
                    <td colspan="2">: '.$r['telponDarurat'].'</td>
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