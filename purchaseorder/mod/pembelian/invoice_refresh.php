<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT pb.noinvoice,pb.total,ps.nama as namasupplier FROM po_pembelian pb,po_supplier ps WHERE pb.noinvoice LIKE (:keyword) and pb.kodesupplier = ps.kode ORDER BY pb.id DESC LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['noinvoice']);
	// add new option
    echo '<li onclick="set_iteminvoice(\''.str_replace("'", "\'", $rs['noinvoice']).'\')">'.$kode.' - '.$rs['namasupplier'].' - '.$rs['total'].'</li>';
}
?>