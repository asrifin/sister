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

    <link href="css/metro-bootstrap.css" rel="stylesheet">
    <!-- <link href="css/metro-bootstrap-responsive.css" rel="stylesheet"> -->
    <link href="css/iconFont.css" rel="stylesheet">
    <link href="css/docs.css" rel="stylesheet">
    <!-- <link href="css/paging.css" rel="stylesheet"> -->
    <link href="js/prettify/prettify.css" rel="stylesheet">

    <!-- Load JavaScript Libraries -->
    <script src="js/jquery/jquery.min.js"></script>
    <script src="js/jquery/jquery.widget.min.js"></script>
    <script src="js/jquery/jquery.mousewheel.js"></script>
    <script src="js/prettify/prettify.js"></script>

    <!-- Metro UI CSS JavaScript plugins -->
    <script src="js/load-metro.js"></script>

    <!-- Local JavaScript -->
    <script src="js/docs.js"></script>
    <script src="js/github.info.js"></script>
    <script src="js/start-screen.js"></script>

    <!-- js for datatables -->
    <!--<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" language="javascript" src="js/shCore.js"></script>
    <link rel="stylesheet" type="text/css" href="css/shCore.css">-->

    <title>.: SISTER Guru :.</title>
</head>

<body class="metro">
    <div class="container">
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
                Akademik
            </a>
            <span class="element-divider"></span>
            <div class="element">
                <a class="dropdown-toggle" href="#">Kesiswaan</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="rpp">Rencana Pembelajaran</a></li>
                    <li><a href="penilaian">Penilaian</a></li>
                    <li><a href="daftarnilai">Daftar Nilai</a></li>
                    <li><a href="nilairapor">Nilai Rapor</a></li>
                    <li><a href="jurnalkelas">Jurnal Kelas</a></li>
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
                    case 'vrpp':
                        require $d.'v_rpp2.php';
                    break;
                    case 'vangkatan':
                        require $d.'v_angkatan.php';
                    break;
                    case 'vtahunajaran':
                        require $d.'v_tahunajaran.php';
                    break;
                    case 'vtingkat':
                        require $d.'v_tingkat.php';
                    break;
                    case 'vsemester':
                        require $d.'v_semester.php';
                    break;
                    case 'vkelas':
                        require $d.'v_kelas.php';
                    break;
                    case 'vjenismutasi':
                        require $d.'v_jenismutasi.php';
                    break;
                    case 'vtahunlulus':
                        require $d.'v_tahunlulus.php';
                    break;

                    
                    default:
                        require $d.'v_home.php';
                    break;
                }
            }
        ?>
    </div>
</div>
    <script src="js/hitua.js"></script>
    <script src="js/main.js"></script>

</body>
</html>

<?php } ?>