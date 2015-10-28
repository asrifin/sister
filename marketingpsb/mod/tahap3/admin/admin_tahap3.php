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
$JS_SCRIPT.= <<<js
<script type="text/javascript">
  $(function() {
$( "#idjoiningfee" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#iddpp" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#iduangseragam" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#iduangbuku" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#iduangmaterial" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
$style_include[] .= '<link rel="stylesheet" media="screen" href="mod/calendar/css/dynCalendar.css" />';
$admin .= '
<script language="javascript" type="text/javascript" src="mod/calendar/js/browserSniffer.js"></script>
<script language="javascript" type="text/javascript" src="mod/calendar/js/dynCalendar.js"></script>';
$script_include[] = $JS_SCRIPT;
$admin .= '<script lnguage="javascript"> function redir(mylist){ if (newurl=mylist.options[mylist.selectedIndex].value)
document.location=newurl;}</script>';
$admin  .='<legend>PPPDB TAHAP 3</legend>';
$admin  .= '<div class="border2">
<table  ><tr align="center">
<td>
<a href="admin.php?pilih=tahap3&mod=yes">Home</a>&nbsp;&nbsp;-
</td>
<td>
<a href="admin.php?pilih=tahap3&mod=yes&aksi=cetak">&nbsp;&nbsp;Cetak PPDB Tahap 3</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
$kode=$_POST['kode'];
$nama=$_POST['nama'];
$diterima=$_POST['diterima'];
$joiningfee=$_POST['joiningfee'];
$dpp=$_POST['dpp'];
$uangseragam=$_POST['uangseragam'];
$uangbuku=$_POST['uangbuku'];
$uangmaterial=$_POST['uangmaterial'];
$error 	= '';
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT * FROM psbcalon_siswa WHERE kode='$kode' and id<>'$id'")) > 0) $error .= "Error: kode ".$kode." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `psbcalon_siswa` SET `joiningfee`='$joiningfee',`dpp`='$dpp',`uangseragam`='$uangseragam',`uangbuku`='$uangbuku',`uangmaterial`='$uangmaterial'WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=tahap3&amp;mod=yes" />';	
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
$diterima=$data['diterima'];
$joiningfee=$data['joiningfee'];
$dpp=$data['dpp'];
$uangseragam=$data['uangseragam'];
$uangbuku=$data['uangbuku'];
$uangmaterial=$data['uangmaterial'];
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Calon Siswa</h3></div>';
$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>kode</td>
		<td>:</td>
		<td>'.$kode.'</td>
	</tr>
	<tr>
		<td>nama</td>
		<td>:</td>
		<td>'.$nama.'</td>
	</tr>	
	<tr>
		<td>Lokasi</td>
		<td>:</td>
		<td>'.getlokasi($lokasi).'</td>
	</tr>
	<tr>
		<td>Golongan</td>
		<td>:</td>
		<td>'.getgolongan($golongan).'</td>
	</tr>
	<tr>
		<td>diterima</td>
		<td>:</td>
		<td>'.$diterima.'</td>
	</tr>
	<tr>
		<td>joiningfee</td>
		<td>:</td>
		<td><input type="text" name="joiningfee"id="idjoiningfee" name="idjoiningfee" size="25"class="form-control"  value="'.$joiningfee.'" ></td>
	</tr>
	<tr>
		<td>dpp</td>
		<td>:</td>
		<td><input type="text" name="dpp" id="iddpp" size="25"class="form-control"  value="'.$dpp.'" ></td>
	</tr>
	<tr>
		<td>uangseragam</td>
		<td>:</td>
		<td><input type="text" name="uangseragam" id="iduangseragam" size="25"class="form-control"  value="'.$uangseragam.'" ></td>
	</tr>
	<tr>
		<td>uangbuku</td>
		<td>:</td>
		<td><input type="text" name="uangbuku" id="iduangbuku" size="25"class="form-control"  value="'.$uangbuku.'" ></td>
	</tr>
	<tr>
		<td>uangmaterial</td>
		<td>:</td>
		<td><input type="text" name="uangmaterial" id="iduangmaterial" size="25"class="form-control"  value="'.$uangmaterial.'" ></td>
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


if (in_array($_GET['aksi'],array('del',''))){

$admin.='
<table id="example"  class="table table-striped">
    <thead>
        <tr>
            <th>Kode</th>
			<th>Nama</th>
           <th>Lokasi</th>
           <th>Golongan</th>
           <th>Diterima</th>
           <th>Joining Fee</th>
		   <th>DPP</th>
		   <th>Uang Seragam</th>
		   <th>Uang Buku</th>
		   <th>Uang Material</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
//$hasil = $koneksi_db->sql_query( "SELECT * FROM psbcalon_siswa where diterima<>''" );
$hasil = $koneksi_db->sql_query( "SELECT * FROM psbcalon_siswa where diterima <> ''" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$kode=$data['kode'];
$nama=$data['nama'];
$golongan=$data['golongan'];
$lokasi=$data['lokasi'];
$diterima=$data['diterima'];
$joiningfee=$data['joiningfee'];
$dpp=$data['dpp'];
$uangseragam=$data['uangseragam'];
$uangbuku=$data['uangbuku'];
$uangmaterial=$data['uangmaterial'];
$admin.='<tr>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.getlokasi($lokasi).'</td>
            <td>'.getgolongan($golongan).'</td>
            <td>'.$diterima.'</td>
            <td>'.$joiningfee.'</td>
			<td>'.$dpp.'</td>
			<td>'.$uangseragam.'</td>
			<td>'.$uangbuku.'</td>
			<td>'.$uangmaterial.'</td>
            <td> <a href="?pilih=tahap3&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="cetak"){
$admin .='<div class="panel-heading"><b>Laporan Tahap 3</b></div>';
$admin .= '<form class="form-inline" method="get" action="cetaktahap3.php" enctype ="multipart/form-data" id="posts" target="_blank">
<table class="table table-striped table-hover">';
$admin .= '<tr>
	<td>Lokasi</td>
		<td>:</td>
	<td><select name="lokasi" class="form-control" id="lokasi" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM departemen ORDER BY nama asc");
$admin .= '<option value="Semua">== Semua Lokasi ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$lokasi)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
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