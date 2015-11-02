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
	$telp = $cell->val( $i,6 );
	$hp = $cell->val( $i,6 );
	$email = $cell->val( $i,7 );
	$alamat = $cell->val( $i,8 );
	$freetrial=$cell->val( $i,9 );

$beliform=$cell->val( $i,10 );
	$observasi=$cell->val( $i,11 );
$psikotest=$cell->val( $i,12 );
$joiningfee=$cell->val( $i,13 );
$dpp=$cell->valval( $i,14 );
$uangseragam=$cell->val( $i,15 );
$uangbuku=$cell->val( $i,16 );
	$info =$cell->val( $i,17 );
$info=addslashes($info);
if($username<>'' and $password<>''){
$hasil  =  "INSERT INTO `psbcalon_siswa`VALUES ('','$kode','$nama','$lokasi','$golongan','$gelombang','$tingkat','$tgllahir','$namaortu','$alamat','$kota','$telp','$hp','$ket','$asalsekolah','$info','$kelamin','$info','$followup','$kelamin')";
$sql ="INSERT INTO `useraura` (`user`,`password`,`nama`) VALUES ('$username','$password','$nama')";
$hasil = mysql_query( $sql );
if($hasil){
$sukses++;
}else{
$gagal++;
}
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
		<td>Kelas</td>
		<td>:</td>
		<td>
<select name="kelas" class="form-control">';
$hasil = $koneksi_db->sql_query("SELECT * FROM kelas ORDER BY kelas");
$admin .= '<option value="">== Pilih Kelas ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['kelas'].'</option>';
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
	<td><a href="mod/importsiswa/admin/importsiswa.xls">importsiswa.xls</a></td>
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