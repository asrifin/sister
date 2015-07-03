<?php
//session_start();
error_reporting(0);

date_default_timezone_set('Asia/Jakarta');
define('ROOTLNK','../');
// define('ROOTDIR','xampp/htdocs/sister/');
define('ROOTDIR','C:/xampp/htdocs/sister/');
define('SHAREDDIR',ROOTDIR.'shared/');
define('SHAREDLIB',ROOTDIR.'shared/libraries/');
define('SHAREDSTYLE',ROOTDIR.'shared/style/');
define('SHAREDAPPS',ROOTDIR.'shared/apps/');
define('SHAREDMAINSTYLE',ROOTDIR.'shared/style/main.php');
define('SHAREDFW',ROOTDIR.'shared/framework.php');
define('DBFILE',ROOTDIR.'shared/db.php');
define('SHAREDOBJ',SHAREDLIB.'obj/');

define('DB_HRD','`vita`.`hrd_pegawai`');
define('DB_PUS_SO','`vita`.`hrd_pegawai`');

define('DBHOST','localhost');
define('DBNAME','sister_siadu');
define('DBUSER','root');
define('DBPSWD','');
?>
