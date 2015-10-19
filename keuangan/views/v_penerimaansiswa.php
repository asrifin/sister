<?php isMenu($modul,'penerimaansiswa'); ?>
<script src="controllers/c_penerimaansiswa.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<!-- combo grid -->
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!--end of combo grid -->

<h4 style="color:white;">Penerimaan Siswa</h4>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<div style="overflow:scroll;height:500px;">
    <div class="input-control select span3">
        <label class="fg-white">Departemen</label>
        <select onchange="cmbtahunajaran('filter');" class="cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
    </div><div class="input-control select span2">
        <label class="fg-white">Tahun Ajaran</label>
        <select onchange="cmbtingkat('filter');" class="cari" data-hint="tahunajaran" name="tahunajaranS" id="tahunajaranS"></select>
    </div><div class="input-control select span2">
        <label class="fg-white">Tingkat</label>
        <select onchange="cmbsubtingkat('filter');" class="cari" data-hint="tingkat" name="tingkatS" id="tingkatS"></select>
    </div><div class="input-control select span2">
        <label class="fg-white">Sub Tingkat</label>
        <select onchange="cmbbiaya('filter');" class="cari" data-hint="subtingkat" name="subtingkatS" id="subtingkatS"></select>
    </div><div class="input-control select span2">
        <label class="fg-white">Biaya   </label>
        <select onchange="viewTB();" class="cari" data-hint="biaya" name="biayaS" id="biayaS"></select>
    </div>
    <button id="formulir_cetakBC" onclick="printPDF('formulir');" data-hint="Cetak" data-hint-position="top"><i class="icon-printer" ></i></button>
    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">No. Pendaftaran</th>
                <th class="text-center">NISN</th>
                <th class="text-center">NIS</th>
                <th class="text-center">Nama</th>
                <th class="text-center">Bayar</th>
            </tr>
            <tr id="formulirTR" class="info">
                <th class="text-center"><input type="text" data-transform="input-control" placeholder="cari ..." id="nopendaftaranS" class="cari"></th>
                <th class="text-center"><input id="nisnS" type="text" data-transform="input-control" placeholder="cari ..."  class="cari"></th>
                <th class="text-center"><input id="nisS" type="text" data-transform="input-control" placeholder="cari ..."  class="cari"></th>
                <th class="text-center"><input id="namasiswaS" type="text" data-transform="input-control" placeholder="cari ..."  class="cari"></th>
                <th class="text-center">
                    <!-- <select  data-transform="input-control" class="cari text-center" id="statusS" name="statusS" >
                        <option value="">-Semua-</option>
                        <option class="bg-green fg-white" value="lunas">Lunas</option>
                        <option class="bg-yellow fg-white" value="kurang">Kurang</option>
                        <option class="bg-red fg-white" value="belum">Belum</option>
                    </select> -->
                </th>
            </tr>
        </thead>
        <tbody id="tbody"></tbody>
    </table>
</div>
