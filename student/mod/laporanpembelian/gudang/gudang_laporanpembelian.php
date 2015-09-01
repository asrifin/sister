<?php
if (!defined('AURACMS_admin')) {
	Header("Location: ../index.php");
	exit;
}
$JS_SCRIPT.= <<<js
<script type="text/javascript">
  $(function() {
$( "#tglmulai" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#tglakhir" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
$script_include[] = $JS_SCRIPT;

if (!cek_login ()){
   $admin .='<h4 class="bg">Access Denied !!!!!!</h4>';
}else{

global $koneksi_db,$PHP_SELF,$theme,$error;

$admin  .='<legend>LAPORAN</legend>';
$admin .='<div class="panel panel-info">';

if($_GET['aksi']==""){
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tglmulai 		= !isset($tglmulai) ? $tglnow : $tglmulai;
$tglakhir 		= !isset($tglakhir) ? $tglnow : $tglakhir;
$sel = '<select name="carabayar" class="form-control">';
$arr5 = array ('Semua','Tunai','Debet Card','Hutang');
foreach ($arr5 as $k=>$v){
	$sel .= '<option value="'.$v.'">'.$v.'</option>';	
	
}
$sel .= '</select>';

$admin .='<div class="panel-heading"><b>Laporan Pembelian</b></div>';
$admin .= '<form class="form-inline" method="get" action="cetakpembelian.php" enctype ="multipart/form-data" id="posts" target="_blank">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td width="200px">Tanggal Mulai</td>
		<td><input type="text" name="tglmulai" id="tglmulai" value="'.$tglmulai.'" class="form-control">&nbsp;</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tanggal Akhir</td>
		<td><input type="text" name="tglakhir" id="tglakhir" value="'.$tglakhir.'" class="form-control">&nbsp;</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Cara Bayar</td>
		<td>'.$sel.'	
		</td>
	</tr>';
$admin .= '<tr>
	<td>Supplier </td>
	<td><select name="supplier" id="combobox">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_supplier ORDER BY nama asc");
$admin .= '<option value="Semua"> Semua </option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$admin .= '<option value="'.$datasj['kode'].'">'.$datasj['nama'].'</option>';
}
$admin .='</select></td>
</tr>';
$admin .= '
	<tr>
		<td width="200px">Detail</td>
		<td><input type="radio" name="detail" value="ok" checked> Ya , &nbsp;<input type="radio" name="detail" value="tidak"> Tidak	&nbsp; Untuk Pilihan Jenis dan berdasarkan Barang akan ditampilkan secara Detail
		</td>
	</tr>';
$admin .= '<tr>
	<td>Jenis </td>
	<td><select name="jenisproduk" id="combobox2">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_jenisproduk where jenis='BARANG' ORDER BY nama asc");
$admin .= '<option value="Semua"> Semua </option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$admin .= '<option value="'.$datasj['id'].'">'.$datasj['nama'].'</option>';
}
$admin .='</select></td>
</tr>';
$admin .= '<tr>
	<td>Barang </td>
	<td><select name="kodebarang" id="combobox3">';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_produk ORDER BY nama asc");
$admin .= '<option value="Semua"> Semua </option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$admin .= '<option value="'.$datasj['kode'].'">'.$datasj['nama'].'</option>';
}
$admin .='</select></td>
</tr>';
$admin .= '<tr>
	<td></td>
	<td><input type="submit" value="Cetak" name="submit" class="btn btn-success"></td>
	</tr>
</table>';
$admin .= "* Apabila tidak dapat melakukan print, klik kanan pilih open link New Tab";
/*DETAIL*/
}

}
$admin .='</div>';
echo $admin;
?>