<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT po.nopo,po.kodesupplier,po.netto,po.tgl FROM po_po po left join po_pembelian pb on po.nopo = pb.nopo where pb.nopo is null and po.nopo like (:keyword) ORDER BY po.id desc LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['nopo']);
	// add new option
    echo '<li onclick="set_itempo(\''.str_replace("'", "\'", $rs['nopo']).'\')">'.$kode.' - '.$rs['kodesupplier'].' - '.$rs['tgl'].' - '.$rs['netto'].'</li>';
}
?>