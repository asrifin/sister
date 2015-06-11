<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
$tglmulai 		= $_GET['tglmulai'];
$tglakhir 		= $_GET['tglakhir'];
$detail 		= $_GET['detail'];
echo "<html><head><title>Laporan Permintaan </title>";
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
echo'<tr><td colspan="7"><h4>Laporan Permintaan, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</h4></td></tr>';
echo '
<tr class="border">
<td>No</td>
<td>No.PR</td>
<td>Tanggal</td>
<td>Nama</td>
<td>Departemen</td>
<td>Tujuan</td>
<td>Anggaran</td>
<td>User</td>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM `po_pr` where tgl >= '$tglmulai' and tgl <= '$tglakhir' $wherestatus order by tgl asc");	
while($datas = mysql_fetch_array($s)){
$id = $datas['id'];
$nopr = $datas['nopr'];
$tgl = $datas['tgl'];
$namapr = $datas['namapr'];
$departemenpr = $datas['departemenpr'];
$tujuanpr = $datas['tujuanpr'];
$kategorianggaran = $datas['kategorianggaran'];
$user = $datas['user'];
$urutan = $no + 1;
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$nopr.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.$namapr.'</td>
<td>'.getdepartemen($departemenpr).'</td>
<td>'.$tujuanpr.'</td>
<td>'.getkategorianggaran($kategorianggaran).'</td>
<td>'.$user.'</td>
</tr>';
$no++;
}
echo '</table>';
}else{
echo'<tr><td colspan="8"><h4>Laporan Permintaan, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</h4></td></tr>';
echo '
<tr class="border">
<td>No</td>
<td>No.PR</td>
<td>Tanggal</td>
<td>Nama</td>
<td>Departemen</td>
<td>Kode Barang</td>
<td>Nama Barang</td>
<td>Jumlah</td>
<td>Spesifikasi</td>
<td>User</td>
</tr>';
$no =1;
$s = mysql_query ("SELECT * FROM `po_pr` where tgl >= '$tglmulai' and tgl <= '$tglakhir' $wherestatus order by tgl asc");	
while($datas = mysql_fetch_array($s)){
$id = $datas['id'];
$nopr = $datas['nopr'];
$tgl = $datas['tgl'];
$namapr = $datas['namapr'];
$departemenpr = $datas['departemenpr'];
$tujuanpr = $datas['tujuanpr'];
$user = $datas['user'];
$urutan = $no + 1;
$s2 = mysql_query ("SELECT * FROM `po_prdetail` where nopr = '$nopr'order by id asc");	
while($datas2 = mysql_fetch_array($s2)){
$kodebarang = $datas2['kodebarang'];
$jumlah = $datas2['jumlah'];
$spesifikasi = $datas2['spesifikasi'];
echo '
<tr class="border">
<td class="text-center">'.$no.'</td>
<td>'.$nopr.'</td>
<td>'.tanggalindo($tgl).'</td>
<td>'.$namapr.'</td>
<td>'.getdepartemen($departemenpr).'</td>
<td>'.$kodebarang.'</td>
<td>'.getnamabarang($kodebarang).'</td>
<td>'.$jumlah.'</td>
<td>'.$spesifikasi.'</td>
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

if (isset($_GET['tglmulai'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
