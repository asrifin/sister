<?php isMenu($modul,'saldorekening'); ?>
<script src="controllers/c_saldorekening.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <li><a href="kategori-rekening"<b>Kategori Rek.</b></a></li>
        <li><a href="detil-rekening">Detil Rek.</a></li>
        <li class="active"><a href="#">Saldo Rek.</a></li>
    </ul>
</nav>

<div class="input-control select span4">
    <select data-hint="Kategori Rekening" class="cari" name="kategorirekeningS" id="kategorirekeningS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun" class="cari" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div style="overflow:scroll;height:500px;">
    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center" rowspan="2">Kode</th>
                <th class="text-center" rowspan="2">Rekening</th>
                <th class="text-center" colspan="2">Saldo Awal</th>
                <th class="text-center" colspan="2">Saldo Sementara</th>
                <th class="text-center" rowspan="2">Aksi</th>
            </tr>
            <tr style="color:white;" class="info">
                <th>debit</th>
                <th>kredit</th>
                <th>debit</th>
                <th>kredit</th>
            </tr>
            <tr id="cariTR" class="selected">
                <th><div class="input-control text"><input  class="cari" placeholder="cari ..." id="kodeS" name="kodeS"></div></th>
                <th><div class="input-control text"><input  class="cari" placeholder="cari ..." id="namaS" name="namaS"></div></th>
                <th colspan="5"></th>
            </tr>
        </thead>

        <tbody id="tbody">
        </tbody>
    </table>
</div>
