<?php
	$table = 'psb_kriteria';
	$primaryKey = 'replid';
	$columns = array(
		array( 'db' => 'kriteria', 'dt' => 'kriteria' ),
		array( 'db' => 'keterangan',  'dt' => 'keterangan' ),
	);
	$sql_details = array(
		'user' => 'root',
		'pass' => '',
		'db'   => 'josh',
		'host' => 'localhost'
	);
	require( 'ssp.class.php' );
	echo json_encode(
		// SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns )
		SSP::simple( $_POST, $sql_details, $table, $primaryKey, $columns )
	);

