<link rel="stylesheet" media="screen" href="includes/media/css/jquery.dataTables.css" />
<script language="javascript" type="text/javascript" src="includes/media/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="includes/media/js/jquery.dataTables.js"></script>
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable( {
    "iDisplayLength":50
});
} );
</script>
<?php
error_reporting(0);
include "includes/excel_reader2.php";
$admin='';
 if( mysql_connect("localhost","$mysql_user","$mysql_password") ){
   mysql_select_db( "$mysql_database" );
}else{
   $admin .= "database gagal";
}
if (!cek_login ()){   
	
$admin .='<p class="judul">Access Denied !!!!!!</p>';
}else{
	$admin .= '<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-list-alt"></i> Siswa</h3>
					<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="admin.php?pilih=importsiswa&amp;mod=yes">Home</a></li>
					</ol>
				</div>
			</div>';
			

if($_GET['aksi']==""){
if(isset($_POST['submit'])){
$lokasi=$_POST['lokasi'];
$golongan=$_POST['golongan'];
$gelombang=$_POST['gelombang'];
$tingkat=$_POST['tingkat'];
  
//nilai awal counter jumlah data yang sukses dan yang gagal diimport
 $sukses = 0;
 $gagal = 0;
 
 $cell   = new Spreadsheet_Excel_Reader($_FILES['upfile']['tmp_name']);
$jumlah = $cell->rowcount($sheet_index=0);
 
$i = 2; // dimulai dari ke dua karena baris pertama berisi title
while( $i<=$jumlah ){

   //$cell->val( baris,kolom )
$kode = $cell->val( $i,1 );
$nama  = $cell->val( $i,2 );
$kelamin = $cell->val( $i,3 );
$tgllahir = $cell->val( $i,4 );
$namaortu = $cell->val( $i,5 );
$telp = '';
$hp = $cell->val( $i,6 );
$email = $cell->val( $i,7 );
$alamat = $cell->val( $i,8 );
$freetrial=$cell->val( $i,9 );
$beliform=$cell->val( $i,10 );
$observasi=$cell->val( $i,11 );
$psikotest=$cell->val( $i,12 );
$joiningfee=$cell->val( $i,13 );
$dpp=$cell->val( $i,14 );
$uangseragam=$cell->val( $i,15 );
$uangbuku=$cell->val( $i,16 );
$ket =$cell->val( $i,17 );
$ket=addslashes($ket);
$ket2='';
$info='sebelum pameran';
$kota ='';
$asalsekolah='';
$followup='';
$testmandarin='';
$testenglish='';
$testmath='';
$wawancaraortu='';
$diterima='';
$uangmaterial='';

$sql  =  "INSERT INTO `psbcalon_siswa`VALUES ('','$kode','$nama','$lokasi','$golongan','$gelombang','$tingkat','$tgllahir','$namaortu','$alamat','$kota','$telp','$hp','$ket','$asalsekolah','$info','$kelamin','$ket2','$followup','$freetrial','$beliform','$psikotest','$testmandarin','$testenglish','$testmath','$wawancaraortu','$diterima','$joiningfee','$dpp','$uangseragam','$uangbuku','$uangmaterial')";
$hasil = mysql_query( $sql );
if($hasil){
$sukses++;
}else{
$gagal++;
}

   $i++;
}
 //tampilkan report hasil import
 $admin .= "<h3> Proses Import Data Siswa </b> Selesai</h3>";
 $admin .= "<p>Jumlah data sukses diimport : ".$sukses."<br>";
 $admin .= "Jumlah data gagal diimport : ".$gagal."<p>";


}
$admin .='<div class="panel-heading"><b>Import Siswa</b></div>';
$admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">
 <tr>
	<td>Lokasi</td>
		<td>:</td>
	<td><select name="lokasi" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM departemen ORDER BY nama asc");
$admin .= '<option value="">== Lokasi ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$lokasi)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
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
	<td>Silakan Pilih File Excel </td>
	<td>:</td>
	<td><input name="upfile" type="file"></td>
 </tr>
 <tr>
	<td></td>
	<td></td>
	<td><input name="submit" type="submit" value="import" class="btn btn-success"></td>
 </tr>
 </table>
 </form>';
}



}






echo $admin;

?>