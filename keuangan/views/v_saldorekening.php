<script src="controllers/c_saldorekening.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Saldo Rekening</h4>
<div id="loadarea"></div>

<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
    <select data-hint="Kategori Rekening" class="cari" name="kategorirekS" id="kategorirekS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Buku" class="cari" name="tahunbukuS" id="tahunbukuS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kode</th>
            <th class="text-center">Rekening</th>
            <th class="text-center">Saldo</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-right"><input  class="cari" placeholder="kode" id="kodeS" name="kodeS"></th>
            <th class="text-left"><input  class="cari" placeholder="nama" id="namaS" name="namaS"></th>
            <th class="text-left">
            <!-- <input  class="cari" placeholder="nominal" id="nominalS" name="nominalS"> -->
            </th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
