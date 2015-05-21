<?php
if (!defined('AURACMS_admin')) {
	Header("Location: ../index.php");
	exit;
}
include "includes/excel_reader2.php";
//$index_hal = 1;
if (!cek_login ()){   
	
$admin .='<p class="judul">Access Denied !!!!!!</p>';
}else{

$JS_SCRIPT= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );
</script>
js;
$script_include[] = $JS_SCRIPT;
$admin  .='<legend>CUSTOMER</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=customer&mod=yes">Home</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=customer&mod=yes&aksi=import">Import Customer</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';
if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `pos_customer` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Customer berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=customer&mod=yes" />';    
	}
}

if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
$nama 		= $_POST['nama'];
$kode 		= $_POST['kode'];
	
	$error 	= '';
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `pos_customer` SET `kode`='$kode',`nama`='$nama' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=customer&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `pos_customer` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$nama  			= $data['nama'];
$kode  			= $data['kode'];
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit Customer</h3></div>';
$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" value ="'.$kode.'" required></td>
	</tr>
	<tr>
		<td>Nama</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"  value ="'.$nama.'" required></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi']==""){
if(isset($_POST['submit'])){
$nama 		= $_POST['nama'];
$kode 		= $_POST['kode'];
	$error 	= '';
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT kode FROM pos_customer WHERE kode='$kode'")) > 0) $error .= "Error: Kode ".$kode." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `pos_customer` VALUES ('','$kode','$nama')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($kode);

	}

}
$nama     		= !isset($nama) ? '' : $nama;
$kode     		= !isset($kode) ? '' : $kode;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Customer</h3></div>';

$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Nama</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';

}

if($_GET['aksi']=="import"){
	if(isset($_POST['submit'])){
//nilai awal counter jumlah data yang sukses dan yang gagal diimport
 $sukses = 0;
 $gagal = 0;
$cell   = new Spreadsheet_Excel_Reader($_FILES['upfile']['tmp_name']);
$jumlah = $cell->rowcount($sheet_index=0);
 
$i = 2; // dimulai dari ke dua karena baris pertama berisi title
while( $i<=$jumlah ){
 
   //$cell->val( baris,kolom )
 
   $kode  = $cell->val( $i,1 );
   $nama = $cell->val( $i,2 );
$password = md5("$password");
$sql ="INSERT INTO `pos_customer` (`kode`,`nama`) VALUES ('$kode','$nama')";
$hasil = mysql_query( $sql );
if($hasil){
$sukses++;
}else{
$gagal++;
}
   $i++;
}
 //tampilkan report hasil import
 $admin .= "<h3> Proses Import Data Customer Selesai</h3>";
 $admin .= "<p>Jumlah data sukses diimport : ".$sukses."<br>";
 $admin .= "Jumlah data gagal diimport : ".$gagal."<p>";

}

$admin .= '<div class="panel panel-info">';
$admin .='<div class="panel-heading"><b>Import Customer</b></div>';
$admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">
 <tr>
	<td>Silakan Pilih File Excel </td>
	<td>:</td>
	<td><input name="upfile" type="file"></td>
 </tr>
 <tr>
	<td>Contoh File Excel </td>
	<td>:</td>
	<td><a href="mod/customer/admin/importcustomer.xls">importcustomer.xls</a></td>
 </tr>
 <tr>
	<td></td>
	<td></td>
	<td><input name="submit" type="submit" value="import" class="btn btn-success"></td>
 </tr>
 </table>
 </form></div>';
}

if (in_array($_GET['aksi'],array('edit','del','','import'))){
$admin .= '<div class="panel panel-info">';
$admin .='<div class="panel-heading"><b>Customer</b></div>';
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode</th>
            <th>Nama</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_customer" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$kode=$data['kode'];
$nama=$data['nama'];
$admin.='<tr>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td><a href="?pilih=customer&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=customer&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table></div>';
}


}
echo $admin;
?>