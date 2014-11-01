<script src="controllers/c_tempat.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Tempat</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" class="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<div class="input-control select span3">
    <select data-hint="lokasi" name="lokasiTB" id="lokasiS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Nama Tempat</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="Lokasi" id="lokasiS" name="lokasiS"></th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
