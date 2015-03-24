<script src="controllers/c_perangkat.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
  <!-- // <script type="../js/metro/metro-scroll.js"></script> -->

            <!-- <div style="overflow:scroll;height::;0px;" > -->
<h4 style="color:white;">Perangkat</h4>
<!-- <div id="loadarea"></div> -->
        <!-- <div class="span15" style="color:white;">  -->
            <div style="overflow:scroll;height:550px;" >
                       <legend style="color:white;">Pengaturan Nomor Item</legend>
                            <label style="color:white;">Format nomor ID (Identitas) :</label>
                            <div class="input-control text size5">
                                <input type="text" name="idTB" id="idTB" >
                                <button class="btn-clear"></button>
                            </div>
                                <button data-hint="Edit Format ID" xclass="large" id="idBC"><span class="icon-pencil"></span> </button>
                            <label style="color:white;">Contoh :</label>

                            <label style="color:white;">Format barkode :</label>
                            <div class="input-control text size5">
                                <input type="text" id="barkodeTB" name="barkodeTB">
                                <button class="btn-clear"></button>
                            </div>
                            <a href="#" data-hint="Edit Barkode" id="barkodeBC" class="button"><span class="icon-pencil"></span> </a>
                                <!-- <button data-hint="Edit Barkode" xclass="large" id="barkodeBC"><span class="icon-pencil"></span> </button> -->
                            <label style="color:white;">Contoh :</label>
        <!-- </div> -->
        <!-- <div class="span15" style="color:white;">  -->
                       <legend style="color:white;">Cetak Label</legend>
                            <label style="color:white;">Judul :</label>
                            <div class="input-control text size5">
                                <input type="text" name="idTB" id="judulTB">
                                <button class="btn-clear"></button>
                            </div>
                            <label style="color:white;">Deskripsi :</label>
                            <div class="input-control text size5">
                                <input type="text" name="idTB" id="deskripsiTB">
                                <button class="btn-clear"></button><br>
                            </div>
                        <div class="form-actions"> 
                            <button data-hint="Edit" xclass="large" id="infoBC"><span class="icon-pencil"></span> </button>
                        </div><br>        
                        <div class="form-actions" id="cetaklabel" style="display:visible;"> 
                            <button data-hint="Cetak Label" xclass="large" id="cetakBC">Cetak Label</button>
                        </div>        
        <!-- </div> -->

<div class="panel" id="cetak" style="display:none;">
    <div class="panel-content">
    <div class="grid">
        <div class="row">
            <div class="span6">
                <label><b>Daftar label item yang dicetak :</b></label>
                <div class="input-control select span3">
                    <select data-hint="lokasi" name="lokasiS" id="lokasiS"></select>
                </div>
                <div class="input-control text size5">
                    <input placeholder="barkode atau judul item" type="text" name="labelTB" id="labelTB">
                </div>

                <table class="table hovered bordered striped" id="cetaklabelTBL">
                    <thead>
                        <tr style="color:white;"class="info">
                            <th class="text-left">Barkode</th>
                            <th class="text-left">Callnumber</th>
                            <th class="text-left">Judul</th>
                            <th class="text-left">Aksi</th>
                        </tr>
                    </thead>

                    <tbody id="tbody">

                    </tbody>

                    <tfoot>
                        
                    </tfoot>
                </table>

            </div> <!-- end span -->

            <div class="span6">
                
            </div>

        </div> <!-- end row -->
    </div> <!-- end grid -->

    </div>
</div> <!-- end panel -->



</div>