<?php 
error_reporting(0);
session_start();
?>
<script src="controllers/c_tempat.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<h4 style="color:white;">Tempat</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
    <select data-hint="lokasi" class="main_cari" id="lokasiS"></select>
</div>
<input value="<?php echo $_SESSION['id_loginS']; ?>" id="id_loginS"  type="hidden">
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kode</th>
            <th class="text-center">Nama Tempat</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input placeholder="kode" id="main_kodeS"  class="main_cari"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="tempat" id="main_tempatS"  class="main_cari"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="keterangan" id="main_keteranganS"  class="main_cari"></div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="main_tbody">
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