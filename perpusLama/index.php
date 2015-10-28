<?php
    session_start();

    if(!isset($_SESSION['loginS'])){
        header('location:../');
    }else{
        // echo 'ada';
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="product" content="Metro UI CSS Framework">
    <meta name="description" content="Simple responsive css framework">
    <meta name="author" content="Sergey S. Pimenov, Ukraine, Kiev">

    <link href="../css/metro-bootstrap.css" rel="stylesheet">
    <!-- <link href="../css/metro-bootstrap-responsive.css" rel="stylesheet"> -->
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
     <script src="../js/metro.min.js"></script>
     <!-- // <script src="../js/metro-scroll.js"></script> -->

    <!-- Local JavaScript -->
    <script src="../js/docs.js"></script>
    <!--<script src="js/github.info.js"></script>-->
    <script src="../js/start-screen.js"></script>
    <script src="../js/maskedinput/jquery.maskMoney.js" type="text/javascript"></script>

  <!-- combo grid -->
    <script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
    <script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
    <!--end of combo grid -->
        <!-- js for datatables -->
    <!--<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" language="javascript" src="js/shCore.js"></script>
    <link rel="stylesheet" type="text/css" href="css/shCore.css">-->
    <script>
        $(function(){
            $(".form").scrollbar({
                // height: 355,
                axis: 'y'
            });
            $("#scrollbox2").scrollbar({
                axis: 'x',
            });
        });
    </script>

    <title>.:SISTER Perpustakaan:.</title>
</head>

<body class="metro">
<!-- <div class="container"> -->
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
                Perpustakaan
            </a>
            <span class="element-divider"></span>
            <div class="element">
                <a class="dropdown-toggle" href="#">Menu Utama</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="katalog">Katalog</a></li>
                    <li><a href="koleksi">Daftar Koleksi</a></li>
                    <li><a href="data-anggota">Data Anggota</a></li>
                    <li><a href="sirkulasi">Sirkulasi</a></li>
                    <li><a href="stok-opname">Stok Opname</a></li>
                    <li><a href="opac">OPAC</a></li>
                </ul>
            </div>
            <div class="element">
                <a class="dropdown-toggle" href="#">Master</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="perangkat">Perangkat</a></li>
                    <li><a href="lokasi">Lokasi Perpustakaan</a></li>
                    <li><a href="tingkatbuku">Tingkat Koleksi</a></li>
                    <li><a href="jenisbuku">Jenis Koleksi</a></li>
                    <li><a href="klasifikasi">Klasifikasi</a></li>
                    <li><a href="pengarang">Daftar Pengarang</a></li>
                    <li><a href="penerbit">Daftar Penerbit</a></li>
                    <li><a href="bahasa">Daftar Bahasa</a></li>
                    <li><a href="satuan">Satuan Mata Uang</a></li>
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
                    case 'vklasifikasi':
                        require $d.'v_klasifikasi.php';
                    break;
                    case 'vlokasi':
                        require $d.'v_lokasi.php';
                    break;
                    case 'vbahasa':
                        require $d.'v_bahasa.php';
                    break;
                    case 'vpenerbit':
                        require $d.'v_penerbit.php';
                    break;
                    case 'vpengarang':
                        require $d.'v_pengarang.php';
                    break;
                    case 'vperangkat':
                        require $d.'v_perangkat.php';
                    break;
                    case 'vsatuan':
                        require $d.'v_satuan.php';
                    break;
                    case 'vtingkatbuku':
                        require $d.'v_tingkatbuku.php';
                    break;
                    case 'vjenisbuku':
                        require $d.'v_jenisbuku.php';
                    break;

                    // Menu Utama
                    case 'vkoleksi':
                        require $d.'v_koleksi.php';
                    break;
                    case 'vkatalog':
                        require $d.'v_katalog.php';
                    break;
                    case 'vanggota':
                        require $d.'v_anggota.php';
                    break;
                    case 'vkembali':
                        require $d.'v_kembali.php';
                    break;
                    case 'vsirkulasi':
                        require $d.'v_sirkulasi.php';
                    break;
                    case 'vstok-opname':
                        require $d.'v_stokopname.php';
                    break;
                    case 'vopac':
                        require $d.'v_opac.php';
                    break;
                    default:
                        require $d.'v_home.php';
                    break;
                }
            }
        ?>
    </div>
<!-- </div> -->
    <!-- // <script src="js/hitua.js"></script> -->
    <script src="js/main.js"></script>

</body>
</html>

<?php } ?>