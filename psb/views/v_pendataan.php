<script src="controllers/c_pendataan.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>
 -->
<h4 style="color:white;">Pendataan Calon Siswa</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>

<table class="table hovered bordered striped panelx" id="panel1">
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
            <th class="text-left"><input placeholder="no pendaftaran" id="nopendaftaranS" name="nopendaftaranS"></th>
            <!-- <th class="text-left"><input placeholder="tglpendaftaran" id="tglpendaftaranS" name="tglpendaftaranS"></th> -->
            <th class="text-left"><input placeholder="nama" id="namaS" name="namaS"></th>
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

<div class="panel" style="display:none">
<div class="panel-header">
    Panel Header...
</div>
<div class="panel-content">
<form autocomplete="off" onsubmit="simpan();return false;" id="pendataanFR" class="panelx" style="display:none"> 
Isi
</form>

</div>
</div>


   <!--  <div class="window" class="panelx" style="display:none">
    <div class="caption">
    <span class="icon icon-windows"></span> //window icon, also you can use img tag
    <div class="title">Window caption</div> // window title
    <button class="btn-min"></button> // minimize button
    <button class="btn-max"></button> // maximize button
    <button class="btn-close"></button> // close button
    </div>
    <div class="content">
    Window content
    </div>
    </div>
 -->
   <!--  <div class="grid">
        <div class="row">
            <div class="span4">...</div>
            <div class="span8">...</div>
        </div>
    </div> -->

<!-- <form autocomplete="off" onsubmit="simpan();return false;" id="pendataanFR" class="panelx" style="display:none"> 
                    <input id="idformH" type="hidden"> 
                   <div class="grid span10">
                       <div class="row">
                           <div class="span4">
                                   <legend>Informasi Peminjam</legend>
                                   <input id="idformH" type="hidden"> 
                                   <label>Lokasi</label>

                                   <div class="input-control text">
                                       <input  type="hidden" name="lokasiH" id="lokasiH" class="span4">
                                        //<input enabled="enabled" name="lokasiTB" id="lokasiTB" class="span4">
                                       <input disabled="disabled" name="lokasiTB" id="lokasiTB" class="span4">
                                       <button class="btn-clear"></button>
                                   </div>
                                    
                                   <label>Peminjam</label>
                                   <div class="input-control text">
                                       <input placeholder="Nama Peminjam"  class="span4" required type="text" name="peminjamTB" id="peminjamTB">
                                       <button class="btn-clear"></button>
                                   </div>

                                   <label>Tempat</label>
                                   <div class="input-control text">
                                       <input class="span4"  placeholder="Tempat" required type="text" name="tempatTB" id="tempatTB">
                                       <button class="btn-clear"></button>
                                   </div>

                                   <label>Tanggal Peminjaman</label>
                                   <div class="input-control text" data-role="datepicker"
                                       data-date="2014-10-23"
                                       data-format="yyyy-mm-dd"
                                       data-effect="slide">
                                       <input class="span4" id="tanggal1TB" name="tanggal1TB" type="text">
                                       <button class="btn-date"></button>
                                   </div>

                                   <label>Tanggal Pengembalian</label>
                                   <div class="input-control text" data-role="datepicker"
                                       data-date="2014-10-23"
                                       data-format="yyyy-mm-dd"
                                       data-effect="slide">
                                       <input class="span4   " id="tanggal2TB" name="tanggal2TB" type="text">
                                       <button class="btn-date"></button>
                                   </div>

                                   <label>Keterangan</label>
                                   <div class="input-control textarea">
                                       <textarea class="span4" placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>
                                   </div>
                           </div>
                        
                           <div class="span4">
                               <div>
                                   <legend>Pilih Barang</legend>
                                   <table class="table hovered bordered striped">
                                       <thead>
                                           
                                           <tr id="cariTR" class="selected">
                                               <th class="text-left"><input keydown="viewTB2();" placeholder="Nama Barang" id="namaS" name="namaS"></th>
                                           </tr>
                                           <tr style="color:white;"class="info">
                                               <th class="text-center">Kode Barang</th>
                                               <th class="text-center">Nama Barang</th>
                                               <th class="text-center">Aksi</th>
                                           </tr>
                                       </thead>

                                       <tbody id="tbody2">
                                           
                                       </tbody>
                                       <tfoot>
                                            
                                       </tfoot>
                                   </table>
                               </div>
                               <div>
                                   <legend>Pilih Barang</legend>
                                   <table class="table hovered bordered striped">
                                       <thead>
                                           
                                           <tr id="cariTR" class="selected">
                                               <th class="text-left"><input placeholder="Nama Barang" id="namaS" name="namaS"><button onclick="return viewTB2();" class="btn-date">Cari</button></th>
                                           </tr>
                                           <tr style="color:white;"class="info">
                                               <th class="text-center">Kode Barang</th>
                                               <th class="text-center">Nama Barang</th>
                                               <th class="text-center">Aksi</th>
                                           </tr>
                                       </thead>

                                       <tbody id="tbody3">
                                           
                                       </tbody>
                                       <tfoot>
                                            
                                       </tfoot>
                                   </table>
                               </div>
                           </div>
                        
                       </div>
                   </div>
                   <div class="form-actions"> 
                       <button class="button primary">simpan</button>&nbsp;
                       <button class="button" type="button" onclick="$.Dialog.close()">Batal</button> 
                   </div>    
                        
                    </form>; -->
