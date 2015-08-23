<?php isMenu($modul,'detailkelas'); ?>

<script src="controllers/c_detailkelas.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<!-- combo grid -->
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!--end of combo grid -->

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <!-- <button class="place-left" data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>  -->
        <li><a href="tingkat">Tingkat</a></li>
        <li><a href="subtingkat">Sub Tingkat</a></li>
        <li><a href="kelas">Kelas</a></li>
        <li class="active"><a href="#"><b>Detail Kelas</b></a></li>
    </ul>
</nav>

<div class="input-control select size3">
    <select class="cari" data-hint="departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select size3">
    <select class="cari" data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Tingkat</th>
            <th class="text-center">Sub Tingkat</th>
            <th class="text-center">Nama Kelas </th>
            <th class="text-center">Wali Kelas</th>
            <!-- <th class="text-center">Kapasitas</th> -->
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th>
                <div class="input-control select">
                    <select class="cari" data-hint="Tingkat" name="tingkatS" id="tingkatS"></select>
                </div>
            </th>
            <th>
                <div class="input-control select">
                    <select class="cari" data-hint="sub Tingkat" name="subtingkatS" id="subtingkatS"></select>
                </div>
            </th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="kelasS" name="kelasS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="namaS" name="namaS"></div></th>
            <!-- <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="kapasitasS" name="kapasitasS"></div></th> -->
            <th></th>
        </tr>
    </thead>
    <tbody id="tbody"></tbody>
</table>