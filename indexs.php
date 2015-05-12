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

        <script src="js/main.js"></script>
        <script src="js/hitua.js"></script>
        
        <script>
            function warning(menu){
                $.Dialog({
                    shadow: true,
                    overlay: true,
                    draggable: true,
                    flat:true,
                    height:120,
                    // width: 200,
                    padding: 10,
                    onShow: function(){
                        $.Dialog.title('<span class="icon-warning"></span> Info');
                        $.Dialog.content('<center>Maaf anda tidak berhak mengakses <b style="color:red;">'+menu+'</b></center>');
                    }
                });
            }
        </script>

        <!-- <title>Metro UI CSS : Metro Bootstrap CSS Library</title> -->
        <title>SISTER</title>
    </head>
    
    <body class="metro">
        <!--menu utama / module-->
        <div class="tile-area tile-area-dark" id="tile-module">
        <div class="container">
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
            
            <?php 
                $out='';
                // looping grup modul
                foreach ($_SESSION['grupmodulS'] as $i => $v) {
                    $out.='<div class="tile-group '.$v['size'].'">';
                    // looping modul
                    foreach ($v['modul'] as $ii => $vv) {
                        $out.='<a id="mod-'.$vv['link'].'" href="'.$vv['link'].'" class="tile '.$vv['size'].' bg-'.$vv['warna'].' live" data-role="live-tile" '.($vv['statmod']!=0?'data-effect="slideUp"':'').' data-click="transform">
                                <div style="align:center;" class="tile-content icon">
                                    <center>
                                        <span class="icon-'.$vv['icon'].'"></span>
                                    </center>
                                </div>
                                <div class="tile-content email">
                                    <div class="email-data-text">Keterangan :</div>
                                    <div class="email-data-text">'.$vv['keterangan'].'</div>
                                </div>
                                <div class="brand">
                                    <div class="label">
                                        <h4 class="no-margin fg-white">
                                            '.$vv['modul'].'
                                        </h4>
                                    </div>
                                    <!--<div class="badge">3</div>-->
                                </div>
                            </a>';
                    } //end of looping modul

/*                    foreach ($v['modul'] as $ii => $vv) {
                        $out.='<a id="mod-'.$vv['link'].'" 
                                '.($vv['statmod']==0?' onclick="warning(\''.$vv['modul'].'\');"':' 
                                href="'.$vv['link'].'"').' class="tile '.$vv['size'].' 
                                bg-'.($vv['statmod']!=0?$vv['warna']:'grey').' live" data-role="live-tile" 
                                '.($vv['statmod']!=0?'data-effect="slideUp"':'').' 
                                data-click="transform">
                                <div style="align:center;" class="tile-content icon">
                                    <center>
                                        <span class="icon-'.($vv['statmod']==0?'locked-2':$vv['icon']).'"></span>
                                    </center>
                                </div>
                                <div class="tile-content email">
                                    <div class="email-data-text">Keterangan :</div>
                                    <div class="email-data-text">'.$vv['keterangan'].'</div>
                                </div>
                                <div class="brand">
                                    <div class="label">
                                        <h4 class="no-margin fg-white">
                                            '.$vv['modul'].'
                                        </h4>
                                    </div>
                                    <!--<div class="badge">3</div>-->
                                </div>
                            </a>';
                    } //end of looping modul
*/
                    $out.='</div>';
                } ///end of looping grup modul
                echo $out;
            ?>
        </div>
        <!--<script src="js/main.js"></script>
        <script src="js/hitua.js"></script>-->
    </body>
</html>
