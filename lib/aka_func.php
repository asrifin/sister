<?php

/*aka*/
	function getTahunAjaran($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM aka_tahunajaran
			  WHERE replid ='.$id;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}
	function getKelas($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM aka_kelas
			  WHERE replid ='.$id;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}

	function getSubtingkat($f,$id){
		$s = 'SELECT '.$f.'
			  FROM aka_subtingkat
			  WHERE replid ='.$id;
			  // print_r($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$f];
	}
	function getTingkat($f,$id){
		$s = 'SELECT '.$f.'
			  FROM aka_tingkat
			  WHERE replid ='.$id;
		// var_dump($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$f];
	}
/*akademik*/
	function getDepartemen($typ,$id){
		$s='SELECT '.$typ.' FROM departemen WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// var_dump($r);exit();
		return $r[$typ];
	}

?>