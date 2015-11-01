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
$( "#tglmulai" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#tglakhir" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
$script_include[] = $JS_SCRIPT;
	$admin  .='<legend>PEMBAYARAN PEMESANAN</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=pembayaran&mod=yes">PEMBAYARAN</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=pembayaran&mod=yes&aksi=cetak">CETAK PEMBAYARAN</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

if($_GET['aksi']==""){
if(isset($_POST['submit'])){
$nofaktur 		= $_POST['nofaktur'];
$bayar 		= $_POST['bayar'];
$piutang 		= $_POST['piutang'];
bayarpiutang($nofaktur,$bayar );
if($bayar>=$piutang){
penjualancetak($nofaktur);
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=pembayaran&amp;mod=yes" />';	
}
}
$admin .= '
<div align="right">
<a href="admin.php?pilih=pembayaran&mod=yes&status=semua" class="btn btn-success"> SEMUA </a>&nbsp;<a href="admin.php?pilih=pembayaran&mod=yes&status=lunas" class="btn btn-primary"> LUNAS </a>&nbsp;<a href="admin.php?pilih=pembayaran&mod=yes&status=pembayaran" class="btn btn-danger"> BELUM LUNAS </a>
</div>';	
$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No.Pemesanan</th>
            <th>Tanggal</th>
            <th>Nama</th>
		   <th>Netto</th>
           <th>Bayar</th>			
           <th>Piutang</th>
		   <th>User</th>

        </tr>
    </thead>';
	$admin.='<tbody>';
		$status 		= $_GET['status'];
if($status=='lunas')
{
         $wherestatus="where carabayar<>'Pemesanan'";
}elseif($status=='semua')
{
         $wherestatus="";
}elseif($status=='pembayaran'or !isset($_GET['status'])){
$wherestatus="where carabayar like'Pemesanan'";
}
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_popenjualan $wherestatus" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nopo=$data['nopo'];
$tgl=$data['tgl'];
$kodecustomer=$data['kodecustomer'];
$carabayar=$data['carabayar'];
$total=$data['total'];
$discount=$data['discount'];
$netto=$data['netto'];
$user=$data['user'];
$cetakslip = '<a href="cetak_notapo.php?kode='.$data['nopo'].'&cetak=ok" target ="blank"><span class="btn btn-success">Cetak</span></a>';
if($carabayar=='Pemesanan'){
//$lihatslip = '<a href="cetak_notapopenjualan.php?kode='.$data['nopo'].'&lihat=ok&bayar=ok"target ="blank">'.$nopo.'</a>';
$lihatslip = '<a href="admin.php?pilih=pembayaran&mod=yes&aksi=pembayaran&kodepo='.$data['nopo'].'&lihat=ok&bayar=ok"target ="blank">'.$nopo.'</a>';
$bayar ='0';
$piutang = $netto;
}else{
$lihatslip = '<a href="cetak_notapopenjualan.php?kode='.$data['nopo'].'&lihat=ok"target ="blank">'.$nopo.'</a>';
$bayar =$netto;
$piutang = '0';
}
$admin.='<tr>
            <td>'.$lihatslip.'</td>
            <td>'.tanggalindo($tgl).'</td>
            <td>'.getnamacustomer($kodecustomer).'</td>
            <td>'.$netto.'</td>
            <td>'.$bayar.'</td>
            <td>'.$piutang.'</td>
            <td>'.$user.'</td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}
if($_GET['aksi']=="pelunasan"){
$kode 		= $_POST['kode'];
$carabayar 		= $_POST['carabayar'];
$query 		= mysql_query ("update pos_popenjualan set carabayar ='$carabayar' where nopo='$kode'");
$style_include[] ='<meta http-equiv="refresh" content="1; url=cetak_notapopenjualan.php?kode='.$kode.'&cetak=ok" />';

$style_include[] ='<meta http-equiv="refresh" content="5; url=admin.php?pilih=pembayaran&amp;mod=yes" />';	
}
}
if($_GET['aksi']=="cetak"){
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tglmulai 		= !isset($tglmulai) ? $tglawal : $tglmulai;
$tglakhir 		= !isset($tglakhir) ? $tglnow : $tglakhir;
$sel = '<select name="status" class="form-control">';
$arr5 = array ('Semua','Tunai','Pemesanan');
foreach ($arr5 as $k=>$v){
	$sel .= '<option value="'.$v.'">'.$v.'</option>';	
	
}
$sel .= '</select>';
$admin .='<div class="panel panel-info">';
$admin .='<div class="panel-heading"><b>Cetak Daftar Pemesanan</b></div>';
$admin .= '<form class="form-inline" method="GET" action="cetakpembayaran.php" enctype ="multipart/form-data" target="_blank" id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td width="200px">Tanggal Mulai</td>
		<td><input type="text" id="tglmulai" name="tglmulai" value="'.$tglmulai.'" class="form-control">&nbsp;</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tanggal Akhir</td>
		<td><input type="text" id="tglakhir" name="tglakhir" value="'.$tglakhir.'" class="form-control">&nbsp;</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Status Bayar</td>
		<td>'.$sel.'	
		</td>
	</tr>';
$admin .= '<tr>
	<td></td>
	<td><input type="submit" value="Cetak" name="cetak" class="btn btn-success"></td>
	</tr>
</table></form>';
$admin .= '</table>';
}

if($_GET['aksi']=="pembayaran"){
if(isset($_POST['kodepo'])){
$kodepo 		= $_POST['kodepo'];
}else{
$kodepo 		= $_GET['kodepo'];	
}
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

<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor PO</td>
		<td>:</td>
		<td>'.$nopo.'</td>
		<td>

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
		<td>Status</td>
		<td>:</td>
		<td>'.$carabayar.'</td>
			<td></td>
	</tr>';	
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

$admin .= '	<tr>	
		<td colspan="7" align="right"><b>Bayar</b></td>
		<td >'.rupiah_format($total).'</td>
	</tr>
	';
	$sel2 = '<select name="carabayar" class="form-control">';
$arr2 = array ('Tunai','Debet Card');
foreach ($arr2 as $kk=>$vv){

	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	
}
$sel2 .= '</select>'; 
	$admin .= '<form method="post" action="admin.php?pilih=pembayaran&mod=yes&aksi=pelunasan" class="form-inline"id="posts">
	<tr>	
		<td colspan="7" align="right">Pembayaran</td>
		<td >'.$sel2.'</td>
	</tr>
	<tr>	
		<td colspan="7" align="right"></td>
		<td >
		<input type="hidden" name="kode" value="'.$nopo.'">
		<input type="submit" value="Bayar" name="bayar"class="btn btn-warning" onclick="return confirm(\'Apakah Anda Yakin Ingin Melunasi Pemesanan Ini ?\')"></td>
	</tr></form>
	';

$admin .= '</table></div>';	
		}
	}
$admin .='</div>';
echo $admin;

?>