<script src="controllers/c_setBiayaCalonSiswa.js"></script>
<h4 style="color:white;">Set Biaya Calon Siswa</h4>
<div id="loadarea"></div>

<div style="display:none;"class="input-control select span3">
    <select xclass="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select xclass="cari"  data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select  class="cari" data-hint="Kelompok" name="kelompokS" id="kelompokS"></select>
</div>

<div  style="overflow:scroll;height:530px;" >
    <form autocomplete="off" onsubmit="simpan();return false;"> 
        <button data-hint="Simpan" id="simpanBC"><span class="icon-floppy"></span> </button>
        <table class="table hovered bordered striped">
            <thead>
                <tr style="color:white;"class="info">
                    <th class="text-center">Kriteria </th>
                    <th class="text-center">Golongan</th>
                    <th class="text-center">Registration Fee </th>
                    <th class="text-center">Tuition Fee (@bulan)</th>
                    <th class="text-center">Material Fee (@semester)</th>
                </tr>
            </thead>

            <tbody id="tbody"></tbody>
        </table>
    </form>
</div>