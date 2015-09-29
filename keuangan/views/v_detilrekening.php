<?php isMenu($modul,'detilrekening'); ?>
<script src="controllers/c_detilrekening.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button <?php echo isAksi('detilrekening','c')?'onclick="viewFR(\'\')"':'disabled'; ?>  data-hint="Tambah Data" class="place-left" id="tambahBC"><span class="icon-plus-2"></span> </button>
        <li><a href="kategori-rekening"<b>Kategori Rek.</b></a></li>
        <li class="active"><a href="#">Detil Rek.</a></li>
        <li ><a href="saldo-rekening">Saldo Rek.</a></li>
    </ul>
</nav>
<div class="input-control select span4">
    <select data-hint="Kategori Rekening" class="cari" name="kategorirekeningS" id="kategorirekeningS"></select>
</div>

<div style="overflow:scroll;height:500px;">
    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Kode</th>
                <th class="text-center">Rekening</th>
                <th class="text-center">Keterangan</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr id="cariTR" class="selected">
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
</div>
