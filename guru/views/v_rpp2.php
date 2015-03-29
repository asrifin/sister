<script src="controllers/c_rpp2.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<!-- <script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script> -->

<h4 style="color:white;">Rencana Pembelajaran</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Semester" name="semesterS" id="semesterS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tingkat" name="tingkatS" id="tingkatS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Sub Tingkat" name="subtingkatS" id="subtingkatS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Pelajaran" name="pelajaranS" id="pelajaranS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">No.</th>
            <th class="text-left">Kode</th>
            <th class="text-left">Unit</th>
            <th class="text-left">Deskripsi</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="kode" id="kodeS" name="kodeS"></th>
            <th class="text-left"><input placeholder="unit" id="unitS" name="unitS"></th>
            <th class="text-left"><input placeholder="deksripsi" id="deksripsiS" name="deksripsiS"></th>
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
    // -- created by rovi -- //
    // ---------------------- // -->