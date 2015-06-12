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
<link rel="stylesheet" href="mod/pr/style.css" />
';
$admin .= '

<script type="text/javascript" src="mod/pr/script.js"></script>
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
	$admin  .='<legend>PURCHASE REQUISITION (PR)</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=pr&mod=yes">HOME</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=pr&mod=yes&aksi=cetak">CETAK PR</a>&nbsp;&nbsp;
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
$lokasibarang 		= !isset($lokasibarang) ? $_SESSION['lokasibarang'] : $lokasibarang;
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
		<td><input type="text" name="tgl" value="'.$tgl.'" class="form-control"required>&nbsp;'.$wkt.'</td>
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
	<td><select name="departemenpr" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM aka_tingkat ORDER BY keterangan asc");
$admin .= '<option value="">== Departemen ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$departemenpr)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'"'.$pilihan.'>'.$datas['keterangan'].'</option>';
}
$admin .='</select></td>
	<td></td>
	<td></td>
	<td></td>
</tr>';
/*
$admin .= '
	<tr>
		<td>Departemen Requisition</td>
		<td>:</td>
		<td><input type="text"  name="departemenpr" value="'.$departemenpr.'" class="form-control" >
</td>
	<td></td>
	<td></td>
	<td></td>
		</tr>
				';
				*/
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
	<td><select name="kategorianggaran" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM keu_kategorianggaran ORDER BY nama asc");
$admin .= '<option value="">== Anggaran ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['replid']==$kategorianggaran)?"selected":'';
$admin .= '<option value="'.$datas['replid'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
	<td></td>
	<td></td>
	<td></td>
</tr>';

$admin .='<tr>
		<td>Lokasi Barang</td>
		<td>:</td>
	<td><select name="lokasibarang" id="lokasibarang" class="form-control" required onchange="ambil_barang($(this).val())">';
$hasil = $koneksi_db->sql_query("SELECT * FROM sar_lokasi ORDER BY nama asc");
$admin .= '<option value="">== Lokasi ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['kode']==$lokasibarang)?"selected":'';
$admin .= '<option value="'.$datas['kode'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
	<td></td>
	<td></td>
	<td></td>
		</tr>
				';

$admin .='<tr>
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
$nilaidiscount=cekdiscount($cart_itm["subdiscount"],$cart_itm["harga"]);
$admin .= '
<form method="post" action="" class="form-inline"id="posts">';
$admin .= '	
	<tr>
			<td>'.$no.'</td>
			<td>'.$cart_itm["kode"].'</td>
		<td>'.getnamabarang($cart_itm["kode"]).'</td>
		<td><input align="right" type="text" name="jumlahpr" value="'.$cart_itm["jumlah"].'"class="form-control"></td>
		<td><input align="right" type="text" name="spesifikasi" value="'.$cart_itm["spesifikasi"].'"class="form-control"></td>
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
		<td colspan="5" ></td>
		<td ><a href="./admin.php?pilih=pr&mod=yes" class="btn btn-success">Simpan Detail</a></td>
	</tr>';
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
$admin .= '<tr><td colspan="5"></td>
		<td><input type="hidden" name="user" value="'.$user.'">
		<input type="submit" value="Batal" name="batalpr"class="btn btn-danger" >
		<input type="submit" value="Simpan" name="submitpr"class="btn btn-success" >
		</td></tr>';
$admin .= '</table>';	
	}
$admin .= '</form></div>';	
}

if ($_GET['aksi'] == 'cetak'){
$kodepr     = $_POST['kodepr'];  
if(isset($_POST['batalcetak'])){
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=pr&mod=yes&aksi=cetak" />';
}
$admin .= '
<div class="panel-heading"><b>Cetak Nota Purchase Requisition</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Kode PR</td>
		<td>:</td>
		<td><div class="input_container">
                    <input type="text" id="pr_id"  name="kodepr" value="'.$kodepr.'" onkeyup="autocompletpr()" required class="form-control" >
					<input type="submit" value="Lihat PR" name="lihatpr"class="btn btn-success" >&nbsp;<input type="submit" value="Batal" name="batalcetak"class="btn btn-danger" >&nbsp;
					
                    <ul id="pr_list_id"></ul>
                </div>
				</td>
		<td></td>
		<td></td>
		<td></td>
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
		<td>'.getdepartemen($departemenpr).'</td>
			<td></td>
	</tr>';	
	
$admin .= '
	<tr>
		<td>Tujuan Pembelian</td>
		<td>:</td>
		<td>'.$tujuanpr.'</td>
			<td></td>
	</tr>';	
$admin .= '
	<tr>
		<td>Kategori Anggaran</td>
		<td>:</td>
		<td>'.getkategorianggaran($kategorianggaran).'</td>
			<td></td>
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
