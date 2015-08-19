<?php
	function checkDetailKelas($thn){
		$kel  = getField('count(*)','aka_kelas','','');
		$dkel = getField('count(*)','aka_detailkelas','tahunajaran',$thn);
		// vdump($kel);
		if($dkel<=0 || $kel!=$dkel) addDetailKelas($thn);
	}
	function addDetailKelas($thn){
		$sk = 'SELECT replid FROM aka_kelas ORDER BY replid ASC';
		$ek = mysql_query($sk);
		while ($rk = mysql_fetch_assoc($ek)) {
			$ss ='INSERT INTO aka_detailkelas SET  	kelas       ='.$rk['replid'].',
													tahunajaran ='.$thn;
			$es = mysql_query($ss);
		}
	}

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