<?php
	function filter($str){
		$str = mysql_real_escape_string(htmlentities($str));
		return $str;
	}function getuang($str){
		$old = array('Rp. ','.');
		$new = array('','');
		$x   = str_replace($old,$new, $str);
		return $x;
	}

	/*keuangan*/
	// transaksi
	function jenisbukti($a){
		if($a==3) return 'BKM';
		else if($a==4) return 'BKK';
		else if($a==5) return 'BBM';
		else if($a==6) return 'BBK';
		else return '';
	}function ju_nomor($no,$jenis,$bukti){
		// var_dump(func_get_arg(2));exit();
		// D:\xampp\htdocs\siadu(epiii)\shared\libraries\modules\apps\keu.php:
		if($jenis==3) $cl='fg-lightGreen';
		else if($jenis==4) $cl='fg-lightRed';
		else if($jenis==7) $cl='fg-lightRed';
		else if($jenis==5) $cl='#fg-lightGreen';
		else if($jenis==6) $cl='fg-lightRed';
		else if($jenis==1) $cl='#fg-lightGreen';
		else if($jenis==2) $cl='fg-lightGreen';
		else if($jenis==0) $cl='fg-blue';
		else $cl='';
		$ret='<span style="font-weight:bold;" class="'.$cl.'">'.$no.'</span><br>
			'.jenisbukti($jenis).'<br>
			'.($bukti!=''?$bukti:'');
		return $ret;
	}
?>