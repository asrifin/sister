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
                <?php echo $modul;?>
            </a>
            <span class="element-divider"></span>
            <?php
                $out='';
                // looping grup menu
                foreach ($_SESSION['grupmodulS']as $i => $v) {
                    foreach ($v['modul'] as $i2 => $v2) {
                        if($v2['modul']==$modul and $v2['statmod']==1) {
                            foreach ($v2['grupmenu'] as $i3 => $v3) {
                                $out.='<div class="element">                
                                        <a class="dropdown-toggle" href="#">'.$v3['grupmenu'].'</a>
                                        <ul class="dropdown-menu" data-role="dropdown">';
                                foreach ($v3['menu'] as $i4 => $v4) {
                                    $out.='<li '.($v4['statmenu']==0?'class="disabled"':'').'> 
                                                <a href="'.($v4['statmenu']!=0?$v4['link']:'#').'">'.$v4['menu'].'</a>
                                            </li>';
                                }// end of menu looping
                                $out.='</ul>
                                    </div>';
                            } // end of grupmenu looping
                        } // end of modul checking
                    } // end of  modul looping
                } // grup grupmodul looping 
                echo $out;
                // exit();
            ?>
            <!-- <div class="element">
                <a class="dropdown-toggle" href="#">Transaksi Keuangan</a>
                <ul class="dropdown-menu" data-role="dropdown">
                    <li><a href="transaksi">Transaksi</a></li>
                    <li><a href="modul-pembayaran">Modul Pembayaran</a></li>
                    <li><a href="pembayaran">Pembayaran</a></li>
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
                    <li><a href="anggaran-tahunan">Anggaran Tahunan</a></li>
                    <li><a href="kategori-modul">Ketegori Modul Pembayaran</a></li>
                </ul>
            </div> -->
             
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
                    // sistem
                    case 'warna':
                        require $d.'v_warna.php';
                    break;
                    case 'icon':
                        require $d.'v_icon.php';
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