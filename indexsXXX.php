
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- <meta name="product" content="Metro UI CSS Framework"> -->
        <meta name="product" content="SISTER">
        <meta name="description" content="Simple responsive css framework">
        <meta name="author" content="Sergey S. Pimenov, Ukraine, Kiev">

        <link href="css/metro-bootstrap.css" rel="stylesheet">
        <!-- <link href="css/metro-bootstrap-responsive.css" rel="stylesheet"> -->
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
        <title>SISTER</title>
    </head>
    
    <body class="metro">
        <!--menu utama / module-->
        <div class="tile-area tile-area-dark" id="tile-module">
        <div class="container">
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
                <!-- <div class="tile-group-title">Menu Utama</div> -->
                <!-- AKA -->
                <!-- <a id="mod-aka" href="akademik" class="tile double selected live" data-role="live-tile" data-effect="slideUp" data-click="transform"> -->
                <a id="mod-aka" href="akademik" class="tile double bg-blue live" data-role="live-tile" data-effect="slideUp" data-click="transform">
                    <div style="align:center;" class="tile-content email">
                        <center>
                            <img src="images/akademik.png">
                        </center>
                    </div>
                    <div class="tile-content email">
                        <div class="email-data-text">Keterangan :</div>
                        <div class="email-data-text">Segala kegiatan yang berkaitan dengan akademik ada disini ... </div>
                    </div>
                    <div class="brand">
                        <div class="label">
                            <h4 class="no-margin fg-white">
                                Akademik<!-- <span class="icon-mail"></span> -->
                            </h4>
                        </div>
                        <div class="badge">3</div>
                    </div>
                </a> 
                <!-- END OF AKA -->     

                <!-- PSB -->
                <a href="psb" class="tile double bg-yellow live" data-role="live-tile" data-effect="slideRight" data-click="transform">
                    <div style="align:center;" class="tile-content email">
                        <center>
                            <img src="images/psb.png">
                        </center>
                    </div>
                    <div class="tile-content email">
                        <div class="email-data-text">Keterangan :</div>
                        <div class="email-data-text">Segala kegiatan yang berkaitan dengan penerimaan siswa baru ada disini.... </div>
                    </div>
                    <div class="brand">
                        <div class="label">
                            <h4 class="no-margin fg-white">
                                Penerimaan Siswa Baru<!-- <span class="icon-mail"></span> -->
                            </h4>
                        </div>
                        <div class="badge">3</div>
                    </div>
                </a> 
                <!-- END OF PSB -->

                <!-- HRD -->
                <a href="hrd" class="tile double double-vertical bg-steel" data-click="transform">
                    <div class="tile-content bg-orange">
                        <div class="padding10">
                            <center>
                                <img src="images/employee.png">
                            </center>
                            <h2 class="fg-white no-margin">Kepegawaian</h2><br>
                            <p class="tertiary-text fg-white">Segala tentang kepegawaian ada disini.....</p>
                        </div>
                    </div>
                </a>
                <!--END OF  HRD -->

                <!-- KEU -->
                <a href="keuangan" class="tile double double-vertical bg-steel" data-click="transform">
                    <div class="tile-content bg-grey">
                        <div class="padding10">
                            <center>
                                <img src="images/keuangan.png">
                            </center>
                            <h2 class="fg-white no-margin">Keuangan</h2>
                            <br>
                            <p class="tertiary-text fg-white">Segala tentang keuangan ada disini.....</p>
                        </div>
                    </div>
                </a>
                <!-- END OF KEU -->
            </div> <!-- End group 1 -->

            <!-- group 2 -->
            <div class="tile-group four">
                <!-- PERPUS -->
                <a href="perpus" class="tile double double-vertical bg-steel" data-click="transform">
                    <div class="tile-content bg-brown">
                        <div class="padding10">
                            <center>
                                <img src="images/perpus.png">
                            </center>
                            <h2 class="fg-white no-margin">Perpustakaan</h2><br>
                            <p class="tertiary-text fg-white">Segala tentang Koleksi buku ada disini.....</p>
                        </div>
                    </div>
                </a>
                <!-- END OF PERPUS -->

                <!-- SARPRAS -->
                <a href="sarpras" class="tile double double-vertical bg-steel" data-click="transform">
                    <div class="tile-content bg-violet">
                        <div class="padding10">
                            <center>
                                <img src="images/sarpras.png">
                            </center>
                            <h2 class="fg-white no-margin">Sarana Prasarana</h2><br>
                            <p class="tertiary-text fg-white">Segala tentang Sarana Prasarana ada disini.....</p>
                        </div>
                    </div>
                </a>
                <!-- END OF SARPRAS -->
                
                <!-- REPO -->
                <a class="tile double bg-red live" data-role="live-tile" data-effect="slideLeft" data-click="transform">
                    <div style="align:center;" class="tile-content email">
                        <center>
                            <img src="images/repo.png">
                        </center>
                    </div>
                    <div class="tile-content email">
                        <div class="email-data-text">Keterangan :</div>
                        <div class="email-data-text">Segala kegiatan yang berkaitan dengan akademik ada disini ... </div>
                    </div>
                    <div class="brand">
                        <div class="label">
                            <h4 class="no-margin fg-white">
                                Repository<!-- <span class="icon-mail"></span> -->
                            </h4>
                        </div>
                        <div class="badge">3</div>
                    </div>
                </a> 
                <!-- END OF REPO -->

                <!-- MAN -->
                <a class="tile double bg-green live" data-role="live-tile" data-effect="slideDown" data-click="transform">
                    <div style="align:center;" class="tile-content email">
                        <center>
                            <img src="images/report.png">
                        </center>
                    </div>
                    <div class="tile-content email">
                        <div class="email-data-text">Keterangan :</div>
                        <div class="email-data-text">Segala kegiatan yang berkaitan dengan akademik ada disini ... </div>
                    </div>
                    <div class="brand">
                        <div class="label">
                            <h4 class="no-margin fg-white">
                                Manajemen<!-- <span class="icon-mail"></span> -->
                            </h4>
                        </div>
                        <div class="badge">3</div>
                    </div>
                </a> 
                <!-- END OF MAN -->
            </div> 

            <!-- group 3-->
            <div class="tile-group one">
                <!-- <div class="tile-group-title">Menu Utama</div> -->
                <!-- AKA -->
                <!-- <a id="mod-aka" href="akademik" class="tile double selected live" data-role="live-tile" data-effect="slideUp" data-click="transform"> -->
                <a id="mod-guru" href="guru" class="tile double bg-blue live" data-role="live-tile" data-effect="slideUp" data-click="transform">
                    <div style="align:center;" class="tile-content email">
                        <center>
                            <img src="images/akademik.png">
                        </center>
                    </div>
                    <div class="tile-content email">
                        <div class="email-data-text">Keterangan :</div>
                        <div class="email-data-text">Segala kegiatan yang berkaitan dengan tugas guru ada disini ... </div>
                    </div>
                    <div class="brand">
                        <div class="label">
                            <h4 class="no-margin fg-white">
                                Guru<!-- <span class="icon-mail"></span> -->
                            </h4>
                        </div>
                        <div class="badge">3</div>
                    </div>
                </a> 
                <!-- END OF AKA -->
            </div>

        </div>
    </div>
        <script src="js/main.js"></script>
        <script src="js/hitua.js"></script>
    </body>
</html>
