<script src="controllers/c_tempat.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Tempat</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
    <!-- (name & id) usahakan sama  -->
    <!-- <select data-hint="lokasi" name="lokasiTB" id="lokasiS"></select> -->
    <select data-hint="lokasi" name="lokasiS" id="lokasiS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">no.</th>
            <th class="text-center">Kode</th>
            <th class="text-center">Nama Tempat</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="kode" id="kodeS" name="kodeS"></th>
            <th class="text-left"><input placeholder="tempat" id="tempatS" name="tempatS"></th>
            <th class="text-left"><input placeholder="keterangan" id="keteranganS" name="keteranganS"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
<!-- 
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
 -->