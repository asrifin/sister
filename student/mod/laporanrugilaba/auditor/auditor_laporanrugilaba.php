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

if (!cek_login ()){
   $admin .='<h4 class="bg">Access Denied !!!!!!</h4>';
}else{

global $koneksi_db,$PHP_SELF,$theme,$error;

$admin  .='<legend>LAPORAN LABA/RUGI</legend>';
$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=laporanrugilaba&mod=yes">LAPORAN</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=laporanrugilaba&mod=yes&aksi=tambah">TAMBAH BIAYA BULANAN</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

$admin .='<div class="panel panel-info">';

if($_GET['aksi']==""){
	$tglmulai 		= $_POST['tglmulai'];
$tglakhir 		= $_POST['tglakhir'];
//$bulan 		= $_POST['bulan'];
//$tahun 		= $_POST['tahun'];
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tglmulai 		= !isset($tglmulai) ? $tglawal : $tglmulai;
$tglakhir 		= !isset($tglakhir) ? $tglnow : $tglakhir;
$admin .='<div class="panel-heading"><b>Laporan Laba/Rugi</b></div>';
/*$bulan 		= !isset($bulan) ? $bulannow : $bulan;
$tahun 		= !isset($tahun) ? $tahunnow : $tahun;
$sel ='<select name="bulan" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_bulan ORDER BY id asc");
$sel .= '<option value="">== Pilih Bulan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['bulan']==$bulan)?"selected":'';
$sel .= '<option value="'.$datas['bulan'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$sel .='</select>';
*/
$admin .= '<form class="form-inline" method="post" action="" enctype ="multipart/form-data" id="posts">
<table class="table table-striped table-hover">';
/*$admin .= '
	<tr>
		<td width="200px">Bulan</td>
		<td>'.$sel.'</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tahun</td>
		<td><input type="text" name="tahun" value="'.$tahun.'" class="form-control" required></td>
	</tr>';
	*/
$admin .= '
	<tr>
		<td width="200px">Tanggal Mulai</td>
		<td><input type="text" name="tglmulai" value="'.$tglmulai.'" class="form-control"id="tglmulai"></td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tanggal Akhir</td>
		<td><input type="text" name="tglakhir"id="tglakhir" value="'.$tglakhir.'" class="form-control">&nbsp;'.$wktakhir.'</td>
	</tr>';
$admin .= '<tr>
	<td></td>
	<td><input type="submit" value="Lihat" name="submitlihat" class="btn btn-success"></td>
	</tr>
</table></form>';
$admin .= '</table>';
}
////////////////////////////////////////
if(isset($_POST['submitlihat'])){
//$bulan 		= $_POST['bulan'];
//$tahun 		= $_POST['tahun'];
$tglmulai 		= $_POST['tglmulai'];
$tglakhir 		= $_POST['tglakhir'];

$admin .='<div class="panel-heading"><b>laporan Rugi Laba</b> , Dari '.tanggalindo($tglmulai).', Sampai '.tanggalindo($tglakhir).'</div>';
$admin .= '
<table class="table table-striped table-hover">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk where jenis='BARANG'" );
$admin .='
<tr>
		<td colspan="4" class="warning"><b>LABA BERSIH/KOTOR BARANG</b></td>
		</tr>
<tr>
		<td width="300px"><b>Jenis</b></td>
		<td><b>Laba Kotor</b></td>
		<td><b>Biaya</b></td>
		<td><b>Laba/Rugi</b></td>
		</tr>
		';
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$idjenis=$data['id'];
$namajenis=$data['nama'];
$subtotalhargajual=getsubtotalhargajual($tglmulai,$tglakhir,$idjenis);
$subtotalhargabeli=getsubtotalhargabeli($tglmulai,$tglakhir,$idjenis);
$subtotalbiaya=getsubtotalbiaya($tglmulai,$tglakhir,$idjenis);
$subtotalbayar = $subtotalhargajual - $subtotalhargabeli;
$admin .='<tr>
		<td>'.$namajenis.'</td>
		<td>'.rupiah_format($subtotalbayar).'</td>
		<td>'.rupiah_format($subtotalbiaya).'</td>		
		<td>'.rupiah_format($subtotalbayar-$subtotalbiaya).'</td>		
		';
$grandsubtotalbayar +=	$subtotalbayar;
$grandtotalbiaya +=	$subtotalbiaya;
$grandlabarugi += $subtotalbayar-$subtotalbiaya;
//$subtotalbayar='0';
//$subtotalbiaya='0';
$admin .='</tr>';
}
$admin .='<tr>
		<td><b>Total</b></td>
		<td><b>'.rupiah_format($grandsubtotalbayar).'</b></td>
		<td><b>'.rupiah_format($grandtotalbiaya).'</b></td>
		<td><b>'.rupiah_format($grandlabarugi).'</b></td>
		</tr>
		';
		/******************  JASA ********/
$hasilj = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk where jenis='JASA'" );
$admin .='
<tr>
		<td colspan="4" class="warning"><b>PENJUALAN</b></td>
		</tr>
<tr>
		<td width="300px"><b>Jenis</b></td>
		<td><b>Penjualan</b></td>
		<td><b>Biaya</b></td>
		<td><b>Laba/Rugi</b></td>
		</tr>
		';
while ($dataj = $koneksi_db->sql_fetchrow($hasilj)) { 
$idjenisj=$dataj['id'];
$namajenisj=$dataj['nama'];
$subtotalbayarj=getsubtotalhargajualjasa($tglmulai,$tglakhir,$idjenisj);
$subtotalbiayaj=getsubtotalbiaya($tglmulai,$tglakhir,$idjenisj);
$admin .='<tr>
		<td>'.$namajenisj.'</td>
		<td>'.rupiah_format($subtotalbayarj).'</td>
		<td>'.rupiah_format($subtotalbiayaj).'</td>		
		<td>'.rupiah_format($subtotalbayarj-$subtotalbiayaj).'</td>		
		';
$grandsubtotalbayarj +=	$subtotalbayarj;
$grandtotalbiayaj +=	$subtotalbiayaj;
$grandlabarugij += $subtotalbayarj-$subtotalbiayaj;
$subtotalbayarj='0';
$subtotalbiayaj='0';
$admin .='</tr>';
}
$admin .='<tr>
		<td><b>Total</b></td>
		<td><b>'.rupiah_format($grandsubtotalbayarj).'</b></td>
		<td><b>'.rupiah_format($grandtotalbiayaj).'</b></td>
		<td><b>'.rupiah_format($grandlabarugij).'</b></td>
		</tr>
		';		
			/************** TOTAL BARANG + JASA ***************/	
$totallabarugi = $grandlabarugi+$grandlabarugij;
$admin .='<tr class="warning">
		<td><b>Total</b></td>
		<td></b></td>
		<td></b></td>
		<td><b>'.rupiah_format($totallabarugi).'</b></td>
		</tr>
		';		
		/************** BIAYA BULANAN ***************/
$admin .='<tr >
		<td colspan="4"class="danger"><b>Biaya Bulanan</b></td>';
$admin .= '';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_biayabulanan where  tgl  BETWEEN '$tglmulai' AND '$tglakhir' " );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$namabb=$data['nama'];
$subtotalbb=$data['subtotal'];
$grandtotalbb+=$data['subtotal'];
$admin .='<tr>
		<td width="300px">'.$namabb.'</td>
		<td></td>
		<td>'.rupiah_format($subtotalbb).'</td>
				<td></td>
	</tr>';
}
$admin .='<tr>
		<td><b>Total :</b></td>
		<td></td>
		<td><b>'.rupiah_format($grandtotalbb).'</b></td>
				<td></td>
	</tr>';
	$labarugi = $totallabarugi - $grandtotalbb;
$admin .='<tr class="success">
		<td><b>Laba / Rugi :</b></td>
				<td></td>
		<td></td>
		<td><b>'.rupiah_format($labarugi).'</b></td>
				<td></td>
	</tr>';
$admin .= '</table>';


$admin .='';
//////////////// CETAK
$admin .= '<form class="form-inline" method="get" target="_blank" action="cetakrugilaba.php" enctype ="multipart/form-data" id="posts">
<table class="table table-striped table-hover">';
$admin .= '<tr>
	<td></td>
	<td><input type="hidden" name="tglmulai" value="'.$tglmulai.'">
	<input type="hidden" name="tglakhir" value="'.$tglakhir.'">
	<input type="submit" value="cetak" name="Cetak" class="btn btn-success"></td>
	</tr>
</table></form>';
$admin .= '</div>';
}

if($_GET['aksi']=="tambah"){
if(isset($_POST['submitbiaya'])){
//	$bulan 		= $_POST['bulan'];
//	$tahun 		= $_POST['tahun'];
$tgl 		= $_POST['tgl'];
	$nama 		= $_POST['nama'];
	$jumlahbiaya 		= $_POST['jumlahbiaya'];
	$error 	= '';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `pos_biayabulanan` (`tgl`,`nama`,`subtotal`) VALUES ('$tgl','$nama','$jumlahbiaya')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($jumlahbiaya);
		unset($tgl);
	}
}
///////////////////// Biaya Bulanan
$tglnow = date("Y-m-d");
$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$nama     		= !isset($nama) ? '' : $nama;
$jumlahbiaya     		= !isset($jumlahbiaya) ? '0' : $jumlahbiaya;
$sel ='<select name="bulan" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_bulan ORDER BY id asc");
$sel .= '<option value="">== Pilih Bulan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['bulan']==$bulan)?"selected":'';
$sel .= '<option value="'.$datas['bulan'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$sel .='</select>';
$admin .= '
<div class="panel-heading"><h3 class="panel-title">Tambah Biaya Bulanan</h3></div>';
$admin .= '
<form method="post" action="" id="posts">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td><input type="text" name="tgl" id="tgl" value="'.$tgl.'"class="form-control"></td>
	</tr>
	<tr>
		<td>Nama Biaya</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" value="'.$nama.'" required></td>
	</tr>
	<tr>
		<td>Jumlah</td>
		<td>:</td>
		<td><input type="text" name="jumlahbiaya" size="25"class="form-control" value="'.$jumlahbiaya.'" required></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submitbiaya"class="btn btn-success"></td>
	</tr>
</table>
</form>';
}

if($_GET['aksi']=="edit"){
$id = int_filter ($_GET['id']);
if(isset($_POST['submitbiaya'])){
$tgl 		= $_POST['tgl'];
	$nama 		= $_POST['nama'];
	$jumlahbiaya 		= $_POST['jumlahbiaya'];
	$error 	= '';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `pos_biayabulanan` SET `tgl`='$tgl',`nama`='$nama',`subtotal`='$jumlahbiaya' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($jumlahbiaya);
		unset($tgl);
	}
}
///////////////////// Biaya Bulanan
$query 		= mysql_query ("SELECT * FROM `pos_biayabulanan` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$tgl  			= $data['tgl'];
$nama  			= $data['nama'];
$jumlahbiaya  			= $data['subtotal'];
$s = date("Y-m-d");
$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$nama     		= !isset($nama) ? '' : $nama;
$jumlahbiaya     		= !isset($jumlahbiaya) ? '0' : $jumlahbiaya;
$sel ='<select name="bulan" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_bulan ORDER BY id asc");
$sel .= '<option value="">== Pilih Bulan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['bulan']==$bulan)?"selected":'';
$sel .= '<option value="'.$datas['bulan'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$sel .='</select>';
$admin .= '
<div class="panel-heading"><h3 class="panel-title">Tambah Biaya Bulanan</h3></div>';
$admin .= '
<form method="post" action="" id="posts">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Tanggal</td>
		<td>:</td>
		<td><input type="text" name="tgl" value="'.$tgl.'">&nbsp;'.$wkt.'</td>
	</tr>
	<tr>
		<td>Nama Biaya</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" value="'.$nama.'" required></td>
	</tr>
	<tr>
		<td>Jumlah</td>
		<td>:</td>
		<td><input type="text" name="jumlahbiaya" size="25"class="form-control" value="'.$jumlahbiaya.'" required></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submitbiaya"class="btn btn-success"></td>
	</tr>
</table>
</form>';
}

if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `pos_biayabulanan` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="danger">Biaya Bulanan berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=laporanrugilaba&mod=yes&aksi=tambah" />';    
	}
}

if (in_array($_GET['aksi'],array('edit','del','tambah'))){

$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Tgl</th>
            <th>Nama</th>
            <th>Jumlah</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_biayabulanan order by tgl desc" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$admin.='<tr>
            <td>'.tanggalindo($data['tgl']).'</td>
            <td>'.$data['nama'].'</td>
            <td>'.$data['subtotal'].'</td>
            <td><a href="?pilih=laporanrugilaba&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=laporanrugilaba&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}


}
$admin .='</div>';
echo $admin;
?>