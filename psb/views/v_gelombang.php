<?php isMenu($modul,'gelombang'); ?>
<script src="controllers/c_gelombang.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button <?php echo isAksi('gelombang','c')?'onclick="viewFR(\'\')"':'disabled'; ?> class="place-left" data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button> 
        <li class="active"><a href="#"><b>Gelombang</b></a></li>
        <li><a href="detail-gelombang">Detail Gelombang</a></li>
    </ul>
</nav>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Urutan</th>
            <th class="text-center">Gelombang</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="gelombangS" name="gelombangS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="keteranganS" name="keteranganS"></div></th>
            <th></th>
        </tr>
    </thead>
    <tbody id="tbody"></tbody>
</table>