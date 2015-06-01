<script src="controllers/c_kegiatan.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script>
 --><script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Kegiatan</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Tanggal</th>
            <th class="text-center">Kegiatan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <!-- <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="kode" id="kodeS"  class="cari"></th>
            <th class="text-left"><input placeholder="tempat" id="tempatS"  class="cari"></th>
            <th class="text-left"><input placeholder="keterangan" id="keteranganS"  class="cari"></th>
        </tr> -->
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