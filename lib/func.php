<?php
/* common*/
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
		// D:\xampp\htdocs\siadu(epiii)\shared\libraries\modules\apps\keu.php:
		
		// define('JT_UMUM',0);
		// define('JT_SISWA',1);
		// define('JT_CALONSISWA',2);
		// define('JT_INCOME',3);
		// define('JT_OUTCOME',4);
		// define('JT_INBANK',5);
		// define('JT_OUTBANK',6);
		// define('JT_INBRG',7);

		if($jenis==0) $cl='fg-blue'; #umum
		else if($jenis==1) $cl='fg-lightGreen'; #siswa
		else if($jenis==2) $cl='fg-lightGreen'; #calon siswa
		else if($jenis==3) $cl='fg-lightGreen'; #income
		else if($jenis==4) $cl='fg-lightRed'; #outcome
		else if($jenis==5) $cl='fg-lightGreen'; #inbank
		else if($jenis==6) $cl='fg-lightRed'; #outbank
		else if($jenis==7) $cl='fg-lightRed'; #Winbrg
		else $cl='';
		$ret='<span style="font-weight:bold;" class="'.$cl.'">'.$no.'</span><br>
			'.jenisbukti($jenis).'<br>
			'.($bukti!=''?$bukti:'');
		return $ret;
	}
?>