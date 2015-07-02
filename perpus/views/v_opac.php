<script src="controllers/c_opac.js"></script>
<script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>

<h4 style="color:white;">OPAC</h4>
<div id="loadarea"></div>

 <div style="overflow:scroll;height:600px;" style="display:none;">

<!-- <button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
 -->
<div class="input-control select span3">
    <select class="_cari" data-hint="Cari Berdasarkan" name="berdasarkanS" id="berdasarkanS">
        <option name="judul" value="judul">Judul</option>
        <option name="pengarang" value="pengarang">Pengarang</option>
        <option name="penerbit" value="penerbit">Penerbit</option>
        <option name="klasifikasi" value="klasifikasi">Klasifikasi</option>
    </select>
</div>
<div class="input-control text size3">
    <input type="text" class="_cari" id="cari_opac" name="cari_opac">
</div>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>

<div id="tbody">

</div>


<!-- <table class="table hovered bordered striped">
    <thead>
        <tr style="display:none;" id="cariTR" class="selected">
            <th class="text-left"><input placeholder="kode" id="kodeS" name="kodeS"></th>
            <th class="text-left"><input placeholder="nama" id="namaS"name="namaS"></th>
            <th class="text-left"><input placeholder="alamat" id="alamatS"name="alamatS"></th>
            <th class="text-left"><input placeholder="keterangan" id="keteranganS"name="keteranganS"></th>
            <th class="text-left"></th>
        </tr>
    </thead>

</table> -->


</div>
<!--End Scroll-->

