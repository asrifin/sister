<?php 
    require '../lib/dbcon.php';
    isMenu($modul,'rekapitulasipenerimaansiswa'); 
?>
<script src="controllers/c_rekapitulasipenerimaansiswa.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<h4 style="color:white;">Rekapitulasi Penerimaan Siswa</h4>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<div style="overflow:scroll;height:500px;">
    <div class="input-control select span3">
        <label class="fg-white">Departemen</label>
        <select xonchange="cmbtahunajaran('filter');" class="rekapitulasipenerimaansiswa_cari" data-hint="Departemen" name="penerimaansiswa_cari_departemenS" id="departemenS"></select>
    </div><div class="input-control select span2">
        <label class="fg-white">Tahun Ajaran</label>
        <select xonchange="cmbbiaya('filter');" class="rekapitulasipenerimaansiswa_cari" data-hint="tahunajaran" name="penerimaansiswa_cari_tahunajaranS" id="tahunajaranS"></select>
    </div>
    <div class="input-control select span2">
        <label class="fg-white">Biaya   </label>
        <select xonchange="cmbtingkat();" class="rekapitulasipenerimaansiswa_cari" data-hint="biaya" name="biayaS" id="biayaS"></select>
    </div>
     
    <button id="cetakBC" onclick="printPDF('rekapitulasipenerimaansiswa','');" data-hint="Cetak" data-hint-position="top"><i class="icon-printer" ></i></button>
    <table class="table hovered bordered striped">
        <thead>
            <tr class="bg-blue fg-white">
                <th class="text-center">Tingkat</th>
                <th class="text-center">Terbayar</th>
                <th class="text-center">Kurang</th>
                <th class="text-center">Total</th>
            </tr>
        </thead>
        <tbody id="rekapitulasipenerimaansiswa_tbody"></tbody>
    </table>
</div>
