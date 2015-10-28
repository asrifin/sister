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
$JS_SCRIPT.= <<<js
<script type="text/javascript">
  $(function() {
$( "#idtgllahir" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;

$script_include[] = $JS_SCRIPT;
$admin .= '<script lnguage="javascript"> function redir(mylist){ if (newurl=mylist.options[mylist.selectedIndex].value)
document.location=newurl;}</script>';
$admin  .='<legend>PPPDB TAHAP 1</legend>';
$admin  .= '<div class="border2">
<table  ><tr align="center">
<td>
<a href="admin.php?pilih=tahap1&mod=yes">Home</a>&nbsp;&nbsp;-
</td>
<td>
<a href="admin.php?pilih=tahap1&mod=yes&aksi=add">&nbsp;&nbsp;Tambah Calon Siswa</a>&nbsp;&nbsp;-
</td>
<td>
<a href="admin.php?pilih=tahap1&mod=yes&aksi=cetak">&nbsp;&nbsp;Cetak PPDB Tahap 1</a>&nbsp;&nbsp;
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
$lokasi=$_POST['lokasi'];
$golongan=$_POST['golongan'];
$gelombang=$_POST['gelombang'];
$tingkat=$_POST['tingkat'];
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

	$error 	= '';
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT * FROM psbcalon_siswa WHERE kode='$kode'")) > 0) $error .= "Error: kode ".$kode." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `psbcalon_siswa` (`kode`,`nama`,`lokasi`,`golongan`,`gelombang`,`tingkat`,`tgllahir`,`namaortu`,`alamat`,`kota`,`telp`,`hp`,`ket`,`asalsekolah`,`info`,`kelamin`) VALUES ('$kode','$nama','$lokasi','$golongan','$gelombang','$tingkat','$tgllahir','$namaortu','$alamat','$kota','$telp','$hp','$ket','$asalsekolah','$info','$kelamin')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=tahap1&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
	}

}
$kode     		= !isset($kode) ? '' : $kode;
$nama     		= !isset($nama) ? '' : $nama;
$lokasi     		= !isset($lokasi) ? '' : $lokasi;
$golongan     		= !isset($golongan) ? '' : $golongan;
$gelombang     		= !isset($gelombang) ? '' : $gelombang;
$tingkat     		= !isset($tingkat) ? '' : $tingkat;
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


$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Calon Siswa</h3></div>';
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
	<td>Lokasi</td>
		<td>:</td>
	<td><select name="lokasi" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM psbcalon_lokasi ORDER BY nama asc");
$admin .= '<option value="">== Lokasi ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$lokasi)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Golongan</td>
		<td>:</td>
	<td><select name="golongan" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * from psb_golongan");
$admin .= '<option value="">== Golongan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$golongan)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['golongan'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Gelombang</td>
		<td>:</td>
	<td><select name="gelombang" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * from psb_gelombang");
$admin .= '<option value="">== Gelombang ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$gelombang)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['gelombang'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Tingkat</td>
		<td>:</td>
	<td><select name="tingkat" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * from aka_tingkat");
$admin .= '<option value="">== Tingkat ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$tingkat)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['tingkat'].'</option>';
}
$admin .='</select></td>
</tr>
	<tr>
		<td>Tanggal Lahir</td>
		<td>:</td>
		<td><input type="text" name="tgllahir" size="25"class="form-control" id="idtgllahir" required></td>
	</tr>
	<tr>
		<td>Nama Orang Tua</td>
		<td>:</td>
		<td><input type="text" name="namaortu" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Alamat</td>
		<td>:</td>
		<td><input type="text" name="alamat" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Kota</td>
		<td>:</td>
		<td><input type="text" name="kota" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Telepon</td>
		<td>:</td>
		<td><input type="text" name="telp" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>HP</td>
		<td>:</td>
		<td><input type="text" name="hp" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Keterangan</td>
		<td>:</td>
		<td><input type="text" name="ket" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Asalsekolah</td>
		<td>:</td>
		<td><input type="text" name="asalsekolah" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Info</td>
		<td>:</td>
		<td><input type="text" name="info" size="25"class="form-control" required></td>
	</tr>
<tr>
	<td>Jenis Kelamin</td>
		<td>:</td>
	<td><select name="kelamin" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_kelamin ORDER BY id asc");
$admin .= '<option value="">== Jenis Kelamin ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$kelamin)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['kelamin'].'</option>';
}
$admin .='</select></td>
</tr>
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
$golongan=$_POST['golongan'];
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
$tingkat=$_POST['tingkat'];
	$error 	= '';
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT * FROM psbcalon_siswa WHERE kode='$kode' and id<>'$id'")) > 0) $error .= "Error: kode ".$kode." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `psbcalon_siswa` SET `kode`='$kode',`nama`='$nama',`golongan`='$golongan',`lokasi`='$lokasi',`tgllahir`='$tgllahir',`namaortu`='$namaortu',`alamat`='$alamat',`kota`='$kota',`telp`='$telp',`hp`='$hp',`ket`='$ket',`asalsekolah`='$asalsekolah',`info`='$info',`kelamin`='$kelamin',`gelombang`='$gelombang',`tingkat`='$tingkat' WHERE `id`='$id'" );
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
$golongan=$data['golongan'];
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
$tingkat=$data['tingkat'];
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Calon Siswa</h3></div>';
$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" value="'.$kode.'" required></td>
	</tr>
	<tr>
		<td>Nama</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control"  value="'.$nama.'" required></td>
	</tr>	
<tr>
	<td>Lokasi</td>
		<td>:</td>
	<td><select name="lokasi" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM psbcalon_lokasi ORDER BY nama asc");
$admin .= '<option value="">== Lokasi ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$lokasi)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Golongan</td>
		<td>:</td>
	<td><select name="golongan" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * from psb_golongan");
$admin .= '<option value="">== Golongan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$golongan)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['golongan'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Gelombang</td>
		<td>:</td>
	<td><select name="gelombang" class="form-control"required>';
$hasil = $koneksi_db->sql_query("SELECT * from psb_gelombang");
$admin .= '<option value="">== Gelombang ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$gelombang)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['gelombang'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Tingkat</td>
		<td>:</td>
	<td><select name="tingkat" class="form-control"required>';
$hasil = $koneksi_db->sql_query("SELECT * from aka_tingkat");
$admin .= '<option value="">== Tingkat ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$tingkat)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['tingkat'].'</option>';
}
$admin .='</select></td>
</tr>
	<tr>
		<td>Tanggal Lahir</td>
		<td>:</td>
		<td><input type="text" name="tgllahir" size="25"class="form-control"   id="idtgllahir"value="'.$tgllahir.'" required></td>
	</tr>
	<tr>
		<td>Nama Orang Tua</td>
		<td>:</td>
		<td><input type="text" name="namaortu" size="25"class="form-control"  value="'.$namaortu.'" required></td>
	</tr>
	<tr>
		<td>Alamat</td>
		<td>:</td>
		<td><input type="text" name="alamat" size="25"class="form-control"  value="'.$alamat.'" required></td>
	</tr>
	<tr>
		<td>Kota</td>
		<td>:</td>
		<td><input type="text" name="kota" size="25"class="form-control"  value="'.$kota.'" required></td>
	</tr>
	<tr>
		<td>Telepon</td>
		<td>:</td>
		<td><input type="text" name="telp" size="25"class="form-control"  value="'.$telp.'" required></td>
	</tr>
	<tr>
		<td>HP</td>
		<td>:</td>
		<td><input type="text" name="hp" size="25"class="form-control"  value="'.$hp.'" required></td>
	</tr>
	<tr>
		<td>Keterangan</td>
		<td>:</td>
		<td><input type="text" name="ket" size="25"class="form-control"  value="'.$ket.'" required></td>
	</tr>
	<tr>
		<td>Asal Sekolah</td>
		<td>:</td>
		<td><input type="text" name="asalsekolah" size="25"class="form-control"  value="'.$asalsekolah.'" required></td>
	</tr>
	<tr>
		<td>Info</td>
		<td>:</td>
		<td><input type="text" name="info" size="25"class="form-control" value="'.$info.'" required></td>
	</tr>
<tr>
	<td>Jenis Kelamin</td>
		<td>:</td>
	<td><select name="kelamin" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM hrd_kelamin ORDER BY id asc");
$admin .= '<option value="">== Jenis Kelamin ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$kelamin)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['kelamin'].'</option>';
}
$admin .='</select></td>
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
<table id="example"class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>Kode</th>
			<th>Nama</th>
           <th>Lokasi</th>
           <th>Golongan</th>
		   <th>Gelombang</th> 
		   <th>Tingkat</th> 
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
		   <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM psbcalon_siswa" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$kode=$data['kode'];
$nama=$data['nama'];
$lokasi=$data['lokasi'];
$golongan=$data['golongan'];
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
$tingkat=$data['tingkat'];
$admin.='<tr>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.getlokasi($lokasi).'</td>
            <td>'.getgolongan($golongan).'</td>
			<td>'.getgelombang($gelombang).'</td>
			<td>'.gettingkat($tingkat).'</td>
			<td>'.$tgllahir.'</td>
            <td>'.$namaortu.'</td>
			<td>'.$alamat.'</td>
			<td>'.$kota.'</td>
			<td>'.$telp.'</td>
			<td>'.$hp.'</td>
			<td>'.$ket.'</td>
			<td>'.$asalsekolah.'</td>
			<td>'.$info.'</td>
			<td>'.getkelamin($kelamin).'</td>
<td><a href="?pilih=tahap1&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=tahap1&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="cetak"){
$admin .='<div class="panel-heading"><b>Laporan Tahap 1</b></div>';
$admin .= '<form class="form-inline" method="get" action="cetaktahap1.php" enctype ="multipart/form-data" id="posts" target="_blank">
<table class="table table-striped table-hover">';
$admin .= '<tr>
	<td>Lokasi</td>
		<td>:</td>
	<td><select name="lokasi" class="form-control" id="lokasi" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM psbcalon_lokasi ORDER BY nama asc");
$admin .= '<option value="Semua">== Semua Lokasi ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$lokasi)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Golongan</td>
		<td>:</td>
	<td><select name="golongan" class="form-control" id="golongan" required>';
$hasil = $koneksi_db->sql_query("SELECT * from psb_golongan order by replid asc");
$admin .= '<option value="Semua">== Semua Golongan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$golongan)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['golongan'].'</option>';
}
$admin .='</select></td>
</tr>';
$admin .= '<tr>
	<td>gelombang</td>
		<td>:</td>
	<td><select name="gelombang" class="form-control" id="gelombang" required>';
$hasil = $koneksi_db->sql_query("SELECT * from psb_gelombang order by replid asc");
$admin .= '<option value="Semua">== Semua Gelombang ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$gelombang)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['gelombang'].'</option>';
}
$admin .='</select></td>
</tr>';

$admin .= '<tr>
	<td></td>
	<td><input type="submit" value="Cetak" name="submit" class="btn btn-success"></td>
	</tr>
</table></form>';
$admin .= '</table>';
$admin .= "* Apabila tidak dapat melakukan print, klik kanan pilih open link New Tab";
}

}
echo $admin;
?>