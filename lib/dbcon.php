<?php
	// local
	$server   = "localhost";
	$username = "root";
	$password = "";
	// $database = "sisterdb";
	$database = "sister_siadu";
	mysql_connect($server,$username,$password) or die("Koneksi gagal");
	mysql_select_db($database) or die("Database tidak bisa dibuka");
?>