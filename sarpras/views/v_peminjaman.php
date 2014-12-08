<script src="controllers/c_peminjaman.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script> -->
<!-- <script src="js/metro/metro-hint.js"></script> -->

<!-- D:\xampp\htdocs\sister\js\combogrid -->
<!-- <script type="text/javascript" src="../js/combogrid/jquery-1.9.1.min.js"></script> -->
<script type="text/javascript" src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script type="text/javascript" src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>

<h4 style="color:white;">Peminjaman</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div class="input-control select span3">
    <select  class="peminjaman_cari" data-hint="lokasi" name="lokasiTB" id="lokasiS"></select>
</div>
<input type="text" id="barangTB">
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Peminjam</th>
            <th class="text-center">Barang</th>
            <th class="text-center">Tanggal Peminjaman</th>
            <th class="text-left">Tanggal Pengembalian</th>
            <th class="text-left">Tempat Peminjaman</th>
            <th class="text-left">Keterangan</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"><input class="peminjaman_cari" placeholder="peminjam" id="peminjamS" name="peminjamS"></th>
        </tr>
    </thead>

    <tbody id="peminjamantbody">
    </tbody>
    <tfoot>
        
    </tfoot>
</table> 

<!-- 
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
 -->