<?php
include '../../includes/pdo.php';
$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT po.nopo,po.kodesupplier,po.netto FROM po_po as po left join po_pembelian as pp on po.nopo = pp.nopo where pp.nopo is null ORDER BY po.id DESC LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['nopo']);
	// add new option
    echo '<li onclick="set_itempo(\''.str_replace("'", "\'", $rs['nopo']).'\')">'.$kode.' - '.$rs['kodesupplier'].' - '.$rs['netto'].'</li>';
}
?>