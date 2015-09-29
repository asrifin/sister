<?php isMenu($modul,'viabayar'); ?>
<script src="controllers/c_viabayar.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Via Bayar</h4>
<button <?php echo isAksi('viabayar','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Via Bayar</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="viabayarS" name="viabayarS"></div></th>
                <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="keteranganS" name="keteranganS"></div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
    </tbody>
</table>