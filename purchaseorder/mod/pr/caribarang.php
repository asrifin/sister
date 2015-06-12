<?php 
include '../../includes/pdo.php';

$pdo = connect();
    
    $sel_barang="select * from sar_katalog where kode='".$_POST["kode"]."'";
    $q=mysql_query($sel_barang);
    while($data_barang=mysql_fetch_array($q)){
    
    ?>
        <option value="<?php echo $data_barang["replid"] ?>"><?php echo $data_barang["nama"] ?></option><br>
    
    <?php
    }
    ?>