<script src="controllers/c_keuaktivitas.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Aktivitas</h4>
<div id="loadarea"></div>

<!-- <button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button> -->
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
    <!-- (name & id) usahakan sama  -->
    <!-- <select data-hint="lokasi" name="lokasiTB" id="lokasiS"></select> -->
    <select data-hint="lokasi" name="lokasiS" id="lokasiS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Tgl. Kegiatan</th>
            <th class="text-center">Aktivitas</th>
            <th class="text-center">Total Dana</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th></th>
            <th><div class="input-control text">    <input placeholder="cari ...." id="aktivitasS" name="aktivitasS"></div></th>
            <th></th>
            <th><div class="input-control text">    <input placeholder="cari ...." id="keteranganS" name="keteranganS"></div></th>
            <th></th>
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