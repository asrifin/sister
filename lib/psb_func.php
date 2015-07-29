<?php

/*psb*/
	function getAgama($id){
		$ret = getField('agama','psb_agama','replid',$id);
		return $ret;
	}
	function getNoPendaftaran($siswa,$kel){
		if(isset($siswa) && is_numeric($siswa)) {// view
			$s      = 'SELECT nopendaftaran no FROM psb_calonsiswa WHERE replid='.$siswa;
			$proses = getField('proses','psb_kelompok','replid',$kel);
			// var_dump($proses);exit();
			$awal   = getField('kodeawalan','psb_proses','replid',$proses);
		}else {// create new 
			$proses = getField('proses','psb_kelompok','replid',$kel);
			$s='SELECT
					LPAD((max(nopendaftaran)+1),6,0) no
				FROM
					psb_calonsiswa c
					LEFT JOIN psb_kelompok k ON k.replid = c.kelompok
				WHERE
					k.proses ='.$proses;
			$awal = getField('kodeawalan','psb_proses','replid',$proses);
		}
		// var_dump($awal);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		if($r['no']==NULL) $akhir = '000001'; // kosong
		else  $akhir =$r['no']; // ada

		return array('full'=>$awal.$akhir,'awal'=>$awal,'akhir'=>$akhir);
	}	
	// set biaya checking 
	function getSetBiaya($kel,$krit,$gol){
		$s = '	SELECT replid,daftar, spp, nilai, joiningf
				FROM psb_setbiaya 
				WHERE 	kel  ='.$kel.' AND 
						krit ='.$krit.' AND 
						gol  ='.$gol;
						// print_r($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r;
	}
	function getNumRows($tb){
		$s='SELECT * FROM psb_'.$tb;
		$e = mysql_query($s);
		$n = mysql_num_rows($e);
		return intval($n);
	}
	function checkSetBiaya($kel){
		$s = 'SELECT * FROM psb_setbiaya WHERE kel ='.$kel;
		$e = mysql_query($s);
		$n = mysql_num_rows($e);
		if($n<=0) addSetBiaya($kel);
	}

	function addSetBiaya($kel){
		$sk = 'SELECT replid FROM psb_kriteria';
		$ek = mysql_query($sk);
		while ($rk=mysql_fetch_assoc($ek)) {
			$sg = 'SELECT replid FROM psb_golongan';
			$eg = mysql_query($sg);
			while ($rg=mysql_fetch_assoc($eg)) {
				$ss='INSERT INTO psb_setbiaya SET 
						kel  ='.$kel.',
						gol  ='.$rg['replid'].',
						krit ='.$rk['replid'];
				$es=mysql_query($ss);
			}
		}
	}	
	function getSiswa($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM psb_calonsiswa
			  WHERE replid ='.$id;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}	
	function getAngkatan($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM aka_angkatan
			  WHERE replid ='.$id;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getAngkatan2($f,$w,$id){
		$s = 'SELECT '.$f.'
			  FROM aka_angkatan
			  WHERE '.$w.' ="'.$id.'"';
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$f];
	}function getProses($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM psb_proses
			  WHERE replid ='.$id;
			  // print_r($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getKelompok($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM psb_kelompok
			  WHERE replid ='.$id;
			  // var_dump($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getSiswaBy($f,$w){
		$s='SELECT '.$f.' FROM psb_calonsiswa WHERE replid ='.$w;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// var_dump($s);exit();
		return $r[$f];
	}
?>