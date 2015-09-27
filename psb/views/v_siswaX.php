<?php isMenu($modul,'siswa'); ?>
<script src="controllers/c_siswa.js"></script>
<script src="../js/base64.js"></script>
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
<script src="../js/metro/metro-scroll.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>

<h4 style="color:white;">Pendataan Siswa</h4>

<button <?php echo isAksi('siswa','c')?'onclick="viewFR(\'\')"':'disabled  '; ?> data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button onclick="switchPN('view','');"  data-hint="Lihat Data" id="lihatBC" style="display:none;"><span class="icon-list"></span> </button>

<!-- combo  filter -->
<div class="input-control select span3">
    <select  onchange="cmbtahunajaran('filter','');" class="siswa_cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select  onchange="cmbdetailgelombang('filter','');"  class="siswa_cari" data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select  onchange="cmbtingkatZ('filter','');"  class="siswa_cari" data-hint="Gelombang" name="detailgelombangS" id="detailgelombangS"></select>
</div>
<div class="input-control select span3">
    <select onchange="viewTB();" class="siswa_cari" data-hint="tingkat" name="tingkatS" id="tingkatS"></select>
</div>
<!-- end of :  combo  filter -->

<table class="table hovered bordered striped panelx" >
    <thead>
        <tr style="color:white;" class="info">
            <th class="text-center">No Pendaftaran</th>
            <th class="text-center">Nama</th>
            <th class="text-center">NIS</th>
            <th class="text-center">NISN</th>
            <th class="text-center">Status</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"><input type="text" data-transform="input-control" class="siswa_cari" placeholder="cari ..." id="nopendaftaranS" name="nopendaftaranS"></th>
            <th class="text-center"><input type="text" data-transform="input-control" class="siswa_cari" placeholder="cari ...." id="namasiswaS" name="namasiswaS"></th>
            <th class="text-center"><input type="text" data-transform="input-control" class="siswa_cari" placeholder="cari ...." id="nisS" name="nisS"></th>
            <th class="text-center"><input type="text" data-transform="input-control" class="siswa_cari" placeholder="cari ...." id="nisnS" name="nisnS"></th>
            <th class="text-center"><select data-transform="input-control" class="siswa_cari" id="statusS" name="statusS"><option value="">-Semua-</option><option value="0">Belum Diterima</option><option value="1">Diterima</option><option value="2">Lulus</option></select></th>
            <th class="text-center"></th>
        </tr>
    </thead>
    <tbody id="siswa_tbody"></tbody>
</table>