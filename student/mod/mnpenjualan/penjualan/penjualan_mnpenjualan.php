<?php

if (!defined('AURACMS_admin')) {
	Header("Location: ../../../index.php");
	exit;
}

if (!cek_login ()){
   $admin .='<p class="judul">Access Denied !!!!!!</p>';
   exit;
}


$admin  .='<legend>PENJUALAN</legend>';

if($_GET['aksi']==""){
$admin .= '<div align="center">
<table width="50%" class="border3">
<tr align="center">
<td>
<a href="admin.php?pilih=penjualan&mod=yes">
<img src="images/product.jpg" width="150px"><br>
</a></td>
<td><img src="images/arrowright.png" width="150px"></td>
<td>
<a href="admin.php?pilih=laporanpenjualan&mod=yes">
<img src="images/lapproduct.jpg" width="150px"><br>
</a></td>
</tr>
<tr align="center">
<td>
<a href="admin.php?pilih=penjualan&mod=yes"><br>PENJUALAN
</a></td>
<td></td>
<td>
<a href="admin.php?pilih=laporanpenjualan&mod=yes"><br>LAPORAN PENJUALAN
</a></td>
</tr>

</table><br>

</table>
</div><br><br>
';
}
echo $admin;

?>