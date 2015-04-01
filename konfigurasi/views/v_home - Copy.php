<?php 
    $out='';
    // looping grup menu
    foreach ($_SESSION['grupmodulS']as $i => $v) {
        foreach ($v['modul'] as $i2 => $v2) {
            if($v2['modul']==$modul and $v2['statmod']==1) {
                foreach ($v2['grupmenu'] as $i3 => $v3) {
                    $out.='<div class="tile-group '.$v3['size'].'">
                            <div class="tile-group-title">'.$v3['grupmenu'].'</div>';
                    foreach ($v3['menu'] as $i4 => $v4) {
                        $out.=' <a href="'.($v4['statmenu']==0?'#':$v4['link']).'" class="tile '.$v4['size'].' 
                                    bg-'.($v4['statmenu']==0?'grey':$v4['warna']).'" data-click="transform">
                                    <div class="tile-content icon">
                                        <span class="icon-'.($v4['statmenu']==0?'locked-2':$v4['icon']).'"></span>
                                    </div>
                                    <div class="brand">
                                        <div class="label">'.$v4['menu'].'</div>
                                    </div>
                                </a>';
                    }// end of menu looping
                    $out.='</div>';
                } // end of grupmenu looping
            } // end of modul checking
        } // end of  modul looping
    } // grup grupmodul looping 
    echo $out;
    exit();
?>

<div class="tile-group four">
    <div class="tile-group-title">Transaksi Keuangan</div>

    <!--Transaksi -->
    <a href="transaksi" class="tile double bg-lightBlue" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-pencil    "></span>
        </div>
        <div class="brand">
            <div class="label">Transaksi</div>
        </div>
    </a>
    <!--end of  Transaksi -->

    <!--modul Pembayaran -->
    <a href="modul-pembayaran" class="tile double bg-lightRed" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-book"></span>
        </div>
        <div class="brand">
            <div class="label">Modul Pembayaran</div>
        </div>
    </a>
    <!--end of modul  Pembayaran  -->

    <!-- Pembayaran -->
    <a href="pembayaran" class="tile double bg-brown" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-book"></span>
        </div>
        <div class="brand">
            <div class="label">Pembayaran</div>
        </div>
    </a>
    <!--end of  Pembayaran  -->

    <!-- Pembayaran Pendaftaran -->
<!--     <a href="pembayaran-pendaftaran" class="tile double bg-green" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-pencil"></span>
        </div>
        <div class="brand">
            <div class="label">Pembayaran Pendaftaran</div>
        </div>
    </a>
 -->    <!--end of  Pembayaran Pendaftaran -->

    <!-- Pembayaran Uang Pangkal -->
<!--     <a href="pembayaran-uang-pangkal" class="tile double bg-lightOrange" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-pencil"></span>
        </div>
        <div class="brand">
            <div class="label">Pembayaran Uang Pangkal</div>
        </div>
    </a>
 -->    <!--end of  Pembayaran Uang Pangkal -->

    <!-- Pembayaran Uang Sekolah -->
    <!-- <a href="pembayaran-uang-sekolah" class="tile double bg-violet" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-pencil"></span>
        </div>
        <div class="brand">
            <div class="label">Pembayaran Uang Sekolah</div>
        </div>
    </a> -->
    <!--end of  Pembayaran Uang Sekolah -->

    <!-- Inventory  -->
    <a href="inventory" class="tile double bg-lightPink" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-box"></span>
        </div>
        <div class="brand">
            <div class="label">Inventory</div>
        </div>
    </a>
    <!--end of  Inventory -->


</div> <!-- End group -->

<div class="tile-group double">
    <div class="tile-group-title">Referensi</div>

    <!-- Tahun Buku -->
    <a href="tahun-buku" class="tile bg-green" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-copy"></span>
        </div>
        <div class="brand">
            <div class="label">Tahun Buku</div>
        </div>
    </a>
    <!--end of  Tahun Buku -->

    <!-- kategori  Rekening -->
    <a href="kategori-rekening" class="tile bg-orange" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-copy"></span>
        </div>
        <div class="brand">
            <div class="label">kategori  Rekening</div>
        </div>
    </a>
    <!--end of  kategori  Rekening -->

    <!--  Detil Rekening -->
    <a href="detil-rekening" class="tile bg-lightOrange" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-copy"></span>
        </div>
        <div class="brand">
            <div class="label"> Rekening</div>
        </div>
    </a>
    <!--end of Detil Rekening -->

    <!-- Kode saldo Rekening -->
    <a href="saldo-rekening" class="tile bg-yellow" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-copy"></span>
        </div>
        <div class="brand">
            <div class="label">Saldo Rekening</div>
        </div>
    </a>
    <!--end of  Kode saldoRekening -->

    <!-- Anggaran -->
    <a href="set-anggaran" class="tile bg-blue" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-copy"></span>
        </div>
        <div class="brand">
            <div class="label">Set Anggaran</div>
        </div>
    </a>
    <!-- end of Anggaran -->

    <!--  Anggaran Tahunan -->
    <a href="anggaran-tahunan" class="tile bg-lightBlue" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-copy"></span>
        </div>
        <div class="brand">
            <div class="label">Anggaran Tahunan</div>
        </div>
    </a>
    <!-- end of Anggaran Tahunan-->

    <!--  kategori modul pembayaran -->
    <a href="kategori-modul" class="tile bg-lightGreen" data-click="transform">
        <div class="tile-content icon">
            <span class="icon-copy"></span>
        </div>
        <div class="brand">
            <div class="label">Kategori Modul</div>
        </div>
    </a>
    <!-- end of Anggaran Tahunan-->
</div> <!-- End group 2-->