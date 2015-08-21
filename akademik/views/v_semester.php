<?php isMenu($modul,'semester'); ?>
<script src="controllers/c_semester.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button class="place-left" <?php echo isAksi('user','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
        <li><a href="tahun-ajaran">Tahun Ajaran</a></li>
        <li class="active"><a href="#"><b>Semester</b></a></li>
    </ul>
</nav>

<div class="input-control select span3">
    <select class="cari" data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Semester </th>
            <th class="text-center">Bulan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>

<!--// ---------------------- //
    // -- created by epiii -- //
    // ---------------------- // -->