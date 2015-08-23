<?php isMenu($modul,'detailgelombang'); ?>
<script src="controllers/c_detailgelombang.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <li><a href="gelombang">Gelombang</a></li>
        <li class="active"><a href="#"><b>Detail Gelombang</b></a></li>
    </ul>
</nav>
<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select class="cari" data-hint="tahunajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Gelombang</th>
            <th class="text-center">Tgl Mulai</th>
            <th class="text-center">Tgl Selesai</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="info">
<!--             <th>
                <div class="input-control select">
                    <select  class="cari" data-hint="tingkat" name="tingkatS" id="tingkatS"></select>
                </div>
            </th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="subtingkatS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="keteranganS"></div></th>
            <th></th>
 -->        </tr>
    </thead>
    <tbody id="tbody">
    </tbody>
</table> 