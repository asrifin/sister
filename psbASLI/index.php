<?php
    session_start();
    // var_dump($_SESSION);
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
    <script src="js/github.info.js"></script>
    <script src="../js/start-screen.js"></script>
    <script src="../js/maskedinput/jquery.maskMoney.js" type="text/javascript"></script>
    <!-- // <script type="../js/metro/metro-scroll.js"></script> -->
  <!-- combo grid -->
    <script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
    <script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
    <!--end of combo grid -->


    <script>
        $(function(){
            $(".form").scrollbar({
                // height: 355,
                axis: 'y'
            });
            $("#scrollbox2").scrollbar({
                axis: 'x',
                // height: 355
            });
            // $("#panel2").scrollbar({
                // height: 355
                // height: 768
            // });
        });
    </script>


    <title>.:SISTER PSB:.</title>
</head>

<body class="metro">
<!-- <div class="container"> -->
    <nav class="navigation-bar fixed-top">
        <nav class="navigation-bar-content">
            <a class="element brand" href="../">
                <span class="icon-home"></span>  
                Start Menu
            </a>
            <a class="element brand" href="./">
                Pendaftaran Siswa Baru
            </a>
            <span class="element-divider"></span>
            <div class="element">
                <a class="dropdown-toggle" href="#">Menu Utama</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="proses">Periode Penerimaan</a></li>
                    <li><a href="kelompok">Kelompok Pendaftaran</a></li>
                    <li><a href="pendataan">Pendataan Calon Siswa</a></li>
                    <li><a href="penerimaan">Penerimaan Siswa Baru</a></li>
                    <!-- <li><a href="#">Cari Calon Siswa Baru</a></li> -->
                    <!-- <li><a href="#">Statistik Penerimaan</a></li> -->
                    <!-- <li class="divider"></li> -->
                </ul>
            </div>
            <span class="element-divider"></span>
            <div class="element">
                <a class="dropdown-toggle" href="#">Referensi</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="kriteria-calon-siswa">Kriteria Calon Siswa</a></li>
                    <li><a href="golongan-calon-siswa">Golongan Calon Siswa</a></li>
                    <li><a href="set-biaya-calon-siswa">Set Biaya Calon Siswa</a></li>
                    <li><a href="set-angsuran">Set Angsuran </a></li>
                    <li><a href="set-diskon">Set Diskon </a></li>

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
                    case 'vkriteriaCalonSiswa':
                        require $d.'v_kriteriaCalonSiswa.php';
                    break;
                    case 'vgolonganCalonSiswa':
                        require $d.'v_golonganCalonSiswa.php';
                    break;
                    case 'vsetAngsuran':
                        require $d.'v_setAngsuran.php';
                    break;
                     case 'vsetBiayaCalonSiswa':
                        require $d.'v_setBiayaCalonSiswa.php';
                    break;
                    case 'vsetDiskon':
                        require $d.'v_setDiskon.php';
                    break;
                    case 'vproses':
                        require $d.'v_proses.php';
                    break;
                    case 'vkelompok':
                        require $d.'v_kelompok.php';
                    break;
                    case 'vpendataan':
                        require $d.'v_pendataan.php';
                    break;
                    case 'vpenerimaan':
                        require $d.'v_penerimaan.php';
                    break;
                    default:
                        require $d.'v_home.php';
                    break;
                }
            }
        ?>
    </div>
<!-- </div> -->
    <!--
    <script src="js/hitua.js"></script>
    -->
     <script src="../js/main.js"></script>

</body>
</html>

<?php } ?>