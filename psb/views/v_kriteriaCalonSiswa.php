<script src="controllers/c_kriteriaCalonSiswa.js"></script>
<script src="js/metro/metro-button-set.js"></script>

<h4>Kriteria Calon Siswa</h4>
<div id="loadarea"></div>

<div class="button-set" data-role="button-group">
    <button class="button" id="tambahBC"><span class="icon-plus-2"></span> </button>
    <button class="button" id="cariBC"><span class="icon-search"></span> </button>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr class="selected">
            <th class="text-left">No.</th>
            <th class="text-left">Kriteria</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="kriteria" id="kriteriaS"name="kriteriaS"></th>
            <th class="text-left"><input placeholder="keterangan" id="keteranganS"name="keteranganS"></th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
