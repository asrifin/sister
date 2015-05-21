<?php
if (!defined('AURACMS_admin')) {
	Header("Location: ../index.php");
	exit;
}
$style_include[] = <<<style
<style type="text/css">
@import url("mod/news/css/news.css");
</style>

style;
$JS_SCRIPT = <<<js
<!-- TinyMCE -->
<script type="text/javascript" src="js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
tinymce.init({
        selector: "textarea",
        plugins: [
                "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
                "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                "table contextmenu directionality emoticons template textcolor paste  textcolor filemanager"
        ],

        toolbar1: "| bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
		toolbar2: "| cut copy paste pastetext | searchreplace | outdent indent blockquote | undo redo | link unlink anchor image media code jbimages | forecolor backcolor",
		toolbar3: "| table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",
        menubar: false,
        toolbar_items_size: 'small',
		image_advtab: true,
forced_root_block : false,
    force_p_newlines : 'false',
    remove_linebreaks : false,
    force_br_newlines : true,
    remove_trailing_nbsp : false,
    verify_html : false,
        templates: [
                {title: 'Test template 1', content: 'Test 1'},
                {title: 'Test template 2', content: 'Test 2'}
        ]
		
});</script>
<!-- /TinyMCE -->
<script type=text/javascript>

	var allowsef = 1;
		
	// generate SEF urls 	
	function genSEF(from,to) { 
		if (allowsef == 1) {
			var str = from.value.toLowerCase();
			str = str.replace(/[^a-zA-Z 0-9]+/g,'');
			str = str.replace(/\s+/g, "-");		
			to.value = str;
		}
	}
		
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
$bulan 		= $_POST['bulan'];
$tahun 		= $_POST['tahun'];
$bulannow = date("m");
$tahunnow = date("Y");
$admin .='<div class="panel-heading"><b>Laporan Laba/Rugi</b></div>';
$bulan 		= !isset($bulan) ? $bulannow : $bulan;
$tahun 		= !isset($tahun) ? $tahunnow : $tahun;
$sel ='<select name="bulan" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_bulan ORDER BY id asc");
$sel .= '<option value="">== Pilih Bulan ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['bulan']==$bulan)?"selected":'';
$sel .= '<option value="'.$datas['bulan'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$sel .='</select>';
$admin .= '<form class="form-inline" method="post" action="" enctype ="multipart/form-data" id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td width="200px">Bulan</td>
		<td>'.$sel.'</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tahun</td>
		<td><input type="text" name="tahun" value="'.$tahun.'" class="form-control" required></td>
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
$bulan 		= $_POST['bulan'];
$tahun 		= $_POST['tahun'];
$admin .='<div class="panel-heading"><b>Pendapatan Barang dan Jasa</b></div>';
$admin .= '
<table class="table table-striped table-hover">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk" );
$admin .='<tr>
		<td width="300px"><b>Jenis</b></td>
		<td><b>Pendapatan</b></td>
		<td><b>Biaya</b></td>
		<td><b>Laba/Rugi</b></td>
		</tr>
		';
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$idjenis=$data['id'];
$namajenis=$data['nama'];
$s2 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualan p,pos_penjualandetail pd where month(p.tgl)='$bulan' and year(p.tgl)='$tahun' and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");
$datas2 = mysql_fetch_array($s2);
$subtotal = $datas2['subtotal'];
$kodejenis = $datas2['kodejenis'];
$subtotalbayar += $datas2['subtotal'];
$s3 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualanjasa p,pos_penjualanjasadetail pd where month(p.tgl)='$bulan' and year(p.tgl)='$tahun' and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");
$datas3 = mysql_fetch_array($s3);
$subtotal = $datas3['subtotal'];
$kodejenis = $datas3['kodejenis'];
$subtotalbayar += $datas3['subtotal'];
////////////////////////////////////////
$s4 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualanbiaya p,pos_penjualanbiayadetail pd where month(p.tgl)='$bulan' and year(p.tgl)='$tahun' and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");	
$datas4 = mysql_fetch_array($s4);
$subtotal = $datas4['subtotal'];
$subtotalbiaya += $datas4['subtotal'];
$admin .='<tr>
		<td>'.$namajenis.'</td>
		<td>'.rupiah_format($subtotalbayar).'</td>
		<td>'.rupiah_format($subtotalbiaya).'</td>		
		<td>'.rupiah_format($subtotalbayar-$subtotalbiaya).'</td>		
		';
$grandtotalbayar +=	$subtotalbayar;
$grandtotalbiaya +=	$subtotalbiaya;
$grandlabarugi += $subtotalbayar-$subtotalbiaya;
$subtotalbayar='0';
$subtotalbiaya='0';
$admin .='</tr>';
}
$admin .='<tr>
		<td><b>Total</b></td>
		<td><b>'.rupiah_format($grandtotalbayar).'</b></td>
		<td><b>'.rupiah_format($grandtotalbiaya).'</b></td>
		<td><b>'.rupiah_format($grandlabarugi).'</b></td>
		</tr>
		';
$admin .='<tr >
		<td colspan="4"class="info"><b>Biaya Bulanan</b></td>';
$admin .= '';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_biayabulanan where bulan='$bulan' and tahun ='$tahun'" );
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
	$labarugi = $grandsubtotalbayar - $grandsubtotalbiaya - $grandtotalbb;
$admin .='<tr class="alert-info">
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
	<td><input type="hidden" name="bulan" value="'.$bulan.'">
	<input type="hidden" name="tahun" value="'.$tahun.'">
	<input type="submit" value="cetak" name="Cetak" class="btn btn-success"></td>
	</tr>
</table></form>';
$admin .= '</div>';
}
/*
if(isset($_POST['submitlihat'])){
$bulan 		= $_POST['bulan'];
$tahun 		= $_POST['tahun'];
$admin .='<div class="panel-heading"><b>Pendapatan Barang dan Jasa</b></div>';
$admin .= '
<table class="table table-striped table-hover">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$idjenis=$data['id'];
$namajenis=$data['nama'];
//$s2 = mysql_query ("SELECT sum(subtotal) as subtotal,jenis as kodejenis FROM `pos_penjualandetail` where jenis = '$idjenis'");	
$s2 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualan p,pos_penjualandetail pd where month(p.tgl)='$bulan' and year(p.tgl)='$tahun' and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");
$datas2 = mysql_fetch_array($s2);
$subtotal = $datas2['subtotal'];
$kodejenis = $datas2['kodejenis'];
$subtotalbayar += $datas2['subtotal'];
//$s3 = mysql_query ("SELECT sum(subtotal) as subtotal,jenis as kodejenis FROM `pos_penjualanjasadetail` where jenis = '$idjenis'");	
$s3 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualanjasa p,pos_penjualanjasadetail pd where month(p.tgl)='$bulan' and year(p.tgl)='$tahun' and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");
$datas3 = mysql_fetch_array($s3);
$subtotal = $datas3['subtotal'];
$kodejenis = $datas3['kodejenis'];
$subtotalbayar += $datas3['subtotal'];
$admin .='<tr>
		<td width="200px">Pendapatan '.$namajenis.' :</td>
		<td>'.rupiah_format($subtotalbayar).'</td>
	</tr>';
$grandsubtotalbayar +=$subtotalbayar;
$subtotalbayar='0';
}
$admin .='<tr>
		<td width="200px"><b>Total :</td>
		<td>'.rupiah_format($grandsubtotalbayar).'</b></td>
	</tr>';
$admin .= '</table>';
/////////////////////////////////
$admin .='<div class="panel-heading"><b>Biaya - Biaya</b></div>';
$admin .= '
<table class="table table-striped table-hover">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$idjenis=$data['id'];
$namajenis=$data['nama'];
//$s4 = mysql_query ("SELECT sum(subtotal) as subtotal,jenis as kodejenis FROM `pos_penjualanbiayadetail` where jenis = '$idjenis'");
$s4 = mysql_query ("SELECT sum(pd.subtotal) as subtotal,pd.jenis as kodejenis FROM pos_penjualanbiaya p,pos_penjualanbiayadetail pd where month(p.tgl)='$bulan' and year(p.tgl)='$tahun' and p.nofaktur=pd.nofaktur and pd.jenis = '$idjenis'");	
$datas4 = mysql_fetch_array($s4);
$subtotal = $datas4['subtotal'];
$kodejenis = $datas4['kodejenis'];
$subtotalbiaya += $datas4['subtotal'];
$admin .='<tr>
		<td width="200px">Biaya '.$namajenis.' :</td>
		<td>'.rupiah_format($subtotalbiaya).'</td>
	</tr>';
$grandsubtotalbiaya +=$subtotalbiaya;
	$subtotalbiaya='0';
}
$admin .='<tr>
		<td width="200px"><b>Total :</td>
		<td>'.rupiah_format($grandsubtotalbiaya).'</b></td>
	</tr>';
$admin .= '</table>';
$admin .='<div class="panel-heading"><b>Biaya Bulanan</b></div>';
$admin .= '
<table class="table table-striped table-hover">';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_biayabulanan where bulan='$bulan' and tahun ='$tahun'" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$namabb=$data['nama'];
$subtotalbb=$data['subtotal'];
$grandtotalbb+=$data['subtotal'];
$admin .='<tr>
		<td width="400px">'.$namabb.'</td>
		<td>'.rupiah_format($subtotalbb).'</td>
	</tr>';
}
$admin .='<tr>
		<td width="200px"><b>Total :</td>
		<td>'.rupiah_format($grandtotalbb).'</b></td>
	</tr>';
$admin .= '</table>';
$labarugi = $grandsubtotalbayar - $grandsubtotalbiaya - $grandtotalbb;
$admin .='<div class="panel-heading"><b>Laba / Rugi :  '.rupiah_format($labarugi).'</b></div>';
$admin .='';
//////////////// CETAK
$admin .= '<form class="form-inline" method="get" target="_blank" action="cetakrugilaba.php" enctype ="multipart/form-data" id="posts">
<table class="table table-striped table-hover">';
$admin .= '<tr>
	<td></td>
	<td><input type="hidden" name="bulan" value="'.$bulan.'">
	<input type="hidden" name="tahun" value="'.$tahun.'">
	<input type="submit" value="cetak" name="Cetak" class="btn btn-success"></td>
	</tr>
</table></form>';
$admin .= '</div>';
}
*/
if($_GET['aksi']=="tambah"){
if(isset($_POST['submitbiaya'])){
	$bulan 		= $_POST['bulan'];
	$tahun 		= $_POST['tahun'];
	$nama 		= $_POST['nama'];
	$jumlahbiaya 		= $_POST['jumlahbiaya'];
	$error 	= '';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `pos_biayabulanan` (`bulan`,`tahun`,`nama`,`subtotal`) VALUES ('$bulan','$tahun','$nama','$jumlahbiaya')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($jumlahbiaya);
		unset($bulan);
		unset($tahun);
	}
}
///////////////////// Biaya Bulanan
$bulannow = date("m");
$tahunnow = date("Y");
$bulan 		= !isset($bulan) ? $bulannow : $bulan;
$tahun 		= !isset($tahun) ? $tahunnow : $tahun;
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
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Bulan</td>
		<td>:</td>
		<td>'.$sel.'</td>
	</tr>
	<tr>
		<td>Tahun</td>
		<td>:</td>
		<td><input type="text" name="tahun" size="25"class="form-control" value="'.$tahun.'" required></td>
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
	$bulan 		= $_POST['bulan'];
	$tahun 		= $_POST['tahun'];
	$nama 		= $_POST['nama'];
	$jumlahbiaya 		= $_POST['jumlahbiaya'];
	$error 	= '';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `pos_biayabulanan` SET `bulan`='$bulan',`tahun`='$tahun',`nama`='$nama',`subtotal`='$jumlahbiaya' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
		unset($jumlahbiaya);
		unset($bulan);
		unset($tahun);
	}
}
///////////////////// Biaya Bulanan
$query 		= mysql_query ("SELECT * FROM `pos_biayabulanan` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$bulan  			= $data['bulan'];
$tahun  			= $data['tahun'];
$nama  			= $data['nama'];
$jumlahbiaya  			= $data['subtotal'];

$bulannow = date("m");
$tahunnow = date("Y");
$bulan 		= !isset($bulan) ? $bulannow : $bulan;
$tahun 		= !isset($tahun) ? $tahunnow : $tahun;
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
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Bulan</td>
		<td>:</td>
		<td>'.$sel.'</td>
	</tr>
	<tr>
		<td>Tahun</td>
		<td>:</td>
		<td><input type="text" name="tahun" size="25"class="form-control" value="'.$tahun.'" required></td>
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
            <th>Bulan</th>
            <th>Tahun</th>
            <th>Nama</th>
            <th>Jumlah</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_biayabulanan" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$admin.='<tr>
            <td>'.$data['bulan'].'</td>
            <td>'.$data['tahun'].'</td>
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