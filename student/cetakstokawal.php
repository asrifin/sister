<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$kodejenis 		= $_GET['kodejenis'];
$namakodejenis 		= getjenis($_GET['kodejenis']);
if($namakodejenis==''){
$namakodejenis ='Semua';
}
echo "<html><head><title>Laporan Stok Awal </title>";
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
img {
    float: left;
	margin : 5px 5px 0 0;
	padding:1px;
}
</style>';
echo "</head><body>";
echo'
<table align="center">
<tr><td colspan="7"><img src="images/logo.png" height="70px"><br>
<b>Elyon Christian School</b><br>
Raya Sukomanunggal Jaya 33A, Surabaya 60187</td></tr>';
echo'<tr><td colspan="7"><h4>Laporan Stok Awal Barang, Jenis '.$namakodejenis.'</h4></td></tr>';

echo '<tr class="border">
<td>No</td>
<td>Tgl</td>
<td>Transaksi</td>
<td>Kode Referensi</td>
<td>Kode Barang</td>
<td>Nama Barang</td>
<td>Stok Awal</td>
<td>Stok Akhir</td>
</tr>';
$no =1;
/****************************/
$st2 = mysql_query ("SELECT * FROM pos_alur_stok where transaksi like'Stok Awal'");	

while($datast2 = mysql_fetch_array($st2)){
$idsa = $datast2['id'];
$tglsa = $datast2['tgl'];
$transaksi = $datast2['transaksi'];
$kodebarangsa = $datast2['kodebarang'];
$jumlahsa = $datast2['jumlah'];
$getnamabarangsa = getnamabarang($kodebarangsa);
$getjenisbarang = getjenisbarang($kodebarangsa);
$getidjenisbarang=getidjenisbarang($kodebarangsa);
$getstokbarang=getstokbarang($kodebarangsa);
if($kodejenis!=''){
if($getidjenisbarang==$kodejenis){
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.tanggalindo($datast2['tgl']).'</td>
<td>'.$datast2['transaksi'].'</td>
<td>'.$datast2['kode'].'</td>
<td>'.$kodebarangsa.'</td>
<td>'.$getnamabarangsa.'</td>
<td>'.$datast2['jumlah'].'</td>
<td>'.$getstokbarang.'</td>
</tr>';
}}else{
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.tanggalindo($datast2['tgl']).'</td>
<td>'.$datast2['transaksi'].'</td>
<td>'.$datast2['kode'].'</td>
<td>'.$kodebarangsa.'</td>
<td>'.$getnamabarangsa.'</td>
<td>'.$datast2['jumlah'].'</td>
<td>'.$getstokbarang.'</td>
</tr>';	
	
}
}
echo '</table>';
/****************************/
echo "</body</html>";

if(isset($_GET['cetak'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
