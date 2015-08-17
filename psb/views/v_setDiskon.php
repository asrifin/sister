<script src="controllers/c_setDiskon.js"></script>
<h4 style="color:white;">Set Diskon</h4>
<div id="loadarea"></div>
<button data-hint="Tambah Data" class="button" id="tambahBC"><i class="icon-plus-2 on-center"></i>Tambah </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select class="cari" data-hint="Tahun Ajaran" name="prosesS" id="prosesS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">No.</th>
            <th class="text-center">Kode</th>
            <th class="text-center">Diskon (%)</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"></th>
            <th class="text-center"><input placeholder="diskon" id="diskonS"name="diskonS"></th>
            <th class="text-center"><input placeholder="keterangan" id="keteranganS"name="keteranganS"></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody"></tbody>
</table>
