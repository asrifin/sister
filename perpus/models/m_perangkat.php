<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
				$page       = $_GET['page']; 
				$limit      = $_GET['rows'];  
				$sidx       = $_GET['sidx'];  
				$sord       = $_GET['sord']; 				
				$searchTerm = $_GET['searchTerm'];
				$terpilih   = (isset($_GET['terpilihArr']) AND $_GET['terpilihArr']!='')?' AND b.replid NOT IN ('.$_GET['terpilihArr'].')':''; /*epiii*/
				
				if(!$sidx) 
					$sidx =1;
				$ss = 'SELECT 
	                    b.replid,
	                    b.idbuku,
	                    b.barkode,
	                    k.callnumber,
                    	k.judul
	                  FROM 
						pus_buku b
	                    LEFT JOIN pus_katalog k ON k.replid = b.katalog
	                    LEFT JOIN pus_lokasi l ON b.lokasi = l.replid
	                  WHERE
                      	b.lokasi = '.$_GET['lokasi'].' AND (
							k.judul LIKE "%'.$searchTerm.'%" OR b.barkode LIKE "%'.$searchTerm.'%"
                      	)'.$terpilih; /*epiii*/
 
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
						'replid'     =>$row['replid'],
						'barkode'    =>$row['barkode'],
						'callnumber' =>$row['callnumber'],
						'judul'      =>$row['judul']
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
				switch ($_POST['subaksi']) {
					case 'setting':
						$out=json_encode(array('status'=>'sukses','row'=>getSettingFormat($_POST['kunci'])));	
					break;

					case 'detSetting':
						$s   = 'SELECT 
									d.replid,
									d.urut,
									d.nilai,
									d.nilai2,
									d.isActive,
									d.isEdit,
									d.keterangan
								FROM
									pus_detail_setting d
									LEFT JOIN pus_setting2 s on s.replid = d.kunci
								WHERE
									s.kunci= "'.$_POST['kunci'].'"
								ORDER BY 
									urut ASC';
						// var_dump($s);
						$e   = mysql_query($s);
						$row = array();
						while ($r = mysql_fetch_assoc($e)) {
							$row[]= $r;
						}

						$out=json_encode(array(
								'status' =>($e?'sukses':'gagal'),
								'data'   =>$row
							));	
					break;
				}
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

			// edit -----------------------------------------------------------------
			case 'simpan':
				$u='';
				$id1=$id2=$u1=$u2=0;
				$status1=$status2=true;
				foreach ($_POST['detSettingH'] as $i => $v) {
					// all : sure
					$s1='UPDATE pus_detail_setting  
						 SET 	nilai2   	= "'.((isset($_POST['nilai2_'.$v.'TB']) AND $_POST['nilai2_'.$v.'TB']!='')?$_POST['nilai2_'.$v.'TB']:'').'",
								isActive 	= '.((isset($_POST['isActive_'.$v.'TB']) AND $_POST['isActive_'.$v.'TB']=='on')?1:0).'
						 WHERE 	replid		='.$v;
					$e1 = mysql_query($s1);
					$status1 =!$e1?false:true;

					$sc1 = 'SELECT *  FROM pus_detail_setting WHERE replid ='.$v;
					$ec1 = mysql_query($sc1);
					$rc1 = mysql_fetch_assoc($ec1);

					$uu1  = intval($rc1['urut']); 				// ex : 5 -> 1
					$uu2  = intval($_POST['urut_'.$v.'TB']);  	// ex : 1 -> 5

					$sc2 = 'SELECT * FROM pus_detail_setting WHERE kunci='.$rc1['kunci'].' and urut ='.$uu2;
					$ec2 = mysql_query($sc2);
					$rc2 = mysql_fetch_assoc($ec2);

					if($uu2!=$uu1){ // jika ada perubahan urutan 
						$u1 +=$uu1;
						$u2 +=$uu2;
						$id1 +=$v;
						$id2 +=intval($rc2['replid']);
					}
				}

				if($uu1!=0){
					// 1
					$s2 ='UPDATE pus_detail_setting 
						  SET urut = '.$u2.'
						  WHERE replid = '.$id1;
					$e2 = mysql_query($s2);
					// 2 
					$s3 ='UPDATE pus_detail_setting 
						  SET urut = '.$u1.'
						  WHERE replid ='.$id2;
					$e3 = mysql_query($s3);
					$status2 =(!$e2 || !$e3)?false:true;
				}
				// var_dump($u);exit();
				$stat = ($status1 && $status2)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat));
			break;
			// edit -----------------------------------------------------------------
			
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