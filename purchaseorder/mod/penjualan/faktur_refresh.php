<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT pj.nofaktur,pj.total,sis.nama as nama FROM pos_penjualan pj,aka_siswa sis WHERE pj.nofaktur LIKE (:keyword) and pj.kodecustomer = sis.nis ORDER BY pj.id DESC LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['nofaktur']);
	// add new option
    echo '<li onclick="set_itemfaktur(\''.str_replace("'", "\'", $rs['nofaktur']).'\')">'.$kode.' - '.$rs['nama'].' - '.$rs['total'].'</li>';
}
?>