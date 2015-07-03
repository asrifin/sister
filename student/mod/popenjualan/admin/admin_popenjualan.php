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
<link rel="stylesheet" href="mod/penjualan/style.css" />
';
$admin .= '

<script type="text/javascript" src="mod/penjualan/script.js"></script>
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
	$admin  .='<legend>TRANSAKSI PO PENJUALAN</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=popenjualan&mod=yes">PO PENJUALAN</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=popenjualan&mod=yes&aksi=cetak">CETAK PO PENJUALAN</a>&nbsp;&nbsp;
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
$_SESSION['kodecustomer'] = $_POST['kodecustomer'];
$kodecustomer=$_POST['kodecustomer'];
$kodecari 		= $_POST['kode'];
$totaljual = $_SESSION["total"];
$jumlah 		= '1';
$hasil =  $koneksi_db->sql_query( "SELECT * FROM pos_produk WHERE kode='$kodecari'" );
$data = $koneksi_db->sql_fetchrow($hasil);
$id=$data['id'];
$kode=$data['kode'];
$stok=$data['stok'];
$jenis=$data['jenis'];
$error 	= '';
if (!$kodecustomer)  	$error .= "Error:  Kode Barang Tidak di Temukan<br />";
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
$_SESSION['product_id'][] = array ('id' => $id,'kode' => $kode, 'jumlah' => $jumlah, 'jenis' => $jenis);
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

if(isset($_POST['submitpo'])){
$nopo 		= $_POST['nopo'];
$tgl 		= $_POST['tgl'];
$kodecustomer 		= $_SESSION["kodecustomer"];
$carabayar 		= $_POST['carabayar'];
$total 		= $_POST['total'];
$discount ='0';
$netto = $_POST['total'];
$bayar 		= '0';
$termin 		= $_POST['termin'];
$user 		= $_POST['user'];
if (!$_SESSION["kodecustomer"])  	$error .= "Error:  Kode Customer harus ada <br />";
if (!$_SESSION["product_id"])  	$error .= "Error:  Kode Barang harus ada <br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT nopo FROM pos_popenjualan WHERE nopo='$nopo'")) > 0) $error .= "Error: Nomor PO ".$nopo." sudah terdaftar<br />";
foreach ($_SESSION["product_id"] as $cart_itm)
{
$kode = $cart_itm["kode"];
$jumlah = $cart_itm["jumlah"];
$stokbarang=getstokbarang($kode);
if ($stokbarang < $jumlah)$error .= "Error:  Stok Barang Tidak Mencukupi<br />";
}
if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{
if($bayar=='0'){
$carabayar ='Pemesanan';
$tgltermin = tgltermin($tgl,$termin);
$hasil  = mysql_query( "INSERT INTO `pos_popenjualan` VALUES ('','$nopo','$tgl','$kodecustomer','$carabayar','$total','$discount','$netto','$termin','$user')" );	
}
$idpo = mysql_insert_id();
foreach ($_SESSION["product_id"] as $cart_itm)
{
$kode = $cart_itm["kode"];
$jenis = $cart_itm["jenis"];
$jumlah = $cart_itm["jumlah"];
$harga = $cart_itm["harga"];
$hargabeli = $cart_itm["hargabeli"];
$subdiscount = $cart_itm["subdiscount"];
$subtotal = $cart_itm["subtotal"];
$hasil  = mysql_query( "INSERT INTO `pos_popenjualandetail` VALUES ('','$nopo','$kode','$jumlah','$harga','$hargabeli','$subdiscount','$subtotal')" );
//updatestokjual($kode,$jumlah);
//alurstok($tgl,'Penjualan',$nofaktur,$kode,$jumlah);
}
if($hasil){
$admin .= '<div class="sukses"><b>Berhasil Menambah PO Penjualan.</b></div>';
popenjualancetak($nopo);
popenjualanrefresh();

//$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penjualan&mod=yes" />';
}else{
$admin .= '<div class="error"><b>Gagal Menambah PO Penjualan.</b></div>';
		}		
}	
}

if(isset($_POST['tambahcustomer'])){
$_SESSION['kodecustomer'] = $_POST['kodecustomer'];
echo "<script type=\"text/javascript\">
        window.open('cetak_nofaktur.php', '_new')
    </script>";
}

if(isset($_POST['deletecustomer'])){
penjualanrefresh();
}

if(isset($_GET['hapusbarang'])){
$kode 		= $_GET['kode'];
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
unset($_SESSION['product_id'][$k]);
    }
}
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=popenjualan&mod=yes" />';
}

if(isset($_POST['simpandetail'])){
foreach ($_SESSION['product_id'] as $k=>$v){
$_SESSION['product_id'][$k]['subdiscount']=$_POST['subdiscount'][$k];
$_SESSION['product_id'][$k]['jumlah']=$_POST['jumlahpo'][$k];
$_SESSION['product_id'][$k]['harga']=$_POST['harga'][$k];
$nilaidiscount=cekdiscount($_SESSION['product_id'][$k]['subdiscount'],$_SESSION['product_id'][$k]['harga']);
$_SESSION['product_id'][$k]['subtotal'] =$_SESSION['product_id'][$k]['jumlah']*($_SESSION['product_id'][$k]['harga']-$nilaidiscount);
}
//$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=popenjualan&mod=yes" />';
}

if(isset($_POST['tambahbarang'])){
$_SESSION['kodecustomer'] = $_POST['kodecustomer'];
$kodebarang 		= $_POST['kodebarang'];
$jumlah 		= '1';
$hasil =  $koneksi_db->sql_query( "SELECT * FROM pos_produk WHERE kode='$kodebarang'" );
$data = $koneksi_db->sql_fetchrow($hasil);
$id=$data['id'];
$kode=$data['kode'];
$stok=$data['jumlah'];
$harga=$data['hargajual'];
$hargabeli=$data['hargabeli'];
$jenjang=$data['jenjang'];
$jenis=$data['jenis'];
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
$_SESSION['product_id'][] = array ('id' => $id,'kode' => $kode,'jenis' => $jenis, 'jumlah' => $jumlah, 'harga' => $harga, 'hargabeli' => $hargabeli, 'jenjang' => $jenjang, 'subdiscount' => $subdiscount, 'subtotal' => $subtotal);
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

if($_SESSION["kodecustomer"]!=''){
$customer = '
		<td>Nama Customer</td>
		<td>:</td>
		<td>'.getnamacustomer($_SESSION['kodecustomer']).'</td>';
$kelas = '
		<td>Kelas</td>
		<td>:</td>
		<td>'.getnamakelasnis($_SESSION['kodecustomer']).'</td>';
}else{
$customer = '
		<td></td>
		<td></td>
		<td></td>';	
$kelas = '
		<td></td>
		<td></td>
		<td></td>';	
	
}

if(isset($_POST['bataljual'])){
penjualanrefresh();
}

$user = $_SESSION['UserName'];
$tglnow = date("Y-m-d");
$nopo = generatepojual();
$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$kodecustomer 		= !isset($kodecustomer) ? $_SESSION['kodecustomer'] : $kodecustomer;
$discount 		= !isset($discount) ? '0' : $discount;
$carabayar 		= !isset($carabayar) ? $_POST['carabayar'] : $carabayar;
$termin 		= !isset($termin) ? $_POST['termin'] : $termin;
$sel2 = '<select name="carabayar" class="form-control">';
$arr2 = array ('Tunai','Debet Card','Pemesanan');
foreach ($arr2 as $kk=>$vv){
	if ($carabayar == $vv){
	$sel2 .= '<option value="'.$vv.'" selected="selected">'.$vv.'</option>';
	}else {
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	
}
}

$sel2 .= '</select>'; 
$sel3 = '<select name="termin" class="form-control" required>';
$arr3 = array ('0');
foreach ($arr3 as $kk=>$vv){
	if ($termin == $vv){
	$sel3 .= '<option value="'.$vv.'" selected="selected">'.$vv.'</option>';
	}else {
	$sel3 .= '<option value="'.$vv.'">'.$vv.'</option>';	
	}
}

$sel3 .= '</select>'; 

$admin .= '
<div class="panel-heading"><b>Transaksi PO Penjualan</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor PO</td>
		<td>:</td>
		<td><input type="text" name="nopo" value="'.$nopo.'" class="form-control"></td>
'.$customer.'
	</tr>';
$admin .= '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td><input type="text" name="tgl" value="'.$tgl.'" class="form-control">&nbsp;'.$wkt.'</td>
'.$kelas.'
	</tr>';
$admin .= '
	<tr>
		<td>Customer</td>
		<td>:</td>
		<td><div class="input_container">
                    <input type="text" id="country_id"  name="kodecustomer" value="'.$kodecustomer.'" onkeyup="autocomplet()"class="form-control" >
					&nbsp;<input type="submit" value="Batal" name="deletecustomer"class="btn btn-danger" >
                    <ul id="country_list_id"></ul>
                </div>
		<td>Cara Pembayaran</td>
		<td>:</td>
		<td>'.$sel2.'</td>
		</tr>';


$admin .= '
	<tr>
		<td>Barang</td>
		<td>:</td>
		<td>
                <div class="input_container">
                    <input type="text" id="barang_id"  name="kodebarang" value="'.$kodebarang.'" onkeyup="autocomplet2()"class="form-control" >
					<input type="submit" value="Tambah Barang" name="tambahbarang"class="btn btn-success" >&nbsp;
                    <ul id="barang_list_id"></ul>
                </div>
				</td>
		<td>Termin</td>
		<td>:</td>
		<td>'.$sel3.'Hari</td>
		</tr>
				';
$admin .= '	
	<tr><td colspan="5"><div id="Tbayar"></div></td>
		<td>
		</td>
	</tr>
</table>';	
$admin .='</div>';
if(($_SESSION["product_id"])!=""){
$no=1;
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Detail Pemesanan</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
<th><b>Jenjang</b></</th>
		<th><b>Kode</b></</th>
		<th><b>Nama</b></td>
		<th><b>Jumlah</b></</td>
		<th><b>Harga</b></</th>
<th><b>Discount</b></</th>
<th><b>SubDiscount</b></</th>
<th><b>Subtotal</b></</th>
		<th><b>Aksi</b></</th>
	</tr>';
//foreach ($_SESSION["product_id"] as $cart_itm){
foreach ($_SESSION['product_id'] as $k=>$v){
$subdiscount = $_SESSION['product_id'][$k]['subdiscount'];
$jumlah = $_SESSION['product_id'][$k]['jumlah'];
$harga = $_SESSION['product_id'][$k]['harga'];
$jenjang = $_SESSION['product_id'][$k]["jenjang"];
$kode = $_SESSION['product_id'][$k]["kode"];
$subtotal=$_SESSION['product_id'][$k]["subtotal"];
$nilaidiscount=cekdiscount($subdiscount,$harga)*$jumlah;
$admin .= '	
	<tr>
			<td>'.$no.'</td>
		<td>'.getjenjang($jenjang).'</td>
			<td>'.$kode.'</td>
		<td>'.getnamabarang($kode).'</td>
		<td><input align="right" type="text" name="jumlahpo['.$k.']" value="'.$jumlah.'"class="form-control"></td>
		<td><input align="right" type="text" name="harga['.$k.']" value="'.$harga.'"class="form-control"></td>
		<td><input align="right" type="text" name="subdiscount['.$k.']" value="'.$subdiscount.'"class="form-control"></td>
	<td>'.$nilaidiscount.'</td>
		<td>'.$subtotal.'</td>
		<td>
		<a href="./admin.php?pilih=popenjualan&mod=yes&hapusbarang=ok&kode='.$kode.'" class="btn btn-danger">HAPUS</a></td>
	</tr>';
	$total +=$subtotal;
	$no++;
		}
$admin .= '	
	<tr>
		<td colspan="9" ></td>
		<td ><input type="submit" value="EDIT DETAIL" name="simpandetail"class="btn btn-warning" ></td>
	</tr>';		
$admin .= '	
	<tr>
		<td></td>
		<td></td>		
		<td colspan="7" align="right"><b>Total</b></td>
		<td ><input type="text" name="total" id="total"   class="form-control"  value="'.$total.'"/></td>
		<td></td>
	</tr>';
$admin .= '<tr><td colspan="8"></td><td align="right"></td>
		<td><input type="hidden" name="user" value="'.$user.'">
		<input type="submit" value="Batal" name="batalpo"class="btn btn-danger" >
		<input type="submit" value="Simpan" name="submitpo"class="btn btn-success" >
		</td>
		<td></td></tr>';
$admin .= '</table>';	
	}
$admin .= '</form></div>';	
	}

if ($_GET['aksi'] == 'cetak'){
$kodepo     = $_POST['kodepo'];  
if(isset($_POST['batalcetak'])){
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penjualan&mod=yes&aksi=cetak" />';
}
$admin .= '
<div class="panel-heading"><b>Cetak Nota Penjualan</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$getlastpo=getlastpopenjualan();
$admin .= '
	<tr>
		<td>Kode PO</td>
		<td>:</td>
		<td><div class="input_container">
                    <input type="text" id="po_id"  name="kodepo" value="'.$getlastpo.'" onkeyup="autocompletpo()" required class="form-control" >
					<input type="submit" value="Lihat PO" name="lihatpo"class="btn btn-success" >&nbsp;<input type="submit" value="Batal" name="batalcetak"class="btn btn-danger" >&nbsp;
					
                    <ul id="faktur_list_id"></ul>
                </div>
				</td>
		<td></td>
		<td></td>
		<td></td>
		</tr>';
$admin .= '</form></table></div>';	
if(isset($_POST['lihatpo'])){

$no=1;
$query 		= mysql_query ("SELECT * FROM `pos_popenjualan` WHERE `nopo` like '$kodepo'");
$data 		= mysql_fetch_array($query);
$nopo  			= $data['nopo'];
$tgl  			= $data['tgl'];
$kodecustomer  			= $data['kodecustomer'];
$carabayar  			= $data['carabayar'];
$total  			= $data['total'];
$discount  			= $data['discount'];
$netto  			= $data['netto'];
$bayar  			= $data['bayar'];
$termin  			= $data['termin'];
	$error 	= '';
		if (!$nopo) $error .= "Error: kode PO tidak terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';}else{
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><b>Transaksi PO Penjualan</b></div>';
$admin .= '
		<form method="post" action="cetak_notapopenjualan.php" class="form-inline"id="posts"target="_blank">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor PO</td>
		<td>:</td>
		<td>'.$nopo.'</td>
		<td><input type="hidden" name="kode" value="'.$nopo.'">
		<input type="submit" value="Cetak Nota" name="cetak_notapopenjualan"class="btn btn-warning" >

		</td>
	</tr>';
$admin .= '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td>'.tanggalindo($tgl).'</td>
		<td></td>
		</tr>';
$admin .= '
	<tr>
		<td>Customer</td>
		<td>:</td>
		<td>'.getnamacustomer($kodecustomer).'</td>
			<td></td>
	</tr>';	
$admin .= '
	<tr>
		<td>Kelas</td>
		<td>:</td>
		<td>'.getnamakelasnis($kodecustomer).'</td>
			<td></td>
	</tr>';	
$admin .= '
	<tr>
		<td>Cara Pembayaran</td>
		<td>:</td>
		<td>'.$carabayar.'</td>
			<td></td>
	</tr>';	
if($carabayar=='Piutang'){
$admin .= '
	<tr>
		<td>Termin</td>
		<td>:</td>
		<td>'.$termin.' Hari</td>
			<td></td>
	</tr>';	
	}
$admin .= '</table>		</form></div>';	
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Detail Penjualan</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
<th><b>Jenjang</b></</th>
		<th><b>Kode</b></</th>
		<th><b>Nama</b></td>
		<th><b>Jumlah</b></</td>
		<th><b>Harga</b></</th>
<th><b>Discount</b></</th>
<th><b>Subtotal</b></</th>
	</tr>';
$hasild = $koneksi_db->sql_query("SELECT * FROM `pos_popenjualandetail` WHERE `nopo` like '$kodepo'");
while ($datad =  $koneksi_db->sql_fetchrow ($hasild)){
$admin .= '	
	<tr>
			<td>'.$no.'</td>
		<td>'.getjenjangbarang($datad["kodebarang"]).'</td>
			<td>'.$datad["kodebarang"].'</td>
		<td>'.getnamabarang($datad["kodebarang"]).'</td>
		<td>'.$datad["jumlah"].'</td>
		<td>'.rupiah_format($datad["harga"]).'</td>
		<td>'.cekdiscountpersen($datad["subdiscount"]).'</td>
		<td>'.rupiah_format($datad["subtotal"]).'</td>
	</tr>';
	$no++;
		}
$admin .= '	
	<tr>		
		<td colspan="7" align="right"><b>Total</b></td>
		<td >'.rupiah_format($total).'</td>
	</tr>';
	/*
$admin .= '	
	<tr>	
		<td colspan="7" align="right"><b>Discount</b></td>
		<td >'.cekdiscountpersen($discount).'</td>
	</tr>';
$admin .= '	<tr>	
		<td colspan="7" align="right"><b>Grand Total</b></td>
		<td >'.rupiah_format($netto).'</td>
	</tr>
	';
	
$admin .= '	<tr>	
		<td colspan="7" align="right"><b>Bayar</b></td>
		<td >'.rupiah_format($bayar).'</td>
	</tr>
	';*/
$admin .= '</table></div>';	
		}
	}
}

}
echo $admin;
?>
