<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT * FROM po_pn WHERE nopn LIKE (:keyword) ORDER BY id DESC LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['nopn']);
	// add new option
    echo '<li onclick="set_itempn(\''.str_replace("'", "\'", $rs['nopn']).'\')">'.$kode.' - '.$rs['nopr'].'- '.$rs['tgl'].'</li>';
}
?>