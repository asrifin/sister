<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT pp.nama as namaproduk,pp.kode as kode,pj.nama as jenjang FROM pos_produk pp,pos_jenjang pj WHERE pp.jenjang=pj.id and (pp.kode LIKE (:keyword) or pp.nama LIKE (:keyword) or pj.nama LIKE (:keyword))";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['kode']);
	// add new option
    echo '<li onclick="set_item2(\''.str_replace("'", "\'", $rs['kode']).'\')">'.$kode.' - '.$rs['namaproduk'].' - '.$rs['jenjang'].'</li>';
}
?>