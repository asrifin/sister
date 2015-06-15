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

$JS_SCRIPT = <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );
</script>
js;
$script_include[] = $JS_SCRIPT;
$admin  .='<legend>PPPDB TAHAP 1</legend>';
$admin  .= '<div class="border2">
<table  ><tr align="center">
<td>
<a href="admin.php?pilih=tahap1&mod=yes">Home</a>&nbsp;&nbsp;-
</td>
<td>
<a href="admin.php?pilih=tahap1&mod=yes&aksi=add">&nbsp;&nbsp;Tambah Calon Siswa</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `psbcalon_siswa` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Calon Siswa berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=tahap1&mod=yes" />';    
	}
}

if($_GET['aksi']=="add"){

if(isset($_POST['submit'])){
$kode=$_POST['kode'];
$nama=$_POST['nama'];
$level=$_POST['level'];
$lokasi=$_POST['lokasi'];
$tgllahir=$_POST['tgllahir'];
$namaortu=$_POST['namaortu'];
$alamat=$_POST['alamat'];
$kota=$_POST['kota'];
$telp=$_POST['telp'];
$hp=$_POST['hp'];
$ket=$_POST['ket'];
$asalsekolah=$_POST['asalsekolah'];
$info=$_POST['info'];
$kelamin=$_POST['kelamin'];
$gelombang=$_POST['gelombang'];
	$error 	= '';
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT * FROM psbcalon_siswa WHERE kode='$kode'")) > 0) $error .= "Error: kode ".$kode." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `psbcalon_siswa` (`kode`,`nama`,`level`,`lokasi`,`tgllahir`,`namaortu`,`alamat`,`kota`,`telp`,`hp`,`ket`,`asalsekolah`,`info`,`kelamin`,`gelombang`) VALUES ('$kode','$nama','$level','$lokasi','$tgllahir','$namaortu','$alamat','$kota','$telp','$hp','$ket','$asalsekolah','$info','$kelamin','$gelombang')" );
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
$level     		= !isset($level) ? '' : $level;
$lokasi     		= !isset($lokasi) ? '' : $lokasi;
$tgllahir     		= !isset($tgllahir) ? '' : $tgllahir;
$namaortu     		= !isset($namaortu) ? '' : $namaortu;
$alamat     		= !isset($alamat) ? '' : $alamat;
$kota     		= !isset($kota) ? '' : $kota;
$telp     		= !isset($telp) ? '' : $telp;
$hp     		= !isset($hp) ? '' : $hp;
$ket     		= !isset($ket) ? '' : $ket;
$asalsekolah     		= !isset($asalsekolah) ? '' : $asalsekolah;
$info     		= !isset($info) ? '' : $info;
$kelamin     		= !isset($kelamin) ? '' : $kelamin;
$gelombang     		= !isset($gelombang) ? '' : $gelombang;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Calon Siswa</h3></div>';
$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>kode</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>nama</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" required></td>
	</tr>	
	<tr>
		<td>level</td>
		<td>:</td>
		<td><input type="text" name="level" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>lokasi</td>
		<td>:</td>
		<td><input type="text" name="lokasi" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>tgllahir</td>
		<td>:</td>
		<td><input type="text" name="tgllahir" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>namaortu</td>
		<td>:</td>
		<td><input type="text" name="namaortu" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>alamat</td>
		<td>:</td>
		<td><input type="text" name="alamat" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>kota</td>
		<td>:</td>
		<td><input type="text" name="kota" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>telp</td>
		<td>:</td>
		<td><input type="text" name="telp" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>hp</td>
		<td>:</td>
		<td><input type="text" name="hp" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>ket</td>
		<td>:</td>
		<td><input type="text" name="ket" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>asalsekolah</td>
		<td>:</td>
		<td><input type="text" name="asalsekolah" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>info</td>
		<td>:</td>
		<td><input type="text" name="info" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>kelamin</td>
		<td>:</td>
		<td><input type="text" name="kelamin" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>gelombang</td>
		<td>:</td>
		<td><input type="text" name="gelombang" size="25"class="form-control" required></td>
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

if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
$kode=$_POST['kode'];
$nama=$_POST['nama'];
$level=$_POST['level'];
$lokasi=$_POST['lokasi'];
$tgllahir=$_POST['tgllahir'];
$namaortu=$_POST['namaortu'];
$alamat=$_POST['alamat'];
$kota=$_POST['kota'];
$telp=$_POST['telp'];
$hp=$_POST['hp'];
$ket=$_POST['ket'];
$asalsekolah=$_POST['asalsekolah'];
$info=$_POST['info'];
$kelamin=$_POST['kelamin'];
$gelombang=$_POST['gelombang'];
	$error 	= '';
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT * FROM psbcalon_siswa WHERE kode='$kode' and id<>'$id'")) > 0) $error .= "Error: kode ".$kode." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `psbcalon_siswa` SET `kode`='$kode',`nama`='$nama',`level`='$level',`lokasi`='$lokasi',`tgllahir`='$tgllahir',`namaortu`='$namaortu',`alamat`='$alamat',`kota`='$kota',`telp`='$telp',`hp`='$hp',`ket`='$ket',`asalsekolah`='$asalsekolah',`info`='$info',`kelamin`='$kelamin',`gelombang`='$gelombang' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=tahap1&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `psbcalon_siswa` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$kode=$data['kode'];
$nama=$data['nama'];
$level=$data['level'];
$lokasi=$data['lokasi'];
$tgllahir=$data['tgllahir'];
$namaortu=$data['namaortu'];
$alamat=$data['alamat'];
$kota=$data['kota'];
$telp=$data['telp'];
$hp=$data['hp'];
$ket=$data['ket'];
$asalsekolah=$data['asalsekolah'];
$info=$data['info'];
$kelamin=$data['kelamin'];
$gelombang=$data['gelombang'];
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Calon Siswa</h3></div>';
$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>kode</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" value="'.$kode.'" required></td>
	</tr>
	<tr>
		<td>nama</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"  value="'.$nama.'" required></td>
	</tr>	
	<tr>
		<td>level</td>
		<td>:</td>
		<td><input type="text" name="level" size="25"class="form-control"  value="'.$level.'"required></td>
	</tr>
	<tr>
		<td>lokasi</td>
		<td>:</td>
		<td><input type="text" name="lokasi" size="25"class="form-control"  value="'.$lokasi.'" required></td>
	</tr>
	<tr>
		<td>tgllahir</td>
		<td>:</td>
		<td><input type="text" name="tgllahir" size="25"class="form-control"  value="'.$tgllahir.'" required></td>
	</tr>
	<tr>
		<td>namaortu</td>
		<td>:</td>
		<td><input type="text" name="namaortu" size="25"class="form-control"  value="'.$namaortu.'" required></td>
	</tr>
	<tr>
		<td>alamat</td>
		<td>:</td>
		<td><input type="text" name="alamat" size="25"class="form-control"  value="'.$alamat.'" required></td>
	</tr>
	<tr>
		<td>kota</td>
		<td>:</td>
		<td><input type="text" name="kota" size="25"class="form-control"  value="'.$kota.'" required></td>
	</tr>
	<tr>
		<td>telp</td>
		<td>:</td>
		<td><input type="text" name="telp" size="25"class="form-control"  value="'.$telp.'" required></td>
	</tr>
	<tr>
		<td>hp</td>
		<td>:</td>
		<td><input type="text" name="hp" size="25"class="form-control"  value="'.$hp.'" required></td>
	</tr>
	<tr>
		<td>ket</td>
		<td>:</td>
		<td><input type="text" name="ket" size="25"class="form-control"  value="'.$ket.'" required></td>
	</tr>
	<tr>
		<td>asalsekolah</td>
		<td>:</td>
		<td><input type="text" name="asalsekolah" size="25"class="form-control"  value="'.$asalsekolah.'" required></td>
	</tr>
	<tr>
		<td>info</td>
		<td>:</td>
		<td><input type="text" name="info" size="25"class="form-control" value="'.$info.'" required></td>
	</tr>
	<tr>
		<td>kelamin</td>
		<td>:</td>
		<td><input type="text" name="kelamin" size="25"class="form-control" value="'.$kelamin.'" required></td>
	</tr>
	<tr>
		<td>gelombang</td>
		<td>:</td>
		<td><input type="text" name="gelombang" size="25"class="form-control" value="'.$gelombang.'" required></td>
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


if (in_array($_GET['aksi'],array('del','','import'))){

$admin.='
<table id="example">
    <thead>
        <tr>
            <th>-Kode</th>
			<th>Nama</th>
           <th>Level</th>
           <th>Lokasi</th>
           <th>TglLahir</th>
           <th>Ortu</th>
		   <th>Alamat</th>
		   <th>Kota</th>
		   <th>Telp</th>
		   <th>HP</th>
		   <th>Ket</th>
		   <th>AsalSekolah</th>
		   <th>Info</th>
		   <th>Kelamin</th>
		   <th>Gelombang</th> 
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM psbcalon_siswa" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$kode=$data['kode'];
$nama=$data['nama'];
$level=$data['level'];
$lokasi=$data['lokasi'];
$tgllahir=$data['tgllahir'];
$namaortu=$data['namaortu'];
$alamat=$data['alamat'];
$kota=$data['kota'];
$telp=$data['telp'];
$hp=$data['hp'];
$ket=$data['ket'];
$asalsekolah=$data['asalsekolah'];
$info=$data['info'];
$kelamin=$data['kelamin'];
$gelombang=$data['gelombang'];
$admin.='<tr>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.$level.'</td>
            <td>'.$lokasi.'</td>
            <td>'.$tgllahir.'</td>
            <td>'.$namaortu.'</td>
			<td>'.$alamat.'</td>
			<td>'.$kota.'</td>
			<td>'.$telp.'</td>
			<td>'.$hp.'</td>
			<td>'.$ket.'</td>
			<td>'.$asalsekolah.'</td>
			<td>'.$info.'</td>
			<td>'.$kelamin.'</td>
			<td>'.$gelombang.'</td>
            <td><a href="?pilih=tahap1&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=tahap1&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

}
echo $admin;
?>