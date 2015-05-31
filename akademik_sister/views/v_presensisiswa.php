<script src="controllers/c_presensisiswa.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script> -->
<!-- <script src="js/metro/metro-hint.js"></script> -->
<!-- <script src="js/metro/metro-calendar.js"></script> -->
<script src="js/metro/metro-datepicker.js"></script>

<h4 style="color:white;">Penerimaan Siswa Baru</h4>
<div id="loadarea"></div>

<!-- <button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button> -->
<div class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span2">
    <select data-hint="Tingkat" name="tingkatS" id="tingkatS"></select>
</div>
<div class="input-control select span2">
    <select data-hint="Kelas" name="kelasS" id="kelasS"></select>
</div><br>
<div class="input-control select span2">
    <select data-hint="tahun" name="tahunS" id="tahunS">
    </select>
</div>
<div class="input-control select span1">
    <select data-hint="bulan" name="bulanS" id="bulanS">
    </select>
</div>
<button class="success" data-hint="klik untuk mengisi absensi HARI INI" ><b>Presensi Hari Ini</b></button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
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
            <th class="text-left"><input placeholder="No Pendaftaran" id="no_pendaftaranS" name="no_pendaftaranS"></th>
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
