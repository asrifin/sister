<?php isMenu($modul,'angsuran'); ?>
<script src="controllers/c_angsuran.js"></script>

<h4 class="fg-white"><b>Angsuran</b>
    &nbsp;<button <?php echo isAksi('angsuran','c')?'onclick="viewFR(\'\')"':'disabled'; ?> class="place-left" data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button> 
</h4>
<div style="overflow:scroll;height:550px;" >
    <table class="table hovered bordered striped">
        <thead>
            <tr style="color:white;"class="info">
                <th class="text-center">Angsuran</th>
                <th class="text-center">Keterangan</th>
                <th class="text-center">Aksi</th>
            </tr>
            <tr style="display:none;" id="cariTR" class="info">
                <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="angsuranS"></div></th>
                <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="keteranganS"></div></th>
                <th></th>
            </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table> 
</div>