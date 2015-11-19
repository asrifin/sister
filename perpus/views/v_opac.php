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
    <input type="text" class="cari" id="cariopac" name="cariopac">
</div>
<!-- <button data-hint="Field Pencarian" xclass="large" id="cariBC" name="cariBC" ><span class="icon-search"></span> </button> -->

<div id="tbody">

</div>




</div>
<!--End Scroll-->

