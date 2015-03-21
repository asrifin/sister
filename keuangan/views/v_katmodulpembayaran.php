<script src="controllers/c_katmodulpembayaran.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Kategori Modul Pembayaran</h4>
<div id="loadarea"></div>

<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
    <select data-hint="Departemen" class="cari" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Buku" class="cari" name="tahunbukuS" id="tahunbukuS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Kategori Anggaran" class="cari" name="kategorianggaranS" id="kategorianggaranS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kategori</th>
            <th class="text-center">Status Siswa</th>
            <th class="text-center">Sumbangan</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"><input  class="cari" placeholder="Kategori" id="namaS" name="namaS"></th>
            <th class="text-left"><input  class="cari" placeholder="siswa" id="siswaS" name="siswaS"></th>
            <th class="text-left"><input  class="cari" placeholder="sifat" id="sifatS" name="sifatS"></th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
