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
$JS_SCRIPT.= <<<js
<script type="text/javascript">
  $(function() {
$( "#tglmulai" ).datepicker({ dateFormat: "yy-mm-dd" } );
$( "#tglakhir" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
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