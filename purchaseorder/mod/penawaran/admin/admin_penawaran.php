<?php
if (!defined('AURACMS_admin')) {
    Header("Location: ../index.php");
    exit;
}

if (!cek_login()){
    header("location: index.php");
    exit;
} else{

$JS_SCRIPT.= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable({
    "iDisplayLength":50});
} );
</script>
js;
$style_include[] .= '<link rel="stylesheet" media="screen" href="mod/calendar/css/dynCalendar.css" />
<link rel="stylesheet" href="mod/po/style.css" />
';
$admin .= '

<script type="text/javascript" src="mod/penawaran/script.js"></script>
<script language="javascript" type="text/javascript" src="mod/calendar/js/browserSniffer.js"></script>
<script language="javascript" type="text/javascript" src="mod/calendar/js/dynCalendar.js"></script>';
$wkt = <<<eof
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
        document.forms['posts'].tgl.value = year + '-' + month + '-' + date;
    }
    calendar3 = new dynCalendar('calendar3', 'exampleCallback_ISO3');
    calendar3.setMonthCombo(true);
    calendar3.setYearCombo(true);
/*]]>*/     
</script>
eof;
$script_include[] = $JS_SCRIPT;
	
//$index_hal=1;	
	$admin  .='<legend>PENAWARAN</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=penawaran&mod=yes">HOME</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=penawaran&mod=yes&aksi=cetak">CETAK PENAWARAN</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';
$admin .='<div class="panel panel-info">';
$admin .= '<script type="text/javascript" language="javascript">
   function GP_popupConfirmMsg(msg) { //v1.0
  document.MM_returnValue = confirm(msg);
}
</script>';
if ($_GET['aksi'] == ''){
$nomer=1;

if(isset($_POST['submitpenawaran'])){
$nopn 		= $_POST['nopn'];
$kodepr 		= $_SESSION["kodepr"];
$tgl 		= $_POST['tgl'];
$user 		= $_POST['user'];
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT nopn FROM po_pn WHERE nopn='$nopn'")) > 0) $error .= "Error: Nomor PN ".$nopn." sudah terdaftar<br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT nopr FROM po_pn WHERE nopr='$kodepr'")) > 0) $error .= "Error: Nomor PR ".$kodepr." sudah terdaftar<br />";
if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{
$hasil  = mysql_query( "INSERT INTO `po_pn` VALUES ('','$nopn','$kodepr','$tgl','$user')" );
$idpn = mysql_insert_id();
foreach ($_SESSION["product_id"] as $cart_itm)
{
$kode = $cart_itm["kode"];
$harga = $cart_itm["harga"];
$supplier = $cart_itm["supplier"];
$hasil  = mysql_query( "INSERT INTO `po_pndetail` VALUES ('','$nopn','$supplier','$kode','$harga')" );
//updatestokbeli($kode,$jumlah);
}
if($hasil){
$admin .= '<div class="sukses"><b>Berhasil Menambah PN.</b></div>';
penawaranrefresh();
$style_include[] ='<meta http-equiv="refresh" content="2; url=admin.php?pilih=penawaran&mod=yes" />';
}else{
$admin .= '<div class="error"><b>Gagal Menambah PN.</b></div>';
		}		
}	
}


if(isset($_POST['tambahpr'])){
$_SESSION['kodepr'] = $_POST['kodepr'];
$hasil3 =  $koneksi_db->sql_query("SELECT * FROM po_pr WHERE nopr = '$_SESSION[kodepr]'");
$data3 = $koneksi_db->sql_fetchrow($hasil3);
$nopr = $data3['nopr'];
$namapr = $data3['namapr'];  
$hasil =  $koneksi_db->sql_query( "SELECT * FROM po_prdetail WHERE nopr='$_SESSION[kodepr]'" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$kodebarang=$data['kodebarang'];
$hasil2 =  $koneksi_db->sql_query( "SELECT * FROM sar_katalog WHERE replid='$kodebarang'" );
$data2 = $koneksi_db->sql_fetchrow($hasil2);
$id=$data2['id'];
$kode=$data2['replid'];
$PRODUCTID = array ();
foreach ($_SESSION['product_id'] as $k=>$v){
$nomer = $_SESSION['product_id'][$k]['nomer']+1;
}
if (!in_array ($kode, $PRODUCTID)){
$_SESSION['product_id'][] = array ('id' => $id,'nomer' => $nomer,'kode' => $kode, 'supplier' => $supplier, 'harga' => $harga);

}else{
$_SESSION['product_id'][] = array ('id' => $id,'nomer' => $nomer,'kode' => $kode, 'supplier' => $supplier, 'harga' => $harga);
}
}
}

if(isset($_POST['editjumlah'])){
	$nomer 		= $_POST['nomer'];
$kode 		= $_POST['kode'];
$harga 		= $_POST['harga'];
$supplier = $_POST['supplier'];
foreach ($_SESSION['product_id'] as $k=>$v){
    if($nomer == $_SESSION['product_id'][$k]['nomer'])
	{
$_SESSION['product_id'][$k]['supplier']=$supplier;
$_SESSION['product_id'][$k]['harga']=$harga;

		}
}
}

if(isset($_POST['hapusbarang'])){
$nomer 		= $_POST['nomer'];
foreach ($_SESSION['product_id'] as $k=>$v){
    if($nomer == $_SESSION['product_id'][$k]['nomer'])
	{
unset($_SESSION['product_id'][$k]);
    }
}
}

if(isset($_POST['batalpenawaran'])){
penawaranrefresh();
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penawaran&mod=yes" />';
}

$user = $_SESSION['UserName'];
$tglnow = date("Y-m-d");
$nopn = generatepenawaran();
$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$kodepr 		= !isset($kodepr) ? $_SESSION['kodepr'] : $kodepr;
$admin .= '
<div class="panel-heading"><b>Penawaran</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Kode PR</td>
		<td>:</td>
		<td>
                <div class="input_container">
                    <input type="text" id="pr_id"  name="kodepr" value="'.$kodepr.'" onkeyup="autocompletpr()"class="form-control" >&nbsp;
                    <ul id="pr_list_id"></ul>
                </div>
				</td>
		<td></td>
		<td></td>
		<td></td>
		</tr>
				';
$admin .= '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td><input type="text" name="tgl" value="'.$tgl.'" class="form-control">&nbsp;'.$wkt.'</td>
<td></td>
		<td></td>
		<td></td>
	</tr>';
$admin .= '
	<tr>
		<td>Nomor Penawaran</td>
		<td>:</td>
		<td><input type="text" name="nopn" value="'.$nopn.'" class="form-control">&nbsp;<input type="submit" value="Tambah Penawaran" name="tambahpr" class="btn btn-success" ></td>
<td></td>
		<td></td>
		<td></td>
	</tr>';


$admin .= $datapr;
$admin .= '	
</table></div>';	
if(($_SESSION["product_id"])!=""){
$no=1;
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Detail Penawaran</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
		<th><b>Supplier</b></</th>
		<th><b>Kode</b></</th>
		<th><b>Nama</b></td>
		<th><b>Harga</b></</th>
		<th><b>Aksi</b></</th>
	</tr>';
	if ($_GET['editdetail']){
foreach ($_SESSION["product_id"] as $cart_itm)
        {
$admin .= '
<form method="post" action="" class="form-inline"id="posts">';
$admin .= '	
	<tr>
			<td>'.$cart_itm["nomer"].'</td>
		<td><input align="right" type="text" name="supplier" value="'.$cart_itm["supplier"].'"class="form-control"></td>
			<td>'.$cart_itm["kode"].'</td>
		<td>'.getnamabarang($cart_itm["kode"]).'</td>
		<td><input align="right" type="text" name="harga" value="'.$cart_itm["harga"].'"class="form-control"></td>
		<td>
			<input type="hidden" name="nomer" value="'.$cart_itm["nomer"].'">	
		<input type="hidden" name="kode" value="'.$cart_itm["kode"].'">
		<input type="submit" value="EDIT" name="editjumlah"class="btn btn-warning" >
		<input type="submit" value="HAPUS" name="hapusbarang"class="btn btn-danger"></td>
	</tr>';
$admin .= '
</form>';
$no++;
		}
$admin .= '	
	<tr>
		<td colspan="5" ></td>
		<td ><a href="./admin.php?pilih=penawaran&mod=yes" class="btn btn-success">Simpan Detail</a></td>
	</tr>';
	}else{
foreach ($_SESSION["product_id"] as $cart_itm)
        {
$nilaidiscount=cekdiscount($cart_itm["subdiscount"],$cart_itm["harga"]);
$admin .= '	
	<tr>
			<td>'.$cart_itm["nomer"].'</td>
			<td>'.$cart_itm["supplier"].'</td>
			<td>'.$cart_itm["kode"].'</td>
		<td>'.getnamabarang($cart_itm["kode"]).'</td>
		<td>'.$cart_itm["harga"].'</td>
		<td>
		<input type="hidden" name="nomer" value="'.$cart_itm["nomer"].'">		
		<input type="hidden" name="kode" value="'.$cart_itm["kode"].'"></td>
	</tr>';
	$no++;
		}		
$admin .= '	
	<tr>
		<td colspan="5" ></td>
		<td ><a href="./admin.php?pilih=penawaran&mod=yes&editdetail=ok" class="btn btn-warning">Edit Detail</a></td>
	</tr>';	
		
	}
$admin .= '<tr><td colspan="4"></td><td align="right"></td>
		<td><input type="hidden" name="user" value="'.$user.'">
		<input type="submit" value="Batal" name="batalpenawaran"class="btn btn-danger" >
		<input type="submit" value="Simpan" name="submitpenawaran"class="btn btn-success" >
		</td></tr>';
$admin .= '</table>';	
	}
$admin .= '</form></div>';	
}

if ($_GET['aksi'] == 'cetak'){
$kodepn     = $_POST['kodepn'];  
if(isset($_POST['batalcetak'])){
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penawaran&mod=yes&aksi=cetak" />';
}
$admin .= '
<div class="panel-heading"><b>Cetak Penawaran</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Kode Penawaran</td>
		<td>:</td>
		<td><div class="input_container">
                    <input type="text" id="pn_id"  name="kodepn" value="'.$kodepn.'" onkeyup="autocompletpn()" required class="form-control" >
					<input type="submit" value="Lihat PN" name="lihatpn"class="btn btn-success" >&nbsp;<input type="submit" value="Batal" name="batalcetak"class="btn btn-danger" >&nbsp;
					
                    <ul id="pn_list_id"></ul>
                </div>
				</td>
		<td></td>
		<td></td>
		<td></td>
		</tr>';
$admin .= '</form></table></div>';	

/*******************************/
if(isset($_POST['lihatpn'])){

$no=1;
$query 		= mysql_query ("SELECT * FROM `po_pn` WHERE `nopn` like '$kodepn'");
$data 		= mysql_fetch_array($query);
$nopn  			= $data['nopn'];
$nopr  			= $data['nopr'];
$tgl  			= $data['tgl'];
$error 	= '';
if (!$nopn) $error .= "Error: kode PN tidak terdaftar , silahkan ulangi.<br />";
if ($error){
$admin .= '<div class="error">'.$error.'</div>';}else{
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><b>Penawaran</b></div>';
$admin .= '
		<form method="post" action="cetak_notapenawaran.php" class="form-inline"id="posts"target="_blank">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor PN</td>
		<td>:</td>
		<td>'.$nopn.'</td>
		<td><input type="hidden" name="kode" value="'.$nopn.'">
		<input type="submit" value="Cetak Nota" name="cetak_notapn"class="btn btn-warning" >

		</td>
	</tr>';
$admin .= '
	<tr>
		<td>Nomor PR</td>
		<td>:</td>
		<td>'.$nopr.'</td>
		<td></td>
	</tr>';
$admin .= '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td>'.tanggalindo($tgl).'</td>
		<td></td>
		</tr>';	
$admin .= '</table>		</form></div>';	
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Detail Penawaran</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
		<th><b>Supplier</b></</th>
		<th><b>Nama</b></td>
		<th><b>Harga</b></</td>
	</tr>';
$hasild = $koneksi_db->sql_query("SELECT * FROM `po_pndetail` WHERE `nopn` like '$kodepn'");
while ($datad =  $koneksi_db->sql_fetchrow ($hasild)){
$admin .= '	
	<tr>
		<td>'.$no.'</td>
		<td>'.$datad["supplier"].'</td>
		<td>'.getnamabarang($datad["kodebarang"]).'</td>
		<td>'.$datad["harga"].'</td>
	</tr>';
	$no++;
		}
$admin .= '</table></div>';	
		}
	}

}


}
echo $admin;
?>