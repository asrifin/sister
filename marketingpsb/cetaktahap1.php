<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$kelompok 		= $_GET['kelompok'];
$gelombang 		= $_GET['gelombang'];

echo "<html><head><title>Laporan Tahap 1</title>";
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
echo'<tr><td colspan="7"><h4>Laporan Tahap 1, Kelompok '.getkelompok($kelompok).', Gelombang '.getgelombang($gelombang).'</h4></td></tr>';
echo '
<tr class="border">
            <td>No</td>
            <td>Kode</td>
			<td>Nama</td>
           <td>Departemen</td>
           <td>Kelompok</td>
           <td>TglLahir</td>
           <td>Ortu</td>
		   <td>Alamat</td>
		   <td>Kota</td>
		   <td>Telp</td>
		   <td>HP</td>
		   <td>Ket</td>
		   <td>AsalSekolah</td>
		   <td>Info</td>
		   <td>Kelamin</td>
		   <td>Gelombang</td> 
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM psbcalon_siswa where kelompok = '$kelompok' and gelombang = '$gelombang'  order by id asc");	
while($data = mysql_fetch_array($s)){
$kode=$data['kode'];
$nama=$data['nama'];
$kelompok=$data['kelompok'];
$departemen=$data['departemen'];
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
$urutan = $no + 1;
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.getdepartemen($departemen).'</td>
            <td>'.getkelompok($kelompok).'</td>
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
			<td>'.getgelombang($gelombang).'</td>
</tr>';
$no++;
}
echo '</tr>';
echo '</table>';
}
/****************************/
echo "</body</html>";

if (isset($_GET['gelombang'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
