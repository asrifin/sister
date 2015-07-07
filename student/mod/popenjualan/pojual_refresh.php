<?php
include '../../includes/pdo.php';

$pdo = connect();
$keyword = '%'.$_POST['keyword'].'%';
$sql = "SELECT pp.nopo,pp.tgl,pp.netto,pp.kodecustomer,pc.nama,asi.nama FROM pos_popenjualan pp,pos_customer pc,aka_siswa asi WHERE pp.nopo LIKE (:keyword) and pc.kode = pp.kodecustomer or asi.nis=pp.kodecustomer ORDER BY pp.nopo DESC LIMIT 0, 5";
$query = $pdo->prepare($sql);
$query->bindParam(':keyword', $keyword, PDO::PARAM_STR);
$query->execute();
$list = $query->fetchAll();
foreach ($list as $rs) {
	// put in bold the written text
	$kode = str_replace($_POST['keyword'], '<b>'.$_POST['keyword'].'</b>', $rs['nopo']);
	// add new option
    echo '<li onclick="set_itempo(\''.str_replace("'", "\'", $rs['nopo']).'\')">'.$kode.' - '.$rs['nama'].' - '.$rs['tgl'].' - '.$rs['netto'].'</li>';
}
?>