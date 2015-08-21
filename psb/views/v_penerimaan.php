<script src="controllers/c_penerimaan.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>

<h4 style="color:white;">Penerimaan Siswa Baru</h4>
<div id="loadarea"></div>

<!-- <button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button> -->
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div style="display:none;"class="input-control select span3">
    <select data-hint="Departemen" class="cari" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" class="cari" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Kelompok" class="cari" name="kelompokS" id="kelompokS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">No</th>
            <th class="text-center">Nama </th>
            <th class="text-center">NIS</th>
            <th class="text-center">NISN</th>
            <th class="text-center">Status</th>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="No Pendaftaran" id="no_pendaftaranS" name="no_pendaftaranS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="nama" id="namaS" name="namaS"></div></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
