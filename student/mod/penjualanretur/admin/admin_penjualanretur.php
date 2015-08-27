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
	$admin  .='<legend>RETUR PENJUALAN</legend>';
	$admin  .= '<div class="border2">
<table  width="35%"><tr align="center">
<td>
<a href="admin.php?pilih=penjualanretur&mod=yes">RETUR PENJUALAN</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=penjualanretur&mod=yes&aksi=cetak">CETAK RETUR PENJUALAN</a>&nbsp;&nbsp;
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

if(isset($_POST['submitpenjualanretur'])){
$noretur 		= $_POST['noretur'];
$nofaktur 		= $_POST['kodefaktur'];
$tgl 		= $_POST['tgl'];
$kodecustomer 		= $_SESSION["kodecustomer"];
$total 		= $_POST['total'];
$user 		= $_POST['user'];
$carabayar 		= $_POST['carabayar'];
if($carabayar=='Potong Piutang'){
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT nofaktur FROM pos_penjualan WHERE nofaktur='$nofaktur' and (carabayar='Tunai' or carabayar='Debet Card')")) > 0) $error .= "Error: Nomor Faktur ".$nofaktur." bukan merupakan Transaksi Piutang, atau Piutang telah di Lunasi
<br>tidak dapat dilakukan Pemotongan Piutang<br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT nofaktur FROM pos_penjualan WHERE nofaktur='$nofaktur' and piutang='0'")) > 0) $error .= "Error: Nomor Faktur ".$nofaktur." , Piutang telah di Lunasi
<br>tidak dapat dilakukan Pemotongan Piutang<br />";
}
if (!$_SESSION["kodecustomer"])  	$error .= "Error:  Kode Customer harus ada <br />";
if (!$_SESSION["product_id"])  	$error .= "Error:  Kode Barang harus ada <br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT noretur FROM pos_penjualanretur WHERE noretur='$noretur'")) > 0) $error .= "Error: Nomor Retur ".$noretur." sudah terdaftar<br />";

if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{
if($carabayar=='Potong Piutang'){
potongpiutang($nofaktur,$total);
}
$hasil  = mysql_query( "INSERT INTO `pos_penjualanretur` VALUES ('','$noretur','$nofaktur','$tgl','$kodecustomer','$carabayar','$total','$user')" );
$idpenjualan = mysql_insert_id();
foreach ($_SESSION["product_id"] as $cart_itm)
{
$kode = $cart_itm["kode"];
$jumlah = $cart_itm["jumlah"];
$harga = $cart_itm["harga"];
$subdiscount = $cart_itm["subdiscount"];
$subtotal = $cart_itm["subtotal"];

$hasil  = mysql_query( "INSERT INTO `pos_penjualanreturdetail` VALUES ('','$noretur','$nofaktur','$kode','$jumlah','$harga','$subdiscount','$subtotal')" );
updatestokjualretur($kode,$jumlah);
alurstok($tgl,'Retur Penjualan',$noretur,$kode,$jumlah);
}
if($hasil){
$admin .= '<div class="sukses"><b>Berhasil Menambah Retur Penjualan.</b></div>';
penjualanreturrefresh();
penjualanreturcetak($noretur);
unset ($kodecustomer);
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penjualanretur&mod=yes" />';
}else{
$admin .= '<div class="error"><b>Gagal Menambah Retur Penjualan.</b></div>';
		}		
}	
}

if(isset($_POST['tambahcustomer'])){
$_SESSION['kodecustomer'] = $_POST['kodecustomer'];
}

if(isset($_POST['tambahfaktur'])){
$_SESSION['product_id']='';
$_SESSION['totalretur']='';
$_SESSION['kodefaktur'] = $_POST['kodefaktur'];
$hasil3 =  $koneksi_db->sql_query("SELECT * FROM pos_penjualan WHERE nofaktur = '$_SESSION[kodefaktur]'");
$data3 = $koneksi_db->sql_fetchrow($hasil3);
$kodecustomer = $data3['kodecustomer'];
$_SESSION['kodecustomer']=$kodecustomer;	  
$hasil =  $koneksi_db->sql_query( "SELECT * FROM pos_penjualandetail WHERE nofaktur='$_SESSION[kodefaktur]'" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$kode=$data['kodebarang'];
$jumlah=$data['jumlah'];
$harga=$data['harga'];
$subdiscount=$data['subdiscount'];
$nofaktur=$_SESSION['kodefaktur'];
//$ceksisareturjual=$jumlah-ceksisareturjual($nofaktur,$kode);
//$subtotal=$ceksisareturjual*$harga;
$hasil2 =  $koneksi_db->sql_query( "SELECT * FROM pos_produk WHERE kode='$kode'" );
$data2 = $koneksi_db->sql_fetchrow($hasil2);
$id=$data2['id'];
$jenjang=$data2['jenjang'];
$getstokminusreturjual = getstokminusreturjual($_SESSION['kodefaktur'],$kode);
$subtotal=$getstokminusreturjual*$harga;
$PRODUCTID = array ();
foreach ($_SESSION['product_id'] as $k=>$v){
$PRODUCTID[] = $_SESSION['product_id'][$k]['kode'];
}
if (!in_array ($kode, $PRODUCTID)){
$_SESSION['product_id'][] = array ('id' => $id,'kode' => $kode, 'jumlah' => $getstokminusreturjual, 'harga' => $harga, 'jenjang' => $jenjang, 'subdiscount' => $subdiscount, 'subtotal' => $subtotal, 'jumlahjualasli' => $getstokminusreturjual);
}else{
foreach ($_SESSION['product_id'] as $k=>$v){
if($kode == $_SESSION['product_id'][$k]['kode'])
	{
$_SESSION['product_id'][$k]['jumlah'] = $getstokminusreturjual;
    }
}
}
}
}

if(isset($_POST['deletecustomer'])){
penjualanreturrefresh();
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

if(isset($_GET['hapusbarang'])){
$kode 		= $_GET['kode'];
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
unset($_SESSION['product_id'][$k]);
    }
}
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penjualanretur&mod=yes" />';
}

if(isset($_POST['simpandetail'])){
foreach ($_SESSION['product_id'] as $k=>$v){
if (($_POST['kodefaktur'])and($_POST['jumlahjualasli'][$k]<$_POST['jumlahjual'][$k])or($_POST['jumlahjual'][$k]<'0')) $error .= "Error: Jumlah tidak sesuai , silahkan ulangi.<br />";
if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{
foreach ($_SESSION['product_id'] as $k=>$v){
$_SESSION['product_id'][$k]['subdiscount']=$_POST['subdiscount'][$k];
$_SESSION['product_id'][$k]['jumlah']=$_POST['jumlahjual'][$k];
$_SESSION['product_id'][$k]['harga']=$_POST['harga'][$k];
$nilaidiscount=cekdiscount($_SESSION['product_id'][$k]['subdiscount'],$_SESSION['product_id'][$k]['harga']);
$_SESSION['product_id'][$k]['subtotal'] =$_SESSION['product_id'][$k]['jumlah']*($_SESSION['product_id'][$k]['harga']-$nilaidiscount);
}
//$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penjualanretur&mod=yes" />';
}
}
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
$_SESSION['product_id'][] = array ('id' => $id,'kode' => $kode, 'jumlah' => $jumlah, 'harga' => $harga, 'jenjang' => $jenjang, 'subdiscount' => $subdiscount, 'subtotal' => $subtotal);
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

if(isset($_POST['bataljualretur'])){
penjualanreturrefresh();
}

$user = $_SESSION['UserName'];
$tglnow = date("Y-m-d");
$noretur = generatereturjual();
$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$kodefaktur 		= !isset($kodefaktur) ? $_SESSION['kodefaktur'] : $kodefaktur;
$kodecustomer 		= !isset($kodecustomer) ? $_SESSION['kodecustomer'] : $kodecustomer;
$namacustomer 		= !isset($namacustomer) ? getnamacustomer($_SESSION['kodecustomer']) : $namacustomer;
$carabayar 		= !isset($carabayar) ? $_POST['carabayar'] : $carabayar;
$sel2 = '<select name="carabayar" class="form-control" required>';
$arr2 = array ('Tunai','Potong Hutang');
foreach ($arr2 as $kk=>$vv){
if ($carabayar == $vv){
	$sel2 .= '<option value="'.$vv.'" selected="selected">'.$vv.'</option>';
	}else {
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	
	}
}
$sel2 .= '</select>'; 
$admin .= '
<div class="panel-heading"><b>Transaksi Retur Penjualan</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor Retur</td>
		<td>:</td>
		<td><input type="text" name="noretur" value="'.$noretur.'" class="form-control">&nbsp;<input type="submit" value="Batal" name="deletecustomer"class="btn btn-danger" ></td>
'.$customer.'
	</tr>';
$admin .= '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td><input type="text" name="tgl" value="'.$tgl.'" class="form-control"id="tgl"></td>
		<td>Cara Pembayaran</td>
		<td>:</td>
		<td>'.$sel2.'</td>
	</tr>';
$admin .= '
	<tr>
		<td>Kode FAKTUR</td>
		<td>:</td>
		<td><select name="kodefaktur" id="combobox" class="form-inline">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_penjualan ORDER BY id desc");
$admin .= '<option value="">== Faktur ==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['nofaktur']==$kodefaktur)?"selected":'';
$admin .= '<option value="'.$datasj['nofaktur'].'"'.$pilihanj.'>'.$datasj['nofaktur'].' - '.getnamacustomer($datasj['kodecustomer']).' - '.rupiah_format($datasj['netto']).'</option>';
}
$admin .='</select>&nbsp;<input type="submit" value="Tambah FAKTUR" name="tambahfaktur"class="btn btn-success" >
				</td>
		<td></td>
		<td></td>
		<td></td>
		</tr>';
$admin .= '
	<tr>
		<td>Kode Customer</td>
		<td>:</td>
		<td><select name="kodecustomer" id="combobox2">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM psb_calonsiswa ORDER BY nama asc");
$admin .= '<option value="">== Customer ==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['replid']==$kodecustomer)?"selected":'';
$admin .= '<option value="'.$datasj['replid'].'"'.$pilihanj.'>'.$datasj['nama'].'</option>';
}
$admin .='</select>
';
$admin .= '				</td>
		<td></td>
		<td></td>
		<td></td>
		</tr>';
if($_SESSION["kodeinv"]==''){
$admin .= '
	<tr>
		<td>Barang</td>
		<td>:</td>
		<td>
                <select name="kodebarang" id="combobox3">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_produk ORDER BY nama asc");
$admin .= '<option value="">== Barang ==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['kode']==$kodebarang)?"selected":'';
$admin .= '<option value="'.$datasj['kode'].'"'.$pilihanj.'>'.$datasj['nama'].'</option>';
}
$admin .='</select>&nbsp;';
if($_SESSION["kodeinv"]==''){					
$admin .= '<input type="submit" value="Tambah Barang" name="tambahbarang"class="btn btn-success" >';
					}
$admin .='</td>
	<td></td>
	<td></td>
	<td></td>
		</tr>
				';}
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
<div class="panel-heading"><b>Detail Retur Penjualan</b></div>';	
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
<th><b>Subtotal</b></</th>';
if (!$_SESSION['kodefaktur']){
$admin .= '<th><b>Aksi</b></th>';
}
$admin .= '</tr>';
foreach ($_SESSION['product_id'] as $k=>$v){
$subdiscount = $_SESSION['product_id'][$k]['subdiscount'];
$jumlah = $_SESSION['product_id'][$k]['jumlah'];
$harga = $_SESSION['product_id'][$k]['harga'];
$jenjang = $_SESSION['product_id'][$k]["jenjang"];
$kode = $_SESSION['product_id'][$k]["kode"];
$subtotal=$_SESSION['product_id'][$k]["subtotal"];
$jumlahjualasli=$_SESSION['product_id'][$k]["jumlahjualasli"];
$nilaidiscount=cekdiscount($subdiscount,$harga)*$jumlah;
$admin .= '	
	<tr>
			<td>'.$no.'</td>
			<td>'.$kode.'</td>
		<td>'.getnamabarang($kode).'</td>
		<td><input align="right" type="text" name="jumlahjual['.$k.']" value="'.$jumlah.'"class="form-control"></td>
		<td><input align="right" type="text" name="harga['.$k.']" value="'.$harga.'"class="form-control"></td>
		<td><input align="right" type="text" name="subdiscount['.$k.']" value="'.$subdiscount.'"class="form-control"></td>
	<td>'.$nilaidiscount.'</td>
		<td>'.$subtotal.'</td>
		<input align="right" type="hidden" name="jumlahjualasli['.$k.']" value="'.$jumlahjualasli.'"class="form-control"></td>';
		if (!$_SESSION['kodefaktur']){
$admin .= '<td>
		<a href="./admin.php?pilih=penjualanretur&mod=yes&hapusbarang=ok&kode='.$kode.'" class="btn btn-danger">HAPUS</a></td>';
		}
$admin .= '
	</tr>';
	$total +=$subtotal;
	$no++;
		}
$admin .= '	
	<tr>
		<td colspan="8" >*Jika melakukan perubahan jumlah atau harga pada detail transaksi klik EDIT DETAIL terlebih dahulu sebelum melakukan SIMPAN </td>
		<td ><input type="submit" value="EDIT DETAIL" name="simpandetail"class="btn btn-warning" ></td>
	</tr>';	
$_SESSION['totalretur']=$total;
$admin .= '	
	<tr>
		<td></td>
		<td></td>		
		<td colspan="6" align="right"><b>Total</b></td>
		<td ><input type="text" name="total" id="total"   class="form-control"  value="'.$_SESSION['totalretur'].'"/></td>
		<td></td>
	</tr>';

$admin .= '<tr><td colspan="7"></td><td align="right"></td>
		<td><input type="hidden" name="user" value="'.$user.'">
		<input type="submit" value="Simpan" name="submitpenjualanretur"class="btn btn-success" >
		</td>
		<td></td></tr>';
$admin .= '</table></form>';	
}
$admin .='</div>';
}

if ($_GET['aksi'] == 'cetak'){
$koderetur     = $_POST['koderetur'];  
if(isset($_POST['batalcetak'])){
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=penjualanretur&mod=yes&aksi=cetak" />';
}
$admin .= '
<div class="panel-heading"><b>Cetak Nota Retur Penjualan</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$getlastreturjual=getlastreturjual();
$admin .= '
	<tr>
		<td>Kode Retur Penjualan</td>
		<td>:</td>
		<td><select name="koderetur" id="combobox" class="form-inline">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_penjualanretur ORDER BY id desc");
$admin .= '<option value="">== Barang ==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['noretur']==$kodeinvoice)?"selected":'';
$admin .= '<option value="'.$datasj['noretur'].'"'.$pilihanj.'>'.$datasj['noretur'].' - '.getnamacustomer($datasj['kodecustomer']).' - '.tanggalindo($datasj['tgl']).' - '.rupiah_format($datasj['total']).'</option>';
}
$admin .='</select>&nbsp;
					<input type="submit" value="Lihat Retur" name="lihatretur"class="btn btn-success" >&nbsp;<input type="submit" value="Batal" name="batalcetak"class="btn btn-danger" >&nbsp;
				</td>
		<td></td>
		<td></td>
		<td></td>
		</tr>';
$admin .= '</form></table></div>';	
if(isset($_POST['lihatretur'])){

$no=1;
$query 		= mysql_query ("SELECT * FROM `pos_penjualanretur` WHERE `noretur` like '$koderetur'");
$data 		= mysql_fetch_array($query);
$nofaktur  			= $data['nofaktur'];
$noretur  			= $data['noretur'];
$tgl  			= $data['tgl'];
$kodecustomer  			= $data['kodecustomer'];
$total  			= $data['total'];
$lihatslip = '<a href="cetak_notafaktur.php?kode='.$data['nofaktur'].'&lihat=ok"target="new">'.$data['nofaktur'].'</a>';
	$error 	= '';
		if (!$noretur) $error .= "Error: Kode Retur tidak terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';}else{
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><b>Transaksi Retur Penjualan</b></div>';
$admin .= '
		<form method="post" action="cetak_notareturjual.php" class="form-inline"id="posts"target="_blank">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor Retur</td>
		<td>:</td>
		<td>'.$noretur.'</td>
		<td><input type="hidden" name="kode" value="'.$noretur.'">
		<input type="submit" value="Cetak" name="cetak_notareturjual"class="btn btn-warning" >

		</td>
	</tr>';
$admin .= '
	<tr>
		<td>Nomor Faktur</td>
		<td>:</td>
		<td>'.$lihatslip.'</td>
		<td></td>
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
$admin .= '</table>		</form></div>';	
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Detail Retur Penjualan</b></div>';	
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
$hasild = $koneksi_db->sql_query("SELECT * FROM `pos_penjualanreturdetail` WHERE `noretur` like '$koderetur'");
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
$admin .= '</table></div>';	
		}
	}
}

}
echo $admin;
?>
