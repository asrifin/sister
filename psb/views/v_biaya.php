<?php isMenu($modul,'biaya'); ?>
<script src="controllers/c_biaya.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button class="place-left" <?php echo isAksi('user','c')?'onclick="viewFR(\'\')"':'disabled'; ?> data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
        <li class="active"><a href="#"><b>Biaya</b></a></li>
        <li><a href="detail-biaya">Detail-Biaya</a></li>
    </ul>
</nav>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Biaya</th>
            <th class="text-center">Cara Bayar</th>
            <th class="text-center">Diskon</th>
            <th class="text-center">Ditagih</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr id="cariTR" class="info">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="biayaS"></div></th>
            <th><div class="input-control select">
                    <select  class="cari" data-hint="angsur" name="isAngsurS" id="isAngsurS">
                        <option value="">-SEMUA-</option>
                        <option value="0">Tunai</option>
                        <option value="1">Angsur Reguler</option>
                        <option value="2">Angsur Bebas</option>
                    </select>
            </div></th>
            <th><div class="input-control select">
                    <select  class="cari" data-hint="Diskon" name="isDiskonS" id="isDiskonS">
                        <option value="">-SEMUA-</option>
                        <option value="0">Tidak Ada</option>
                        <option value="1">Diskon Reguler</option>
                        <option value="2">Diskon Khusus</option>
                        <option value="3">Diskon Reguler & Khusus</option>
                    </select>
            </div></th>
            <th><div class="input-control select">
                    <select  class="cari" data-hint="Ditagih Per" name="jenistagihanS" id="jenistagihanS"></select>
            </div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="keteranganS"></div></th>
            <th></th>
        </tr>
    </thead>
    <tbody id="tbody">
    </tbody>
</table> 