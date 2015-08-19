<?php isMenu($modul,'grupmenu'); ?>
<script src="controllers/c_grupmenu.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button class="place-left" <?php echo isAksi('grupmenu','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
        <li><a href="grup-modul">Grup Modul</a></li>
        <li><a href="modul">Modul</a></li>
        <li class="active"><a href="#"><b>Grup Menu</b></a></li>
        <li><a href="menu">Menu</a></li>
    </ul>
</nav>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Grup Modul</th>
            <th class="text-center">Modul</th>
            <th class="text-center">Grup Menu</th>
            <th class="text-center">Kategori</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center">
                <div class="input-control select">
                    <select onchange="viewTB();" data-hint="grup modul" id="grupmodulS" class="cari"></select>
                </div>
            </th>
            <th class="text-center">
                <div class="input-control select">
                    <select onchange="viewTB();" data-hint="modul" id="modulS" class="cari"></select>
                </div>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="grupmenuS"></div></th>
            </th>            
            <th class="text-center">
                <div class="input-control select">
                    <select onchange="viewTB();" data-hint="katgrupmenu" id="katgrupmenuS" class="cari"></select>
                </div>
            </th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody"></tbody>
</table>