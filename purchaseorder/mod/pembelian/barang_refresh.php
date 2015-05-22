<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT pp.nama as namaproduk,pp.kode as kode FROM po_produk pp WHERE  pp.kode LIKE (:keyword) or pp.nama LIKE (:keyword) limit 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['kode']);
	// add new option
    echo '<li onclick="set_item2(\''.str_replace("'", "\'", $rs['kode']).'\')">'.$kode.' - '.$rs['namaproduk'].'</li>';
}
?>