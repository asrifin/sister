<?php
	require_once 'dbcon.php';
	require_once 'func.php';
	$user = $_POST['userTB'];
	$pass = base64_encode($_POST['pass2TB']);
	
	// authentication login 
	$s1   = 'SELECT 
				lg.*, lh.date lastlogin,
                lv.keterangan AS level,
				lv.urutan,
				lh.counterlog
			FROM 
				kon_login lg
				JOIN kon_level lv ON lg.id_level = lv.id_level 
				LEFT JOIN (
					SELECT id_login,max(date)date,count(*)counterLog 
					FROM kon_loginhistory 
				)lh on lh.id_login = lg.id_login
			where
				lg.username = "'.$user.'" 
				and lg.password ="'.$pass.'" 
			GROUP BY 
				lg.id_login';
	// pr($s1);
    $e1 = mysql_query($s1) or die(mysql_error());
    $n  = mysql_num_rows($e1);
    $r1 = mysql_fetch_assoc($e1);
    
    $msg='';
    if($n!=0){ // user ditemukan
        if($r1['aktif']!=1){ // blocked
            $stat = false;
            $msg  = 'akun anda sedang diblokir, silahkan hubungi administrator';
        }else{ // active
    		// ------------------
    		// insert log history
    		$sh = 'INSERT INTO kon_loginhistory SET id_login ='.$r1['id_login'].',date=NOW()';
    		$eh = mysql_query($sh);
    		
    		// loop grup modul
    		$s2 = 'SELECT * from kon_grupmodul';
    		$e2 = mysql_query($s2);
    		
    		$grupmodulArr = array();
    		while ($r2 = mysql_fetch_assoc($e2)) {
    			// loop modul
    			$s3 = 'SELECT
    						md.id_modul,
    						md.link,
    						md.modul,
    						md.size,
    						i.icon,
    						w.warna,
    						md.keterangan,
    						CASE
    							WHEN tbmd.id_modul >0 THEN
    								1
    							ELSE
    								0
    						END AS statmod
    					FROM
    						kon_modul md
    						left join kon_warna w on w.id_warna = md.id_warna
    						left join kon_icon i on i.id_icon = md.id_icon
    						LEFT JOIN (
    							SELECT
    								md.id_modul
    							FROM
    								kon_modul md
    								LEFT JOIN kon_grupmenu gm ON gm.id_modul = md.id_modul
    								LEFT JOIN kon_menu mn ON mn.id_grupmenu = gm.id_grupmenu
    								LEFT JOIN kon_privillege p ON p.id_menu = mn.id_menu
    							WHERE	
    								p.id_login = '.$r1['id_login'].'
    							GROUP BY
    								md.id_modul
    						) tbmd ON tbmd.id_modul = md.id_modul
    					WHERE
    						md.id_grupmodul = '.$r2['id_grupmodul'];
    			// print_r($s3);exit();	
    			$e3       = mysql_query($s3) or die(mysql_error());	
    			$modulArr = array(); 
    			while ($r3 = mysql_fetch_assoc($e3)) {
    				// loop grup menu
    				$s4 = 'SELECT
    							gm.id_grupmenu,
    							gm.size,
    							gm.grupmenu,
    							gm.id_katgrupmenu,
    							kgm.katgrupmenu
    						FROM
    							kon_modul md
    							LEFT JOIN kon_grupmenu gm ON gm.id_modul = md.id_modul
    							LEFT JOIN kon_katgrupmenu kgm  ON kgm.id_katgrupmenu = gm.id_katgrupmenu
    							LEFT JOIN kon_menu mn ON mn.id_grupmenu = gm.id_grupmenu
    							LEFT JOIN kon_privillege p ON p.id_menu = mn.id_menu
    						WHERE	
    							p.id_login = '.$r1['id_login'].' and
    							gm.id_modul = '.$r3['id_modul'].'
    						GROUP BY
    							gm.grupmenu ASC';
    				// print_r($s4);exit();	
    				$e4          = mysql_query($s4);
    				$grupmenuArr = array();
    				while ($r4=mysql_fetch_assoc($e4)) {
    					// loop menu
    					$s5 	 = 'SELECT
    									mn.id_menu,
    									mn.menu,
    									mn.link,
    									mn.size,
    									w.warna,
    									i.icon,
    									IF(tbmnu.id_menu is NOT NULL,1,0)statmenu,
                                        tbmnu.isDefault,
                                        gm.id_katgrupmenu
    								FROM
    									kon_menu mn 
    									LEFT JOIN kon_icon i ON i.id_icon = mn.id_icon
    									LEFT JOIN kon_warna w ON w.id_warna = mn.id_warna
    									LEFT JOIN kon_grupmenu gm ON gm.id_grupmenu= mn.id_grupmenu
    									LEFT JOIN (
    										SELECT
    											id_menu,isDefault
    										FROM
    											kon_privillege
    										WHERE
    											id_login = '.$r1['id_login'].'
    									)tbmnu on tbmnu.id_menu = mn.id_menu
    								WHERE
    									mn.id_grupmenu = '.$r4['id_grupmenu'].'
                                    ORDER BY    
                                        mn.menu ASC';
    					
    					// pr($s5);
    					$e5      = mysql_query($s5);
    					$menuArr = array();
    					while ($r5=mysql_fetch_assoc($e5)) {
                            // loop action (c,r,u,d,s,p)
    						$s6='SELECT a.aksi
                                FROM
                                    kon_levelaksi la
                                    JOIN kon_aksi a on a.id_aksi = la.id_aksi
                                    JOIN kon_levelkatgrupmenu lkg ON lkg.id_levelkatgrupmenu = la.id_levelkatgrupmenu
                                WHERE
                                    lkg.id_level = '.$r1['id_level'].'
                                    AND lkg.isDefault = '.$r5['isDefault'].' 
                                    AND lkg.id_katgrupmenu = '.$r5['id_katgrupmenu'].'
                                ORDER BY
                                    la.id_aksi ASC';
                            // pr($s6);
    						$e6 = mysql_query($s6);
    						$aksiArr=array();
    						while ($r6=mysql_fetch_assoc($e6)) {
    							$aksiArr[]=$r6;
    						}
    						$menuArr[]=array(
    							'id_menu'  =>$r5['id_menu'],
    							'menu'     =>$r5['menu'],
    							'link'     =>$r5['link'],
    							'size'     =>$r5['size'],
    							'warna'    =>$r5['warna'],
    							'icon'     =>$r5['icon'],
    							'statmenu' =>$r5['statmenu'],
    							'aksi'     =>$aksiArr
    						);
    					}
    					$grupmenuArr[] = array(
    						'id_katgrupmenu' =>$r4['id_katgrupmenu'],
    						'katgrupmenu'    =>$r4['katgrupmenu'],
    						'grupmenu'       =>$r4['grupmenu'],
    						'size'           =>$r4['size'],
    						'menu'           =>$menuArr
    					);
    				}
    				$modulArr[] = array(
    					'id_modul'   =>$r3['id_modul'],
    					'keterangan' =>$r3['keterangan'],
    					'link'       =>$r3['link'],
    					'modul'      =>$r3['modul'],
    					'icon'       =>$r3['icon'],
    					'warna'      =>$r3['warna'],
    					'size'       =>$r3['size'],
    					'statmod'    =>$r3['statmod'],
    					'grupmenu'   =>$grupmenuArr
    				);
    			}
    			$grupmodulArr[] = array(
    				'grupmodul' =>$r2['grupmodul'],
    				'size'      =>$r2['size'],
    				'modul'     =>$modulArr
    			);
    		}

    		// departemen
    		$s6 = 'SELECT ld.id_departemen, d.nama departemen 
    				FROM kon_logindepartemen ld 
    					LEFT JOIN departemen d on d.replid = ld.id_departemen
    				WHERE ld.id_login ='.$r1['id_login'];
    		$e6 = mysql_query($s6);
    		$departemenArr = array();
    		while ($r6 = mysql_fetch_assoc($e6)) {
    			$departemenArr[]=$r6;
    		} 

    		session_start();
    		$_SESSION = array(
    			// collect user's informations
                'loginS'          => 1,
                'id_loginS'       => $r1['id_login'],
                'namaS'           => $r1['nama'],
                'usernameS'       => $r1['username'],
                'levelS'          => $r1['level'],
                'levelurutanS'    => $r1['urutan'],
                'lastloginS'      => $r1['lastlogin'],
                'counterlogS'     => $r1['counterlog'],
                // 'katgrupmenuS' => $katgrupmenuArr, // collect kategori menu
                'departemenS'     => $departemenArr, // collect departemens
                'grupmodulS'      => $grupmodulArr // collect grup moduls
    		);
            $stat = true;
        }
    }else{ // user tidak ditemukan
        $stat = false;
        $msg  = 'username / password salah / belum terdaftar';
	}
    // pr($_SESSION);
    echo json_encode(array('stat'=>$stat,'msg'=>$msg));
?>