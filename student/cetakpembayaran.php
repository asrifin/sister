<?php
include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
echo "<html><head><title>Laporan Pembayaran Siswa </title>";
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
   case 'Tunai':
         $wherestatus="and carabayar like 'Tunai'";
         break;
   case 'Pemesanan':
         $wherestatus="and carabayar like 'Pemesanan'";
         break;
}
echo'<tr><td colspan="8"><h4>Laporan Pembayaran, Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).', Status : '.$status.'</h4></td></tr>';
echo'
<tr>
            <th class="border">No.Pemesanan</th>
            <th class="border">Tanggal</th>
            <th class="border">Nama</th>
		   <th class="border">Netto</th>
           <th class="border">Bayar</th>			
           <th class="border">Piutang</th>
		   <th class="border">User</th>
        </tr>';
$s = mysql_query( "SELECT * FROM `pos_popenjualan` where tgl >= '$tglmulai' and tgl <= '$tglakhir' $wherestatus order by tgl desc" );
while ($data = mysql_fetch_array($s)) { 
$nopo = $data['nopo'];
$carabayar = $data['carabayar'];
$netto=$data['netto'];
$user=$data['user'];
$cetakslip = '<a href="cetak_notapo.php?kode='.$data['nopo'].'&cetak=ok" target ="blank"><span class="btn btn-success">Cetak</span></a>';
if($carabayar=='Pemesanan'){
$lihatslip = '<a href="cetak_notapopenjualan.php?kode='.$data['nopo'].'&lihat=ok&bayar=ok"target ="blank">'.$nopo.'</a>';
$bayar ='0';
$piutang = $netto;
}else{
$lihatslip = '<a href="cetak_notapopenjualan.php?kode='.$data['nopo'].'&lihat=ok"target ="blank">'.$nopo.'</a>';
$bayar =$netto;
$piutang = '0';
}
echo'<tr class="border">
            <td>'.$lihatslip.'</td>
            <td>'.tanggalindo($data['tgl']).'</td>
            <td>'.getnamacustomer($data['kodecustomer']).'</td>
            <td>'.$netto.'</td>
            <td>'.$bayar.'</td>
            <td>'.$piutang.'</td>
			<td>'.$data['user'].'</td>
        </tr>';
$tnetto += $netto;
$tbayar += $bayar;
$tpiutang += $piutang;
}   
echo '
<tr class="border">
            <td colspan="3">Grand Total</td>
            <td>'.rupiah_format($tnetto).'</td>
            <td>'.rupiah_format($tbayar).'</td>
            <td>'.rupiah_format($tpiutang).'</td>
            <td colspan="2"></td>
        </tr>';
echo '</table>';

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
