<script src="controllers/c_rekening.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Kode Rekening</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
    <select data-hint="Kategori Rekening" name="kategorirekS" id="kategorirekS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kode</th>
            <th class="text-center">Rekening</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="aktivitas" id="kodeS" name="kodeS"></th>
            <th class="text-left"><input placeholder="nama" id="namaS" name="namaS"></th>
            <th class="text-left"><input placeholder="keterangan" id="keteranganS" name="keteranganS"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
