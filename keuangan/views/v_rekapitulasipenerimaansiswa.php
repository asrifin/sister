<?php 
    require_once '../lib/dbcon.php';
    isMenu($modul,'rekapitulasipenerimaansiswa'); 
?>
<script src="controllers/c_rekapitulasisiswa.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>
<script src="../js/base64.js"></script>

<h4 style="color:white;">Rekapitulasi Penerimaan Siswa</h4>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">
<button class="fg-white bg-blue" data-hint="cetak rekap siswa" id="cetakBC"><span class="icon-printer"></span> </button>
<div class="input-control select span2">
    <label class="fg-white">Departemen</label>
    <select onchange="cmbtahunajaran('filter');" class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div><div class="input-control select span2">
    <label class="fg-white">Tahun Ajaran</label>
    <select onchange="cmbtingkat('filter');" class="cari" data-hint="tahunajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div><div class="input-control select span2">
    <label class="fg-white">Tingkat</label>
    <select onchange="cmbsubtingkat('filter');" class="cari" data-hint="tingkat" name="tingkatS" id="tingkatS"></select>
</div><div class="input-control select span2">
    <label class="fg-white">Sub Tingkat</label>
    <select onchange="cmbbiaya('filter');" class="cari" data-hint="subtingkat" name="subtingkatS" id="subtingkatS"></select>
</div>
 <table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">NIS </th>
            <th class="text-center">NAMA</th>
            <?php 
                $sc = 'SELECT * from psb_biaya order by biaya ASC';
                $ec = mysql_query($sc);
                while ($rc=mysql_fetch_assoc($ec)) {?>
                <th class="text-center"><?php echo $rc['biaya']; ?></th>
            <?php } ?>
            <th class="text-center">Aksi</th>
        </tr>
    </thead>
    <tbody id="tbody"></tbody>
</table>