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

$admin .='<div class="panel-heading"><b>Laporan Pemesanan</b></div>';
$admin .= '<form class="form-inline" method="get" action="cetakpemesanan.php" enctype ="multipart/form-data" id="posts" target="_blank">
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
		<td width="200px">Detail</td>
		<td><input type="radio" name="detail" value="ok" checked> Ya , &nbsp;<input type="radio" name="detail" value="tidak"> Tidak	&nbsp; 
		</td>
	</tr>';
$admin .= '<tr>
	<td></td>
	<td><input type="submit" value="Cetak" name="submit" class="btn btn-success"></td>
	</tr>
</table>';

/*DETAIL*/
}

}
$admin .='</div>';
echo $admin;
?>