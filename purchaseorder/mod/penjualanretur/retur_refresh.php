<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT pj.noretur,pj.total,sis.nama as nama FROM pos_penjualanretur pj,aka_siswa sis WHERE pj.noretur LIKE (:keyword) and pj.kodecustomer = sis.nis ORDER BY pj.id DESC LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['noretur']);
	// add new option
    echo '<li onclick="set_itemretur(\''.str_replace("'", "\'", $rs['noretur']).'\')">'.$kode.' - '.$rs['nama'].' - '.$rs['total'].'</li>';
}
?>