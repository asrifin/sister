<script src="controllers/c_perangkat.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<h4 style="color:white;">Perangkat</h4>
    <!-- epiii -->
        <input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS']; ?>">
    <!-- end of epiii -->

    <!-- id  -->
    <div style="overflow:scroll;height:550px;" >
       <legend style="color:white;">Pengaturan Nomor Item</legend>
    <label style="color:white;">Format nomor ID (Identitas) :</label>
    <div class="input-control text size5">
        <input type="text" name="idTB" id="idTB" >
        <button class="btn-clear"></button>
    </div>
    <a href="#" data-hint="EditFormat ID" id="idBC" class="button"><span class="icon-pencil"></span> </a>
    <!-- conoth id -->
    <label style="color:white;">Contoh :</label>
    <label style="color:white;">Format barkode :</label>
    <div class="input-control text size5">
        <input type="text" id="barkodeTB" name="barkodeTB">
        <button class="btn-clear"></button>
    </div>
    <!-- barcode -->
    <a href="#" data-hint="Edit Barkode" id="barkodeBC" class="button"><span class="icon-pencil"></span> </a>
    <label style="color:white;">Contoh :</label>

    <!-- judul -->
    <legend style="color:white;">Cetak Label</legend>
    <label style="color:white;">Judul :</label>
    <div class="input-control text size5">
        <input type="text" name="judulTB" id="judulTB">
        <button class="btn-clear"></button>
    </div>
    <!-- deskripsi -->
    <label style="color:white;">Deskripsi :</label>
    <div class="input-control text size5">
        <input type="text" name="deskripsiTB" id="deskripsiTB">
        <button class="btn-clear"></button><br>
    </div>

    <!-- button -->
    <div class="form-actions"> 
        <button data-hint="Edit" xclass="large" id="infoBC"><span class="icon-pencil"></span> </button>
    </div><br>        
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