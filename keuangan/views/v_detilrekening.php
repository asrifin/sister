<script src="controllers/c_detilrekening.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Detil Rekening</h4>
<div id="loadarea"></div>

<button <?php isDisabled('COA','c'); ?> data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button  <?php isDisabled('COA','s'); ?> data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span4">
    <select data-hint="Kategori Rekening" class="cari" name="kategorirekeningS" id="kategorirekeningS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kode</th>
            <th class="text-center">Rekening</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-right"><div class="input-control text"><input  class="cari" placeholder="cari..." id="kodeS" name="kodeS"></div></th>
            <th class="text-center"><div class="input-control text"><input  class="cari" placeholder="cari..." id="namaS" name="namaS"></div></th>
            <th class="text-center"><div class="input-control text"><input  class="cari" placeholder="cari..." id="keteranganS" name="keteranganS"></div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
