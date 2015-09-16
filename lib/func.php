<?php	
	require_once  'keu_func.php';
	require_once  'kon_func.php';
	require_once  'aka_func.php';
	require_once  'psb_func.php';
	require_once  'pus_func.php';


	function addRecord($f,$tb){
		if(is_array($f)){
			$sql='INSERT INTO '.$tb.' SET ';
			$s='';
			// pr($f);
			foreach ($f as $i => $v) {
				if($v!=null){
					if(is_numeric($i)) $s.=','.$v.'="'.$_POST[$v.'TB'].'"';
					else $s.=','.$i.'="'.$v.'"';
				}
			}$sql.=substr($s,1);
			// if($tb=='psb_siswawali') pr($sql);
			$stat=!exeQuery($sql)?false:true;
			$idx=mysql_insert_id();
			return array('isSukses'=>$stat,'id'=>$idx); 
		}
	}
	function editRecord($f,$tb,$w,$k){
		if(is_array($f)){
			$sql='UPDATE '.$tb.' SET ';
			$s='';
			foreach ($f as $i => $v) {
				if($v!=null){
					if(is_numeric($i)) $s.=','.$v.'="'.$_POST[$v.'TB'].'"';
					else $s.=','.$i.'="'.$v.'"';
				}
			}$sql.=substr($s,1);
			$sql.=' WHERE '.$w.'='.$k;
			$stat=!exeQuery($sql)?false:true;
			return array('isSukses'=>$stat); 
		}
	}	
	function exeQuery($sql){
		$e=mysql_query($sql);
		return $e;
		// return $e?true:false;
	}
	function fetchField2($sql){
		$e=exeQuery($sql);
		$r=array();
		while ( $ff=mysql_fetch_assoc($e)) $r[]=$ff;
		return $r;
	}
	function fetchField($sql){
		$ff=mysql_fetch_array(exeQuery($sql));
		// pr($sql);
		return $ff[0];
	}
	
	// error handling
	function errMsg($no,$dt){
		$dt=isset($dt)?$dt:'';
		switch ($no) {
			case '1451':
				return '"'.$dt.'" telah terpakai, silahkan hapus data berkaitan';
			break;
		}
	}
	function getFieldArr2($f,$tb,$w,$k){
		$s   = 'SELECT '.$f.' FROM '.$tb.($w!=''?' WHERE '.$w.' = '.$k:'');
		// pr($s);
		$e   = mysql_query($s);
		$arr =array();
		while ($r=mysql_fetch_assoc($e)) {
			$arr[]=($f=='*'||$f=='all'?$r:$r[$f]);
		}return $arr;
	}
		
	function getFieldArr4($f,$tb,$j,$w){
		$s = 'SELECT ';
		$s.=$f;
		$s.=' FROM '.$tb;
		if(is_array($j)){
			foreach ($j as $i => $v)  $s.=' LEFT JOIN '.$v[0].' ON '.$v[0].'.'.$v[2].'='.$v[1].'.'.$v[3]; 
		}
		$s.=' WHERE ';
		if(is_array($w)){
			$ww='';
			foreach ($w as $i => $v)  {
				$ww.='AND '.$v[0].' '.$v[1].' "'.($v[1]=='LIKE'?'%':'').$v[2].($v[1]=='LIKE'?'%':'').'" ';// replid = 13
			}$s.=substr($ww,4);
		}$e = mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$f];
	}	
	
	function getFieldArr3($f,$tb,$j,$w,$k){
		$s = 'SELECT ';
		if(is_array($f)){
			$ss='';
			foreach ($f as $i => $v) $ss.=','.$v;
			$s.=substr($ss,1);
		}else $s.=$f;
		$s.=' FROM '.$tb;
		if(is_array($j)){
			foreach ($j as $i => $v)  $s.=' LEFT JOIN '.$v[0].' ON '.$v[0].'.'.$v[2].'='.$v[1].'.'.$v[3]; 
		}
		$s .=($w!=''?' WHERE '.$w.' = '.$k:'');
		// pr($s);
		$e = mysql_query($s);
		$arr =array();
		while ($r=mysql_fetch_assoc($e)) $arr[]=(!is_array($f)?$r[$f]:$r);
		return $arr;
	}

	function getField2($f,$tb,$w,$k){
		$ww='';
		if(is_array($w)){
			$w1 ='';foreach ($w as $i => $v) {
				$w1.=' and '.$i.'='.$v;
			}$ww.=substr($w1,4);
		}else $ww.=$w;

		$s = 'SELECT '.$f.' FROM '.$tb.($w!=''?' WHERE '.$ww:'');
		$e = mysql_query($s);
		$r =mysql_fetch_assoc($e);
		return $r[$f];
	}

	// function getFieldArr($f,$tb,$w,$k){
	// 	if(is_array($k)){
	// 		$kk='IN (';
	// 		foreach ($w as $i => $v) {
	// 			$kk.=','.$v;
	// 		}$kk.=substr($kk,1);
	// 		$kk.=')';
	// 	}else $kk=$k;

	// 	$s   = 'SELECT '.$f.' FROM '.$tb.($w!=''?' WHERE '.$w.' = '.$kk:'');
	// 	$e   = mysql_query($s);
	// 	$arr = '';
	// 	while ($r=mysql_fetch_assoc($e)) {
	// 		$arr.=','.$r[$f];
	// 	} return substr($arr,1);
	// }

	function getFieldArr($f,$tb,$w,$k){
		$s   = 'SELECT '.$f.' FROM '.$tb.' WHERE '.$w.' = '.$k;
		$e   = mysql_query($s);
		$arr = '';
		while ($r=mysql_fetch_assoc($e)) {
			$arr.=','.$r[$f];
		} return substr($arr,1); // a,b,c,d, dst
	}

	// general function : query data 
	function getField($f,$tb,$w='',$k=''){
		$s = 'SELECT '.$f.' FROM '.$tb.($w!=''?' WHERE '.$w.' = "'.$k.'"':'');
		$e = mysql_query($s) or die(mysql_error());
		$r = mysql_fetch_assoc($e);
		return ($f=='*' || $f=='all'?$r:$r[$f]);
	}
	function vd($x){
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

	function delFile($file){
		if(isset($file)){
			if(file_exists($file)){
				$isDel   = unlink($file);
				$statDel = !$isDel?false:true;
				return $statDel;
			}
		}
	}
	/*function contentFC(){
	    $out='';
	    // looping grup menu
	    foreach ($_SESSION['grupmodulS']as $i => $v) {
	        foreach ($v['modul'] as $i2 => $v2) {
	            if($v2['modul']==$modul and $v2['statmod']==1) {
	                foreach ($v2['grupmenu'] as $i3 => $v3) {
	                    $out.='<div class="tile-group '.$v3['size'].'">
	                            <div class="tile-group-title">'.$v3['grupmenu'].'</div>';
	                        // $out.=' <a '.($v4['statmenu']==0?'onclick="notif(\'Anda tidak berhak akses '.$v4['menu'].'\',\'blue\')"':'href="'.$v4['link']).'" class="tile '.$v4['size'].' 
	                    foreach ($v3['menu'] as $i4 => $v4) {
	                        $out.=' <a '.($v4['statmenu']==0?'onclick="warning(\''.$v4['menu'].'\');"':'href="'.$v4['link']).'" class="tile '.$v4['size'].' 
	                                    bg-'.($v4['statmenu']==0?'grey':$v4['warna']).'" data-click="transform">
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
	}*/
?>