<script src="controllers/c_sirkulasi.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<!-- combo grid -->
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!--end of combo grid -->

    <div class="tab-control" data-role="tab-control">
        <ul class="tabs">
            <li class="active"><a href="#sirkulasi">Sirkulasi</a></li>
            <li><a onclick="statistikVW();" href="#statistik">Statistik</a></li>
        </ul>

<div class="frames">
    <div class="frame" id="sirkulasi">
 <div id="loadarea"></div>
    <input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

    <div class="toolbar">
        <div class="toolbar-group fg-white transparent ">
            <button id="peminjamanBC"class="bg-blue" data-hint="Peminjaman"><i class="icon-upload-3"></i> Peminjaman</button>
            <button id="pengembalianBC"class="bg-green" data-hint="Pengembalian"><i class="icon-download-2"></i> Pengembalian</button>
            <!-- <button id="printBC"class="bg-amber" data-hint="Cetak"><i class="icon-printer"></i></button> -->
            <button id="optionBC" data-hint="Selengkapnya..." class="bg-gray fg-white"><i class="icon-grid"></i></button>
        </div>
    </div>
    
<div id="optionPN">
    <div class="row">
        <div class="span9" style="color:white;"> 
            <!-- colom 1 -->
            <div class="row">
                <div class="span3 input-control checkbox" >
                    <label>
                        <b>Catatan Sirkulasi</b>
                    </label>
                </div>
                <div class="span3 input-control checkbox" >
                    <label>
                        <b>Keterlambatan</b>
                    </label>
                </div>
                <div class="span3 input-control checkbox" >
                    <label>
                        <b>Peminjam</b>
                    </label>
                </div>
            </div>
            <div class="row">
                <div class="span3 input-control checkbox" >
                    <label>
                        <input checked="checked" type="checkbox" />
                        <span class="check"></span>
                        Masih dipinjam
                    </label>
                </div>
                <div class="span3 input-control checkbox" >
                    <label>
                        <input checked="checked" type="checkbox" />
                        <span class="check"></span>
                        Tidak Terlambat
                    </label>
                </div>
                <div class="span3 input-control checkbox" >
                    <label>
                        <input checked="checked" type="checkbox" />
                        <span class="check"></span>
                        Siswa
                    </label>
                </div>
                
            </div>
            <!--end of colom 1 -->

            <!-- colom 2 -->
            <div class="row">
                <div class="span3 input-control checkbox" >
                    <label>
                        <input checked="checked" type="checkbox" />
                        <span class="check"></span>
                       Sudah Dikembalikan 
                    </label>
                </div>
                <div class="span3 input-control checkbox" >
                    <label>
                        <input checked="checked" type="checkbox" />
                        <span class="check"></span>
                        Terlambat
                    </label>
                </div>
                <div class="span3 input-control checkbox" >
                    <label>
                        <input checked="checked" type="checkbox" />
                        <span class="check"></span>
                        Pegawai
                    </label>
                </div>
            </div>
            <!--end of colom 2 -->

            <!-- colom 3 -->
            <div class="row">
                <div class="span3 input-control checkbox" >
                    <label>
                    </label>
                </div>
                <div class="span3 input-control checkbox" >
                    <label>
                    </label>
                </div>
                <div class="span3 input-control checkbox" >
                    <label>
                        <input checked="checked" type="checkbox" />
                        <span class="check"></span>
                        Member Luar
                    </label>
                </div>
            </div>
            <!--end of Colom 3-->
        </div>
    </div>
    <div class="input-control text span2" data-role="datepicker" data-format="dd mmmm yyyy" data-position="top" data-effect="slide">
        <input type="text" id="tgl1TB" name="tgl1TB">
        <button class="btn-date"></button>
    </div> s/d
    <div class="input-control text span2" data-role="datepicker" data-format="dd mmmm yyyy" data-position="top" data-effect="slide">
        <input type="text" id="tgl2TB" name="tgl2TB">
        <button class="btn-date"></button>
    </div> 
    <button data-hint="Tampilkan" class="bg-blue fg-white" style="font-weight:bold;" id="tampilkanBC">Tampilkan >> </button>
    <button id="hari_iniBC" class="bg-gray fg-white" style="font-weight:bold;"><i class="icon-clock"></i> Hari ini</button>
    <button id="bulan_iniBC" class="bg-gray fg-white" style="font-weight:bold;"><i class="icon-clock"></i> Bulan ini</button>
</div>

<div class="divider">&nbsp;</div>

            <button data-hint="Field Pencarian" xclass="large" id="cari_sirkulasiBC"><span class="icon-search"></span> </button>
                 <table class="table hovered bordered striped">
                    <thead>
                        <tr style="color:white;"class="info">
                            <th class="text-left">Tgl Peminjaman </th>
                            <th class="text-left">Peminjam</th>
                            <th class="text-left">Barcode Item</th>
                            <th class="text-left">Judul Item</th>
                            <th class="text-left">Tgl Pengembalian</th>
                            <th class="text-left">Status</th>
                            <th class="text-left">Tgl Dikembalikan</th>
                            <th class="text-left">Terlambat</th>
                            <th class="text-left">Keterangan</th>
                            <!-- <th style="display:visible;"class="text-left  uraianCOL">Detil Jurnal</th> -->
                            <th class="text-left">Aksi</th>
                        </tr>
                        <tr style="display:none;" id="cari_sirkulasiTR">
                            <th class="text-left"></th>
                            <th class="text-left"><input placeholder="Id Member atau Nama" id="memberS" name="memberS"></th>
                            <th class="text-left"><input placeholder="Barkode" id="barkodeS" name="barkodeS"></th>
                            <th class="text-left"><input placeholder="Judul" id="judulS" name="judulS"></th>
                            <th class="text-left"></th>
                            <th class="text-left"></th>
                            <th class="text-left"></th>
                            <th class="text-left"></th>
                            <th class="text-left"></th>
                            <th class="text-left"></th>
                        </tr>
                    </thead>

                    <tbody id="sirkulasi_tbody">
                    </tbody>
                    <tfoot>
                    </tfoot>
                </table>
</div>
<!-- End Sirkulasi -->

        <!-- Member Luar -->
        <div class="frame" id="statistik">
            <!-- <button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button> -->
            <button data-hint="Field Pencarian" xclass="large" id="cari_statistikBC"><span class="icon-search"></span> </button>
            <div class="input-control select span4">
                <select data-hint="Statistik" name="statistikS" id="statistikS">
                    <option value="0">Judul yang paling sering dipinjam</option>
                    <option value="1">Member dengan peminjaman terbanyak</option>
                </select>
            </div>
            <div class="input-control select span3">
                <select data-hint="Lokasi" name="lokasiS" id="lokasiS"></select>
            </div>
            <br>
    <label>Periode :</label>
    <div class="input-control text span2" data-role="datepicker" data-format="dd mmmm yyyy" data-position="top" data-effect="slide">
        <input type="text" id="s_tgl1TB" name="s_tgl1TB">
        <button class="btn-date"></button>
    </div> s/d
    <div class="input-control text span2" data-role="datepicker" data-format="dd mmmm yyyy" data-position="top" data-effect="slide">
        <input type="text" id="s_tgl2TB" name="s_tgl2TB">
        <button class="btn-date"></button>
    </div> 
    
            <table id="statistikTBL" style="display:visible;" class="table hovered bordered striped panelx" >
                <thead>
                    <tr style="color:white;" class="info">
                        <th class="text-left">Judul</th>
                        <th class="text-left" >Klasifikasi</th>
                        <th class="text-left" >Pengarang</th>
                        <th class="text-left" >Penerbit</th>
                        <th class="text-center">Dipinjam</th>
                    </tr>
                    <tr style="display:none;" id="cari_statistikTR" class="selected">
                        <th class="text-left"><input placeholder="judul" id="s_judulS" name="s_judulS"></th>
                        <th class="text-left"><input placeholder="klasifikasi" id="klasifikasiS" name="klasifikasiS"></th>
                        <th class="text-left"><input placeholder="Pengarang" id="pengarangS" name="pengarangS"></th>
                        <th class="text-left"><input placeholder="Penerbit" id="penerbitS" name="penerbitS"></th>
                        <th class="text-left"></th>
                    </tr>
                </thead>

                <tbody id="statistik_tbody">
                    <!-- row table -->
                </tbody>
                <tfoot>
                    
                </tfoot>
            </table>
        </div>
            <!-- End Member Luar -->

</div>
<!-- End Frames -->
</div>
<!-- End Tab -->
