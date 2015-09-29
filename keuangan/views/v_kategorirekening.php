<?php isMenu($modul,'kategorirekening'); ?>
<script src="controllers/c_kategorirekening.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>


<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button   <?php echo isAksi('user','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" class="place-left" id="tambahBC"><span class="icon-plus-2"></span> </button>
        <li class="active"><a href="#"><b>Kategori Rek.</b></a></li>
        <li ><a href="detil-rekening">Detil Rek.</a></li>
        <li ><a href="saldo-rekening">Saldo Rek.</a></li>
    </ul>
</nav>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Kode </th>
            <th class="text-center">Nama</th>
            <th class="text-center">Jenis</th>
            <th class="text-center">Penambahan</th>
            <th class="text-center">Pengurangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input placeholder="cari..." id="kodeS" name="kodeS"></div></th>
            <th class="text-center"><div class="input-control text"><input placeholder="cari..." id="namaS" name="namaS"></div></th>
            <th colspan="4" class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>

