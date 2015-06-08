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
<link rel="stylesheet" href="mod/pobatal/style.css" />
';
$admin .= '

<script type="text/javascript" src="mod/pobatal/script.js"></script>
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
	$admin  .='<legend>PEMBATALAN PURCHASE ORDER (PO)</legend>';

$admin .='<div class="panel panel-info">';
$admin .= '<script type="text/javascript" language="javascript">
   function GP_popupConfirmMsg(msg) { //v1.0
  document.MM_returnValue = confirm(msg);
}
</script>';

if ($_GET['aksi'] == ''){
$kodepo     = $_POST['kodepo'];  
if(isset($_POST['batalhapus'])){
$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=pobatal&mod=yes" />';
}
if(isset($_POST['hapuspo'])){
$nopo     = $_POST['kodepo'];
$hasil = $koneksi_db->sql_query("DELETE FROM `po_podetail` WHERE `nopo`='$nopo'");$hasil = $koneksi_db->sql_query("DELETE FROM `po_po` WHERE `nopo`='$nopo'");    
	if($hasil){    
		$admin.='<div class="sukses">Purchase Order berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=pobatal&mod=yes" />';    
	}
}
$admin .= '
<div class="panel-heading"><b>Pembatalan Purchase Order</b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Kode PO</td>
		<td>:</td>
		<td><div class="input_container">
                    <input type="text" id="po_id"  name="kodepo" value="'.$kodepo.'" onkeyup="autocompletpo()" required class="form-control" >
					<input type="submit" value="Lihat PO" name="lihatpo"class="btn btn-success" >&nbsp;<input type="submit" value="Batal" name="batalhapus"class="btn btn-danger" >&nbsp;
					
                    <ul id="po_list_id"></ul>
                </div>
				</td>
		<td></td>
		<td></td>
		<td></td>
		</tr>';
$admin .= '</form></table></div>';	

if(isset($_POST['lihatpo'])){

$no=1;
$query 		= mysql_query ("SELECT * FROM `po_po` WHERE `nopo` like '$kodepo'");
$data 		= mysql_fetch_array($query);
$nopo  			= $data['nopo'];
$tgl  			= $data['tgl'];
$kodesupplier  			= $data['kodesupplier'];
$total  			= $data['total'];
$discount  			= $data['discount'];
$netto  			= $data['netto'];
	$error 	= '';
		if (!$nopo) $error .= "Error: kode PO tidak terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';}else{
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><b>Purchase Order</b></div>';
$admin .= '
		<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Nomor PO</td>
		<td>:</td>
		<td>'.$nopo.'</td>
		<td><input type="hidden" name="kodepo" value="'.$nopo.'">
		<input type="submit" value="Hapus PO" name="hapuspo"class="btn btn-warning" >

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
		<td>Supplier</td>
		<td>:</td>
		<td>'.getnamasupplier($kodesupplier).'</td>
			<td></td>
	</tr>';	

$admin .= '</table>		</form></div>';	
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Detail PO</b></div>';	
$admin .= '
<table class="table table-striped table-hover">';
$admin .= '	
	<tr>
			<th><b>No</b></</th>
		<th><b>Kode</b></</th>
		<th><b>Nama</b></td>
		<th><b>Jumlah</b></</td>
		<th><b>Harga</b></</th>
<th><b>Discount</b></</th>
<th><b>Subtotal</b></</th>
	</tr>';
$hasild = $koneksi_db->sql_query("SELECT * FROM `po_podetail` WHERE `nopo` like '$kodepo'");
while ($datad =  $koneksi_db->sql_fetchrow ($hasild)){
$admin .= '	
	<tr>
		<td>'.$no.'</td>
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
		<td colspan="6" align="right"><b>Total</b></td>
		<td >'.rupiah_format($total).'</td>
	</tr>';
$admin .= '	
	<tr>	
		<td colspan="6" align="right"><b>Discount</b></td>
		<td >'.cekdiscountpersen($discount).'</td>
	</tr>';
$admin .= '	<tr>	
		<td colspan="6" align="right"><b>Grand Total</b></td>
		<td >'.rupiah_format($netto).'</td>
	</tr>
	';
$admin .= '</table></div>';	
		}
	}

	}

}
echo $admin;
?>
