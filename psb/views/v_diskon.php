<?php isMenu($modul,'diskon'); ?>
<script src="controllers/c_diskon.js"></script>

<nav class="breadcrumbs place-right">
    <ul>
        &nbsp;
        <li class="active"><a href="#"><b>Diskon</b></a></li>
        <li><a href="detail-diskon">Detail Diskon</a></li>
    </ul>
</nav>

<button <?php echo isAksi('diskon','c')?'onclick="viewFR(\'\')"':'disabled'; ?> class="place-left" data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button> 
<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select class="cari" data-hint="biaya" name="biayaS" id="biayaS"></select>
</div>

<div style="overflow:scroll;height:560px;">
    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Diskon</th>
                <th class="text-center">Keterangan</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr xstyle="display:none;" id="cariTR" class="info">
                <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="diskonS"></div></th>
                <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="keteranganS"></div></th>
                <th></th>
            </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table> 
</div>
