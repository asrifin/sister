<?php isMenu($modul,'user'); ?>
<script src="controllers/c_icon.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Icon</h4>
<div id="loadarea"></div>

<button <?php echo isAksi('user','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">No.</th>
            <th class="text-center">icon </th>
            <th class="text-center">visualisasi</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="iconS" name="iconS"></div></th>
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

