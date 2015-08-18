<?php isMenu($modul,'level'); ?>
<script src="controllers/c_level.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Level</h4>
<div id="loadarea"></div>

<button <?php echo isDisabled('level','c');?> data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Urutan</th>
            <th class="text-center">level </th>
            <th class="text-center">keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"></th>
            <th class="text-center"><div class="input-control text"><input placeholder="level" id="levelS" name="levelS"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="keterangan" id="keteranganS" name="keteranganS"></div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>

