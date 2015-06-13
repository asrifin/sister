<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT pr.nopr,pr.tgl,pr.namapr,pr.tujuanpr FROM po_pr pr , po_po po WHERE pr.nopr LIKE (:keyword) ORDER BY pr.id desc LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['nopr']);
	// add new option
    echo '<li onclick="set_itempr(\''.str_replace("'", "\'", $rs['nopr']).'\')">'.$kode.' - '.$rs['namapr'].' - '.$rs['tgl'].' - '.$rs['tujuanpr'].'</li>';
}
?>