<script src="controllers/c_anggarantahunan.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Anggaran Tahunan</h4>
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
            <th class="text-center">Anggaran</th>
            <th class="text-center">Rekening</th>
            <th class="text-center">Nominal</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"><input  class="cari" placeholder="anggaran" id="namaS" name="namaS"></th>
            <th class="text-left"><input  class="cari" placeholder="rekening" id="rekeningS" name="rekeningS"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
