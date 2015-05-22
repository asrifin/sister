<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$tglmulai 		= $_GET['tglmulai'];
$tglakhir 		= $_GET['tglakhir'];
$detail 		= $_GET['detail'];

echo "<html><head><title>Laporan Retur Pembelian </title>";
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
<tr><td colspan="7"><img style="margin-right:5px; margin-top:5px; padding:1px; background:#ffffff; float:left;" src="images/logo.png" height="70px"><br><br>
<b>Elyon Christian School</b><br>
Raya Sukomanunggal Jaya 33A, Surabaya 60187</td></tr>';

if(!$detail){
echo'<tr><td colspan="7"><h4>Laporan Retur Pembelian, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</h4></td></tr>';
echo '
<tr class="border">
<td>No</td>
<td>No.Retur</td>
<td>Tanggal</td>
<td>No.Invoice</td>
<td>Supplier</td>
<td>Total</td>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM `po_pembelianretur` where tgl >= '$tglmulai' and tgl <= '$tglakhir' order by tgl asc");	
while($datas = mysql_fetch_array($s)){
$id = $datas['id'];
$noretur = $datas['noretur'];
$noinvoice = $datas['noinvoice'];
$tgl = $datas['tgl'];
$kodesupplier = $datas['kodesupplier'];
$total = $datas['total'];
$user = $datas['user'];
$urutan = $no + 1;
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$noretur.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.$noinvoice.'</td>
<td>'.getnamasupplier($kodesupplier).'</td>
<td>'.rupiah_format($total).'</td>
</tr>';
$no++;
$tnetto+=$total;
}
echo '
<tr class="border" align="right">
<td colspan="5"><b>Grand Total :</b></td>
<td>'.rupiah_format($tnetto).'</td>
</tr>';
echo '</table>';
}else{
echo'<tr><td colspan="8"><h4>Laporan Retur Pembelian, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</h4></td></tr>';
echo '
<tr class="border">
<td>No</td>
<td>No.Retur</td>
<td>Tanggal</td>
<td>No.Invoice</td>
<td>Supplier</td>
<td>Kode Barang</td>
<td>Nama Barang</td>
<td>Harga</td>
<td>Jumlah</td>
<td>Total</td>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM `po_pembelianretur` where tgl >= '$tglmulai' and tgl <= '$tglakhir' $wherestatus order by tgl asc");	
while($datas = mysql_fetch_array($s)){
$id = $datas['id'];
$noretur = $datas['noretur'];
$noinvoice = $datas['noinvoice'];
$tgl = $datas['tgl'];
$kodesupplier = $datas['kodesupplier'];
$carabayar = $datas['carabayar'];
$user = $datas['user'];
$discount = $datas['discount'];
$totaldiscount += $discount;
$urutan = $no + 1;
$s2 = mysql_query ("SELECT * FROM `po_pembelianreturdetail` where noretur = '$noretur'group by id asc");	
while($datas2 = mysql_fetch_array($s2)){
$kodebarang = $datas2['kodebarang'];
$jumlah = $datas2['jumlah'];
$harga = $datas2['harga'];

$subtotal = $harga*$jumlah;
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$noretur.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.$noinvoice.'</td>
<td>'.getnamasupplier($kodesupplier).'</td>
<td>'.$kodebarang.'</td>
<td>'.getnamabarang($kodebarang).'</td>
<td>'.rupiah_format($harga).'</td>
<td>'.$jumlah.'</td>
<td>'.rupiah_format($subtotal).'</td>
</tr>';
$no++;
$grandtotal+=$subtotal;
}
}
echo '
<tr class="border" align="right">
<td colspan="9"><b>Grand Total :</b></td>
<td>'.rupiah_format($grandtotal).'</td>
</tr>';
echo '</table>';
}
/****************************/
echo "</body</html>";

if (isset($_GET['tglmulai'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
