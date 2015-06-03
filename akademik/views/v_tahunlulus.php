<script src="controllers/c_tahunlulus.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Tahun Lulus</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<!-- <button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button> -->
<div class="input-control select span3">
    <select data-hint="Tahun Lulus" name="departemenTB" id="departemenS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">No.</th>
            <!-- <th class="text-left">Angkatan</th> -->
            <th class="text-left">Nama</th>
            <th class="text-left">Aksi</th>
        </tr>
        <!-- <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="angkatan" id="angkatanS" name="angkatanS"></th>
            <th class="text-left"><input placeholder="keterangan" id="keteranganS"name="keteranganS"></th>
            <th class="text-left"></th>
        </tr> -->
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>

<!--// ---------------------- //
    // -- created by epiii -- //
    // ---------------------- // -->