<?php isMenu($modul,'pemutihanpenerimaansiswa'); ?>
<script src="controllers/c_pemutihanpenerimaansiswa.js"></script>
<script src="../js/metro/metro-button-set.js"></script>
<script src="../js/metro/metro-hint.js"></script>

<h4 style="color:white;">Pemutihan Penerimaan Siswa</h4>
<button <?php echo isAksi('pemutihanpenerimaansiswa','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Tanggal</th>
            <th class="text-center">Siswa</th>
            <th class="text-center">Oleh</th>
            <th class="text-center">No. MOM</th>
            <th class="text-center">Tgl. MOM</th>
            <th class="text-center">Total</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"><input data-transform="input-control" class="cari" placeholder="cari..." id="tglS"></div></th>
            <th class="text-center"><input data-transform="input-control" class="cari" placeholder="cari..." id="namasiswaS"></div></th>
            <th class="text-center"><input data-transform="input-control" class="cari" placeholder="cari..." id="petugasS"></div></th>
            <th class="text-center"><input data-transform="input-control" class="cari" placeholder="cari..." id="nomomS"></div></th>
            <th class="text-center"><input data-transform="input-control" class="cari" placeholder="cari..." id="tglmomS"></div></th>
            <th class="text-center"><input data-transform="input-control" class="cari" placeholder="cari..." id="totalS"></div></th>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
    </tbody>
</table>