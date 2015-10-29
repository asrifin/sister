<script src="controllers/c_katalog.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>
 -->
   

 <!--  <script type="../js/metro/metro-scroll.js"></script> -->
<h4 style="color:white;">Katalog</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> Katalog</button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<!-- <div class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Kelompok" name="kelompokS" id="kelompokS"></select>
</div>
 -->
<table id="katalogTBL" style="display:visible;" class="table hovered bordered striped panelx" >
    <thead>
        <tr style="color:white;" class="info">
            <th class="text-left">Judul</th>
            <th class="text-left" >Klasifikasi</th>
            <th class="text-left" >Pengarang</th>
            <th class="text-center">Penerbit</th>
            <th class="text-right" >Callnumber</th>
            <th class="text-left" >Jumlah Koleksi</th>
            <th class="text-left">Pilihan</th>
            <!-- <th class="text-left" >Aksi</th> -->
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <!-- <th class="text-left"></th> -->
            <th class="text-left"><input placeholder="Judul" id="judulS" name="judulS"></th>
            <!-- <th class="text-left"><input placeholder="tglpendaftaran" id="tglpendaftaranS" name="tglpendaftaranS"></th> -->
            <th class="text-left"><input placeholder="Kode klasifikasi" id="kode_klasifikasiS" name="kode_klasifikasiS"></th>
            <th class="text-left"><input placeholder="Nama Pengarang" id="pengarangS" name="pengarangS"></th>
            <th class="text-left"><input placeholder="Nama Penerbit" id="penerbitS" name="penerbitS"></th>
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

<!-- Form View detail Katalog -->
      <div class="table hovered bordered striped panelx" id="k_viewFR" style="display:none;" >
          <div style="overflow:scroll;height:600px;" >
                  <form autocomplete="off" onsubmit="katalog_viewSV();return false;"> 
                        <input id="v_idformH" type="hidden"> 
                        <!-- Panel -->
                        <div class="panel">
                          <div class="panel-header bg-lightBlue fg-white">
                          Informasi Katalog Buku
                          </div>
                          <div class="panel-content">

                  <!-- <button data-hint="Kembali" xclass="large" id="kembaliBC"><span class=" icon-arrow-left-2"></span> Katalog</button> -->
                  <a href="#" data-hint="Kembali" onclick="switchPN_view(); return false;" class="button"><span class="icon-arrow-left-2"></span> Katalog</a>
                  <a href="#" data-hint="Edit Katalog" id="edit_katalogBC" class="button"><span class="icon-pencil"></span> Edit Informasi Katalog</a>
                  <!-- <button data-hint="Edit" xclass="large" id="edit_katalogBC"><span class=" icon-pencil"></span> Edit Informasi Katalog</button> -->
                 <a href="#" data-hint="Tambah Koleksi" id="koleksiBC" class="button"><span class="icon-plus-2"></span> Koleksi</a>

                          <div class="grid">  
                            <div class="row">     
                              <div class="span6">
                              <label><b>Informasi Katalog :</b></label>
                              <input  id="idkatalogH" name="idkatalogH" type="hidden">
                              <div class="row">
                                  <div class="span2">Judul :</div>
                                  <div  class="span4" id="judulTD"></div>
                              </div>
                              <div class="row">                          
                                  <div class="span2">Kalsifikasi :</div>
                                  <!-- <input  id="idklasifikasiH" name="idklasifikasiH" type="hidden">                                   -->
                                  <div class="span2" id="klasifikasiTD"></div>
                                  <div class="span2" id="klasifikasi_selectTD"></div>
                              </div>
                              <div class="row">                              
                                  <!-- <input  id="idpengarangH" name="idpengarangH" type="hidden"> -->
                                  <div class="span2">Pengarang :</div>
                                  <div class="span2" id="pengarangTD"></div>
                              </div>
                              <div class="row">                              
                                  <div class="span2">Callnumber :</div>
                                  <div class="span2" id="callnumberTD"></div>
                              </div>
                              <div class="row">
                                  <div class="span2">Penerjemah :</div>
                                  <div class="span2" id="penerjemahTD"></div>
                              </div>

                              <div class="row">
                                  <div class="span2">Editor :</div>
                                  <div class="span2" id="editorTD"></div>
                              </div>

                              <div class="row">
                                  <!-- <input  id="idpenerbitH" name="idpenerbitH" type="hidden"> -->
                                  <div class="span2">Penerbit :</div>
                                  <div class="span2" id="penerbitTD"></div>
                              </div>

                              <div class="row">
                                  <div class="span2">Tahun terbit :</div>
                                  <div class="span2" id="tahun_terbitTD"></div>
                              </div>

                              <div class="row">
                                  <div class="span2">Kota :</div>
                                  <div class="span2" id="kotaTD"></div>
                              </div>

                              <div class="row">
                                  <div class="span2">ISBN :</div>
                                  <div class="span2" id="isbnTD"></div>
                              </div>

                              <div class="row">
                                  <div class="span2">ISSN :</div>
                                  <div  class="span2" id="issnTD"></div>
                              </div>

                              <div class="row">
                                  <div class="span2">Bahasa :</div>
                                  <div class="span2" id="bahasaTD"></div>
                              </div>

                              <div class="row">
                                  <div class="span2">Seri Buku :</div>
                                  <div class="span2" id="seri_bukuTD"></div>
                              </div>

                              <div class="row">
                                  <div class="span2">Volume :</div>
                                  <div class="span2" id="volumeTD"></div>
                              </div>

                              <div class="row">
                                  <div class="span2">Edisi :</div>
                                  <div class="span2" id="edisiTD"></div>
                              </div>

                              <div class="row">
                                  <div class="span2">Jenis Buku :</div>
                                  <div class="span2" id="jenis_bukuTD"></div>
                              </div><br>
                              
                                <label><b>Daftar Koleksi :</b></label>
                                <label>Lokasi :</label>
                              <div class="input-control select span4">
                                  <select placeholder="Lokasi" name="lokasiS" id="lokasiS" ></select>
                              </div><br><br>
                              <div class="form-actions">
                                <a href="#" data-hint="Tambah Koleksi" xclass="large" id="koleksi_duaBC" class="button"><span class="icon-plus-2"></span> Koleksi</a>
                              </div>

                              <!-- <table id="koleksiTBL" style="display:visible;" width="800px" class="table hovered bordered striped panelx" > -->
                              <table width="800px" class="table hovered bordered striped panelx" >
                                  <thead>
                                      <tr style="color:white;" class="info">
                                          <th class="text-left">Barkode</th>
                                          <th class="text-left" >Nomor ID</th>
                                          <th class="text-left" >Sumber</th>
                                          <th class="text-center">Harga</th>
                                          <th class="text-right" >Tanggal Diperoleh</th>
                                          <th class="text-left" >Status</th>
                                          <th class="text-left" >Lokasi</th>
                                          <th class="text-left" >Tingkat</th>
                                          <th class="text-left">Pilihan</th>
                                      </tr>
                                  </thead>

                                  <tbody id="k_viewtbody">
                                      <!-- row table -->
                                  </tbody>
                                  <tfoot>
                                      
                                  </tfoot>
                              </table>

                        </div>
                                <!-- End Span 1-->

                              <div class="span6">
                                <label><b>Deskripsi Buku :</b></label>
                                <div class="row">
                                    <div class="span2">Jumlah Halaman :</div>
                                    <div  class="span2" id="jumlahTD"></div>
                                </div>                                

                              <div class="row">
                                    <div class="span2">Dimensi :</div>
                                    <div  class="span2" id="dimensiTD"></div>
                                </div>                                

                              <div class="row">
                                    <div class="span2">Sinopsis :</div>
                                    <div class="span4" id="sinopsisTD"></div>
                                </div>                                

                              </div>
                                <!-- End span 2-->

                              </div>
                            </div>
                                <!-- End Grid-->                            
                          </div>

                        </div>
                        <!-- End Panel -->
<!--                         <div class="form-actions"> &nbsp;
                            <button class="button primary">simpan</button>&nbsp;
                            <a class="button" href="#" onclick="switchPN_view(); return false;" >Batal</a> 
                        </div>
 -->                    </form>

                    </div>
                            <!-- End Scroll -->
    </div> 

      <!-- Form tambah dan edit katalog  -->
      <div class="table hovered bordered striped panelx" id="katalogFR" style="display:none;" >
          <div style="overflow:scroll;height:600px;" >
                  <form autocomplete="off" enctype="multipart/form-data" onsubmit="katalogSV();return false;" id="katalog_form"> 
                        <input id="idformH" type="hidden"> <!--Untuk ambil id form -->
                        <!-- Panel -->
                        <div class="panel">
                          <div class="panel-header bg-lightBlue fg-white">
                          Informasi Katalog Buku
                          </div>
                          <div class="panel-content">

                              <div class="form-actions"> &nbsp;
                                <button class="button primary">simpan</button>&nbsp;
                                <a class="button" href="#" onclick="switchPN(); return false;" >Batal</a> 
                                <!-- <button class="button" type="button" onclick="$.Dialog.close()">Batal</button>  -->
                              </div>

                          <div class="grid">     
                            <div class="row">
                              <div class="span6">
                              <input  id="edit_katalogH" name="edit_katalogH" type="hidden"> <!--Untuk ambil id tambah koleksi -->
                              <!-- <label><b>Kriteria Calon :</b></label> -->
                              <label>Judul :</label>
                              <div class="input-control text">
                                  <input type="text" placeholder="Judul" name="judulTB" id="judulTB">
                              </div>
                          
                              <!-- <label><b>Informasi Katalog Buku :</b></label> -->
                              <label>Kalsifikasi :</label>
                              <div class="input-control text size2">
                                  <input type="text" placeholder="Kode Klasifikasi" name="klasifikasiTB" id="klasifikasiTB">
                              </div>

                              <div class="input-control text size3">
                                  <input type="hidden" name="klasifikasi_selectH" id="klasifikasi_selectH">
                                  <input required type="text" placeholder="Klasifikasi" name="klasifikasi_selectTB" id="klasifikasi_selectTB">
                                  <button class="btn-clear"></button>
                              </div>                            
                              <a href="#" data-hint="Tambah Kalsifikasi" id="klasifikasiBC" class="button"><span class="icon-plus-2"></span> </a>

                              <label>Pengarang :</label>
                              <div class="input-control text size4">
                                  <input type="hidden" name="pengarang_autoH" id="pengarang_autoH">
                                  <input required type="text" placeholder="Pengarang" name="pengarangTB" id="pengarangTB">
                                  <button class="btn-clear"></button>
                              </div>      
                                  <a href="#" data-hint="Tambah Pengarang" xclass="large" id="pengarangBC" class="button"><span class="icon-plus-2"></span> </a>
                        
                              <label>Callnumber</label>
                              <div class="input-control text size3">
                                  <input type="text" placeholder="Callnumber" name="callnumberTB" id="callnumberTB">
                                  <button class="btn-clear"></button>
                              </div>

                              <label>Penerjemah :</label>
                              <div class="input-control text">
                                  <input type="text" placeholder="Penerjemah" name="penerjemahTB" id="penerjemahTB">
                                    <!-- <option>Value 1</option> -->
                              </div>

                              <label>Editor</label>
                              <div class="input-control text size3">
                                  <input type="text" placeholder="Editor" name="editorTB" id="editorTB">
                                  <button class="btn-clear"></button>
                              </div>

                              <label>Penerbit</label>
                              <div class="input-control text size4">
                                  <input type="hidden" name="penerbit_autoH" id="penerbit_autoH">
                                  <input required type="text" placeholder="Penerbit" name="penerbitTB" id="penerbitTB">
                                  <button class="btn-clear"></button>
                              </div>
                              <a href="#" class="button" data-hint="Tambah Penerbit" xclass="large" id="penerbitBC"><span class="icon-plus-2"></span> </a>

                              <label>Tahun terbit :</label>
                              <div class="input-control text size3">
                                  <input type="text" placeholder="tahun terbit" name="tahun_terbitTB" id="tahun_terbitTB">
                                  <button class="btn-clear"></button>

                                  <!-- <select name="tahun_terbitTB" id="tahun_terbitTB"></select> -->
                              </div>

                              <label>Kota</label>
                              <div class="input-control text size3">
                                  <input type="text" placeholder="Kota" name="kotaTB" id="kotaTB">
                                  <button class="btn-clear"></button>
                              </div>

                              <label>ISBN</label>
                              <div class="input-control text size3">
                                  <input type="text" placeholder="ISBN" name="isbnTB" id="isbnTB">
                                  <button class="btn-clear"></button>
                              </div>

                              <label>ISSN</label>
                              <div class="input-control text size3">
                                  <input type="text" placeholder="ISSN" name="issnTB" id="issnTB">
                                  <button class="btn-clear"></button>
                              </div>

                              <label>Bahasa</label>
                              <div class="input-control select size3">
                                  <select name="bahasaTB" id="bahasaTB"></select>
                              </div>
                              <a href="#" data-hint="Tambah Bahasa" id="bahasaBC" class="button"><span class="icon-plus-2"></span> </a>

                              <label>Seri Buku</label>
                              <div class="input-control text size3">
                                  <input type="text" placeholder="Seri Buku" name="seri_bukuTB" id="seri_bukuTB">
                                  <button class="btn-clear"></button>
                              </div>

                              <label>Volume</label>
                              <div class="input-control text size3">
                                  <input type="text" placeholder="Volume" name="volumeTB" id="volumeTB">
                                  <button class="btn-clear"></button>
                              </div>

                              <label>Edisi</label>
                              <div class="input-control text size3">
                                  <input type="text" placeholder="Edisi" name="edisiTB" id="edisiTB">
                                  <button class="btn-clear"></button>
                              </div>

                              <label>Jenis Buku</label>
                              <div class="input-control select size3">
                                  <select name="jenis_bukuTB" id="jenis_bukuTB"></select>
                              </div>
                              <a href="#" data-hint="Tambah Jenis Buku" xclass="large" id="jenisbukuBC" class="button"><span class="icon-plus-2"></span> </a>

                              </div>
                                <!-- End Span-->
                              <div class="span6">
                                <label><b>Gambar Sampul Buku:</b></label>
                               <img width="150" id="previmg" src="../img/no_image.jpg" ><br>
                              <div class="input-control file info-state size3" data-role="input-control">
                               <input type="hidden" id="k_photoH"/>
                               <div id="photoDV" class="input-control file" data-role="input-control">
                                    <input onchange="PreviewImage(this);" id="k_photoTB" name="k_photoTB" type="file">
                                    <button class="btn-file"></button>
                                </div>
                              </div>
                                <label><b>Deskripsi Buku :</b></label>
                                <label>Jumlah Halaman :</label>
                                <div class="input-control text size2">
                                    <input type="text" name="jumlahTB" id="jumlahTB">
                                    <button class="btn-clear"></button>
                                </div>                                

                                <label>Dimensi :</label>
                                <div class="input-control text size3">
                                    <input type="text" placeholder="Dimensi" name="dimensiTB" id="dimensiTB">
                                    <button class="btn-clear"></button>
                                </div>                                

                                <label>Sinopsis :</label>
                                <div class="input-control textarea">
                                    <textarea placeholder="Sinopsis" name="sinopsisTB" id="sinopsisTB"></textarea>
                                </div>                                

                              </div>
                                <!-- End span-->

                              
                            </div>
                          </div>
                                <!-- End Grid-->
                        </div>
                        <div class="form-actions"> &nbsp;
                            <button class="button primary">simpan</button>&nbsp;
                            <a class="button" href="#" onclick="switchPN(); return false;" >Batal</a> 
                            <!-- <button class="button" type="button" onclick="$.Dialog.close()">Batal</button>  -->
                        </div>
                    </form>

                    </div>
                            <!-- End Scroll -->

                        <!-- Panel Data Siswa-->                                             
    </div>