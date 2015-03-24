<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	// note :
	// ju : jurnal umum
	// in : pemasukkan
	// out : pengeluaran

	$mnu  = 'perangkat';
	
	$tb   = 'pus_'.$mnu;
	// $tb2  = 'keu_'.$mnu2;
	// $tb3  = 'keu_'.$mnu3;
	// $tb4  = 'keu_'.$mnu4;
	// $tb5  = 'keu_'.$mnu5;

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
				$page       = $_GET['page']; // get the requested page
				$limit      = $_GET['rows']; // get how many rows we want to have into the grid
				$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
				$sord       = $_GET['sord']; // get the direction
				$searchTerm = $_GET['searchTerm'];

				if(!$sidx) 
					$sidx =1;
				$ss='SELECT *
						FROM(SELECT
									pus_katalog.replid,
									pus_buku.barkode barkode,
									pus_katalog.judul judul
							FROM pus_katalog
							LEFT JOIN pus_buku ON pus_buku.katalog = pus_katalog.replid 
							LEFT JOIN pus_lokasi ON pus_lokasi.replid = pus_buku.lokasi
							WHERE pus_lokasi.replid
							)tb
							WHERE	tb.barkode  LIKE "%'.$searchTerm.'%"
									OR tb.judul LIKE "%'.$searchTerm.'%"';
				// print_r($ss);exit();
				$result = mysql_query($ss) or die(mysql_error());
				$row    = mysql_fetch_array($result,MYSQL_ASSOC);
				$count  = mysql_num_rows($result);

				if( $count >0 ) {
					$total_pages = ceil($count/$limit);
				} else {
					$total_pages = 0;
				}
				if ($page > $total_pages) $page=$total_pages;
				$start 	= $limit*$page - $limit; // do not put $limit*($page - 1)
				if($total_pages!=0) {
					$ss.='ORDER BY '.$sidx.' '.$sord.' LIMIT '.$start.','.$limit;
				}else {
					$ss.='ORDER BY '.$sidx.' '.$sord;
				}
				// print_r($ss);exit();
				$result = mysql_query($ss) or die("Couldn t execute query.".mysql_error());
				$rows 	= array();
				while($row = mysql_fetch_assoc($result)) {
					$rows[]= array(
						'replid'  =>$row['replid'],
						'barkode' =>$row['barkode'],
						'judul'   =>$row['judul']
					);
				}$response=array(
					'page'    =>$page,
					'total'   =>$total_pages,
					'records' =>$count,
					'rows'    =>$rows,
				);
			$out=json_encode($response);
		}else{
			$out=json_encode(array('status'=>'invalid_no_post'));	
		}
	}else{
		switch ($_POST['aksi']) {
			// tampil ---------------------------------------------------------------------
			case 'tampil':
				
						$sql = 'SELECT ps.nilai
								FROM pus_detail_setting ps 
								LEFT JOIN pus_setting2 ps2 ON ps2.replid = ps.kunci
								WHERE 
									ps2.kunci= "'.$_POST['kunci'].'"'
								;
						// print_r($sql);exit();
						$query = mysql_query($sql);
						// $hasil = mysql_fetch_assoc($query);
						$row = '';
						while ($hasil = mysql_fetch_assoc($query)) {
							$row.=$hasil['nilai'].'/';
						}
						$out=json_encode(array('status'=>'sukses','row'=>$row));	


			break; 
			// tampil ---------------------------------------------------------------------

			// generate kode
			case 'codeGen':
				switch ($_POST['subaksi']) {
					case'transNo':
						switch($_POST['tipe']){
							case 'ju':
								$pre='MMJ';
							break;
							case 'in':
								$pre='BKM';
							break;
							case 'out':
								$pre='BKK';
							break;
						}
						$s    ='SELECT max(ct)ct from keu_transaksi ';
						$e    =mysql_query($s);
						$stat =!$e?'gagal_'.mysql_error():'sukses';
						if(mysql_num_rows($e)>0){
							$r  =mysql_fetch_assoc($e);
							$in =$r['ct']+1;
						}else{
							$in=1;
						}$kode=$pre.'-'.sprintf("%04d",$in).'/'.date("m").'/'.date("Y");
						$out=json_encode(array('status'=>$stat,'kode'=>$kode));
					break;
				}
			break;
			// generate kode

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				switch ($_POST['subaksi']) {
					case 'ju':
						$s 		= $tb.' set 	nomer   = "'.$_POST['ju_nomerTB'].'",
												nobukti = "'.filter($_POST['ju_nobuktiTB']).'",
												uraian  = "'.filter($_POST['ju_uraianTB']).'",
												tanggal = "'.tgl_indo6($_POST['ju_tanggalTB']).'"';
						$s  = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						// var_dump($s);exit();
						// $e  = mysql_query($s);
						// $id =mysql_insert_id();
						// if(!$e){
						// 	$stat='gagal_'.mysql_error();
						// }else{
							if(isset($_POST['ju_rekTB'])){
								// var_dump(count($_POST['ju_rekTB']));
								var_dump($_POST['ju_rekTB']);
								// $s2	= 'keu_jurnal set 	transaksi = '.$id.',
								// 						rek       = '.$_POST['ju_rekTB'].',
								// 						debet     = '.$_POST['ju_debetTB'].',
								// 						kredit    = '.$_POST['ju_kreditTB'];
								// $s2 = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
							}
						// }
						// $stat 	= ($e)?'sukses':'gagal';
						// $out 	= json_encode(array('status'=>$stat));
					break;

					case 'barang':
						$s 		= $tb4.' set 	katalog    = "'.$_POST['b_katalogH2'].'",
												tempat     = "'.$_POST['b_tempatTB'].'",
												sumber     = "'.$_POST['b_sumberTB'].'",
												harga      = "'.getuang($_POST['b_hargaTB']).'",
												kondisi    = "'.$_POST['b_kondisiTB'].'",
												keterangan = "'.filter($_POST['b_keteranganTB']).'"';
						$stat = true;
						if(!isset($_POST['replid'])){ //add
							if(isset($_POST['b_jumbarangTB']) and $_POST['b_jumbarangTB']>1){ //  lebih dr 1 unit barang
								for($i=0; $i<($_POST['b_jumbarangTB']); $i++) { // iterasi sbnyak jum barang 
									$s2 ='INSERT INTO '.$s.', urut='.($_POST['b_urutH']+$i);
									// var_dump($s2);exit();
									$e  = mysql_query($s2);
									if(!$e)$stat=false;
								}
							}else{ // 1 unit barang
								$s2='INSERT INTO '.$s.', urut='.$_POST['b_urutH'];
								// var_dump($s2);exit();
								$e=mysql_query($s2);
								if(!$e)$stat=false;  
							// var_dump($e);exit();
							}
						}else{ //edit
							$s2 = 'UPDATE '.$s.', urut='.$_POST['b_urutH'].' WHERE replid='.$_POST['replid'];
							// var_dump($s2);exit();
							$e  = mysql_query($s2);
							if(!$e)$stat=false;  
						}
						$out 	= json_encode(array('status'=>($stat?'sukses':'gagal')));
					break;
				}
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete ---------------------------------------------------------------------
			case 'hapus':
				switch ($_POST['subaksi']) {
					case 'grup':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
					break;

					case 'katalog':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb3.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb3.' WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
					break;

					case 'barang':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb4.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb4.' WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['kode']));
					break;
				}
			break;
			// delete ---------------------------------------------------------------------

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				switch ($_POST['subaksi']) {

					case 'barkode';
						$s ='SELECT nilai
								FROM pus_setting
								WHERE 
									kunci="bkfmt"';
						// print_r($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array(
									'status' =>$stat,
									'barkode'   =>$r['nilai']
								));					
					break;
				}
			break;
			// ambiledit ------------------------------------------------------------------

			// generate barcode -----------------------------------------------------------
			case 'kodegenerate':
				$s='SELECT
						tb1.lokasi,
						tb1.grup,
						tb1.tempat,
						tb1.katalog,
						tb2.barang,
						LPAD(tb2.barang,5,0)barkode	
					FROM (
						SELECT
							l.kode lokasi,
							g.kode grup,
							t.kode tempat,
							k.kode katalog
						FROM
							sar_lokasi l 
							JOIN sar_grup g on g.lokasi = l.replid
							JOIN sar_katalog k on k.grup= g.replid
							JOIN sar_tempat t on t.lokasi = l.replid
						WHERE	
							t.replid = '.$_POST['tempat'].' 
							and k.replid = '.$_POST['katalog'].'
						)tb1,';

				if($_POST['replid']!=''){//edit
					$s.= '(SELECT urut AS barang FROM sar_barang WHERE replid='.$_POST['replid'].')tb2';
				}else{ //add 
					$s.= '(SELECT (MAX(urut) + 1) AS barang FROM sar_barang )tb2';
				}

				// print_r($s);exit();
				$e    = mysql_query($s);
				$r    = mysql_fetch_assoc($e);
				$stat = !$e?'gagal':'sukses';
				$out  = json_encode(array(
							'status' =>$stat,
							'data'   =>array(
										'urut'    =>$r['barang'],
										'lokasi'  =>$r['lokasi'],
										'grup'    =>$r['grup'],
										'tempat'  =>$r['tempat'],
										'katalog' =>$r['katalog'],
										'barang'  =>$r['barang'],
										'barkode' =>$r['barkode']
						)));
			break;
			// generate barcode -----------------------------------------------------------
			}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>