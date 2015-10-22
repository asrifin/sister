<?php 
    require '../lib/dbcon.php';
    isMenu($modul,'rekapitulasipenerimaansiswa'); ?>
<script src="controllers/c_rekapitulasipenerimaansiswa.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<!-- combo grid -->
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!--end of combo grid -->

<h4 style="color:white;">Rekapitulasi Penerimaan Siswa</h4>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<div style="overflow:scroll;height:500px;">
    <div class="input-control select span3">
        <label class="fg-white">Departemen</label>
        <select onchange="cmbtahunajaran('filter');" class="penerimaansiswa_cari" data-hint="Departemen" name="penerimaansiswa_cari_departemenS" id="departemenS"></select>
    </div><div class="input-control select span2">
        <label class="fg-white">Tahun Ajaran</label>
        <select onchange="cmbtingkat('filter');" class="penerimaansiswa_cari" data-hint="tahunajaran" name="penerimaansiswa_cari_tahunajaranS" id="tahunajaranS"></select>
    </div><div class="input-control select span2">
        <label class="fg-white">Tingkat</label>
        <select onchange="cmbsubtingkat('filter');" class="penerimaansiswa_cari" data-hint="tingkat" name="penerimaansiswa_cari_tingkatS" id="tingkatS"></select>
    </div><div class="input-control select span2">
        <label class="fg-white">Sub Tingkat</label>
        <select onchange="cmbbiaya('filter');" class="penerimaansiswa_cari" data-hint="subtingkat" name="penerimaansiswa_cari_subtingkatS" id="subtingkatS"></select>
    </div>
<!--     <div class="input-control select span2">
        <label class="fg-white">Biaya   </label>
        <select onchange="viewTB();" class="penerimaansiswa_cari" data-hint="biaya" name="biayaS" id="biayaS"></select>
    </div>
 -->    <button id="cetakBC" onclick="printPDF('rekapitulasipenerimaansiswa','');" data-hint="Cetak" data-hint-position="top"><i class="icon-printer" ></i></button>
    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">No. Pendaftaran</th>
                <th class="text-center">NISN</th>
                <th class="text-center">NIS</th>
                <th class="text-center">Nama</th>
                <?php 
                    $sc = 'SELECT * from psb_biaya order by biaya ASC';
                    $ec = mysql_query($sc);
                    $nc = mysql_num_rows($ec);
                    $arrc=array();
                    while ($rc=mysql_fetch_assoc($ec)) {
                        $arrc[]=$rc;
                    }
                    foreach ($arrc as $i => $v) {?>
                        <th class="text-center"><?php echo $v['biaya']; ?></th>
                    <?php }
                ?>
            </tr>
            <tr id="formulirTR" class="info">
                <th class="text-center"><input type="text" data-transform="input-control" placeholder="cari ..." id="nopendaftaranS" class="penerimaansiswa_cari"></th>
                <th class="text-center"><input id="nisnS" type="text" data-transform="input-control" placeholder="cari ..."  class="penerimaansiswa_cari"></th>
                <th class="text-center"><input id="nisS" type="text" data-transform="input-control" placeholder="cari ..."  class="penerimaansiswa_cari"></th>
                <th class="text-center"><input id="namasiswaS" type="text" data-transform="input-control" placeholder="cari ..."  class="penerimaansiswa_cari"></th>
                <?php
                    foreach ($arrc as $ii => $vv) {
                        echo '<th class="text-center">
                                 <select  data-transform="input-control" class="cari text-center" id="'.$vv['kode'].'_statusS">
                                    <option value="">-Semua-</option>
                                    <option class="bg-green fg-white" value="lunas">Lunas</option>
                                    <option class="bg-yellow fg-white" value="kurang">Kurang</option>
                                    <option class="bg-red fg-white" value="belum">Belum</option>
                                </select>
                            </th>';
                    }
                ?>
            </tr>
        </thead>
        <tbody id="penerimaansiswa_tbody"></tbody>
    </table>
</div>
