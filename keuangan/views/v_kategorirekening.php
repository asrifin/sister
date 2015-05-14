<script src="controllers/c_kategorirekening.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Kategori Rekening</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kode </th>
            <th class="text-center">Nama</th>
            <th class="text-center">Jenis</th>
            <th class="text-center">Penambahan</th>
            <th class="text-center">Pengurangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input placeholder="cari..." id="kodeS" name="kodeS"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="cari..." id="namaS" name="namaS"></div></th>
            <th colspan="4" class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>

