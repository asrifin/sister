<script src="controllers/c_pendataan.js"></script>
<!-- <script src="js/metro/metro-button-set.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>
 -->
<h4 style="color:white;">Pendataan Calon Siswa</h4>
<div id="loadarea"></div>

<button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button>
<button data-hint="Field Pencarian" xclass="large" id="cariBC"><span class="icon-search"></span> </button>
<div class="input-control select span3">
    <select data-hint="Departemen" name="departemenS" id="departemenS"></select>
</div>
<div class="input-control select span3">
    <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
</div>

<table class="table hovered bordered striped panelx" id="panel1">
    <thead>
        <tr style="color:
        white;" class="info">
            <th class="text-left" rowspan="2">Nomor Pendaftaran</th>
            <th class="text-left" rowspan="2">Nama</th>
            <th class="text-left" rowspan="2">Uang Pangkal</th>
            <th class="text-center" colspan="3">Discount</th>
            <th class="text-right" rowspan="2">Denda</th>
            <th class="text-left" rowspan="2">Uang Pangkal Net</th>
            <th class="text-left">Angsuran</th>
            <th class="text-left" rowspan="2">Aksi</th>
        </tr>
        <tr style="color:white;" class="info">
            <th class="text-right">Subsidi</th>
            <th class="text-right">Saudara</th>
            <th class="text-right">Tunai</th>
            <th>x bulan</th>
        </tr>
        <tr style="display:none;" id="cariTR" class="selected">
            <!-- <th class="text-left"></th> -->
            <th class="text-left"><input placeholder="no pendaftaran" id="nopendaftaranS" name="nopendaftaranS"></th>
            <!-- <th class="text-left"><input placeholder="tglpendaftaran" id="tglpendaftaranS" name="tglpendaftaranS"></th> -->
            <th class="text-left"><input placeholder="nama" id="namaS" name="namaS"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
        </tr>
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>


<form autocomplete="off" onsubmit="simpan();return false;" id="pendataanFR" class="panelx" style="display:none"> 
                        <input id="idformH" type="hidden"> 
                        
                        <label>Departemen</label>
                        <div class="input-control text">
                            <input type="hidden" name="departemenH" id="departemenH">
                            <input disabled type="text" name="departemenTB" id="departemenTB">
                            <button class="btn-clear"></button>
                        </div>
                        
                        <label>Tahun Ajaran</label>
                        <div class="input-control text size2">
                            <input type="hidden" name="tahunajaranH" id="tahunajaranH">
                            <input disabled type="text" name="tahunajaranTB" id="tahunajaranTB">
                            <button class="btn-clear"></button>
                        </div>
                        
                        <label>Kelompok</label>
                        <div class="input-control text">
                            <input placeholder="Kelompok" oninvalid="this.setCustomValidity(\isi dulu gan\);" required type="text" name="kelompokTB" id="kelompokTB">
                            <button class="btn-clear"></button>
                        </div>
                        
                        <label>Tanggal Mulai</label>
                        <div class="input-control text size2" data-role="datepicker"
                            // data-date="2014-10-23"
                            data-format="yyyy-mm-dd"
                            data-effect="slide">
                            <input id="tglmulaiTB" name="tglmulaiTB" type="text">
                            <button class="btn-date"></button>
                        </div>

                        <label>Tanggal Akhir</label>
                        <div class="input-control text size2" data-role="datepicker"
                            // data-date="2014-10-23"
                            data-format="yyyy-mm-dd"
                            data-effect="slide">
                            <input id="tglakhirTB" name="tglakhirTB" type="text">
                            <button class="btn-date"></button>
                        </div>

                        <label>Biaya Pendaftaran</label>
                        <div class="input-control text size2">
                            <input placeholder="Biaya Pendaftaran" oninvalid="this.setCustomValidity(\isi dulu gan\);" required type="text" name="biaya_pendaftaranTB" id="biaya_pendaftaranTB">
                            <button class="btn-clear"></button>
                        </div>

                        <label>Keterangan</label>
                        <div class="input-control textarea">
                            <textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>
                        </div>
                        
                        <div class="form-actions"> 
                            <button class="button primary">simpan</button>&nbsp;
                            <button class="button" type="button" onclick="$.Dialog.close()">Batal</button> 
                        </div>
                    </form>;
