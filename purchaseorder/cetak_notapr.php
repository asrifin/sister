<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
if(isset($_POST['kode'])){
$kode 		= $_POST['kode'];
}else{
$kode 		= $_GET['kode'];	
}

echo "<html><head><title>Nota Purchase Requisition </title>";
echo '<style type="text/css">
   table { page-break-inside:auto; 
    font-size: 0.9em; /* 14px/16=0.875em */
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
img {
    float: left;
	margin : 5px 5px 0 0;
	padding:1px;
}
</style>';
echo "</head><body>";
echo'
<table align="center"><tr><td>';
echo'<table  width="100%">
<tr><td><img src="images/logo.png" height="70px"><br>
<b>Elyon Christian School</b><br>
Raya Sukomanunggal Jaya 33A, Surabaya 60187</td></tr></table>';
echo'</td></tr><tr><td>';
$no=1;
$query 		= mysql_query ("SELECT * FROM `po_pr` WHERE `nopr` like '$kode'");
$data 		= mysql_fetch_array($query);
$nopr  			= $data['nopr'];
$tgl  			= $data['tgl'];
$namapr  			= $data['namapr'];
$departemenpr  			= $data['departemenpr'];
$tujuanpr  			= $data['tujuanpr'];
$kategorianggaran  			= $data['kategorianggaran'];
	$error 	= '';
		if (!$nopr) $error .= "Error: kode PR tidak terdaftar , silahkan ulangi.<br />";
	if ($error){
		echo '<div class="error">'.$error.'</div>';}else{
		echo '
<table>';
echo '
	<tr>
		<td>Nomor PR</td>
		<td>:</td>
		<td>'.$nopr.'</td>
	</tr>';
echo '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td>'.tanggalindo($tgl).'</td>
	</tr>';
echo '
	<tr>
		<td>Nama Requisition</td>
		<td>:</td>
		<td>'.$namapr.'</td>
	</tr>';	
echo '
	<tr>
		<td>Departemen</td>
		<td>:</td>
		<td>'.getdepartemendaritingkat($departemenpr).' - '.getdepartemen($departemenpr).'</td>
	</tr>';	
	echo '
	<tr>
		<td>Tujuan Pembelian</td>
		<td>:</td>
		<td>'.$tujuanpr.'</td>
	</tr>';	
	echo '
	<tr>
		<td>Kategori Anggaran</td>
		<td>:</td>
		<td>'.getkategorianggaran($kategorianggaran).'</td>
			<td></td>
	</tr>';
echo '</table>';	
echo '<b>Detail</b>';	
echo '
<table>';
echo '	
<tr>
<th class="border"><b>No</b></</th>
<th class="border"><b>Kode</b></</th>
<th class="border"><b>Nama</b></td>
<th class="border"><b>Jumlah</b></</td>
<th class="border"><b>Spesifikasi</b></</th>
	</tr>';
$hasild = $koneksi_db->sql_query("SELECT * FROM `po_prdetail` WHERE `nopr` like '$kode'");
while ($datad =  $koneksi_db->sql_fetchrow ($hasild)){
echo '	
<tr>
<td class="border">'.$no.'</td>
<td class="border">'.$datad["kodebarang"].'</td>
<td class="border">'.getnamabarang($datad["kodebarang"]).'</td>
<td class="border">'.$datad["jumlah"].'</td>
<td class="border">'.$datad["spesifikasi"].'</td>
</tr>';
	$no++;
		}
echo '</table>';	
		}

echo'</td></tr></table>';
		/****************************/
echo "</body</html>";

if (!isset($_GET['detail'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
