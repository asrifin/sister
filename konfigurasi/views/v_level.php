<script src="controllers/c_level.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Level</h4>
<div id="loadarea"></div>

<button <?php isDisabled('level','c');?> data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button <?php isDisabled('level','s');?>  data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">No.</th>
            <th class="text-center">level </th>
            <th class="text-center">keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"></th>
            <th class="text-center"><input placeholder="level" id="levelS" name="levelS"></th>
            <th class="text-center"><input placeholder="keterangan" id="keteranganS" name="keteranganS"></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>

