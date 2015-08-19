<script src="controllers/c_subtingkat.js"></script>

<nav class="breadcrumbs">
    <ul>
        &nbsp;
        <button class="place-left" data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button> 
        <li><a href="tingkat">Tingkat</a></li>
        <li class="active"><a href="#"><b>Sub Tingkat</b></a></li>
        <li><a href="kelas">Kelas</a></li>
        <li><a href="detail-kelas">Detail Kelas</a></li>
    </ul>
</nav>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Tingkat</th>
            <th class="text-center">Subtingkat (Kelas)</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="info">
            <th>
                <div class="input-control select">
                    <select  class="cari" data-hint="tingkat" name="tingkatS" id="tingkatS"></select>
                </div>
            </th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="subtingkatS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="keteranganS"></div></th>
            <th></th>
        </tr>
    </thead>
    <tbody id="tbody">
    </tbody>
</table> 