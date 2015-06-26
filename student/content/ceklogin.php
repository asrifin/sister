<?php
global $koneksi_db;
if (isset ($_POST['submit_login']) && @$_POST['loguser'] == 1){
$login .= aura_login ();
}
if (cek_login ()){

$username	= $_SESSION['UserName'];
$levelakses = $_SESSION['LevelAkses'];

if (isset( $_SESSION['LevelAkses'] )){
$hasil = $koneksi_db->sql_query( "SELECT * FROM useraura WHERE user='$username'" );
$data = mysql_fetch_assoc($hasil);
$user = $data['user'];
$avatar = $data['avatar'];
echo '<div class="border" align="right">Halo, <a href="admin.php">'.$user.'</a>, <a href="index.php?aksi=logout"><b>Sign Out</b></a></div>';
}else{
$login .= '
<div class=border>
<form method="post" action="">
<table><tr valign=top><td width=70%><b>Anda belum melakukan registrasi</b><br><b><a href="./register.html">registrasi disini</a></b> atau <b><a href="./forgotpassword.html">lupa password</a></b></td>
    <td><b>user</b><br /><input type="text" name="username" size="10" /></td>
	<td><b>password</b><br /><input type="password" name="password" size="10" /></td>
	<td><br /><input type="hidden" value="1" name="loguser" /><input type="submit" value="Login" name="submit_login" /></td>
  </tr>
</table></form></div>';
echo $login;
}
}
?>