<?php
	function filter($str){
		$str = mysql_real_escape_string(htmlentities($str));
		return $str;
	}
?>