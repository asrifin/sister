<script src="controllers/c_anggaran.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<h4 style="color:white;">Anggaran</h4>
<div id="loadarea"></div>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<!-- panel 1 -->
<div title="Kategori Anggaran" class="panelx" id="panel1" style="display:none;">
<!--     <div class="input-control select span3">
        <select class="anggaran_cari" name="a_tahunbukuS" id="a_tahunbukuS" data-hint="Tahun Buku" ></select>
    </div> -->
<!--     <div class="input-control select span3">
        <select class="anggaran_cari" name="a_departemenS" id="a_departemenS" data-hint="Departemen" ></select>
    </div> -->
    <button data-hint="Tambah Data" id="a_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="a_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak" id="a_cetakBC"><span class="icon-printer"></span> </button>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Kategori Anggaran </th>
                <th class="text-center">Keterangan</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr style="display:none;" id="a_cariTR" class="info">
                <th class="text-center"><input placeholder="nama" id="a_namaS" class="anggaran_cari" class="span1"></th>
                <th class="text-center"><input placeholder="keterangan" id="a_keteranganS" class="anggaran_cari"></th>
                <th class="text-center"></th>
            </tr>
        </thead>

        <tbody id="anggaran_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 1 -->

<!-- panel 2 -->
<div title="Detil Anggaran" class="panelx" id="panel2" style="display:none;">
    <button data-hint="kembali" id="d_kategorianggaranBC"><span class=" icon-arrow-left-2"></span> </button>
    <button data-hint="Tambah Data" id="d_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="k_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak " id="k_cetakBC"><span class="icon-printer"></span> </button>
    
    <div class="grid" style="color:white;">
        <input type="hidden" id="d_kategorianggaranH" id="d_kategorianggaranH" class="detilanggaran_cari" >
        <div class="row">
            <span class="span3">Kategori Anggaran : </span>
            <span id="d_kategorianggaranDV"></span>
        </div>
        <div class="row">
            <span class="span3">Keterangan:</span>
            <span id="d_keteranganDV"></span>
        </div>
        <div class="row">
            <div class="span3" >Departemen :</div>
			<div class="input-control select size3">
				<select class="detilanggaran_cari" name="d_departemenS" id="d_departemenS" data-hint="Departemen" ></select>
			</div> 
        </div>
    </div>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Anggaran </th>
                <th class="text-center">Rekening</th>
                <th class="text-center">Keterangan</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr style="display:none;" id="k_cariTR" class="info">
                <th class="text-left"><input placeholder="Anggaran" id="d_namaS"  class="detilanggaran_cari" class="span1"></th>
                <th class="text-left"><input placeholder="Rekening" id="d_rekeningS"  class="detilanggaran_cari" class="span1"></th>
                <th class="text-left"><input placeholder="Keterangan" id="d_keteranganS" class="detilanggaran_cari"></th>
                <th class="text-center"></th>
            </tr>
        </thead>

        <tbody id="detilanggaran_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 2 -->

<!-- panel 3 -->
<div title="Unit Barang" class="panelx" id="panel3" style="display:none;">
    <button data-hint="kembali ke Katalog" id="b_katalogBC"><span class=" icon-arrow-left-2"></span> </button>
    <button data-hint="Ubah Data" id="b_ubahBC"><span class="icon-pencil"></span> </button>
    <button data-hint="Tambah Data" id="b_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="b_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak" id="b_cetakBC"><span class="icon-printer"></span> </button>

    <input type="hidden"  class="barang_cari" id="b_katalogS">
    <div class="grid" style="color:white;">
         <div class="row">
            <div class="span5">
                <label>Keterangan </label>
                <div class="row">
                    <div class="span2">Nama Barang :</div>
                    <div id="b_katalogDV" class="span2"></div>
                </div>
                <div class="row">
                    <div class="span2">Grup Barang :</div>
                    <div id="b_grupDV" class="span2"></div>
                </div>
                <div class="row">
                    <div class="span2">Lokasi :</div>
                    <div id="b_lokasiDV" class="span2"></div>
                </div>    
                <div class="row">
                    <div class="span2">Jumlah Unit :</div>
                    <div id="b_totbarangDV" class="span2"></div>
                </div>    
                <div class="row">
                    <div class="span2">Total Aset :</div>
                    <div id="b_totasetDV" class="span2"></div>
                </div>    
                <div class="row">
                    <div class="span2">Penyusutan per th :</div>
                    <div id="b_susutDV" class="span2"></div>
                </div>    
            </div>  
            <div class="span5 xoffset1">
                <div class="span5">
                    <label for="">Gambar :</label>
                    <img id="b_photoIMG" src="../img/no_image.jpg" width="200" class="shadow">
                </div>
            </div>  
            <div class="span5">
                <div class="span5">
                    <label for="">Presentase Kondisi :</label>
                    <img src="../images/5.jpg" width="200" class="shadow">
                </div>
            </div>
        </div>
    </div>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Kode </th>
                <th class="text-center">Barcode</th>
                <th class="text-left">Tempat</th>
                <th class="text-left">Sumber</th>
                <th class="text-left">Harga</th>
                <th class="text-left">Kondisi</th>
                <th class="text-left">Status</th>
                <th class="text-left">Keterangan</th>
                <th class="text-left">Aksi</th>
            </tr>
            <tr style="display:none;" id="b_cariTR" class="selected">
                <th class="text-left"><input placeholder="kode" id="b_kodeS"class="barang_cari"></th>
                <th class="text-left"><input placeholder="barkode" id="b_barkodeS" class="barang_cari"></th>
                <th class="text-left"></th>
                <th class="text-left">
                    <select class="barang_cari" id="b_sumberS">
                        <option value="">-Semua-</option>
                        <option value="0">Beli</option>
                        <option value="1">Pemberian</option>
                        <option value="2">Membuat Sendiri</option>
                    </select> 
                </th>
                <th class="text-left"><input  class="barang_cari" placeholder="harga" id="b_hargaS"></th>
                <th class="text-left">
                    <select  class="barang_cari"id="b_kondisiS"></select>
                </th>
                <th class="text-left">
                    <select id="b_statusS" class="barang_cari">
                        <option value="">-Semua-</option>
                        <option value="1">Tersedia</option>
                        <option value="2">Dipinjam</option>
                    </select>
                </th>
                <th class="text-left"><input placeholder="keterangan" id="b_keteranganS" class="barang_cari"></th>
                <th class="text-left"></th>
            </tr>
        </thead>
        <tbody id="barang_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- tes lagi ah  -->
<!-- end of panel 3 -->
<!-- 
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
 -->
