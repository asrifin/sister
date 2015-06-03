<?php
	// local
	$server   = "localhost";
	$username = "root";
	$password = "";
	// $database = "sister_demo";
	$database = "sister_siadu";
	
	//online
	// $server   = "mysql.idhotinger.com";
	// $username = "u484251826_nyuek";
	// $password = "";
	// $database = "u484251826_nyuek";

	mysql_connect($server,$username,$password) or die("Koneksi gagal");
	mysql_select_db($database) or die("Database tidak bisa dibuka");
?>