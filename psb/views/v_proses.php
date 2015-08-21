<script src="controllers/c_proses.js"></script>

<h4 style="color:white;">Periode Penerimaan</h4>
<div id="loadarea"></div>
<button data-hint="Tambah Data" class="button" id="tambahBC"><i class="icon-plus-2 on-center"></i></button>

<div style="display:none;" class="input-control select span3">
    <select data-hint="Departemen" name="departemenTB" id="departemenS"></select>
</div>

<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Periode Penerimaan</th>
            <th class="text-center">Kode Awalan</th>
            <th class="text-center">Angkatan</th>
            <th class="text-center">Kapasitas</th>
            <th class="text-center">Calon SIswa</th>
            <th class="text-center">Siswa Diterima</th>
            <th class="text-center">Status</th>
            <th class="text-center">Keterangan</th>
            <th class="text-center">Aksi</th>

        </tr>
        
<!--         <tr style="display:none;" class="selected" id="cariTR">
            <th class="text-center"><input placeholder="periode" id="periodeS" name="periodeS"></th>
            <th class="text-center"><input placeholder="kode_awalan" id="kode_awalanS" name="kode_awalanS"></th>
            <th class="text-center"><input placeholder="angkatan" id="angkatanS" name="angkatanS"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
            <th class="text-center"></th>
        </tr>
 -->
    </thead>

    <tbody id="tbody">
        <!-- row table -->
    </tbody>
    <tfoot>
        
    </tfoot>
</table>
