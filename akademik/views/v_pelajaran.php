<script src="controllers/c_pelajaran.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>

<h4 style="color:white;">Pelajaran</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
    <select data-hint="Departemen" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" cari="cari" name="tahunajaranS" id="tahunajaranS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">No.</th>
            <th class="text-left">Mata Pelajaran </th>
            <th class="text-left">Singkatan</th>
            <th class="text-left">SKM</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="pelajaran" id="pelajaranS" class="cari"></th>
            <th class="text-left"><input placeholder="singkatan" id="singkatanS" class="cari"></th>
            <th class="text-left"><input placeholder="skm" id="skmS"  class="cari"></th>
            <th class="text-left"><input placeholder="keterangan" id="keteranganS"  class="cari"></th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
<!-- 
    // ---------------------- //
    // -- created by epiii -- //
    // ---------------------- // -->