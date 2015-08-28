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
    $('#example').dataTable( {
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
 
            // Total over all pages
            total = api
                .column( 4 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                } );
 
            // Total over this page
            pageTotal = api
                .column( 4, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 4 ).footer() ).html(
                '$'+pageTotal +' ( $'+ total +' total)'
            );
        }
    } );
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
	$admin  .='<legend>PEMBAYARAN HUTANG</legend>';
	$admin  .= '<div class="border2">
<table  width="25%"><tr align="center">
<td>
<a href="admin.php?pilih=hutang&mod=yes">HUTANG</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=hutang&mod=yes&aksi=cetak">CETAK HUTANG</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

if($_GET['aksi']==""){
$admin .='<div class="panel panel-info">';
$admin .= '
<div class="panel-heading"><b>Daftar Hutang</b></div>';	
$admin .= '
<div align="right">
<a href="admin.php?pilih=hutang&mod=yes&status=semua" class="btn btn-success"> SEMUA </a>&nbsp;<a href="admin.php?pilih=hutang&mod=yes&status=lunas" class="btn btn-primary"> LUNAS </a>&nbsp;<a href="admin.php?pilih=hutang&mod=yes&status=hutang" class="btn btn-danger"> BELUM LUNAS </a>
</div>';
$admin.='
<table class="table table-striped table-bordered" cellspacing="0" width="100%"id="example">
    <thead>
        <tr>
            <th>No.Invoice</th>
            <th>Tanggal</th>
            <th>Supplier</th>
            <th>Total</th>
            <th>Bayar</th>
            <th>Kekurangan</th>
            <th>Jatuh Tempo</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
	$status 		= $_GET['status'];
if($status=='lunas')
{
         $wherestatus="where hutang='0'";
}elseif($status=='semua')
{
         $wherestatus="";
}elseif($status=='hutang'or !isset($_GET['status'])){
$wherestatus="where bayar='0'";
}
$hasil = $koneksi_db->sql_query( "SELECT * FROM `pos_pembelian` $wherestatus order by tgl desc" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$noinvoice = $data['noinvoice'];
$hutang = $data['hutang'];
if($hutang>'0'){
$lihatslip = '<a href="cetak_notainvoice.php?kode='.$data['noinvoice'].'&lihat=ok&bayar=ok"target ="blank">'.$data['noinvoice'].'</a>';
}else{
$lihatslip = '<a href="cetak_notainvoice.php?kode='.$data['noinvoice'].'&lihat=ok"target ="blank">'.$data['noinvoice'].'</a>';
}
$lihatslippo = '<a href="cetak_notapo.php?kode='.$data['nopo'].'&lihat=ok"target ="blank">'.$data['nopo'].'</a>';
$admin.='<tr>
            <td>'.$lihatslip.'</td>
            <td>'.tanggalindo($data['tgl']).'</td>
            <td>'.getnamasupplier($data['kodesupplier']).'</td>
            <td>'.rupiah_format($data['total']).'</td>
            <td>'.rupiah_format($data['bayar']).'</td>
            <td>'.rupiah_format($data['hutang']).'</td>
            <td>'.tanggalindo($data['tgltermin']).'</td>
        </tr>';
$ttotal += $data['total'];
$tbayar += $data['bayar'];
$thutang += $data['hutang'];
}   
$admin.='</tbody>';
$admin.='
</table>';
}

if($_GET['aksi']=="cetak"){
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tglmulai 		= !isset($tglmulai) ? $tglawal : $tglmulai;
$tglakhir 		= !isset($tglakhir) ? $tglnow : $tglakhir;
$sel = '<select name="status" class="form-control">';
$arr5 = array ('Semua','Hutang','Lunas');
foreach ($arr5 as $k=>$v){
	$sel .= '<option value="'.$v.'">'.$v.'</option>';	
	
}
$sel .= '</select>';
$admin .='<div class="panel panel-info">';
$admin .='<div class="panel-heading"><b>Cetak Daftar Hutang</b></div>';
$admin .= '<form class="form-inline" method="GET" action="cetakhutang.php" enctype ="multipart/form-data" target="_blank" id="posts">
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