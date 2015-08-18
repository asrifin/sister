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

<?php 
    $out='';
    // looping grup menu
    foreach ($_SESSION['grupmodulS']as $i => $v) {
        foreach ($v['modul'] as $i2 => $v2) {
            if($v2['link']==$modul and $v2['statmod']==1) {
                foreach ($v2['grupmenu'] as $i3 => $v3) {
                    $out.='<div class="tile-group '.$v3['size'].'">
                            <div class="tile-group-title">'.$v3['grupmenu'].'</div>';
                        // $out.=' <a '.($v4['statmenu']==0?'onclick="notif(\'Anda tidak berhak akses '.$v4['menu'].'\',\'blue\')"':'href="'.$v4['link']).'" class="tile '.$v4['size'].' 
                                    // bg-'.($v4['statmenu']==0?'grey':$v4['warna']).'" data-click="transform">
                    foreach ($v3['menu'] as $i4 => $v4) {
                        $out.=' <a '.($v4['statmenu']==0?'onclick="warning(\''.$v4['menu'].'\');"':'href="'.$v4['link']).'" class="tile '.$v4['size'].' 
                                    bg-'.($v4['statmenu']==0?'black':$v4['warna']).'" data-click="transform">
                                    <div class="tile-content icon">
                                        <span class="icon-'.($v4['statmenu']==0?'locked-2':$v4['icon']).'"></span>
                                    </div>
                                    <div class="brand">
                                        <div class="label">'.$v4['menu'].'</div>
                                    </div>
                                </a>';
                    }// end of menu looping
                    $out.='</div>';
                } // end of grupmenu looping
            } // end of modul checking
        } // end of  modul looping
    } // grup grupmodul looping 
    echo $out;
?>