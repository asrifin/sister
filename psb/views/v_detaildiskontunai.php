<?php isMenu($modul,'detaildiskontunai'); ?>
<script src="controllers/c_detaildiskontunai.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <li><a href="diskon-tunai">Diskon Tunai</a></li>
        <li class="active"><a href="#"><b>Detail Diskon Tunai</b></a></li>
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
            <th class="text-center">Diskon</th>
            <th class="text-center">Nilai</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Status</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="info">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="diskontunaiS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="nilaiS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="keteranganS"></div></th>
            <th class="text-center"><div class="input-control select"><select class="cari" id="isAktifS"><option value="">-SEMUA-</option><option class="fg-white bg-green"  value="1">AKtif</option><option class="fg-white bg-red" value="0">Tidak Aktif</option></select></div></th>
            <th>
                <!-- <button data-hint="refresh" onclick="refreshBC();" class="fg-white bg-orange"><i class="icon-reply"></i></button> -->
            </th>
        </tr>
    </thead>
    <tbody id="tbody">
    </tbody>
</table> 