<script src="controllers/c_koleksi.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">Daftar Koleksi</h4>
<div id="loadarea"></div>

<!-- <button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button> -->

<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div class="input-control select span3">
    <select data-hint="lokasi" name="lokasiS" id="lokasiS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Jenis Buku" name="jenisbukuS" id="jenisbukuS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tingkat Buku" name="tingkatbukuS" id="tingkatbukuS"></select>
</div>
           

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Barcode</th>
            <th class="text-center">Nomor Induk</th>
            <th class="text-left">Judul</th>
            <th class="text-left">Call Number</th>
            <th class="text-left">Klasifikasi</th>
            <th class="text-left">Pengarang</th>
            <th class="text-left">Penerbit</th>
            <th class="text-left">Status</th>
            <th class="text-left">Aksi</th>
        </tr>

        <tr style="display:none;" id="cariTR" class="selected">
            <!-- <th class="text-left"></th> -->
            <th class="text-left"><input placeholder="barcode" id="barkodeS" name="barkodeS"></th>
            <th class="text-left"><input placeholder="idbuku" id="idbukuS" name="idbukuS"></th>
            <th class="text-left"><input placeholder="judul" id="judulS" name="judulS"></th>
            <th class="text-left"><input placeholder="call number" id="callnumberS" name="callnumberS"></th>
            <th class="text-left"><input placeholder="klasifikasi" id="klasifikasi-kodeS" name="klasifikasi-kodeS"></th>
            <th class="text-left"><input placeholder="pengarang" id="pengarangS" name="pengarangS"></th>
            <th class="text-left"><input placeholder="penerbit" id="penerbitS" name="penerbitS"></th>
            <th class="text-left"><input placeholder="status" id="statusS" name="statusS"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
<!-- 
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
 -->