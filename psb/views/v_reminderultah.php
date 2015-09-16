<?php isMenu($modul,'reminderultah'); ?>
<script src="controllers/c_reminderultah.js"></script>

<h4 class="fg-white"><b>Reminder Ulang Tahun</b></h4>
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">Tanggal Lahir</th>
            <th class="text-center">Nama Mama</th>
            <th class="text-center">Nama Anak</th>
            <th class="text-center">Kelas</th>
            <th class="text-center">Alamat</th>
            <th class="text-center">Email</th>
        </tr>
        <tr id="cariTR" class="info">
            <th></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="namaibuS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="namasiswaS"></div></th>
            <th class="text-center">
                <!-- <div class="input-control text"><input class="cari" placeholder="cari..." id="kelasS"></div> -->
            </th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="alamatibuS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari..." id="emailibuS"></div></th>
        </tr>
    </thead>
    <tbody id="tbody">
    </tbody>
</table> 