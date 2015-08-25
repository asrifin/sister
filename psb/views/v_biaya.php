<?php isMenu($modul,'biaya'); ?>
<script src="controllers/c_biaya.js"></script>
<h4 style="color:white;">Set Biaya Calon Siswa</h4>
<div id="loadarea"></div>

<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select xclass="cari"  data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select  class="cari" data-hint="Detail Gelombang" name="detailgelombangS" id="detailgelombangS"></select>
</div>

<div  style="overflow:scroll;height:530px;" >
    <form autocomplete="off" onsubmit="simpan();return false;"> 
        <?php echo isAksi('biaya','c')?'<button class="bg-blue fg-white" data-hint="Simpan" id="simpanBC"><span class="icon-floppy"></span> </button>':''; ?>
        <table class="table hovered bordered striped">
            <thead>
                <tr style="color:white;"class="info">
                    <th class="text-center">Tingkat (Jenjang) </th>
                    <th class="text-center">Golongan</th>
                    <th class="text-center">Formulir</th>
                    <th class="text-center">DPP</th>
                    <th class="text-center">Joining Fee</th>
                    <th class="text-center">SPP</th>
                </tr>
            </thead>

            <tbody id="tbody"></tbody>
        </table>
    </form>
</div>