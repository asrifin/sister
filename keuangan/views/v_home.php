<?php 
    $out='';
    // looping grup menu
    foreach ($_SESSION['grupmodulS'][''] as $i => $v) {
        $out.='<div class="tile-group '.$v['size'].'">
                <div class="tile-group-title">'.$v['grupmenu'].'</div>';

        // looping menu item
        // foreach ($v['modul'] as $ii => $vv) {
        //     $out.='<a id="mod-'.$vv['kode'].'" 
        //             '.($vv['statmod']==0?' onclick="alert(\'Maaf anda tidak berhak akses modul ~'.$vv['modul'].'~ \');"':'').' 
        //             href="'.($vv['statmod']!=0?$vv['kode']:'#').'" class="tile '.$vv['size'].' 
        //             bg-'.($vv['statmod']!=0?$vv['warna']:'grey').' live" data-role="live-tile" 
        //             '.($vv['statmod']!=0?'data-effect="slideUp"':'').' 
        //             data-click="transform">
        //             <div style="align:center;" class="tile-content email">
        //                 <center>
        //                     <img src="images/'.$vv['icon'].'.png">
        //                 </center>
        //             </div>
        //             <div class="tile-content email">
        //                 <div class="email-data-text">Keterangan :</div>
        //                 <div class="email-data-text">'.$vv['keterangan'].'</div>
        //             </div>
        //             <div class="brand">
        //                 <div class="label">
        //                     <h4 class="no-margin fg-white">
        //                         '.$vv['modul'].'
        //                     </h4>
        //                 </div>
        //                 <div class="badge">3</div>
        //             </div>
        //         </a>';
        // } //end of looping modul
        $out.='</div>';
    } ///end of looping grup modul
    echo $out;
    exit();
    // if($_SESSION[''])
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