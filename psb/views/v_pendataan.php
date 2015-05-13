
<script src="controllers/c_pendataan.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>
 -->
 <!--  <script type="../js/metro/metro-scroll.js"></script> -->
<h4 style="color:white;">Pendataan Calon Siswa</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select class="cari" data-hint="Tahun Ajaran" name="prosesS" id="prosesS"></select>
</div>
<div class="input-control select span3">
    <select class="cari" data-hint="Kelompok" name="kelompokS" id="kelompokS"></select>
</div>

<table id="pendataanTBL" style="display:visible;" class="table hovered bordered striped panelx" >
    <thead>
        <tr style="color:white;" class="info">
            <th class="text-left" rowspan="2">Nomor Pendaftaran</th>
            <th class="text-left" rowspan="2">Nama</th>
            <th class="text-left" rowspan="2">Uang Pangkal</th>
            <th class="text-center" colspan="3">Discount</th>
            <th class="text-right" rowspan="2">Denda</th>
            <th class="text-left" rowspan="2">Uang Pangkal Net</th>
            <th class="text-left">Angsuran</th>
            <th class="text-left" rowspan="2">Aksi</th>
        </tr>
        <tr style="color:white;" class="info">
            <th class="text-right">Subsidi</th>
            <th class="text-right">Saudara</th>
            <th class="text-right">Tunai</th>
            <th>x bulan</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <!-- <th class="text-left"></th> -->
            <th class="text-left"><input class="cari" placeholder="no pendaftaran" id="nopendaftaranS" name="nopendaftaranS"></th>
            <!-- <th class="text-left"><input placeholder="tglpendaftaran" id="tglpendaftaranS" name="tglpendaftaranS"></th> -->
            <th class="text-left"><input class="cari" placeholder="nama" id="namaS" name="namaS"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>

      <div class="table hovered bordered striped panelx" id="pendataanFR" style="display:none;" >
          <div style="overflow:scroll;height:600px;" >
                  <form autocomplete="off" enctype="multipart/form-data" onsubmit="siswaSV();return false;" id="siswa_form"> 
                        <input id="idformH" type="hidden"> 
                        <!-- Panel -->
                        <div class="panel">
                          <div class="panel-header bg-lightBlue fg-white">
                          Kriteria Calon
                          </div>
                          <div class="panel-content">

                          <div class="grid">     
                            <div class="row">
                              <div class="span6">
                              <!-- <label><b>Kriteria Calon :</b></label> -->
                              <label>Kriteria calon :</label>
                              <div class="input-control select size3">
                                  <!-- <input type="hidden" name="setbiayaH" id="setbiayaH"> -->
                                  <!-- <input type="hidden" name="kriteriaH" id="kriteriaH"> -->
                                  <select id="kriteriaTB" name="kriteriaTB">
                                    <!-- <option>Value 1</option> -->
                                  </select>
                              </div>

                              <label>Golongan :</label>
                              <div class="input-control select size3">
                                  <!-- <input type="text" name="golonganH" id="golonganH"> -->
                                  <select id="golonganTB" name="golonganTB">
                                    <!-- <option>Value 1</option> -->
                                  </select>
                              </div>
                              
                              <label><b>Sumbangan :</b></label>
                              <label>Uang Pangkal</label>
                              <div class="input-control text size3">
                                  <!-- <input type="text" onclick="inputuang(this);" name="uang_pangkalTB" id="uang_pangkalTB"> -->
                                  <input readonly type="text" name="uang_pangkalTB" id="uang_pangkalTB">
                                  <button class="btn-clear"></button>
                              </div>
                              
                              <label>Uang Pangkal net</label>
                              <div class="input-control text size3">
                                  <input type="hidden" onclick="inputuang(this);" name="uang_pangkalnetH" id="uang_pangkalnetH">
                                  <input readonly type="text" name="uang_pangkalnetTB" id="uang_pangkalnetTB">
                                  <button class="btn-clear"></button>
                              </div>
                              <label>Joining Fee</label>
                              <div class="input-control text size3">
                                  <input type="hidden" onclick="inputuang(this);" name="joiningH" id="joiningH">
                                  <input readonly type="text" name="joiningTB" id="joiningTB">
                                  <button class="btn-clear"></button>
                              </div>

                              <label><b>Angsuran :</b></label>
                              <label>Lama Angsuran :</label>
                              <div class="input-control select size3">
                                  <input type="hidden" name="angsuranH" id="angsuranH">
                                  <select id="angsuranTB" name="angsuranTB">
                                    <!-- <option>Value 1</option> -->
                                  </select>
                              </div>
                              <label>Angusuran per Bulan</label>
                              <div class="input-control text size2">
                                  <input type="text" value="0" name="angsuranbulanTB" id="angsuranbulanTB">
                                  <button class="btn-clear"></button>
                              </div>

                              <label><b>Uang Sekolah :</b></label>
                              <label>Uang Sekolah per Bulan</label>
                              <div class="input-control text size3">
                                  <input readonly type="text" name="sppTB" id="sppTB">
                                  <button class="btn-clear"></button>
                              </div>

                              </div>
                                <!-- End Span-->
                              
                              <div class="span6">
                                <label><b>Discount:</b></label>
                                <label>Discount Subsidi :</label>
                                <div class="input-control text size3">
                                    <input type="text" value="0" placeholder="Diskon Subsidi" name="diskon_subsidiTB" id="diskon_subsidiTB">
                                    <button class="btn-clear"></button>
                                </div>                                

                                <label>Discount Saudara :</label>
                                <div class="input-control text size3">
                                    <input type="text" value="0" placeholder="Diskon Saudara" name="diskon_saudaraTB" id="diskon_saudaraTB">
                                    <button class="btn-clear"></button>
                                </div>                                

                                <label>Discount tunai :</label>
                                <div class="input-control select size2">
                                  <input type="hidden" name="diskon_tunaiH" id="diskon_tunaiH">
                                  <select id="diskon_tunai" name="diskon_tunai">
                                  </select>
                              </div>
                                <div class="input-control text size3">
                                    <input readonly type="text" value="0" name="diskon_tunaiTB" id="diskon_tunaiTB">
                                    <button class="btn-clear"></button>
                                </div>                                

                                <label><b>Total Discount :</b></label>
                                <div class="input-control text size3">
                                    <input readonly type="text" name="diskon_totalTB" id="diskon_totalTB">
                                    <button class="btn-clear"></button>
                                </div>                                

                                <label><b>Denda :</b></label>
                                <label>Denda keterlambatan</label>
                                <div class="input-control text size3">
                                    <input type="text" name="dendaTB" id="dendaTB">
                                    <button class="btn-clear"></button>
                                </div>                                

                              </div>
                                <!-- End span-->

                            </div>
                          </div>
                                <!-- End Grid-->
                        </div>
                    </div>
                            <!-- End Panel -->

                        <!-- Panel Data Siswa-->
                        <div class="panel">
                          <div class="panel-header bg-lightBlue fg-white">
                          Data Pribadi Siswa
                          </div>
                          <div class="panel-content">

                      <div class="grid">     
                        <div class="row">
                          <div class="span6">

                        <label>Nomor Pendaftaran</label>
                        <div class="input-control text size4">
                            <input placeholder="No Pendaftaran" type="text" name="nopendaftaranTB" id="nopendaftaranTB">
                        </div>
                        
                        <label>Nama Lengkap</label>
                        <div class="input-control text size5">
                            <input placeholder="Nama Lengkap" type="text" name="namaTB" id="namaTB">
                            <button class="btn-clear"></button>
                        </div>

                        <label>Jenis Kelamin</label>
                        <div class="input-control radio">
                        <label>
                            <input type="radio" value="L" name="jkTB" id="jkTB" />
                            <span class="check"></span>
                            Laki-Laki
                        </label>
                        </div>

                        <div class="input-control radio">
                        <label>
                            <input type="radio" value="P" name="jkTB" id="jkTB" />
                            <span class="check"></span>
                            Perempuan
                        </label>
                        </div>

                        <label>Tempat Lahir</label>
                        <div class="input-control text size3">
                            <input placeholder="Tempat Lahir" type="text" name="tempatlahirTB" id="tempatlahirTB">
                        </div>

                        <label>Tanggal Lahir</label>
                        <div class="input-control text size2" data-role="datepicker"
                            // data-date="2014-10-23"
                            data-format="yyyy-mm-dd"
                            data-effect="slide">
                            <input id="tgllahiranakTB" name="tgllahiranakTB" type="text">
                            <button class="btn-date"></button>
                        </div>

                        <label>Agama</label>
                        <div class="input-control select size3">
                            <input type="hidden" name="agamaH" id="agamaH">
                            <select id="agamaTB" name="agamaTB">
                              <!-- <option>Kristen</option> -->
                            </select>
                        </div>
                        
                        <label>Alamat rumah</label>
                        <div class="input-control textarea size4">
                            <textarea id="alamatsiswaTB" name="alamatsiswaTB"></textarea>
                        </div>

                        <label>Nomor telpon</label>
                        <div class="input-control text size4">
                            <input placeholder="Nomor telpon" type="text" name="telpsiswaTB" id="telpsiswaTB">
                        </div>

                        <label>Asal SeKolah</label>
                        <div class="input-control text size5">
                            <input placeholder="Asal Sekolah" type="text" name="asalsekolahTB" id="asalsekolahTB">
                        </div>

                        <!-- Data Ayah -->
                        <label><b>Data Ayah Siswa</b></label>
                        <label>Nama Ayah</label>
                        <div class="input-control text size3">
                            <input placeholder="Nama Ayah" type="text" name="ayahTB" id="ayahTB">
                        </div>
                        
                        <label>Kebangsaan</label>
                        <div class="input-control text size5">
                            <input placeholder="Kebangsaan" type="text" name="kebangsaan_ayahTB" id="kebangsaan_ayahTB">
                            <button class="btn-clear"></button>
                        </div>

                        <label>Tempat Lahir</label>
                        <div class="input-control text size3">
                            <input placeholder="Tempat Lahir" type="text" name="tempatlahir_ayahTB" id="tempatlahir_ayahTB">
                        </div>

                        <label>Tanggal Lahir</label>
                        <div class="input-control text size2" data-role="datepicker"
                            data-format="yyyy-mm-dd"
                            data-effect="slide">
                            <input id="tgllahir_ayahTB" name="tgllahir_ayahTB" type="text">
                            <button class="btn-date"></button>
                        </div>
                      
                        <label>Pekerjaan :</label>
                        <div class="input-control textarea size4">
                            <textarea placeholder="Pekerjaan" id="pekerjaan_ayahTB" name="pekerjaan_ayahTB"></textarea>
                        </div>

                        <label>Nomor telpon :</label>
                        <div class="input-control text size4">
                            <input placeholder="Nomor telpon" type="text" name="telpayahTB" id="telpayahTB">
                        </div>

                        <label>Pin BB :</label>
                        <div class="input-control text size5">
                            <input placeholder="Pin BB" type="text" name="pinbb_ayahTB" id="pinbb_ayahTB">
                        </div>

                        <label>Email :</label>
                        <div class="input-control text size5">
                            <input placeholder="Email" type="text" name="email_ayahTB" id="email_ayahTB">
                        </div>

                        <!-- Data Ibu -->
                        <label><b>Data Ibu Siswa</b></label>
                        <label>Nama Ibu</label>
                        <div class="input-control text size3">
                            <input placeholder="Nama Ibu" type="text" name="ibuTB" id="ibuTB">
                        </div>
                        
                        <label>Kebangsaan</label>
                        <div class="input-control text size5">
                            <input placeholder="Kebangsaan" type="text" name="kebangsaan_ibuTB" id="kebangsaan_ibuTB">
                            <button class="btn-clear"></button>
                        </div>

                        <label>Tempat Lahir</label>
                        <div class="input-control text size3">
                            <input placeholder="Tempat Lahir" type="text" name="tempatlahir_ibuTB" id="tempatlahir_ibuTB">
                        </div>

                        <label>Tanggal Lahir</label>
                        <div class="input-control text size2" data-role="datepicker"
                            data-format="yyyy-mm-dd"
                            data-effect="slide">
                            <input id="tgllahir_ibuTB" name="tgllahir_ibuTB" type="text">
                            <button class="btn-date"></button>
                        </div>
                      
                        <label>Pekerjaan :</label>
                        <div class="input-control textarea size4">
                            <textarea placeholder="Pekerjaan" id="pekerjaan_ibuTB" name="pekerjaan_ibuTB"></textarea>
                        </div>

                        <label>Nomor telpon :</label>
                        <div class="input-control text size4">
                            <input placeholder="Nomor telpon" type="text" name="telpibuTB" id="telpibuTB">
                        </div>

                        <label>Pin BB :</label>
                        <div class="input-control text size5">
                            <input placeholder="Pin BB" type="text" name="pinbb_ibuTB" id="pinbb_ibuTB">
                        </div>

                        <label>Email :</label>
                        <div class="input-control text size5">
                            <input placeholder="Email" type="text" name="email_ibuTB" id="email_ibuTB">
                        </div>

                        <label><b>Data Keluarga (Opsional) :</b></label>
                        <label>Nama Kakek :</label>
                        <div class="input-control text size5">
                            <input placeholder="Kakek" type="text" name="kakekTB" id="kakekTB">
                        </div>

                        <label>Nama Nenek :</label>
                        <div class="input-control text size5">
                            <input placeholder="Nenek" type="text" name="nenekTB" id="nenekTB">
                        </div>

                        </div>
                        <!-- End span -->

                        <div class="span6">
                            <label><b>Foto Siswa :</b></label>
                               <img width="150" id="previmg" src="../img/no_image.jpg" >
                             <div class="input-control file info-state size5" data-role="input-control" >
                               <input type="hidden" id="photoH"/>
                               <div id="photoDV" class="input-control file" data-role="input-control">
                               <input onchange="PreviewImage(this);" id="photoTB" name="photoTB" type="file">
                               <button class="btn-file"></button>
                            </div>
                        </div>

                        <label><b>Riwayat Kesehatan Siswa :</b></label>
                        <label>Golongan Darah :</label>
                        <div class="input-control select size2">
                            <select id="goldarahTB" name="goldarahTB">
                              <option value="-">-</option>
                              <option value="O">O</option>
                              <option value="A">A</option>
                              <option value="B">B</option>
                              <option value="AB">AB</option>
                            </select>
                        </div>

                        <label>Penyakit yang pernah diderita :</label>
                        <div class="input-control textarea size4">
                            <textarea id="penyakitTB" name="penyakitTB"></textarea>
                        </div>

                        <label>Catatan kesehatan</label>
                        <div class="input-control textarea size4">
                            <textarea id="catatan_kesehatanTB" name="catatan_kesehatanTB"></textarea>
                        </div>

                        <label><b>Kontak Darurat (selain Orang Tua) :</b></label>
                        <label>Nama :</label>
                        <div class="input-control text size5">
                            <input placeholder="Nama" type="text" name="nama_kontakTB" id="nama_kontakTB">
                        </div>

                        <label>Hubungan :</label>
                        <div class="input-control text size5">
                            <input placeholder="Hubungan" type="text" name="hubunganTB" id="hubunganTB">
                        </div>

                        <label>Nomor yang dapat dihubungi :</label>
                        <div class="input-control text size5">
                            <input placeholder="Nomor" type="text" name="nomorTB" id="nomorTB">
                        </div>
                        <!-- <label>Data Saudara :</label> -->
                            <!-- <a href="#" data-hint="Tambah Saudara" id="saudaraBC" class="button"><span class="icon-plus-2"></span> Tambah Saudara</a> -->
<!--                         <div class="form-actions" id="tambahsdr" style="display:visible;"> 
                            <button data-hint="Tambah Saudara" xclass="large" id="tambahsdrBC">Tambah Saudara</button>
                        </div>        
 --><!--                         <div class="panel" id="cetak" style="display:none;">
                            <div class="panel-content">
                            <div class="grid">
                                <div class="row">
                                        <div class="input-control radio">
                                        <label>
                                            <input value="0" type="radio" name="saudaraTB" />
                                            <span class="check"></span>
                                            Satu Sekolah
                                        </label>
                                        </div>
                                        <div class="input-control radio">
                                        <label style="display:visible;">
                                            <input value="1" type="radio" name="saudaraTB"/>
                                            <span class="check"></span>
                                            Luar Sekolah
                                        </label>
                                        </div>
                                        <label></label>
                                        <div class="input-control text size5" id="saudara">
                                            <input placeholder="Saudara Satu Sekolah" type="text" name="nama_saudaraTB" id="nama_saudaraTB">
                                        </div>
                                        <div class="input-control text size5" style="display:none;" id="saudara2">
                                            <label>Nama Saudara</label>
                                            <input placeholder="Nama Saudara Luar Sekolah" type="text" name="nama_saudara2TB" id="nama_saudara2TB">
                                        </div>
                                        <div class="input-control text size5" style="display:none;" id="saudara2">
                                            <label>Sekolah Saudara</label>
                                            <input placeholder="Sekolah Saudara" type="text" name="sekolah_saudaraTB" id="sekolah_saudaraTB">
                                        </div>

                                        <table class="table hovered bordered striped">
                                            <thead>
                                                <tr style="color:white;"class="info">
                                                    <th class="text-left">Nama</th>
                                                    <th class="text-left">Sekolah</th>
                                                    <th class="text-left">Aksi</th>
                                                </tr>
                                            </thead>

                                            <tbody id="saudaraTBL">

                                            </tbody>

                                            <tfoot>
                                                
                                            </tfoot>
                                        </table>
                                </div> <!-- end row -->
                            <!-- </div>  -->
                            <!-- end grid -->

                            <!-- </div> -->
                        <!-- </div>  -->
                       <!-- end panel -->

                      </div>
                    </div>
                          <!-- End Grid -->
                     </div>
                        <!-- End Panel Data Siswa -->
                 </div>

                        <div class="form-actions"> &nbsp;
                            <button class="button primary">simpan</button>&nbsp;
                            <a class="button" href="#" onclick="switchPN(); return false;" >Batal</a> 
                            <!-- <button class="button" type="button" onclick="$.Dialog.close()">Batal</button>  -->
                        </div>
                    </form>
        </div>
              <!-- Akhir Scrollbar -->
    </div>