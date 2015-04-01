<?php
	sleep(2);
	require_once 'dbcon.php';
	$out  = array();
	$user = $_POST['userTB'];
	$pass = base64_encode($_POST['pass2TB']);
	$s1   = 'SELECT lg.*,lv.keterangan as level 
			from 
				login lg,
				level lv
			where
				lg.id_level = lv.id_level 
				and lg.username = "'.$user.'" 
				and lg.password ="'.$pass.'"';
	$e1   = mysql_query($s1) or die(mysql_error());
	$n    = mysql_num_rows($e1);
	// var_dump($n);exit();	

	if($n!=0){
		$r1  = mysql_fetch_assoc($e1);
		$s2 = 'SELECT
					md.*, 
					CASE
						WHEN tbmd.id_modul >0 THEN
							1
						ELSE
							0
					END AS statmod
				FROM
					modul md
				LEFT JOIN (
					SELECT
						m.id_modul
					FROM
						login lg,
						LEVEL l,
						privillege p,
						departemen d,
						modul m
					WHERE
						lg.id_login         = '.$r1['id_login'].'
						AND lg.id_level     = l.id_level
						AND p.id_login      = lg.id_login
						AND d.id_departemen = p.id_departemen
						AND m.id_modul      = p.id_modul
				) tbmd ON tbmd.id_modul = md.id_modul';
/*		$e2   = mysql_query($s2);
		// var_dump($s2);exit();
		// $priv =array();
		$priv =Array();
		while ($r2 = mysql_fetch_assoc($e2)) {
			// $priv[]=$r2;
			array_push($priv,$r2);
		}
*/		session_start();
		$_SESSION=array(
			'loginS'    => 1,
			'id_loginS' => $r1['id_login'],
			'namaS'     => $r1['nama'],
			'usernameS' => $r1['username'],
			'levelS'    => $r1['level'],
			// 'privS' 	=> $priv
		);
		$out=1;
	}else{
		$out = 0;
	}
	echo $out;
?>
