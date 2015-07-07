<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT * FROM pos_supplier WHERE kode LIKE (:keyword) or nama LIKE (:keyword) ORDER BY nama ASC LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['nama']);
	// add new option
    echo '<li onclick="set_item(\''.$rs['kode'].'\',\''.$rs['nama'].'\')">'.$rs['nama'].'</li>';
}
?>