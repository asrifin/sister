<!-- aautosuggest --> 
<!-- <script src="js/jquery.js"></script> -->
<!-- <script type="text/javascript" src="js/combogrid/jquery-1.9.1.min.js"></script> -->
<!-- <script type="text/javascript" src="js/combogrid/jquery.ui.combogrid-1.6.3.js"></script> -->
<!-- <script type="text/javascript" src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script> -->

<!-- <link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/> -->
<!-- <link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/> -->
<!--eof aautosuggest -->

<script src="controllers/c_kelas.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script> -->
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Kelas</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tingkat" name="tingkatS" id="tingkatS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-left">No.</th>
            <th class="text-left">Nama Kelas </th>
            <th class="text-left">Wali</th>
            <th class="text-left">Kapasitas</th>
            <th class="text-left">Terisi</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="kelas" id="kelasS" name="kelasS"></th>
            <th class="text-left"><input placeholder="wali" id="waliS" name="waliS"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
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
    // -- created by epiii -- //
    // ---------------------- //