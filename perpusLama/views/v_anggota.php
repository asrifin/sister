<script src="controllers/c_anggota.js"></script>

<h4 style="color:white;">Data Anggota</h4>
<div id="loadarea"></div>
    

    <div class="tab-control" data-role="tab-control">
        <ul class="tabs">
            <li class="active"><a href="#anggota">Siswa</a></li>
            <li><a onclick="vwPegawai();" href="#pegawai">Pegawai</a></li>
            <li><a onclick="vwLuar();" href="#luar">Member Luar</a></li>
        </ul>
     
    <div class="frames">
        <div class="frame" id="anggota">
            <!-- <button data-hint="Tambah Data" xclass="large" id="tambahBC"><span class="icon-plus-2"></span> </button> -->
            <button data-hint="Field Pencarian" xclass="large" id="siswaBC"><span class="icon-search"></span> </button>
            <div class="input-control select span3">
                <select data-hint="Departemen" name="lokasiS" id="lokasiS"></select>
            </div>
            <div class="input-control select span3">
                <select data-hint="Tahun Ajaran" name="tahunajaranS" id="tahunajaranS"></select>
            </div>
            <div class="input-control select span3">
                <select data-hint="Tingkat" name="tingkatbukuS" id="tingkatbukuS"></select>
            </div>
            <div class="input-control select span3">
                <select data-hint="Kelas" name="kelasS" id="kelasS"></select>
            </div>
            
            <!-- Siswa -->
            <table id="siswaTBL" style="display:visible;" class="table hovered bordered striped panelx" >
                <thead>
                    <tr style="color:white;" class="info">
                        <th class="text-left">Nis</th>
                        <th class="text-left" >Nama</th>
                        <th class="text-left" >Jml Item Sedang Dipinjam</th>
                        <th class="text-center">Total Peminjaman</th>
                    </tr>
                    <tr style="display:none;" id="siswaTR" class="selected">
                        <th class="text-left"><input placeholder="Nis" id="nisS" name="nisS" class="siswa_cari"></th>
                        <th class="text-left"><input placeholder="Nama" id="namaS" name="namaS" class="siswa_cari"></th>
                        <th class="text-left"></th>
                        <th class="text-left"></th>
                    </tr>
                </thead>

                <tbody id="siswa_tbody">
                    <!-- row table -->
                </tbody>
                <tfoot>
                    
                </tfoot>
            </table>

        </div>

        <!-- Pegawai -->
        <div class="frame" id="pegawai">
            <button data-hint="Field Pencarian" xclass="large" id="pegawaiBC"><span class="icon-search"></span> </button>

            <table id="pegawaiTBL" style="display:visible;" class="table hovered bordered striped panelx" >
                <thead>
                    <tr style="color:white;" class="info">
                        <th class="text-left">NIP</th>
                        <th class="text-left" >Nama</th>
                        <th class="text-left" >Jml Item Sedang Dipinjam</th>
                        <th class="text-left">Total Peminjaman</th>
                        <th class="text-center">Pilihan</th>
                    </tr>
                    <tr style="display:none;" id="pegawaiTR" class="selected">
                        <th class="text-left"><input placeholder="NIP" id="nipS" name="nipS" class="pegawai_cari"></th>
                        <th class="text-left"><input placeholder="Nama Pegawai" id="pegawaiS" name="pegawaiS" class="pegawai_cari"></th>
                        <th class="text-left"></th>
                        <th class="text-left"></th>
                        <th class="text-left"></th>
                    </tr>
                </thead>

                <tbody id="pegawai_tbody">
                    <!-- row table -->
                </tbody>
                <tfoot>
                    
                </tfoot>
            </table>

        </div>
        
        <!-- Member Luar -->
        <div class="frame" id="luar">
            <button data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button>
            <button data-hint="Field Pencarian" xclass="large" id="luarBC"><span class="icon-search"></span> </button>
        
            <table id="luarTBL" style="display:visible;" class="table hovered bordered striped panelx" >
                <thead>
                    <tr style="color:white;" class="info">
                        <th class="text-left">ID Member</th>
                        <th class="text-left" >Nama</th>
                        <th class="text-left" >Kontak</th>
                        <th class="text-left" >Alamat</th>
                        <th class="text-left" >Jml Item Sedang Dipinjam</th>
                        <th class="text-center">Total Peminjaman</th>
                        <th class="text-center">Aksi</th>
                    </tr>
                    <tr style="display:none;" id="luarTR" class="selected">
                        <th class="text-left"><input placeholder="idmember" id="idmemberS" name="idmemberS" class="luar_cari"></th>
                        <th class="text-left"><input placeholder="Nama" id="nama_luarS" name="nama_luarS" class="luar_cari"></th>
                        <th class="text-left"></th>
                        <th class="text-left"></th>
                        <th class="text-left"></th>
                        <th class="text-left"></th>
                        <th class="text-left"></th>
                    </tr>
                </thead>

                <tbody id="luar_tbody">
                    <!-- row table -->
                </tbody>
                <tfoot>
                    
                </tfoot>
            </table>
        </div>
            <!-- End Member Luar -->

    </div>
        <!-- End Frames -->

    </div>
    <!-- End Tab -->