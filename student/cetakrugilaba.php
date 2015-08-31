<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$tglmulai 		= $_GET['tglmulai'];
$tglakhir 		= $_GET['tglakhir'];

echo "<html><head><title>Laporan Laba/Rugi </title>";
echo '<style type="text/css">
   table { page-break-inside:auto; 
    font-size: 0.9em; /* 14px/16=0.875em */
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
<tr><td colspan="8"><img style="margin-right:5px; margin-top:5px; padding:1px; background:#ffffff; float:left;" src="images/logo.png" height="70px"><br>
<b>Elyon Christian School</b><br>
Raya Sukomanunggal Jaya 33A, Surabaya 60187</td></tr>';

echo'<tr><td colspan="8"><h4><b>Laporan Rugi Laba</b> , Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</h4></td></tr>';
echo'<tr><td colspan="8">';
/****************************/
echo '
<table class="table table-striped table-hover">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk where jenis='BARANG'" );
echo'
<tr>
		<td colspan="4" class="warning"><b>LABA BERSIH/KOTOR BARANG</b></td>
		</tr>
<tr>
		<td width="300px"><b>Jenis</b></td>
		<td><b>Pendapatan</b></td>
		<td><b>Biaya</b></td>
		<td><b>Laba/Rugi</b></td>
		</tr>
		';
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$idjenis=$data['id'];
$namajenis=$data['nama'];
$subtotalhargajual=getsubtotalhargajual($tglmulai,$tglakhir,$idjenis);
$subtotalhargabeli=getsubtotalhargabeli($tglmulai,$tglakhir,$idjenis);
$subtotalbiaya=getsubtotalbiaya($tglmulai,$tglakhir,$idjenis);
$subtotalbayar = $subtotalhargajual - $subtotalhargabeli;
echo'<tr>
		<td>'.$namajenis.'</td>
		<td>'.rupiah_format($subtotalbayar).'</td>
		<td>'.rupiah_format($subtotalbiaya).'</td>		
		<td>'.rupiah_format($subtotalbayar-$subtotalbiaya).'</td>		
		';
$grandsubtotalbayar +=	$subtotalbayar;
$grandtotalbiaya +=	$subtotalbiaya;
$grandlabarugi += $subtotalbayar-$subtotalbiaya;
$subtotalbayar='0';
$subtotalbiaya='0';
echo'</tr>';
}
echo'<tr>
		<td><b>Total</b></td>
		<td><b>'.rupiah_format($grandsubtotalbayar).'</b></td>
		<td><b>'.rupiah_format($grandtotalbiaya).'</b></td>
		<td><b>'.rupiah_format($grandlabarugi).'</b></td>
		</tr>
		';
/******************  JASA ********/
$hasilj = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk where jenis='JASA'" );
echo'
<tr>
		<td colspan="4" class="primary"><b>PENJUALAN</b></td>
		</tr>
<tr>
		<td width="300px"><b>Jenis</b></td>
		<td><b>Penjualan</b></td>
		<td><b>Biaya</b></td>
		<td><b>Laba/Rugi</b></td>
		</tr>
		';
while ($dataj = $koneksi_db->sql_fetchrow($hasilj)) { 
$idjenisj=$dataj['id'];
$namajenisj=$dataj['nama'];
$subtotalbayarj=getsubtotalhargajualjasa($tglmulai,$tglakhir,$idjenisj);
$subtotalbiayaj=getsubtotalbiaya($tglmulai,$tglakhir,$idjenisj);
echo'<tr>
		<td>'.$namajenisj.'</td>
		<td>'.rupiah_format($subtotalbayarj).'</td>
		<td>'.rupiah_format($subtotalbiayaj).'</td>		
		<td>'.rupiah_format($subtotalbayarj-$subtotalbiayaj).'</td>		
		';
$grandsubtotalbayarj +=	$subtotalbayarj;
$grandtotalbiayaj +=	$subtotalbiayaj;
$grandlabarugij += $subtotalbayarj-$subtotalbiayaj;
$subtotalbayarj='0';
$subtotalbiayaj='0';
echo'</tr>';
}
echo'<tr>
		<td><b>Total</b></td>
		<td><b>'.rupiah_format($grandsubtotalbayarj).'</b></td>
		<td><b>'.rupiah_format($grandtotalbiayaj).'</b></td>
		<td><b>'.rupiah_format($grandlabarugij).'</b></td>
		</tr>
		';		
			/************** TOTAL BARANG + JASA ***************/	
$totallabarugi = $grandlabarugi+$grandlabarugij;
$admin .='<tr>
		<td><b>Total</b></td>
		<td></b></td>
		<td></b></td>
		<td><b>'.rupiah_format($totallabarugi).'</b></td>
		</tr>
		';		
		/************** BIAYA BULANAN ***************/
echo'<tr >
		<td colspan="4"class="danger"><b>Biaya Bulanan</b></td>';
echo '';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_biayabulanan where  tgl  BETWEEN '$tglmulai' AND '$tglakhir' " );
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
	$labarugi = $totallabarugi - $grandtotalbb;
echo'<tr class="alert-info">
		<td><b>Laba / Rugi :</b></td>
				<td></td>
		<td></td>
		<td><b>'.rupiah_format($labarugi).'</b></td>
				<td></td>
	</tr>';	
echo '</table>';
echo "</body</html>";
/*
if (isset($_GET['Cetak'])){
echo "<script language=javascript>
window.print();
</script>";
}
*/
?>
