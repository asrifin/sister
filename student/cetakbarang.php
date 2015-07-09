<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$tglmulai 		= $_GET['tglmulai'];
$tglakhir 		= $_GET['tglakhir'];
$kodebarang 		= $_GET['kodebarang'];
$getnamabarang = getnamabarang($kodebarang);
$wherekodebarang="and kodebarang='$kodebarang'";

echo "<html><head><title>Laporan Stok Barang </title>";
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
echo'<tr><td colspan="7"><h4>Laporan Stok Barang, Periode '.tanggalindo($tglmulai).' - '.tanggalindo($tglakhir).'<br><br>Barang : '.getnamabarang($kodebarang).'</h4></td></tr>';

echo '<tr class="border">
<td>No</td>
<td>Tgl</td>
<td>Transaksi</td>
<td>Kode Referensi</td>
<td>Kode Barang</td>
<td>Nama Barang</td>
<td>Jumlah</td>
</tr>';
$no =1;

/**************STOK SEBELUM********/
$st = mysql_query ("SELECT * FROM pos_alur_stok where tgl < '$tglmulai' $wherekodebarang order by id asc");	
while($datast = mysql_fetch_array($st)){
$id = $datast['id'];
$tgl = $datast['tgl'];
$transaksi = $datast['transaksi'];
$kode = $datast['kode'];
$kodebaranga = $datast['kodebarang'];
$jumlahsb = $datast['jumlah'];
$tjumlah +=$jumlahsb;
}
if($tjumlah){
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.tanggalindo($tglmulai).'</td>
<td> Stok Sebelumnya </td>
<td> - </td>
<td>'.$kodebarang.'</td>
<td>'.$getnamabarang.'</td>
<td>'.$tjumlah.'</td>
</tr>';
$no++;
}
/************* STOK BETWEEN ************/
$st = mysql_query ("SELECT * FROM pos_alur_stok where tgl >='$tglmulai' and tgl <='$tglakhir' $wherekodebarang order by id asc");	
while($datast = mysql_fetch_array($st)){
$id = $datast['id'];
$tgl = $datast['tgl'];
$transaksi = $datast['transaksi'];
$kode = $datast['kode'];
$kodebaranga = $datast['kodebarang'];
$jumlah = $datast['jumlah'];
$getnamabarang = getnamabarang($kodebaranga);
if($transaksi=='Penjualan' or $transaksi=='Retur Pembelian'or $transaksi=='Mutasi Keluar'){
$jumlah =$jumlah*(-1);
}
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.$transaksi.'</td>
<td>'.$kode.'</td>
<td>'.$kodebaranga.'</td>
<td>'.$getnamabarang.'</td>
<td>'.$jumlah.'</td>
</tr>';
$no++;
$tjumlah +=$jumlah;
}
echo '<tr class="border">
<td colspan="6">Stok Akhir</td>
<td>'.$tjumlah.'</td>
</tr>';
echo '</table>';
/****************************/
echo "</body</html>";

if(isset($_GET['cetak'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
