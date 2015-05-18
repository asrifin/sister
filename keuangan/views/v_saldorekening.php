<script src="controllers/c_saldorekening.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Saldo Rekening</h4>
<div id="loadarea"></div>

<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span4">
    <select data-hint="Kategori Rekening" class="cari" name="kategorirekeningS" id="kategorirekeningS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Buku" class="cari" name="tahunbukuS" id="tahunbukuS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center" rowspan="2">Kode</th>
            <th class="text-center" rowspan="2">Rekening</th>
            <th class="text-center" colspan="2">Saldo Awal</th>
            <th class="text-center" colspan="2">Saldo Sementara</th>
            <th class="text-center" rowspan="2">Aksi</th>
        </tr>
        <tr style="color:white;" class="info">
            <th>debit</th>
            <th>kredit</th>
            <th>debit</th>
            <th>kredit</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th><div class="input-control text"><input  class="cari" placeholder="Kode Rekening" id="kodeS" name="kodeS"></div></th>
            <th><div class="input-control text"><input  class="cari" placeholder="Nama Rekening " id="namaS" name="namaS"></div></th>
            <th colspan="5"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
