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
$admin  .='<legend>PRODUK</legend>';
$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=produk&mod=yes">PRODUK</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=produk&mod=yes&aksi=import">IMPORT PRODUK</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `po_produk` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Produk berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produk&mod=yes" />';    
	}
}

if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$kode 		= $_POST['kode'];
	$nama 		= $_POST['nama'];
	$jenis 		= $_POST['jenis'];
	$jumlah 		= $_POST['jumlah'];
	$hargabeli 		= $_POST['hargabeli'];
	$hargajual 		= $_POST['hargajual'];
	
	$error 	= '';
		if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT kode FROM po_produk WHERE jenis='$jenis' and nama='$nama' or kode='$kode'")) > 1) $error .= "Error: Produk sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
	
	setsaldoawal($kode);
		$hasil  = mysql_query( "UPDATE `po_produk` SET `kode`='$kode',`nama`='$nama',`jenis`='$jenis',`jumlah`='$jumlah',`hargabeli`='$hargabeli',`hargajual`='$hargajual' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produk&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `po_produk` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$jenis  			= $data['jenis'];
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit Produk</h3></div>';
$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
<tr>
	<td>Jenis</td>
		<td>:</td>
	<td><select name="jenis" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM po_jenisproduk ORDER BY nama asc");
$admin .= '<option value="">== Jenis Produk==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$jenis)?"selected":'';
$admin .= '<option value="'.$datas['id'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>
	<tr>
		<td>Kode Barang</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" value="'.$data['kode'].'" required></td>
	</tr>
	<tr>
		<td>Nama Barang</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" value="'.$data['nama'].'" required></td>
	</tr>
	<tr>
		<td>Jumlah</td>
		<td>:</td>
		<td><input type="text" name="jumlah2" size="25"class="form-control"value="'.$data['jumlah'].'" disabled></td>
	</tr>
		<tr>
		<td>Harga Beli</td>
		<td>:</td>
		<td><input type="text" name="hargabeli" size="25"class="form-control"value="'.$data['hargabeli'].'"></td>
	</tr>
		<tr>
		<td>Harga Jual</td>
		<td>:</td>
		<td><input type="text" name="hargajual" size="25"class="form-control"value="'.$data['hargajual'].'"></td>
	</tr>

	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="hidden" name="jumlah" size="25"class="form-control"value="'.$data['jumlah'].'">
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi']==""){
if(isset($_POST['submit'])){
$kode 		= $_POST['kode'];
$nama 		= $_POST['nama'];
$jenis 		= $_POST['jenis'];
$jumlah 		= $_POST['jumlah'];
$hargabeli 		= $_POST['hargabeli'];
$hargajual 		= $_POST['hargajual'];
	$error 	= '';
	if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT kode FROM po_produk WHERE jenis='$jenis' and nama='$nama' or kode='$kode'")) > 0) $error .= "Error: Produk sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{

		$hasil  = mysql_query( "INSERT INTO `po_produk` VALUES ('','$jenis','$kode','$nama','$jumlah','$hargabeli','$hargajual')" );
		setsaldoawal($kode);
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
	}

}
$kode     		= !isset($kode) ? '' : $kode;
$nama     		= !isset($nama) ? '' : $nama;
$jenis     		= !isset($jenis) ? '' : $jenis;
$jumlah     		= !isset($jumlah) ? '0' : $jumlah;
$hargabeli     		= !isset($hargabeli) ? '0' : $hargabeli;
$hargajual     		= !isset($hargajual) ? '0' : $hargajual;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Produk</h3></div>';

$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
<tr>
	<td>Jenis</td>
		<td>:</td>
	<td><select name="jenis" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM po_jenisproduk ORDER BY nama asc");
$admin .= '<option value="">== Jenis Produk==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'">'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>
	<tr>
		<td>Kode Barang</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Nama Barang</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Jumlah</td>
		<td>:</td>
		<td><input type="text" name="jumlah" size="25"class="form-control"></td>
	</tr>
		<tr>
		<td>Harga Beli</td>
		<td>:</td>
		<td><input type="text" name="hargabeli" size="25"class="form-control"></td>
	</tr>
		<tr>
		<td>Harga Jual</td>
		<td>:</td>
		<td><input type="text" name="hargajual" size="25"class="form-control"></td>
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
	$jenis 		= $_POST['jenis'];
//nilai awal counter jumlah data yang sukses dan yang gagal diimport
 $sukses = 0;
 $gagal = 0;
$cell   = new Spreadsheet_Excel_Reader($_FILES['upfile']['tmp_name']);
$jum = $cell->rowcount($sheet_index=0);
 
$i = 2; // dimulai dari ke dua karena baris pertama berisi title
while( $i<=$jum ){
 
   //$cell->val( baris,kolom )
 
   $kode  = $cell->val( $i,1 );
   $nama = $cell->val( $i,2 );
   $jumlah = $cell->val( $i,3 );
    $hargabeli = $cell->val( $i,4 );
   $hargajual = $cell->val( $i,5 );

$sql ="INSERT INTO `po_produk` (`jenis`,`kode`,`nama`,`jumlah`,`hargabeli`,`hargajual`) VALUES ('$jenis','$kode','$nama','$jumlah','$hargabeli','$hargajual')";
$hasil = mysql_query( $sql );
setsaldoawal($kode);
if($hasil){
$sukses++;
}else{
$gagal++;
}
   $i++;
}
 //tampilkan report hasil import
 $admin .= "<h3> Proses Import Data Produk Selesai</h3>";
 $admin .= "<p>Jumlah data sukses diimport : ".$sukses."<br>";
 $admin .= "Jumlah data gagal diimport : ".$gagal."<p>";

}

$admin .= '<div class="panel panel-info">';
$admin .='<div class="panel-heading"><b>Import Produk</b></div>';
$admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">
 <tr>
		<td>Jenis</td>
		<td>:</td>
		<td>
<select name="jenis" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM po_jenisproduk ORDER BY nama");
$admin .= '<option value="">== Pilih Jenis ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
	</tr>
 <tr>
	<td>Silakan Pilih File Excel </td>
	<td>:</td>
	<td><input name="upfile" type="file"></td>
 </tr>
 <tr>
	<td>Contoh File Excel </td>
	<td>:</td>
	<td><a href="mod/produk/admin/importproduk.xls">importproduk.xls</a></td>
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

$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kategori</th>
            <th>Kode</th>
			<th>Nama Barang</th>
           <th>Jumlah</th>
           <th>H.Beli</th>
           <th>H.Jual</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM po_produk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$kode=$data['kode'];
$nama=$data['nama'];
$jenis=$data['jenis'];
$jumlah=$data['jumlah'];
$hargabeli=$data['hargabeli'];
$hargajual=$data['hargajual'];
$admin.='<tr>
            <td>'.getjenis($jenis).'</td>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.$jumlah.'</td>
            <td>'.$hargabeli.'</td>
            <td>'.$hargajual.'</td>
            <td><a href="?pilih=produk&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=produk&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']== 'deljenis'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `po_jenisproduk` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Jenis Produk berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produk&mod=yes&aksi=jenis" />';    
	}
}

if($_GET['aksi'] == 'editjenis'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$error 	= '';
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `po_jenisproduk` SET `nama`='$nama' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produk&amp;mod=yes&aksi=jenis" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `po_jenisproduk` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit Jenis</h3></div>';
$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Nama Jenis</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control" required></td>
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

if($_GET['aksi']=="jenis"){
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$error 	= '';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `po_jenisproduk` (`nama`) VALUES ('$nama')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
	}

}
$nama     		= !isset($nama) ? '' : $nama;


$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Jenis</h3></div>';

$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Nama Jenis</td>
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

if (in_array($_GET['aksi'],array('editjenis','deljenis','jenis'))){

$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Jenis / Kategori</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM po_jenisproduk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 

$nama=$data['nama'];
$admin.='<tr>
            <td>'.$nama.'</td>
            <td><a href="?pilih=produk&amp;mod=yes&amp;aksi=deljenis&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=produk&amp;mod=yes&amp;aksi=editjenis&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

}
echo $admin;
?>