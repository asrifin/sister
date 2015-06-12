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
<link rel="stylesheet" href="mod/pr/style.css" />
';
	
//$index_hal=1;	
	$admin  .='<legend>LIHAT ANGGARAN</legend>';
$admin .='<div class="panel panel-info">';
$admin .= '<script type="text/javascript" language="javascript">
   function GP_popupConfirmMsg(msg) { //v1.0
  document.MM_returnValue = confirm(msg);
}
</script>';

if ($_GET['aksi'] == ''){
$kategorianggaran     = $_GET['katanggaran'];
$admin .= '
<div class="panel-heading"><b></b></div>';	
$admin .= '
<form method="post" action="" class="form-inline"id="posts">
<table class="table table-striped table-hover">';
$admin .= '
	<tr>
		<td>Kategori Anggaran</td>
		<td>:</td>
		<td>'.getkategorianggaran($kategorianggaran).'</td>
			<td>'.$lihatanggaran.'</td>
	</tr>';
$admin .= '</form></table></div>';	
	}

}
echo $admin;
?>
