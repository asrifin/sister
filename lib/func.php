<?php	
	require_once  'keu_func.php';
	require_once  'kon_func.php';
	require_once  'aka_func.php';
	require_once  'psb_func.php';
	require_once  'pus_func.php';

	function errMsg($no,$dt){
		$dt=isset($dt)?$dt:'';
		switch ($no) {
			case '1451':
				return '"'.$dt.'" telah terpakai, silahkan hapus data berkaitan';
			break;
		}
	}
	// general function : query data 
	function getField($f,$tb,$w='',$k=''){
		$s = 'SELECT '.$f.' FROM '.$tb.($w!=''?' WHERE '.$w.' = '.$k:'');
		// var_dump($s);exit();
		$e = mysql_query($s);
		// $e = mysql_query($s) or die(mysql_error());
		$r = mysql_fetch_assoc($e);
		return $r[$f];
	}
	function vdump($x){
		echo '<pre>';
			var_dump($x);
		echo'</pre>';
		exit();
	}
	function pr($x){
		echo '<pre>';
			print_r($x);
		echo'</pre>';
		exit();
	}


?>