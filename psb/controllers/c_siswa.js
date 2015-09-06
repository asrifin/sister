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
var contentFR = '';

// main function ---
    $(document).ready(function(){
        cmbdepartemen('filter','');
        // contentFR +='<form id="formx" onfocus="$(this).scrollbar({height: 355,axis: \'y\'});" class="scrollbar" xstyle="overflow:scroll;height:560px;"  enctype="multipart/form-data" autocomplete="off" onsubmit="simpanSV(); return false;">' 
        contentFR +='<form id="siswaFR" data-role="scrollbox" data-scroll="vertical" style="overflow:scroll;height:560px;" xstyle="height:300px;"  enctype="multipart/form-data" autocomplete="off" onsubmit="siswaSV(); return false;">' 
                        +'<input type="hidden" name="idformTB" id="idformTB" />'
                        // accordion
                        +'<div class="accordion with-marker xspan3 xplace-left margin10" data-role="accordion" data-closeany="true">'
                            // kriteria
                            +'<div class="accordion-frame active">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Kriteria Siswa</a>'
                                +'<div  style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1
                                        +'<div class="span4">'
                                            // departemen
                                            +'<label>Departemen</label>'
                                            +'<select data-transform="input-control" required onchange="cmbdetailgelombang(\'form\',\'\'); getBiaya();" id="departemenTB" name="departemenTB"></select>'
                                            // tahunajaran
                                            +'<label>Tahun Ajaran</label>'
                                            +'<select data-transform="input-control" required  onchange="cmbdetailgelombang(\'form\',\'\'); getBiaya();;" id="tahunajaranTB" name="tahunajaranTB"></select>'
                                            // Detailgelombang
                                            +'<label>Detail Gelombang</label>'
                                            +'<select  data-transform="input-control" onchange=" getBiaya();" required id="detailgelombangTB" name="detailgelombangTB"><option value="">-silahkan pilih Dept. dan Tahun Ajaran dahulu-</option></select>'
                                            // tingkat
                                            +'<label>Tingkat</label>'
                                            +'<select data-transform="input-control"  required onchange="cmbsubtingkat(\'form\',$(\'#tingkatTBZ\').val()); getBiaya(); subdokumenFC();" id="tingkatTBZ" name="tingkatTB"></select>'
                                            // subtingkat
                                            +'<label>Sub Tingkat</label>'
                                            +'<select  data-transform="input-control" onchange=" getBiaya();"  required id="subtingkatTB" name="subtingkatTB"></select>'
                                            // golongan
                                            +'<label>Golongan</label>'
                                            +'<select data-transform="input-control"  onchange=" getBiaya();"  required id="golonganTBZ" name="golonganTBs"></select>'
                                        +'</div>'
                                            
                                        // kolom2
                                        +'<div id="biayaDV" class="span4"></div>'
                                    +'</div>'
                                +'</div>'
                            +'</div>'
                            
                            // // bioadata Siswa
                            +'<div class="accordion-frame">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Biodata Siswa</a>'
                                +'<div style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1
                                        +'<div class="span4">'
                                            // nopendaftaran
                                            +'<label>No. Pendaftaran</label>'
                                            +'<input type="text" data-transform="input-control" id="nopendaftaranTB" name="nopendaftaranTB">'
                                            // nama
                                            +'<label>Nama</label>'
                                            +'<input type="text" data-transform="input-control" required placeholder="nama" id="namasiswaTB" name="namasiswaTB">'
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
                                            +'<div class="input-control text" data-role="datepicker"'
                                                +'data-format="dd mmmm yyyy"'
                                                +'data-effect="slide">'
                                                +'<input placeholder="tanggal lahir" xrequired id="tanggallahirsiswaTB" name="tanggallahirsiswaTB" type="text">'
                                                +'<button class="btn-date"></button>'
                                            +'</div>'
                                            // warga negara
                                            +'<label>Warga Negara</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="warganegara" id="warganegarasiswaTB" name="warganegarasiswaTB">'
                                            // agama
                                            +'<label>Agama</label>'
                                            +'<select data-transform="input-control" required id="agamasiswaTB" name="agamasiswaTB"></select>'
                                            // bahasa
                                            +'<label>Bahasa</label>'
                                            +'<input type="text" data-transform="input-control"  xrequired placeholder="bahasa 1" id="bahasasiswa1TB" name="bahasasiswa1TB">'
                                            +'<input type="text" data-transform="input-control"  xrequired placeholder="bahasa 2" id="bahasasiswa2TB" name="bahasasiswa2TB">'
                                            // photo 
                                            +'<label>Pas Photo</label>'
                                            +'<input type="text"  id="photosiswa2TB" name="photosiswa2TB"/>'
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
                                                +'<img id="previmg" src="../img/no_image.jpg">'
                                                +'<div class="brand bg-dark opacity">'
                                                    +'<span class="text">'
                                                        +'foto si ABC'
                                                    +'</span>'
                                                +'</div>'
                                            +'</div>'
                                        +'</div>'

                                        // kolom3
                                        +'<div class="span4">'
                                            // berat badan
                                            +'<label>Berat Badan</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Berat Badan" id="beratsiswaTB" name="beratsiswaTB">'
                                            // Tinggi badan
                                            +'<label>Tinggi Badan</label>'
                                            +'<input  type="text" data-transform="input-control" xrequired placeholder="Tinggi Badan" id="tinggisiswaTB" name="tinggisiswaTB">'
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

                            // // Biodata Ayah
                            // +'<div class="accordion-frame">'
                            //     +'<a class="heading bg-lightBlue fg-white" href="#">Biodata Ayah</a>'
                            //     +'<div style="display: block;" class="content grid">'
                            //         // baris 1
                            //         +'<div class="row">'
                            //             // kolom1 
                            //             +'<div class="span4">'
                            //                 // ayah
                            //                 +'<label>Nama Ayah</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="nama ayah" id="namaayahTB" name="namaayahTB">'
                            //                 // tampat lahir
                            //                 +'<label>Tempat Lahir</label>'
                            //                 +'<input  type="text" data-transform="input-control" placeholder="tempat lahir ayah " required id="tmplahirayahTB" name="tmplahirayahTB">'
                            //                 // tanggal lahir 
                            //                 +'<label>Tanggal lahir</label>'
                            //                 +'<div class="input-control text" data-role="datepicker"'
                            //                     +'data-format="dd mmmm yyyy"'
                            //                     +'data-effect="slide">'
                            //                     +'<input placeholder="tanggal lahir" required id="tgllahirayahTB" name="tgllahirayahTB" type="text">'
                            //                     +'<button class="btn-date"></button>'
                            //                 +'</div>'
                            //                 // warga negara
                            //                 +'<label>Warga Negara</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="warga negara" id="warganegaraayahTB" name="warganegaraayahTB">'
                            //                 // agama
                            //                 +'<label>Agama</label>'
                            //                 +'<select data-transform="input-control" required id="agamaayahTB" name="agamaayahTB"></select>'
                            //                 // gereja ayah
                            //                 +'<label>Gereja</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="gereja" id="gerejaayahTB" name="gerejaayahTB">'
                            //             +'</div>'
                                            
                            //             // kolom2
                            //             +'<div class="span4">'
                            //                 // HP
                            //                 +'<label>No. HP</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="No. HP" id="hpayahTB" name="hpayahTB">'
                            //                 // Telpon
                            //                 +'<label>No. Telpon</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="No. Telpon" id="telponayahTB" name="telponayahTB">'
                            //                 // email
                            //                 +'<label>Email</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="Email" id="emailayahTB" name="emailayahTB">'
                            //                 // pinbb
                            //                 +'<label>pin BBM</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="pin BBM" id="pinbbayahTB" name="pinbbayahTB">'
                            //                 // alamat
                            //                 +'<label>Alamat</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="Alamat" id="alamatayahTB" name="alamatayahTB">'
                            //                 // kota
                            //                 +'<label>kota</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="kota" id="kotaayahTB" name="kotaayahTB">'
                            //                 // kodepos
                            //                 +'<label>kodepos</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="kodepos" id="kodeposayahTB" name="kodeposayahTB">'
                            //                 // fax rumah 
                            //                 +'<label>fax rumah</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="fax " id="faxrumahayahTB" name="faxrumahayahTB">'
                            //             +'</div>'

                            //             // kolom3
                            //             +'<div class="span4">'
                            //                 // Pendidikan
                            //                 +'<label>Pendidikan</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="Pendidikan" id="pendidikanayahTB" name="pendidikanayahTB">'
                            //                 // Bidang pekerjaan 
                            //                 +'<label>Bidang Pekerjaan</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="Bidang Pekerjaan" id="bidangpekerjaanTB" name="bidangpekerjaanTB">'
                            //                 //Pekerjaan
                            //                 +'<label>Pekerjaan Ayah</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="pekerjaan ayah" id="pekerjaanayahTB" name="pekerjaanayahTB">'
                            //                 // posisi 
                            //                 +'<label>Posisi Pekerjaan</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="posisi pekerjaan " id="posisiayahTB" name="posisiayahTB">'
                            //                 // penghasilan ayah
                            //                 +'<label>Penghasilan Ayah</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="penghasilanayah" id="penghasilanayahTB" name="penghasilanayahTB">'
                            //                 // telpon  kantor
                            //                 +'<label>Telpon Kantor</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="telpon " id="telponkantorayahTB" name="telponkantorayahTB">'
                            //                 // fax  kantor
                            //                 +'<label>Fax Kantor</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="fax kantor " id="faxkantorayahTB" name="faxkantorayahTB">'
                            //                 // alamat kantor 
                            //                 +'<label>Alamat Kantor</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="alamat kantor " id="alamatkantorayahTB" name="alamatkantorayahTB">'
                            //                 // kodepos
                            //                 +'<label>kodepos</label>'   
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="kodepos" id="kodeposayahTB" name="kodeposayahTB">'
                            //             +'</div>'

                            //         +'</div>'
                            //     +'</div>'
                            // +'</div>'

                            // // Biodata Ibu
                            // +'<div class="accordion-frame">'
                            //     +'<a class="heading bg-lightBlue fg-white" href="#">Biodata Ibu</a>'
                            //     +'<div style="display: block;" class="content grid">'
                            //         // baris 1
                            //         +'<div class="row">'
                            //             // kolom1 
                            //             +'<div class="span4">'
                            //                 // ayah
                            //                 +'<label>Nama ibu</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="nama ibu" id="namaibuTB" name="namaibuTB">'
                            //                 // tampat lahir
                            //                 +'<label>Tempat Lahir</label>'
                            //                 +'<input  type="text" data-transform="input-control" placeholder="tempat lahir ibu " required id="tmplahiribuTB" name="tmplahiribuTB">'
                            //                 // tanggal lahir 
                            //                 +'<label>Tanggal lahir</label>'
                            //                 +'<div class="input-control text" data-role="datepicker"'
                            //                     +'data-format="dd mmmm yyyy"'
                            //                     +'data-effect="slide">'
                            //                     +'<input placeholder="tanggal lahir" required id="tgllahiribuTB" name="tgllahiribuTB" type="text">'
                            //                     +'<button class="btn-date"></button>'
                            //                 +'</div>'
                            //                 // warga negara
                            //                 +'<label>Warga Negara</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="warga negara" id="warganegaraibuTB" name="warganegaraibuTB">'
                            //                 // agama
                            //                 +'<label>Agama</label>'
                            //                 +'<div class="input-control select xsize3">'
                            //                     +'<select required id="agamaibuTB" name="agamaibuTB"></select>'
                            //                 +'</div>'
                            //                 // gereja ibu
                            //                 +'<label>Gereja</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="gereja" id="gerejaibuTB" name="gerejaibuTB">'
                            //             +'</div>'
                                            
                            //             // kolom2
                            //             +'<div class="span4">'
                            //                 // HP
                            //                 +'<label>No. HP</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="No. HP" id="hpibuTB" name="hpibuTB">'
                            //                 // Telpon
                            //                 +'<label>No. Telpon</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="No. Telpon" id="telponibuTB" name="telponibuTB">'
                            //                 // email
                            //                 +'<label>Email</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="Email" id="emailibuTB" name="emailibuTB">'
                            //                 // pinbb
                            //                 +'<label>pin BBM</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="pin BBM" id="pinbbibuTB" name="pinbbibuTB">'
                            //                 // alamat
                            //                 +'<label>Alamat</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="Alamat" id="alamatibuTB" name="alamatibuTB">'
                            //                 // kota
                            //                 +'<label>kota</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="kota" id="kotaibuTB" name="kotaibuTB">'
                            //                 // kodepos
                            //                 +'<label>kodepos</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="kodepos" id="kodeposibuTB" name="kodeposibuTB">'
                            //                 // fax rumah 
                            //                 +'<label>fax rumah</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="fax " id="faxrumahibuTB" name="faxrumahibuTB">'
                            //             +'</div>'

                            //             // kolom3
                            //             +'<div class="span4">'
                            //                 // Pendidikan
                            //                 +'<label>Pendidikan</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="Pendidikan" id="pendidikanibuTB" name="pendidikanibuTB">'
                            //                 // Bidang pekerjaan 
                            //                 +'<label>Bidang Pekerjaan</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="Bidang Pekerjaan" id="bidangpekerjaanTB" name="bidangpekerjaanTB">'
                            //                 //Pekerjaan
                            //                 +'<label>Pekerjaan ibu</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="pekerjaan ibu" id="pekerjaanibuTB" name="pekerjaanibuTB">'
                            //                 // posisi 
                            //                 +'<label>Posisi Pekerjaan</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="posisi pekerjaan " id="posisiibuTB" name="posisiibuTB">'
                            //                 // penghasilan ibu
                            //                 +'<label>Penghasilan ibu</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="penghasilanibu" id="penghasilanibuTB" name="penghasilanibuTB">'
                            //                 // telpon  kantor
                            //                 +'<label>Telpon Kantor</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="telpon " id="telponkantoribuTB" name="telponkantoribuTB">'
                            //                 // fax  kantor
                            //                 +'<label>Fax Kantor</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="fax kantor " id="faxkantoribuTB" name="faxkantoribuTB">'
                            //                 // alamat kantor 
                            //                 +'<label>Alamat Kantor</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="alamat kantor " id="alamatkantoribuTB" name="alamatkantoribuTB">'
                            //                 // kodepos
                            //                 +'<label>kodepos</label>'   
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="kodepos" id="kodeposibuTB" name="kodeposibuTB">'
                            //             +'</div>'

                            //         +'</div>'
                            //     +'</div>'
                            // +'</div>'

                            // // Biodata wali
                            // +'<div class="accordion-frame">'
                            //     +'<a class="heading bg-lightBlue fg-white" href="#">Biodata Wali</a>'
                            //     +'<div style="display: block;" class="content grid">'
                            //         // baris 1
                            //         +'<div class="row">'
                            //             // kolom1 
                            //             +'<div class="span4">'
                            //                 // nama
                            //                 +'<label>Nama</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="nama" id="namawaliTB" name="namawaliTB">'
                            //                 // kelamin
                            //                 +'<label>kelamin</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="kelamin" id="kelaminwaliTB" name="kelaminwaliTB">'
                            //                 // alamatwali
                            //                 +'<label>Alamat</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="alamat" id="alamatwaliTB" name="alamatwaliTB">'
                            //             +'</div>'
                            //             // kolom2 
                            //             +'<div class="span4">'
                            //                 // kotawali
                            //                 +'<label>Kota </label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="kota" id="kotawaliTB" name="kotawaliTB">'
                            //                 // telponwali
                            //                 +'<label>Telpon</label>'
                            //                 +'<input  type="text" data-transform="input-control" required placeholder="telpon" id="telponwaliTB" name="telponwaliTB">'
                            //             +'</div>'

                            //         +'</div>'
                            //     +'</div>'
                            // +'</div>'

                            // // Biodata saudara
                            // +'<div class="accordion-frame">'
                            //     +'<a class="heading bg-lightBlue fg-white" href="#">Biodata Saudara</a>'
                            //     +'<div  style="display: block;" class="content grid">'
                            //         // baris 1
                            //         +'<div class="row">'
                            //             // kolom1
                            //             +'<div class="span12">'
                            //                 +'<button onclick="saudaraFC();return false;"><i class="icon-plus-2"></i></button>'
                            //                 +'<table class="table bordered hovered striped">'
                            //                     +'<thead class="fg-white bg-blue">'
                            //                         +'<tr>'
                            //                             +'<th>Nama</th>'
                            //                             +'<th>Kelamin</th>'
                            //                             +'<th>Tmpt Lahir</th>'
                            //                             +'<th>Tgl Lahir</th>'
                            //                             +'<th>Sekolah</th>'
                            //                             +'<th>Nilai</th>'
                            //                             +'<th>Hapus</th>'
                            //                         +'</tr>'
                            //                     +'</thead>'
                            //                     +'<tbody id="saudaraTBL">'
                            //                     +'</tbody>'
                            //                 +'</table>'
                            //             +'</div>'
                            //         +'</div>'

                            //     +'</div>'                            
                            // +'</div>'                            

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
        $("#batalBC").on('click',function(){
            switchPN('view','');
        });
        $("#tambahsdrBC").on('click',function(){
            $('#cetak').toggle('slow');
        });
        $("#saudara2TB").on('click',function(){
            $('#saudara2').toggle('slow');
            $('#saudara').toggle('slow');
        });

        $('#nopendaftaranS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });$('#namaS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });$('#tingkatS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });

        //add
        $("#klasifikasiBC").on('click',function(){
            saudaraFR();
        });

    // search button
        $("#diskon_subsidiTB,#diskon_saudaraTB").keyup(function(){
            hitung_diskon();
            hitung_dpp();
        }); $("#diskon_tunai").change(function(){
            setdiskon();
            hitung_diskon();
            hitung_dpp();
        });
    }); 
      
// hapus saudara terpilih
    function saudaraDelx(id){
        $('#saudaraTR_'+id).fadeOut('slow',function(){
            $('#saudaraTR_'+id).remove();
        });
    }
    
//saudara record kosong --
    function saudaraExist(){
        alert('jumlah tr: '+$('#saudaraTBL','.saudaraTR').length);return false;
        var tr ='<tr class="warning"><td colspan="3" class="text-center">Silahkan pilih Nama Siswa ..</td></tr>';
        if($('#saudaraTBL').html()=='')
            $('#saudaraTBL').html(tr);
        else
            $('#saudaraTBL').html('');
    }

// pilih saudara  ---
    function saudaraAdd (id,siswa,sekolah) {
        var tr ='<tr val="'+id+'" class="saudaraTR" id="saudaraTR_'+id+'">'
                    +'<td>'+siswa+'</td>'
                    +'<td>'+sekolah+'</td>'
                    // +'<td><button xhref="#" xonclick="saudaraDel('+id+');"onclick="alert('+id+');"><i class="icon-remove"></i></button></td>'
                    +'<td>'
                        +'<a href="#" onclick="saudaraDelx('+id+');" xonclick="alert('+id+');">'
                            +'<i class="icon-remove"></i>'
                        +'</a>'
                    +'</td>'
                +'</tr>';
            // alert(id);return false;
        $('#saudaraTBL').append(tr); 
        saudaraArr();
    }
        
//himpun array saudara terpilih
    function saudaraArr(){
        var y=[];
        $('.saudaraTR').each(function(id,item){
            y.push($(this).attr('val'));
        });return y;
    }

//preview image sebelum upload -------
    function preUpload(e){
        // var typex   = e.files[0].type;
        // var namex   = e.files[0].name;
        var sizex = e.files[0].size;
        var fname = $(e).val();
        var ext   = fname.replace(/^.*\./, '');
        console.log($(e).attr('tipe'));
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
        console.log(files);
        var filesAdd = new FormData();
        $.each(files, function(key, value){
            filesAdd.append (key, value);
        });
        if(typeof files[1]=='undefined') siswaDb('');
        else siswaUp(filesAdd);
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
                    siswaDb(data);
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
        // console.log('fotoh='+$('#photoH').val()); return false;
        var formData = $('#siswaFR').serialize();
        if($('#idformTB').val()!=''){
            formData +='&replid='+$('#idformTB').val();
        }

        if(filex!=''){// ada upload file nya
            formData +='&photosiswaTB='+filex.file ;    
            // if($('#photoH').val()!=''){
            //     formData+='&photo_asal='+$('#photoH').val();
            // }
        }

        $.ajax({
            url: dir,
            type:'POST',
            data:formData+'&aksi=simpan&subaksi=siswa',
            // data:formData+'&aksi=simpan&subaksi=siswa&kelompokS='+$('#kelompokS').val(),
            cache:false,
            dataType: 'json',
            success: function(data, textStatus, jqXHR){
                if(data.status != 'sukses'){
                   notif(data.status,'red');
                }else{
                    notif(data.status,'green'); 
                    switchPN('view','');
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
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.departemen, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.nama+'</option>';
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

// load pop up        
    function loadFR(id) {
        if(id!='') {// view data siswa
            var u =dir;
            var d ='aksi=ambiledit&replid='+id;
            ajax(u,d).done(function  (dt) {
                $('#idformTB').val(id);
                $('#uang_pangkalTB').val(dt.sumpokok);
                $('#uang_pangkalnetTB').val(dt.sumnet);
                $('#angsuranTB').val(dt.angsuran);
                $('#sppTB').val(dt.sppbulan);
                $('#diskon_subsidiTB').val(dt.disctb);
                $('#diskon_saudaraTB').val(dt.discsaudara);
                $('#diskon_tunaiTB').val(dt.disctunai);
                $('#diskon_totalTB').val(dt.disctotal);
                $('#joiningTB').val(dt.joining);
                $('#nopendaftaranTB').val(dt.nopendaftaran);
                $('#namaTB').val(dt.siswa);
                $('#tempatlahirTB').val(dt.tmplahir);
                $('#jkTB').val(dt.kelamin);
                $('#tgllahiranakTB').val(dt.tgllahir);
                $('#alamatsiswaTB').val(dt.alamat);
                $('#telpsiswaTB').val(dt.telpon);
                $('#asalsekolahTB').val(dt.sekolahasal);
                var img;
                if(dt.photo!='' && dt.photo!=null){//ada gambar
                    img='./img/upload/'+dt.photo;
                }else{
                    img='./img/no_image.jpg';
                }
                $('#previmg').attr('src',img);
                $('#photoH').val(dt.photo);
            //ayah
                $('#ayahTB').val(dt.nama_ayah);
                $('#kebangsaan_ayahTB').val(dt.kebangsaan_ayah);
                $('#tempatlahir_ayahTB').val(dt.tempatlahir_ayah);
                $('#tgllahir_ayahTB').val(dt.tgllahir_ayah);
                $('#pekerjaan_ayahTB').val(dt.pekerjaan_ayah);
                $('#telpayahTB').val(dt.telpayah);
                $('#pinbb_ayahTB').val(dt.pinbb_ayah);
                $('#email_ayahTB').val(dt.email_ayah);
            //ibu
                $('#ibuTB').val(dt.nama_ibu);
                $('#kebangsaan_ibuTB').val(dt.kebangsaan_ibu);
                $('#tempatlahir_ibuTB').val(dt.temp_lahir_ibu);
                $('#tgllahir_ibuTB').val(dt.tgllahir_ibu);
                $('#pekerjaan_ibuTB').val(dt.pekerjaan_ibu);
                $('#telpibuTB').val(dt.telepon_ibu);
                $('#pinbb_ibuTB').val(dt.pinbb_ibu);
                $('#email_ibuTB').val(dt.email_ibu);
            // kontak darurat
                $('#nama_kontakTB').val(dt.namalain);
                $('#hubunganTB').val(dt.hubungan);
                $('#nomorTB').val(dt.telponlain);
            // kakek nenek
                $('#kakekTB').val(dt.kakek);
                $('#nenekTB').val(dt.nenek);

                // var tbl='';
                // $.each(dt.saudaraArr,function(id,item){
                //     var btn;
                //     tbl+='<tr>'
                //         +'<td>'+item.nis+'</td>'
                //         +'<td>'+item.nama+'</td>'
                //     +'</tr>';
                // });$('saudaraTBL').html(tbl);

                // $('#kakekTB').val(dt.kakek-nama);
                // $('#nenekTB').val(dt.nenek-nama);
                cmbkriteria(dt.kriteria);
                cmbgolongan(dt.golongan);
                cmbagama(dt.agama);
                cmbangsuran(dt.jmlangsur);
                cmbdisctunai(dt.nilai);
            });
        }else{ // add 

        }
    }  

// cmbo golongan 
    function cmbtingkatZ(tip,tgk) {
        var d = 'aksi=cmb'+mnu4;
        ajax(dir4,d).done(function (dt){
            var opt='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                opt+='<option value="">'+dt.status+'</option>'
            }else{
                var opt = '';
                $.each(dt.tingkat,function (id,item){
                    opt+='<option '+(tgk==item.replid?'selected':'')+' value="'+item.replid+'">'+item.tingkat+'</option>'
                });
                // console.log(opt);
                if(tip=='form') $('#tingkatTBZ').html('<option value="">-Pilih Tingkat-</option>'+opt);
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
    function cmbagamasiswa (typ,agm) {
        var u = dir11;
        var d ='aksi=cmb'+mnu11;
        ajax(u,d).done(function(dt){
            var opt='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                opt+='<option value="">'+dt.status+'</option>'
            }else{
                $.each(dt.agama,function(id,item){
                    opt+='<option '+(item.replid==agm?'selected':'')+' value="'+item.replid+'">'+item.agama+'</option>'
                });
                // alert(option)(opt);
                $('#agamasiswaTB').html('<option value="">Pilih Agama ..</option>'+opt);
            }
            // if(typ=='form')
            // else
            //     $('#agamaTB').html('<option value="">Pilih Agama ..</option>'+opt);
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

    function enableDiskon(){
        var dep  = $('#departemenTB').val();
        var thn  = $('#tahunajaranTB').val();
        var dgel = $('#detailgelombang').val();
        var ting = $('#tingkatTB').val();
        var subt = $('#subtingkatTB').val();
        var gol  = $('#golonganTBZ').val();
        if(dep=='' || thn=='' || dgel=='' || ting=='' || subt=='' || gol==''){
            $('.detaildiskonTB').attr('disabled',true);            
            $('.detaildiskonTBL').html('<tr class="fg-white bg-red"><td class="text-center" colspan="4">..kosong..</td></tr>');
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
        console.log('masuk biaya nett');
        var idy = $('#iddetailbiaya'+idx+'TB').val();
        var selectedDiskReg='';
        $.each(detaildiskonArr(idx), function (id,item){
            selectedDiskReg+='&diskonreguler[]='+item;
        });var d ='aksi=getBiayaNett&iddetailbiaya='+idy+selectedDiskReg+'&diskonkhusus='+$('#diskonkhusus'+idx+'TB').val();
        ajax(dir,d).done(function (dt){
            $('#biayaNett'+idx+'TD').html('Rp. '+(dt.biayaNett.setCurr()) );
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
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '80%',
            padding: 10,
            onShow: function(){
                $.Dialog.content(contentFR);
                if(idsiswa!=''){ // edit 
                    var u = dir;
                    var d ='aksi=ambiledit&id_user='+idsiswa;
                    ajax(u,d).done(function  (dt) {
                        if(dt.status!='sukses'){
                            notif(dt.status,'red');
                        }else{
                            if(dt.isLogged) { //sudah aktif (pernah login)
                                $('#namaTB').attr('disabled',true);
                                $('#usernameTB').attr('disabled',true);
                                $('#passwordTB').attr('disabled',true);
                                $('#simpanTB').attr('disabled',true);
                            }
                            $('#idformTB').val(idsiswa);
                            $('#namaTB').val(dt.nama);
                            $('#usernameTB').val(dt.username);
                            
                            levelFC(dt.id_level);
                            departemenFC(dt.id_level,dt.departemen);
                            // modulFC(dt.id_level,md)
                        }
                    });
                }else{ //add
                    cmbagamasiswa('form','');
                    cmbdepartemen('form','');
                    cmbtahunajaran('form','');
                    cmbtingkatZ('form','');
                    cmbsubtingkat('form','','');
                    cmbgolongan('form','');
                    cmbangsuran('');
                    biayaFC();
                    subdokumenFC();
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
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    viewTB();
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
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

   function kodeTrans(){
        var url = dir;
        var data = 'aksi=codeGen&subaksi=transNo';
        ajax(url,data).done(function(dt){
            $('#nopendaftaranTB').val(dt.kode);
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
    function getNoPendaftaran (e) {
        var u = dir;
        var d = 'aksi=nopendaftaran&kelompok='+$(e).val() ;
        ajax(u,d).done(function (dt){
            getBiaya();
            $('#nopendaftaranTB').val(dt.nopendaftaran);
            $('#nopendaftaranH').val(dt.nopendaftaranH);
        });
    }

// combobox detailgelombang pendaftaran
    function cmbdetailgelombang(typ,dgel){
        var end =typ=='filter'?'S':'TB';
        var dep =$('#departemen'+end).val();
        var thn =$('#tahunajaran'+end).val();
        var d = 'aksi=cmb'+mnu8+'&tahunajaran='+thn+'&departemen='+dep;
        if(dep!='' && thn!=''){
            ajax(dir8,d).done(function (dt){
                var opt='';
                if(dt.status!='sukses') notif(dt.status,'red');
                else{
                    $.each(dt.detailgelombang, function(id,item){
                        opt+='<option '+(dgel==item.replid?'selected':'')+' value="'+item.replid+'">'+item.gelombang+'</option>';
                    }); 
                }
                if(typ=='filter') $('#detailgelombangS').html(opt);
                else $('#detailgelombangTB').html('<option value="">-Pilih Gelombang-</option>'+opt);
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

    function biayaFC(){
        var d='aksi=tampil&subaksi=biaya';
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
                                            +'<input type="hidden"  id="iddetailbiaya'+item.replid+'TB" name="iddetailbiayaTB[]">'
                                        +'</td>'
                                        +'<td class="text-right biayaawalTD" id="biayaawal'+item.replid+'TD">'
                                            +'silahkan lengkapi dept. dll'
                                        +'</td>'
                                    +'</tr>';

                                // diskon reguler
                                if(item.isDiskon=='1' || item.isDiskon=='3' ) { // 1=reg or 3=reg & khusus
                                    out+='<tr>'
                                        +'<td>Diskon Reguler</td>'
                                        +'<td>'
                                            +'<div class="input-control text"><input xonsubmit="return false;" class="detaildiskonTB" disabled onfocus="multiAutoSuggest(\'detaildiskon\','+item.replid+')" onkeyup="multiAutoSuggest(\'detaildiskon\','+item.replid+')" placeholder="cari diskon .. " type="text" id="detaildiskon'+item.replid+'TB"></div>'
                                            +'<table width="100%">'
                                                +'<thead class="fg-white bg-blue">'
                                                    +'<th align="center">Diskon</th>'
                                                    +'<th align="center">Nilai</th>'
                                                    +'<th align="center">Keterangan</th>'
                                                    +'<th align="center"><a onclick="$(\'#detaildiskon'+item.replid+'TBL\').html(\'\');getBiayaNett('+item.replid+'); return false;" class="fg-white bg-blue"><i class="icon-cancel-2"></i></a></th>'
                                                +'</thead>'
                                                +'<tbody class="detaildiskonTBL" id="detaildiskon'+item.replid+'TBL">'
                                                    +'<tr><td class="fg-white bg-red text-center" colspan="4">..kosong..</td></tr>'
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
                                        +'<td><div class="input-control text"><input '+(dt.levelurutan==1 || dt.levelurutan==2?' name="ketdiskonkhusus'+item.replid+'TB"':'disabled')+' placeholder="keterangan diskon" type="text" id="ketdiskonkhusus'+item.replid+'TB" /></div></td>'
                                        +'<td>'
                                            +'<div class="input-control text"><input onkeyup="getBiayaNett('+item.replid+');" value="Rp. 0" class="text-right diskonkhususTB" onfocus="inputuang(this);" placeholder="nominal" type="text" id="diskonkhusus'+item.replid+'TB" '+(dt.levelurutan==1 || dt.levelurutan==2?' name="diskonkhusus'+item.replid+'TB"':'disabled')+'></div>'
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
                                        +'<td>Angsuran '+item.idIsAngsur+'</td>'
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
                    cmbangsuran(item.replid,'');
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
                detaildiskonAdd(idx, ui.item.replid, ui.item.diskon, ui.item.nilai, ui.item.keterangan);
                $('#detaildiskon'+idx+'TB').val('');
                return false;
            }
        });
    }

    function detaildiskonAdd (idx,replid,diskon,nilai,keterangan) {
        var tr ='<tr data-hint="tessss TR" val="'+replid+'" class="detaildiskon'+idx+'TR" id="detaildiskon'+replid+'TR">'
                    +'<td  data-hint="tessss TD">'+diskon+'</td>'
                    +'<td>'+nilai+'</td>'
                    +'<td>'+keterangan+'</td>'
                    +'<td><button class="bg-white fg-red" onclick="detaildiskonDel('+idx+','+replid+'); return false;"><i class="icon-cancel-2"></button></i></td>'
                +'</tr>';
        $('#detaildiskon'+idx+'TBL').append(tr); 
        detaildiskonArr(idx);
        getBiayaNett(idx);
    }
    
//himpun array barang terpilih
    function detaildiskonArr(idx){
        var selectedDiskReg=[];
        $('.detaildiskon'+idx+'TR').each(function (id,item){
            selectedDiskReg.push($(this).attr('val'));
        });
        console.log('setelah terpilih di tabel ='+selectedDiskReg);
        return selectedDiskReg;
    }

// remove TR 
    function detaildiskonDel (idx,idy) {
        $('#detaildiskon'+idy+'TR').fadeOut('slow',function(){
            $('#detaildiskon'+idy+'TR').remove();
            detaildiskonArr(idx);
            getBiayaNett(idx,idy);
        });
    }


    function subdokumenFC(){
        var u = dir10;        
        var d = 'aksi=cmb'+mnu10+'&tingkat='+$('#tingkatTBZ').val();        
        ajax(u,d).done(function (dt){
            if(dt.status!='sukses') notif(dt.status,'red');
            else{
                var tr='';
                if(dt.dokumen==0) tr+='<tr class="text-center fg-red"><td colspan="5">..kosong..</td></tr>';
                $.each(dt.dokumen, function (id,item){
                    tr+='<tr>'
                        +'<td><input id="subdokumen'+item.subdokumen+'CB" name="subdokumen'+item.subdokumen+'CB" data-transform="input-control" type="checkbox" /></td>'
                        +'<td>'+item.dokumen+'</td>'
                        +'<td>'+item.jumlah+' '+item.satuanjumlah+'</td>'
                        // +'<td><input tipe="file" onchange="preUpload(\'file\',\'file'+item.replid+'\');" id="file'+item.replid+'TB" name="file'+item.replid+'TB" type="file" data-transform="input-control" /></td>'
                        +'<td><input tipe="file" onchange="preUpload(this);" id="file'+item.replid+'TB" name="file'+item.replid+'TB" type="file" data-transform="input-control" /></td>'
                        +'<td><a class="button" onclick="return false;" href="#">Lihat File</a></td>'
                    +'</tr>';
                });$('#subdokumenTBL').html(tr);
            }
        });
    }

    var idsaudara = 1;
    function saudaraFC(){
        var tr='';
            tr+='<tr class="saudaraTR" id="saudara'+idsaudara+'TR">'
                +'<td><input type="text" data-transform="input-control" name="namasaudara'+idsaudara+'TB"id="namasaudara'+idsaudara+'TB" /></td>'
                +'<td>'
                    +'<select required data-transform="input-control" name="jkelaminsaudara'+idsaudara+'TB"id="jkelaminsaudara'+idsaudara+'TB">'
                        +'<option value="">Pilih kelamin</option>'
                        +'<option value="L">Laki</option>'
                        +'<option value="P">Perempuan</option>'
                    +'</select>'
                +'</td>'
                +'<td><input type="text" data-transform="input-control" name="tempatlahirsaudara'+idsaudara+'TB"id="tempatlahirsaudara'+idsaudara+'TB" /></td>'
                +'<td>'
                    +'<div class="input-control text" data-role="datepicker"'
                        +'data-format="dd mmmm yyyy"'
                        +'data-effect="slide">'
                        +'<input placeholder="tanggal lahir" required id="tanggallahir'+idsaudara+'TB" name="tanggallahir'+idsaudara+'TB" type="text">'
                        +'<button class="btn-date"></button>'
                    +'</div>'
                +'</td>'
                +'<td><input type="text" data-transform="input-control" name="sekolahsaudara'+idsaudara+'TB"id="sekolahsaudara'+idsaudara+'TB" /></td>'
                +'<td><input type="text" data-transform="input-control" name="gradesaudara'+idsaudara+'TB"id="gradesaudara'+idsaudara+'TB" /></td>'
                +'<td><button onclick="saudaraDelx('+idsaudara+') return false;"><i class="icon-cancel-2"></i></button></td>'
            +'</tr>';
        $('#saudaraTBL').append(tr);
        idsaudara++;
    }

    function saudaraDelTR(idx,idy){
        $('#saudara'+idy+'TR').fadeOut('slow',function(){
            $('#saudara'+idy+'TR').remove();
        });
    }