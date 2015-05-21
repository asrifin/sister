<?php
include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
echo "<html><head><title>Laporan Piutang </title>";
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
Raya Sukomanunggal Jaya 33A, Surabaya 60187</td></tr>

';
$tglmulai 		= $_GET['tglmulai'];
$tglakhir 		= $_GET['tglakhir'];
$status 		= $_GET['status'];
switch ($status) {
   case 'Semua':
         $wherestatus="";
         break;
   case 'Lunas':
         $wherestatus="and piutang='0'";
         break;
   case 'Piutang':
         $wherestatus="and piutang<>'0'";
         break;
}
echo'<tr><td colspan="8"><h4>Laporan Piutang, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</h4></td></tr>';
echo'
<tr class="border">
            <td>No.Faktur</td>
            <td>Tanggal</td>
            <td>Customer</td>
            <td>Total</td>
            <td>Bayar</td>
            <td>Kekurangan</td>
            <td>Jatuh Tempo</td>
            <td width="10%">Aksi</td>
        </tr>';
$s = mysql_query( "SELECT * FROM `pos_penjualan` where tgl >= '$tglmulai' and tgl <= '$tglakhir' $wherestatus order by tgltermin asc" );
while ($data = mysql_fetch_array($s)) { 
$nofaktur = $data['nofaktur'];
$piutang = $data['piutang'];
if($piutang>'0'){
$tombollunas = 'Piutang';
}else{
$tombollunas = 'Lunas';
}
echo'<tr class="border">
            <td>'.$data['nofaktur'].'</td>
            <td>'.tanggalindo($data['tgl']).'</td>
            <td>'.getnamacustomer($data['kodecustomer']).'</td>
            <td>'.rupiah_format($data['total']).'</td>
            <td>'.rupiah_format($data['bayar']).'</td>
            <td>'.rupiah_format($data['piutang']).'</td>
            <td>'.tanggalindo($data['tgltermin']).'</td>
            <td>'.$tombollunas.'</td>
        </tr>';
$ttotal += $data['total'];
$tbayar += $data['bayar'];
$tpiutang += $data['piutang'];
}   
echo '
<tr class="border">
            <td colspan="3">Grand Total</td>
            <td>'.rupiah_format($ttotal).'</td>
            <td>'.rupiah_format($tbayar).'</td>
            <td>'.rupiah_format($tpiutang).'</td>
            <td colspan="2"></td>
        </tr>';
echo '</table>';

/****************************/
echo "</body</html>";

if (isset($_GET['tglmulai'])){
echo "<script language=javascript>
window.print();
</script>";
}
?>
