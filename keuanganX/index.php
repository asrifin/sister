<?php
    session_start();
    if(!isset($_SESSION['loginS'])){
        header('location:../');
    }else{
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="product" content="Metro UI CSS Framework">
    <meta name="description" content="Simple responsive css framework">
    <meta name="author" content="Sergey S. Pimenov, Ukraine, Kiev">

    <link href="../css/metro-bootstrap.css" rel="stylesheet">
    <link href="../css/metro-bootstrap-responsive.css" rel="stylesheet">
    <link href="../css/iconFont.css" rel="stylesheet">
    <link href="../css/docs.css" rel="stylesheet">
    <link href="../prettify/prettify.css" rel="stylesheet">

    <!-- Load JavaScript Libraries -->
    <script src="../js/jquery/jquery.min.js"></script>
    <script src="../js/jquery/jquery.widget.min.js"></script>
    <script src="../js/jquery/jquery.mousewheel.js"></script>
    <script src="../js/prettify/prettify.js"></script>

    <!-- Metro UI CSS JavaScript plugins -->
    <script src="../js/load-metro.js"></script>
     <script src="js/metro.min.js"></script>
     <!-- // <script src="../js/metro-scroll.js"></script> -->

    <!-- Local JavaScript -->
    <script src="../js/docs.js"></script>
    <!--<script src="js/github.info.js"></script>-->
    <script src="../js/start-screen.js"></script>
    <script src="../js/maskedinput/jquery.maskMoney.js" type="text/javascript"></script>

    <!-- js for datatables -->
    <!--<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" language="javascript" src="js/shCore.js"></script>
    <link rel="stylesheet" type="text/css" href="css/shCore.css">-->


    <title>.:SISTER:.</title>
</head>

<body class="metro">
    <!-- <nav class="navigation-bar light fixed-top"> -->
    <nav class="navigation-bar fixed-top">
        <nav class="navigation-bar-content">
            <a class="element brand" href="../">
                <span class="icon-grid-view"></span>  
                Start Menu
            </a>
            <span class="element-divider"></span>
            <a class="element brand" href="./">
                <span class="icon-home"></span>  
                Keuangan
            </a>
            <span class="element-divider"></span>
            <div class="element">
                <a class="dropdown-toggle" href="#">Transaksi Keuangan</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="transaksi">Transaksi</a></li>
                    <li><a href="modul-pembayaran">Modul Pembayaran</a></li>
                    <li><a href="pembayaran">Pembayaran</a></li>
                    <!-- <li><a href="pembayaran-pendaftaran">Pembayaran Pendaftaran</a></li> -->
                    <!-- <li><a href="pembayaran-uang-pangkal">Pembayaran Uang Pangkal</a></li> -->
                    <!-- <li><a href="pembayaran-uang-sekolah">Pembayaran Uang Sekolah</a></li> -->
                    <li><a href="inventory">Inventory</a></li>                
                </ul>
            </div>
            <div class="element">
                <a class="dropdown-toggle" href="#">Referensi</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="tahun-buku">Tahun Buku</a></li>
                    <li><a href="kategori-rekening">Kategori Rekening</a></li>
                    <li><a href="detil-rekening">Rekening</a></li>
                    <li><a href="saldo-rekening">Saldo Rekening</a></li>
                    <li><a href="set-anggaran">Set Anggaran</a></li>
                    <!-- <li><a href="anggaran-tahunan">Anggaran Tahunan</a></li> -->
                    <li><a href="kategori-modul">Ketegori Modul Pembayaran</a></li>
                </ul>
            </div>
             
            <span class="element-divider place-right"></span>
            <div class="element place-right">
                <a class="dropdown-toggle" href="#">
                    <?php echo $_SESSION['namaS'].' ('.$_SESSION['levelS'].')';?>
                    <i class="icon-user"></i>
                </a>
                <ul class="dropdown-menu place-right" data-role="dropdown">
                    <li>
                        <a href="#" >
                            <span class="icon-cog"></span>
                            Setting
                        </a>
                    </li>
                    <li>
                        <a href="javascript:logout();">
                            <span class="icon-locked"></span>
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </nav>

    <div class="tile-area tile-area-dark">
        <?php
            $d='views/';
            if(!isset($_GET['page'])){
                require $d.'v_home.php';
            }else{
                switch ($_GET['page']) {
                    // referensi
                    case 'kategorirekening':
                        require $d.'v_kategorirekening.php';
                    break;
                    case 'detilrekening':
                        require $d.'v_detilrekening.php';
                    break;
                    case 'tahunbuku':
                        require $d.'v_tahunbuku.php';
                    break;
                    case 'saldorekening':
                        require $d.'v_saldorekening.php';
                    break;
                    case 'anggaran':
                        require $d.'v_anggaran.php';
                    break;
                    case 'detilanggaran':
                        require $d.'v_detilanggaran.php';
                    break;
                    case 'anggarantahunan':
                        require $d.'v_anggarantahunan.php';
                    break;

                    // transaksi
                    case 'transaksi':
                        require $d.'v_transaksi.php';
                    break;
                    case 'katmodulpembayaran':
                        require $d.'v_katmodulpembayaran.php';
                    break;
                    case 'modulpembayaran':
                        require $d.'v_modulpembayaran.php';
                    break;
                    case 'pembayaran':
                        require $d.'v_pembayaran.php';
                    break;
                    // case 'pembayaran_pendaftaran':
                    //     require $d.'v_pembayaran_pendaftaran.php';
                    // break;
                    // case 'uang_pangkal':
                    //     require $d.'v_uang_pangkal.php';
                    // break;
                    // case 'uang_sekolah':
                    //     require $d.'v_uang_sekolah.php';
                    // break;
                    case 'inventory':
                        require $d.'v_inventory.php';
                    break;

                    default:
                        require $d.'v_home.php';
                    break;
                }
            }
        ?>
    </div>
    <!-- // <script src="js/hitua.js"></script> -->
    <script src="../js/main.js"></script>

</body>
</html>

<?php } ?>