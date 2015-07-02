<?php
if (!defined('AURACMS_admin')) {
	Header("Location: ../index.php");
	exit;
}
include "includes/excel_reader2.php";
//$index_hal = 1;
if (!cek_login ()){   
	
$admin .='<p class="judul">Access Denied !!!!!!</p>';
}else{

$JS_SCRIPT= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );
</script>
js;
$script_include[] = $JS_SCRIPT;
$admin  .='<legend>STOK</legend>';
$admin  .= '<div class="border2">
<table  ><tr align="center">
<td>
<a href="admin.php?pilih=stok&mod=yes&aksi=stokopname">STOK OPNAME</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';
if($_GET['aksi'] == 'stokopname'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$tgl 		= $_POST['tgl'];
	$kode 		= $_POST['kode'];
	$jumlah 		= $_POST['jumlah'];
	$selisih 		= $_POST['selisih'];
	$mutasi 		= $_POST['mutasi'];

	$error 	= '';
if (!$kode)  $error .= "Error: Barang belum dipilih , silahkan ulangi.<br />";
if (!$selisih and $mutasi=='stok awal' and $jumlah=='0')  $error .= "Error: selisih belum diisi , silahkan ulangi.<br />";
if (!$selisih and $mutasi!='stok awal')  $error .= "Error: selisih belum diisi , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		if($mutasi=='mutasi masuk'){
	$jumlahbaru = $jumlah + $selisih;
		alurstok($tgl,$mutasi,'-',$kode,$selisih);
		$hasil  = mysql_query( "UPDATE `pos_produk` SET `jumlah`='$jumlahbaru' WHERE `id`='$id'" );
	}elseif ($mutasi=='mutasi keluar')
	{
	$jumlahbaru = $jumlah - $selisih;	
	alurstok($tgl,$mutasi,'-',$kode,$selisih);
	$hasil  = mysql_query( "UPDATE `pos_produk` SET `jumlah`='$jumlahbaru' WHERE `id`='$id'" );
	}else{
	$ceksaldoawal = ceksaldoawal($kode);
if($ceksaldoawal=='0' and $jumlah=='0'){
alurstok($tgl,$mutasi,'-',$kode,$selisih);
$hasil  = mysql_query( "UPDATE `pos_produk` SET `jumlah`='$selisih' WHERE `id`='$id'");
}elseif($ceksaldoawal=='0' and $jumlah){
alurstok($tgl,$mutasi,'-',$kode,$jumlah);
}

else{
$hasil  = mysql_query( "UPDATE `pos_alur_stok` SET `jumlah`='$jumlah' WHERE `id`='$id'" );
}
	}
	//	$hasil  = mysql_query( "UPDATE `pos_produk` SET `jumlah`='$jumlahbaru' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
		//	$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produk&amp;mod=yes&aksi=stokopname" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}
}
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$query 		= mysql_query ("SELECT * FROM `pos_produk` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$jenis  			= $data['jenis'];
$jenjang  			= $data['jenjang'];
$sel2 = '<select name="mutasi" class="form-control">';
$arr2 = array ('stok awal');
foreach ($arr2 as $kk=>$vv){
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	

}

$sel2 .= '</select>'; 
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit Produk</h3></div>';
$admin .= '
<form method="post" action="" id="posts"class="form-inline" >
<table class="table table-striped table-hover">
	<tr>
		<td>Tanggal Stok Opname/Stok Awal</td>
		<td>:</td>
		<td><input type="text" name="tgl" value="'.$tgl.'"class="form-control" >&nbsp;'.$wktmulai.'</td>
	</tr>
	<tr>
		<td>Kode Barang</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" value="'.$data['kode'].'" disabled></td>
	</tr>
	<tr>
		<td>Nama Barang</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" value="'.$data['nama'].'" disabled></td>
	</tr>
	<tr>
		<td>Jumlah Stok Sekarang</td>
		<td>:</td>
		<td><input type="text" name="jumlah2" size="25"class="form-control"value="'.$data['jumlah'].'" disabled></td>
	</tr>
	<tr>
		<td>Tipe Mutasi</td>
		<td>:</td>
		<td>'.$sel2.'</td>
	</tr>
		<tr>
		<td>Selisih Stok</td>
		<td>:</td>
		<td><input type="text" name="selisih" size="25"class="form-control"value="0"></td>
	</tr>

	<tr>
		<td></td>
		<td></td>
		<td>
<input type="hidden" name="jumlah" size="25"class="form-control"value="'.$data['jumlah'].'">
<input type="hidden" name="kode" size="25"class="form-control"value="'.$data['kode'].'">
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';	
}

if (in_array($_GET['aksi'],array('','stokopname'))){

$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kategori</th>
            <th>Jenjang</th>
            <th>Kode</th>
			<th>Nama Barang</th>
           <th>Stok Awal</th>			
           <th>Stok</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_produk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$jenjang=$data['jenjang'];
$kode=$data['kode'];
$nama=$data['nama'];
$jenis=$data['jenis'];
$jumlah=$data['jumlah'];
$admin.='<tr>
            <td>'.getjenis($jenis).'</td>
            <td>'.getjenjang($jenjang).'</td>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.ceksaldoawal($kode).'</td>
            <td>'.$jumlah.'</td>
            <td><a href="?pilih=stok&amp;mod=yes&amp;aksi=stokopname&amp;id='.$data['id'].'"><span class="btn btn-warning">Stok Opname</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

}
echo $admin;
?>