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
$JS_SCRIPT.= <<<js
<script type="text/javascript">
  $(function() {
$( "#tgl" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
$script_include[] = $JS_SCRIPT;
	
//$index_hal=1;	
	$admin  .='<legend>PURCHASE REQUISITION (PR)</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=pr&mod=yes">PURCHASE REQUISITION</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=pr&mod=yes&aksi=cetak">CETAK PURCHASE REQUISITION</a>&nbsp;&nbsp;
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



if(isset($_POST['submitpr'])){
$nopr 		= $_POST['nopr'];
$tgl 		= $_POST['tgl'];
$namapr 		= $_POST['namapr'];
$departemenpr 		= $_POST['departemenpr'];
$tujuanpr 		= $_POST['tujuanpr'];
$kategorianggaran 		= $_POST['kategorianggaran'];
$user 		= $_POST['user'];
if (!$_SESSION["namapr"])  	$error .= "Error:  nama Prequisition harus ada <br />";
if (!$_SESSION["product_id"])  	$error .= "Error:  Kode Barang harus ada <br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT nopr FROM pr_pr WHERE nopo='$nopr'")) > 0) $error .= "Error: Nomor PR ".$nopr." sudah terdaftar<br />";

if ($error){
$admin .= '<div class="error">'.$error.'</div>';
}else{
$hasil  = mysql_query( "INSERT INTO `po_pr` VALUES ('','$nopr','$tgl','$namapr','$departemenpr','$tujuanpr','$kategorianggaran','$user')" );
$idpo = mysql_insert_id();
foreach ($_SESSION["product_id"] as $cart_itm)
{
$kode = $cart_itm["kode"];
$jumlah = $cart_itm["jumlah"];
$spesifikasi = $cart_itm["spesifikasi"];

$hasil  = mysql_query( "INSERT INTO `po_prdetail` VALUES ('','$nopr','$kode','$jumlah','$spesifikasi')" );
//updatestokbeli($kode,$jumlah);
}
if($hasil){
$admin .= '<div class="sukses"><b>Berhasil Menambah PR.</b></div>';
//prcetak($nopr);
prrefresh();
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=pr&mod=yes" />';
}else{
$admin .= '<div class="error"><b>Gagal Menambah PR.</b></div>';
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
/*
if(isset($_POST['editjumlah'])){
$kode 		= $_POST['kode'];
$jumlahpr = $_POST['jumlahpr'];
$spesifikasi 		= $_POST['spesifikasi'];
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
$_SESSION['product_id'][$k]['jumlah']=$jumlahpr;
$_SESSION['product_id'][$k]['spesifikasi']=$spesifikasi;
		}
}
}
*/

if(isset($_POST['simpandetail'])){
foreach ($_SESSION['product_id'] as $k=>$v){
$_SESSION['product_id'][$k]['jumlah']=$_POST['jumlahpr'][$k];
$_SESSION['product_id'][$k]['spesifikasi']=$_POST['spesifikasi'][$k];
}
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=pr&mod=yes" />';
}

if(isset($_POST['tambahbarang'])){
	$_SESSION['namapr'] = $_POST['namapr'];
	
$_SESSION['departemenpr'] = $_POST['departemenpr'];
$_SESSION['tujuanpr'] = $_POST['tujuanpr'];
$_SESSION['kategorianggaran'] = $_POST['kategorianggaran'];
$_SESSION['lokasibarang'] = $_POST['lokasibarang'];
$kodebarang 		= $_POST['kodebarang'];
$spesifikasi 		= $_POST['spesifikasi'];
$jumlah 		= '1';
$hasil =  $koneksi_db->sql_query( "SELECT * FROM sar_katalog WHERE replid='$kodebarang'" );
$data = $koneksi_db->sql_fetchrow($hasil);
$kode=$data['replid'];
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
$_SESSION['product_id'][] = array ('id' => $id,'kode' => $kode, 'jumlah' => $jumlah, 'spesifikasi' => '');
}else{
foreach ($_SESSION['product_id'] as $k=>$v){
    if($kode == $_SESSION['product_id'][$k]['kode'])
	{
	$subdiscount="0";
$_SESSION['product_id'][$k]['jumlah'] = $_SESSION['product_id'][$k]['jumlah']+1;
    }
}
		
}
}
}

if(isset($_POST['batalpr'])){
prrefresh();
}

$user = $_SESSION['UserName'];
$tglnow = date("Y-m-d");
$nopr = generatepr();
$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$namapr 		= !isset($namapr) ? $_SESSION['namapr'] : $namapr;
$departemenpr 		= !isset($departemenpr) ? $_SESSION['departemenpr'] : $departemenpr;
$tujuanpr 		= !isset($tujuanpr) ? $_SESSION['tujuanpr'] : $tujuanpr;
$kategorianggaran 		= !isset($kategorianggaran) ? $_SESSION['kategorianggaran'] : $kategorianggaran;
$admin .= '
<div class="panel-heading"><b>Transaksi PR</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor PR</td>
		<td>:</td>
		<td><input type="text" name="nopr" value="'.$nopr.'" class="form-control"></td>
'.$supplier.'
	</tr>';
$admin .= '
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td><input type="text" id="tgl" name="tgl" value="'.$tgl.'" class="form-control"required>&nbsp;</td>
<td></td>
		<td></td>
		<td></td>
	</tr>';
$admin .= '
	<tr>
		<td>Nama Requisition</td>
		<td>:</td>
		<td><input type="text"  name="namapr" value="'.$namapr.'" class="form-control" required>
</td>
	<td></td>
	<td></td>
	<td></td>
		</tr>
				';
$admin .= '<tr>
	<td>Departemen Requisition</td>
		<td>:</td>
	<td><select name="departemenpr" class="form-control" required id="combobox">';
$hasil = $koneksi_db->sql_query("SELECT * FROM aka_tingkat ORDER BY keterangan asc");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$departemenpr)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'"'.$pilihan.'>'.getdepartemendaritingkat($datas['replid']).' - '.$datas['keterangan'].'</option>';
}
$admin .='</select></td>
	<td></td>
	<td></td>
	<td></td>
</tr>';
$admin .= '
	<tr>
		<td>Tujuan Pembelian</td>
		<td>:</td>
		<td><input type="text"  name="tujuanpr" value="'.$tujuanpr.'" class="form-control" required>
</td>
	<td></td>
	<td></td>
	<td></td>
		</tr>
				';
$admin .= '<tr>
	<td>Kategori Anggaran</td>
		<td>:</td>
	<td><select name="kategorianggaran" class="form-control" required id="combobox2">';
$hasil = $koneksi_db->sql_query("SELECT * FROM keu_kategorianggaran ORDER BY nama asc");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$kategorianggaran)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
	<td></td>
	<td></td>
	<td></td>
</tr>';
$admin .= '<tr>
	<td>Kode Barang </td>
			<td>:</td>
	<td><select name="kodebarang" id="combobox3">';
$hasilj = $koneksi_db->sql_query("SELECT sk.replid,sk.kode,sk.nama,sk.keterangan from sar_katalog sk");
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$admin .= '<option value="'.$datasj['kode'].'">'.$datasj['nama'].'</option>';
}
$admin .='</select><input type="submit" value="Tambah Barang" name="tambahbarang"class="btn btn-success" >&nbsp;				</td>
	<td></td>
	<td></td>
	<td></td>
		</tr>
				';
$admin .= '	
</table></div>';	
if(($_SESSION["product_id"])!=""){
$no=1;
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Detail Permintaan</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
		<th><b>Kode</b></</th>
		<th><b>Nama</b></td>
		<th><b>Jumlah</b></td>
		<th><b>Spesifikasi</b></td>		
		<th><b>Aksi</b></</th>
	</tr>';
	if ($_GET['editdetail']){
foreach ($_SESSION["product_id"] as $cart_itm)
        {
$array =$no-1;
$admin .= '
<form method="post" action="" class="form-inline"id="posts">';
$admin .= '	
	<tr>
			<td>'.$no.'</td>
			<td>'.$cart_itm["kode"].'</td>
		<td>'.getnamabarang($cart_itm["kode"]).'</td>
		<td><input align="right" type="text" name="jumlahpr['.$array.']" value="'.$cart_itm["jumlah"].'"class="form-control"></td>
		<td><input align="right" type="text" name="spesifikasi['.$array.']" value="'.$cart_itm["spesifikasi"].'"class="form-control"></td>
		<td>
		<input type="hidden" name="kode" value="'.$cart_itm["kode"].'">
		<input type="submit" value="HAPUS" name="hapusbarang"class="btn btn-danger"></td>
	</tr>';
/*
$admin .= '
</form>';
*/
	$no++;
		}
$admin .= '	
	<tr>
		<td colspan="5" ></td>
		<td ><input type="submit" value="SIMPAN" name="simpandetail"class="btn btn-warning" ></td>
	</tr>';
	$admin .= '
</form>';
	}else{
foreach ($_SESSION["product_id"] as $cart_itm)
        {
$admin .= '	
	<tr>
			<td>'.$no.'</td>
			<td>'.$cart_itm["kode"].'</td>
		<td>'.getnamabarang($cart_itm["kode"]).'</td>
		<td>'.$cart_itm["jumlah"].'</td>
		<td>'.$cart_itm["spesifikasi"].'</td>
		<td>		
		<input type="hidden" name="kode" value="'.$cart_itm["kode"].'"></td>
	</tr>';
	$no++;
		}		
$admin .= '	
	<tr>
		<td colspan="5" ></td>
		<td ><a href="./admin.php?pilih=pr&mod=yes&editdetail=ok" class="btn btn-warning">Edit Detail</a></td>
	</tr>';	
		
	}
	if ($_GET['editdetail']){
$admin .= '
<tr><td colspan="5"></td>
<td></td></tr>';
	}else{
$admin .= '<tr><td colspan="5"></td>
		<td><input type="hidden" name="user" value="'.$user.'">
		<input type="submit" value="Batal" name="batalpr"class="btn btn-danger" >
		<input type="submit" value="Simpan" name="submitpr"class="btn btn-success" >
		</td></tr>';
}
$admin .= '</table>';	
	}
$admin .= '</form></div>';	
}

if ($_GET['aksi'] == 'cetak'){
$kodepr     = $_POST['kodepr'];  
$lastnota =  getlastnota("po_pr","nopr");
$kodepr 		= !isset($kodepr) ? $lastnota : $kodepr;
if(isset($_POST['batalcetak'])){
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=pr&mod=yes&aksi=cetak" />';
}
$admin .= '
<div class="panel-heading"><b>Cetak Nota Purchase Requisition</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '<tr>
	<td>Nomor PR</td>
			<td>:</td>
	<td><select name="kode" id="combobox">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM po_pr ORDER BY id desc");
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$admin .= '<option value="'.$datasj['nopr'].'">'.$datasj['nopr'].' - '.$datasj['namapr'].'</option>';
}
$admin .='</select>&nbsp;&nbsp;<input type="submit" value="Lihat PR" name="lihatpr"class="btn btn-success" >&nbsp;<input type="submit" value="Batal" name="batalcetak"class="btn btn-danger" >&nbsp;</td>

		</tr>';
$admin .= '</form></table></div>';	

if(isset($_POST['lihatpr'])){

$no=1;
$query 		= mysql_query ("SELECT * FROM `po_pr` WHERE `nopr` like '$kodepr'");
$data 		= mysql_fetch_array($query);
$nopr  			= $data['nopr'];
$tgl  			= $data['tgl'];
$namapr  			= $data['namapr'];
$departemenpr  			= $data['departemenpr'];
$tujuanpr  			= $data['tujuanpr'];
$kategorianggaran  			= $data['kategorianggaran'];
	$error 	= '';
		if (!$nopr) $error .= "Error: kode PR tidak terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';}else{
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><b>Purchase Requisition</b></div>';
$admin .= '
		<form method="post" action="cetak_notapr.php" class="form-inline"id="posts"target="_blank">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor PR</td>
		<td>:</td>
		<td>'.$nopr.'</td>
		<td><input type="hidden" name="kode" value="'.$nopr.'">
		<input type="submit" value="Cetak Nota" name="cetak_notapr"class="btn btn-warning" >

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
		<td>Nama PR</td>
		<td>:</td>
		<td>'.$namapr.'</td>
			<td></td>
	</tr>';	
$admin .= '
	<tr>
		<td>Departemen</td>
		<td>:</td>
		<td>'.getdepartemendaritingkat($departemenpr).' - '.getdepartemen($departemenpr).'</td>
			<td></td>
	</tr>';	
	
$admin .= '
	<tr>
		<td>Tujuan Pembelian</td>
		<td>:</td>
		<td>'.$tujuanpr.'</td>
			<td></td>
	</tr>';	
	$lihatanggaran = "<a href='admin.php?pilih=lihatanggaran&mod=yes&katanggaran=$kategorianggaran' target='new'  class='btn btn-info'>Lihat Anggaran</a>";
$admin .= '
	<tr>
		<td>Kategori Anggaran</td>
		<td>:</td>
		<td>'.getkategorianggaran($kategorianggaran).'</td>
			<td>'.$lihatanggaran.'</td>
	</tr>';
$admin .= '</table>		</form></div>';	
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Detail PR</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
		<th><b>Kode</b></</th>
		<th><b>Nama</b></td>
		<th><b>Jumlah</b></</td>
		<th><b>Spesifikasi</b></</td>
	</tr>';
$hasild = $koneksi_db->sql_query("SELECT * FROM `po_prdetail` WHERE `nopr` like '$kodepr'");
while ($datad =  $koneksi_db->sql_fetchrow ($hasild)){
$admin .= '	
	<tr>
		<td>'.$no.'</td>
		<td>'.$datad["kodebarang"].'</td>
		<td>'.getnamabarang($datad["kodebarang"]).'</td>
		<td>'.$datad["jumlah"].'</td>
		<td>'.$datad["spesifikasi"].'</td>
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
