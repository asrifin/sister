<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$tglmulai 		= $_GET['tglmulai'];
$tglakhir 		= $_GET['tglakhir'];
$kodebarang 		= $_GET['kodebarang'];
$mutasi 		= $_GET['mutasi'];
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
echo'<tr><td colspan="7"><h4>Laporan Stok Barang, Periode '.tanggalindo($tglmulai).' - '.tanggalindo($tglakhir).' ,'.$kodebarang.'</h4></td></tr>';

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
/****************************/
//$st2 = mysql_query ("SELECT * FROM po_alur_stok where (kodebarang='$kodebarang') and (tgl between '$tglmulai' and '$tglakhir' ) and transaksi ='Saldo Awal' limit 1");	
$st2 = mysql_query ("SELECT * FROM pos_alur_stok where transaksi ='Stok Awal' limit 1");	

$datast2 = mysql_fetch_array($st2);
$idsa = $datast2['id'];
$tglsa = $datast2['tgl'];
$transaksisa = $datast2['transaksi'];
$kodesa = $datast2['kode'];
$kodebarangsa = $datast2['kodebarang'];
$jumlahsa = $datast2['jumlah'];
$getnamabarangsa = getnamabarang($kodebarangsa);
if($idsa){
if($kodebarang==$kodebarangsa){	
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.tanggalindo($tglsa).'</td>
<td>'.$transaksisa.'</td>
<td>'.$kodesa.'</td>
<td>'.$kodebarangsa.'</td>
<td>'.$getnamabarangsa.'</td>
<td>'.$jumlahsa.'</td>
</tr>';
$no =2;
$tjumlah =$jumlahsa;
break;
}else{
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.tanggalindo($tglsa).'</td>
<td>'.$transaksisa.'</td>
<td>'.$kodesa.'</td>
<td>'.$kodebarangsa.'</td>
<td>'.$getnamabarangsa.'</td>
<td>'.$jumlahsa.'</td>
</tr>';
$no =2;
$tjumlah =$jumlahsa;	
}
}
/****************************/
if($mutasi!='Stok Awal'){
/********************************/
$st = mysql_query ("SELECT * FROM pos_alur_stok where (tgl between '$tglmulai' and '$tglakhir' ) and transaksi !='Stok Awal' order by id asc");	
while($datast = mysql_fetch_array($st)){
$id = $datast['id'];
$tgl = $datast['tgl'];
$transaksi = $datast['transaksi'];
$kode = $datast['kode'];
$kodebaranga = $datast['kodebarang'];
$jumlah = $datast['jumlah'];
$getnamabarang = getnamabarang($kodebaranga);
if($kodebarang==$kodebarangsa){	
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
break;
}else{
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
	
}
/*
if($transaksi=='Saldo Awal'){
$tjumlah =$jumlah;		
}
*/
if($transaksi=='Pembelian' or $transaksi=='Retur Penjualan' or $transaksi=='Mutasi Masuk'){
$tjumlah +=$jumlah;}
if($transaksi=='Penjualan' or $transaksi=='Retur Pembelian'or $transaksi=='Mutasi Keluar'){
$tjumlah -=$jumlah;
}

}
echo '<tr class="border">
<td colspan="6">Stok Akhir</td>
<td>'.$tjumlah.'</td>
</tr>';
echo '</table>';
}
/****************************/
echo "</body</html>";

if(isset($_GET['cetak'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
