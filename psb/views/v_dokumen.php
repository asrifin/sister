<?php isMenu($modul,'dokumen'); ?>
<script src="controllers/c_dokumen.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>

<h4 style="color:white;">dokumen</h4>
<div id="loadarea"></div>

<button <?php echo isAksi('dokumen','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Item</th>
            <th class="text-center">Tingkat</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input class="dokumen_cari" placeholder="cari..." id="dokumen_dokumenS" name="dokumen_dokumenS"></div></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="dokumen_tbody">
    </tbody>
</table>