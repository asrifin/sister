<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT * FROM po_supplier WHERE kode LIKE (:keyword) or nama LIKE (:keyword) ORDER BY nama ASC LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['kode']);
	// add new option
    echo '<li onclick="set_item(\''.str_replace("'", "\'", $rs['kode']).'\')">'.$kode.' - '.$rs['nama'].'</li>';
}
?>