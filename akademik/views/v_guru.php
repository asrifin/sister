<script src="controllers/c_guru.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!-- <script src="js/metro/metro-calendar.js"></script>
    
<script src="js/metro/metro-datepicker.js"></script>
 -->

<h4 style="color:white;">Guru</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
<div class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Pelajaran" name="pelajaranS" id="pelajaranS"></select>
</div>
<!-- <button data-hint="Field Pencarian" class="large" id="cariBC"><span class="icon-search"></span> </button>
 -->
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-left">Mata Pelajaran </th>
            <th class="text-left">Nama Guru</th>
            <th class="text-left">NIP</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <!-- <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="cari nama Guru" id="guruS" name="guruS" type="text"></th>
            <th class="text-left"><input placeholder="cari NIP Guru" id="nipS" name="nipS" type="text"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
        </tr> -->
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
