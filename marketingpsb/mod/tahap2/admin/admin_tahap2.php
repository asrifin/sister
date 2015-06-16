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
$( "#idfollowup" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#idfreetrial" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#idbeliform" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#idpsikotest" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#idtestmandarin" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#idtestenglish" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#idtestmath" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#idwawancaraortu" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#idditerima" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
$script_include[] = $JS_SCRIPT;
$admin .= '<script lnguage="javascript"> function redir(mylist){ if (newurl=mylist.options[mylist.selectedIndex].value)
document.location=newurl;}</script>';
$admin  .='<legend>PPPDB TAHAP 2</legend>';
$admin  .= '<div class="border2">
<table  ><tr align="center">
<td>
<a href="admin.php?pilih=tahap2&mod=yes">Home</a>&nbsp;&nbsp;-
</td>
<td>
<a href="admin.php?pilih=tahap2&mod=yes&aksi=cetak">&nbsp;&nbsp;Cetak PPDB Tahap 2</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
$kode=$_POST['kode'];
$nama=$_POST['nama'];
$ket2=$_POST['ket2'];
$followup=$_POST['followup'];
$freetrial=$_POST['freetrial'];
$beliform=$_POST['beliform'];
$psikotest=$_POST['psikotest'];
$testmandarin=$_POST['testmandarin'];
$testenglish=$_POST['testenglish'];
$testmath=$_POST['testmath'];
$wawancaraortu=$_POST['wawancaraortu'];
$diterima=$_POST['diterima'];
$error 	= '';
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT * FROM psbcalon_siswa WHERE kode='$kode' and id<>'$id'")) > 0) $error .= "Error: kode ".$kode." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `psbcalon_siswa` SET `ket2`='$ket2',`followup`='$followup',`freetrial`='$freetrial',`beliform`='$beliform',`psikotest`='$psikotest',`testmandarin`='$testmandarin',`testenglish`='$testenglish',`testmath`='$testmath',`wawancaraortu`='$wawancaraortu',`diterima`='$diterima' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=tahap2&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `psbcalon_siswa` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$kode=$data['kode'];
$nama=$data['nama'];
$kelompok=$data['kelompok'];
$departemen=$data['departemen'];
$ket2=$data['ket2'];
$followup=$data['followup'];
$freetrial=$data['freetrial'];
$beliform=$data['beliform'];
$psikotest=$data['psikotest'];
$testmandarin=$data['testmandarin'];
$testenglish=$data['testenglish'];
$testmath=$data['testmath'];
$wawancaraortu=$data['wawancaraortu'];
$diterima=$data['diterima'];
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Calon Siswa</h3></div>';
$admin .= '
<form method="post" action="">
<table width="100%"class="table table-condensed">
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
		<td>Departemen</td>
		<td>:</td>
		<td>'.getdepartemen($departemen).'</td>
	</tr>
	<tr>
		<td>Kelompok</td>
		<td>:</td>
		<td>'.getkelompok($kelompok).'</td>
	</tr>

	<tr>
		<td>keterangan</td>
		<td>:</td>
		<td><input type="text" name="ket2" size="25"class="form-control"  value="'.$ket2.'" required></td>
	</tr>
	<tr>
		<td>followup</td>
		<td>:</td>
		<td>
		<input type="text" name="followup" size="25"class="form-control"  value="'.$followup.'"id="idfollowup" >
	<tr>
		<td>freetrial</td>
		<td>:</td>
		<td><input type="text" name="freetrial" size="25"class="form-control"  value="'.$freetrial.'" id="idfreetrial"></td>
	</tr>
	<tr>
		<td>beliform</td>
		<td>:</td>
		<td><input type="text" name="beliform" id="idbeliform" size="25"class="form-control"  value="'.$beliform.'" ></td>
	</tr>
	<tr>
		<td>psikotest</td>
		<td>:</td>
		<td><input type="text" name="psikotest" id="idpsikotest" size="25"class="form-control"  value="'.$psikotest.'" ></td>
	</tr>
	<tr>
		<td>testmandarin</td>
		<td>:</td>
		<td><input type="text" name="testmandarin" id="idmandarin" size="25"class="form-control"  value="'.$testmandarin.'" ></td>
	</tr>
	<tr>
		<td>testenglish</td>
		<td>:</td>
		<td><input type="text" name="testenglish" id="idtestenglish" size="25"class="form-control"  value="'.$testenglish.'" ></td>
	</tr>
	<tr>
		<td>testmath</td>
		<td>:</td>
		<td><input type="text" name="testmath" id="idtestmath" size="25"class="form-control"  value="'.$testmath.'" ></td>
	</tr>
	<tr>
		<td>wawancaraortu</td>
		<td>:</td>
		<td><input type="text" name="wawancaraortu" id="idwawancaraortu" size="25"class="form-control" value="'.$wawancaraortu.'" ></td>
	</tr>
	<tr>
		<td>diterima</td>
		<td>:</td>
		<td><input type="text" name="diterima" id="idditerima" size="25"class="form-control" value="'.$diterima.'" ></td>
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
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kode</th>
			<th>Nama</th>
           <th>Departemen</th>
           <th>Kelompok</th>
           <th>Ket</th>
           <th>Follow Up</th>
		   <th>Free Trial</th>
		   <th>Beli Form</th>
		   <th>Psikotest</th>
		   <th>Test Mandarin</th>
		   <th>Test English</th>
		   <th>Test Math</th>
		   <th>Wawancara Ortu</th>
		   <th>Diterima/Tidak</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM psbcalon_siswa" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$kode=$data['kode'];
$nama=$data['nama'];
$kelompok=$data['kelompok'];
$departemen=$data['departemen'];
$ket2=$data['ket2'];
$followup=$data['followup'];
$freetrial=$data['freetrial'];
$beliform=$data['beliform'];
$psikotest=$data['psikotest'];
$testmandarin=$data['testmandarin'];
$testenglish=$data['testenglish'];
$testmath=$data['testmath'];
$wawancaraortu=$data['wawancaraortu'];
$diterima=$data['diterima'];
$admin.='<tr>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.getdepartemen($departemen).'</td>
            <td>'.getkelompok($kelompok).'</td>
            <td>'.$ket2.'</td>
            <td>'.$followup.'</td>
			<td>'.$freetrial.'</td>
			<td>'.$beliform.'</td>
			<td>'.$psikotest.'</td>
			<td>'.$testmandarin.'</td>
			<td>'.$testenglish.'</td>
			<td>'.$testmath.'</td>
			<td>'.$wawancaraortu.'</td>
			<td>'.$diterima.'</td>
            <td> <a href="?pilih=tahap2&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="cetak"){
$departemen=$_GET['departemen'];
$admin .='<div class="panel-heading"><b>Laporan Tahap 2</b></div>';
$admin .= '<form class="form-inline" method="get" action="cetaktahap2.php" enctype ="multipart/form-data" id="posts" target="_blank">
<table class="table table-striped table-hover">';
$admin .= '<tr>
	<td>Departemen</td>
		<td>:</td>
	<td><select name="departemen" class="form-control" id="departemen" required onchange="redir(this)">';
$hasil = $koneksi_db->sql_query("SELECT * FROM departemen ORDER BY replid asc");
$admin .= '<option value="">== departemen ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$departemen)?"selected":'';
$admin .= '<option value="'.$url_situs.'/admin.php?pilih=tahap2&mod=yes&aksi=cetak&departemen='.$datas['replid'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>kelompok</td>
		<td>:</td>
	<td><select name="kelompok" class="form-control" id="kelompok" required>';
$hasil = $koneksi_db->sql_query("SELECT psb_kelompok.replid,psb_kelompok.kelompok FROM psb_kelompok where psb_kelompok.proses = '$departemen'");
$admin .= '<option value="">== kelompok ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$kelompok)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['kelompok'].'</option>';
}
$admin .='</select></td>
</tr>';
$admin .= '<tr>
	<td>gelombang</td>
		<td>:</td>
	<td><select name="gelombang" class="form-control" id="gelombang" required>';
$hasil = $koneksi_db->sql_query("SELECT psb_proses.replid,psb_proses.proses FROM psb_proses where psb_proses.departemen = '$departemen'");
$admin .= '<option value="">== gelombang ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$gelombang)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['proses'].'</option>';
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