<script src="controllers/c_tahunbuku.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>
<script src="../js/metro/metro-calendar.js"></script>
<script src="../js/metro/metro-datepicker.js"></script>

<h4 style="color:white;">Tahun Buku</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">No.</th>
            <th class="text-left">Nama Tahun Buku </th>
            <th class="text-left">Tanggal Mulai</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Status</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="tahunbuku" id="tahunbukuS" name="tahunbukuS"></th>
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

