<script src="controllers/c_kelompok.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>
 -->
<h4 style="color:white;">Kelompok Pendaftaran</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select class="cari" data-hint="Tahun Ajaran" name="prosesS" id="prosesS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kelompok</th>
            <th class="text-center">Tanggal Pendaftaran </th>
            <!-- <th class="text-center">Biaya Pendaftaran</th> -->
            <th class="text-center">Calon Siswa</th>
            <th class="text-center">Siswa Diterima</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"><input class="cari" placeholder="kelompok" id="kelompokS" name="kelompokS"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
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

<table style="display:none;" id="tambah" class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Pendataan Siswa</th>
            <th class="text-center">Tanggal Pendaftaran </th>
            <th class="text-center">Biaya Pendaftaran</th>
            <th class="text-center">Calon Siswa</th>
            <th class="text-center">Siswa Diterima</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>