<?php isMenu($modul,'siswakelas'); ?>
<script src="controllers/c_siswakelas.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!-- chosen -->
<!--   <link rel="stylesheet" href="../css/chosen/style.css">
  <link rel="stylesheet" href="../css/chosen/prism.css">
  <link rel="stylesheet" href="../css/chosen/chosen.css">
 -->
<h4 style="color:white;">Pendataan Siswa (kelas)</h4>
<div id="loadarea"></div>

<button <?php echo isAksi('siswa','c')?'onclick="viewFR(\'\')"':'disabled  '; ?> data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>

<div class="input-control select span3">
    <label class="fg-white">Departemen</label>
    <select class="aktif_cari" data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span2">
    <label class="fg-white">Tahun Ajaran</label>
    <select class="aktif_cari" data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>
<div class="input-control select span2">
    <label class="fg-white">Tingkat</label>
    <select  class="aktif_cari" data-hint="Tingkat" name="tingkatS" id="tingkatS"></select>
</div>
<div class="input-control select span2">
    <label class="fg-white">SubTingkat</label>
    <select  class="aktif_cari" data-hint="Sub Tingkat" name="subtingkatS" id="subtingkatS"></select>
</div>
<div class="input-control select span3">
    <label class="fg-white">Detail Kelas</label>
    <select  class="aktif_cari" data-hint="Kelas" name="detailkelasS" id="detailkelasS"></select>
</div>
<!-- <form id="aktifFR"> -->
  <table class="table hovered bordered striped">
      <thead>
          <tr style="color:white;"class="bg-blue">
              <th class="text-center">
                <div class="input-control switch">
                  <label>
                      <input onclick="siswakelasSelAll(this);" id="siswakelasAllTB" type="checkbox" />
                      <span class="check"></span>
                  </label>
                </div>
              </th>
              <th class="text-center">Nama </th>
              <th class="text-center">NIS</th>
              <th class="text-center">NISN</th>
              <th class="text-center">Tempat, Tanggal Lahir</th>
              <th class="text-center">Aksi</th>
          </tr>
          <tr class="bg-blue">
              <th class="text-center">
                  <button onclick="delSomeTR(); return false;" id="hapussemuaBC" style="display:none;" data-hint="hapus terpilih" class="bg-red fg-white"><i class="icon-cancel-2 "></i></button>
              </th>
              <th class="text-center"><input type="text" data-transform="input-control" class="aktif_cari" placeholder="Nama" id="aktif_namasiswaS"></th>
              <th class="text-center"><input type="text" data-transform="input-control" class="aktif_cari" placeholder="NIS" id="aktif_nisS"></th>
              <th class="text-center"><input type="text" data-transform="input-control" class="aktif_cari" placeholder="NISN" id="aktif_nisnS"></th>
              <th class="text-center"></th>
              <th class="text-center"></th>
          </tr>
      </thead>

      <tbody id="aktif_tbody">
          <!-- row table -->
      </tbody>
  </table>
<!-- </form> -->
  <!--<script src="../js/chosen/chosen.jquery.js" type="text/javascript"></script>
  <script src="../js/chosen/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    $('#departemenS').chosen();
    var config = {
      // '.chosen-select'           : {},
      // '.chosen-select-deselect'  : {allow_single_deselect:true},
      // '.chosen-select-no-single' : {disable_search_threshold:10},
      '#departemenS': {no_results_text:'Oops, nothing found!'},
      // '.chosen-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>-->
