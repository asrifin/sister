<?php
if (!defined('AURACMS_admin')) {
	Header("Location: ../index.php");
	exit;
}
$style_include[] = <<<style
<style type="text/css">
@import url("mod/news/css/news.css");
</style>

style;
$JS_SCRIPT= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );
</script>
js;
$style_include[] .= '<link rel="stylesheet" media="screen" href="mod/calendar/css/dynCalendar.css" />';
$admin .= '
<script language="javascript" type="text/javascript" src="mod/calendar/js/browserSniffer.js"></script>
<script language="javascript" type="text/javascript" src="mod/calendar/js/dynCalendar.js"></script>';
$wktmulai = <<<eof
<script language="JavaScript" type="text/javascript">
    
    /**
    * Example callback function
    */
    /*<![CDATA[*/
    function exampleCallback_ISO3(date, month, year)
    {
        if (String(month).length == 1) {
            month = '0' + month;
        }
    
        if (String(date).length == 1) {
            date = '0' + date;
        }    
        document.forms['posts'].tglmulai.value = year + '-' + month + '-' + date;
    }
    calendar3 = new dynCalendar('calendar3', 'exampleCallback_ISO3');
    calendar3.setMonthCombo(true);
    calendar3.setYearCombo(true);
/*]]>*/     
</script>
eof;
$wktakhir = <<<eof
<script language="JavaScript" type="text/javascript">
    
    /**
    * Example callback function
    */
    /*<![CDATA[*/
    function exampleCallback_ISO2(date, month, year)
    {
        if (String(month).length == 1) {
            month = '0' + month;
        }
    
        if (String(date).length == 1) {
            date = '0' + date;
        }    
        document.forms['posts'].tglakhir.value = year + '-' + month + '-' + date;
    }
    calendar2 = new dynCalendar('calendar2', 'exampleCallback_ISO2');
    calendar2.setMonthCombo(true);
    calendar2.setYearCombo(true);
/*]]>*/     
</script>
eof;
$script_include[] = $JS_SCRIPT;

if (!cek_login ()){
   $admin .='<h4 class="bg">Access Denied !!!!!!</h4>';
}else{

global $koneksi_db,$PHP_SELF,$theme,$error;

$admin  .='<legend>LAPORAN STOK PRODUK</legend>';
$admin .= '<div class="panel panel-info">';
if($_GET['aksi']==""){
$admin .= '<div class="panel-heading"><h3 class="panel-title">Daftar Produk Barang</h3></div>';
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kategori</th>
            <th>Kode</th>
			<th>Nama Barang</th>
           <th>Stok Akhir</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_produk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$jenjang=$data['jenjang'];
$kodebarang=$data['kode'];
$nama=$data['nama'];
$jenis=$data['jenis'];
$jumlah=$data['jumlah'];
$hargabeli=$data['hargabeli'];
$hargajual=$data['hargajual'];
$admin.='<tr>
            <td>'.getjenis($jenis).'</td>
            <td>'.$kodebarang.'</td>
            <td>'.$nama.'</td>
            <td>'.$jumlah.'</td>
            <td><a href="?pilih=laporanproduk&amp;mod=yes&amp;aksi=detail&amp;kodebarang='.$kodebarang.'" "><span class="btn btn-success">Lihat Alur Stok</span></a> </td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']=="detail"){
	$kodebarang     = $_GET['kodebarang'];  
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tglmulai 		= !isset($tglmulai) ? $tglnow : $tglmulai;
$tglakhir 		= !isset($tglakhir) ? $tglnow : $tglakhir;
$admin .='<div class="panel-heading"><b>Laporan Stok Produk</b></div>';
$admin .= '<form class="form-inline" method="get" action="cetakbarang.php" enctype ="multipart/form-data" id="posts" target="_blank">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td width="200px">Kode Produk</td>
		<td><input type="text" name="kodebarang" value="'.$kodebarang.'" class="form-control"></td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Nama</td>
		<td>'.getnamabarang($kodebarang).'</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tanggal Mulai</td>
		<td><input type="text" name="tglmulai" value="'.$tglmulai.'" class="form-control">&nbsp;'.$wktmulai.'</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tanggal Akhir</td>
		<td><input type="text" name="tglakhir" value="'.$tglakhir.'" class="form-control">&nbsp;'.$wktakhir.'</td>
	</tr>';

$admin .= '<tr>
	<td></td>
	<td><input type="submit" value="Cetak" name="submit" class="btn btn-success"></td>
	</tr>
</table></form>';
$admin .= '</table>';
$admin .= "* Apabila tidak dapat melakukan print, klik kanan pilih open link New Tab";

}

}
$admin .='</div>';
echo $admin;
?>