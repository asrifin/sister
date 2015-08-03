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
<script type="text/javascript">
  $(function() {
$( "#tgl" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
$JS_SCRIPT.= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable({
    "iDisplayLength":50});
} );
</script>
js;
$script_include[] = $JS_SCRIPT;
	
//$index_hal=1;	
	$admin  .='<legend>TRANSAKSI PENJUALAN JASA</legend>';
	$admin  .= '<div class="border2">
<table  width="50%"><tr align="center">
<td>
<a href="admin.php?pilih=penjualanjasa&mod=yes">PENJUALAN JASA</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=penjualanjasa&mod=yes&aksi=cetak">CETAK PENJUALAN JASA</a>&nbsp;&nbsp;
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


if(isset($_POST['submitpenjualan'])){
$_SESSION['kodecustomer'] = $_POST['kodecustomer'];
$nofaktur 		= $_POST['nofaktur'];
$tgl 		= $_POST['tgl'];
$kodecustomer 		= $_SESSION["kodecustomer"];
$total 		= $_POST['total'];
$discount ='0';
$netto = $_POST['total'];
$carabayar 		= $_POST['carabayar'];
$bayar 		= $_POST['bayar'];
$user 		= $_POST['user'];
if ($bayar<$netto)  	$error .= "Error:  Pembayaran Harus Lebih dari Total Netto <br />";
if (!$_SESSION["kodecustomer"])  	$error .= "Error:  Kode Customer harus ada <br />";
if (!$_SESSION["product_id"])  	$error .= "Error:  Kode Jasa harus ada <br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT nofaktur FROM pos_penjualanjasa WHERE nofaktur='$nofaktur'")) > 0) $error .= "Error: Nomor Faktur ".$nofaktur." sudah terdaftar<br />";

if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{
$hasil  = mysql_query( "INSERT INTO `pos_penjualanjasa` VALUES ('','$nofaktur','$tgl','$kodecustomer','$carabayar','$total','$discount','$netto','$bayar','0','0','','$user')" );

$idpenjualan = mysql_insert_id();
foreach ($_SESSION["product_id"] as $cart_itm)
{
$kode = $cart_itm["kode"];
$jenis = $cart_itm["jenis"];
$jumlah = $cart_itm["jumlah"];
$harga = $cart_itm["harga"];
$subdiscount = $cart_itm["subdiscount"];
$subtotal = $cart_itm["subtotal"];
$hasil  = mysql_query( "INSERT INTO `pos_penjualanjasadetail` VALUES ('','$nofaktur','$kode','$jenis','$jumlah','$harga','0','$subdiscount','$subtotal')" );
}
if($hasil){
$admin .= '<div class="sukses"><b>Berhasil Menambah Penjualan Jasa.</b></div>';
penjualanjasarefresh();
penjualanjasacetak($nofaktur);
}else{
$admin .= '<div class="error"><b>Gagal Menambah Penjualan Jasa.</b></div>';
		}		
}	
}

if(isset($_POST['tambahcustomer'])){
$_SESSION['kodecustomer'] = $_POST['kodecustomer'];
echo "<script type=\"text/javascript\">
        window.open('cetak_nofakturjasa.php', '_new')
    </script>";
}

if(isset($_POST['deletecustomer'])){
penjualanjasarefresh();
}

if(isset($_POST['hapusjasa'])){
$kode 		= $_POST['kode'];
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
unset($_SESSION['product_id'][$k]);
    }
}
}

if(isset($_POST['simpandetail'])){
foreach ($_SESSION['product_id'] as $k=>$v){
$_SESSION['product_id'][$k]['subdiscount']=$_POST['subdiscount'][$k];
$_SESSION['product_id'][$k]['jumlah']=$_POST['jumlahjual'][$k];
$_SESSION['product_id'][$k]['harga']=$_POST['harga'][$k];
$nilaidiscount=cekdiscount($_SESSION['product_id'][$k]['subdiscount'],$_SESSION['product_id'][$k]['harga']);
$_SESSION['product_id'][$k]['subtotal'] =$_SESSION['product_id'][$k]['jumlah']*($_SESSION['product_id'][$k]['harga']-$nilaidiscount);
}
//$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penjualanjasa&mod=yes" />';
}

if(isset($_POST['tambahjasa'])){
$_SESSION['kodecustomer'] = $_POST['kodecustomer'];
$kodejasa 		= $_POST['kodejasa'];
$jumlah 		= '1';
$hasil =  $koneksi_db->sql_query( "SELECT * FROM pos_produkjasa WHERE kode='$kodejasa'" );
$data = $koneksi_db->sql_fetchrow($hasil);
$id=$data['id'];
$kode=$data['kode'];
$jenis=$data['jenis'];
$stok=$data['jumlah'];
$harga=$data['hargajual'];
$hargabeli=$data['hargabeli'];
$jenjang=$data['jenjang'];
$error 	= '';
if (!$kode)  	$error .= "Error:  Kode Jasa Tidak di Temukan<br />";
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
}else{
$customer = '
		<td></td>
		<td></td>
		<td></td>';	
	
}

if(isset($_POST['bataljual'])){
penjualanjasarefresh();
}

$carabayar = $_POST['carabayar'];
$termin = $_POST['termin'];

$user = $_SESSION['UserName'];
$tglnow = date("Y-m-d");
$nofaktur = generatefakturjasa();
$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$kodecustomer 		= !isset($kodecustomer) ? $_SESSION['kodecustomer'] : $kodecustomer;
$discount 		= !isset($discount) ? '0' : $discount;
$carabayar 		= !isset($carabayar) ? 'Tunai' : $carabayar;
$termin 		= !isset($termin) ? '0' : $termin;
$sel2 = '<select name="carabayar" class="form-control">';
$arr2 = array ('Tunai');
foreach ($arr2 as $kk=>$vv){
	if ($carabayar == $vv){
	$sel2 .= '<option value="'.$vv.'" selected="selected">'.$vv.'</option>';
	}else {
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	
}
}

$sel2 .= '</select>'; 

$sel3 = '<input type="text" name="termin" value="'.$termin.'" class="form-control">';

$admin .= '
<div class="panel-heading"><b>Transaksi Penjualan Jasa</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor Faktur</td>
		<td>:</td>
		<td><input type="text" name="nofaktur" value="'.$nofaktur.'" class="form-control">&nbsp;<input type="submit" value="Batal" name="bataljual"class="btn btn-danger" ></td>
'.$customer.'
	</tr>';
$admin .= '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td><input type="text" name="tgl" value="'.$tgl.'" id="tgl" class="form-control"></td>
'.$kelas.'
	</tr>';
$admin .= '
	<tr>
		<td>Customer</td>
		<td>:</td>
		<td><select name="kodecustomer" id="combobox">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM psb_calonsiswa ORDER BY nama asc");
$admin .= '<option value="">== Customer ==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['replid']==$kodecustomer)?"selected":'';
$admin .= '<option value="'.$datasj['replid'].'"'.$pilihanj.'>'.$datasj['nama'].'</option>';
}
$admin .='</select>
		<td>Cara Pembayaran</td>
		<td>:</td>
		<td>'.$sel2.'</td>
		</tr>';


$admin .= '
	<tr>
		<td>Kode Jasa</td>
		<td>:</td>
		<td><select name="kodejasa" id="combobox2">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_produkjasa ORDER BY nama asc");
$admin .= '<option value="">== Jasa ==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['kode']==$kodejasa)?"selected":'';
$admin .= '<option value="'.$datasj['kode'].'"'.$pilihanj.'>'.$datasj['nama'].'</option>';
}
$admin .='</select>
					<input type="submit" value="Tambah Jasa" name="tambahjasa"class="btn btn-success" >&nbsp;
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
<div class="panel-heading"><b>Detail Penjualan Jasa</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
		<th><b>Kode</b></</th>
		<th><b>Nama</b></td>
		<th><b>Jumlah</b></</td>
		<th><b>Harga</b></</th>
		<th><b>Discount</b></</th>
<th><b>SubDiscount</b></</th>
<th><b>Subtotal</b></</th>
		<th><b>Aksi</b></</th>
	</tr>';
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
			<td>'.$kode.'</td>
		<td>'.getnamajasa($kode).'</td>
		<td><input align="right" type="text" name="jumlahjual['.$k.']" value="'.$jumlah.'"class="form-control"></td>
		<td><input align="right" type="text" name="harga['.$k.']" value="'.$harga.'"class="form-control"></td>
		<td><input align="right" type="text" name="subdiscount['.$k.']" value="'.$subdiscount.'"class="form-control"></td>
	<td>'.$nilaidiscount.'</td>
		<td>'.$subtotal.'</td>
		<td>'.$subtotal.'</td>
		<td>
		<a href="./admin.php?pilih=penjualanjasa&mod=yes&hapusbarang=ok&kode='.$kode.'" class="btn btn-danger">HAPUS</a></td>
	</tr>';
	$total +=$subtotal;
	$no++;
		}
$admin .= '	
	<tr>
		<td colspan="9" >*Jika melakukan perubahan jumlah atau harga pada detail transaksi klik EDIT DETAIL terlebih dahulu sebelum melakukan SIMPAN </td>
		<td ><input type="submit" value="EDIT DETAIL" name="simpandetail"class="btn btn-warning" ></td>
	</tr>';	
$_SESSION['totaljual']=$total;
$admin .= '	
	<tr>
		<td></td>
		<td></td>		
		<td colspan="7" align="right"><b>Total</b></td>
		<td ><input type="text" name="total" id="total"   class="form-control"  value="'.$_SESSION['totaljual'].'"/></td>
		<td></td>
	</tr>';
$admin .= '	
	<tr>';
$admin .= '<td colspan="8"></td>';
$admin .= '<td align="right"><b>Bayar</b></td>
		<td ><input type="text" id="bayar"  name="bayar" value="'.$_SESSION['totaljual'].'"class="form-control" ></td>
		<td></td>
	</tr>
	';
$admin .= '<tr><td colspan="8"></td><td align="right"></td>
		<td><input type="hidden" name="user" value="'.$user.'">
		<input type="submit" value="Simpan" name="submitpenjualan"class="btn btn-success" >
		</td>
		<td></td></tr>';
$admin .= '</table></form>';

	}
$admin .='</div>';	
	}

if ($_GET['aksi'] == 'cetak'){
$kodefaktur     = $_POST['kodefaktur'];  
if(isset($_POST['batalcetak'])){
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penjualanjasa&mod=yes&aksi=cetak" />';
}
$admin .= '
<div class="panel-heading"><b>Cetak Nota Penjualan Jasa</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$getlastfaktur=getlastfakturjasa();
$admin .= '
	<tr>
		<td>Kode Faktur</td>
		<td>:</td>
		<td><select name="kodefaktur" id="combobox" class="form-inline">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_penjualanjasa ORDER BY id desc");
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['nofaktur']==$kodefaktur)?"selected":'';
$admin .= '<option value="'.$datasj['nofaktur'].'"'.$pilihanj.'>'.$datasj['nofaktur'].' - '.getnamacustomer($datasj['kodecustomer']).'</option>';
}
$admin .='</select>
					<input type="submit" value="Lihat Faktur" name="lihatfaktur"class="btn btn-success" >&nbsp;<input type="submit" value="Batal" name="batalcetak"class="btn btn-danger" >&nbsp;
				</td>
		<td></td>
		<td></td>
		<td></td>
		</tr>';
$admin .= '</form></table></div>';	
if(isset($_POST['lihatfaktur'])){

$no=1;
$query 		= mysql_query ("SELECT * FROM `pos_penjualanjasa` WHERE `nofaktur` like '$kodefaktur'");
$data 		= mysql_fetch_array($query);
$nofaktur  			= $data['nofaktur'];
$tgl  			= $data['tgl'];
$kodecustomer  			= $data['kodecustomer'];
$carabayar  			= $data['carabayar'];
$total  			= $data['total'];
$discount  			= $data['discount'];
$netto  			= $data['netto'];
$bayar  			= $data['bayar'];
$termin  			= $data['termin'];
	$error 	= '';
		if (!$nofaktur) $error .= "Error: kode Faktur tidak terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';}else{
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><b>Transaksi Penjualan Jasa</b></div>';
$admin .= '
		<form method="post" action="cetak_notafakturjasa.php" class="form-inline"id="posts"target="_blank">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor Faktur</td>
		<td>:</td>
		<td>'.$nofaktur.'</td>
		<td><input type="hidden" name="kode" value="'.$nofaktur.'">
		<input type="submit" value="Cetak Nota Jasa" name="cetak_notafakturjasa"class="btn btn-warning" >

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
<div class="panel-heading"><b>Detail Penjualan Jasa</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
<th><b>Jenis</b></</th>
		<th><b>Kode</b></</th>
		<th><b>Nama</b></td>
		<th><b>Harga</b></</th>
<th><b>Discount</b></</th>
<th><b>Subtotal</b></</th>
	</tr>';
$hasild = $koneksi_db->sql_query("SELECT * FROM `pos_penjualanjasadetail` WHERE `nofaktur` like '$kodefaktur'");
while ($datad =  $koneksi_db->sql_fetchrow ($hasild)){
$admin .= '	
	<tr>
			<td>'.$no.'</td>
		<td>'.getjenis($datad["jenis"]).'</td>
			<td>'.$datad["kodejasa"].'</td>
		<td>'.getnamajasa($datad["kodejasa"]).'</td>
		<td>'.rupiah_format($datad["harga"]).'</td>
		<td>'.cekdiscountpersen($datad["subdiscount"]).'</td>
		<td>'.rupiah_format($datad["subtotal"]).'</td>
	</tr>';
	$no++;
		}
$admin .= '	
	<tr>		
		<td colspan="6" align="right"><b>Total</b></td>
		<td >'.rupiah_format($total).'</td>
	</tr>';
$admin .= '	<tr>	
		<td colspan="6" align="right"><b>Bayar</b></td>
		<td >'.rupiah_format($bayar).'</td>
	</tr>
	';
$admin .= '</table></div>';	
		}
	}
}

}
echo $admin;
?>
