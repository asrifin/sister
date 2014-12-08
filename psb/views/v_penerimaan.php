<script src="controllers/c_penerimaan.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>

<h4 style="color:white;">Penerimaan Siswa Baru</h4>
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
    <select data-hint="Kelompok" name="kelompokS" id="kelompokS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-left">No</th>
            <th class="text-left">Nama </th>
            <th class="text-left">NIS</th>
            <th class="text-left">NISN</th>
            <th class="text-left">Status</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"><input placeholder="No Pendaftaran" id="no_pendaftanS" name="no_pendaftanS"></th>
            <th class="text-left"><input placeholder="nama" id="namaS" name="namaS"></th>
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
