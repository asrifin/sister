<?php
	// online
	// $server   = "mysql.idhostinger.com";
	// $username = "u481900298_db";
	// $password = "1tambah1=2";
	// $database = "u481900298_db";
	
	// local
	$server   = "localhost";
	$username = "root";
	$password = "";
	$database = "sisterdb";
	
	// try {
	// 	$db = new PDO('mysql:host=localhost;dbname='.$database, $username, $password);
	// } catch (PDOException $e) {
	// 	print "Error!: " . $e->getMessage() . "<br/>";
	// 	die();
	// }
	// Koneksi dan memilih database di server
	mysql_connect($server,$username,$password) or die("Koneksi gagal");
	mysql_select_db($database) or die("Database tidak bisa dibuka");
?>


<?Php
// $dbhost_name = "localhost";
// $database = "latihan";
// $username = "root";
// $password = "";

// //////// Do not Edit below /////////
// try {
// $dbo = new PDO('mysql:host=localhost;dbname='.$database, $username, $password);
// } catch (PDOException $e) {
// print "Error!: " . $e->getMessage() . "<br/>";
// die();
// }
?> 