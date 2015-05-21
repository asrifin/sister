<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$bulan 		= $_GET['bulan'];
$tahun 		= $_GET['tahun'];

echo "<html><head><title>Laporan Laba/Rugi </title>";
echo '<style type="text/css">
   table { page-break-inside:auto; 
    font-size: 0.8em; /* 14px/16=0.875em */
font-family: "Times New Roman", Times, serif;
   }

.border{
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
<table align="center" class="border">
<tr><td colspan="7"><img style="margin-right:5px; margin-top:5px; padding:1px; background:#ffffff; float:left;" src="images/logo.png" height="70px"><br>
<b>Elyon Christian School</b><br>
Raya Sukomanunggal Jaya 33A, Surabaya 60187</td></tr>';

echo'<tr><td colspan="8"><h4>Laporan Rugi Laba, Bulan '.getbulan($bulan).', Tahun '.($tahun).'</h4></td></tr>';
echo'<tr><td colspan="8">';
/****************************/
echo'<div class="panel-heading"><b>Pendapatan Barang dan Jasa</b></div>';
echo '
<table class="table table-striped table-hover">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$idjenis=$data['id'];
$namajenis=$data['nama'];
//$s2 = mysql_query ("SELECT sum(subtotal) as subtotal,jenis as kodejenis FROM `pos_penjualandetail` where jenis = '$idjenis'");	
$s2 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualan p,pos_penjualandetail pd where month(p.tgl)='$bulan' and year(p.tgl)='$tahun' and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");
$datas2 = mysql_fetch_array($s2);
$subtotal = $datas2['subtotal'];
$kodejenis = $datas2['kodejenis'];
$subtotalbayar += $datas2['subtotal'];
//$s3 = mysql_query ("SELECT sum(subtotal) as subtotal,jenis as kodejenis FROM `pos_penjualanjasadetail` where jenis = '$idjenis'");	
$s3 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualanjasa p,pos_penjualanjasadetail pd where month(p.tgl)='$bulan' and year(p.tgl)='$tahun' and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");
$datas3 = mysql_fetch_array($s3);
$subtotal = $datas3['subtotal'];
$kodejenis = $datas3['kodejenis'];
$subtotalbayar += $datas3['subtotal'];
echo'<tr>
		<td width="200px">Pendapatan '.$namajenis.' :</td>
		<td>'.rupiah_format($subtotalbayar).'</td>
	</tr>';
$grandsubtotalbayar +=$subtotalbayar;
$subtotalbayar='0';
}
echo'<tr>
		<td width="200px"><b>Total :</td>
		<td>'.rupiah_format($grandsubtotalbayar).'</b></td>
	</tr>';
echo '</table>';
/////////////////////////////////
echo'<div class="panel-heading"><b>Biaya - Biaya</b></div>';
echo '
<table class="table table-striped table-hover">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$idjenis=$data['id'];
$namajenis=$data['nama'];
//$s4 = mysql_query ("SELECT sum(subtotal) as subtotal,jenis as kodejenis FROM `pos_penjualanbiayadetail` where jenis = '$idjenis'");
$s4 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualanbiaya p,pos_penjualanbiayadetail pd where month(p.tgl)='$bulan' and year(p.tgl)='$tahun' and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");	
$datas4 = mysql_fetch_array($s4);
$subtotal = $datas4['subtotal'];
$kodejenis = $datas4['kodejenis'];
$subtotalbiaya += $datas4['subtotal'];
echo'<tr>
		<td width="200px">Biaya '.$namajenis.' :</td>
		<td>'.rupiah_format($subtotalbiaya).'</td>
	</tr>';
$grandsubtotalbiaya +=$subtotalbiaya;
	$subtotalbiaya='0';
}
echo'<tr>
		<td width="200px"><b>Total :</td>
		<td>'.rupiah_format($grandsubtotalbiaya).'</b></td>
	</tr>';
echo'</table>';
echo'<div class="panel-heading"><b>Biaya Bulanan</b></div>';
echo'
<table class="table table-striped table-hover">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_biayabulanan where bulan='$bulan' and tahun ='$tahun'" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$namabb=$data['nama'];
$subtotalbb=$data['subtotal'];
$grandtotalbb+=$data['subtotal'];
echo'<tr>
		<td width="200px">'.$namabb.'</td>
		<td>'.rupiah_format($subtotalbb).'</td>
	</tr>';
}
echo'<tr>
		<td width="200px"><b>Total :</td>
		<td>'.rupiah_format($grandtotalbb).'</b></td>
	</tr>';
echo '</table>';
$labarugi = $grandsubtotalbayar - $grandsubtotalbiaya - $grandtotalbb;
echo'<div class="panel-heading"><b>Laba / Rugi :  '.rupiah_format($labarugi).'</b></div>';
/******************************/
echo '</td></tr>';
echo '</table>';
echo "</body</html>";

if (isset($_GET['bulan'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
