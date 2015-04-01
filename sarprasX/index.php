<?php
    session_start();
    // echo '<pre>';
    //     print_r($_SESSION);exit();
    // echo '</pre>';

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

    <meta name="viewport" content="width=device-width, initial-scale=1">

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
     <script src="../js/metro.min.js"></script>
     <!-- // <script src="../js/metro-scroll.js"></script> -->

    <!-- Local JavaScript -->
    <script src="../js/docs.js"></script>
    <!--<script src="js/github.info.js"></script>-->
    <script src="../js/start-screen.js"></script>



<!--     <link href="css/metro-bootstrap.css" rel="stylesheet">
    <link href="css/metro-bootstrap-responsive.css" rel="stylesheet">
    <link href="css/iconFont.css" rel="stylesheet">
    <link href="css/docs.css" rel="stylesheet">
    <!-- <link href="css/paging.css" rel="stylesheet"> -->
    <!-- <link href="js/prettify/prettify.css" rel="stylesheet"> -->


    <!-- currency  plugin -->
    <!--<script src="../js/maskedinput/jquery.min.js" type="text/javascript"></script>-->
    <script src="../js/maskedinput/jquery.maskMoney.js" type="text/javascript"></script>

    <!-- Metro UI CSS JavaScript plugins -->
    <script src="js/load-metro.js"></script>

    <!-- Local JavaScript -->
    <script src="js/docs.js"></script>
    <!--<script src="js/github.info.js"></script>-->
    <script src="js/start-screen.js"></script>

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
                // height: 355
            });
            // $("#panel2").scrollbar({
                // height: 355
                // height: 768
            // });
        });
    </script>
    <title>.:SISTER Sarpras:.</title>
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
                Sarana dan Prasarana
            </a>
            <span class="element-divider"></span>
            <div class="element">
                <a class="dropdown-toggle" href="#">Menu Utama</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="inventaris">Inventaris</a></li>
                    <li><a href="aktivitas">Aktivitas</a></li>
                    <li><a href="peminjaman">Peminjaman</a></li>
                </ul>
            </div>
            <div class="element">
                <a class="dropdown-toggle" href="#">Referensi</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="lokasi">Lokasi</a></li>
                    <li><a href="tempat">Tempat</a></li>
                    <li><a href="jenis">Jenis Barang</a></li>
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
	
	<!-- id="scrollbox3" data-role="scrollbox1" data-scroll="both" style="width: 500px" -->
    <!-- <div id="scrollbox3" data-role="scrollbox1" data-scroll="both" style="height:900px;width: 500px" class="tile-area tile-area-dark"> -->
    <div  class="tile-area tile-area-dark">
        <?php
            $d='views/';
            if(!isset($_GET['page'])){
                require $d.'v_home.php';
            }else{
                switch ($_GET['page']) {
                    // referensi
                    case 'vtempat':
                        require $d.'v_tempat.php';
                    break;
                    case 'vlokasi':
                        require $d.'v_lokasi.php';
                    break;
                    case 'vjenis':
                        require $d.'v_jenis.php';
                    break;

                    // inventaris
                    case 'vinventaris':
                        require $d.'v_grup.php';
                    break;
                    case 'vaktivitas':
                        require $d.'v_aktivitas.php';
                    break;
                    case 'vpeminjaman':
                        require $d.'v_peminjaman.php';
                    break;
                    default:
                        require $d.'v_home.php';
                    break;
                }
            }
        ?>
    </div>
    <script src="js/hitua.js"></script>
    <script src="js/main.js"></script>

</body>
</html>

<?php } ?>