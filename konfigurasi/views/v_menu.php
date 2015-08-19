<?php isMenu($modul,'menu'); ?>
<script src="controllers/c_menu.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button class="place-left" <?php echo isAksi('menu','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
        <li><a href="grup-modul">Grup Modul</a></li>
        <li><a href="modul">Modul</a></li>
        <li><a href="grup-menu">Grup Menu</a></li>
        <li class="active"><a href="#"><b>Menu</b></a></li>
    </ul>
</nav>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Grup Modul</th>
            <th class="text-center">Modul</th>
            <th class="text-center">Grup Menu</th>
            <th class="text-center">Menu</th>
            <th class="text-center">Link</th>
            <th class="text-center">Warna</th>
            <th class="text-center">Icon</th>
            <th class="text-center">Ukuran</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center">
                <div class="input-control select">
                    <select data-hint="grup modul" id="grupmodulS" class="cari"></select>
                </div>
            </th>
            <th class="text-center">
                <div class="input-control select">
                    <select data-hint="modul" id="modulS" class="cari"></select>
                </div>
            </th>
            <th class="text-center">
                <div class="input-control select">
                    <select onchange="viewTB();" data-hint="grupmenu" id="grupmenuS" class="cari"></select>
                </div>
            </th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="menuS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="linkS"></div></th>
            <th class="text-center">
                <div class="input-control select">
                    <select onchange="viewTB();" data-hint="warna" id="warnaS" class="cari"></select>
                </div>
            </th>            
            <th class="text-center">
                <div class="input-control select">
                    <select onchange="viewTB();" data-hint="icon" id="iconS" class="cari"></select>
                </div>
            </th>            
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody"></tbody>
</table>