<?php
if (!defined('AURACMS_admin')) {
    Header("Location: ../index.php");
    exit;
}

if (!cek_login()){
    header("location: index.php");
    exit;
} else{
	$admin  .='<legend>KOSONGKAN TABEL</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=kosongkan&mod=yes&aksi=transaksi">TRANSAKSI</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=kosongkan&mod=yes&aksi=stokawal">STOK AWAL</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';
if ($_GET['aksi'] == 'transaksi'){
if(isset($_POST['submit'])){
$tabel = cleantext($_POST['tabel']);	
if ($error){
        $admin.='<div class="error">'.$error.'</div>';
}else{
$query         = $koneksi_db->sql_query ("TRUNCATE TABLE $tabel");	
$admin .= '<div class="sukses">Berhasil menghapus tabel '.$tabel.'</div>';
}
}
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Kosongkan Transaksi</h3></div>';
$admin.='<div class="border">';
$admin.='<form method="post" action="#">
<table width="100%" border="0" cellspacing="0" cellpadding="0">'; 
  
$sel2 = '<select name="tabel" class="form-control">';
$arr2 = array ('pos_po','pos_podetail','pos_popenjualan','pos_popenjualandetail','pos_pembelian','pos_pembeliandetail','pos_pembelianretur','pos_pembelianreturdetail','pos_penjualan','pos_penjualanbiaya','pos_penjualanbiayadetail','pos_penjualandetail','pos_penjualanjasa','pos_penjualanjasadetail','pos_penjualanretur','pos_penjualanreturdetail');
foreach ($arr2 as $kk=>$vv){
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	

}
$sel2 .= '</select>';    
  
  
$admin .='<tr>
    <td style="padding:5px;">Tabel</td>
    <td style="padding:5px;">:</td>
    <td style="padding:5px;">'.$sel2.'</td>
  </tr>';

$admin .='<tr>
	<td style="padding:5px;">&nbsp;</td>
    <td style="padding:5px;">&nbsp;</td>
    <td style="padding:5px;"><input type="submit" value="Kosongkan" name="submit" class="btn btn-success"></td>
  </tr>
</table></form>';
$admin .= '</div>';		

}

if ($_GET['aksi'] == 'stokawal'){
if(isset($_POST['submit'])){
$jenisstok = ($_POST['jenisstok']);	
if ($error){
        $admin.='<div class="error">'.$error.'</div>';
}else{
if($jenisstok=='Stok Awal'){
$query         = $koneksi_db->sql_query ("delete FROM pos_alur_stok where transaksi='Stok Awal'");	
}elseif($jenisstok=='Transaksi'){
$query         = $koneksi_db->sql_query ("delete FROM pos_alur_stok where transaksi<>'Stok Awal'");	
}else{
$query         = $koneksi_db->sql_query ("delete FROM pos_alur_stok");
$query         = $koneksi_db->sql_query ("update pos_produk set jumlah='0'");
}
$admin .= '<div class="sukses">Berhasil Melakukan Pengosongan '.$jenisstok.'</div>';
}
}
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Kosongkan Stok Awal</h3></div>';
$admin.='<div class="border">';
$admin.='<form method="post" action="#">
<table width="100%" border="0" cellspacing="0" cellpadding="0">'; 
  
$sel2 = '<select name="jenisstok" class="form-control">';
$arr2 = array ('Stok Awal','Transaksi','Stok Awal ,Jumlah Barang, Transaksi');
foreach ($arr2 as $kk=>$vv){
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	

}
$sel2 .= '</select>';    
$admin .='<tr>
	<td style="padding:5px;">Jenis Stok</td>
    <td style="padding:5px;">&nbsp;</td>
    <td style="padding:5px;">'.$sel2.'</td>
  </tr>';
$admin .='<tr>
	<td style="padding:5px;">&nbsp;</td>
    <td style="padding:5px;">&nbsp;</td>
    <td style="padding:5px;"><input type="submit" value="Kosongkan" name="submit" class="btn btn-success"></td>
  </tr>
</table></form>';
$admin .= '</div>';		

}

echo $admin;
}

?>