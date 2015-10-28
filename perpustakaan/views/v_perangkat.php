<script src="controllers/c_perangkat.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<h4 style="color:white;">Perangkat</h4>
    <div style="overflow:scroll;height:550px;" >
        <input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS']; ?>"><!-- epiii -->

    <!-- FORMAT -->
        <legend style="color:white;">Pengaturan Nomor Item</legend>
        <label style="color:white;">Format nomor ID (Identitas) :</label>
        
        <!-- ID Buku -->
            <!-- format -->
            <div class="input-control text size5">
                <input readonly type="text" name="idfmtTB" id="idfmtTB" >
            </div>
            <a href="#" onclick="loadFR('idfmt');" data-hint="Edit Format ID" class="button"><span class="icon-pencil"></span> </a>
            <!-- contoh -->
            <p class="fg-white">Contoh : 
                <span id="idfmtEx"></span>
            </p>
            
        <!-- Barcode Buku -->
            <!-- format -->
            <label style="color:white;">Format barkode :</label>
            <div class="input-control text size5">
                <input readonly type="text" id="bcfmtTB" name="bcfmtTB">
            </div>
            <a href="#" onclick="loadFR('bcfmt');" data-hint="Edit Format ID" class="button"><span class="icon-pencil"></span> </a>
            <!-- Contoh -->
            <p class="fg-white">Contoh : 
                <span id="idfmtEx"></span>
            </p>
      
    <!-- LABEL -->
        <legend style="color:white;">Cetak Label</legend>
        <label style="color:white;">Judul :</label>
        <!-- Judul -->
            <div class="input-control text size5">
                <input readonly type="text" name="titfmtTB" id="titfmtTB" >
            </div>
            <a href="#" onclick="loadFR('titfmt');" data-hint="Edit Judul" class="button"><span class="icon-pencil"></span> </a>
        <!-- Deskripsi -->
            <label style="color:white;">Deskripsi :</label>
            <div class="input-control text size5">
                <input readonly type="text" id="desfmtTB" name="desfmtTB">
            </div>
            <a href="#" onclick="loadFR('desfmt');" data-hint="Edit Deskripsi" class="button"><span class="icon-pencil"></span> </a>
        
    <!-- CETAK LABEL -->
        <div class="form-actions" id="cetaklabel" style="display:visible;"> 
            <button data-hint="Cetak Label" xclass="large" id="cetakBC">Cetak Label</button>
        </div>        

    <div class="panel" id="cetak" style="display:none;">
    <div class="panel-content">
        <div class="grid">
            <div class="row">
                <div class="span6">
                    <label><b>Daftar label item yang dicetak :</b></label>
                    <div class="input-control select span3">
                        <select  data-hint="lokasi" class="barcode_cari" name="lokasiS" id="lokasiS"></select>
                    </div>
                    <div class="input-control text size5">
                        <input  placeholder="barkode atau judul item" type="text" id="labelTB">
                        <button class="btn-clear"></button>
                    </div>

                    <table class="table hovered bordered striped" id="cetaklabelTBL">
                        <thead>
                            <tr style="color:white;"class="info">
                                <th class="text-cari">Barkode</th>
                                <th class="text-cari">Callnumber</th>
                                <th class="text-cari">Judul</th>
                                <th class="text-cari">Aksi</th>
                            </tr>
                        </thead>
                        <tbody id="bukuTBL"></tbody>
                        <tfoot></tfoot>
                    </table>
                    <button disabled data-hint="Cetak Barcode" id="cetak_barcodeBC"><span class="icon-printer"></span> Cetak Barcode</button>
                </div> <!-- end span -->
                <div class="span6"></div>
            </div> <!-- end row -->
        </div> <!-- end grid -->
        </div>
    </div> <!-- end panel -->
</div>