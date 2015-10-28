<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$golongan 		= $_GET['golongan'];
$lokasi 		= $_GET['lokasi'];
$gelombang 		= $_GET['gelombang'];
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

echo "<html><head><title>Laporan Tahap 2</title>";
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
echo'<tr><td colspan="7"><h4>Laporan Tahap 2, Golongan '.getgolongan($golongan).', Gelombang '.getgelombang($gelombang).', Lokasi '.getlokasi($lokasi).'</h4></td></tr>';
echo '
<tr class="border">
            <td>No</td>
            <th>Kode</th>
			<th>Nama</th>
           <td>Lokasi</td>
           <td>Golongan</td>
		   <td>Gelombang</td> 
		   <td>Tingkat</td> 
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
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM psbcalon_siswa $wheregolongan $wherelokasi $wheregelombang  order by id asc");	
while($data = mysql_fetch_array($s)){
$kode=$data['kode'];
$nama=$data['nama'];
$golongan=$data['golongan'];
$lokasi=$data['lokasi'];
$gelombang=$data['gelombang'];
$tingkat=$data['tingkat'];
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
</tr>';
$no++;
}
echo '</tr>';
echo '</table>';
}
/****************************/
echo "</body</html>";

if (isset($_GET['cetak'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
