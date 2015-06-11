<?php
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/mpdf/mpdf.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/func.php';

  // $x     = $_SESSION['id_loginS'].$_GET['departemenS'].$_GET['prosesS'].$_GET['kelompokS'];
  $x     = $_SESSION['id_loginS'];
  $token = base64_encode($x);

  if(!isset($_SESSION)){ // login 
    echo 'user has been logout';
  }else{ // logout
    if(!isset($_GET['token']) and $token!==$_GET['token']){
      echo 'maaf token - url tidak valid';
    }else{
        // $ss = 'SELECT *  from sar_lokasi where replid='.$_GET['g_lokasiS'];
        // $ee = mysql_query($ss);
        // $rr = mysql_fetch_assoc($ee);
          // sleep(1);
          ob_start(); // digunakan untuk convert php ke html
          $out='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml">
              <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>SISTER::PSB - Pendataan</title>
              </head>

              <body>
                <p align="center">
                  <b>
                    Pendataan Calon Siswa<br>
                  </b>
                </p>
  
                    ';
                // <table class="isi" width="100%">
                //     <tr class="head">
                //       <td align="center">Kode</td>
                //       <td align="center">Grup Barang</td>
                //       <td align="center">Jumlah Unit</td>
                //       <td align="center">Unit Tersedia</td>
                //       <td align="center">Unit Dipinjam</td>
                //       <td align="center">Total Aset</td>
                //       <td align="center">Keterangan</td>
                //     </tr>
                    $departemen = isset($_GET['departemenS'])?filter(trim($_GET['departemenS'])):'';
                    $proses     = isset($_GET['prosesS'])?filter(trim($_GET['prosesS'])):'';
                    $kelompok   = isset($_GET['kelompokS'])?filter(trim($_GET['kelompokS'])):'';

                    $s = 'SELECT 
                            t.replid,
                            d.nama departemen,
                            p.proses proses,
                            k.kelompok kelompok,
                            t.nopendaftaran nopendaftaran,
                            t.status statusx,
                            t.nama as nama_siswa,
                            if(t.kelamin="L","Laki-Laki","Perempuan") jk,
                            t.tmplahir temp_lahir,
                            t.tgllahir tgl_lahir,
                            pa.agama agama,
                            t.alamat,
                            t.telpon telepon,
                            t.darah goldarah,
                            t.kesehatan penyakit,
                            t.ketkesehatan alergi,
                            t.photo2 photo2,

                            ta.nama as nama_ayah,
                            ta.warga as kebangsaan_ayah,
                            ta.tmplahir as temp_lahir_ayah,
                            ta.tgllahir as tgl_lahir_ayah,
                            ta.pekerjaan as pekerjaan_ayah,
                            ta.telpon as telepon_ayah,
                            ta.pinbb as pinbb_ayah,
                            ta.email as email_ayah,
                            ti.nama as nama_ibu,
                            ti.warga as kebangsaan_ibu,
                            ti.tmplahir as temp_lahir_ibu,
                            ti.tgllahir as tgl_lahir_ibu,
                            ti.pekerjaan as pekerjaan_ibu,
                            ti.telpon as telepon_ibu,
                            ti.pinbb as pinbb_ibu,
                            ti.email as email_ibu,

                            tkel.kakek_nama kakek,
                            tkel.nenek_nama nenek,
                            tkel.tglnikah tgl_perkawinan,

                            ts.nama nama_saudara,
                            ts.tgllahir tgl_lahir_saudara,
                            ts.sekolah sekolah_saudara,

                            tk.nama as nama_darurat,
                            tk.hubungan as hubungan,
                            tk.telpon as nomor_darurat
                          from 
                            psb_calonsiswa t
                            LEFT JOIN mst_agama pa ON t.agama = pa.replid
                            LEFT JOIN psb_calonsiswa_ayah ta ON ta.calonsiswa = t.replid
                            LEFT JOIN psb_calonsiswa_ibu ti ON ti.calonsiswa = t.replid
                            LEFT JOIN psb_calonsiswa_kontakdarurat tk ON tk.calonsiswa = t.replid
                            LEFT JOIN psb_calonsiswa_keluarga tkel ON tkel.calonsiswa = t.replid
                            LEFT JOIN psb_calonsiswa_saudara ts ON tkel.calonsiswa = t.replid
                            LEFT JOIN psb_kelompok k ON k.replid = t.kelompok
                            LEFT JOIN psb_proses p ON p.replid = k.proses
                            LEFT JOIN departemen d ON d.replid = p.departemen
                          WHERE 
                            t.replid ' ;
                            // t.kelompok = '.$departemen.' AND
                            // k.proses = '.$proses.' AND
                            // p.departemen = '.$kelompok.' AND
                    // print_r($s);exit();
                     // var_dump($s);exit();
                    $e = mysql_query($s) or die(mysql_error());
                    $n = mysql_num_rows($e);
                     // var_dump($n);exit();
                   
                    $nox = 1;
                    if($n==0){
                      $out.='<table>
                                  <tr>
                                      <td colspan="2"><b>Data Pribadi Siswa :</b></td>
                                  </tr>
                                  <tr>
                                      <td>Nama</td>
                                      <td class="span3">: <span id="nama_siswaTD"></span></td>
                                      <input type="hidden" id="photo2H"/>
                                      <td rowspan="6"> <img width="150" id="previmg" src="../img/no_image.jpg" ><br></td>
                                  </tr>
                                  <tr>
                                      <td>Jenis kelamin</td>
                                      <td>: <span id="jkTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Tempat lahir</td>
                                      <td>: <span id="temp_lahirTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Tanggal lahir</td>
                                      <td>: <span id="tgl_lahirTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Agama</td>
                                      <td>: <span id="agamaTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Alamat rumah</td>
                                      <td>: <span id="alamatTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Telepon rumah</td>
                                      <td>: <span id="teleponTD"></span></td>
                                  </tr>

                                  <tr>
                                      <td><b>Kesehatan Siswa   :</b></td>
                                      <td></td>
                                  </tr>
                                  <tr>
                                      <td>Golongan Darah</td>
                                      <td>: <span id="goldarahTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Penyakit yang pernah diderita</td>
                                      <td>: <span id="penyakitTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Alergi terhadap</td>
                                      <td>: <span id="alergiTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td></td>
                                      <td></td>
                                  </tr>

                                  <tr>
                                      <td colspan="2"><b>Data Orantua Siswa :</b></td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td class="span4">Ayah</td>
                                      <td>Ibu</td>
                                  </tr>
                                  <tr>
                                      <td>Nama</td>
                                      <td>: <span id="nama_ayahTD"></span></td>
                                      <td><span id="nama_ibuTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Kebangsaan</td>
                                      <td>: <span id="kebangsaan_ayahTD"></span></td>
                                      <td><span id="kebangsaan_ibuTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Tempat lahir</td>
                                      <td>: <span id="temp_lahir_ayahTD"></span></td>
                                      <td><span id="temp_lahir_ibuTD"></span></td>
                                  </tr>

                                  <tr>
                                      <td>Tanggal lahir</td>
                                      <td>: <span id="tgl_lahir_ayahTD"></span></td>
                                      <td><span id="tgl_lahir_ibuTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Pekerjaan</td>
                                      <td>: <span id="pekerjaan_ayahTD"></span></td>
                                      <td><span id="pekerjaan_ibuTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Telepon Orantua</td>
                                      <td>: <span id="telepon_ayahTD"></span></td>
                                      <td><span id="telepon_ibuTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>PIN BB Orantua</td>
                                      <td>: <span id="pinbb_ayahTD"></span></td>
                                      <td><span id="pinbb_ibuTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Email Orantua</td>
                                      <td>: <span id="email_ayahTD"></span></td>
                                      <td><span id="email_ibuTD"></span></td>
                                  </tr>

                                  <tr>
                                      <td colspan="2"><b>Data Keluarga Siswa :</b></td>
                                  </tr>
                                  <tr>
                                      <td>Tanggal perkawinan Orantua</td>
                                      <td>: <span id="tgl_perkawinanTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Nama Kakek</td>
                                      <td>: <span id="kakekTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Nama Nenek</td>
                                      <td>: <span id="nenekTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td></td>
                                      <td></td>
                                  </tr>

                                  <tr>
                                      <td colspan="2"><b>Saudara Siswa :</b></td>
                                  </tr>
                                  <tr>
                                      <td>Nama Saudara</td>
                                      <td>: <span id="nama_saudaraTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Tanggal lahir Saudara</td>
                                      <td>: <span id="tgl_lahir_saudaraTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Sekolah Saudara</td>
                                      <td>: <span id="sekolah_saudaraTD"></span></td>
                                  </tr>
                                  //Nomor yang dapat dihubungi
                                  <tr>
                                      <td colspan="2"><b>Dalam Kondisi Mendesak, orang yang dapat dihubungi (selain orang tua) :</b></td>
                                  </tr>
                                  <tr>
                                      <td>Nama</td>
                                      <td>: <span id="nama_daruratTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Hubungan</td>
                                      <td>: <span id="hubunganTD"></span></td>
                                  </tr>
                                  <tr>
                                      <td>Nomor yang dapat dihubungi</td>
                                      <td>: <span id="nomor_daruratTD"></span></td>
                                  </tr>
                                </table>';
                    }else{
                      while ($r=mysql_fetch_assoc($e)) {
                        $out.='<table>
                                  <tr>
                                      <td>Departemen</td>
                                      <td class="span6">: '.$r['departemen'].'</td>
                                      <td class="place-right"><button data-hint="Cetak" onclick="printPDF(\'pendataan\');"><span class="icon-printer"></span></button></td>
                                  </tr>
                                  <tr>
                                      <td>Proses Penerimaan</td>
                                      <td>: '.$r['proses'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Kelompok calon siswa</td>
                                      <td>: '.$r['kelompok'].'</td>
                                  </tr>
                                  <tr>
                                      <td>No. Pendaftaran</td>
                                      <td>: '.$r['nopendaftaran'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Status</td>
                                      <td>: '.$r['statusx'].'</td>
                                  </tr>
                                  <tr>
                                      <td></td>
                                      <td></td>
                                  </tr>
                                  <tr>
                                      <td colspan="2"><b>Data Pribadi Siswa :</b></td>
                                  </tr>
                                  <tr>
                                      <td>Nama</td>
                                      <td class="span3">: '.$r['nama_siswa'].'</td>
                                      <td rowspan="6"><img width="120" src="../img/'.($rr['photo2']==''? 'no_image.jpg':'upload/'.$rr['photo2']).'" alt="" /></td>
                                      <td rowspan="6"><img width="120" src="../img/no_image.jpg"></td>
                                  </tr>
                                  <tr>
                                      <td>Jenis kelamin</td>
                                      <td>: '.$r['jk'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Tempat lahir</td>
                                      <td>: '.$r['temp_lahir'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Tanggal lahir</td>
                                      <td>: '.$r['tgl_lahir'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Agama</td>
                                      <td>: '.$r['agama'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Alamat rumah</td>
                                      <td>: '.$r['alamat'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Telepon rumah</td>
                                      <td>: '.$r['telepon'].'</td>
                                  </tr>
                                  <tr>
                                      <td></td>
                                      <td></td>
                                  </tr>

                                  <tr>
                                      <td><b>Kesehatan Siswa  :</b></td>
                                      <td>:</td>
                                  </tr>
                                  <tr>
                                      <td>Golongan Darah</td>
                                      <td>: '.$r['goldarah'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Penyakit yang pernah diderita</td>
                                      <td>: '.$r['penyakit'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Alergi terhadap</td>
                                      <td>: '.$r['alergi'].'</td>
                                  </tr>
                                  <tr>
                                      <td></td>
                                      <td></td>
                                  </tr>
                                  <tr>
                                      <td colspan="2"><b>Data Orang tua Siswa :</b></td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp;</td>
                                      <td class="span4">&nbsp&nbspAyah</td>
                                      <td>Ibu</td>
                                  </tr>
                                  <tr>
                                      <td>Nama</td>
                                      <td>: '.$r['nama_ayah'].'</td>
                                      <td> '.$r['nama_ibu'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Kebangsaan</td>
                                      <td>: '.$r['kebangsaan_ayah'].'</td>
                                      <td> '.$r['kebangsaan_ibu'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Tempat lahir</td>
                                      <td>: '.$r['temp_lahir_ayah'].'</td>
                                      <td> '.$r['temp_lahir_ibu'].'</td>
                                  </tr>

                                  <tr>
                                      <td>Tanggal lahir</td>
                                      <td>: '.$r['tgl_lahir_ayah'].'</td>
                                      <td> '.$r['tgl_lahir_ibu'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Pekerjaan</td>
                                      <td>: '.$r['pekerjaan_ayah'].'</td>
                                      <td> '.$r['pekerjaan_ibu'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Telepon Orantua</td>
                                      <td>: '.$r['telepon_ayah'].'</td>
                                      <td>'.$r['telepon_ibu'].'</td>
                                  </tr>
                                  <tr>
                                      <td>PIN BB Orantua</td>
                                      <td>: '.$r['pinbb_ayah'].'</td>
                                      <td> '.$r['pinbb_ibu'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Email Orantua</td>
                                      <td>: '.$r['email_ayah'].'</td>
                                      <td> '.$r['email_ibu'].'</td>
                                  </tr>
                                  <tr>
                                      <td></td>
                                      <td></td>
                                  </tr>

                                  <tr>
                                      <td colspan="2"><b>Data Keluarga Siswa :</b></td>
                                  </tr>
                                  <tr>
                                      <td>Tanggal perkawinan Orantua</td>
                                      <td>: '.$r['tgl_perkawinan'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Nama Kakek</td>
                                      <td>: '.$r['kakek_nama'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Nama Nenek</td>
                                      <td>: '.$r['nenek_nama'].'</td>
                                  </tr>
                                  <tr>
                                      <td>&nbsp</td>
                                      <td>&nbsp</td>
                                  </tr>

                                  <tr>
                                      <td colspan="2"><b>Saudara Siswa :</b></td>
                                  </tr>
                                  <tr>
                                      <td>Nama Saudara</td>
                                      <td>: '.$r['nama_saudara'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Tanggal lahir Saudara</td>
                                      <td>: '.$r['tgl_lahir_saudara'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Sekolah Saudara</td>
                                      <td>: '.$r['sekolah_saudara'].'</td>
                                  </tr>

                                  <tr>
                                      <td colspan="2"><b>Dalam Kondisi Mendesak, orang yang dapat dihubungi (selain orang tua) :</b></td>
                                  </tr>
                                  <tr>
                                      <td>Nama</td>
                                      <td>: '.$r['nama_darurat'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Hubungan</td>
                                      <td>: '.$r['hubungan'].'</td>
                                  </tr>
                                  <tr>
                                      <td>Nomor yang dapat dihubungi</td>
                                      <td>: '.$r['nomor_darurat'].'</td>
                                  </tr>
                                </table>';
                        $nox++;
                      }
                    }
            // $out.='</table>';
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