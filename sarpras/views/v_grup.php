<script src="controllers/c_grup.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Inventaris</h4>
<div id="loadarea"></div>

<!-- <button class="cl" id="1">1</button> -->
<!-- <button class="cl" id="2">2</button> -->
<!-- <button class="cl" id="3">3</button> -->

<!-- panel 1 -->
<div title="Grup Barang" class="panelx" id="panel1" style="display:none;">
    <div class="input-control select span3">
        <select data-hint="lokasi" name="g_lokasiS" id="g_lokasiS"></select>
    </div>
    <button data-hint="Tambah Data" id="g_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="g_cariBC"><span class="icon-search"></span> </button>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Kode </th>
                <th class="text-center">Grup Barang</th>
                <th class="text-left">Jum Unit</th>
                <th class="text-left">Unit Tersedia</th>
                <th class="text-left">Unit Dipinjam</th>
                <th class="text-left">Total Aset</th>
                <th class="text-left">Keterangan</th>
                <th class="text-left">Aksi</th>
            </tr>
            <tr style="display:none;" id="g_cariTR" class="selected">
                <th class="text-left"><input placeholder="kode" id="g_kodeS" name="g_kodeS" class="span1"></th>
                <th class="text-left"><input placeholder="nama" id="g_namaS" name="g_namaS"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"><input placeholder="keterangan" id="g_keteranganS" name="g_keteranganS"></th>
                <th class="text-left"></th>
            </tr>
        </thead>

        <tbody id="g_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 1 -->

<!-- panel 2 -->
<div title="Katalog Barang" class="panelx" id="panel2" style="display:none;">
    <button data-hint="kembali" id="k_grupBC"><span class=" icon-arrow-left-2"></span> </button>
    <button data-hint="Tambah Data" id="k_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="k_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak " id="k_cetakBC"><span class="icon-printer"></span> </button>
    
    <div class="grid" style="color:white;">
        <input type="hidden" id="k_grupH">
        <div class="row">
            <div class="span2">Grup Barang </div>
            <div id="k_grupDV" class="span2"></div>
        </div>
        <div class="row">
            <div class="span2">Lokasi</div>
            <div id="k_lokasiDV" class="span2"></div>
        </div>
        <div class="row">
            <div class="span2">Total Aset</div>
            <div id="k_totasetDV" class="span2"></div>
        </div>
    </div>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Kode </th>
                <th class="text-center">Nama Barang</th>
                <th class="text-left">Jenis</th>
                <th class="text-left">Jumlah Unit</th>
                <th class="text-left">Asset</th>
                <th class="text-left">Penyusutan per th</th>
                <th class="text-left">Keterangan</th>
                <th class="text-left">Aksi</th>
            </tr>
            <tr style="display:none;" id="k_cariTR" class="selected">
                <th class="text-left"><input placeholder="kode" id="k_kodeS" name="k_kodeS" class="span1"></th>
                <th class="text-left"><input placeholder="nama" id="k_namaS" name="k_namaS"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"><input placeholder="keterangan" id="k_keteranganS" name="k_keteranganS"></th>
                <th class="text-left"></th>
            </tr>
        </thead>

        <tbody id="k_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 2 -->

<!-- panel 3 -->
<div title="Unit Barang" class="panelx" id="panel3" style="display:none;">
    <button data-hint="kembali" id="b_inventoryBC"><span class=" icon-arrow-left-2"></span> </button>
    <button data-hint="Tambah Data" id="b_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="b_cariBC"><span class="icon-search"></span> </button>
    
    <div class="grid"  style="color:white;">
        <div class="row">
            <div class="span2">Grup Barang </div>
            <div id="k_grupDV" class="span2"></div>
        </div>
        <div class="row">
            <div class="span2">Lokasi</div>
            <div id="k_lokasiDV" class="span2"></div>
        </div>
        <div class="row">
            <div class="span2">Total Aset</div>
            <div id="k_totasetDV" class="span2"></div>
        </div>
    </div>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Kode </th>
                <th class="text-center">Nama Barang</th>
                <th class="text-left">Jenis</th>
                <th class="text-left">Jumlah Unit</th>
                <th class="text-left">Asset</th>
                <th class="text-left">Penyusutan per th</th>
                <th class="text-left">Keterangan</th>
                <th class="text-left">Aksi</th>
            </tr>
            <tr style="display:none;" id="b_cariTR" class="selected">
                <th class="text-left"><input placeholder="kode" id="k_kodeS" name="k_kodeS" class="span1"></th>
                <th class="text-left"><input placeholder="nama" id="k_namaS" name="k_namaS"></th>
                <th class="text-left"><input placeholder="jenis" id="k_jenisS" name="k_jenisS" class="span1"></th>
                <th class="text-left"><input placeholder="jumlah unit" id="k_jumunitS" name="k_jumunitS" class="span1"></th>
                <th class="text-left"><input placeholder="aset" id="k_hargaS" name="k_hargaS"  class="span1"></th>
                <th class="text-left"><input placeholder="penyusutan" id="k_susutS" name="k_susutS"  class="span1"></th>
                <th class="text-left"><input placeholder="keterangan" id="k_keteranganS" name="k_keteranganS"></th>
                <th class="text-left"></th>
            </tr>
        </thead>

        <tbody id="b_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 3 -->

<!-- 
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
 -->