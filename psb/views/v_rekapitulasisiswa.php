<?php isMenu($modul,'rekapitulasisiswa'); ?>
<script src="controllers/c_rekapitulasisiswa.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>
<script src="../js/base64.js"></script>

<h4 style="color:white;">Rekapitulasi Siswa</h4>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">
<button class="fg-white bg-blue" data-hint="cetak rekap siswa" id="cetakBC"><span class="icon-printer"></span> </button>
<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select  class="cari"    data-hint="tahunajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<!-- <div class="input-control select span3">
    <select data-hint="tingkat" name="tingkatS" id="tingkatS"></select>
</div>
 -->
 <table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Tingkat </th>
            <th class="text-center">Diterima</th>
            <th class="text-center">Belum Diterima</th>
            <th class="text-center">Total</th>
        </tr>
    </thead>
    <tbody id="tbody"></tbody>
</table>