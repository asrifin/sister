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
?>