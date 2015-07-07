<?php
if (!defined('AURACMS_admin')) {
	Header("Location: ../index.php");
	exit;
}

//$index_hal = 1;
if (!cek_login ()){   
	
$admin .='<p class="judul">Access Denied !!!!!!</p>';
}else{
$JS_SCRIPT.= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );
</script>
js;
$script_include[] = $JS_SCRIPT;
$admin .='<h4 class="page-header">Administrasi Golongan</h4>';
$admin .= '<script type="text/javascript" language="javascript">
   function GP_popupConfirmMsg(msg) { //v1.0
  document.MM_returnValue = confirm(msg);
}
</script>';
if($_GET['aksi']==""){

if($_GET['aksi2']==""){

if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Nama<br />";
$total = $koneksi_db->sql_query( "SELECT * FROM hrd_golongan WHERE nama = '".$_POST['nama']."'");
$jumlah = $koneksi_db->sql_numrows( $total );	
if ($jumlah) $error .= "Error: Kode Golongan $nama sudah ada di dalam database! , harap memakai kode lain<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `hrd_golongan` (`nama`,`gajipokok`) VALUES ('$nama','0')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Golongan Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b>Golongan Gagal di Buat.</b></div>';
		}
		unset($nama);
	}

}
$nama     		= !isset($nama) ? '' : $nama;
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Golongan</h3></div>';

$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"></td>
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

if($_GET['aksi2'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$error 	= '';
	if (!$nama)  	$error .= "Error: Silahkan Isi Kode Golongan<br />";
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `hrd_golongan` SET `nama`='$nama'WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=golongan&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `hrd_golongan` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit Golongan</h3></div>';
$admin .= '<br>
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control"></td>
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

if($_GET['aksi2']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `hrd_golongan` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Golongan berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=golongan&mod=yes" />';    
	}
}
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Golongan</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_golongan" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nama=$data['nama'];
$gajipokok=$data['gajipokok'];
$admin.='<tr>
            <td>'.$nama.'</td>
            <td><a href="?pilih=golongan&amp;mod=yes&amp;aksi2=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=golongan&amp;mod=yes&amp;aksi2=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}
echo $admin;
}