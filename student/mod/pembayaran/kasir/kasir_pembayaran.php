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
$lihatslip = '<a href="cetak_notapopenjualan.php?kode='.$data['nopo'].'&lihat=ok&bayar=ok"target ="blank">'.$nopo.'</a>';
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
if($_GET['aksi']=="bayar"){
$nofaktur 		= $_GET['nofaktur'];
$bayar 		= $_POST['bayar'];
$piutang 		= $_POST['piutang'];
bayarpiutang($nofaktur,$bayar );
if($bayar>=$piutang){
penjualancetak($nofaktur);
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=pembayaran&amp;mod=yes" />';	
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
$admin .='</div>';
echo $admin;
}
?>