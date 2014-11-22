<!-- .. -->
<script src="controllers/c_grup.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Inventaris</h4>
<div id="loadarea"></div>

<!-- panel 1 -->
<div title="Grup Barang" class="panelx" id="panel1" style="display:none;">
    <div class="input-control select span3">
        <select name="g_lokasiS" id="g_lokasiS" data-hint="lokasi" ></select>
    </div>
    <button data-hint="Tambah Data" id="g_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="g_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak" id="g_cetakBC"><span class="icon-printer"></span> </button>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Kode </th>
                <th class="text-center">Grup Barang</th>
                <th class="text-left">Jum Unit</th>
                <th class="text-left">Unit Tersedia</th>
                <th class="text-left">Unit Dipinjam</th>
                <th class="text-left">Total Aset</th>
                <th class="text-left">Keterangan</th>
                <th class="text-left">Aksi</th>
            </tr>
            <tr style="display:none;" id="g_cariTR" class="selected">
                <th class="text-left"><input placeholder="kode" id="g_kodeS" name="g_kodeS" class="span1"></th>
                <th class="text-left"><input placeholder="nama" id="g_namaS" name="g_namaS"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"><input placeholder="keterangan" id="g_keteranganS" name="g_keteranganS"></th>
                <th class="text-left"></th>
            </tr>
        </thead>

        <tbody id="g_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 1 -->

<!-- panel 2 -->
<!-- <div  data-role="scrollbox1" data-scroll="both" xstyle="width: 500px" title="Katalog Barang" class="panelx" id="panel2" style="display:none;"> -->
<div title="Katalog Barang" class="panelx" id="panel2" style="display:none;">
    <button data-hint="kembali" id="k_grupBC"><span class=" icon-arrow-left-2"></span> </button>
    <button data-hint="Tambah Data" id="k_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="k_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak " id="k_cetakBC"><span class="icon-printer"></span> </button>
    
    <div class="grid" style="color:white;">
        <input type="hidden" id="k_grupH1" name="k_grupH1" >
        <div class="row">
            <div class="span2">Grup Barang : </div>
            <div id="k_grupDV" class="span2"></div>
        </div>
        <div class="row">
            <div class="span2">Lokasi :</div>
            <div id="k_lokasiDV" class="span2"></div>
        </div>
        <div class="row">
            <div class="span2">Total Aset :</div>
            <div id="k_totasetDV" class="span2"></div>
        </div>
    </div>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Kode </th>
                <th class="text-center">Nama Barang</th>
                <th class="text-left">Jenis</th>
                <th class="text-left">Jumlah Unit</th>
                <th class="text-left">Asset</th>
                <th class="text-left">Penyusutan per th</th>
                <th class="text-left">Keterangan</th>
                <th class="text-left">Aksi</th>
            </tr>
            <tr style="display:none;" id="k_cariTR" class="selected">
                <th class="text-left"><input placeholder="kode" id="k_kodeS" name="k_kodeS" class="span1"></th>
                <th class="text-left"><input placeholder="nama" id="k_namaS" name="k_namaS"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"></th>
                <th class="text-left"><input placeholder="keterangan" id="k_keteranganS" name="k_keteranganS"></th>
                <th class="text-left"></th>
            </tr>
        </thead>

        <tbody id="k_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 2 -->

<!-- panel 3 -->
<!-- <div id="panel3" class="panelx" style="display:none;">iki panel 3</div> -->
<div title="Unit Barang" class="panelx" id="panel3" style="display:none;">
    <button data-hint="kembali ke Katalog" id="b_katalogBC"><span class=" icon-arrow-left-2"></span> </button>
    <button data-hint="Ubah Data" id="b_ubahBC"><span class="icon-pencil"></span> </button>
    <button data-hint="Tambah Data" id="b_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="b_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak" id="b_cetakBC"><span class="icon-printer"></span> </button>

    <input type="hidden" id="b_katalogH1" name="b_katalogH1" >

    <!-- <div class="grid show-grid"> -->
    <div class="grid" style="color:white;">
         <div class="row">
            <div class="span5">
                <label>Keterangan </label>
                <div class="row">
                    <div class="span2">Nama Barang :</div>
                    <div id="b_katalogDV" class="span2"></div>
                </div>
                <div class="row">
                    <div class="span2">Grup Barang :</div>
                    <div id="b_grupDV" class="span2"></div>
                </div>
                <div class="row">
                    <div class="span2">Lokasi :</div>
                    <div id="b_lokasiDV" class="span2"></div>
                </div>    
                <div class="row">
                    <div class="span2">Jumlah Unit :</div>
                    <div id="b_totbarangDV" class="span2"></div>
                </div>    
                <div class="row">
                    <div class="span2">Total Aset :</div>
                    <div id="b_totasetDV" class="span2"></div>
                </div>    
                <div class="row">
                    <div class="span2">Penyusutan per th :</div>
                    <div id="b_susutDV" class="span2"></div>
                </div>    
            </div>  
            <div class="span5 xoffset1">
                <div class="span5">
                    <label for="">Gambar :</label>
                    <img src="images/5.jpg" width="200" class="shadow">
                </div>
            </div>  
            <div class="span5">
                <div class="span5">
                    <label for="">Presentase Kondisi :</label>
                    <img src="images/5.jpg" width="200" class="shadow">
                </div>
            </div>
        </div>
    </div>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Kode </th>
                <th class="text-center">Barcode</th>
                <th class="text-left">Tempat</th>
                <th class="text-left">Sumber</th>
                <th class="text-left">Harga</th>
                <th class="text-left">Kondisi</th>
                <th class="text-left">Status</th>
                <th class="text-left">Keterangan</th>
                <th class="text-left">Aksi</th>
            </tr>
            <tr style="display:none;" id="b_cariTR" class="selected">
                <th class="text-left"><input placeholder="kode" id="b_kodeS" name="b_kodeS"></th>
                <th class="text-left"><input placeholder="barkode" id="b_barkodeS" name="b_barkodeS"></th>
                <th class="text-left"></th>
                <th class="text-left">
                    <select name="b_sumberS"id="b_sumberS">
                        <option value="">-Semua-</option>
                        <option value="0">Beli</option>
                        <option value="1">Pemberian</option>
                        <option value="2">Membuat Sendiri</option>
                    </select> 
                </th>
                <th class="text-left"><input placeholder="harga" id="b_hargaS" name="b_hargaS"></th>
                <th class="text-left">
                    <select name="b_kondisiS" id="b_kondisiS"></select>
                </th>
                <th class="text-left">
                    <select id="b_statusS" name="b_statusS">
                        <option value="">-Semua-</option>
                        <option value="1">Tersedia</option>
                        <option value="2">Dipinjam</option>
                    </select>
                </th>
                <th class="text-left"><input placeholder="keterangan" id="b_keteranganS" name="b_keteranganS"></th>
                <th class="text-left"></th>
            </tr>
        </thead>
        <tbody id="b_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- tes lagi ah  -->
<!-- end of panel 3 -->
<!-- 
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
 -->
