<!-- <script src="controllers/c_periode.js"></script> -->
<script src="controllers/c_proses.js"></script>

<h4 style="color:white;">Periode Penerimaan</h4>
<div id="loadarea"></div>
<button data-hint="Tambah Data" class="button" id="tambahBC"><i class="icon-plus-2 on-left"></i>Tambah </button>
<!-- <button data-hint="Field Pencarian" class="button" id="cariBC"><span class="icon-search"></span> </button> -->
<div class="input-control select span3">
    <select data-hint="Departemen" name="departemenTB" id="departemenS"></select>
</div>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-left">Periode Penerimaan</th>
            <th class="text-left">Kode Awalan</th>
            <th class="text-left">Angkatan</th>
            <th class="text-left">Kapasitas</th>
            <th class="text-left">Calon SIswa</th>
            <th class="text-left">Siswa Diterima</th>
            <th class="text-left">Status</th>
            <th class="text-left">Keterangan</th>
            <th class="text-left">Aksi</th>

        </tr>
        
<!--         <tr style="display:none;" class="selected" id="cariTR">
            <th class="text-left"><input placeholder="periode" id="periodeS" name="periodeS"></th>
            <th class="text-left"><input placeholder="kode_awalan" id="kode_awalanS" name="kode_awalanS"></th>
            <th class="text-left"><input placeholder="angkatan" id="angkatanS" name="angkatanS"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
            <th class="text-left"></th>
        </tr>
 -->
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
