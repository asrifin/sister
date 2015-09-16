<?php
  sleep(1);
  session_start();
  require_once '../../lib/dbcon.php';
  require_once '../../lib/func.php';
  require_once '../../lib/pagination_class.php';
  require_once '../../lib/tglindo.php';
  require_once '../../lib/mpdf/mpdf.php';

  // $diskRegArr =  getFieldArr3('detaildiskon','psb_siswadiskon','','siswabiaya',649);
  // pr($diskRegArr);


  $mod  ='PSB';
  $mnu  = 'siswa';
  $mnu2 = 'siswaayah';
  $mnu3 = 'siswaibu';
  $mnu4 = 'siswawali';
  $mnu5 = 'siswakontakdarurat';
  $mnu6 = 'siswasaudara';
  $mnu7 = 'siswabiaya';
  
  $tb  = 'psb_'.$mnu;
  $tb2 = 'psb_'.$mnu2;
  $tb3 = 'psb_'.$mnu3;
  $tb4 = 'psb_'.$mnu4;
  $tb5 = 'psb_'.$mnu5;
  $tb6 = 'psb_'.$mnu6;
  $tb7 = 'psb_'.$mnu7;

  $upDir    = '../upload/';
  $fileDir  = $upDir.'files/';
  $imageDir = $upDir.'images/';

  $x     = $_SESSION['id_loginS'].$_GET['replid'];
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
        $replid = (isset($_GET['replid']) AND $_GET['replid']!='')?filter($_GET['replid']):'';
    
        // Title content
        $out.='<body>
                  <table  width="100%">
                    <tr>
                      <td width="43%">
                        <img width="100" src="../../images/logo.png" alt="" />
                      </td>
                      <td>
                        <b>'.$mnu.'</b>
                      </td>
                    </tr>
                  </table><br />';
        
        $out.='<table xstyle="background-color:red;" xclass="isi" width="100%">';
        $departemen  = getKriteriaSiswa('departemen',$replid);
        $tahunajaran = getKriteriaSiswa('tahunajaran',$replid);
        $gelombang   = getKriteriaSiswa('gelombang',$replid);
        $tingkat     = getKriteriaSiswa('tingkat',$replid);
        $subtingkat  = getKriteriaSiswa('subtingkat',$replid);
        $golongan    = getKriteriaSiswa('golongan',$replid);

        // kriteria siswa
        $out.='
            <tr class="head">
              <td colspan="3">Kriteria Siswa</td>
            </tr><tr>
              <td width="25%">Departemen</td>
              <td colspan="2">: '.$departemen.'</td>
            </tr><tr>x  
              <td width="25%">Tahun Ajaran</td>
              <td colspan="2">: '.$tahunajaran.' - '.($tahunajaran+1).'</td>
            </tr><tr>
              <td width="25%">Gelombang</td>
              <td colspan="2">: '.$gelombang.'</td>
            </tr><tr>
              <td width="25%">Tingkat</td>
              <td colspan="2">: '.$tingkat.'</td>
            </tr><tr>
              <td width="25%">Sub Tingkat</td>
              <td colspan="2">: '.$subtingkat.'</td>
            </tr><tr>
              <td width="25%">Golongan</td>
              <td colspan="2">: '.$golongan.'</td>
            </tr><tr>
              <td colspan="3">&nbsp;</td>
            </tr>';

        // Biaya siswa
        $s7=['psb_siswabiaya.replid','psb_biaya.biaya','psb_detailbiaya.replid detailbiaya','psb_biaya.isAngsur','psb_biaya.isDiskon','psb_biaya.jenistagihan','psb_detailbiaya.nominal','psb_siswabiaya.angsuran','psb_siswabiaya.ketdiskonkhusus','psb_siswabiaya.diskonkhusus'];
        $j7[]=['psb_detailbiaya',$tb7,'replid','detailbiaya'];
        $j7[]=['psb_biaya','psb_detailbiaya','replid','biaya'];
        $r7=getFieldArr3($s7,$tb7,$j7,'siswa',$replid);

        $out.='<tr xclass="head"><td colspan="3">Biaya Siswa</td>
        </tr><tr xstyle="background-color:green" >
          <td colspan="3">
            <table style="width:100%;background-color:grey">
              <tr class="head" >
                <td align="center">Item</td>
                <td align="center">Biaya Awal</td>
                <td align="center">Diskon Reguler</td>
                <td align="center">Diskon Khusus</td>
                <td align="center">Biaya Nett</td>
                <td align="center">Angsuran</td>
              </tr>';
              //9.600 - 2.800
              $cc='';
              foreach ($r7 as $i => $v) {
                $biayaAwal         = $v['nominal'];
                $diskRegArr        = getFieldArr3('detaildiskon','psb_siswadiskon','','siswabiaya',$v['replid']);
                $biayaAfterdiskReg = getBiayaDiskReg($v['detailbiaya'],$diskRegArr);
                $diskReg           = $biayaAwal - $biayaAfterdiskReg;
                $diskKhusus        = $v['diskonkhusus'];
                $biayaNett         = $biayaAwal - ($diskReg+$diskKhusus);
                $cc.=$diskReg.'<br />';
                $out.='<tr>
                  <td style="background-color:grey;color:white;">'.(empty($v['biaya'])?'-':$v['biaya']).'</td>
                  <td align="right">'.(empty($biayaAwal)?'Rp. 0':setuang($biayaAwal)).'</td>
                  <td align="right">'.(empty($diskReg)?'Rp. 0':setuang($diskReg)).'</td>
                  <td align="right">'.(empty($diskKhusus)?'Rp. 0':setuang($diskKhusus)).'</td>
                  <td align="right">'.(empty($biayaNett)?'Rp. 0':setuang($biayaNett)).'</td>
                  <td align="center">'.(empty($v['angsuran'])?'-':$v['angsuran'].' x').'</td>
                </tr>';
              }
              // pr($cc);
            $out.='</table>
          </td>
        </tr>
        <tr><td colspan="3">&nbsp;</td></tr>';


        // bioadata siswa
        $r=getField('*',$tb,'replid',$replid);
        $photosiswa = $imageDir.$r['photosiswa'];
        $out.='
            <tr class="head">
              <td colspan="3">Biodata Siswa</td>
            </tr><tr>
              <td width="25%">No. Pendaftaran</td>
              <td>: '.(empty($r['nopendaftaran'])?'-':getNoPendaftaran2($_GET['replid'])).'</td>
              <td rowspan="7" align="right"><img height="150" src="'.$photosiswa.'" alt="" /></td>
            </tr><tr>
              <td >Nama</td>
              <td>: '.(empty($r['namasiswa'])?'-':$r['namasiswa']).' ('.(empty($r['panggilansiswa'])?'-':$r['panggilansiswa']).')</td>
            </tr><tr>
              <td>NIS</td>
              <td>: '.(empty($r['nis'])?'-':$r['nis']).'</td>
            </tr><tr>
              <td>NISN</td>
              <td>: '.(empty($r['nisn'])?'-':$r['nisn']).'</td>
            </tr><tr>
              <td>Jenis Kelamin</td>
              <td>: '.(empty($r['jkelaminsiswa'])?'-':$r['jkelaminsiswa']=='L'?'Laki - laki':'Perempuan').'</td>
            </tr><tr>
              <td>Tempat / Tanggal Lahir</td>
              <td>: '.(empty($r['tempatlahirsiswa'])?'-':$r['tempatlahirsiswa']).' / '.tgl_indo5((empty($r['tanggallahirsiswa'])?'-':$r['tanggallahirsiswa'])).'</td>
            </tr><tr>
              <td>Warga Negara</td>
              <td>: '.(empty($r['warganegarasiswa'])?'-':$r['warganegarasiswa']).'</td>
            </tr><tr>
              <td>sukusiwa</td>
              <td>: '.(empty($r['sukusiswa'])?'-':getField('suku','psb_suku','replid',$r['sukusiswa'])).'</td>
            </tr><tr>
              <td>Agama</td>
              <td colspan="2">: '.(empty($r['agamasiswa'])?'-':getField('agama','psb_agama','replid',$r['agamasiswa'])).'</td>
            </tr><tr>
              <td>Bahasa</td>
              <td colspan="2">: '.(empty($r['bahasasiswa1'])?'-':$r['bahasasiswa1']).' & '.(empty($r['bahasasiswa2'])?'-':$r['bahasasiswa2']).'</td>
            </tr><tr>
              <td>HP</td>
              <td colspan="2">: '.(empty($r['hpsiswa'])?'-':$r['hpsiswa']).'</td>
            </tr><tr>
              <td>Telpon</td>
              <td colspan="2">: '.(empty($r['telponsiswa'])?'-':$r['telponsiswa']).'</td>
            </tr><tr>
              <td>Email</td>
              <td colspan="2">: '.(empty($r['emailsiswa'])?'-':$r['emailsiswa']).'</td>
            </tr><tr>
              <td>pin BBM</td>
              <td colspan="2">: '.(empty($r['pinBBM'])?'-':$r['pinBBM']).'</td>
            </tr><tr>
              <td>Alamat</td>
              <td colspan="2">: '.(empty($r['alamatsiswa'])?'-':$r['alamatsiswa']).'</td>
            </tr><tr>
              <td>Kota</td>
              <td colspan="2">: '.(empty($r['kotasiswa'])?'-':$r['kotasiswa']).'</td>
            </tr><tr>
              <td>Kode Pos</td>
              <td colspan="2">: '.(empty($r['kodepos'])?'-':$r['kodepos']).'</td>
            </tr><tr>
              <td>Berat Badan</td>
              <td colspan="2">: '.(empty($r['beratsiswea'])?'-':$r['beratsiswea']).'</td>
            </tr><tr>
              <td>Tinggi Badan</td>
              <td colspan="2">: '.(empty($r['tinggisiswa'])?'-':$r['tinggisiswa']).'</td>
            </tr><tr>
              <td>Golongan Darah</td>
              <td colspan="2">: '.(empty($r['darahsiswa'])?'-':$r['darahsiswa']).'</td>
            </tr><tr>
              <td>Penyakit</td>
              <td colspan="2">: '.(empty($r['penyakitsiswa'])?'-':$r['penyakitsiswa']).'</td>
            </tr><tr>
              <td>Catatan Kesehatan</td>
              <td colspan="2">: '.(empty($r['catatankesehatansiswa'])?'-':$r['catatankesehatansiswa']).'</td>
            </tr><tr>
              <td>Diasuh Oleh</td>
              <td colspan="2">: '.(empty($r['diasuh'])?'-':$r['diasuh']).'</td>
            </tr><tr>
              <td>Sekolah Asal</td>
              <td colspan="2">: '.(empty($r['sekolahasalsiswa'])?'-':$r['sekolahasalsiswa']).'</td>
            </tr><tr>
              <td>Kota Asal Sekolah</td>
              <td colspan="2">: '.(empty($r['kotasekolahasal'])?'-':$r['kotasekolahasal']).'</td>
            </tr><tr>
              <td>Negara Sekolah Asal</td>
              <td colspan="2">: '.(empty($r['negarasekolahasalsiswa'])?'-':$r['negarasekolahasalsiswa']).'</td>
            </tr><tr>
              <td>Penyakit</td>
              <td colspan="2">: '.(empty($r['penyakitsiswa'])?'-':$r['penyakitsiswa']).'</td>
            </tr><tr>
              <td colspan="3">&nbsp;</td>
            </tr>
            ';

            // bioadata ayah
            $r2=getField('*',$tb2,'siswa',$replid);
            $out.='<tr class="head">
              <td colspan="3">Biodata Ayah</td>
            </tr><tr>
              <td >Nama</td>
              <td colspan="2">: '.(empty($r2['namaayah'])?'-':$r2['namaayah']).'</td>
            </tr><tr>
              <td>Tempat / Tanggal Lahir</td>
              <td colspan="2">: '.(empty($r2['tempatlahirayah'])?'-':$r2['tempatlahirayah']).' / '.tgl_indo5((empty($r2['tempatlahirayah'])?'-':$r2['tempatlahirayah'])).'</td>
            </tr><tr>
              <td >Warga Negara</td>
              <td colspan="2">: '.(empty($r2['warganegaraayah'])?'-':$r2['warganegaraayah']).'</td>
            </tr><tr>
              <td >Agama</td>
              <td colspan="2">: '.(empty($r2['agamaayah'])?'-':getField('agama','psb_agama','replid',$r2['agamaayah'])).'</td>
            </tr><tr>
              <td >Gereja</td>
              <td colspan="2">: '.(empty($r2['gerejaayah'])?'-':$r2['gerejaayah']).'</td>
            </tr><tr>
              <td >HP </td>
              <td colspan="2">: '.(empty($r2['hpayah'])?'-':$r2['hpayah']).'</td>
            </tr><tr>
              <td >Telpon</td>
              <td colspan="2">: '.(empty($r2['telponayah'])?'-':$r2['telponayah']).'</td>
            </tr><tr>
              <td >Email</td>
              <td colspan="2">: '.(empty($r2['emailayah'])?'-':$r2['emailayah']).'</td>
            </tr><tr>
              <td >Pin BBM</td>
              <td colspan="2">: '.(empty($r2['pinbbayah'])?'-':$r2['pinbbayah']).'</td>
            </tr><tr>
              <td >Alamat</td>
              <td colspan="2">: '.(empty($r2['alamatayah'])?'-':$r2['alamatayah']).'</td>
            </tr><tr>
              <td >Kota </td>
              <td colspan="2">: '.(empty($r2['kotaayah'])?'-':$r2['kotaayah']).'</td>
            </tr><tr>
              <td >Kode Pos</td>
              <td colspan="2">: '.(empty($r2['kodeposayah'])?'-':$r2['kodeposayah']).'</td>
            </tr><tr>
              <td >Fax Rumah</td>
              <td colspan="2">: '.(empty($r2['faxrumahayah'])?'-':$r2['faxrumahayah']).'</td>
            </tr><tr>
              <td >Pendidikan</td>
              <td colspan="2">: '.(empty($r2['pendidikanayah'])?'-':$r2['pendidikanayah']).'</td>
            </tr><tr>
              <td >Bidang Pekerjaan</td>
              <td colspan="2">: '.(empty($r2['bidangpekerjaanayah'])?'-':$r2['bidangpekerjaanayah']).'</td>
            </tr><tr>
              <td >Pekerjaan</td>
              <td colspan="2">: '.(empty($r2['pekerjaanayah'])?'-':$r2['pekerjaanayah']).'</td>
            </tr><tr>
              <td >Posisi</td>
              <td colspan="2">: '.(empty($r2['posisiayah'])?'-':$r2['posisiayah']).'</td>
            </tr><tr>
              <td >Penghasilan</td>
              <td colspan="2">: '.(empty($r2['penghasilanayah'])?'-':setuang($r2['penghasilanayah'])).'</td>
            </tr><tr>
              <td >Telpon Kantor</td>
              <td colspan="2">: '.(empty($r2['telponkantorayahayah'])?'-':$r2['telponkantorayahayah']).'</td>
            </tr><tr>
              <td >Fax Kantor</td>
              <td colspan="2">: '.(empty($r2['faxkantorayah'])?'-':$r2['faxkantorayah']).'</td>
            </tr><tr>
              <td >Alamat Kantor</td>
              <td colspan="2">: '.(empty($r2['alamatkantorayah'])?'-':$r2['alamatkantorayah']).'</td>
            </tr><tr>
              <td >Kode Pos </td>
              <td colspan="2">: '.(empty($r2['kodeposayah'])?'-':$r2['kodeposayah']).'</td>
            </tr><tr>
              <td colspan="3">&nbsp;</td>
            </tr>';

            // bioadata ibu
            $r3=getField('*',$tb3,'siswa',$replid);
            $out.='<tr class="head">
              <td colspan="3">Biodata Ibu</td>
            </tr><tr>
              <td >Nama</td>
              <td colspan="2">: '.(empty($r3['namaibu'])?'-':$r3['namaibu']).'</td>
            </tr><tr>
              <td>Tempat / Tanggal Lahir</td>
              <td colspan="2">: '.(empty($r3['tempatlahiribu'])?'-':$r3['tempatlahiribu']).' / '.tgl_indo5((empty($r3['tempatlahiribu'])?'-':$r3['tempatlahiribu'])).'</td>
            </tr><tr>
              <td >Warga Negara</td>
              <td colspan="2">: '.(empty($r3['warganegaraibu'])?'-':$r3['warganegaraibu']).'</td>
            </tr><tr>
              <td >Agama</td>
              <td colspan="2">: '.(empty($r3['agamaibu'])?'-':getField('agama','psb_agama','replid',$r3['agamaibu'])).'</td>
            </tr><tr>
              <td >Gereja</td>
              <td colspan="2">: '.(empty($r3['gerejaibu'])?'-':$r3['gerejaibu']).'</td>
            </tr><tr>
              <td >HP </td>
              <td colspan="2">: '.(empty($r3['hpibu'])?'-':$r3['hpibu']).'</td>
            </tr><tr>
              <td >Telpon</td>
              <td colspan="2">: '.(empty($r3['telponibu'])?'-':$r3['telponibu']).'</td>
            </tr><tr>
              <td >Email</td>
              <td colspan="2">: '.(empty($r3['emailibu'])?'-':$r3['emailibu']).'</td>
            </tr><tr>
              <td >Pin BBM</td>
              <td colspan="2">: '.(empty($r3['pinbbibu'])?'-':$r3['pinbbibu']).'</td>
            </tr><tr>
              <td >Alamat</td>
              <td colspan="2">: '.(empty($r3['alamatibu'])?'-':$r3['alamatibu']).'</td>
            </tr><tr>
              <td >Kota </td>
              <td colspan="2">: '.(empty($r3['kotaibu'])?'-':$r3['kotaibu']).'</td>
            </tr><tr>
              <td >Kode Pos</td>
              <td colspan="2">: '.(empty($r3['kodeposibu'])?'-':$r3['kodeposibu']).'</td>
            </tr><tr>
              <td >Fax Rumah</td>
              <td colspan="2">: '.(empty($r3['faxrumahibu'])?'-':$r3['faxrumahibu']).'</td>
            </tr><tr>
              <td >Pendidikan</td>
              <td colspan="2">: '.(empty($r3['pendidikanibu'])?'-':$r3['pendidikanibu']).'</td>
            </tr><tr>
              <td >Bidang Pekerjaan</td>
              <td colspan="2">: '.(empty($r3['bidangpekerjaanibu'])?'-':$r3['bidangpekerjaanibu']).'</td>
            </tr><tr>
              <td >Pekerjaan</td>
              <td colspan="2">: '.(empty($r3['pekerjaanibu'])?'-':$r3['pekerjaanibu']).'</td>
            </tr><tr>
              <td >Posisi</td>
              <td colspan="2">: '.(empty($r3['posisiibu'])?'-':$r3['posisiibu']).'</td>
            </tr><tr>
              <td >Penghasilan</td>
              <td colspan="2">: '.(empty($r3['penghasilanibu'])?'-':setuang($r3['penghasilanibu'])).'</td>
            </tr><tr>
              <td >Telpon Kantor</td>
              <td colspan="2">: '.(empty($r3['telponkantoribuibu'])?'-':$r3['telponkantoribuibu']).'</td>
            </tr><tr>
              <td >Fax Kantor</td>
              <td colspan="2">: '.(empty($r3['faxkantoribu'])?'-':$r3['faxkantoribu']).'</td>
            </tr><tr>
              <td >Alamat Kantor</td>
              <td colspan="2">: '.(empty($r3['alamatkantoribu'])?'-':$r3['alamatkantoribu']).'</td>
            </tr><tr>
              <td >Kode Pos </td>
              <td colspan="2">: '.(empty($r3['kodeposibu'])?'-':$r3['kodeposibu']).'</td>
            </tr><tr>
              <td colspan="3">&nbsp;</td>
            </tr>';

            // bioadata wali murid
            $r4=getField('*',$tb4,'siswa',$replid);
            $out.='<tr class="head">
              <td colspan="3">Biodata Wali</td>
            </tr><tr>
              <td >Nama</td>
              <td colspan="2">: '.(empty($r4['namawali'])?'-':$r4['namawali']).'</td>
            </tr><tr>
              <td >Jenis Kelamin</td>
              <td colspan="2">: '.(empty($r4['jkelaminwali'])?'-':$r4['jkelaminwali']=='L'?'Laki - laki':'Perempuan').'</td>
            </tr><tr>
              <td >Alamat</td>
              <td colspan="2">: '.(empty($r4['alamatwali'])?'-':$r4['alamatwali']).'</td>
            </tr><tr>
              <td >Kota </td>
              <td colspan="2">: '.(empty($r4['kotawali'])?'-':$r4['kotawali']).'</td>
            </tr><tr>
              <td >HP / Telpon</td>
              <td colspan="2">: '.(empty($r4['telponwali'])?'-':$r4['telponwali']).'</td>
            </tr><tr><td colspan="3">&nbsp;</td></tr>
            <tr><td colspan="3">&nbsp;</td></tr>';

            // bioadata Kontak darurat
            $r5=getFieldArr2('*',$tb5,'siswa',$replid);
            $out.='<tr xclass="head"><td colspan="3">Biodata Kontak Darurat</td>
            </tr><tr xstyle="background-color:green" >
              <td colspan="3">
                <table style="width:100%;background-color:grey">
                  <tr class="head" >
                    <td>Nama</td>
                    <td>Hubungan</td>
                    <td>Telpon1</td>
                    <td>Telpon2</td>
                    </tr>';
                    if(count($r5)==0) $out.='<tr><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td></tr>';
                    else{
                      foreach ($r5 as $i => $v) {
                        $out.='<tr>
                          <td>'.(empty($v['namakontakdarurat'])?'-':$v['namakontakdarurat']).'</td>
                          <td>'.(empty($v['hubkontakdarurat'])?'-':$v['hubkontakdarurat']).'</td>
                          <td>'.(empty($v['telponkontakdarurat1'])?'-':$v['telponkontakdarurat1']).'</td>
                          <td>'.(empty($v['telponkontakdarurat2'])?'-':$v['telponkontakdarurat2']).'</td>
                        </tr>';
                      }
                    }
                $out.='</table>
              </td>
            </tr>
            <tr><td colspan="3">&nbsp;</td></tr>';

            // bioadata saudara siswa
            $r6=getFieldArr2('*',$tb6,'siswa',$replid);
            $out.='<tr xclass="head"><td colspan="3">Biodata Saudara</td>
            </tr><tr xstyle="background-color:green" >
              <td colspan="3">
                <table style="width:100%;background-color:grey">
                  <tr class="head" >
                    <td>Nama</td>
                    <td>Jenis Kelamin</td>
                    <td>Tempat / Tgl. Lahir</td>
                    <td>Sekolah</td>
                    <td>Grade</td>
                    </tr>';
                    if(count($r6)==0) $out.='<tr><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td><td align="center">-</td></tr>';
                    else{
                      foreach ($r6 as $i => $v) {
                        $out.='<tr>
                          <td>'.(empty($v['namasaudara'])?'-':$v['namasaudara']).'</td>
                          <td>'.(empty($v['jkelaminsaudara'])?'-':($v['jkelaminsaudara']=='L'?'Laki-Laki':'Perempuan')).'</td>
                          <td>'.(empty($v['tempatlahirsaudara'])?'-':$v['tempatlahirsaudara']).'</td>
                          <td>'.(empty($v['sekolahsaudara'])?'-':$v['sekolahsaudara']).'</td>
                          <td>'.(empty($v['gradesaudara'])?'-':$v['gradesaudara']).'</td>
                        </tr>';
                      }
                    }
                $out.='</table>
              </td>
            </tr><tr>
              <td colspan="3">&nbsp;</td>
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
?>