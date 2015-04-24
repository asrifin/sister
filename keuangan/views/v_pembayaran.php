<script src="controllers/c_pembayaran.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<!-- combo grid -->
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!--end of combo grid -->

<h4 style="color:white;">Pembayaran </h4>
<div id="loadarea"></div>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<!-- tab -->
    <!-- keterangan :
        - pendaftaranTAB    : formulir n joining fee
        - joiningTAB        : joining fee
        - dppTAB            : uang gedung
        - sppTAB            : spp semesteran 
    -->
    <div  data-effect="fade" class="tab-control" data-role="tab-control">
        <ul class="tabs level1">
            <li onclick="switchPN('pendaftaran');" class="active"><a href="#pendaftaranTAB">Pendaftaran </a></li>
            <li onclick="switchPN('dpp');"><a href="#dppTAB">DPP</a></li>
            <li onclick="switchPN('spp');"><a href="#sppTAB">SPP</a></li>
            <li class="place-right">
                <div class="input-control select">
                    <select data-hint="Departemen" class="cari" name="departemenS" id="departemenS"></select>
                </div>
            </li>
        </ul>

        <div style="background-color:white;" class="frames">
            <!-- pendaftaran  -->
            <div class="frame" id="pendaftaranTAB">
                <div  data-effect="fade" class="tab-control" data-role="tab-control">
                    <ul class="tabs level2">
                        <li onclick="switchPN('pendaftaran');" class="active"><a href="#formulirTAB">Formulir </a></li>
                        <li onclick="switchPN('pendaftaran');"><a href="#joiningfTAB">Joining Fee</a></li>
                        <li class="place-right">
                            <div class="input-control select">
                                <div class="input-control select span3">
                                    <select data-hint="Periode Pendaftaran" name="prosesS" id="prosesS"></select>
                                </div>
                                <div class="input-control select span3">
                                    <select data-hint="Kelompok Pendaftaran" class="cari" name="kelompokS" id="kelompokS"></select>
                                </div>
                            </div>
                        </li>
                    </ul>

                    <div style="background-color:white;" class="frames">
                        <div class="frame" id="formulirTAB">
                            <button id="formulir_cariBC" data-hint="Pencarian" data-hint-position="top">
                                <i class="icon-search" ></i>
                            </button>
                            <button id="formulir_cetakBC" onclick="printPDF('formulir');" data-hint="Cetak" data-hint-position="top">
                                <i class="icon-printer" ></i>
                            </button>

                            <table class="table hovered bordered striped">
                                <thead>
                                    <tr style="color:white;"class="info">
                                        <th class="text-center">No. Pendaftaran</th>
                                        <th class="text-center">Nama</th>
                                        <th class="text-center">Formulir</th>
                                        <th class="text-center">Tanggal Pembayaran</th>
                                        <th class="text-center">Status</th>
                                    </tr>
                                    <tr style="display:none;" id="formulirTR" class="info">
                                        <th class="text-left"><input placeholder="nomor pendaftaran" id="formulir_nopendaftaranS" class="formulir_cari"></th>
                                        <th class="text-left"><input placeholder="nama siswa" id="formulir_namaS" class="formulir_cari"></th>
                                        <th class="text-leftx"><input placeholder="formulir" id="formulir_daftarS" class="formulir_cari"></th>
                                        <th class="text-leftx"></th>
                                        <th class="text-left"></th>
                                    </tr>
                                </thead>
                                <tbody id="formulir_tbody"></tbody>
                            </table>
                        </div>

                        <div class="frame" id="joiningfTAB">
                            <button id="joiningf_cariBC" data-hint="Pencarian" data-hint-position="top">
                                <i class="icon-search" ></i>
                            </button>
                            <button id="joiningf_cetakBC" onclick="printPDF('joiningf');" data-hint="Cetak" data-hint-position="top">
                                <i class="icon-printer" ></i>
                            </button>

                            <table class="table hovered bordered striped">
                                <thead>
                                    <tr style="color:white;"class="info">
                                        <th class="text-center">No. Pendaftaran</th>
                                        <th class="text-center">Nama</th>
                                        <th class="text-center">Joining Fee</th>
                                        <th class="text-center">Kurangan</th>
                                        <th class="text-center">Tanggal Pembayaran</th>
                                        <th class="text-center">Status</th>
                                    </tr>
                                    <tr style="display:none;" id="joiningfTR" class="info">
                                        <th class="text-left"><input placeholder="nomor pendaftaran" id="joiningf_nopendaftaranS" class="joiningf_cari"></th>
                                        <th class="text-left"><input placeholder="nama siswa" id="joiningf_namaS" class="joiningf_cari"></th>
                                        <th class="text-leftx">
                                        <!-- <input placeholder="wajib bayar" id="joiningf_joiningfS" class="joiningf_cari"> -->
                                        </th>
                                        <th class="text-leftx"></th>
                                        <th class="text-leftx"></th>
                                        <th class="text-left"></th>
                                    </tr>
                                </thead>
                                <tbody id="joiningf_tbody"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- uang gedung -->
            <div class="frame" id="dppTAB">
                <button id="dpp_cariBC" data-hint="Pencarian" data-hint-position="top">
                    <i class="icon-search" ></i>
                </button>
                <button id="dpp_cetakBC"  onclick="printPDF('dpp');"  data-hint="Cetak" data-hint-position="top">
                    <i class="icon-printer" ></i>
                </button>
                <div class="input-control select span3">
                    <select data-hint="Angkatan" class="dpp_cari" name="angkatanS" id="angkatanS"></select>
                </div>
                <table class="table hovered bordered striped">
                    <thead>
                        <tr style="color:white;"class="info">
                            <th class="text-center">NIS </th>
                            <th class="text-center">Nama</th>
                            <th class="text-center">Nominal</th>
                            <th class="text-center">Kurang</th>
                            <th class="text-center">Tanggal Pembayaran</th>
                            <th class="text-center">Status</th>
                        </tr>
                        <tr style="display:none;" id="dppTR" class="info">
                            <th class="text-center"><input placeholder="NIS" id="nisS" class="dpp_cari"></th>
                            <th class="text-center"><input placeholder="Nama" id="namaS" class="dpp_cari"></th>
                            <th class="text-center"></th>
                            <th class="text-center"></th>
                            <th class="text-center"></th>
                            <th class="text-center"></th>
                        </tr>
                    </thead>

                    <tbody id="dpp_tbody">
                    </tbody>
                    <tfoot>
                    </tfoot>
                </table>
            </div>

            <!-- spp -->
            <div class="frame" id="sppTAB">
                <button id="spp_cariBC" data-hint="Pencarian" data-hint-position="top">
                    <i class="icon-search" ></i>
                </button>
                <button id="spp_cetakBC"  onclick="printPDF('spp');"  data-hint="Cetak" data-hint-position="top">
                    <i class="icon-printer" ></i>
                </button>
                <div class="input-control select span3">
                    <select data-hint="Tahun Ajaran" class="spp_cari" name="spp_tahunajaranS" id="spp_tahunajaranS"></select>
                </div>
                <div class="input-control select span3">
                    <select data-hint="Tingkat" class="spp_cari" name="spp_tingkatS" id="spp_tingkatS"></select>
                </div>
                <div class="input-control select span3">
                    <select data-hint="Sub Tingkat" class="spp_cari" name="spp_subtingkatS" id="spp_subtingkatS"></select>
                </div>
                <div class="input-control select span3">
                    <select data-hint="Kelas" class="spp_cari" name="spp_kelasS" id="spp_kelasS"></select>
                </div>

                <table class="table hovered bordered striped">
                    <thead>
                        <tr style="color:white;"class="info">
                            <th class="text-center">nis </th>
                            <th class="text-center">nama</th>
                            <th class="text-center">tunggakan</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                        <tr style="display:none;" id="sppTR" class="info">
                            <th class="text-left"><input placeholder="nis" id="spp_nisS" class="spp_cari"></th>
                            <th class="text-left"><input placeholder="nama" id="spp_namaS" class="spp_cari"></th>
                            <th class="text-left"><input placeholder="tunggakan" id="spp_tunggakanS" class="spp_cari"></th>
                            <th class="text-left"></th>
                        </tr>
                    </thead>

                    <tbody id="spp_tbody">
                    </tbody>
                    <tfoot>
                    </tfoot>
                </table>
            </div>

        </div>
    </div>
<!-- end of tab -->

<!-- end of panel 3 -->
<!-- 
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
 -->
