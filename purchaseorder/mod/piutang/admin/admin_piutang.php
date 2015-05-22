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
$style_include[] .= '<link rel="stylesheet" media="screen" href="mod/calendar/css/dynCalendar.css" />';
$admin .= '
<script language="javascript" type="text/javascript" src="mod/calendar/js/browserSniffer.js"></script>
<script language="javascript" type="text/javascript" src="mod/calendar/js/dynCalendar.js"></script>';
$wktmulai = <<<eof
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
        document.forms['posts'].tglmulai.value = year + '-' + month + '-' + date;
    }
    calendar3 = new dynCalendar('calendar3', 'exampleCallback_ISO3');
    calendar3.setMonthCombo(true);
    calendar3.setYearCombo(true);
/*]]>*/     
</script>
eof;
$wktakhir = <<<eof
<script language="JavaScript" type="text/javascript">
    
    /**
    * Example callback function
    */
    /*<![CDATA[*/
    function exampleCallback_ISO2(date, month, year)
    {
        if (String(month).length == 1) {
            month = '0' + month;
        }
    
        if (String(date).length == 1) {
            date = '0' + date;
        }    
        document.forms['posts'].tglakhir.value = year + '-' + month + '-' + date;
    }
    calendar2 = new dynCalendar('calendar2', 'exampleCallback_ISO2');
    calendar2.setMonthCombo(true);
    calendar2.setYearCombo(true);
/*]]>*/     
</script>
eof;
$script_include[] = $JS_SCRIPT;
	$admin  .='<legend>PEMBAYARAN PIUTANG</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=piutang&mod=yes">HOME</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=piutang&mod=yes&aksi=cetak">CETAK PIUTANG</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

if($_GET['aksi']==""){
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tglmulai 		= !isset($tglmulai) ? $tglawal : $tglmulai;
$tglakhir 		= !isset($tglakhir) ? $tglnow : $tglakhir;
$sel = '<select name="status" class="form-control">';
$arr5 = array ('Semua','Piutang','Lunas');
foreach ($arr5 as $k=>$v){
	$sel .= '<option value="'.$v.'">'.$v.'</option>';	
	
}
$sel .= '</select>';
$admin .='<div class="panel panel-info">';
$admin .='<div class="panel-heading"><b>Lihat Daftar Piutang</b></div>';
$admin .= '<form class="form-inline" method="post" action="" enctype ="multipart/form-data" id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td width="200px">Tanggal Mulai</td>
		<td><input type="text" name="tglmulai" value="'.$tglmulai.'" class="form-control">&nbsp;'.$wktmulai.'</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tanggal Akhir</td>
		<td><input type="text" name="tglakhir" value="'.$tglakhir.'" class="form-control">&nbsp;'.$wktakhir.'</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Status Bayar</td>
		<td>'.$sel.'	
		</td>
	</tr>';
$admin .= '<tr>
	<td></td>
	<td><input type="submit" value="Lihat" name="lihat" class="btn btn-success"></td>
	</tr>
</table></form>';
$admin .= '</table>';
}

if(isset($_POST['lihat'])){
$tglmulai 		= $_POST['tglmulai'];
$tglakhir 		= $_POST['tglakhir'];
$status 		= $_POST['status'];
switch ($status) {
   case 'Semua':
         $wherestatus="";
         break;
   case 'Lunas':
         $wherestatus="and Piutang='0'";
         break;
   case 'Piutang':
         $wherestatus="and Piutang<>'0'";
         break;
}
$admin .= '
<div class="panel-heading"><b>Daftar Piutang</b></div>';	
$admin.='
<table class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>No.Faktur</th>
            <th>Tanggal</th>
            <th>Customer</th>
            <th>Total</th>
            <th>Bayar</th>
            <th>Kekurangan</th>
            <th>Jatuh Tempo</th>
            <th width="10%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM `pos_penjualan` where tgl >= '$tglmulai' and tgl <= '$tglakhir' $wherestatus order by tgltermin asc" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$nofaktur = $data['nofaktur'];
$piutang = $data['piutang'];
if($piutang>'0'){
$tombollunas = '<a href="?pilih=piutang&amp;mod=yes&amp;aksi=bayar&amp;nofaktur='.$data['nofaktur'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Melunasi Faktur '.$nofaktur.'  ?\')"><span class="btn btn-danger">Pelunasan</span></a>';
}else{
$tombollunas = '<span class="btn btn-primary">Lunas</span>';
}
$admin.='<tr>
            <td>'.$data['nofaktur'].'</td>
            <td>'.tanggalindo($data['tgl']).'</td>
            <td>'.getnamacustomer($data['kodecustomer']).'</td>
            <td>'.rupiah_format($data['total']).'</td>
            <td>'.rupiah_format($data['bayar']).'</td>
            <td>'.rupiah_format($data['piutang']).'</td>
            <td>'.tanggalindo($data['tgltermin']).'</td>
            <td>'.$tombollunas.'</td>
        </tr>';
$ttotal += $data['total'];
$tbayar += $data['bayar'];
$tpiutang += $data['piutang'];
}   
$admin.='<tr>
            <td colspan="3">Grand Total</td>
            <td>'.rupiah_format($ttotal).'</td>
            <td>'.rupiah_format($tbayar).'</td>
            <td>'.rupiah_format($tpiutang).'</td>
            <td colspan="2"></td>
        </tr>';
$admin.='</tbody>
</table>';
}
if($_GET['aksi']=="bayar"){
$nofaktur 		= $_GET['nofaktur'];
lunaspiutang($nofaktur );
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=piutang&amp;mod=yes" />';	
}
if($_GET['aksi']=="cetak"){
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tglmulai 		= !isset($tglmulai) ? $tglawal : $tglmulai;
$tglakhir 		= !isset($tglakhir) ? $tglnow : $tglakhir;
$sel = '<select name="status" class="form-control">';
$arr5 = array ('Semua','Piutang','Lunas');
foreach ($arr5 as $k=>$v){
	$sel .= '<option value="'.$v.'">'.$v.'</option>';	
	
}
$sel .= '</select>';
$admin .='<div class="panel panel-info">';
$admin .='<div class="panel-heading"><b>Cetak Daftar Piutang</b></div>';
$admin .= '<form class="form-inline" method="GET" action="cetakpiutang.php" enctype ="multipart/form-data" target="_blank" id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td width="200px">Tanggal Mulai</td>
		<td><input type="text" name="tglmulai" value="'.$tglmulai.'" class="form-control">&nbsp;'.$wktmulai.'</td>
	</tr>';
$admin .= '
	<tr>
		<td width="200px">Tanggal Akhir</td>
		<td><input type="text" name="tglakhir" value="'.$tglakhir.'" class="form-control">&nbsp;'.$wktakhir.'</td>
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