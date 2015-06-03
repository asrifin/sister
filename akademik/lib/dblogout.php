<?php
	session_start();
	session_destroy();
	$out = (empty($_SESSION))?1:0;
	echo $out;
?>