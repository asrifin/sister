<?php isMenu($modul,'modul'); ?>
<script src="controllers/c_modul.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button class="place-left" <?php echo isAksi('user','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
        <li><a href="grup-modul">Grup Modul</a></li>
        <li class="active"><a href="#"><b>Modul</b></a></li>
        <li><a href="grup-menu">Grup Menu</a></li>
        <li><a href="menu">Menu</a></li>
    </ul>
</nav>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Grup Modul</th>
            <th class="text-center">Modul</th>
            <th class="text-center">Link</th>
            <th class="text-center">warna</th>
            <th class="text-center">icon</th>
            <th class="text-center">ukuran</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center">
                <div class="input-control select">
                    <select onchange="viewTB();" data-hint="grup modul" id="grupmodulS" class="cari"></select>
                </div>
            </th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="modulS"></div></th>
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
        </tr>
    </thead>

    <tbody id="tbody"></tbody>
</table>