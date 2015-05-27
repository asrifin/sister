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

<form id="filterFR">
    <!-- button -->
    <a href="#"  id="ju_addBC" onclick="loadFR('ju','');" class="button bg-blue fg-white" data-hint="Jurnal Umum"><i class="icon-plus-2"></i></a>
    <a href="#" id="in_addBC"  onclick="loadFR('in_come','');"class="button bg-green fg-white" data-hint="Pemasukan"><i class="icon-download-2"></i></a>
    <a href="#" id="out_addBC"  onclick="loadFR('out_come','');"class="button bg-red fg-white" data-hint="Pengeluaran"><i class="icon-upload-3"></i></a>
    <a href="#" id="optionBC" data-hint="Selengkapnya..." class="button bg-gray fg-white"><i class="icon-grid"></i></a>

    <!-- filter :: tanggal -->
    <div class="place-right">
        <div class="input-control text span2 cari" data-role="datepicker" data-format="dd mmmm yyyy" data-position="bottom" data-effect="slide">
            <input onchange="viewTB('ju');" type="text" id="tgl1TB" name="tgl1TB">
            <button class="btn-date"></button>
        </div> s/d
        <div class="input-control text span2 cari" data-role="datepicker" data-format="dd mmmm yyyy" data-position="bottom" data-effect="slide">
            <input onchange="viewTB('ju');" type="text" id="tgl2TB" name="tgl2TB">
            <button class="btn-date"></button>
        </div> 
        <a href="#" onclick="viewTB('ju');" id="hari_iniBC" name="hari_iniBC" class="button bg-gray fg-white" ><i class="icon-clock"></i> Hari ini</a>
        <a  href="#" onclick="viewTB('ju');" id="bulan_iniBC" name="bulan_iniBC" class="button bg-gray fg-white"><i class="icon-clock"></i> Bulan ini</a>
        <a data-hint="refresh"  href="#" onclick="loadAll();" id="refreshBC" name="refreshBC" class="button bg-blue fg-white"><i class="icon-cycle"></i> </a>
    </div> 

    <!-- jenis transaksi -->
    <div style="display:none;" id="optionPN">
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
    </div>
</form>

<div style="overflow:scroll;height:600px">    
<!-- <div style="overflow:scroll;height:450px">     -->
    <!-- <div class="divider">&nbsp;</div> -->
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
            <ul class="tabs">
                <li class="active"><a href="#juTAB">Jurnal Umum </a></li>
                <li><a href="#bbTAB">Buku Besar</a></li>
                <li><a href="#nsTAB">Neraca Saldo</a></li>
                <li><a href="#lnTAB">Laporan Neraca</a></li>
                <li><a href="#lrTAB">Laporan Laba/Rugi</a></li>
                <li><a href="#nlTAB">Neraca Lajur</a></li>
                <li><a href="#pkbTAB">Posisi Kas dan Bank</a></li>
                <li><a href="#btTAB">Buku Tambahan</a></li>
            </ul>

            <div style="background-color:#dddddd;"  class="frames">
                <!-- jurnal umum -->
                <div class="frame" id="juTAB">    
                    <button class="bg-blue fg-white" id="juBC" data-hint="Pencarian" data-hint-position="top">
                        <i class="icon-search" ></i>
                    </button>
<!--                     <button  class="bg-blue fg-white" id="ju_cetakBC" data-hint="Cetak" data-hint-position="top">
                        <i class="icon-printer" ></i>
                    </button>
 -->
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
                                <th class="text-center"></th>
                                <th class="text-center">
                                    <div class="input-control text">
                                        <input class="ju_cari" placeholder="cari ..." id="ju_noS">
                                    </div>
                                </th>
                                <th class="text-center">
                                    <div class="input-control text">
                                        <input class="ju_cari" placeholder="cari ..." id="ju_uraianS" >
                                    </div>
                                </th>
                                <th style="display:visible;"class="text-center uraianCOL"></th>
                                <th class="text-center"></th>
                            </tr>
                        </thead>

                        <tbody id="ju_tbody">
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>

                <!-- buku besar -->
                <div class="frame" id="bbTAB">
                    <span class="fg-gray">Tampilkan Akun :</span> 
                    <div class="input-control select span3">
                        <select class="bb_cari" onchange="viewTB('bb');" id="bb_detilrekeningS" name="bb_detilrekeningS"></select>
                    </div>
<!--                     <button  class="bg-blue fg-white" id="bb_cetakBC" data-hint="Cetak" data-hint-position="top">
                        <i class="icon-printer" ></i>
                    </button>
 -->                    <div id="bb_tbody"></div>
                </div>

                <!-- neraca saldo -->
                <div class="frame" id="nsTAB">
<!--                     <button  class="bg-blue fg-white" id="nsBC" data-hint="Pencarian" data-hint-position="top">
                        <i class="icon-search" ></i>
                    </button> -->
<!--                     <button  class="bg-blue fg-white" id="ns_cetakBC" data-hint="Cetak" data-hint-position="top">
                        <i class="icon-printer" ></i>
                    </button>
 -->                    <table class="table hovered bordered striped">
                        <thead>
                            <tr style="color:white;"class="info">
                                <th class="text-center">Kode Rekening </th>
                                <th class="text-center">Nama Rekening</th>
                                <th class="text-center">Debet</th>
                                <th class="text-center">Kredit</th>
                            </tr>
                            <tr style="display:none;" id="nsTR" class="info">
                                <th class="text-center"><div class="input-control text"><input placeholder="Kode Rekening" id="ns_kodeS" class="ns_cari"></div></th>
                                <th class="text-center"><div class="input-control text"><input placeholder="Nama Rekening" id="ns_namaS" class="ns_cari"></div></th>
                                <th class="text-center"></th>
                                <th class="text-center"></th>
                            </tr>
                        </thead>

                        <tbody id="ns_tbody">
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table> 
                </div>

                <!-- neraca lajur-->
                <div class="frame" id="nlTAB">
<!--                     <button  class="bg-blue fg-white" id="nl_cetakBC" data-hint="Pencarian" data-hint-position="top">
                        <i class="icon-printer" ></i>
                    </button> -->
                    <table class="table hovered bordered striped">
                        <thead>
                            <tr style="color:white;" class="info">
                                <th class="text-center" rowspan="2">Kode Rekening</th>
                                <th class="text-center" rowspan="2">Nama Rekening</th>
                                <th class="text-center" colspan="2">Neraca Saldo</th>
                                <th class="text-center" colspan="2">Neraca</th>
                                <th class="text-center" colspan="2">Laba/Rugi</th>
                            </tr>
                            <tr style="color:white;" class="info">
                                <th class="text-right">Debit</th>
                                <th class="text-right">Kredit</th>
                                <th class="text-right">Debit</th>
                                <th class="text-right">Kredit</th>
                                <th class="text-right">Debit</th>
                                <th class="text-right">Kredit</th>
                            </tr>
                        </thead>
                        <tbody id="nl_tbody"></tbody>
                        <tfoot></tfoot>
                    </table>                 
                </div>

                <!-- laba / rugi-->
                <div class="frame" id="lrTAB">
<!--                     <button  class="bg-blue fg-white" id="lr_cetakBC" data-hint="cetak" data-hint-position="top">
                        <i class="icon-printer" ></i>
                    </button>
 -->                    <div id="lr_tbody"></div>
                </div>

                <!-- laporan Neraca -->
                <div class="frame" id="lnTAB">
                    <div id="ln_tbody"></div>
                </div>

                <!-- posisi kas / bank -->
                <div class="frame" id="pkbTAB">
                    <!-- <button  class="bg-blue fg-white" id="pkb_cetakBC" data-hint="cetak" data-hint-position="top">
                        <i class="icon-printer" ></i>
                    </button> -->
                    <div id="pkb_tbody"></div>
                </div>

                <!-- buku tambahan -->
                <div class="frame" id="btTAB">
                    <div id="bt_tbody"></div>
                </div>
                    

            </div>
    <!-- end of tab -->
</div>