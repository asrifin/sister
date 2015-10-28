<?php
    session_start();
    require_once '../lib/func.php';
    $modul = basename(dirname(__FILE__));
    isModul($modul);
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="product" content="Metro UI CSS Framework">
    <meta name="description" content="Simple responsive css framework">
    <meta name="author" content="sister">

    <link href="../css/metro-bootstrap.css" rel="stylesheet">
    <link href="../css/metro-bootstrap-responsive.css" rel="stylesheet">
    <link href="../css/iconFont.css" rel="stylesheet">
    <link href="../css/docs.css" rel="stylesheet">
    <link href="../prettify/prettify.css" rel="stylesheet">

    <!-- Load JavaScript Libraries -->
    <script src="../js/jquery/jquery.min.js"></script>
    <script src="../js/jquery/jquery.widget.min.js"></script>
    <script src="../js/jquery/jquery.mousewheel.js"></script>   
<!--    <script src="../js/prettify/prettify.js"></script>-->

    <!-- Metro UI CSS JavaScript plugins -->
    <script src="../js/load-metro.js"></script>
    <script src="js/metro.min.js"></script>
    <script>
          // function showDialog(id){
          //       var dialog = $("#"+id).data('dialog');
          //       if (!dialog.element.data('opened')) {
          //           dialog.open();
          //       } else {
          //           dialog.close();
          //       }
          //   }
    </script>
    <!-- Local JavaScript -->
    <script src="../js/docs.js"></script>
    <script src="../js/start-screen.js"></script>
    <script src="../js/maskedinput/jquery.maskMoney.js" type="text/javascript"></script>

    <title>.:SISTER:.</title>
</head>

<body class="metro">
    <!-- <nav class="navigation-bar light fixed-top"> -->
    <nav class="navigation-bar fixed-top">
        <nav class="navigation-bar-content">
            <a class="element brand" href="../">
                <span class="icon-grid-view"></span>  
                Menu Utama
            </a>
            <span class="element-divider"></span>
            <a class="element brand" href="./">
                <span class="icon-home"></span>  
                <?php echo $modul;?>
            </a>
            <span class="element-divider"></span>
            <?php
                topMenu($modul);
            ?>
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
                    // master
                    case 'kategorirekening':
                        require $d.'v_kategorirekening.php';
                    break;
                    case 'detilrekening':
                        require $d.'v_detilrekening.php';
                    break;
                    case 'saldorekening':
                        require $d.'v_saldorekening.php';
                    break;
                    case 'kategorianggaran':
                        require $d.'v_kategorianggaran.php';
                    break;
                    case 'detilanggaran':
                        require $d.'v_detilanggaran.php';
                    break;
                    case 'jenislaporan':
                        require $d.'v_jenislaporan.php';
                    break;
                    case 'pemutihanpenerimaansiswa':
                        require $d.'v_pemutihanpenerimaansiswa.php';
                    break;
                    // case 'diskon':
                    //     require $d.'v_diskon.php';
                    // break;
                    // case 'detaildiskon':
                    //     require $d.'v_detaildiskon.php';
                    // break;
                    case 'angsuran':
                        require $d.'v_angsuran.php';
                    break;
                    case 'biaya':
                        require $d.'v_biaya.php';
                    break;
                    case 'detailbiaya':
                        require $d.'v_detailbiaya.php';
                    break;
                    case 'viabayar':
                        require $d.'v_viabayar.php';
                    break;

                    // transaksi
                    case 'anggarantahunan':
                        require $d.'v_anggarantahunan.php';
                    break;
                    case 'transaksi':
                        require $d.'v_transaksi.php';
                    break;
                    case 'katmodulpembayaran':
                        require $d.'v_katmodulpembayaran.php';
                    break;
                    case 'modulpembayaran':
                        require $d.'v_modulpembayaran.php';
                    break;
                    case 'penerimaansiswa':
                        require $d.'v_penerimaansiswa.php';
                    break;
                    case 'rekapitulasipenerimaansiswa':
                        require $d.'v_rekapitulasipenerimaansiswa.php';
                    break;
                    case 'sarpras':
                        require $d.'v_sarpras.php';
                    break;
                    case 'rekeningbiaya':
                        require $d.'v_rekeningbiaya.php';
                    break;

                    // case 'aktivitas':
                    //     require $d.'v_keuaktivitas.php';
                    // break;
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
</html>case
