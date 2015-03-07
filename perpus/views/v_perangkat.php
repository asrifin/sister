<script src="controllers/c_perangkat.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
  <!-- // <script type="../js/metro/metro-scroll.js"></script> -->

            <!-- <div style="overflow:scroll;height::;0px;" > -->
<h4 style="color:white;">Perangkat</h4>
<!-- <div id="loadarea"></div> -->
        <!-- <div class="span15" style="color:white;">  -->
            <div style="overflow:scroll;height::;0px;" >
                       <legend style="color:white;">Pengaturan Nomor Item</legend>
                            <label style="color:white;">Format nomor ID (Identitas) :</label>
                            <div class="input-control text size5">
                                <input type="text" name="idTB" id="idTB" >
                                <button class="btn-clear"></button>
                            </div>
                                <button data-hint="Edit Format ID" xclass="large" id="idBC"><span class="icon-pencil"></span> </button>
                            <label style="color:white;">Contoh :</label><br>

                            <label style="color:white;">Format barkode :</label>
                            <div class="input-control text size5">
                                <input id="barkodeTB">
                                <button class="btn-clear"></button>
                            </div>
                                <button data-hint="Edit Barkode" xclass="large" id="barkodeBC"><span class="icon-pencil"></span> </button>
                            <label style="color:white;">Contoh :</label><br>
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

<!--                             <div class="grid" id="labelcetak" style="display:none;">
                            <legend>Data Peminjaman</legend>
                                <form enctype="multipart/form-data" class="span12" autocomplete="off" onsubmit="pinjamSV(); return false;"> 
                                    <input id="idformH" type="hidden"> 
                                    <div class="row">
                                        <div class="span5"> 
                                            <label>Peminjam</label>
                                            <div class="input-control select span4">
                                                <select  name="memberTB" id="memberTB"></select>
                                            </div>
                                            <div class="input-control text size4">
                                                <input placeholder="ID atau Nama Peminjam" id="peminjamTB">
                                                <button class="btn-clear"></button>
                                            </div>
                                                <img id="b_photoIMG" src="../img/no_image.jpg" width="100" class="shadow" align="center">
                                        </div>
                                        <div class="span5">
                                            <label><b>Waktu Peminjaman</b></label>
                                            <label>Tanggal Peminjaman</label>
                                            <div class="input-control text size3" data-role="datepicker"
                                                // data-date="2014-10-23"
                                                data-format="yyyy-mm-dd"
                                                data-effect="slide">
                                                <input required="required"  id="tgl_pinjamTB" name="tgl_pinjamTB" type="text">
                                                <button class="btn-date"></button>
                                            </div>
                                        </div>
                                        <!-- end span -->
                                    <!-- </div>  -->
                                    <!-- end row -->
                                    
                            <!-- </div> -->
                                <!-- //End Grid   -->
<!--         <div class="panel" id="labelcetak" style="display:none;">
            <div class="panel-header bg-lightBlue fg-white">
            ...
            </div>
                <div class="panel-content">
                    <div class="grid">
                        <div class="row">
                            <div class="span8">
                                            <div class="input-control text size4">
                                                <input placeholder="ID atau Nama Peminjam" id="peminjamTB">
                                                <button class="btn-clear"></button>
                                            </div>
                                
                            </div>
                            <div class="span8">
                                            <div class="input-control text size4">
                                                <input placeholder="ID atau Nama Peminjam" id="peminjamTB">
                                                <button class="btn-clear"></button>
                                            </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
 -->           
<table class="table hovered bordered striped" id="cetaklabelTBL" style="display:none;">
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


</div>