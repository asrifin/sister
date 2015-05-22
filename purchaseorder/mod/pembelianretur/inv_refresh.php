<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT * FROM po_pembelian WHERE noinvoice LIKE (:keyword) ORDER BY id DESC LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['noinvoice']);
	// add new option
    echo '<li onclick="set_iteminv(\''.str_replace("'", "\'", $rs['noinvoice']).'\')">'.$kode.' - '.$rs['kodesupplier'].'- '.$rs['carabayar'].' - '.$rs['total'].'</li>';
}
?>