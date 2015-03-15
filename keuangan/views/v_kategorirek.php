<script src="controllers/c_kategorirek.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>
<script src="../js/metro/metro-calendar.js"></script>
<script src="../js/metro/metro-datepicker.js"></script>

<h4 style="color:white;">Kategori Rekening</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-left">Kode </th>
            <th class="text-left">Nama</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"><input placeholder="kode" id="kodeS" name="kodeS"></th>
            <th class="text-left"><input placeholder="kategori" id="namaS" name="namaS"></th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>

