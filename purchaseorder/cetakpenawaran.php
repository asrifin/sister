<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$tglmulai 		= $_GET['tglmulai'];
$tglakhir 		= $_GET['tglakhir'];
$detail 		= $_GET['detail'];
echo "<html><head><title>Laporan Penawaran </title>";
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

if($detail<>'ok'){
echo'<tr><td colspan="7"><h4>Laporan Penawaran, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</h4></td></tr>';
echo '
<tr class="border">
<td>No</td>
<td>No.PN</td>
<td>No.PR</td>
<td>Tanggal</td>
<td>User</td>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM `po_pn` where tgl >= '$tglmulai' and tgl <= '$tglakhir' order by tgl asc");	
while($datas = mysql_fetch_array($s)){
$id = $datas['id'];
$nopn = $datas['nopn'];
$nopr = $datas['nopr'];
$tgl = $datas['tgl'];
$user = $datas['user'];
$urutan = $no + 1;
$lihatslip = '<a href="cetak_notapn.php?kode='.$datas['nopn'].'&lihat=ok"target="new">'.$datas['nopn'].'</a>';
$lihatslippr = '<a href="cetak_notapr.php?kode='.$datas['nopr'].'&lihat=ok"target="new">'.$datas['nopr'].'</a>';
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$lihatslip.'</td>
<td>'.$lihatslippr.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.$user.'</td>
</tr>';
$no++;
}
echo '</table>';
}else{
echo'<tr><td colspan="8"><h4>Laporan Penawaran, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</h4></td></tr>';
echo '
<tr class="border">
<td>No</td>
<td>No.PN</td>
<td>No.PR</td>
<td>Tanggal</td>
<td>Kode Barang</td>
<td>Nama Barang</td>
<td>Harga</td>
<td>Supplier</td>
<td>User</td>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM `po_pn` where tgl >= '$tglmulai' and tgl <= '$tglakhir'  order by tgl asc");	
while($datas = mysql_fetch_array($s)){
$id = $datas['id'];
$nopn = $datas['nopn'];
$nopr = $datas['nopr'];
$tgl = $datas['tgl'];
$user = $datas['user'];
$urutan = $no + 1;
$lihatslippn = '<a href="cetak_notapn.php?kode='.$datas['nopn'].'&lihat=ok"target="new">'.$datas['nopn'].'</a>';
$lihatslippr = '<a href="cetak_notapr.php?kode='.$datas['nopr'].'&lihat=ok"target="new">'.$datas['nopr'].'</a>';
$s2 = mysql_query ("SELECT * FROM `po_pndetail` where nopn = '$nopn'order by id asc");	
while($datas2 = mysql_fetch_array($s2)){
$kodebarang = $datas2['kodebarang'];
$harga = $datas2['harga'];
$supplier = $datas2['supplier'];
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$lihatslippn.'</td>
<td>'.$lihatslippr.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.$kodebarang.'</td>
<td>'.getnamabarang($kodebarang).'</td>
<td>'.$harga.'</td>
<td>'.getnamasupplier($supplier).'</td>
<td>'.$user.'</td>
</tr>';
$no++;
}
}
/*
echo '
<tr class="border" align="right">
<td colspan="12"><b>Grand Netto :</b></td>
<td>'.rupiah_format($tnetto).'</td>
<td></td>
</tr>';*/
echo '</table>';
}
/****************************/
echo "</body</html>";
/*
if (isset($_GET['tglmulai'])){
echo "<script language=javascript>
window.print();
</script>";
}
*/
?>
