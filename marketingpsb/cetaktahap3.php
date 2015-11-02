<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$golongan 		= $_GET['golongan'];
$lokasi 		= $_GET['lokasi'];
$gelombang 		= $_GET['gelombang'];
$tingkat 		= $_GET['tingkat'];
if($golongan=='Semua'){
         $wheregolongan="";
}else{
         $wheregolongan="and golongan='$golongan'";
}
if($lokasi=='Semua'){
         $wherelokasi="";
}else{
         $wherelokasi="and lokasi='$lokasi'";
}
if($gelombang=='Semua'){
         $wheregelombang="";
}else{
         $wheregelombang="and gelombang='$gelombang'";
}
if($tingkat=='Semua'){
         $wheretingkat="";
}else{
         $wheretingkat="and tingkat='$tingkat'";
}
echo "<html><head><title>Laporan Tahap 3</title>";
echo '<style type="text/css">
   table { page-break-inside:auto; 
    font-size: 0.8em; /* 14px/16=0.875em */
font-family: "Times New Roman", Times, serif;
   }
   tr    { page-break-inside:avoid; page-break-after:auto }
	table {
    border-collapse: collapse;}
	th,td {
    padding: 5px;
}
.border{
	border: 1px solid black;
}
.border td{
	border: 1px solid black;
}
body {
	margin		: 0;
	padding		: 0;
    font-size: 1em; /* 14px/16=0.875em */
font-family: "Times New Roman", Times, serif;
    margin			: 2px 0 5px 0;
}
</style>';
echo "</head><body>";
echo'
<table align="center">
<tr><td colspan="7"><img style="margin-right:5px; margin-top:5px; padding:1px; background:#ffffff; float:left;" src="images/logo.png" height="70px"><br>
<b>Elyon Christian School</b><br>
Raya Sukomanunggal Jaya 33A, Surabaya 60187</td></tr>';

if(!$detail){
echo'<tr><td colspan="7"><h4>Laporan Tahap 3, Golongan :'.getgolongan($golongan).', Gelombang :'.getgelombang($gelombang).', Lokasi :'.getlokasi($lokasi).', Tingkat :'.gettingkat($tingkat).'</h4></td></tr>';
echo '
<tr class="border">
            <td>No</td>
            <th>Kode</th>
			<th>Nama</th>
           <td>Lokasi</td>
           <td>Golongan</td>
		   <td>Gelombang</td> 
		   <td>Tingkat</td> 
           <th>Diterima</th>
           <th>Joining Fee</th>
		   <th>DPP</th>
		   <th>Uang Seragam</th>
		   <th>Uang Buku</th>
		   <th>Uang Material</th>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM psbcalon_siswa where id<>'' and joiningfee<>'' $wheregolongan $wherelokasi $wheregelombang $wheretingkat order by id asc");	
while($data = mysql_fetch_array($s)){
$kode=$data['kode'];
$nama=$data['nama'];
$golongan=$data['golongan'];
$lokasi=$data['lokasi'];
$gelombang=$data['gelombang'];
$tingkat=$data['tingkat'];
$diterima=$data['diterima'];
$joiningfee=$data['joiningfee'];
$dpp=$data['dpp'];
$uangseragam=$data['uangseragam'];
$uangbuku=$data['uangbuku'];
$uangmaterial=$data['uangmaterial'];
$urutan = $no + 1;
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.getlokasi($lokasi).'</td>
            <td>'.getgolongan($golongan).'</td>
			<td>'.getgelombang($gelombang).'</td>
			<td>'.gettingkat($tingkat).'</td>
            <td>'.tglindo($diterima).'</td>
            <td>'.tglindo($joiningfee).'</td>
			<td>'.tglindo($dpp).'</td>
			<td>'.tglindo($uangseragam).'</td>
			<td>'.tglindo($uangbuku).'</td>
			<td>'.tglindo($uangmaterial).'</td>
</tr>';
$no++;
}
echo '</tr>';
echo '</table>';
}
/****************************/
echo "</body</html>";

/*
if (isset($_GET['gelombang'])){
echo "<script language=javascript>
window.print();
</script>";
}
*/
?>
