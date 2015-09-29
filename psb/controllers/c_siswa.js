var mnu   = 'siswa';
var mnu2  = 'departemen';
var mnu3  = 'tahunajaran';
var mnu4  = 'tingkat';
var mnu5  = 'golongan';
var mnu6  = 'angsuran'; 
var mnu7  = 'detaildiskon';
var mnu8  = 'detailgelombang';
var mnu9  = 'subtingkat';
var mnu10 = 'dokumen';
var mnu11 = 'agama';
var mnu12 = 'suku';

var dir   = 'models/m_'+mnu+'.php';
var dir2  = '../akademik/models/m_'+mnu2+'.php';
var dir3  = '../akademik/models/m_'+mnu3+'.php';
var dir4  = '../akademik/models/m_'+mnu4+'.php';
var dir5  = 'models/m_'+mnu5+'.php';
var dir6  = 'models/m_'+mnu6+'.php';
var dir7  = 'models/m_'+mnu7+'.php';
var dir8  = 'models/m_'+mnu8+'.php';
var dir9  = '../akademik/models/m_'+mnu9+'.php';
var dir10 = 'models/m_'+mnu10+'.php';
var dir11 = 'models/m_'+mnu11+'.php';
var dir12 = 'models/m_'+mnu12+'.php';
var subdokumen_contentFR =siswa_contentFR = status_contentFR='';

// main function ---
    $(document).ready(function(){
        cmbdepartemen('filter','');
        // siswa_contentFR +='<form id="formx" onfocus="$(this).scrollbar({height: 355,axis: \'y\'});" class="scrollbar" xstyle="overflow:scroll;height:560px;"  enctype="multipart/form-data" autocomplete="off" onsubmit="simpanSV(); return false;">' 
        status_contentFR+='<form id="statusFR" data-role="scrollbox" data-scroll="vertical" style="overflow:scroll;height:560px;" xstyle="height:300px;"  autocomplete="off" onsubmit="statusSV(); return false;">' 
                            +'<input type="hidden" name="idstatusTB" id="idstatusTB" />'
                            // no pendaftaran
                            +'<table class="table bordered striped">'
                                +'<tr>'
                                    +'<td>Departemen</td>'
                                    +'<td id="departemenTD"></td>'
                                +'</tr><tr>'
                                    +'<td>Tahun Ajaran</td>'
                                    +'<td id="tahunajaranTD"></td>'
                                +'</tr><tr>'
                                    +'<td>No. pendaftaran</td>'
                                    +'<td id="nopendaftaranTD"></td>'
                                +'</tr><tr>'
                                    +'<td>Nama</td>'
                                    +'<td id="namasiswaTD"></td>'
                                +'</tr><tr>'
                                    +'<td>Status</td>'
                                    +'<td id="statussiswaTD"></td>'
                                +'</tr>'
                            +'</table>'
                            //nis`
                            +'<label>NIS</label>'
                            +'<input type="number" placeholder="NIS" data-transform="input-control" xrequired id="nisTB" name="nisTB">'
                            // nisn
                            +'<label>NISN</label>'
                            +'<input type="number"  placeholder="NISN"  data-transform="input-control" xrequired id="nisnTB" name="nisnTB">'
                            
                            +'<div class="form-actions">' 
                                +'<button class="button primary">simpan</button>&nbsp;'
                            +'</div>'
                        +'</form>';

        subdokumen_contentFR+='<form enctype="multipart/form-data" id="subdokumenFR" data-role="scrollbox" data-scroll="vertical" style="overflow:scroll;height:560px;" xstyle="height:300px;"  autocomplete="off" onsubmit="subdokumenSV(); return false;">' 
                            +'<input type="hidden" id="siswaTB" name="siswaTB" />'
                            +'<input type="hidden" name="aksi" id="aksi" value="simpan" />'
                            +'<input type="hidden" name="subaksi" id="subaksi" value="siswadokumen"/>'
                            +'<table class="table">'
                                +'<tr>'
                                    +'<td>- Nama</td>'
                                    +'<td id="namasiswaDokTD"></td>'
                                +'</tr>'
                                +'<tr>'
                                    +'<td width="15%">- Departemen</td>'
                                    +'<td id="departemenDokTD"></td>'
                                +'</tr>'
                                +'<tr>'
                                    +'<td>- Tahun Ajaran</td>'
                                    +'<td id="tahunajaranDokTD"></td>'
                                +'</tr>'
                                +'<tr>'
                                    +'<td>- Gelombang</td>'
                                    +'<td id="detailgelombangDokTD"></td>'
                                +'</tr>'
                                +'<tr>'
                                    +'<td>- Tingkat</td>'
                                    +'<td id="tingkatDokTD"></td>'
                                +'</tr>'
                            +'</table>'
                            // no pendaftaran
                            +'<table class="table hovered bordered xstriped">'
                                +'<thead class="text-center bg-blue fg-white">'
                                    +'<tr>'
                                        +'<th></th>'
                                        +'<th>Dokumen</th>'
                                        +'<th>Jumlah</th>'
                                        +'<th>File <span class="fg-grey">[ max:1mb/pdf ]</span></th>'
                                        +'<th>View</th>'
                                    +'</tr>'
                                +'</thead>'
                                +'<tbody id="subdokumenTBL"></tbody>'
                            +'</table>'
                            +'<div class="form-actions">' 
                                +'<button id="siswadokBC" class="button primary">simpan</button>&nbsp;'
                            +'</div>'
                        +'</form>';

        siswa_contentFR +='<form id="siswaFR" data-role="scrollbox" data-scroll="vertical" style="overflow:scroll;height:560px;" xstyle="height:300px;"  enctype="multipart/form-data" autocomplete="off" onsubmit="siswaSV(); return false;">' 
                        +'<input type="hidden" name="idformTB" id="idformTB" />'
                        // accordion
                        +'<div class="accordion with-marker xspan3 xplace-left margin10" data-role="accordion" data-closeany="true">'
                            // kriteria
                            +'<div class="accordion-frame active">'
                                +'<a class="heading bg-red fg-white" href="#">Kriteria Siswa <sub>*wajib diisi</sub></a>'
                                +'<div  style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1
                                        +'<div class="span3">'
                                            // departemen
                                            +'<label>Departemen</label>'
                                            +'<select data-transform="input-control" required onchange="cmbdetailgelombang(\'form\',\'\'); getBiaya();" id="departemenTB" name="departemenTB"></select>'
                                            +'<sub class="fg-red place-right">*wajib diisi</sub>'
                                            // tahunajaran
                                            +'<label>Tahun Ajaran</label>'
                                            +'<select data-transform="input-control" required  onchange="cmbdetailgelombang(\'form\',\'\'); getBiaya();;" id="tahunajaranTB" name="tahunajaranTB"></select>'
                                            +'<sub class="fg-red place-right">*wajib diisi</sub>'
                                            // Detailgelombang
                                            +'<label>Detail Gelombang</label>'
                                            +'<select  data-transform="input-control" onchange=" getBiaya();" required id="detailgelombangTB" name="detailgelombangTB"><option value="">-silahkan pilih Dept. dan Tahun Ajaran dahulu-</option></select>'
                                            +'<sub class="fg-red place-right">*wajib diisi</sub>'
                                            // tingkat
                                            +'<label>Tingkat</label>'
                                            +'<select data-transform="input-control"  required onchange="cmbsubtingkat(\'form\',$(\'#tingkatTBZ\').val()); getBiaya();" id="tingkatTBZ" name="tingkatTB"></select>'
                                            +'<sub class="fg-red place-right">*wajib diisi</sub>'
                                            // subtingkat
                                            +'<label>Sub Tingkat</label>'
                                            +'<select  data-transform="input-control" onchange=" getBiaya();"  required id="subtingkatTB" name="subtingkatTB"></select>'
                                            +'<sub class="fg-red place-right">*wajib diisi</sub>'
                                            // golongan
                                            +'<label>Golongan</label>'
                                            +'<select data-transform="input-control"  onchange=" getBiaya();"  required id="golonganTBZ" name="golonganTBs"></select>'
                                            +'<sub class="fg-red place-right">*wajib diisi</sub>'
                                        +'</div>'
                                            
                                        // kolom2
                                        +'<div id="biayaDV" class="span7"></div>'
                                    +'</div>'
                                +'</div>'
                            +'</div>'
                            
                            // // bioadata Siswa
                            +'<div class="accordion-frame">'
                                +'<a class="heading bg-red fg-white" href="#">Biodata Siswa <sub>*wajib diisi</sub></a>'
                                +'<div style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1
                                        +'<div class="span4">'
                                            // nopendaftaran
                                            +'<label>No. Pendaftaran</label>'
                                            +'<input disabled type="text" data-transform="input-control" id="nopendaftaranTB" name="nopendaftaranTB">'
                                            // nama
                                            +'<label>Nama </label>'
                                            +'<input type="text" data-transform="input-control" required placeholder="nama" id="namasiswaTB" name="namasiswaTB">'
                                            +'<sub class="fg-red place-right">*wajib diisi</sub>'
                                            // panggilan
                                            +'<label>Nama Panggilan</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="nama panggilan" id="panggilansiswaTB" name="panggilansiswaTB">'
                                            // kelamin
                                            +'<label>Jenis Kelamin</label>'
                                            +'<select data-transform="input-control" xrequired id="jkelaminsiswaTB" name="jkelaminsiswaTB">'
                                                +'<option value="L">Laki</option>'
                                                +'<option value="P">Perempuan</option>'
                                            +'</select>'
                                            // tempat lahir
                                            +'<label>Tempat Lahir</label>'
                                            +'<input type="text" data-transform="input-control" xrequired placeholder="tempat lahir" id="tempatlahirsiswaTB" name="tempatlahirsiswaTB">'
                                            // tanggal lahir 
                                            +'<label>Tanggal lahir</label>'
                                            +'<div data-position="top" class="input-control text" data-role="datepicker"'
                                                +'data-format="dd mmmm yyyy"'
                                                +'data-effect="slide">'
                                                +'<input placeholder="tanggal lahir" xrequired id="tanggallahirsiswaTB" name="tanggallahirsiswaTB" type="text">'
                                                +'<button class="btn-date"></button>'
                                            +'</div>'
                                            // warga negara
                                            +'<label>Warga Negara</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="warganegara" id="warganegarasiswaTB" name="warganegarasiswaTB">'
                                            // suku
                                            +'<label>Suku</label>'
                                            +'<select data-transform="input-control" id="sukusiswaTB" name="sukusiswaTB"></select>'
                                            // agama
                                            +'<label>Agama</label>'
                                            +'<select data-transform="input-control" xrequired id="agamasiswaTB" name="agamasiswaTB"></select>'
                                            // bahasa
                                            +'<label>Bahasa</label>'
                                            +'<input type="text" data-transform="input-control"  xrequired placeholder="bahasa 1" id="bahasasiswa1TB" name="bahasasiswa1TB">'
                                            +'<input type="text" data-transform="input-control"  xrequired placeholder="bahasa 2" id="bahasasiswa2TB" name="bahasasiswa2TB">'
                                            // photo 
                                            +'<label>Pas Photo</label>'
                                            +'<input type="hidden"  id="photosiswa2TB" name="photosiswa2TB"/>'
                                            +'<input type="file" tipe="image" onchange="preUpload(this);" data-transform="input-control" id="photosiswaTB" name="photosiswaTB"/>'
                                        +'</div>'
                                            
                                        // kolom2
                                        +'<div class="span4">'
                                            // HP
                                            +'<label>No. HP</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="No. HP" id="hpsiswaTB" name="hpsiswaTB">'
                                            // Telpon
                                            +'<label>No. Telpon</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="No. Telpon" id="telponsiswaTB" name="telponsiswaTB">'
                                            // email
                                            +'<label>Email</label>'
                                            +'<input  xtype="email" data-transform="input-control" xrequired placeholder="Email" id="emailsiswaTB" name="emailsiswaTB">'
                                            // pinbb
                                            +'<label>pin BBM</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="pin BBM" id="pinbbsiswaTB" name="pinbbsiswaTB">'
                                            // alamat
                                            +'<label>Alamat</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Alamat" id="alamatsiswaTB" name="alamatsiswaTB">'
                                            // kota
                                            +'<label>kota</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="kota" id="kotasiswaTB" name="kotasiswaTB">'
                                            // kodepos
                                            +'<label>kodepos</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="kodepos" id="kodepossiswaTB" name="kodepossiswaTB">'
                                            // photo
                                            +'<label>Pas Foto</label>'
                                            +'<div class="tile double-vertical double-horizontal">'
                                                +'<a id="previmgA" href="#">'
                                                    +'<img id="previmg" src="../img/no_image.jpg">'
                                                    +'<div class="brand bg-dark opacity">'
                                                        +'<span class="text">'
                                                            +'format[jpg/png/bmp] size[max 1 mb]'
                                                        +'</span>'
                                                    +'</div>'
                                                +'</a>'
                                            +'</div>'
                                        +'</div>'

                                        // kolom3
                                        +'<div class="span4">'
                                            // berat badan
                                            +'<label>Berat Badan</label>'
                                            +'<input  type="number" data-transform="input-control" xrequired placeholder="Berat Badan" id="beratsiswaTB" name="beratsiswaTB">'
                                            // Tinggi badan
                                            +'<label>Tinggi Badan</label>'
                                            +'<input  type="number" data-transform="input-control" xrequired placeholder="Tinggi Badan" id="tinggisiswaTB" name="tinggisiswaTB">'
                                            // darah
                                            +'<label>Golongan Darah</label>'
                                            +'<div class="input-control select xsize3">'
                                                +'<select placeholder="darah" id="darahsiswaTB" name="darahsiswaTB">'
                                                    +'<option value="">Pilih Golongan Darah</option>'
                                                    +'<option value="A">A</option>'
                                                    +'<option value="B">B</option>'
                                                    +'<option value="AB">AB</option>'
                                                    +'<option value="O">O</option>'
                                                +'</select>'
                                            +'</div>'
                                            // penyakit
                                            +'<label>penyakit</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="penyakit" id="penyakitsiswaTB" name="penyakitsiswaTB">'
                                            // catatankesehatan
                                            +'<label>Catatan Kesehatan</label>'
                                            +'<div class="input-control textarea xsize3">'
                                                +'<textarea  placeholder="catatan kesehatan ...." id="catatankesehatansiswaTB" name="catatankesehatansiswaTB"></textarea>'
                                            +'</div>'
                                            // diasuh oleh
                                            +'<label>Diasuh oleh </label>'
                                            +'<div class="input-control select xsize3">'
                                                +'<select id="diasuhTB" name="diasuhTB">'
                                                    +'<option value="1">Ayah & Ibu</option>'
                                                    +'<option value="2">Ayah</option>'
                                                    +'<option value="3">Ibu</option>'
                                                    +'<option value="4">Wali</option>'
                                                +'</select>'
                                            +'</div>'
                                            // sekolahasal
                                            +'<label>Nama (Sekolah Asal)</label>'
                                            +'<input type="text" data-transform="input-control" xrequired name="sekolahasalsiswaTB" id="sekolahasalsiswaTB"  placeholder="sekolah" >'
                                            // kotasekolah
                                            +'<label>Kota (Sekolah Sekolah)</label>'
                                            +'<input type="text" data-transform="input-control" xrequired id="kotasekolahasalsiswaTB" name="kotasekolahasalsiswaTB" placeholder="kota ">'
                                            // negarasekolahasal
                                            +'<label>Negara (Sekolah Sekolah)</label>'
                                            +'<input type="text" data-transform="input-control" xrequired id="negarasekolahasalsiswaTB" name="negarasekolahasalsiswaTB"placeholder="negara">'
                                        +'</div>'

                                    +'</div>'
                                +'</div>'
                            +'</div>'

                            // Biodata Ayah
                            +'<div class="accordion-frame">'
                                +'<a class="heading bg-red fg-white" href="#">Biodata Ayah <sub>*wajib diisi</sub></a>'
                                +'<div style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1 
                                        +'<div class="span4">'
                                            // ayah
                                            +'<label>Nama Ayah</label>'
                                            +'<input  type="text" data-transform="input-control" required placeholder="nama ayah" id="namaayahTB" name="namaayahTB">'
                                            +'<sub class="fg-red place-right">*wajib diisi</sub>'
                                            // tampat lahir
                                            +'<label>Tempat Lahir</label>'
                                            +'<input  type="text" data-transform="input-control" placeholder="tempat lahir ayah " xrequired id="tempatlahirayahTB" name="tempatlahirayahTB">'
                                            // tanggal lahir 
                                            +'<label>Tanggal lahir</label>'
                                            +'<div class="input-control text" data-role="datepicker"'
                                                +'data-format="dd mmmm yyyy"'
                                                +'data-effect="slide">'
                                                +'<input placeholder="tanggal lahir" xrequired id="tanggallahirayahTB" name="tanggallahirayahTB" type="text">'
                                                +'<button class="btn-date"></button>'
                                            +'</div>'
                                            // warga negara
                                            +'<label>Warga Negara</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="warga negara" id="warganegaraayahTB" name="warganegaraayahTB">'
                                            // agama
                                            +'<label>Agama</label>'
                                            +'<select data-transform="input-control" xrequired id="agamaayahTB" name="agamaayahTB"></select>'
                                            // gereja ayah
                                            +'<label>Gereja</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="gereja" id="gerejaayahTB" name="gerejaayahTB">'
                                        +'</div>'
                                            
                                        // kolom2
                                        +'<div class="span4">'
                                            // HP
                                            +'<label>No. HP</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="No. HP" id="hpayahTB" name="hpayahTB">'
                                            // Telpon
                                            +'<label>No. Telpon</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="No. Telpon" id="telponayahTB" name="telponayahTB">'
                                            // email
                                            +'<label>Email</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Email" id="emailayahTB" name="emailayahTB">'
                                            // pinbb
                                            +'<label>pin BBM</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="pin BBM" id="pinbbayahTB" name="pinbbayahTB">'
                                            // alamat
                                            +'<label>Alamat</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Alamat" id="alamatayahTB" name="alamatayahTB">'
                                            // kota
                                            +'<label>kota</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="kota" id="kotaayahTB" name="kotaayahTB">'
                                            // kodepos
                                            +'<label>kodepos</label>'
                                            +'<input type="number" data-transform="input-control" xrequired placeholder="kodepos" id="kodeposayahTB" name="kodeposayahTB">'
                                            // fax rumah 
                                            +'<label>fax rumah</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="fax " id="faxrumahayahTB" name="faxrumahayahTB">'
                                        +'</div>'

                                        // kolom3
                                        +'<div class="span4">'
                                            // Pendidikan
                                            +'<label>Pendidikan</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Pendidikan" id="pendidikanayahTB" name="pendidikanayahTB">'
                                            // Bidang pekerjaan 
                                            +'<label>Bidang Pekerjaan</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Bidang Pekerjaan" id="bidangpekerjaanayahTB" name="bidangpekerjaanayahTB">'
                                            //Pekerjaan
                                            +'<label>Pekerjaan Ayah</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="pekerjaan ayah" id="pekerjaanayahTB" name="pekerjaanayahTB">'
                                            // posisi 
                                            +'<label>Posisi Pekerjaan</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="posisi pekerjaan " id="posisiayahTB" name="posisiayahTB">'
                                            // penghasilan ayah
                                            +'<label>Penghasilan Ayah</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired onfocus="inputuang(this);" placeholder="penghasilanayah" id="penghasilanayahTB" name="penghasilanayahTB">'
                                            // telpon  kantor
                                            +'<label>Telpon Kantor</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="telpon " id="telponkantorayahTB" name="telponkantorayahTB">'
                                            // fax  kantor
                                            +'<label>Fax Kantor</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="fax kantor " id="faxkantorayahTB" name="faxkantorayahTB">'
                                            // alamat kantor 
                                            +'<label>Alamat Kantor</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="alamat kantor " id="alamatkantorayahTB" name="alamatkantorayahTB">'
                                        +'</div>'

                                    +'</div>'
                                +'</div>'
                            +'</div>'

                            // Biodata ibu
                            +'<div class="accordion-frame">'
                                +'<a class="heading bg-red fg-white" href="#">Biodata ibu <sub>*wajib diisi</sub></a>'
                                +'<div style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1 
                                        +'<div class="span4">'
                                            // ibu
                                            +'<label>Nama ibu</label>'
                                            +'<input  type="text" data-transform="input-control" required placeholder="nama ibu" id="namaibuTB" name="namaibuTB">'
                                            +'<sub class="fg-red place-right">*wajib diisi</sub>'
                                            // tampat lahir
                                            +'<label>Tempat Lahir</label>'
                                            +'<input  type="text" data-transform="input-control" placeholder="tempat lahir ibu " xrequired id="tempatlahiribuTB" name="tempatlahiribuTB">'
                                            +'<sub class="fg-red place-right">*wajib diisi</sub>'
                                            // tanggal lahir 
                                            +'<label>Tanggal lahir</label>'
                                            +'<div class="input-control text" data-role="datepicker"'
                                                +'data-format="dd mmmm yyyy"'
                                                +'data-effect="slide">'
                                                +'<input placeholder="tanggal lahir" xrequired id="tanggallahiribuTB" name="tanggallahiribuTB" type="text">'
                                                +'<button class="btn-date"></button>'
                                            +'</div>'
                                            // warga negara
                                            +'<label>Warga Negara</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="warga negara" id="warganegaraibuTB" name="warganegaraibuTB">'
                                            // agama
                                            +'<label>Agama</label>'
                                            +'<select data-transform="input-control" xrequired id="agamaibuTB" name="agamaibuTB"></select>'
                                            // gereja ibu
                                            +'<label>Gereja</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="gereja" id="gerejaibuTB" name="gerejaibuTB">'
                                        +'</div>'
                                            
                                        // kolom2
                                        +'<div class="span4">'
                                            // HP
                                            +'<label>No. HP</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="No. HP" id="hpibuTB" name="hpibuTB">'
                                            // Telpon
                                            +'<label>No. Telpon</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="No. Telpon" id="telponibuTB" name="telponibuTB">'
                                            // email
                                            +'<label>Email</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Email" id="emailibuTB" name="emailibuTB">'
                                            // pinbb
                                            +'<label>pin BBM</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="pin BBM" id="pinbbibuTB" name="pinbbibuTB">'
                                            // alamat
                                            +'<label>Alamat</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Alamat" id="alamatibuTB" name="alamatibuTB">'
                                            // kota
                                            +'<label>kota</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="kota" id="kotaibuTB" name="kotaibuTB">'
                                            // kodepos
                                            +'<label>kodepos</label>'
                                            +'<input type="number" data-transform="input-control" xrequired placeholder="kodepos" id="kodeposibuTB" name="kodeposibuTB">'
                                            // fax rumah 
                                            +'<label>fax rumah</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="fax " id="faxrumahibuTB" name="faxrumahibuTB">'
                                        +'</div>'

                                        // kolom3
                                        +'<div class="span4">'
                                            // Pendidikan
                                            +'<label>Pendidikan</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Pendidikan" id="pendidikanibuTB" name="pendidikanibuTB">'
                                            // Bidang pekerjaan 
                                            +'<label>Bidang Pekerjaan</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Bidang Pekerjaan" id="bidangpekerjaanibuTB" name="bidangpekerjaanibuTB">'
                                            //Pekerjaan
                                            +'<label>Pekerjaan ibu</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="pekerjaan ibu" id="pekerjaanibuTB" name="pekerjaanibuTB">'
                                            // posisi 
                                            +'<label>Posisi Pekerjaan</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="posisi pekerjaan " id="posisiibuTB" name="posisiibuTB">'
                                            // penghasilan ibu
                                            +'<label>Penghasilan ibu</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired onfocus="inputuang(this);" placeholder="penghasilanibu" id="penghasilanibuTB" name="penghasilanibuTB">'
                                            // telpon  kantor
                                            +'<label>Telpon Kantor</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="telpon " id="telponkantoribuTB" name="telponkantoribuTB">'
                                            // fax  kantor
                                            +'<label>Fax Kantor</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="fax kantor " id="faxkantoribuTB" name="faxkantoribuTB">'
                                            // alamat kantor 
                                            +'<label>Alamat Kantor</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="alamat kantor " id="alamatkantoribuTB" name="alamatkantoribuTB">'
                                        +'</div>'

                                    +'</div>'
                                +'</div>'
                            +'</div>'

                            // Biodata wali
                            +'<div class="accordion-frame">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Biodata Wali</a>'
                                +'<div style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1 
                                        +'<div class="span4">'
                                            // cek
                                            +'<label>'
                                                +'<input checked onclick="enableWali(this);" type="checkbox" id="siswawaliTB" name="siswawaliTB">'
                                                +'Wali murid'
                                            +'</label>'
                                            // nama
                                            +'<label>Nama</label>'
                                            +'<input type="hidden" id="idsiswawaliTB" name="idsiswawaliTB" />'
                                            +'<input required class="waliTB"  type="text" data-transform="input-control" placeholder="nama" id="namawaliTB" name="namawaliTB">'
                                            // kelamin
                                            +'<label>Jenis Kelamin</label>'
                                            +'<select  class="waliTB"  data-transform="input-control" xrequired id="jkelaminwaliTB" name="jkelaminwaliTB">'
                                                +'<option value="">-Pili Kelamin-</option>'
                                                +'<option value="L">Laki</option>'
                                                +'<option value="P">Perempuan</option>'
                                            +'</select>'
                                            // alamatwali
                                            +'<label>Alamat</label>'
                                            +'<input   class="waliTB"  type="text" data-transform="input-control" placeholder="alamat" id="alamatwaliTB" name="alamatwaliTB">'
                                        +'</div>'
                                        // kolom2 
                                        +'<div class="span4">'
                                            // kotawali
                                            +'<label>Kota </label>'
                                            +'<input   class="waliTB"  type="text" data-transform="input-control" placeholder="kota" id="kotawaliTB" name="kotawaliTB">'
                                            // telponwali
                                            +'<label>Telpon</label>'
                                            +'<input  class="waliTB"   type="text" data-transform="input-control" placeholder="telpon" id="telponwaliTB" name="telponwaliTB">'
                                        +'</div>'

                                    +'</div>'
                                +'</div>'
                            +'</div>'
 
                            // Biodata kontak darurat
                            +'<div class="accordion-frame">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Kontak Darurat</a>'
                                +'<div style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1 
                                        // kontakdaruratFC(n,arr)
                                        +'<div class="span12">'
                                            +'<a  class="button" href="#" onclick="kontakdaruratFC();return false;"><i class="icon-plus-2"></i></a>'
                                            +'<table class="table bordered hovered striped">'
                                                +'<thead class="fg-white bg-blue">'
                                                    +'<tr>'
                                                        +'<th>Nama</th>'
                                                        +'<th>Hubungan</th>'
                                                        +'<th>Telpon 1</th>'
                                                        +'<th>Telpon 2</th>'
                                                        +'<th>Hapus</th>'
                                                    +'</tr>'
                                                +'</thead>'
                                                +'<tbody id="kontakdaruratTBL">'
                                                +'</tbody>'
                                            +'</table>'
                                        +'</div>'

                                    +'</div>'
                                +'</div>'
                            +'</div>'

                            // Biodata Saudara
                            +'<div class="accordion-frame">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Bioada Saudara</a>'
                                +'<div style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1 
                                        +'<div class="span12">'
                                            +'<a  class="button"  href="#" onclick="saudaraFC();return false;"><i class="icon-plus-2"></i></a>'
                                            +'<table class="table bordered hovered striped">'
                                                +'<thead class="fg-white bg-blue">'
                                                    +'<tr>'
                                                        +'<th>Nama</th>'
                                                        +'<th>Jenis Kelamin</th>'
                                                        +'<th>Tempat Lahir</th>'
                                                        +'<th>Tanggal Lahir</th>'
                                                        +'<th>Sekolah</th>'
                                                        +'<th>Grade</th>'
                                                        +'<th>Hapus</th>'
                                                    +'</tr>'
                                                +'</thead>'
                                                +'<tbody id="saudaraTBL">'
                                                +'</tbody>'
                                            +'</table>'
                                        +'</div>'

                                    +'</div>'
                                +'</div>'
                            +'</div>'

                            // kelengkapan dokumen
                            /*+'<div class="accordion-frame">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Kelengkapan Dokumen</a>'
                                +'<div  style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1
                                        +'<div class="span8">'
                                            +'<table class="table bordered hovered striped">'
                                                +'<thead class="fg-white bg-blue">'
                                                    +'<tr>'
                                                        +'<th><input type="checkbox" data-transform="input-control" /></th>'
                                                        +'<th>Nama</th>'
                                                        +'<th>Jumlah</th>'
                                                        +'<th>Upload File</th>'
                                                        +'<th>Lihat File</th>'
                                                    +'</tr>'
                                                +'</thead>'
                                                +'<tbody id="subdokumenTBL">'
                                                    +'<tr class="bg-white fg-red text-center">'
                                                        +'<td>-</td>'
                                                        +'<td>-</td>'
                                                        +'<td>-</td>'
                                                        +'<td>-</td>'
                                                        +'<td>-</td>'
                                                    +'</tr>'
                                                +'</tbody>'
                                            +'</table>'
                                        +'</div>'
                                    +'</div>'
                                +'</div>'                            
                            +'</div>'*/
                            
                            +'<div class="form-actions">' 
                                +'<button class="button primary">simpan</button>&nbsp;'
                            +'</div>'
                        +'</div>'
                        // end of accrdion 
                    +'</form>';
    // button action
        $('#nopendaftaranS, #namasiswaS, #nisS,#nisnS').keydown(function (e){ if(e.keyCode == 13) viewTB('siswa'); });
        $('#statusS').on('change',function(){ viewTB('siswa'); });
    }); 
    
//himpun array saudara terpilih
    // function saudaraArr(){
    //     var y=[];
    //     $('.saudaraTR').each(function(id,item){
    //         y.push($(this).attr('val'));
    //     });return y;
    // }

//preview image sebelum upload -------
    function preUpload(e){
        // var typex   = e.files[0].type;
        // var namex   = e.files[0].name;
        var sizex = e.files[0].size;
        var fname = $(e).val();
        var ext   = fname.replace(/^.*\./, '');
        // console.log($(e).attr('tipe'));
        if(sizex>(900*900)){ // size over
            notif('ukuran max 1 MB','red');
            $(e).val('');
            return false;   
        }else{ // size true
            if($(e).attr('tipe')=='file'){ // file : doc
                if(ext!='pdf'){
                    notif('hanya format .pdf','red');// only pdf 
                    $(e).val('');
                } 
            }else{ //image : jpg png dkk
                if(ext =='bmp'||ext =='png'||ext =='jpg'||ext =='jpeg'|| ext =='gif'){ //validasi format
                    $('#previmg').attr('src','../img/w8loader.gif');
                    var reader = new FileReader();
                    reader.readAsDataURL(e.files[0]);

                    reader.onload = function (oFREvent){
                        var urlx  = oFREvent.target.result;
                        setTimeout(function(){
                            $('#previmg').attr('src',urlx);//.removeAttr('style');
                        },1000);
                    };
                }else {
                    notif('diperbolehkan format gambar (jpg,png dll)','red');
                    $(e).val('');
                }
            }
        }
    };
// submit Foto siswa ---------------------------
    function siswaSV () {
        var files =new Array(), isExist=false;
        $("input:file").each(function() {
            files.push($(this).get(0).files[0]); 
        });
        var filesAdd = new FormData();
        $.each(files, function(key, value){
            filesAdd.append (key, value);
        });
        if(typeof files[0]=='undefined') {
            siswaDb('');
            // console.log('masuk tanpa upload');
        }else{
            siswaUp(filesAdd);
            // console.log('masuk upload');
        } 
    }

// upload image
    function siswaUp(dataAdd){
        $.ajax({
            url: dir+'?upload=images',
            type: 'POST',
            data: dataAdd,
            cache: false,
            dataType: 'json',
            processData: false,// Don't process the files
            contentType: false,//Set content type to false as jq 'll tell the server its a query string request
            success: function(data, textStatus, jqXHR){
                if(data.status == 'sukses'){ //gak error
                    siswaDb(data.photosiswaTB);
                }else{ //error
                    notif(data.status,'red');
                }
            },error: function(jqXHR, textStatus, errorThrown){
                notif('error'+textStatus,'red');
            }
        });
    }

// simpan ke database
    function siswaDb(filex){
        var formData = $('#siswaFR').serialize();
        if($('#idformTB').val()!='') formData +='&replid='+$('#idformTB').val()+'&iKontakDDelTR='+iKontakDDelTR+'&iSaudaraDelTR='+iSaudaraDelTR+'&iDetailDiskonDelTR='+iDetailDiskonDelTR; // id tidak kosong (edit mode) 
        if(filex!='') formData +='&photosiswaTB='+filex;  // ada upload file nya

        $.ajax({
            url: dir,
            type:'POST',
            data:formData+'&aksi=simpan&subaksi=siswa',
            cache:false,
            dataType: 'json',
            success: function(data, textStatus, jqXHR){
                if(data.status != 'sukses') notif(data.status,'red');
                else {
                    notif(data.status,'green'); 
                    $.Dialog.close();
                    viewTB('siswa');
                } 
            },error: function(jqXHR, textStatus, errorThrown){
                console.log('ERRORS savedata2: ' + textStatus);
            }
        });
    }

// combo departemen ---
    function cmbdepartemen(typ,dep){
        var u= dir2;
        var d ='aksi=cmbdepartemen';
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses') out+='<option value="">'+dt.status+'</option>';
            else{
                $.each(dt.departemen, function(id,item){
                    out+='<option '+(dep==item.replid?'selected':'')+' value="'+item.replid+'">'+item.nama+'</option>';
                });
            }
            if(typ=='filter'){ // filter (search)
                $('#departemenS').html(out);
                cmbtahunajaran('filter','');
            }else{ // form (edit & add)
                $('#departemenTB').html('<option value="">-Pilih Departemen-</option>'+out);
            }
        });
    }

// combo tahunajaran ---
    function cmbtahunajaran(typ,thn){
        var u= dir3;
        var d='aksi=cmb'+mnu3;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tahunajaran.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tahunajaran, function(id,item){
                        out+='<option '+(thn==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1)+'</option>';
                    });
                }
                if(typ=='filter'){ // filter (search)
                    $('#tahunajaranS').html(out);
                    cmbdetailgelombang('filter','');
                }else{ // form (edit & add)
                    // var th1 = dt.tahunajaran[0].tahunajaran;
                    // var th2 = parseInt(th1)+1;
                    // $('#tahunajaranDV').text(': '+th1+' - '+th2);
                    $('#tahunajaranTB').html('<option value="">-Pilih Tahun Ajaran-</option>'+out);
                }
            }
        });
    }
//end of combo tingkat ---

// combo kelompok ---
    function cmbkelompok(typ,thn,kel){
        var u = dir_kel;
        var d = 'aksi=cmbkelompok&'+(thn!=''?'tahunajaran='+thn:'');
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.kelompok, function(id,item){
                    out+='<option '+(kel==item.replid?'selected':'')+' value="'+item.replid+'">'+item.kelompok+'</option>';
                });
            }
            if(typ=='form') { // form 
                if(thn!=''){ // proses terpilih
                    $('#kelompokTB').html('<option value="">-Pilih Kelompok-</option>'+out);
                }else {// proses kosong
                    $('#kelompokTB').html('<option value="">-Pilih Tahun Ajaran-</option>');
                }
            }else { // filtering
                $('#kelompokS').html(out);
                viewTB(); 
            }
        });
    }

// view table ---
    function viewTB(subaksi){
        var aksi ='aksi=tampil';
        if(typeof subaksi!=='undefined'){
            aksi+='&subaksi='+subaksi;
        }
        var cari ='';
        var el,el2;

        if(typeof subaksi!=='undefined'){ // multi paging
            el  = '.'+subaksi+'_cari';
            el2 = '#'+subaksi+'_tbody';
        }else{ // single paging
            el  = '.cari';
            el2 = '#tbody';
        }

        $(el).each(function(){
            var p = $(this).attr('id');
            var v = $(this).val();
            cari+='&'+p+'='+v;
        });

        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $(el2).html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }

// cmbo golongan 
    function cmbtingkatZ(tipe,ting,dept) {
        // console.log('ini ingkat ='+ting);
        var dep=typeof dept=='string'?dept:$('#departemen'+(tipe=='filter'?'S':'TB')).val();
        var d = 'aksi=cmb'+mnu4+'&departemen='+dep;
        ajax(dir4,d).done(function (dt){
            var opt='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                opt+='<option value="">'+dt.status+'</option>'
            }else{
                var opt = '';
                $.each(dt.tingkat,function (id,item){
                    opt+='<option '+(ting==item.replid?'selected':'')+' value="'+item.replid+'">'+item.tingkat+'</option>'
                });
                if(tipe=='form') $('#tingkatTBZ').html('<option value="">-Pilih Tingkat-</option>'+opt);
                else {
                    $('#tingkatS').html(opt);
                    viewTB('siswa');
                }
            }
        });
    }   

// cmbo golongan 
    function cmbgolongan (golongan) {
        $.ajax({
            url:dir5,   
            type:'post',
            dataType:'json',
            data:'aksi=cmb'+mnu5,
            success:function(dt){
                var opt='';
                if (dt.status!='sukses') {
                    notif(dt.status,'red');
                    opt+='<option value="">'+dt.status+'</option>'
                }else{
                    // alert(id);return false;
                    var opt = '';
                    $.each(dt.golongan,function(id,item){
                        if(golongan==item.replid)
                            opt+='<option selected="selected" value="'+item.replid+'">'+item.golongan+'</option>'
                        else
                            opt+='<option value="'+item.replid+'">'+item.golongan+'</option>'
                    });$('#golonganTB').html('<option value="">Pilih Golongan ..</option>'+opt);
                }
            },
        });
    }   

// combo agama
    function cmbagama (elem) {
        var u = dir11;
        var d ='aksi=cmb'+mnu11;
        ajax(u,d).done(function(dt){
            if (dt.status!='sukses') {
                notif(mnu11+' '+dt.status,'red');
            }else{
                $.each(elem, function (id,item){
                    var opt='';
                    $.each(dt.agama,function (idx,itemx){
                        opt+='<option '+(item!=null && itemx.replid==item?'selected':'')+' value="'+itemx.replid+'">'+itemx.agama+'</option>'
                    });$('#agama'+id+'TB').html('<option value="">-Pilih Agama-</option>'+opt);
                });
            }
        });
    }

    // combo suku
    function cmbsuku (elem) {
        var u = dir12
        var d ='aksi=cmb'+mnu12;
        ajax(u,d).done(function(dt){
            if (dt.status!='sukses') {
                notif(mnu12+' '+dt.status,'red');
            }else{
                $.each(elem, function (id,item){
                    var opt='';
                    $.each(dt.suku,function (idx,itemx){
                        opt+='<option '+(item!=null && itemx.replid==item?'selected':'')+' value="'+itemx.replid+'">'+itemx.suku+'</option>'
                    });$('#suku'+id+'TB').html('<option value="">-Pilih '+mnu12+'-</option>'+opt);
                });
            }
        });
    }

// combo angsuran 
    function cmbangsuran (idx,ang) {
        var u = dir6;
        var d ='aksi=cmb'+mnu6;
        ajax(u,d).done(function(dt){
            var opt='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                opt+='<option value="">'+dt.status+'</option>'
            }else{
                var opt = '';
                $.each(dt.angsuran,function(id,item){
                    opt+='<option '+(ang==item.replid?'selected':'')+' value="'+item.replid+'">'+item.angsuran+' x </option>'
                });
            }
            $('#angsuran'+idx+'TB').html(opt);
        });
    }

    function enableWali(e){
        if($(e).is(':checked')){
            $('.waliTB').removeAttr('disabled')
                        .attr('required',true);
        }else{
            $('.waliTB').attr('disabled',true)
                        .removeAttr('required')
                        .val('');            
        }   
    }
    function enableDiskon(){
        var dep  = $('#departemenTB').val();
        var thn  = $('#tahunajaranTB').val();
        var dgel = $('#detailgelombang').val();
        var ting = $('#tingkatTB').val();
        var subt = $('#subtingkatTB').val();
        var gol  = $('#golonganTBZ').val();
        if(dep=='' || thn=='' || dgel=='' || ting=='' || subt=='' || gol==''){
            $('.detaildiskonTB').attr('disabled',true);            
            $('.detaildiskonTBL').html('<tr class="bg-white fg-red"><td class="text-center" colspan="4">..kosong..</td></tr>');
            // $('.diskonkhususTB').attr('disabled',true);
            // $('.ketdiskonkhususTB').attr('disabled',true);
            $('.ketdiskonkhususTB').attr('disabled',true);
            $('.biayaawalTD').html('');
            $('.biayaNettTD').html('');
        }else{
            // $('.diskonkhususTB').removeAttr('disabled');
            // $('.ketdiskonkhususTB').removeAttr('disabled');
            $('.detaildiskonTB').removeAttr('disabled');            
            $('.detaildiskonTBL').html('');
        }   
    }

// combo get biaya
    function getBiaya(){
        enableDiskon();
        var dgel = $('#detailgelombangTB').val();
        var subt = $('#subtingkatTB').val();
        var gol  = $('#golonganTBZ').val();
        if(dgel!='' && subt!='' && gol!=''){
            var u = dir;
            var d ='aksi=getBiaya'
                    +'&detailgelombang='+dgel
                    +'&subtingkat='+subt
                    +'&golongan='+gol
            ajax(u,d).done(function (dt){
                if(dt.status!='sukses') notif(dt.status,'red');
                else{
                    if(dt.biayaArr.length==0) notif('data kosong,silahkan hubungi admin');
                    else{
                        $.each(dt.biayaArr,function (id,item){
                            $('#biayaawal'+item.replid+'TD').html('Rp. '+parseInt(item.nominal).setCurr());
                            $('#biayaNett'+item.replid+'TD').html('Rp. '+parseInt(item.nominal).setCurr());
                            $('#iddetailbiaya'+item.replid+'TB').val(item.iddetailbiaya);
                        })
                    }
                }
            });            
        }
    }

//                  (idbiaya, iddetailbiaya)
    function getBiayaNett(idx) {
        // console.log('masuk biaya nett');
        var idy = $('#iddetailbiaya'+idx+'TB').val();
        var selectedDiskReg='';
        $.each(detaildiskonArr(idx), function (id,item){
            selectedDiskReg+='&diskonreguler[]='+item;
        });var d ='aksi=getBiayaNett&iddetailbiaya='+idy+selectedDiskReg+'&diskonkhusus='+$('#diskonkhusus'+idx+'TB').val();
        ajax(dir,d).done(function (dt){
            $('#biayaNett'+idx+'TD').html('Rp. '+(dt.biayaNett.setCurr()) );
            if(dt.biayaNett==0){
                $('#detaildiskon'+idx+'TBL tr:last').addClass('bg-orange fg-white');
                setTimeout(function(){
                    $('#detaildiskon'+idx+'TBL tr:last').fadeOut(function(){
                        $(this).remove();
                        getBiayaNett(idx);
                        detaildiskonArr(idx);
                    });
                },500);
            }
            if(dt.status!='sukses')notif(dt.status,'red');
        });
    }

// biaya  : registration net
     function getRegistrationNet(){
        var regNum       = getCurr($('#registrationTD').html());
        var disctotalNum = getCurr($('#disctotalTD').html());
        var regNetNum    = 'Rp. '+(regNum - disctotalNum).setCurr();
        $('#registrationnetTD').html(regNetNum);
     }

    function pagination(page,aksix,subaksi){ 
        var aksi ='aksi='+aksix+'&subaksi='+subaksi+'&starting='+page;
        var cari ='';
        var el,el2;

        if(subaksi!=''){ // multi paging 
            el  = '.'+subaksi+'_cari';
            el2 = '#'+subaksi+'_tbody';
        }else{ // single paging
            el  = '.cari';
            el2 = '#tbody';
        }

        $(el).each(function(){
            var p = $(this).attr('id');
            var v = $(this).val();
            cari+='&'+p+'='+v;
        });

        $.ajax({
            url:dir,
            type:"post",
            data: aksi+cari,
            beforeSend:function(){
                $(el2).html('<tr><td align="center" colspan="10"><img src="../img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }

// form ---
    function viewFR(idsiswa){
        isClosedFR();
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '80%',
            padding: 10,
            onShow: function(){
                $.Dialog.content(siswa_contentFR);
                if(idsiswa!=''){ // edit
                    var u = dir;
                    var d ='aksi=ambiledit&replid='+idsiswa;
                    ajax(u,d).done(function  (dt) {
                        if(dt.status!='sukses') notif(dt.status,'red');
                        else{
                        // kriteria siswa 
                            cmbdepartemen('form',dt.departemen);
                            cmbtahunajaran('form',dt.tahunajaran);
                            cmbdetailgelombang('form',dt.detailgelombang,dt.departemen,dt.tahunajaran);
                            cmbtingkatZ('form',dt.tingkat,dt.departemen);
                            cmbsubtingkat('form',dt.tingkat,dt.subtingkat);
                            cmbgolongan('form',dt.golongan);
                        // biaya 
                            biayaFC(idsiswa);
                        // bioadata siswa
                            var agm = {'ayah':dt.agamaayah,'siswa':dt.agamasiswa,'ibu':dt.agamaibu};
                            cmbagama(agm);
                            var suk = {'ayah':null,'siswa':dt.sukusiswa,'ibu':null};
                            cmbsuku(suk);
                            $('#idformTB').val(idsiswa);
                            $('#namasiswaTB').val(dt.namasiswa);
                            $('#panggilansiswaTB').val(dt.panggilansiswa);
                            $('#jkelaminsiswaTB').val(dt.jkelaminsiswa);
                            $('#tempatlahirsiswaTB').val(dt.tempatlahirsiswa);
                            $('#tanggallahirsiswaTB').val(dt.tanggallahirsiswa=='0000-00-00'?'':dt.tanggallahirsiswa);
                            $('#warganegarasiswaTB').val(dt.warganegarasiswa);
                            $('#bahasasiswa1TB').val(dt.bahasasiswa1);
                            $('#bahasasiswa2TB').val(dt.bahasasiswa2);
                            $('#photosiswa2TB').val(dt.photosiswa);
                            $('#previmgA').attr('href','upload/images/'+dt.photosiswa)
                                         .attr('target','blank');
                            $('#previmg').attr('src',(dt.photosiswa!=''?'upload/images/'+dt.photosiswa:'../img/no_image.jpg'));
                            $('#hpsiswaTB').val(dt.hpsiswa);
                            $('#telponsiswaTB').val(dt.telponsiswa);
                            $('#emailsiswaTB').val(dt.emailsiswa);
                            $('#pinbbsiswaTB').val(dt.pinbbsiswa);
                            $('#alamatsiswaTB').val(dt.alamatsiswa);
                            $('#kotasiswaTB').val(dt.kotasiswa);
                            $('#kodepossiswaTB').val(dt.kodepossiswa);
                            $('#beratsiswaTB').val(dt.beratsiswa);
                            $('#tinggisiswaTB').val(dt.tinggisiswa);
                            $('#darahsiswaTB').val(dt.darahsiswa);
                            $('#penyakitsiswaTB').val(dt.penyakitsiswa);
                            $('#catatankesehatansiswaTB').val(dt.catatankesehatansiswa);
                            $('#diasuhTB').val(dt.diasuh);
                            $('#sekolahasalsiswaTB').val(dt.sekolahasalsiswa);
                            $('#kotasekolahasalsiswaTB').val(dt.kotasekolahasalsiswa);
                            $('#negarasekolahasalsiswaTB').val(dt.negarasekolahasalsiswa);
                            getNoPendaftaran(idsiswa);
                        // biodata ayah
                            $('#namaayahTB').val(dt.namaayah);
                            $('#namaayahTB').val(dt.namaayah);
                            $('#tempatlahirayahTB').val(dt.tempatlahirayah);
                            $('#tanggallahirayahTB').val(dt.tanggallahirayah=='0000-00-00'?'':dt.tanggallahirayah);
                            $('#agamaayahTB').val(dt.agamaayah);
                            $('#warganegaraayahTB').val(dt.warganegaraayah);
                            $('#kodeposayahTB').val(dt.kodeposayah);
                            $('#kotaayahTB').val(dt.kotaayah);
                            $('#pendidikanayahTB').val(dt.pendidikanayah);
                            $('#bidangpekerjaanayahTB').val(dt.bidangpekerjaanayah);
                            $('#pekerjaanayahTB').val(dt.pekerjaanayah);
                            $('#posisiayahTB').val(dt.posisiayah);
                            $('#penghasilanayahTB').val(dt.penghasilanayah);
                            $('#telponayahTB').val(dt.telponayah);
                            $('#emailayahTB').val(dt.emailayah);
                            $('#pinbbayahTB').val(dt.pinbbayah);
                            $('#alamatayahTB').val(dt.alamatayah);
                            $('#hpayahTB').val(dt.hpayah);
                            $('#faxrumahayahTB').val(dt.faxrumahayah);
                            $('#alamatkantorayahTB').val(dt.alamatkantorayah);
                            $('#telponkantorayahTB').val(dt.telponkantorayah);
                            $('#faxkantorayahTB').val(dt.faxkantorayah);
                            $('#gerejaayahTB').val(dt.gerejaayah);
                        // biodata ibu
                            $('#namaibuTB').val(dt.namaibu);
                            $('#namaibuTB').val(dt.namaibu);
                            $('#tempatlahiribuTB').val(dt.tempatlahiribu);
                            $('#tanggallahiribuTB').val(dt.tanggallahiribu=='0000-00-00'?'':dt.tanggallahiribu);
                            $('#agamaibuTB').val(dt.agamaibu);
                            $('#warganegaraibuTB').val(dt.warganegaraibu);
                            $('#kodeposibuTB').val(dt.kodeposibu);
                            $('#kotaibuTB').val(dt.kotaibu);
                            $('#pendidikanibuTB').val(dt.pendidikanibu);
                            $('#bidangpekerjaanibuTB').val(dt.bidangpekerjaanibu);
                            $('#pekerjaanibuTB').val(dt.pekerjaanibu);
                            $('#posisiibuTB').val(dt.posisiibu);
                            $('#penghasilanibuTB').val(dt.penghasilanibu);
                            $('#telponibuTB').val(dt.telponibu);
                            $('#emailibuTB').val(dt.emailibu);
                            $('#pinbbibuTB').val(dt.pinbbibu);
                            $('#alamatibuTB').val(dt.alamatibu);
                            $('#hpibuTB').val(dt.hpibu);
                            $('#faxrumahibuTB').val(dt.faxrumahibu);
                            $('#alamatkantoribuTB').val(dt.alamatkantoribu);
                            $('#telponkantoribuTB').val(dt.telponkantoribu);
                            $('#faxkantoribuTB').val(dt.faxkantoribu);
                            $('#gerejaibuTB').val(dt.gerejaibu);
                        // biodata wali
                            if(dt.idsiswawali!=null) $('#idsiswawaliTB').val(dt.idsiswawali);
                            else {
                                $('#siswawaliTB').removeAttr('checked');
                                $('.waliTB').attr('disabled',true);
                            }$('#namawaliTB').val(dt.namawali);
                            $('#jkelaminwaliTB').val(dt.jkelaminwali);
                            $('#alamatwaliTB').val(dt.alamatwali);
                            $('#kotawaliTB').val(dt.kotawali);
                            $('#telponwaliTB').val(dt.telponwali);
                        // kontak darurat
                            kontakdaruratFC(dt.kontakdaruratArr);
                        // saudara
                            saudaraFC(dt.saudaraArr);
                        }
                    });
                }else{ //add
                    var agm = {'ayah':null,'siswa':null,'ibu':null};
                    cmbagama(agm);
                    var suk = {'ayah':null,'siswa':null,'ibu':null};
                    cmbsuku(suk);

                    var elems = {'ayah':null,'siswa':null,'ibu':null};
                    getNoPendaftaran('');
                    cmbagama(elems);
                    cmbdepartemen('form','');
                    cmbtahunajaran('form','');
                    cmbtingkatZ('form','');
                    cmbsubtingkat('form','','');
                    cmbgolongan('form','');
                    cmbangsuran('');
                    biayaFC('');
                    kontakdaruratFC();
                }
                // $("#form1").scrollbar({height: 355,axis: 'y'});
                titlex='<span class="icon-plus-2"></span> Tambah ';
                $.Dialog.title(titlex+' '+mnu);
                $('#departemenTB').focus();
            }
        });
    }

//del process ---
    function del(id){
        if(confirm('melanjutkan untuk menghapus data?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=hapus&replid='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus ';
                    clr  ='red';
                }else{
                    viewTB('siswa');
                    cont = '..Berhasil Menghapus' ;
                    clr  ='green';
                }
                notif(cont,clr);
            }
        });
    }
//end of del process ---

// input uang --------------------------
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            // allowNegative: true, 
            thousands:',', 
            // decimal:',', 
            affixesStay: true
        });
    }
    
// notifikasi
function notif(cont,clr) {
    var not = $.Notify({
        caption : "<b>Notifikasi</b>",
        content : cont,
        timeout : 3000,
        style :{
            background: clr,
            color:'white'
        },
    });
}
// end of notifikasi

//aktifkan process ---
    function aktifkan(id){
        var th  = $('#'+mnu+'TD_'+id).html();
        var dep = $('#'+mnu2+'S').val();
        //alert('d '+dep);
        //return false;
        if(confirm(' mengaktifkan "'+th+'"" ?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=aktifkan&replid='+id+'&departemen='+dep,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Mengaktifkan '+th+' ..';
                    clr  ='red';
                }else{
                    viewTB($('#departemenS').val());
                    cont = '..Berhasil Mengaktifkan '+th+' ..';
                    clr  ='green';
                }notif(cont,clr);
            }
        });
    }
//end of aktifkan process ---


//end of  print to PDF -------
    function printPDF(mn){
        var par='',tok='',p,v;
        $('.'+mn+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });var x  = $('#id_loginS').val();
        var token = encode64(x+tok);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }

// ajax jquery (mode : asyncronous) ---
    function ajax(u,d){
        return $.ajax({
            url:u,
            data:d,
            type:'post',
            dataType:'json'
        });
    }

// currency to number (ex : Rp. 500.000 -> 500000)
    function getCurr(n){  
        var num = n==''?'0':n;
        var x   = num.replace(/[^0-9]+/g,"");
        var y   = parseInt(x);
        return y;
    }

// number to currency (ex : 500000 -> 500.000)  
    Number.prototype.setCurr=function(){
        return this.toFixed(0).replace(/(\d)(?=(\d{3})+\b)/g,'$1.');
    }

// no pendaftaran auto 
    function getNoPendaftaran(idsiswa) {
        var u = dir;
        var d = 'aksi=nopendaftaran&idsiswa='+idsiswa;
        ajax(u,d).done(function (dt){
            $('#nopendaftaranTB').val(dt.nopendaftaran);
            // $('#nopendaftaranH').val(dt.nopendaftaranH);
        });
    }

// combobox detailgelombang pendaftaran
    function cmbdetailgelombang(typ,dgel,dp,th){
        var end =typ=='filter'?'S':'TB';
        var dep =$('#departemen'+end).val();
        var thn =$('#tahunajaran'+end).val();
        var d = 'aksi=cmb'+mnu8+'&tahunajaran='+(typeof th=='string'?th:thn)+'&departemen='+(typeof dp=='string'?dp:dep);
        if(dep!='' && thn!=''){
            ajax(dir8,d).done(function (dt){
                var opt='';
                if(dt.status!='sukses') notif(dt.status,'red');
                else{
                    $.each(dt.detailgelombang, function (id,item){
                        opt+='<option '+(dgel==item.replid?'selected':'')+' value="'+item.replid+'">'+item.gelombang+'</option>';
                    }); 
    
                    if(typ=='filter') {
                        $('#detailgelombangS').html(opt);
                        cmbtingkatZ('filter','');
                    }else{
                        $('#detailgelombangTB').html('<option value="">-Pilih Gelombang-</option>'+opt);
                        if(typeof th=='string'){
                            // console.log('masuk form edit'+ typeof dp);
                        }else{
                            cmbtingkatZ('form','');
                            // console.log('masuk form add'+ typeof dp);
                            // cmbtingkatZ('form','');
                        } 
                    } 
                }
            });
        }
    }


// combo subtingkat ---
    function cmbsubtingkat(typ,ting,sub){
        if(typ=='form' && ting==''){
            $('#subtingkatTB').html('<option value="">-Pilih Tingkat Dahulu-</option>');
        }else{
            var u=dir9;
            var d= 'aksi=cmbsubtingkat'+(ting!=''?'&tingkat='+ting:'');
            ajax(u,d).done(function (dt) {
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.subtingkat, function(id,item){
                        out+='<option '+(sub!='' && sub==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.subtingkat+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#subtingkatS').html('<option value="">-SEMUA-</option>'+out);
                    viewTB();
                }else{
                    $('#subtingkatTB').html('<option value="">-Pilih Sub Tingkat-</option>'+out);
                }
            });
        }
    }

// combo golongan ---
    function cmbgolongan(typ,gol){
        var u = dir5;
        var d = 'aksi=cmb'+mnu5;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.golongan, function(id,item){
                    out+='<option '+(gol!='' && gol==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.golongan+'</option>';
                });
            }
            if(typ=='filter'){
                $('#golonganS').html(out);
                viewTB();
            }else{
                $('#golonganTBZ').html('<option value="">-Pilih Golongan -</option>'+out);
            }
        });
    }

    function biayaFC(siswa){
        var d='aksi=tampil&subaksi=biaya'+(siswa!=''?'&siswa='+siswa:'');
        ajax(dir,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                if(dt.biayaArr.length==0) {
                   out+='<label class="fg-white bg-red"> Biaya Masih kosong silahkan hubungi administrator biaya</label>'
                    $('#biayaDV').html(out);
                }else{
                    $.each(dt.biayaArr, function (id,item){
                        out+='<label>'+item.biaya+'</label>'
                            +'<table class="table hovered bordered">'
                                // header
                                +'<thead>'
                                    +'<tr class="fg-white bg-blue">'
                                        +'<th colspan="2">Item</th>'
                                        +'<th>Nominal</th>'
                                    +'</tr>'
                                +'</thead>'

                                +'<tbody>'
                                    // biaya awal
                                    +'<tr>'
                                        +'<td colspan="2">Biaya '+item.biaya+' Awal'
                                            +'<input type="hidden" value="'+(item.idsiswabiaya!=''?item.idsiswabiaya:'')+'" name="idsiswabiaya'+item.replid+'TB">'
                                            +'<input type="hidden"  id="iddetailbiaya'+item.replid+'TB" name="iddetailbiayaTB[]">'
                                        +'</td>'
                                        +'<td class="text-right biayaawalTD" id="biayaawal'+item.replid+'TD">'
                                            +(siswa==''?'silahkan lengkapi dept. dll':'')
                                        +'</td>'
                                    +'</tr>';

                                // diskon reguler
                                if(item.isDiskon=='1' || item.isDiskon=='3' ) { // 1=reg or 3=reg & khusus
                                    out+='<tr>'
                                        +'<td>Diskon Reguler</td>'
                                        +'<td>'
                                            +'<div class="input-control text"><input class="detaildiskonTB" '+(siswa==''?'disabled':'')+' onfocus="multiAutoSuggest(\'detaildiskon\','+item.replid+')" onkeyup="multiAutoSuggest(\'detaildiskon\','+item.replid+')" placeholder="cari diskon .. " type="text" id="detaildiskon'+item.replid+'TB"></div>'
                                            +'<table width="100%">'
                                                +'<thead class="fg-white bg-blue">'
                                                    +'<th align="center">Diskon</th>'
                                                    +'<th align="center">Nilai</th>'
                                                    // +'<th align="center">Keterangan</th>'
                                                    +'<th align="center"><a onclick="$(\'#detaildiskon'+item.replid+'TBL\').html(\'\');getBiayaNett('+item.replid+'); return false;" class="fg-white bg-blue"><i class="icon-cancel-2"></i></a></th>'
                                                +'</thead>'
                                                +'<tbody class="detaildiskonTBL" id="detaildiskon'+item.replid+'TBL">'
                                                    +'<tr><td class="bg-white fg-red text-center" colspan="4">..kosong..</td></tr>'
                                                +'</tbody>'
                                            +'</table>'
                                        +'</td>'
                                        +'<td></td>'
                                    +'</tr>';
                                }

                                // Diskon Khusus
                                if(item.isDiskon=='2' || item.isDiskon=='3' ) { // 2=khusus or 3=reg & khusus
                                    out+='<tr>'
                                        +'<td>Diskon Khusus </td>'
                                        +'<td><div class="input-control text"><input value="'+(item.ketdiskonkhusus!=''?item.ketdiskonkhusus:'')+'" '+(dt.levelurutan==1 || dt.levelurutan==2?' name="ketdiskonkhusus'+item.replid+'TB"':'disabled')+' placeholder="keterangan diskon" type="text" id="ketdiskonkhusus'+item.replid+'TB" /></div></td>'
                                        +'<td>'
                                            +'<div class="input-control text"><input onkeyup="getBiayaNett('+item.replid+');" value="'+(item.diskonkhusus!=''?item.diskonkhusus:'Rp. 0')+'" class="text-right diskonkhususTB" onfocus="inputuang(this);" placeholder="nominal" type="text" id="diskonkhusus'+item.replid+'TB" '+(dt.levelurutan==1 || dt.levelurutan==2?' name="diskonkhusus'+item.replid+'TB"':'disabled')+'></div>'
                                            +'<sup style="font-weight:bold;" class="fg-red">* Diisi oleh Petugas Khusus </sup>'
                                        +'</td>'
                                    +'</tr>';
                                }

                                // biaya nett
                                if(item.isDiskon!='0') { // reg or bebas
                                    out+='<tr>'
                                        +'<td colspan="2">Biaya '+item.biaya+' Nett</td>'
                                        +'<td class="text-right biayaNettTD" id="biayaNett'+item.replid+'TD">Rp. 0</td>'
                                    +'</tr>';
                                }

                                    // jenis tagihan 
                                    out+='<tr>'
                                        +'<td>Ditagih</td>'
                                        +'<td>'+(item.jenistagihan!='sekali'?'per ':'')+item.jenistagihan+'</td>'
                                        +'<td></td>'
                                    +'</tr>';

                                // cara bayar
                                if(item.idIsAngsur=='1') { // 1= angsur reg.
                                    out+='<tr>'
                                        +'<td>Angsuran </td>'
                                        +'<td>' 
                                            +'<div class="input-control select">'
                                                +'<select class="text-center" id="angsuran'+item.replid+'TB" name="angsuran'+item.replid+'TB"><option value=""></option></select>'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="text-right" id="'+item.isDiskon+'TD"></td>'
                                    +'</tr>';
                                }
 
                                out+='</tbody>'
                            +'</table>'; 
                    });
                    $('#biayaDV').html(out);
                }

                $.each(dt.biayaArr, function (id,item){
                    getBiaya();
                    if(item.idIsAngsur=='1') cmbangsuran(item.replid,(item.angsuran!=''?item.angsuran:''));
                    // detail_diskon / diskon_reguler 
                    ajax(dir,'aksi=tampil&subaksi=detaildiskon&siswabiaya='+item.idsiswabiaya).done(function (dtx){
                        console.log('loop diskon reg @biaya ='+item.idsiswabiaya);
                        $.each(dtx.detaildiskonArr, function (idx,itemx){
                            detaildiskonAdd (item.replid,itemx.idsiswadiskon,itemx.replid,itemx.diskon,itemx.nilai,itemx.keterangan);
                        });
                    });
                });
            }
        });
    }

// input uang --------------------------
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            // allowNegative: true, 
            thousands:'.', 
            // decimal:',', 
            affixesStay: true
        });
    }

    function multiAutoSuggest(el,idx){
        var col =[], par='';
        if(el=='detaildiskon'){
            col =[{
                'align':'left',
                'columnName':'diskon',
                'width':'20',
                'label':'Item'
            },{   
                'columnName':'nilai',
                'width':'20',
                'align':'center',
                'label':'Diskon'
            },{   
                'columnName':'keterangan',
                'width':'60',
                'align':'justify',
                'label':'Keterangan'
            }]; 
            par+='&biaya='+idx+'&tahunajaran='+$('#tahunajaranTB').val()+'&departemen='+$('#departemenTB').val();
            par+='&selectedDiskReg='+detaildiskonArr(idx)+'&biaya='+idx;
        }else{
            // alert('masuk lain,arr='+selectedDiskReg);
        }

        $('#'+el+idx+'TB').combogrid({
            debug:true,
            width:'500px',
            colModel: col,
            url: dir+'?aksi=autocomp&subaksi='+el+par,
            select: function( event, ui ) {
                detaildiskonAdd(idx, '', ui.item.replid, ui.item.diskon, ui.item.nilai, ui.item.keterangan);
                $('#detaildiskon'+idx+'TB').val('');
                return false;
            }
        });
    }
//                        idbiaya,iddetaildiskon                                           
    function detaildiskonAdd (idx,siswadiskon,replid,diskon,nilai,keterangan) {
        var tr ='<tr val="'+replid+'" class="detaildiskon'+idx+'TR bg-lightTeal" id="detaildiskon'+replid+'TR">'
                    +'<td>'+diskon
                        +'<input type="hidden" name="idsiswadiskon'+replid+'TB" value="'+(siswadiskon!=''?siswadiskon:'')+'" />'
                        +'<input type="hidden" name="iddetaildiskonTB['+idx+'][]" value="'+replid+'" />'
                    +'</td>'
                    +'<td>'+nilai+'</td>'
                    +'<td><a href="#" class="bg-white fg-red" onclick="detaildiskonDel('+idx+','+replid+',\''+siswadiskon+'\'); return false;"><i class="icon-cancel-2"></a></i></td>'
                +'</tr>';
        $('#detaildiskon'+idx+'TBL').append(tr); 
        setTimeout(function(){
            $('#detaildiskon'+replid+'TR').removeClass('bg-lightTeal');
        },800);
        detaildiskonArr(idx);
        getBiayaNett(idx);
    }
    
//himpun array barang terpilih
    function detaildiskonArr(idx){
        var selectedDiskReg=[];
        $('.detaildiskon'+idx+'TR').each(function (id,item){
            selectedDiskReg.push($(this).attr('val'));
        });
        // console.log('setelah terpilih di tabel ='+selectedDiskReg);
        return selectedDiskReg;
    }

// saudara siswa ------------------------------
    var iSaudaraTR = 1;
    var iSaudaraDelTR = [];
    var iSaudaraAddTR = [];
    function saudaraFC(arr){
        var tr='';
        var isLoop=true;
        if(typeof arr=='undefined'){ isLoop=false; n=iSaudaraTR;}
        else{n=arr.length;}

        for(var i=n; i>=iSaudaraTR; i--){
            var ke = parseInt(i)-1;
            var idSaudara           = (typeof arr!='undefined')?arr[ke].replid:'';
            var namaSaudara         = (typeof arr!='undefined')?arr[ke].namasaudara:'';
            var jKelaminSaudara     = (typeof arr!='undefined')?arr[ke].jkelaminsaudara:'';
            var tempatLahirSaudara  = (typeof arr!='undefined')?arr[ke].tempatlahirsaudara:'';
            var tanggalLahirSaudara = (typeof arr!='undefined')?arr[ke].tanggallahirsaudara:'';
            var sekolahSaudara      = (typeof arr!='undefined')?arr[ke].sekolahsaudara:'';
            var gradeSaudara        = (typeof arr!='undefined')?arr[ke].gradesaudara:'';

            tr+='<tr class="saudaraTR" id="saudaraTR_'+ke+'">'
                +'<td>'
                    +'<input type="hidden" value="'+ke+'" id="idSaudara'+ke+'TR" name="idSaudaraTR[]">' // array acuan
                    +'<input type="hidden" value="'+idSaudara+'" name="idSaudara'+ke+'TB">'
                    +'<input name="namasaudara'+ke+'TB" id="namasaudara'+ke+'TB" value="'+namaSaudara+'" required type="text" data-transform="input-control">'
                +'</td>'
                +'<td><select name="jkelaminsaudara'+ke+'TB" id="jkelaminsaudara'+ke+'TB" required data-transform="input-control"><option value="">-Pilih Jenis Kelamin-</option><option '+(jKelaminSaudara=='L'?'selected':'')+' value="L">Laki-laki</option><option  '+(jKelaminSaudara=='P'?'selected':'')+' value="P">Perempuan</option></select></td>'
                +'<td><input value="'+tempatLahirSaudara+'" name="tempatlahirsaudara'+ke+'TB" id="tempatlahirsaudara'+ke+'TB" required type="text" data-transform="input-control"></td>'
                +'<td>'
                    +'<div class="input-control text" data-role="datepicker"'
                        +'data-format="dd mmmm yyyy"'
                        +'data-effect="slide">'
                        +'<input value="'+(tanggalLahirSaudara!=''||tanggalLahirSaudara!='0000-00-00'?tgl_indo5(tanggalLahirSaudara):'')+'" placeholder="tanggal lahir" required id="tanggallahirsaudara'+ke+'TB" name="tanggallahirsaudara'+ke+'TB" type="text">'
                        +'<button class="btn-date"></button>'
                    +'</div>'
                +'</td>'
                +'<td><input value="'+sekolahSaudara+'" name="sekolahsaudara'+ke+'TB" id="sekolahsaudara'+ke+'TB" type="text" data-transform="input-control"></td>'
                +'<td><input value="'+gradeSaudara+'" name="gradesaudara'+ke+'TB" id="gradesaudara'+ke+'TB" type="text" data-transform="input-control"></td>'
                +'<td><a onclick="'+(idSaudara!=''?'if(confirm(\'melanjutkan untuk menghapus data?\')) saudaraDel('+ke+',\''+idSaudara+'\',\'\');':'saudaraDel('+ke+',\''+idSaudara+'\',\'\')')+'" href="#" class="button bg-white fg-red"><i class="icon-cancel-2"></a></i></td>'
            +'</tr>';
        }
        if(isLoop) iSaudaraTR+=n;
        else iSaudaraTR++;
        $('#saudaraTBL').prepend(tr);
    }
// end of : saudara ------------------------------

// hapus saudara terpilih
    function saudaraDel(ke,idsaudara){
        if(idsaudara!='') iKontakDDelTR.push(idsaudara); //jika ada hapus DB 
        $('#saudaraTR_'+ke).fadeOut('slow',function(){
            $('#saudaraTR_'+ke).remove();
        });
        // console.log(iSaudaraDelTR);
    } 

// kontak darurat ------------------------------
    var iKontakDTR = 1;
    var iKontakDDelTR = [];
    var iKontakDAddTR = [];
    function kontakdaruratFC(arr){
        var tr='';
        var isLoop=true;
        if(typeof arr=='undefined'){ isLoop=false; n=iKontakDTR;}
        else{n=arr.length;}

        for(var i=n; i>=iKontakDTR; i--){
            var ke = parseInt(i)-1;
            var idKontakD      = (typeof arr!='undefined')?arr[ke].replid:'';
            var namaKontakD    = (typeof arr!='undefined')?arr[ke].namakontakdarurat:'';
            var hubKontakD     = (typeof arr!='undefined')?arr[ke].hubkontakdarurat:'';
            var telponKontak1D = (typeof arr!='undefined')?arr[ke].telponkontakdarurat1:'';
            var telponKontak2D = (typeof arr!='undefined')?arr[ke].telponkontakdarurat2:'';

            tr+='<tr class="kontakdaruratTR" id="kontakdaruratTR_'+ke+'">'
                +'<td>'
                    +'<input type="hidden" value="'+ke+'" id="idKontakD'+ke+'TR" name="idKontakDTR[]">' // array acuan
                    +'<input type="hidden" value="'+idKontakD+'" name="idKontakD'+ke+'TB">'
                    +'<input name="namakontakdarurat'+ke+'TB" id="namakontakdarurat'+ke+'TB" value="'+namaKontakD+'" required type="text" data-transform="input-control">'
                +'</td>'
                +'<td><input value="'+hubKontakD+'" name="hubkontakdarurat'+ke+'TB" id="hubkontakdarurat'+ke+'TB" required type="text" data-transform="input-control"></td>'
                +'<td><input value="'+telponKontak1D+'" name="telponkontakdarurat1'+ke+'TB" id="telponkontakdarurat1'+ke+'TB" required type="text" data-transform="input-control"></td>'
                +'<td><input value="'+telponKontak2D+'" name="telponkontakdarurat2'+ke+'TB" id="telponkontakdarurat2'+ke+'TB" type="text" data-transform="input-control"></td>'
                +'<td><a onclick="'+(idKontakD!=''?'if(confirm(\'melanjutkan untuk menghapus data?\')) kontakdaruratDel('+ke+',\''+idKontakD+'\',\'\');':'kontakdaruratDel('+ke+',\''+idKontakD+'\',\'\')')+'" href="#" class="button bg-white fg-red"><i class="icon-cancel-2"></a></i></td>'
            +'</tr>';
        }
        if(isLoop) iKontakDTR+=n;
        else iKontakDTR++;
        $('#kontakdaruratTBL').prepend(tr);
    }
// end of : kontak darurat ------------------------------

// hapus kontakdarurat terpilih
    function kontakdaruratDel(ke,idkontakd){
        if(idkontakd!='') iKontakDDelTR.push(idkontakd); //jika ada hapus DB 
        $('#kontakdaruratTR_'+ke).fadeOut('slow',function(){
            $('#kontakdaruratTR_'+ke).remove();
        });
        // console.log(iKontakDDelTR);
    }

// close pop up _ form 
    function isClosedFR () {
        if($('.window-overlay').length<=0) {
            iKontakDTR=1; // reset rekTR's counter
            iSaudaraTR=1; // reset rekTR's counter
            iKontakDDelTR=[]; // reset rekTR's counter
            iSaudaraDelTR=[]; // reset rekTR's counter
            iDetailDiskonDelTR=[];
        }
    }

// hapus diskon reguler terplih 
    var iDetailDiskonDelTR=[];
    function detaildiskonDel (idx,idy,idz) {
        $('#detaildiskon'+idy+'TR').fadeOut('slow',function(){
            $('#detaildiskon'+idy+'TR').remove();
            if(idz!='') iDetailDiskonDelTR.push(idz); // hapus
            detaildiskonArr(idx);
            getBiayaNett(idx,idy);
            // console.log(iDetailDiskonDelTR);
        });
    }

    function statusSV(){
        var u=dir;        
        var d=$('#statusFR').serialize()+'&aksi=simpan&subaksi=status';        
        ajax(u, d).done(function (dt){
            if(dt.status!='sukses') notif(dt.status,'red');
            else {
                $.Dialog.close();
                viewTB('siswa');
                notif(dt.status,'green');
            }
        });
    }

// form subdokumen ---
    function subdokumenFR(idsiswa){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '70%',
            padding: 10,
            onShow: function(){
                $.Dialog.content(subdokumen_contentFR);
                var u = dir;
                var d ='aksi=tampil&subaksi=subdokumen&replid='+idsiswa;
                ajax(u,d).done(function  (dt) {
                    if(dt.status!='sukses') notif(dt.status,'red');
                    else{
                        $('#siswaTB').val(idsiswa);
                        $('#tingkatDokTD').html(': '+dt.tingkat);
                        $('#departemenDokTD').html(': '+dt.departemen);
                        $('#tahunajaranDokTD').html(': '+dt.tahunajaran);
                        $('#detailgelombangDokTD').html(': '+dt.detailgelombang);
                        $('#namasiswaDokTD').html(': '+dt.namasiswa);
                        var tr ='';
                        $.each(dt.siswadokumenArr, function (id,item){
                            tr+='<tr '+(item.idsiswadokumen!=null?'class="bg-lightTeal"':'')+' id="siswadokumen'+item.replid+'TR">'
                                +'<td class="text-center">'
                                    +'<input type="hidden" name="fileawal'+item.replid+'TB" value="'+(item.file==null?'':item.file)+'"/>'
                                    +'<input value="'+(item.idsiswadokumen==null?'':item.idsiswadokumen)+'" name="idsiswadokumen'+item.replid+'TB" type="hidden">'
                                    +'<input type="hidden" id="siswadokumen'+item.replid+'TB" name="siswadokumenTB[]"  value="'+item.replid+'"/>'
                                    +'<pre><input '+(item.idsiswadokumen==null?'':'checked')+' onclick="enableDokumen('+item.replid+');" name="siswadokumenCB'+item.replid+'" id="siswadokumen'+item.replid+'CB" type="checkbox"></pre>'
                                +'</td>'
                                +'<td><pre>'+item.dokumen+'</pre></td>'
                                +'<td><pre>'+item.jumlah+' '+item.satuanjumlah+'</pre></td>'
                                +'<td><input tipe="pdf" onchange="preUpload2('+item.replid+');" name="file'+item.replid+'TB" id="file'+item.replid+'TB" '+(item.idsiswadokumen==null?'disabled="disabled"':'')+' xclass="span2" xdata-transform="input-control" type="file"></td>'
                                +'<td><button '+(item.idsiswadokumen==null?'disabled':' onclick="window.open(\'upload/files/'+item.file+'\',\'_blank\'); return false; "')+'  class="fg-white bg-'+(item.idsiswadokumen==null?'':'blue')+'"><i class="icon-eye"></i></button></td>'
                            +'</tr>';
                        });$('#subdokumenTBL').html(tr);
                    }
                });
                $.Dialog.title('<span class="icon-file"></span> Kelengkapan Dokumen');
            }
        });
    }
    
    function enableDokumen(e){
        $('#file'+e+'TB').val('');
        if($('#siswadokumen'+e+'CB').is(':checked')){
            $('#file'+e+'TB').attr('required',true);
            $('#siswadokumen'+e+'TR').addClass('bg-lightTeal');
            $('#file'+e+'TB').removeAttr('disabled',true);
        }else{
            $('#file'+e+'TB').removeAttr('required');
            $('#siswadokumen'+e+'TR').removeClass('bg-lightTeal');
            $('#file'+e+'TB').attr('disabled',true);
        }
        console.log($('#file'+e+'TB').val());
    }

//preparation before upload (pdf) -------
    function preUpload2(e){
        var sizex = $('#file'+e+'TB')[0].files[0].size;
        var fname = $('#file'+e+'TB')[0].files[0].name;
        console.log(fname);
        var ext   = fname.replace(/^.*\./, '');
        if(sizex>(900*900)){ // size over
            notif('ukuran max 1 MB','red');
            $('#file'+e+'TB').val('');
            return false;   
        }else{ // size true
            if(ext!=$('#file'+e+'TB').attr('tipe')){ // pdf only 
                $('#file'+e+'TB').val('');
                notif('hanya format .pdf','red'); 
                return false;
            } 
        }
    }

// submit Foto siswa ---------------------------
    function subdokumenSV () {
        var formData = new FormData($('#subdokumenFR')[0]);
        $.ajax({
            url: dir,
            type: 'POST',
            data: formData,
            async: false,
            success: function (dt) {
                notif(dt.status,(dt.status=='sukses'?'green':'red'));
                $.Dialog.close();
            },beforeSend:function(){
                $('#siswadokBC').attr('disabled',true).html('<img src="img/w8loader.gif">');
            },cache: false,
            contentType: false,
            processData: false
        });
        return false;
    }

// form status ---
    function statusFR(idsiswa){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '30%',
            padding: 10,
            onShow: function(){
                $('#nisTB').focus();
                $.Dialog.content(status_contentFR);
                var u = dir;
                var d ='aksi=ambiledit&replid='+idsiswa;
                ajax(u,d).done(function  (dt) {
                    if(dt.status!='sukses') notif(dt.status,'red');
                    else{
                        $('#idstatusTB').val(idsiswa);
                        $('#namasiswaTD').html(dt.namasiswa);
                        $('#nopendaftaranTD').html(dt.nopendaftaran);
                        $('#statussiswaTD').addClass('fg-white bg-'+(dt.statussiswa!='Belum Diterima'?(dt.statussiswa=='Diterima'?'green':'lightBlue'):'red'));
                        $('#statussiswaTD').html(dt.statussiswa);
                        $('#departemenTD').html(dt.departemennama);
                        $('#tahunajaranTD').html(dt.tahunajarannama);
                        $('#nisTB').val(dt.nis);
                        $('#nisnTB').val(dt.nisn);
                    }
                });
                titlex='<span class="icon-plus-2"></span> Tambah ';
                $.Dialog.title(titlex+' '+mnu);
            }
        });
    }

    // get month format -------------
    function monthFormat(mon){
        switch(mon){
            case 1:return 'Jan';break;
            case 2:return 'Feb';break;
            case 3:return 'Mar';break;
            case 4:return 'Apr';break;
            case 5:return 'May';break;
            case 6:return 'Jun';break;
            case 7:return 'Jul';break;
            case 8:return 'Aug';break;
            case 9:return 'Sep';break;
            case 10:return 'Oct';break;
            case 11:return 'Nov';break;
            case 12:return 'Dec';break;
        }
    }
// 2015-06-25 --> 25 Jun 2015 
    function tgl_indo5(str){
        var m = monthFormat(parseInt(str.substring(7,5)));
        var d = str.substring(8);
        var y = str.substring(0,4);
        return d+' '+m+' '+y;
    }
