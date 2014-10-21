<?php
    session_start();
    if(!isset($_SESSION['loginS']) and  !empty($_SESSION['loginS'])){
        header('location:');
    }else{
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- <meta name="product" content="Metro UI CSS Framework"> -->
        <meta name="product" content="SISTER">
        <meta name="description" content="Simple responsive css framework">
        <meta name="author" content="sister@corp">

        <link href="css/metro-bootstrap.css" rel="stylesheet">
        <link href="css/metro-bootstrap-responsive.css" rel="stylesheet">
        <link href="css/iconFont.css" rel="stylesheet">
        <link href="css/docs.css" rel="stylesheet">
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

        <!-- <title>Metro UI CSS : Metro Bootstrap CSS Library</title> -->
        <title>SiSTeR</title>
    </head>
    
    <body class="metro">
        <div class="tile-area tile-area-dark" id="tile-module">
            <!-- <h1 class="tile-area-title fg-white">Start</h1> -->
            <!-- <h1 class="tile-area-title fg-white">S!5T3R n635oT - 4L@Y</h1> -->
            <h1 class="tile-area-title fg-white">SISTER</h1>
            <div class="user-id">
                <div class="user-id-image">
                    <span class="icon-user no-display1"></span>
                    <img src="images/Battlefield_4_Icon.png" class="no-display">
                </div>

                <div class="user-id-name">
                    <span class="first-name"><?php echo $_SESSION['namaS'];?></span>
                    <span class="last-name"><?php echo $_SESSION['levelS'];?></span>
                </div>
                <button class="button inverse" onclick="logout();">logout</button>
            </div>

            <!-- group 1-->
            <div class="tile-group four">
                <div class="tile-group-title">Refrensi</div>
                <!-- department -->
                <a href="#" class="tile bg-lightBlue" data-click="transform">
                    <div class="tile-content icon">
                        <img src=""> 
                        <span class="icon-address-book"></span>
                    </div>
                    <div class="brand">
                        <div class="label">Departemen</div>
                    </div>
                </a>
                <!-- end of department -->

                <!-- Angkatan -->
                <a href="#" class="tile bg-crimson" data-click="transform">
                    <div class="tile-content icon">
                        <img src=""> 
                        <span class="icon-address-book"></span>
                    </div>
                    <div class="brand">
                        <div class="label">Angkatan</div>
                    </div>
                </a>
                <!-- end of Angkatan -->

            </div> <!-- End group 1 -->


            <!-- group 2-->
            <div class="tile-group five">
                <div class="tile-group-title">Transaksi</div>
                <!-- department -->
                <a href="#" class="tile double bg-lightGreen" data-click="transform">
                    <div class="tile-content icon">
                        <img src=""> 
                        <span class="icon-address-book"></span>
                    </div>
                    <div class="brand">
                        <div class="label">Departemen</div>
                    </div>
                </a>
                <!-- end of department -->

                <!-- Angkatan -->
                <a href="#" class="tile bg-orange" data-click="transform">
                    <div class="tile-content icon">
                        <img src=""> 
                        <span class="icon-address-book"></span>
                    </div>
                    <div class="brand">
                        <div class="label">Angkatan</div>
                    </div>
                </a>
                <!-- end of Angkatan -->
                <!-- Angkatan -->
                <a href="#" class="tile bg-orange" data-click="transform">
                    <div class="tile-content icon">
                        <img src=""> 
                        <span class="icon-address-book"></span>
                    </div>
                    <div class="brand">
                        <div class="label">Angkatan</div>
                    </div>
                </a>
                <!-- end of Angkatan -->
                <!-- Angkatan -->
                <a href="#" class="tile bg-orange" data-click="transform">
                    <div class="tile-content icon">
                        <img src=""> 
                        <span class="icon-address-book"></span>
                    </div>
                    <div class="brand">
                        <div class="label">Angkatan</div>
                    </div>
                </a>
                <!-- end of Angkatan -->
            </div> <!-- End group 2 -->

            <!-- group 2-->
            <div class="tile-group five">
                <div class="tile-group-title">Transaksi</div>
                <!-- department -->
                <a href="#" class="tile double bg-lightGreen" data-click="transform">
                    <div class="tile-content icon">
                        <img src=""> 
                        <span class="icon-address-book"></span>
                    </div>
                    <div class="brand">
                        <div class="label">Departemen</div>
                    </div>
                </a>
                <!-- end of department -->

                <!-- Angkatan -->
                <a href="#" class="tile bg-orange" data-click="transform">
                    <div class="tile-content icon">
                        <img src=""> 
                        <span class="icon-address-book"></span>
                    </div>
                    <div class="brand">
                        <div class="label">Angkatan</div>
                    </div>
                </a>
                <!-- end of Angkatan -->
                <!-- Angkatan -->
                <a href="#" class="tile bg-orange" data-click="transform">
                    <div class="tile-content icon">
                        <img src=""> 
                        <span class="icon-address-book"></span>
                    </div>
                    <div class="brand">
                        <div class="label">Angkatan</div>
                    </div>
                </a>
                <!-- end of Angkatan -->
                <!-- Angkatan -->
                <a href="#" class="tile bg-orange" data-click="transform">
                    <div class="tile-content icon">
                        <img src=""> 
                        <span class="icon-address-book"></span>
                    </div>
                    <div class="brand">
                        <div class="label">Angkatan</div>
                    </div>
                </a>
                <!-- end of Angkatan -->
            </div> <!-- End group 2 -->


        </div>
        <script src="js/main.js"></script>
        <script src="js/hitua.js"></script>
    </body>
</html>
<?php } ?>