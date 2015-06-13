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

echo'<tr><td colspan="8"><h4><b>laporan Rugi Laba</b> , Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</h4></td></tr>';
echo'<tr><td colspan="8">';
/****************************/
echo'<div class="panel-heading"><b>Pendapatan Barang dan Jasa</b></div>';
echo'<div class="panel-heading"><b>Pendapatan Barang dan Jasa</b> , Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</div>';
echo '
<table class="table table-striped table-hover">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk" );
echo'<tr>
		<td width="300px"><b>Jenis</b></td>
		<td><b>Pendapatan</b></td>
		<td><b>Biaya</b></td>
		<td><b>Laba/Rugi</b></td>
		</tr>
		';
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$idjenis=$data['id'];
$namajenis=$data['nama'];
$s2 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualan p,pos_penjualandetail pd where p.tgl >= '$tglmulai'  and p.tgl <= '$tglakhir'  and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");
$datas2 = mysql_fetch_array($s2);
$subtotal = $datas2['subtotal'];
$kodejenis = $datas2['kodejenis'];
$subtotalbayar += $datas2['subtotal'];
$s3 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualanjasa p,pos_penjualanjasadetail pd where p.tgl >= '$tglmulai'  and p.tgl >= '$tglakhir'  and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");
$datas3 = mysql_fetch_array($s3);
$subtotal = $datas3['subtotal'];
$kodejenis = $datas3['kodejenis'];
$subtotalbayar += $datas3['subtotal'];
////////////////////////////////////////
$s4 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualanbiaya p,pos_penjualanbiayadetail pd where  p.tgl >= '$tglmulai'  and p.tgl >= '$tglakhir' and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");	
$datas4 = mysql_fetch_array($s4);
$subtotal = $datas4['subtotal'];
$subtotalbiaya += $datas4['subtotal'];
echo'<tr>
		<td>'.$namajenis.'</td>
		<td>'.rupiah_format($subtotalbayar).'</td>
		<td>'.rupiah_format($subtotalbiaya).'</td>		
		<td>'.rupiah_format($subtotalbayar-$subtotalbiaya).'</td>		
		';
$grandtotalbayar +=	$subtotalbayar;
$grandtotalbiaya +=	$subtotalbiaya;
$grandlabarugi += $subtotalbayar-$subtotalbiaya;
$subtotalbayar='0';
$subtotalbiaya='0';
echo'</tr>';
}
echo'<tr>
		<td><b>Total</b></td>
		<td><b>'.rupiah_format($grandtotalbayar).'</b></td>
		<td><b>'.rupiah_format($grandtotalbiaya).'</b></td>
		<td><b>'.rupiah_format($grandlabarugi).'</b></td>
		</tr>
		';
echo'<tr >
		<td colspan="4"class="info"><b>Biaya Bulanan</b></td>';
echo '';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_biayabulanan where  tgl >= '$tglmulai'  and tgl >= '$tglakhir'" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$namabb=$data['nama'];
$subtotalbb=$data['subtotal'];
$grandtotalbb+=$data['subtotal'];
echo'<tr>
		<td width="300px">'.$namabb.'</td>
		<td></td>
		<td>'.rupiah_format($subtotalbb).'</td>
				<td></td>
	</tr>';
}
echo'<tr>
		<td><b>Total :</b></td>
		<td></td>
		<td><b>'.rupiah_format($grandtotalbb).'</b></td>
				<td></td>
	</tr>';
	$labarugi = $grandtotalbayar - $grandtotalbiaya - $grandtotalbb;
echo '<tr class="alert-info">
		<td><b>Laba / Rugi :</b></td>
				<td></td>
		<td></td>
		<td><b>'.rupiah_format($labarugi).'</b></td>
				<td></td>
	</tr>';
echo '</table>';
echo "</body</html>";

if (isset($_GET['Cetak'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
