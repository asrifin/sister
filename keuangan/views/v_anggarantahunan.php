<?php isMenu($modul,'anggarantahunan'); ?>
<script src="controllers/c_anggarantahunan.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-slider.js"></script>
<script src="../js/base64.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <li><a href="kategori-anggaran">Kategori Anggaran</a></li>
        <li><a href="detil-anggaran">Item Anggaran</a></li>
        <li  class="active"><b><a href="#">Anggaran Tahunan</a></b></li>
    </ul>
</nav>

<div class="input-control select size3">
    <!-- <label class="fg-white">Departemen</label> -->
    <select data-hint="Departemen" class="cari" name="departemenS" id="departemenS" data-hint="Departemen" ></select>
</div> 
<div class="input-control select size2">
    <!-- <label class="fg-white">Tingkat</label> -->
    <select data-hint="Tingkat" class="cari" name="tingkatS" id="tingkatS" data-hint="Tingkat" ></select>
</div> 
<div class="input-control select size3">
    <!-- <label class="fg-white">Kategori Anggaran</label> -->
    <select data-hint="kategori" class="cari" name="kategorianggaranS" id="kategorianggaranS" data-hint="kategorianggaran" ></select>
</div> 
<div class="input-control select size2">
    <!-- <label class="fg-white">Tahun Ajaran</label> -->
    <select data-hint="Tahun Ajaran" class="cari" name="tahunajaranS" id="tahunajaranS" data-hint="tahunajaran" ></select>
</div> 

<div class="place-right input-control text size2">
    <input id="anggaranKuotaPerKategoriTB" data-hint="Total Kuota" data-hint-position="top" type="text" readonly class="text-right  bg-green fg-white">
</div> 
<div class="place-right input-control text size2">
    <input id="anggaranTerpakaiPerKategoriTB" data-hint-position="top" data-hint="Total Terpakai" type="text" readonly class="text-right bg-red fg-white">
</div> 

<div style="overflow:scroll;height:500px;">
    <table class="table hovered bordered striped">
        <thead>
            <tr class="bg-blue fg-white">
                <th class="text-center">Detail Anggaran</th>
                <th class="text-center">Keterangan</th>
                <th colspan="2" class="text-center">Nominal</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr id="a_cariTR" class="bg-blue fg-white">
                <th class="text-center"><input data-transform="input-control" placeholder="cari ..." id="detilanggaranS" class="cari"></th>
                <th class="text-center"><input data-transform="input-control" placeholder="cari ..." id="keteranganS" class="cari"></th>
                <th class="text-center">Terpakai</th>
                <th class="text-center">Kuota</th>
                <th class="text-center"></th>
            </tr>
        </thead>

        <tbody id="tbody"></tbody>
    </table>
</div>

