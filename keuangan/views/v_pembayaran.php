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

<div class="input-control select span3">
    <select data-hint="Departemen" class="cari" name="departemenS" id="departemenS"></select>
</div>


<!-- tab -->
    <!-- keterangan :
        - pendaftaranTAB : jurnal umum
        - dppTAB : buku besar
        - sppTAB : neraca saldo -->
    <div  data-effect="fade" class="tab-control" data-role="tab-control">
        <ul class="tabs">
            <li class="active"><a href="#pendaftaranTAB">Formulir Pendaftaran </a></li>
            <li><a href="#dppTAB">DPP</a></li>
            <li><a href="#sppTAB">SPP</a></li>
        </ul>
        <div class="frames">
            <!-- 1st content -->
            <div class="frame" id="pendaftaranTAB">    
                <button id="juBC" data-hint="Pencarian" data-hint-position="top">
                    <i class="icon-search" ></i>
                </button>
                <div class="span3 place-right input-control checkbox" >
                    <label>
                        <input checked="checked" id="ju_detiljurnalCB" type="checkbox" />
                        <span class="check"></span>
                        Tampilkan Detil Jurnal 
                    </label>
                </div>

                <table class="table hovered bordered striped">
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
                            <th class="text-left"><input onkeyup="inputuang(this);" placeholder="nomor jurnal" id="ju_noS" class="ju_cari"></th>
                            <th class="text-left"><input placeholder="uraian" id="ju_uraianS" class="ju_cari"></th>
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
            <div class="frame" id="dppTAB">
                Tampilkan Akun : 
                <div class="input-control select span3">
                    <select id="bbS"></select>
                </div>
            </div>
            <div class="frame" id="sppTAB">3</div>
        </div>
    </div>
<!-- end of tab -->

<!-- end of panel 3 -->
<!-- 
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
 -->
