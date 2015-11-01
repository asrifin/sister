<?php isMenu($modul,'rekeningbiaya'); ?>
<script src="controllers/c_rekeningbiaya.js"></script>
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <li><a href="biaya">Biaya</a></li>
        <li class="active"><a href="#"><b>rekening-Biaya</b></a></li>
        <li><a href="detail-biaya">Detail-Biaya</a></li>
    </ul>
</nav>
<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select class="cari" data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Biaya</th>
            <th class="text-center">Rekening (COA)</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr id="cariTR" class="info">
            <th><input type="text" data-transform="input-control" class="cari" placeholder="cari ..." id="biayaS"></th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody id="tbody">
    </tbody>
</table> 