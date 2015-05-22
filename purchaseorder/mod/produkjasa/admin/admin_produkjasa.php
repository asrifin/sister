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
$admin  .='<legend>JASA</legend>';
$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=produkjasa&mod=yes">JASA</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=produkjasa&mod=yes&aksi=import">IMPORT JASA</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `pos_produkjasa` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Jasa berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produkjasa&mod=yes" />';    
	}
}

if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$jenjang 		= $_POST['jenjang'];
	$kode 		= $_POST['kode'];
	$nama 		= $_POST['nama'];
	$jenis 		= $_POST['jenis'];
	$hargajual 		= $_POST['hargajual'];
	
	$error 	= '';
		if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT jenjang FROM pos_produkjasa WHERE jenjang='$jenjang' and jenis='$jenis' and nama='$nama' or kode='$kode'")) > 1) $error .= "Error: jasa sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `pos_produkjasa` SET `kode`='$kode',`jenjang`='$jenjang',`nama`='$nama',`jenis`='$jenis',`hargajual`='$hargajual' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produkjasa&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `pos_produkjasa` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$jenis  			= $data['jenis'];
$jenjang  			= $data['jenjang'];
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit Jasa</h3></div>';
$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
<tr>
	<td>Jenis</td>
		<td>:</td>
	<td><select name="jenis" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_jenisproduk ORDER BY nama asc");
$admin .= '<option value="">== Jenis ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$jenis)?"selected":'';
$admin .= '<option value="'.$datas['id'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Jenjang</td>
		<td>:</td>
	<td><select name="jenjang" class="form-control" required>';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_jenjang ORDER BY nama asc");
$admin .= '<option value="">== Jenjang==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['id']==$jenjang)?"selected":'';
$admin .= '<option value="'.$datasj['id'].'"'.$pilihanj.'>'.$datasj['nama'].'</option>';
}
$admin .='</select></td>
</tr>
	<tr>
		<td>Kode Jasa</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" value="'.$data['kode'].'" required></td>
	</tr>
	<tr>
		<td>Nama Jasa</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" value="'.$data['nama'].'" required></td>
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
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi']==""){
if(isset($_POST['submit'])){
$jenjang 		= $_POST['jenjang'];
$kode 		= $_POST['kode'];
$nama 		= $_POST['nama'];
$jenis 		= $_POST['jenis'];
$hargajual 		= int_filter($_POST['hargajual']);
	$error 	= '';
	if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT jenjang FROM pos_produkjasa WHERE jenjang='$jenjang' and jenis='$jenis' and nama='$nama' or kode='$kode'")) > 0) $error .= "Error: Jasa sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `pos_produkjasa` VALUES ('','$jenis','$jenjang','$kode','$nama','$hargajual')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
	}

}
$jenjang     		= !isset($jenjang) ? '' : $jenjang;
$kode     		= !isset($kode) ? '' : $kode;
$nama     		= !isset($nama) ? '' : $nama;
$jenis     		= !isset($jenis) ? '' : $jenis;
$hargajual     		= !isset($hargajual) ? '0' : $hargajual;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Jasa</h3></div>';

$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
<tr>
	<td>Jenis</td>
		<td>:</td>
	<td><select name="jenis" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_jenisproduk ORDER BY nama asc");
$admin .= '<option value="">== Jenis Jasa==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'">'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Jenjang</td>
		<td>:</td>
	<td><select name="jenjang" class="form-control" required>';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_jenjang ORDER BY nama asc");
$admin .= '<option value="">== Jenjang ==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$admin .= '<option value="'.$datasj['id'].'">'.$datasj['nama'].'</option>';
}
$admin .='</select></td>
</tr>
	<tr>
		<td>Kode Jasa</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Nama Jasa</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" required></td>
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
	$jenjang 		= $_POST['jenjang'];
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
   $hargajual = $cell->val( $i,3 );

$sql ="INSERT INTO `pos_produkjasa` (`jenis`,`jenjang`,`kode`,`nama`,`hargajual`) VALUES ('$jenis','$jenjang','$kode','$nama','$hargajual')";
$hasil = mysql_query( $sql );
if($hasil){
$sukses++;
}else{
$gagal++;
}
   $i++;
}
 //tampilkan report hasil import
 $admin .= "<h3> Proses Import Data Jasa Selesai</h3>";
 $admin .= "<p>Jumlah data sukses diimport : ".$sukses."<br>";
 $admin .= "Jumlah data gagal diimport : ".$gagal."<p>";

}

$admin .= '<div class="panel panel-info">';
$admin .='<div class="panel-heading"><b>Import Jasa</b></div>';
$admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">
 <tr>
		<td>Jenis</td>
		<td>:</td>
		<td>
<select name="jenis" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_jenisproduk ORDER BY nama");
$admin .= '<option value="">== Pilih Jenis ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
	</tr>
 <tr>
		<td>Jenjang</td>
		<td>:</td>
		<td>
<select name="jenjang" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_jenjang ORDER BY nama");
$admin .= '<option value="">== Pilih Jenjang ==</option>';
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
	<td><a href="mod/produk/admin/importprodukjasa.xls">importprodukjasa.xls</a></td>
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
            <th>Jenjang</th>
            <th>Kode</th>
			<th>Nama Jasa</th>
           <th>H.Jual</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_produkjasa" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$jenjang=$data['jenjang'];
$kode=$data['kode'];
$nama=$data['nama'];
$jenis=$data['jenis'];
$hargajual=$data['hargajual'];
$admin.='<tr>
            <td>'.getjenis($jenis).'</td>
            <td>'.getjenjang($jenjang).'</td>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.$hargajual.'</td>
            <td><a href="?pilih=produkjasa&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=produkjasa&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

}
echo $admin;
?>