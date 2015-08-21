<script src="controllers/c_disctunai.js"></script>
<h4 style="color:white;">Diskon Tunai</h4>

<button data-hint="Tambah Data" class="button" id="tambahBC"><i class="icon-plus-2 on-center"></i>Tambah </button>
<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select class="cari" data-hint="Tahun Ajaran" name="prosesS" id="prosesS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kode</th>
            <th class="text-center">Diskon (%)</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input placeholder="cari..." id="namaS" name="namaS"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="cari..." id="diskonS" name="diskonS"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="cari..." id="keteranganS" name="keteranganS"></div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody"></tbody>
</table>
