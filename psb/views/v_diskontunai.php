<?php isMenu($modul,'diskontunai'); ?>
<script src="controllers/c_diskontunai.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button <?php echo isAksi('diskontunai','c')?'onclick="viewFR(\'\')"':'disabled'; ?> class="place-left" data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button> 
        <li class="active"><a href="#"><b>Diskon</b></a></li>
        <li><a href="detail-diskon-tunai">Detail Diskon</a></li>
    </ul>
</nav>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Diskon</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="info">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="diskontunaiS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="keteranganS"></div></th>
            <th></th>
        </tr>
    </thead>
    <tbody id="tbody">
    </tbody>
</table> 