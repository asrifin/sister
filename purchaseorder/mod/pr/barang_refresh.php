<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT sk.replid,sk.kode,sk.nama,sk.keterangan from sar_katalog sk WHERE sk.nama LIKE (:keyword)";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['replid']);
	// add new option
    echo '<li onclick="set_item2(\''.str_replace("'", "\'", $rs['replid']).'\')">'.$kode.' - '.$rs['nama'].' - '.$rs['keterangan'].'</li>';
}
?>