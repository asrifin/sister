<script src="controllers/c_modulpembayaran.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<h4 style="color:white;">Modul Pembayaran</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
    <select data-hint="Departemen" class="cari" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Angkatan" class="cari" name="angkatanS" id="angkatanS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Kategori Modul Pembayaran" class="cari" name="katmodulpembayaranS" id="katmodulpembayaranS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Nama Pembayaran</th>
            <th class="text-center">Rekening</th>
            <!-- <th class="text-left">Nominal</th> -->
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-right"><div class="input-control text"><input  class="cari" placeholder="nama" id="namaS" name="namaS"></div></th>
            <th class="text-left"></th>
            <th class="text-left"><div class="input-control text"><input  class="cari" placeholder="keterangan" id="keteranganS" name="keteranganS"></div></th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
