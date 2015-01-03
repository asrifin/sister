<script src="controllers/c_tahun_angggaran.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Anggaran</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
        <input id="tahunbukuS"  class="cari">
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Nama Anggaran</th>
            <th class="text-center">Anggaran</th>
            <th class="text-center">Status Anggaran</th>
            <th class="text-center">Departemen</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"><input placeholder="Nama Anggaran" id="anggaranS"  class="cari"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"><input placeholder="Departemen" id="departemenS"  class="cari"></th>
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
