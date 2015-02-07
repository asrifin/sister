<?php
	require_once "koneks.php";
	error_reporting(E_ALL ^ E_NOTICE);
	require_once 'excel_reader2.php';

	 

	$baris = $data->rowcount($sheet_index=0);
	// proses assigning baca data file 'data.xls'
	//$data = new Spreadsheet_Excel_Reader("data.xls");
	$data = new Spreadsheet_Excel_Reader($_FILES['userfile']['tmp_name']);

	//-------- import dari sheet 1 ----------

	// baca jumlah baris dalam sheet 1
	$jmlbaris = $data->rowcount(0);

	for ($i=2; $i<=$jmlbaris; $i++)
	{
		// baca data pada baris ke-i, kolom ke-1, pada sheet 1
		$datakolom1 = $data->val($i, 1, 0);
		// baca data pada baris ke-i, kolom ke-2, pada sheet 1
		$datakolom2 = $data->val($i, 2, 0);
		// insert data ke tabel mhs
		$query = "INSERT INTO mhs (nim, namamhs) VALUES ('$datakolom1', '$datakolom2')";
		mysql_query($query);
	}

	//-------- import dari sheet 2 ----------

	// baca jumlah baris dalam sheet 2
	$jmlbaris = $data->rowcount(1);

	for ($i=2; $i<=$jmlbaris; $i++)
	{
		// baca data pada baris ke-i, kolom ke-1, pada sheet 2
		$datakolom1 = $data->val($i, 1, 1);
		// baca data pada baris ke-i, kolom ke-2, pada sheet 2
		$datakolom2 = $data->val($i, 2, 1);
		// insert data ke tabel dosen
		$query = "INSERT INTO dosen (kodedosen, namadosen) VALUES ('$datakolom1', '$datakolom2')";
		mysql_query($query);
	}

	//-------- import dari sheet 3 ----------

	// baca jumlah baris dalam sheet 3
	$jmlbaris = $data->rowcount(2);

	for ($i=2; $i<=$jmlbaris; $i++)
	{
		// baca data pada baris ke-i, kolom ke-1, pada sheet 3
		$datakolom1 = $data->val($i, 1, 2);
		// baca data pada baris ke-i, kolom ke-2, pada sheet 3
		$datakolom2 = $data->val($i, 2, 2);
		// insert data ke tabel mk
		$query = "INSERT INTO mk (kodemk, namamk) VALUES ('$datakolom1', '$datakolom2')";
		mysql_query($query);
	}

	echo "<p>Proses import selesai</p>";

?>
