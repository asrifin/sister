<script src="controllers/c_setBiayaCalonSiswa.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script> -->
<!-- <script src="js/metro/metro-hint.js"></script> -->

<h4 style="color:white;">Set Biaya Calon Siswa</h4>
<div id="loadarea"></div>

<!-- <button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button> -->
<div class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Proses" name="prosesS" id="prosesS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Kelompok" name="kelompokS" id="kelompokS"></select>
</div>

<div  style="overflow:scroll;height:600px;" >
    <form autocomplete="off" onsubmit="simpan();return false;"> 
        <button data-hint="Simpan" id="simpanBC"><span class="icon-floppy"></span> </button>
        <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-left">Kriteria </th>
                <th class="text-left">Golongan</th>
                <th class="text-left">Biaya Pendaftaran</th>
                <th class="text-left">Uang Pangkal</th>
                <th class="text-left">SPP</th>
                <th class="text-left">Joining Fee</th>
            </tr>
            </thead>

            <tbody id="tbody">
                <!-- row table -->
            </tbody>
            <tfoot>
                
            </tfoot>
        </table>
    </form>
</div>