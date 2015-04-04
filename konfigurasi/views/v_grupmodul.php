<script src="controllers/c_grupmodul.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<h4 style="color:white;">Grup Modul</h4>
<div id="loadarea"></div>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<!-- panel 1 -->
<div title="Grup Modul" class="panelx" id="panel1" style="display:none;">
    <button data-hint="Tambah Data" id="g_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="g_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak" id="g_cetakBC"><span class="icon-printer"></span> </button>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">No.</th>
                <th class="text-center">Grup Modul</th>
                <th class="text-center">Size</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr style="display:none;" id="gm_cariTR" class="info">
                <th class="text-center"></th>
                <th class="text-center"><input placeholder="grupmodul" id="gm_grupmodulS" class="gm_cari" class="span1"></th>
                <th class="text-center"><input placeholder="size" id="gm_sizeS" class="gm_cari"></th>
                <th class="text-center"></th>
            </tr>
        </thead>

        <tbody id="gm_tbody">
        </tbody>

        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 1 -->

<!-- panel 2 -->
<div title="Modul" class="panelx" id="panel2" style="display:none;">
    <button data-hint="kembali" id="m_grupmodulBC"><span class=" icon-arrow-left-2"></span> </button>
    <button data-hint="Tambah Data" id="m_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="m_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak " id="m_cetakBC"><span class="icon-printer"></span> </button>
    
    <div class="grid" style="color:white;">
        <input type="hidden" id="m_grupmodulS" name="m_grupmodulS" class="m_cari" >
        <div class="row">
            <div class="span2">Grup Modul : </div>
            <div id="m_grupmodulDV" class="span2"></div>
        </div>
    </div>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Modul </th>
                <th class="text-center">link</th>
                <th class="text-center">warna</th>
                <th class="text-center">icon</th>
                <th class="text-center">size</th>
                <th class="text-center">Keterangan</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr style="display:none;" id="m_cariTR" class="info">
                <th class="text-center"><input placeholder="modul" id="m_modulS"  class="m_cari" class="span1"></th>
                <th class="text-center"><input placeholder="link" id="m_linkS" class="m_cari"></th>
                <th class="text-center"><input placeholder="warna" id="m_warnaS"class="m_cari"></th>
                <th class="text-center"><input placeholder="icon" id="m_iconS"class="m_cari"></th>
                <th class="text-center"><input placeholder="size" id="m_sizeS"class="m_cari"></th>
                <th class="text-center"><input placeholder="keterangan" id="m_keteranganS"class="m_cari"></th>
                <th class="text-center"></th>
            </tr>
        </thead>

        <tbody id="m_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 2 -->

<!-- panel 3 -->
<div title="Grup Menu" class="panelx" id="panel3" style="display:none;">
    <button data-hint="kembali ke Modul" id="gmn_modulBC"><span class=" icon-arrow-left-2"></span> </button>
    <button data-hint="Ubah Data" id="gmn_ubahBC"><span class="icon-pencil"></span> </button>
    <button data-hint="Tambah Data" id="gmn_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="gmn_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak" id="gmn_cetakBC"><span class="icon-printer"></span> </button>

    <div class="grid" style="color:white;">
        <input type="hidden" id="gmn_modulS" class="gmn_cari" >
        <div class="row">
            <div class="span2">Modul</div>
            <div id="gmn_modulDV" xclass="span3"></div>
        </div>
    </div>


    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Grup Menu </th>
                <th class="text-center">size</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr style="display:none;" id="gmn_cariTR" class="selected">
                <th class="text-center"><input placeholder="grupmenu" id="gmn_grupmenuS"class="gmn_cari"></th>
                <th class="text-center"><input placeholder="size" id="gmn_sizeS" class="gmn_cari"></th>
                <th class="text-center"></th>
            </tr>
        </thead>
        <tbody id="gmn_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 3 -->

<!-- panel 4 -->
<div title="Menu" class="panelx" id="panel4" style="display:none;">
    <button data-hint="kembali ke Modul" id="mn_modulBC"><span class=" icon-arrow-left-2"></span> </button>
    <button data-hint="Ubah Data" id="mn_ubahBC"><span class="icon-pencil"></span> </button>
    <button data-hint="Tambah Data" id="mn_tambahBC"><span class="icon-plus-2"></span> </button>
    <button data-hint="Field Pencarian" id="mn_cariBC"><span class="icon-search"></span> </button>
    <button data-hint="Cetak" id="mn_cetakBC"><span class="icon-printer"></span> </button>

    <!-- <input type="text"  class="mn_cari" id="mn_modulS"> -->
    <div class="grid" style="color:white;">
         <div class="row">
            <div class="span5">
                <label>Keterangan </label>
                <div class="row">
                    <div class="span2">Menu :</div>
                    <div id="mn_grupmenuDV" class="span2"></div>
                </div>
            </div>  
        </div>
    </div>

    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">menu</th>
                <th class="text-center">link</th>
                <th class="text-center">size</th>
                <th class="text-center">warna</th>
                <th class="text-center">icon</th>
                <th class="text-center">keterangan</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr style="display:none;" id="mn_cariTR" class="selected">
                <th class="text-center"><input placeholder="menu" id="mn_menuS"class="mn_cari"></th>
                <th class="text-center"><input placeholder="link" id="mn_linkS" class="mn_cari"></th>
                <th class="text-center"><input placeholder="size" id="mn_sizeS" class="mn_cari"></th>
                <th class="text-center"><input placeholder="warna" id="mn_warnaS" class="mn_cari"></th>
                <th class="text-center"><input placeholder="icon" id="mn_iconS" class="mn_cari"></th>
                <th class="text-center"><input placeholder="keterangan" id="mn_keteranganS" class="mn_cari"></th>
                <th class="text-center"></th>
            </tr>
        </thead>
        <tbody id="mn_tbody">
        </tbody>
        <tfoot>
        </tfoot>
    </table>
</div>
<!-- end of panel 4 -->

<!-- 
    // ---------------------- //
    // -- created by epii  -- //
    // ---------------------- // 
 -->
