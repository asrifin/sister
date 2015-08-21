<script src="controllers/c_pendataan.js"></script>
<script src="../js/base64.js"></script>

<h4 style="color:white;">Pendataan Calon Siswa</h4>
<div id="loadarea"></div>

<button onclick="switchPN('form','');" data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button onclick="switchPN('view','');"  data-hint="Lihat Data" id="lihatBC" style="display:none;"><span class="icon-list"></span> </button>
<button onclick="cariFC();" data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div style="display:none;" class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select  onchange="cmbkelompok('filter',$(this).val(),'');"  class="cari" data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select onchange="viewTB();" class="cari" data-hint="Kelompok" name="kelompokS" id="kelompokS"></select>
</div>

<!-- panel 1 : view table -->
<table id="pendataanTBL" class="table hovered bordered striped panelx" >
    <thead>
        <tr style="color:white;" class="info">
            <th class="text-center" rowspan="2">No Pendaftaran</th>
            <th class="text-center" rowspan="2">Nama</th>
            <th class="text-center" rowspan="2">Tingkat</th>
            <th class="text-center" rowspan="2">Registration Fee</th>
            <th class="text-center" colspan="3">Discount</th>
            <th class="text-center" rowspan="2">Registration Fee(Net)</th>
            <th class="text-center" rowspan="2">Bayar</th>
            <th class="text-center" rowspan="2">Aksi</th>
        </tr>
        <tr style="color:white;" class="info">
            <!-- <th class="text-center">Subsidi</th> -->
            <th class="text-center">Saudara</th>
            <th class="text-center">Tunai</th>
            <th class="text-center">Angsuran</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="nopendaftaranS" name="nopendaftaranS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ...." id="namaS" name="namaS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ...." id="tingkatS" name="tingkatS"></div></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
        </tr>
    </thead>
    <tbody id="tbody"></tbody>
</table>

<!-- panel 2 : form (edit || add ) -->
<div class=" panelx" id="pendataanFR" style="display:none;" >
  <div style="background-color:#dddddd;overflow:scroll;height:550px;" >
    <form autocomplete="off" enctype="multipart/form-data" onsubmit="siswaSV();return false;" id="siswa_form"> 
      <input id="idformH" type="hidden"> 
        <!-- Panel -->
          <div class="panel">
            <div class="panel-header bg-lightBlue fg-white">Kriteria Calon</div>
              <div class="panel-content">
                <div class="grid">     
                  <div class="row">

                  <!-- grup biodata -->
                    <div class="span6"> <!-- kolom kiri -->
                    <!-- calon siswa -->
                      <b> Calon Siswa</b>
                      <label>Tahun Ajaran :</label>
                      <div class="input-control select size3">
                        <select onchange="getBiaya();" required id="prosesTB" name="prosesTB"></select>
                      </div>
                      <label>Kelompok :</label>
                      <div class="input-control select size3">
                        <input type="hidden" name="nopendaftaranH" id="nopendaftaranH">
                        <select onchange="getNoPendaftaran(this);" required id="kelompokTB" name="kelompokTB"></select>
                        <!-- <select onchange="getBiaya();" required id="kelompokTB" name="kelompokTB"></select> -->
                      </div>
                      <label>Tingkat :</label>
                      <div class="input-control select size3">
                        <select onchange="getBiaya();" required id="tingkatTB" name="tingkatTB"></select>
                      </div>

                      <label>Golongan :</label>
                      <div class="input-control select size3">
                        <select  onchange="getBiaya();" required  id="golonganTB" name="golonganTB"></select>
                      </div>
                      <input type="hidden" id="setbiayaTB" name="setbiayaTB">

                    </div>
                      
                    <!-- grup pembayaran  -->
                    <div class="span6"> <!-- kolom kanan  -->
                      <!-- tabel pembayaran  -->
                      <table width="100%" class="table hovered bordered">
                        <tr class="fg-white bg-blue">
                          <th width="70%" colspan="2">Pembayaran</th>
                          <th width="30%">Nominal</th>
                        </tr>
                        <tr>
                          <td colspan="2">Registration Fee</td>
                          <td align="right" id="registrationTD">Rp. 0</td>
                        </tr>
                        <tr>
                          <td width="30%" >Jumlah Angsuran</td>
                          <td  width="40%" align="right">
                            <div class="input-control select">
                              <select required onchange="getDiscAngsuran();" id="angsuranTB" name="angsuranTB"></select>
                            </div>
                          </td>
                          <td  width="30%"rowspan="5"></td>
                        </tr>
                        <tr>
                          <td width="30%" >Diskon Angsuran</td>
                          <td  width="40%" id="discangsuranTD" align="right"></td>
                        </tr>
                        <tr>
                          <td width="30%" >Diskon Subsidi</td>
                          <td  width="40%" align="right">
                            <div class="input-control text">
                              <input id="discsubsidiTB" onkeyup="getDiscTotal();" name="discsubsidiTB" placeholder="diskon subsidi" type="text" onfocus="inputuang(this);" class="text-right" value="Rp. 0">
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>Diskon Saudara</td>
                          <td align="right">
                            <div class="input-control text">
                              <input id="discsaudaraTB" onkeyup="getDiscTotal();" name="discsaudaraTB" placeholder="diskon saudara" type="text" onfocus="inputuang(this);" class="text-right" value="Rp. 0">
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>Diskon Tunai</td>
                          <td align="right">
                            <div class="input-control select">
                              <select onchange="getDiscTunai()" name="disctunaiTB" id="disctunaiTB">
                                <option value="">-Pilih Diskon-</option>
                              </select>
                            </div>
                            <div id="disctunai2TD">Rp. 0</div>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2" align="right">Total Diskon :</td>
                          <td align="right" id="disctotalTD">Rp. 0</td>
                        </tr>
                        <tr class="bg-lightTeal" >
                          <td colspan="2"  >Registration Fee (Net) :</td>
                          <td align="right" id="registrationnetTD">Rp. 0</td>
                        </tr>
                        <tr class="bg-lightTeal" >
                          <td colspan="2"  >Material Fee (@semester) :</td>
                          <td align="right" id="materialTD">Rp. 0</td>
                        </tr>
                        <tr class="bg-lightTeal" >
                          <td colspan="2"  >Tuition Fee(@bulan) :</td>
                          <td align="right" id="tuitionTD">Rp. 0</td>
                        </tr>

                      </table>

                    </div>
                  </div>

                </div>
              </div>
            </div>

            <div class="panel">
              <div class="panel-header bg-lightBlue fg-white">Data Pribadi Siswa</div>
                <div class="panel-content">
                  <div class="grid">     
                    <div class="row">

                      <div class="span6">
                        <label>Nomor Pendaftaran</label>
                        <div class="input-control text size4">
                            <input readonly placeholder="No Pendaftaran" type="text" name="nopendaftaranTB" id="nopendaftaranTB">
                        </div>
                        
                        <label>Nama Lengkap</label>
                        <div class="input-control text size5">
                            <input required placeholder="Nama Lengkap" type="text" name="namaTB" id="namaTB">
                            <button class="btn-clear"></button>
                        </div>

                        <label>Jenis Kelamin</label>
                        <div class="input-control radio">
                        <label>
                            <input required type="radio" value="L" name="jkTB"/>
                            <span class="check"></span>
                            Laki-Laki
                        </label>
                        </div>

                        <div class="input-control radio">
                        <label>
                            <input  required  type="radio" value="P" name="jkTB"/>
                            <span class="check"></span>
                            Perempuan
                        </label>
                        </div>

                        <label>Tempat Lahir</label>
                        <div class="input-control text size3">
                            <input placeholder="Tempat Lahir" type="text" name="tempatlahirTB" id="tempatlahirTB">
                        </div>

                        <label>Tanggal Lahir</label>
                        <div class="input-control text size2" data-role="datepicker" placeholder="tanggal lahir"
                            data-format="dd mmmm yyyy"
                            data-effect="slide">
                            <input id="tgllahiranakTB" name="tgllahiranakTB" type="text">
                            <button class="btn-date"></button>
                        </div>

                        <label>Agama</label>
                        <div class="input-control select size3">
                            <select id="agamaTB" name="agamaTB"></select>
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
                        <div class="input-control text size2" data-role="datepicker" placeholder="tanggal lahir"
                            data-format="dd mmmm yyyy"
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
                            <input placeholder="Email" type="email" name="email_ayahTB" id="email_ayahTB">
                            <!-- <input placeholder="Email" type="text" name="email_ayahTB" id="email_ayahTB"> -->
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
                        <div class="input-control text size2" data-role="datepicker" placeholder="tanggal lahir"
                            data-format="dd mmmm yyyy"
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
                            <input placeholder="Email" type="email" name="email_ibuTB" id="email_ibuTB">
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

                      <!-- grup foto siswa -->
                      <div class="span6">
                          <label><b>Foto Siswa :</b></label>
                             <img width="150" id="previmg2" src="../img/no_image.jpg" >
                             <div class="input-control file info-state size5" data-role="input-control" >
                             <input type="hidden" name="photoH" id="photoH"/>
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
                    </div>
                
                </div>
              </div>
            </div>
          
            <div class="form-actions"> &nbsp;
              <button class="button primary">simpan</button>&nbsp;
              <a id="batalBC" class="button" href="#">Batal</a> 
            </div>
      
          </form>
        </div>
      </div>