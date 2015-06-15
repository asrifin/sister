<?php

if (!defined('AURACMS_admin')) {
	Header("Location: ../../../index.php");
	exit;
}

if (!cek_login ()){
   $admin .='<p class="judul">Access Denied !!!!!!</p>';
   exit;
}


$admin  .='<legend>PENAWARAN</legend>';

if($_GET['aksi']==""){
$admin .= '<div align="center">
<table width="50%" class="border3">
<tr align="center">
<td>
<a href="admin.php?pilih=penawaran&mod=yes">
<img src="images/product.jpg" width="150px"><br>
</a></td>
<td><img src="images/arrowright.png" width="150px"></td>
<td>
<a href="admin.php?pilih=laporanpenawaran&mod=yes">
<img src="images/lapproduct.jpg" width="150px"><br>
</a></td>
</tr>
<tr align="center">

<td>
<a href="admin.php?pilih=penawaran&mod=yes"><br>PENAWARAN
</a></td>
<td></td>
<td>
<a href="admin.php?pilih=laporanpenawaran&mod=yes"><br>LAPORAN PENAWARAN
</a></td>
</tr>
</table><br>

<table width="50%"class="border3">
<tr align="left">
<td>
<a href="formulir/formulirpenawaran.pdf">
<img src="images/pdfbsr.jpg" width="150px"><br>
</a></td>
<td></td>
<td></td>
</tr>
<tr align="left">

<td>
<a href="formulir/formulirpenawaran.pdf"><br>FORMULIR FISIK PENAWARAN
</a></td>
<td></td>
<td></td>
</tr>
</table><br>

</div><br><br>
';
}
echo $admin;

?>