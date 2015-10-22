<?php
 require_once '../lib/dbcon.php';
 // require_once '../lib/func.php';
 isMenu($modul,'detailbiaya'); ?>
<script src="controllers/c_detailbiaya.js"></script>
<h4 style="color:white;">Set Biaya Calon Siswa</h4>
<div id="loadarea"></div>


<nav class="breadcrumbs">
    <ul>
        <li><a href="biaya">Biaya</a></li>
        <li><a href="rekening-biaya">Rekening Biaya</a></li>
        <li class="active"><a href="#"><b>Detail Biaya</b></a></li>
    </ul>
</nav>

<div class="input-control select span3">
    <select class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select xclass="cari"  data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span3">
    <select  class="cari" data-hint="Detail Gelombang" name="detailgelombangS" id="detailgelombangS"></select>
</div>
<div class="input-control select span3">
    <select  class="cari" data-hint="Tingkat" name="tingkatS" id="tingkatS"></select>
</div>
<div class="input-control select span3">
    <select  class="cari" data-hint="Sub Tingkat" name="subtingkatS" id="subtingkatS"></select>
</div>

<div  style="overflow:scroll;height:530px;" >
    <form autocomplete="off" onsubmit="simpan();return false;"> 
        <?php echo isAksi('biaya','c')?'<button class="bg-blue fg-white" data-hint="Simpan" id="simpanBC"><span class="icon-floppy"></span> </button>':''; ?>
        <table class="table hovered bordered striped">
            <thead>
                <tr style="color:white;"class="info">
                    <!-- <th class="text-center">Jenjang</th> -->
                    <!-- <th class="text-center">Kelas</th> -->
                    <th class="text-center">Golongan</th>
                    <?php 
                        $sc = 'SELECT * from psb_biaya order by biaya ASC';
                        $ec = mysql_query($sc);
                        while ($rc=mysql_fetch_assoc($ec)) {?>
                        <th class="text-center"><?php echo $rc['biaya']; ?></th>
                    <?php } ?>
                </tr>
            </thead>

            <tbody id="tbody"></tbody>
        </table>
    </form>
</div>