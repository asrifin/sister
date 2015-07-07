<?php

if (!defined('AURACMS_admin')) {
	Header("Location: ../../../index.php");
	exit;
}

if (!cek_login ()){
   $admin .='<p class="judul">Access Denied !!!!!!</p>';
   exit;
}
$style_include[] = '<link rel="stylesheet" media="screen" href="mod/calendar/css/dynCalendar.css" />';
$admin .= '
<script language="javascript" type="text/javascript" src="mod/calendar/js/browserSniffer.js"></script>
<script language="javascript" type="text/javascript" src="mod/calendar/js/dynCalendar.js"></script>';
$tanggal= <<<eof
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
$JS_SCRIPT = <<<js
<script type=text/javascript>
function  genSEF(from) { 
			var str = from.value;
var tottunjangan = (ntstruktural.value)+(ntfungsional.value)+(ntpengabdian.value)+str;
str2 = 	(document.forms['posts'].jamsostekpersen.value/100)*tottunjangan; 
			str3 = 	(document.forms['posts'].pph21persen.value/100)*str;
			document.forms['posts'].jamsostek.value = parseInt(55);
			document.forms['posts'].pph21.value = parseInt(str3);
			
niltstruktural = document.forms['posts'].ntstruktural.value.split("#");
strstruktural = (niltstruktural[0]*str)+niltstruktural[1];
document.forms['posts'].tstruktural.value = parseInt(strstruktural);

niltfungsional = document.forms['posts'].ntfungsional.value.split("#");
strfungsional = (niltfungsional[0]*str)+niltfungsional[1];
document.forms['posts'].tfungsional.value =parseInt(strfungsional);

niltpengabdian = document.forms['posts'].ntpengabdian.value.split("#");
strpengabdian = (niltpengabdian[0]*str)+niltpengabdian[1];
document.forms['posts'].tpengabdian.value =parseInt(strpengabdian);

niltistrianak = document.forms['posts'].ntistrianak.value.split("#");
stristrianak = (niltistrianak[0]*str)+niltistrianak[1];
document.forms['posts'].tistrianak.value =parseInt(stristrianak);

niltbebantugas = document.forms['posts'].ntbebantugas.value.split("#");
strbebantugas = (niltbebantugas[0]*str)+niltbebantugas[1];
document.forms['posts'].tbebantugas.value =parseInt(strbebantugas);

niltwalikelas = document.forms['posts'].ntwalikelas.value.split("#");
strwalikelas = (niltwalikelas[0]*str)+niltwalikelas[1];
document.forms['posts'].twalikelas.value =parseInt(strwalikelas);

niltuangmakan = document.forms['posts'].ntuangmakan.value.split("#");
struangmakan = (niltuangmakan[0]*str)+niltuangmakan[1];
document.forms['posts'].tuangmakan.value =parseInt(struangmakan);

niltuangtransport = document.forms['posts'].ntuangtransport.value.split("#");
struangtransport = (niltuangtransport[0]*str)+niltuangtransport[1];
document.forms['posts'].tuangtransport.value =parseInt(struangtransport);
}		
</script>
<script type=text/javascript>
function  genSEF2(from,to) { 
			var str = from.value;	
			preward = document.forms['posts'].preward.value;
			pointreward = document.forms['posts'].pointreward.value;
			str=str*preward;
			to.value = parseInt(str);
}		
</script>	
<script type=text/javascript>
function  genSEF3(from,to) { 
			var str = from.value;	
			poterlambat = document.forms['posts'].poterlambat.value;
			pointterlambat = document.forms['posts'].pointterlambat.value;
			str=str*poterlambat;
			to.value = parseInt(str);
}		
</script>
js;
$JS_SCRIPT.= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );
</script>
js;
$script_include[] = $JS_SCRIPT;
global $maxadmindata;

if (isset ($_GET['pg'])) $pg = int_filter ($_GET['pg']); else $pg = 0;
if (isset ($_GET['stg'])) $stg = int_filter ($_GET['stg']); else $stg = 0;
if (isset ($_GET['offset'])) $offset = int_filter ($_GET['offset']); else $offset = 0;
$normal2 = 'mod/karyawan/images/performa/';
$temp2 = 'mod/karyawan/images/temp/';

###################################
# List karyawan
###################################
if($_GET['aksi']==""){
if(isset($_POST['submit'])){
$nip          = $_POST['nip'];
$tgllahir      = $_POST['tgllahir'];
$query         = $koneksi_db->sql_query ("SELECT * FROM hrd_karyawan WHERE nip='$nip' AND tgllahir='$tgllahir'");
$total         = $koneksi_db->sql_numrows($query);
$data          = $koneksi_db->sql_fetchrow ($query);
$koneksi_db->sql_freeresult ($query);

if ($total > 0 && $nip == $data['nip'] && $tgllahir == $data['tgllahir']){
$_SESSION['idkaryawan']= $data['id'];  
}else {
echo '<div class="error"><b>ERROR :</b> NIP atau TglLahir yang diinputkan salah </div>';
}
}	
	
$admin  .='<legend> Penggajian Karyawan</legend>';
if(!$_SESSION['idkaryawan']){
$admin.='<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Masukkan NIP dan Tgl Lahir</h3></div>';
$admin.='<form method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:75px; padding:5px;">NIP</td>
    <td style="width:10px; padding:5px;">:</td>
    <td style="padding:5px;"><input type="text" name="nip" size="20" class="form-control" placeholder="000.00.00"></td>
  </tr> 
  <tr>
    <td style="padding:5px;">Tgl Lahir</td>
    <td style="padding:5px;">:</td>
    <td style="padding:5px;"><input type="text" name="tgllahir" size="20" class="form-control"placeholder="YYYY-MM-DD"></td>
  </tr>';
$admin .='<tr>
	<td style="padding:5px;">&nbsp;</td>
    <td style="padding:5px;">&nbsp;</td>
    <td style="padding:5px;"><input type="submit" value="Login" name="submit" class="btn btn-success"></td>
  </tr>
</table></form>';
$admin .= '</div>';		
}else{
$id = $_SESSION['idkaryawan'];
$s = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE id=$id");
$datas = $koneksi_db->sql_fetchrow($s);
$nama = $datas['nama'];
$hasil = $koneksi_db->sql_query( "SELECT * FROM hrd_karyawan WHERE id=$id" );
$data = $koneksi_db->sql_fetchrow($hasil);
$idkary  			= $data['id'];
$nip  			= $data['nip'];
$nama     		= text_filter($data['nama']);
$departemen 	= $data['departemen'];
$jabatan		= $data['jabatan'];
$status		= $data['status'];
$fotolama 	= $data['foto'];

$admin .= '<form class="form-inline" method="post" action="" enctype ="multipart/form-data" id="posts">
<table class="table  table-hover">';
if(!$fotolama){
$fotolama='profile-default.jpg';
}
$admin .='<tr>
	<td></td>
	<td><img src="mod/karyawan/images/normal/'.$fotolama.'" height="120">
	<input type="hidden" name="fotolama" value="'.$fotolama.'"></td>
</tr>
<tr>
	<td>NIP</td>
	<td><input type="hidden" name="nip" value="'.$nip.'">'.$nip.'</td>
</tr>
<tr>
	<td>Nama Lengkap</td>
	<td>
	<input type="hidden" name="nama" value="'.$nama.'">'.$nama.'
	</td>
</tr>
</table></form>';
$admin .= '</table>';	
/***************************/
$admin .='<legend>History Penggajian</legend>';
$admin.='
<table id="example"class="table table-striped table-bordered" cellspacing="0" width="100%">
<thead>
<tr>
<th>Tahun</th>
<th>Bulan</th>
<th>Gaji Bersih</th>
<th width="20%">Aksi</th>
</tr>
</thead>';
$admin.='<tbody>';
$s = mysql_query ("SELECT * FROM `hrd_penggajian`where karyawan='$id'");	
while($datas = mysql_fetch_array($s)){
$idphoto = $datas['id'];
$gajibersih = $datas['gajibersih'];
$bulan = $datas['bulan'];
$tahun = $datas['tahun'];
$idbayar = $datas['idbayar'];
$urutan = $no + 1;
$cetak = '<a href="cetak_slip.php?id='.$idphoto.'&idkary='.$idkary.'&idbayar='.$idbayar.'" target="new"onclick="return confirm(\'Apakah Anda Ingin Mencetak Penggajian Ini ?\')" style="color:blue"><span class="btn btn-info">Cetak Slip</span></a>';

$admin .= '
<tr align="left">
<td>
'.$tahun.'
</td>
<td>
'.getbulan($bulan).'
</td>
<td>
'.rupiah_format($gajibersih).'
</td>
<td>'.$cetak.'
</td></tr>';
}
$admin .= '</table>';	
}
}

echo $admin;

?>