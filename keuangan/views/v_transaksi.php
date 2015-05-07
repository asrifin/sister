
<script src="controllers/c_transaksi.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<!-- combo grid -->
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!--end of combo grid -->

<h4 style="color:white;">Transaksi </h4>
<div id="loadarea"></div>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<div class="toolbar">
    <div class="toolbar-group fg-white transparent ">
        <button id="ju_addBC" onclick="loadFR('ju','');" class="bg-blue" data-hint="Jurnal Umum"><i class="icon-plus-2"></i></button>
        <button id="in_addBC"  onclick="loadFR('in_come','');"class="bg-green" data-hint="Pemasukkan"><i class="icon-download-2"></i></button>
        <button id="out_addBC"  onclick="loadFR('out_come','');"class="bg-red" data-hint="Pengeluaran"><i class="icon-upload-3"></i></button>
        <button id="optionBC" data-hint="Selengkapnya..." class="bg-gray fg-white"><i class="icon-grid"></i></button>
    </div>
</div>
 

<div style="overflow:scroll;height:700px">    
    <form id="optionPN" style="display:none;">
        <label style="color:white;">
            Jenis Transaksi
            <div class="span3 input-control checkbox" >
                <label>
                    <input name="jenisAllCB" id="jenisAllCB" onclick="jenisAll();" checked="checked" type="checkbox" />
                    <span class="check"></span>
                    Semua 
                </label>
            </div>
        </label>
        <ul id="jenistransDV" class="treeview" data-role="treeview"></ul>
        <div class="input-control text span2 cari" data-role="datepicker" data-format="dd mmmm yyyy" data-position="top" data-effect="slide">
            <input onchange="viewTB('ju');" type="text" id="tgl1TB" name="tgl1TB">
            <button class="btn-date"></button>
        </div> s/d
        <div class="input-control text span2 cari" data-role="datepicker" data-format="dd mmmm yyyy" data-position="top" data-effect="slide">
            <input onchange="viewTB('ju');" type="text" id="tgl2TB" name="tgl2TB">
            <button class="btn-date"></button>
        </div> 
        <a href="#" onclick="viewTB('ju');" id="hari_iniBC" name="hari_iniBC" class="button bg-gray fg-white" ><i class="icon-clock"></i> Hari ini</a>
        <a  href="#" onclick="viewTB('ju');" id="bulan_iniBC" name="bulan_iniBC" class="button bg-gray fg-white"><i class="icon-clock"></i> Bulan ini</a>
    </form>

    <div class="divider">&nbsp;</div>
    <!-- tab -->
        <!-- keterangan :
            - juTAB : jurnal umum
            - bbTAB : buku besar
            - nsTAB : neraca saldo
            - nlTAB : neraca lajur
            - lrTAB : laporan laba/rugi
            - lnTAB : laporan neraca
            - pkbTAB : posisi kas dan bank
            - btTAB : buku tambahan-->
        <div data-effect="fade" class="tab-control" data-role="tab-control">
        <!-- <div style="overflow:scroll;height:600px" data-effect="fade" class="tab-control" data-role="tab-control"> -->
            <ul class="tabs">
                <li class="active"><a href="#juTAB">Jurnal Umum </a></li>
                <li><a href="#nsTAB">Neraca Saldo</a></li>
                <li><a href="#bbTAB">Buku Besar</a></li>
                <li><a href="#nlTAB">Neraca Lajur</a></li>
                <li><a href="#lrTAB">Laporan Laba/Rugi</a></li>
                <li><a href="#lnTAB">Laporan Neraca</a></li>
                <li><a href="#pkbTAB">Posisi Kas dan Bank</a></li>
                <li><a href="#btTAB">Buku Tambahan</a></li>
            </ul>
            <div class="frames">
                <!-- 1st content -->
                <div class="frame" id="juTAB">    
                    <button id="juBC" data-hint="Pencarian" data-hint-position="top">
                        <i class="icon-search" ></i>
                    </button>
                    <button id="ju_cetakBC" data-hint="Cetak" data-hint-position="top">
                        <i class="icon-printer" ></i>
                    </button>

                    <div class="span3 place-right input-control checkbox" >
                        <label>
                            <input checked="checked" id="ju_detiljurnalCB" type="checkbox" />
                            <span class="check"></span>
                            Tampilkan Detil Jurnal 
                        </label>
                    </div>

                    <table  class="table hovered bordered striped">
                        <thead>
                            <tr style="color:white;"class="info">
                                <th class="text-center">Tanggal </th>
                                <th class="text-center">No. Jurnal/Jenis Bukti/No.Bukti</th>
                                <th class="text-center">Uraian</th>
                                <th style="display:visible;"class="text-center  uraianCOL">Detil Jurnal</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                            <tr style="display:none;" id="juTR" class="info">
                                <th class="text-left"></th>
                                <th class="text-left"><div class="input-control text"><input placeholder="cari ..." id="ju_noS" class="ju_cari"></div></th>
                                <th class="text-left"><div class="input-control text"><input placeholder="cari ..." id="ju_uraianS" class="ju_cari"></div></th>
                                <th style="display:visible;"class="text-left uraianCOL"></th>
                                <th class="text-left"></th>
                            </tr>
                        </thead>

                        <tbody id="ju_tbody">
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>

                </div>
                <!-- end of 1st content -->
                <div class="frame" id="bbTAB">
                    Tampilkan Akun : 
    <!--                 <div class="input-control select span3">
                        <select id="bbS"></select>
                    </div>
     -->                <table class="table hovered bordered striped">
                        <thead>
                            <tr style="color:white;"class="info">
                                <th class="text-center">Tanggal </th>
                                <th class="text-center">No. Jurnal/Transaksi</th>
                                <th class="text-center">Uraian</th>
                                <th class="text-center">Kode Rekening</th>
                                <th class="text-center">Debet</th>
                                <th class="text-center">Kredit</th>
                            </tr>
                            <tr style="display:none;" id="bbTR" class="info">
                                <th class="text-left"></th>
                                <th class="text-left"><input placeholder="No Jurnal" id="bb_jurnalS" class="bb_cari"></th>
                                <th class="text-left"></th>
                                <th class="text-left"></th>
                                <th class="text-left"></th>
                            </tr>
                        </thead>

                        <tbody id="bb_tbody">
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table> 
                </div>
                <!-- </div> -->

                <div class="frame" id="nsTAB">
                    <button id="nsBC" data-hint="Pencarian" data-hint-position="top">
                        <i class="icon-search" ></i>
                    </button>
                    <button id="ns_cetakBC" data-hint="Cetak" data-hint-position="top">
                        <i class="icon-printer" ></i>
                    </button>
                    <table class="table hovered bordered striped">
                        <thead>
                            <tr style="color:white;"class="info">
                                <th class="text-center">Kode Rekening </th>
                                <th class="text-center">Nama Rekening</th>
                                <th class="text-center">Debet</th>
                                <th class="text-center">Kredit</th>
                            </tr>
                            <tr style="display:none;" id="nsTR" class="info">
                                <th class="text-left"><input placeholder="Kode Rekening" id="ns_kodeS" class="ns_cari"></th>
                                <th class="text-left"><input placeholder="Nama Rekening" id="ns_namaS" class="ns_cari"></th>
                                <th class="text-left"></th>
                                <th class="text-left"></th>
                            </tr>
                        </thead>

                        <tbody id="ns_tbody">
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table> 

                </div>
                <div class="frame" id="nlTAB">
                    <button id="nlBC" data-hint="Pencarian" data-hint-position="top">
                        <i class="icon-search" ></i>
                    </button>
                    <table class="table hovered bordered striped">
                        <thead>
                            <tr style="color:white;" class="info">
                                <th class="text-left" rowspan="2">Kode Rekening</th>
                                <th class="text-left" rowspan="2">Nama Rekening</th>
                                <th class="text-center" colspan="2">Neraca Saldo</th>
                                <th class="text-center" colspan="2">Laba/Rugi</th>
                                <th class="text-center" colspan="2">Neraca</th>
                            </tr>
                            <tr style="color:white;" class="info">
                                <th class="text-right">Debit</th>
                                <th class="text-right">Kredit</th>
                                <th class="text-right">Debit</th>
                                <th class="text-right">Kredit</th>
                                <th class="text-right">Debit</th>
                                <th class="text-right">Kredit</th>
                            </tr>
    <!--                         <tr style="color:white;" class="info">
                                <th class="text-right">Debit</th>
                                <th class="text-right">Kredit</th>
                            </tr>
                            <tr style="color:white;" class="info">
                                <th class="text-right">Debit</th>
                                <th class="text-right">Kredit</th>
                            </tr>
     -->           </thead>

                        <tbody id="nl_tbody">
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>                 
                </div>
                <div class="frame" id="lrTAB">

    <!--                     <thead>
                            <tr style="color:white;"class="info">
                                <th class="text-center">Kode Rekening </th>
                                <th class="text-center">Nama Rekening</th>
                                <th class="text-center">Debet</th>
                                <th class="text-center">Kredit</th>
                            </tr>
                            <tr style="display:none;" id="nsTR" class="info">
                                <th class="text-left"><input placeholder="Kode Rekening" id="ns_kodeS" class="ns_cari"></th>
                                <th class="text-left"><input placeholder="Nama Rekening" id="ns_namaS" class="ns_cari"></th>
                                <th class="text-left"></th>
                                <th class="text-left"></th>
                            </tr>
                        </thead>
     -->
                        <tbody id="ns_tbody">
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table> 

                </div>
                <div class="frame" id="lnTAB">6</div>
                <div class="frame" id="pkbTAB">
                    <table class="table hovered bordered striped">
                        <thead>
                            <tr style="color:white;"class="info">
                                <th class="text-center">Tanggal </th>
                                <th class="text-center">No. Jurnal/Transaksi</th>
                                <th class="text-center">Uraian</th>
                                <th class="text-center">Nominal</th>
                            </tr>
                            <tr style="display:none;" id="pkbTR" class="info">
                                <th class="text-left"></th>
                                <th class="text-left"><input placeholder="No Jurnal" id="pkb_jurnalS" class="pkb_cari"></th>
                                <th class="text-left"></th>
                                <th class="text-left"></th>
                            </tr>
                        </thead>

                        <tbody id="pkb_tbody">
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table> 
                    
                </div>
                <div class="frame" id="btTAB">8</div>
            </div>
        </div>
    <!-- end of tab -->
</div>