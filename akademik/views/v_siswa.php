<script src="controllers/c_siswa.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<h4 style="color:white;">Pendataan Siswa</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div class="input-control select span3">
    <select class="aktif_cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select class="aktif_cari" data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select  class="aktif_cari" data-hint="Tingkat" name="tingkatS" id="tingkatS"></select>
</div>
<div class="input-control select span3">
    <select  class="aktif_cari" data-hint="Sub Tingkat" name="subtingkatS" id="subtingkatS"></select>
</div>
<div class="input-control select span3">
    <select  class="aktif_cari" data-hint="Kelas" name="kelasS" id="kelasS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">NIS</th>
            <th class="text-center">NISN</th>
            <th class="text-center">Nama </th>
            <th class="text-center">Tempat, Tanggal Lahir</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"><input  class="aktif_cari" placeholder="NIS" id="nisS" name="nisS"></th>
            <th class="text-center"><input  class="aktif_cari" placeholder="NISN" id="nisnS" name="nisnS"></th>
            <th class="text-center"><input  class="aktif_cari" placeholder="Nama" id="namaS" name="namaS"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="aktif_tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
<!-- 
    // ---------------------- //
    // -- created by rovi -- //
    // ---------------------- // -->