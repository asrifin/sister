<script src="controllers/c_peminjaman.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<!-- combo grid -->
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!--end of combo grid -->

<!-- <div class="tab-control" data-role="tab-control">
        <ul class="tabs">
            <li class="active"><a href="#sirkulasi">Sirkulasi</a></li>
            <li><a href="#statistik">Statistik</a></li>
        </ul>
 -->
<div class="frames">
    <div class="frame" id="sirkulasi">
    <h4 style="color:white;">Peminjaman</h4>
    <div id="loadarea"></div>
    <input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">
        <div style="overflow:scroll;height:600px">  

            <!-- <div class="toolbar"> -->
                <div class="toolbar-group fg-white transparent ">
                    <a href="#"  id="peminjamanBC" onclick="loadFR('pinjam','');" class="button bg-blue fg-white" data-hint="Peminjaman"><i class="icon-plus-2"></i> Peminjaman</a>
                    <!-- <a href="#"  id="pengembalianBC" onclick="loadFR('kembali','');" class="button bg-blue fg-white" data-hint="Pengembalian"><i class="icon-download-2"></i> Pengembalian</a> -->
                    <!-- <a href="#" id="optionBC" data-hint="Selengkapnya..." class="button bg-gray fg-white"><i class="icon-grid"></i></a> -->
                </div>

                <div class="place-right">

                <div class="input-control text span2" data-role="datepicker" data-format="dd-mm-yyyy" data-position="top" data-effect="slide">
                    <input type="text" id="tgl1TB" name="tgl1TB" class="sirkulasi_cari">
                    <button class="btn-date"></button>
                </div> s/d
                <div class="input-control text span2" data-role="datepicker" data-format="dd-mm-yyyy" data-position="top" data-effect="slide">
                    <input type="text" id="tgl2TB" name="tgl2TB" class="sirkulasi_cari">
                    <button class="btn-date"></button>
                </div> 
                    <a href="#" onclick="viewTB('sirkulasi');" id="hari_iniBC" name="hari_iniBC" class="button bg-gray fg-white" ><i class="icon-clock"></i> Hari ini</a>
                    <a  href="#" onclick="viewTB('sirkulasi');" id="bulan_iniBC" name="bulan_iniBC" class="button bg-gray fg-white"><i class="icon-clock"></i> Bulan ini</a>
                    <a data-hint="Tampilkan"  href="#" onclick="loadAll();" id="tampilkanBC" name="refreshBC" class="button bg-blue fg-white"><i class="icon-cycle"></i> </a>
                
                </div>
            <!-- </div> Akhir toolbar -->
            
        <div class="divider">&nbsp;</div>

                    <button data-hint="Field Pencarian" xclass="large" id="cari_sirkulasiBC" class="cari"><span class="icon-search"></span> </button>
                         <table class="table hovered bordered striped">
                            <thead>
                                <tr style="color:white;"class="info">
                                    <th class="text-left">Tgl Peminjaman </th>
                                    <th class="text-left">Peminjam</th>
                                    <th class="text-left">Barcode Item</th>
                                    <th class="text-left">Judul Item</th>
                                    <th class="text-left">Tgl Pengembalian</th>
                                    <!-- <th class="text-left">Status</th> -->
                                    <th class="text-left">Tgl Dikembalikan</th>
                                    <th class="text-left">Terlambat</th>
                                    <th class="text-left">Keterangan</th>
                                    <!-- <th style="display:visible;"class="text-left  uraianCOL">Detil Jurnal</th> -->
                                    <th class="text-left">Aksi</th>
                                </tr>
                                <tr style="display:none;" id="sirkulasiTR">
                                    <th class="text-left"></th>
                                    <th class="text-center">
                                        <div class="input-control select">
                                            <select data-hint="Peminjam" id="memberS" class="sirkulasi_cari">
                                                <option value="">Semua</option>
                                                <option value="1">Siswa</option>
                                                <option value="2">Guru</option>
                                                <option value="3">Member Luar</option>
                                            </select>
                                        </div>
                                    </th>
                                    <!-- <th class="text-left"><input class="cari" placeholder="Id Member atau Nama" id="memberS" name="memberS"></th> -->
                                    <th class="text-left"><input class="sirkulasi_cari" placeholder="Barkode" id="barkodeS" name="barkodeS"></th>
                                    <th class="text-left"><input class="sirkulasi_cari" placeholder="Judul" id="judulS" name="judulS"></th>
                                    <th class="text-left"></th>
                                    <th class="text-left"></th>
                                    <th class="text-center">
                                        <div class="input-control select">
                                            <select onchange="viewTB();" data-hint="terlambat" id="terlambatS" class="sirkulasi_cari"></select>
                                        </div>
                                    </th>
                                    <th class="text-left"></th>
                                    <th class="text-left"></th>
                                </tr>
                            </thead>

                            <tbody id="sirkulasi_tbody">
                            </tbody>
                            <tfoot>
                            </tfoot>
                        </table>
        </div><!--End Scroll sirkulasi-->
</div> <!-- End Frame Sirkulasi -->
<!-- End Sirkulasi -->

    

  </div><!-- End Frames -->
<!-- </div>End Tab -->