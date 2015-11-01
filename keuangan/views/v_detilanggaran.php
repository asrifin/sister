<?php isMenu($modul,'detilanggaran'); ?>
<script src="controllers/c_detilanggaran.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button class="place-left" <?php echo isAksi('detilanggaran','c')?'onclick="viewFR(\'\');"':'disabled';  ?>  data-hint="Tambah Data" id="a_tambahBC"><span class="icon-plus-2"></span> </button>
        <li><a href="kategori-anggaran">Kategori Anggaran</a></li>
        <li class="active"><a href="#"><b>Item Anggaran</b></a></li>
        <li><a href="anggaran-tahunan">Anggaran Tahunan</a></li>
    </ul>
</nav>

<div class="input-control select size3">
    <select data-hint="Departemen" class="cari" name="departemenS" id="departemenS" data-hint="Departemen" ></select>
</div> 
<div class="input-control select size3">
    <select data-hint="Tingkat" class="cari" name="tingkatS" id="tingkatS" data-hint="Tingkat" ></select>
</div> 
<div class="input-control select size3">
    <select data-hint="kategori" class="cari" name="kategorianggaranS" id="kategorianggaranS" data-hint="kategorianggaran" ></select>
</div> 

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Detail Anggaran</th>
            <th class="text-center">Tujuan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr id="a_cariTR" class="info">
            <th class="text-center"><input data-transform="input-control" placeholder="cari ..." id="detilanggaranS" class="cari"></th>
            <th class="text-center"><input data-transform="input-control" placeholder="cari ..." id="keteranganS" class="cari"></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody"></tbody>
</table>
