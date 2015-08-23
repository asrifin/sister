<?php isMenu($modul,'gelombang'); ?>
<script src="controllers/c_kelompok.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Gelombang</h4>
<button <?php echo isAksi('user','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
<div style="display:none;"class="input-control select size3">
    <select data-hint="departemen" class="cari" id="departemenS"name="departemenS"></select> 
</div> 
<div class="input-control select size3">
    <select data-hint="tahun ajaran" class="cari" id="tahunajaranS"name="tahunajaranS"></select> 
</div> 
    
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kelompok</th>
            <th class="text-center">Tanggal</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th><div class="input-control text"><input class="cari" id="kelompokS"></div></th>
            <th colspan="3"></th>
        </tr>
    </thead>
    <tbody id="tbody"></tbody>
</table>