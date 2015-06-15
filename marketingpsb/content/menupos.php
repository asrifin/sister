<?php
global $koneksi_db;
if (isset ($_POST['submit_login']) && @$_POST['loguser'] == 1){
$login .= aura_login ();
}
if (cek_login ()){

$username	= $_SESSION['UserName'];
$levelakses = $_SESSION['LevelAkses'];

if ($levelakses=="Administrator"){
echo '<div class="border2">
<table width="100%"><tr align="center">
<td>
<a href="admin.php"><img src="images/home.jpg" width="50px"><br>HOME</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=mnmaster&mod=yes"><img src="images/customer.jpg" width="50px"><br>MASTER</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=tahap1&mod=yes"><img src="images/tahap1.png" width="50px"><br>TAHAP 1</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=tahap2&mod=yes"><img src="images/tahap2.png" width="50px"><br>TAHAP 2</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=tahap3&mod=yes"><img src="images/tahap3.png" width="50px"><br>TAHAP 3</a>&nbsp;
</td>
<td>
<a href="admin.php?pilih=user&mod=yes"><img src="images/userlogin.jpg" width="50px"><br>USER</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=settingwebsite&mod=yes"><img src="images/password.jpg" width="50px"><br>PASSWORD</a>&nbsp;&nbsp;
</td>
<td>
<a href="index.php?aksi=logout"><img src="images/logout.jpg" width="50px"><br>KELUAR</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';
}
echo $login;
}
?>