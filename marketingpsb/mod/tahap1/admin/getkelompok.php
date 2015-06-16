<?php
 
//ambil parameter
$iddepartemen = $_POST['iddepartemen'];
 
if($iddepartemen == ''){
     exit;
}else{
$hasil = $koneksi_db->sql_query( "
          SELECT
               replid,
               kelompok
          FROM
               psb_kelompok
          WHERE
               proses = '$iddepartemen'
     ");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
          echo '<option value="'.$data['replid'].'">'.$data['kelompok'].'</option>';
     }
     exit;    
}
?>