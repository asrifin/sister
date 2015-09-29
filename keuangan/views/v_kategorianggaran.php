<?php isMenu($modul,'kategorianggaran'); ?>
<script src="controllers/c_kategorianggaran.js"></script>
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
        <button class="place-left" <?php echo isAksi('kategorianggaran','c')?'onclick="loadFR(\'\');"':'disabled';  ?>  data-hint="Tambah Data" id="a_tambahBC"><span class="icon-plus-2"></span> </button>
        <li class="active"><a href="#"><b>Kategori Anggaran</b></a></li>
        <li><a href="detil-anggaran">Item Anggaran</a></li>
        <li><a href="anggaran-tahunan">Anggaran Tahunan</a></li>
    </ul>
</nav>

<button class="fg-white bg-blue" data-hint="Cetak Rencana" id="a_cetakBC"><span class="icon-printer"></span> </button>
<button class="fg-white bg-orange" data-hint="Cetak Realisasi" id="a_cetak2BC"><span class="icon-printer"></span> </button>
<div class="input-control select size3">
    <select data-hint="Departemen" class="cari" name="departemenS" id="departemenS" data-hint="Departemen" ></select>
</div> 
<div class="input-control select size3">
    <select data-hint="Tingkat" class="cari" name="tingkatS" id="tingkatS" data-hint="Tingkat" ></select>
</div> 

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kategori Anggaran </th>
            <th class="text-center">Rekening</th>
            <th class="text-center">Tujuan</th>
            <th class="text-center">Jumlah</th>
            <th class="text-center">Kuota Anggaran</th>
            <th class="text-center">Sisa Anggaran</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr id="a_cariTR" class="info">
            <th class="text-center"><input data-transform="input-control" placeholder="cari ..." id="kategorianggaranS" class="cari" class="span1"></th>
            <th class="text-center"><input data-transform="input-control" placeholder="cari ..." id="detilrekeningS" class="cari"></th>
            <th class="text-center"><input data-transform="input-control" placeholder="cari ..." id="keteranganS" class="cari"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody"></tbody>
</table>
