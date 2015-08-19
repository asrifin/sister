<?php isMenu($modul,'grupmodul'); ?>
<script src="controllers/c_grupmodul.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button class="place-left" <?php echo isAksi('grupmodul','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
        <li class="active"><a href="#"><b>Grup Modul</b></a></li>
        <li><a href="modul">Modul</a></li>
        <li><a href="grup-menu">Grup Menu</a></li>
        <li><a href="menu">Menu</a></li>
    </ul>
</nav>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Grup Modul</th>
            <th class="text-center">Size</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="grupmodulS" name="grupmodulS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="sizeS" name="sizeS"></div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody"></tbody>
</table>