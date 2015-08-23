<?php
    session_start();
    require_once '../lib/func.php';
    require_once '../lib/tglindo.php';
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
            
            <!-- nama modul-->
            <span class="element-divider"></span>
            <a class="element brand" href="./">
                <span class="icon-home"></span>  
                <?php echo $modul;?>
            </a>

            <!-- list menu -->
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
            <div class="element place-right">
                <?php echo 'Last Login : '.tgl_indo2($_SESSION['lastloginS']).' ( '.$_SESSION['counterlogS'].'x )';?>
                <i class="icon-clock"></i>
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
                    // sistem
                    case 'warna':
                        require $d.'v_warna.php';
                    break;
                    case 'icon':
                        require $d.'v_icon.php';
                    break;
                    case 'grupmodul':
                        require $d.'v_grupmodul.php';
                    break;
                    case 'modul':
                        require $d.'v_modul.php';
                    break;
                    case 'grupmenu':
                        require $d.'v_grupmenu.php';
                    break;
                    case 'menu':
                        require $d.'v_menu.php';
                    break;

                    // user
                    case 'level':
                        require $d.'v_level.php';
                    break;
                    case 'user':
                        require $d.'v_user.php';
                    break;
                    case 'grupmodul':
                        require $d.'v_grupmodul.php';
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
