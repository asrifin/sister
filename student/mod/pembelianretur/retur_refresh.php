<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT pb.noretur,pb.total,ps.nama as namasupplier FROM pos_pembelianretur pb,pos_supplier ps  WHERE pb.noretur LIKE (:keyword) and pb.kodesupplier = ps.kode  ORDER BY pb.id desc LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['noretur']);
	// add new option
    echo '<li onclick="set_itemretur(\''.str_replace("'", "\'", $rs['noretur']).'\')">'.$kode.' - '.$rs['namasupplier'].' - '.$rs['total'].'</li>';
}
?>