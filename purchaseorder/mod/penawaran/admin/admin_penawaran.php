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

<script type="text/javascript" src="mod/po/script.js"></script>
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
	$admin  .='<legend>PURCHASE ORDER (PO)</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=po&mod=yes">HOME</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=po&mod=yes&aksi=cetak">CETAK PO</a>&nbsp;&nbsp;
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

if(isset($_POST['tambah'])){
$kodecari 		= $_POST['kode'];
$jumlah 		= '1';
$hasil =  $koneksi_db->sql_query( "SELECT * FROM po_produk WHERE kode='$kodecari'" );
$data = $koneksi_db->sql_fetchrow($hasil);
$id=$data['id'];
$kode=$data['kode'];
$stok=$data['stok'];
$error 	= '';
//$cekjumlahbeli = cekjumlahbeli($kode);
if (!$kode)  	$error .= "Error:  Kode Barang Tidak di Temukan<br />";
if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{
$admin .= '<div class="sukses">Kode Barang di Temukan </div>';
$PRODUCTID = array ();
foreach ($_SESSION['product_id'] as $k=>$v){
$PRODUCTID[] = $_SESSION['product_id'][$k]['kode'];
}
if (!in_array ($kode, $PRODUCTID)){
$_SESSION['product_id'][] = array ('id' => $id,'kode' => $kode, 'jumlah' => $jumlah);
}else{
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
$_SESSION['product_id'][$k]['jumlah'] = $_SESSION['product_id'][$k]['jumlah']+1;
    }
}
		
}
}
}

if(isset($_POST['submitpenawaran'])){
$nopo 		= $_POST['nopo'];
$kodepr 		= $_SESSION["kodepr"];
$tgl 		= $_POST['tgl'];
$kodesupplier 		= $_SESSION["kodesupplier"];
$carabayar 		= $_POST['carabayar'];
$termin 		= $_POST['termin'];
$total 		= $_POST['total'];
$discount 		= $_POST['discount'];
$netto = $_POST['bayar'];
$user 		= $_POST['user'];
if (!$_SESSION["kodesupplier"])  	$error .= "Error:  Kode Supplier harus ada <br />";
if (!$_SESSION["product_id"])  	$error .= "Error:  Kode Barang harus ada <br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT nopo FROM po_po WHERE nopo='$nopo'")) > 0) $error .= "Error: Nomor PO ".$nopo." sudah terdaftar<br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT nopr FROM po_po WHERE nopr='$kodepr'")) > 0) $error .= "Error: Nomor PR ".$kodepr." sudah terdaftar<br />";
if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{
$hasil  = mysql_query( "INSERT INTO `po_po` VALUES ('','$nopo','$kodepr','$tgl','$kodesupplier','$carabayar','$termin','$total','$discount','$netto','$user')" );
$idpo = mysql_insert_id();
foreach ($_SESSION["product_id"] as $cart_itm)
{
$kode = $cart_itm["kode"];
$jumlah = $cart_itm["jumlah"];
$harga = $cart_itm["harga"];
$subdiscount = $cart_itm["subdiscount"];
$subtotal = $cart_itm["subtotal"];
$hasil  = mysql_query( "INSERT INTO `po_podetail` VALUES ('','$nopo','$kode','$jumlah','$harga','$subdiscount','$subtotal')" );
//updatestokbeli($kode,$jumlah);
}
if($hasil){
$admin .= '<div class="sukses"><b>Berhasil Menambah PO.</b></div>';
pocetak($nopo);
porefresh();
$style_include[] ='<meta http-equiv="refresh" content="2; url=admin.php?pilih=po&mod=yes" />';
}else{
$admin .= '<div class="error"><b>Gagal Menambah PO.</b></div>';
		}		
}	
}

if(isset($_POST['hapusbarang'])){
$kode 		= $_POST['kode'];
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
unset($_SESSION['product_id'][$k]);
    }
}
}

if(isset($_POST['editjumlah'])){
$kode 		= $_POST['kode'];
$harga 		= $_POST['harga'];
$jumlahpo = $_POST['jumlahpo'];
$subdiscount = $_POST['subdiscount'];
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
$_SESSION['product_id'][$k]['subdiscount']=$subdiscount;
$_SESSION['product_id'][$k]['jumlah']=$jumlahpo;
$_SESSION['product_id'][$k]['harga']=$harga;
$nilaidiscount=cekdiscount($subdiscount,$harga);
$_SESSION['product_id'][$k]['subtotal'] = $jumlahpo*($harga-$nilaidiscount);
		}
}
}

if(isset($_POST['tambahbarang'])){
	$_SESSION['kodesupplier'] = $_POST['kodesupplier'];	
$kodebarang 		= $_POST['kodebarang'];
$jumlah 		= '1';
$hasil =  $koneksi_db->sql_query( "SELECT * FROM po_produk WHERE kode='$kodebarang'" );
$data = $koneksi_db->sql_fetchrow($hasil);
$id=$data['id'];
$kode=$data['kode'];
$stok=$data['jumlah'];
$harga=$data['hargabeli'];
$jenjang=$data['jenjang'];
$error 	= '';
if (!$kode)  	$error .= "Error:  Kode Barang Tidak di Temukan<br />";
if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{

$PRODUCTID = array ();
foreach ($_SESSION['product_id'] as $k=>$v){
$PRODUCTID[] = $_SESSION['product_id'][$k]['kode'];
}
if (!in_array ($kode, $PRODUCTID)){
$subdiscount="0";
$subtotal=$harga;
$_SESSION['product_id'][] = array ('id' => $id,'kode' => $kode, 'jumlah' => $jumlah, 'harga' => $harga, 'jenjang' => $jenjang, 'subdiscount' => $subdiscount, 'subtotal' => $subtotal, 'stok' => $stok);
}else{
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
	$subdiscount="0";
$_SESSION['product_id'][$k]['jumlah'] = $_SESSION['product_id'][$k]['jumlah']+1;
$_SESSION['product_id'][$k]['subtotal'] = $_SESSION['product_id'][$k]['jumlah']*$_SESSION['product_id'][$k]['harga'];
    }
}
		
}
}
}


if(isset($_POST['batalpenawaran'])){
porefresh();
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penawaran&mod=yes" />';
}

$user = $_SESSION['UserName'];
$tglnow = date("Y-m-d");
$nopo = generatepo();
$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$admin .= '
<div class="panel-heading"><b>Penawaran</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor PN</td>
		<td>:</td>
		<td><input type="text" name="nopn" value="'.$nopn.'" class="form-control"></td>
<td></td>
		<td></td>
		<td></td>
	</tr>';
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
		<td>Kode PR</td>
		<td>:</td>
		<td>
                <div class="input_container">
                    <input type="text" id="pr_id"  name="kodepr" value="'.$kodepr.'" onkeyup="autocompletpr()"class="form-control" >
					<input type="submit" value="Tambah Penawaran" name="tambahpr"class="btn btn-success" >&nbsp;
                    <ul id="pr_list_id"></ul>
                </div>
				</td>
		<td>Termin</td>
		<td>:</td>
		<td><input type="text" name="termin" value="'.$termin.'" class="form-control"> Hari</td>
		</tr>
				';
$admin .= $datapr;
/*
$admin .= '
	<tr>
		<td>Kode Barang</td>
		<td>:</td>
		<td>
                <div class="input_container">
                    <input type="text" id="barang_id"  name="kodebarang" value="'.$kodebarang.'" onkeyup="autocomplet2()"class="form-control" >
					<input type="submit" value="Tambah Barang" name="tambahbarang"class="btn btn-success" >&nbsp;
                    <ul id="barang_list_id"></ul>
                </div>
				</td>
	<td></td>
	<td></td>
	<td></td>
		</tr>
				';
				*/
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
$nilaidiscount=cekdiscount($cart_itm["subdiscount"],$cart_itm["harga"]);
$admin .= '
<form method="post" action="" class="form-inline"id="posts">';
$admin .= '	
	<tr>
			<td>'.$no.'</td>
		<td><input align="right" type="text" name="supplier" value="'.$cart_itm["supplier"].'"class="form-control"></td>
			<td>'.$cart_itm["kode"].'</td>
		<td>'.getnamabarang($cart_itm["kode"]).'</td>
		<td><input align="right" type="text" name="harga" value="'.$cart_itm["harga"].'"class="form-control"></td>
		<td>
		
		<input type="hidden" name="kode" value="'.$cart_itm["kode"].'">
		<input type="submit" value="EDIT" name="editjumlah"class="btn btn-warning" >
		<input type="submit" value="HAPUS" name="hapusbarang"class="btn btn-danger"></td>
	</tr>';
$admin .= '
</form>';
	$total +=$cart_itm["subtotal"];
	$no++;
		}
$admin .= '	
	<tr>
		<td colspan="8" ></td>
		<td ><a href="./admin.php?pilih=penawaran&mod=yes" class="btn btn-success">Simpan Detail</a></td>
	</tr>';
	}else{
foreach ($_SESSION["product_id"] as $cart_itm)
        {
$nilaidiscount=cekdiscount($cart_itm["subdiscount"],$cart_itm["harga"]);
$admin .= '	
	<tr>
			<td>'.$no.'</td>
			<td>'.$cart_itm["supplier"].'</td>
			<td>'.$cart_itm["kode"].'</td>
		<td>'.getnamabarang($cart_itm["kode"]).'</td>
		<td>'.$cart_itm["harga"].'</td>
		<td>
		
		<input type="hidden" name="kode" value="'.$cart_itm["kode"].'"></td>
	</tr>';
	$total +=$cart_itm["subtotal"];
	$no++;
		}		
$admin .= '	
	<tr>
		<td colspan="8" ></td>
		<td ><a href="./admin.php?pilih=penawaran&mod=yes&editdetail=ok" class="btn btn-warning">Edit Detail</a></td>
	</tr>';	
		
	}
$admin .= '	
	<tr>
		<td></td>
		<td></td>		
		<td colspan="6" align="right"><b>Total</b></td>
		<td ><input type="text" name="total" id="total"   class="form-control"  value="'.$total.'"/></td>
		<td></td>
	</tr>';
$admin .= '<tr><td colspan="7"></td><td align="right"></td>
		<td><input type="hidden" name="user" value="'.$user.'">
		<input type="submit" value="Batal" name="batalpenawaran"class="btn btn-danger" >
		<input type="submit" value="Simpan" name="submitpenawaran"class="btn btn-success" >
		</td>
		<td></td></tr>';
$admin .= '</table>';	
	}
$admin .= '</form></div>';	
}
}
echo $admin;
?>