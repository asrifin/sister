<script src="controllers/c_lokasi.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Lokasi</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kode</th>
            <th class="text-left">Nama Lokasi</th>
            <th class="text-left">Alamat</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"><input placeholder="kode" id="kodeS" name="kodeS"></th>
            <th class="text-left"><input placeholder="nama" id="namaS"name="namaS"></th>
            <th class="text-left"><input placeholder="alamat" id="alamatS"name="alamatS"></th>
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

<!--
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
-->