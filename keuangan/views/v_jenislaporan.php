<script src="controllers/c_jenislaporan.js"></script>
<script src="../../js/metro/metro-button-set.js"></script>
<script src="../../js/metro/metro-hint.js"></script>

<!-- combo grid -->
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!--end of combo grid -->

<h4 style="color:white;">Jenis Laporan</h4>
<div id="loadarea"></div>
<button data-hint="Tambah Data"  id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Rekening</th>
            <th class="text-center">Kategori</th>
            <th class="text-center">Jenis Transaksi</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input  class="cari" placeholder="cari...." id="rekeningS" name="rekeningS"></div></th>
            <th class="text-center"><div class="input-control select">
                <select  class="cari" name="kategoriS" id="kategoriS">
                    <option value="">-SEMUA-</option>
                    <option  class="bg-gray fg-white"  value="o">Operasional</option>
                    <option  class="bg-steel fg-white"  value="n">Non Operasional</option>
                </select>
            </div></th>
            <th class="text-center"><div class="input-control select">
                <select class="cari" name="jenisS" id="jenisS">
                    <option value="">-SEMUA-</option>
                    <option  class="fg-white bg-green"  value="in">Penerimaan</option>
                    <option  class="fg-white bg-red"  value="out">Pengeluaran</option>
                </select>
            <th class="text-center"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row tble -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
