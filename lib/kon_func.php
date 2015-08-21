<?php
	function filter($str){
		$str = mysql_real_escape_string(htmlentities($str));
		return $str;
	}

	function getFileName(){
		$x=pathinfo(__FILE__, PATHINFO_FILENAME);
		return $x;
	}
	function topMenu($modul){
        // pr($modul);
        $out='';
        // looping grup menu
        foreach ($_SESSION['grupmodulS']as $i => $v) {
            // vd($_SESSION['grupmodulS']);
            foreach ($v['modul'] as $i2 => $v2) {
                if($v2['link']==$modul and $v2['statmod']==1) {
                    // $out.= $v2['modul'];
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
	}
    function  joinWord($w){
        $w1=strtolower(str_replace(' ', '', $w));
        $w2=strtolower(str_replace('-', '', $w1));
        return $w2;
    }
    function isMenuPriv($md,$mn){
        $menu=false;
        $jo='';
        foreach ($_SESSION['grupmodulS']as $i => $v) {
            foreach ($v['modul'] as $i2 => $v2) {
                foreach ($v2['grupmenu'] as $i3 => $v3) {
                    foreach ($v3['menu'] as $i4 => $v4) {
                        $mod  =joinWord($v2['link']);
                        $mod2 =joinWord($md);
                        $men  =joinWord($v4['menu']);
                        $men2 =joinWord($mn);
                        // $jo.=$mod.'='.$men.'<br>'; 
                        if($mod==$mod2  and $men==$men2){
                            $menu=true;
                        // if($v2['modul']==$md and $v4['menu']==$mn and $v4['statmenu']==1){
                        } // end of checking menu
                    }// end of menu looping
                } // end of grupmenu looping
            } // end of  modul looping
        } // grup grupmodul looping 
        // pr($jo);
        return $menu;
    }
    function isAksi($mn,$ak){
	    $aksi=false;
	    foreach ($_SESSION['grupmodulS']as $i => $v) {
	        foreach ($v['modul'] as $i2 => $v2) {
	            foreach ($v2['grupmenu'] as $i3 => $v3) {
	                foreach ($v3['menu'] as $i4 => $v4) {
                        $menu  =strtolower(str_replace(' ', '', $v4['menu']));
                        $menu2 =strtolower(str_replace(' ', '', $mn));
                        if($menu==$menu2 and $v4['statmenu']==1){
	                    // if($v4['menu']==$mn and $v4['statmenu']==1){
	                        foreach ($v4['aksi'] as $i5 => $v5) {
                                $aks  = strtolower(str_replace(' ', '', $v5['aksi']));
                                $aks2 = strtolower(str_replace(' ', '', $ak));
                                if($aks==$aks2) $aksi=true;
	                            // if($v5['aksi']==$ak) $aksi=true;
	                        }// end of aksi looping
	                    } // end of checking menu
	                }// end of menu looping
	            } // end of grupmenu looping
	        } // end of  modul looping
	    } // grup grupmodul looping 
        // vd($aksi);
	    return $aksi;
	}
    // function isDisabled($mn,$ak){
    //     return (isAksi($mn,$ak)==false?'disabled':'');
    // }
    function isMenu($mod,$menu){
        if(isMenuPriv($mod,$menu)==false || $_SESSION['loginS']=='') 
            echo '<script>location.href="./"</script>';
        //     echo 'salah';
        // else
        //     echo 'benar';

    }
    function isModul($mod){
        $out=0; $o='';
        foreach ($_SESSION['grupmodulS'] as $i => $v) {
            foreach ($v['modul'] as $i2 => $v2) {
                $o.=$v2['link'].'<br>';
                if($v2['link']==$mod and $v2['statmod']==1) {
                    $out+=1;
                }
            }
        }if($out==0 OR $_SESSION['loginS']=='') header('location:../');
    }

?>