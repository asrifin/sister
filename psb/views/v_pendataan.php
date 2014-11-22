<script src="controllers/c_pendataan.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>
 -->
<h4 style="color:white;">Pendataan Calon Siswa</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;" class="info">
            <th class="text-left" rowspan="2">Nomor Pendaftaran</th>
            <th class="text-left" rowspan="2">Nama</th>
            <th class="text-left" rowspan="2">Uang Pangkal</th>
            <th class="text-center" colspan="3">Discount</th>
            <th class="text-right" rowspan="2">Denda</th>
            <th class="text-left" rowspan="2">Uang Pangkal Net</th>
            <th class="text-left">Angsuran</th>
            <th class="text-left" rowspan="2">Aksi</th>
        </tr>
        <tr style="color:white;" class="info">
            <th class="text-right">Subsidi</th>
            <th class="text-right">Saudara</th>
            <th class="text-right">Tunai</th>
            <th>x bulan</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <!-- <th class="text-left"></th> -->
            <th class="text-left"><input placeholder="no pendaftaran" id="nopendaftaranS" name="nopendaftaranS"></th>
            <!-- <th class="text-left"><input placeholder="tglpendaftaran" id="tglpendaftaranS" name="tglpendaftaranS"></th> -->
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
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

<table style="display:none;" class="table hovered bordered striped">
    <thead>
        <tr style="color:white;" class="info">
            <th class="text-left" rowspan="2">Nomor Pendaftaran</th>
            <th class="text-left" rowspan="2">Nama</th>
            <th class="text-left" rowspan="2">Uang Pangkal</th>
            <th class="text-center" colspan="3">Discount</th>
            <th class="text-right" rowspan="2">Denda</th>
            <th class="text-left" rowspan="2">Uang Pangkal Net</th>
            <th class="text-left">Angsuran</th>
            <th class="text-left" rowspan="2">Aksi</th>
        </tr>
        <tr style="color:white;" class="info">
            <th class="text-right">Subsidi</th>
            <th class="text-right">Saudara</th>
            <th class="text-right">Tunai</th>
            <th>x bulan</th>
        </tr>
        <tr id="cariTR" class="selected">
            <!-- <th class="text-left"></th> -->
            <th class="text-left"><input placeholder="no pendaftaran" id="nopendaftaranS" name="nopendaftaranS"></th>
            <!-- <th class="text-left"><input placeholder="tglpendaftaran" id="tglpendaftaranS" name="tglpendaftaranS"></th> -->
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
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