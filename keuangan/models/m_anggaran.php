<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	$mnu  = 'kategorianggaran';
	$mnu2 = 'detilanggaran';
	$tb   = 'keu_'.$mnu;
	$tb2  = 'keu_'.$mnu2;

	if(!isset($_POST['aksi'])){
		if(isset($_GET['upload'])){
			$tipex    = substr($_FILES[0]['type'],6);
			$namaAwal = $_FILES[0]['name'];
			$namaSkrg = $_SESSION['id_loginS'].'_'.substr((md5($namaAwal.rand())),2,10).'.'.$tipex;
			$src      = $_FILES[0]['tmp_name'];
			$destix   = '../../img/upload/'.basename($namaSkrg);

			if(move_uploaded_file($src, $destix))
				$o=array('status'=>'sukses','file'=>$namaSkrg);
			else
				$o=array('status'=>'gagal');

			$out=json_encode($o);
		}elseif(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
			$page       = $_GET['page']; // get the requested page
			$limit      = $_GET['rows']; // get how many rows we want to have into the grid
			$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
			$sord       = $_GET['sord']; // get the direction
			$searchTerm = $_GET['searchTerm'];

			if(!$sidx) 
				$sidx =1;
			// if(isset($_GET['subaksi']) && $_GET['subaksi']=='penerbit'){
			// 	$table = 'pus_penerbit';
			// 	$where = 'nama LIKE "%'.$searchTerm.'%"';
			// }elseif (isset($_GET['subaksi']) && $_GET['subaksi']=='klasifikasi') {
			// 	$table = 'pus_klasifikasi';
			// 	$where = 'kode LIKE "%'.$searchTerm.'%" OR nama LIKE "%'.$searchTerm.'%"';
			// }else{
			// 	$table = 'pus_pengarang';
			// 	$where = 'nama LIKE "%'.$searchTerm.'%"';
			// }

			$ss='SELECT *
				FROM keu_detilrekening
				WHERE 
					kode LIKE "%'.$searchTerm.'%" OR
					nama LIKE "%'.$searchTerm.'%"';
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

			$result = mysql_query($ss) or die("Couldn t execute query.".mysql_error());
			$rows 	= array();
			while($row = mysql_fetch_assoc($result)) {
				$rows[]= array(
					'replid' =>$row['replid'], 
					'nama'   =>$row['nama'], 
					'kode'   =>$row['kode']
				);
			}$response=array(
				'page'    =>$page,
				'total'   =>$total_pages,
				'records' =>$count,
				'rows'    =>$rows,
			);$out=json_encode($response);
		}else{
			$out=json_encode(array('status'=>'invalid_no_post'));		
		}
	}else{
		switch ($_POST['aksi']) {
			// tampil ---------------------------------------------------------------------
			case 'tampil':
				switch ($_POST['subaksi']) {
					// kategori anggaran
					case 'anggaran':
						$a_nama       = isset($_POST['a_namaS'])?filter(trim($_POST['a_namaS'])):'';
						$a_keterangan = isset($_POST['a_keteranganS'])?filter(trim($_POST['a_keteranganS'])):'';

						$sql = 'SELECT *
								FROM '.$tb.'
								WHERE
									nama like "%'.$a_nama.'%" and
									keterangan like "%'.$a_keterangan.'%" 
								ORDER BY
									replid asc';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='anggaran';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum	= mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$btn ='<td align="center">
											<button data-hint="detail"  class="button" onclick="vwHeadDetilAnggaran('.$res['replid'].');">
												<i class="icon-zoom-in"></i>
											</button>
											<button data-hint="ubah"  class="button" onclick="anggaranFR('.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="anggaranDel('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$out.= '<tr>
											<td>'.$res['nama'].'</td>
											<td>'.$res['keterangan'].'</td>
											'.$btn.'
										</tr>';
								$nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break;
					// grup barang

					// katalog
					case 'detilanggaran':
						$d_kategorianggaran = isset($_POST['d_kategorianggaranH'])?filter(trim($_POST['d_kategorianggaranH'])):'';
						$d_departemen       = isset($_POST['d_departemenS'])&& $_POST['d_departemenS']!=''?' da.departemen ='.$_POST['d_departemenS'].' AND ':'';
						$d_nama             = isset($_POST['d_namaS'])?filter(trim($_POST['d_namaS'])):'';
						$d_rekening         = isset($_POST['d_rekeningS'])?filter(trim($_POST['d_rekeningS'])):'';
						$d_keterangan       = isset($_POST['d_keteranganS'])?filter(trim($_POST['d_keteranganS'])):'';

						$sql = 'SELECT 
									da.replid,
									da.nama,
									da.keterangan,
									concat(dr.kode," - ",dr.nama) rekening
								FROM '.$tb2.' da 
									LEFT JOIN keu_detilrekening dr on dr.replid = da.rekening
								WHERE 
									da.kategorianggaran ='.$d_kategorianggaran.' and 
									'.$d_departemen.'
									da.nama LIKE"%'.$d_nama.'%" AND
									(dr.nama LIKE"%'.$d_rekening.'%" OR dr.kode LIKE "%'.$d_rekening.'%" )AND
									da.keterangan LIKE"%'.$d_keterangan.'%"';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi =$mnu2;
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;
						
						#ada data
						$jum     = mysql_num_rows($result);
						$out     ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$btn ='<td align="center">
											<button data-hint="ubah"  class="button" onclick="detilanggaranFR('.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="detilanggaranDel('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
											</button>
										 </td>';
								$out.= '<tr>
											<td>'.$res['nama'].'</td>
											<td>'.$res['rekening'].'</td>
											<td >'.$res['keterangan'].'</td>
											'.$btn.'
										</tr>';
								// $totaset+=$res['nominal'];
								$nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan="9"><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						// $out.= '<tr class="info"><td colspan="10">'..'</td></tr>';
						#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break;
					// katalog

					// barang
					case 'barang':
						$b_katalog    = isset($_POST['b_katalogS'])?filter(trim($_POST['b_katalogS'])):'';
						$b_kode       = isset($_POST['b_kodeS'])?filter(trim($_POST['b_kodeS'])):'';
						$b_barkode    = isset($_POST['b_barkodeS'])?filter(trim($_POST['b_barkodeS'])):'';
						$b_harga      = isset($_POST['b_hargaS'])?filter(trim($_POST['b_hargaS'])):'';
						$b_kondisi    = isset($_POST['b_kondisiS'])?filter(trim($_POST['b_kondisiS'])):'';
						$b_sumber     = isset($_POST['b_sumberS'])?filter(trim($_POST['b_sumberS'])):'';
						$b_status     = isset($_POST['b_statusS'])?filter(trim($_POST['b_statusS'])):'';
						$b_keterangan = isset($_POST['b_keteranganS'])?filter(trim($_POST['b_keteranganS'])):'';
						
						$sql = 'SELECT (
										SELECT 
											CONCAT(ll.kode,"/",gg.kode,"/",tt.kode,"/",kk.kode,"/",LPAD(b.urut,5,0))
										from 
											sar_katalog kk,
											sar_grup gg,
											sar_tempat tt,
											sar_lokasi ll
										where 
											kk.replid = b.katalog AND
											kk.grup   = gg.replid AND
											b.tempat  = tt.replid AND
											tt.lokasi = ll.replid
									)as kode,
									b.replid,
									LPAD(b.urut,5,0) as barkode,(
										case b.sumber
											when 0 then "Beli"
											when 1 then "Pemberian" 
											when 2 then "Membuat Sendiri" 
										end
									)as sumber,
									b.harga,
									IF(b. STATUS=1,"Tersedia","Dipinjam")AS status,
									k.nama as kondisi,
									t.nama as tempat,
									b.keterangan
								FROM
									sar_barang b 
									LEFT JOIN sar_kondisi k on k.replid = b.kondisi
									LEFT JOIN sar_tempat t on t.replid = b.tempat
								WHERE
									b.katalog = '.$b_katalog.' and
									b.kode LIKE "%'.$b_kode.'%" and
									b.barkode LIKE "%'.$b_barkode.'%" and
									b.harga LIKE "%'.$b_harga.'%" and
									b.sumber LIKE "%'.$b_sumber.'%" and
									b.kondisi LIKE "%'.$b_kondisi.'%" and
									b.status LIKE "%'.$b_status.'%" and
									b.keterangan LIKE "%'.$b_keterangan.'%"';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage= 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='barang';
					 // $obj 	= new pagination_class($sql,$starting,$recpage);  // lawas
						$obj 	= new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);  //baru
						$result =$obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							// $nox 	= $starting+1;
							while($res = mysql_fetch_array($result)){	
								$btn ='<td>
											<button data-hint="ubah"  class="button" onclick="barangFR('.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="barangDel('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$out.= '<tr>
											<td>'.$res['kode'].'</td>
											<td>'.$res['barkode'].'</td>
											<td>'.$res['tempat'].'</td>
											<td>'.$res['sumber'].'</td>
											<td class="text-right">Rp. '.number_format($res['harga']).',-</td>
											<td>'.$res['kondisi'].'</td>
											<td>'.$res['status'].'</td>
											<td>'.$res['keterangan'].'</td>
											'.$btn.'
										</tr>';
								// $nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						// $out.= '<tr class="info"><td colspan="10">'..'</td></tr>';
						#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break;
					// barang
				}
			break; 
			// tampil ---------------------------------------------------------------------

			// head info ------------------------------------------------------------------
			case 'headinfo':
				switch ($_POST['subaksi']) {
					case 'detilanggaran':
						$s = 'SELECT
								*
							FROM
								keu_kategorianggaran
							WHERE
								replid = '.$_POST['kategorianggaran'];
						$q    = mysql_query($s);
						$stat = ($q)?'sukses':'gagal';
						$r    = mysql_fetch_assoc($q);
						$out  = json_encode(array(
									'status'     =>$stat,
									'nama'       =>$r['nama'],
									'keterangan' =>$r['keterangan']
								));
					break;

					case 'barang':
						$s = '	SELECT
									g.replid,
									g.nama as grup,(
										SELECT nama
										from sar_lokasi 
										where replid = g.lokasi
									)as lokasi,
									IFNULL(tbjum.totbarang,0)totbarang,
									tbjum.susut,
									tbjum.nama as katalog,
									tbjum.totaset,
									tbjum.photo2
								from 
									sar_grup g
									LEFT JOIN (
										SELECT 
											k.replid,
											k.grup,
											k.susut,
											k.nama,
											k.photo2,
											count(*)totbarang,
											sum(b.harga)totaset
										from 
											sar_katalog k,
											sar_barang b
										WHERE
											k.replid = b.katalog AND
											k.replid = '.$_POST['katalog'].'
									)tbjum on tbjum.grup = g.replid
								where 
									tbjum.replid= '.$_POST['katalog'];
						// var_dump($s);exit();
						$e = mysql_query($s) or die(mysql_error());
						$r = mysql_fetch_assoc($e);
						if(!$e){
							$stat='gagal';
						}else{
							$stat ='sukses';
							$dt   = array(
										'idkatalog' =>$r['replid'],
										'katalog'   =>$r['katalog'],
										'grup'      =>$r['grup'],
										'photo2'    =>$r['photo2'],
										'lokasi'    =>$r['lokasi'],
										'susut'     =>$r['susut'],
										'totbarang' =>$r['totbarang'],
										'totaset'   =>number_format($r['totaset'])
									);
						}
						$out  = json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));
					break;
				}
			break;
			// head info ------------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				switch ($_POST['subaksi']) {
					case 'anggaran':
						$s 		= $tb.' set nama       = "'.filter($_POST['a_namaTB']).'",
											keterangan = "'.filter($_POST['a_keteranganTB']).'"';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;

					case 'detilanggaran':
						$s 	= 'keu_detilanggaran  set 	kategorianggaran = "'.$_POST['d_kategorianggaranH2'].'",
														departemen       = "'.filter($_POST['d_departemenTB']).'",
														nama             = "'.filter($_POST['d_namaTB']).'",
														rekening         = "'.$_POST['d_rekeningH'].'",
														keterangan       = "'.filter($_POST['d_keteranganTB']).'"';
						$s2 = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						$e  = mysql_query($s2);
						$id = mysql_insert_id();
						if(!$e){
							$stat = 'gagal_'.mysql_error();
						}else{
							if(!isset($_POST['replid'])){
								$tbuku  = mysql_fetch_assoc(mysql_query('SELECT replid from keu_tahunbuku where aktif =1'));
								$s3     = 'INSERT INTO keu_anggarantahunan SET 	detilanggaran = '.$id.',
																				tahunbuku ='.$tbuku['replid'];
								$e3  	= mysql_query($s3);
								$stat   = !$e3?'gagal_'.mysql_error():'sukses';
							}else{
								$stat   = 'sukses';
							}
						}$out 	= json_encode(array('status'=>$stat));
					break;

					case 'katalog':
						$s 		= $tb3.' set 	grup 		= "'.$_POST['k_grupH2'].'",
												kode 		= "'.filter($_POST['k_kodeTB']).'",
												nama 		= "'.filter($_POST['k_namaTB']).'",
												jenis 		= "'.$_POST['k_jenisTB'].'",
												susut 		= "'.filter($_POST['k_susutTB']).'",
												keterangan 	= "'.filter($_POST['k_keteranganTB']).'"
												'.(isset($_POST['file'])?', photo2= "'.$_POST['file'].'"':'');
						$stat2=true;
						if(!isset($_POST['replid'])){ //add
							$s2 = 'INSERT INTO '.$s;
						}else{ //edit
							$s2 = 'UPDATE '.$s.' WHERE replid='.$_POST['replid'];
							if(isset($_POST['photo_asal'])){ //change image
								$img='../../img/upload/'.$_POST['photo_asal'];
								if(file_exists($img)){ //checking image is exist
									$delimg = unlink($img);
									$stat2  = !$delimg?false:true;
								}
							}
						}
						if(!$stat2){// gagal hapus
							$stat='gagal_hapus_file';
						}else{ //sukses hapus file
							$e    = mysql_query($s2);
							$stat = $e?'sukses':'gagal_simpan_db';
						}$out  = json_encode(array('status'=>$stat));
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
					case 'anggaran':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
					break;

					case 'detilanggaran':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from keu_detilanggaran where replid='.$_POST['replid']));
						$s    = 'DELETE from keu_detilanggaran WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e    = mysql_query($s);
						if(!$e){
							$stat='gagal_'.mysql_error();
						}else{
							
							$stat='sukses';
						}
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
					case 'anggaran';
						$s = 	'SELECT *
								FROM '.$tb.'
								WHERE replid='.$_POST['replid'];
						// print_r($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array(
									'status'     =>$stat,
									'nama'       =>$r['nama'],
									'keterangan' =>$r['keterangan']
								));					
					break;

					case 'detilanggaran';
						$s = '	SELECT
									da.kategorianggaran,
									dr.nama rekening,
									da.rekening idrekening,
									da.nama,
									da.keterangan,
									da.departemen
								FROM
									keu_detilanggaran da
								LEFT JOIN keu_kategorianggaran ka ON ka.replid = da.kategorianggaran
								LEFT JOIN keu_detilrekening dr ON dr.replid = da.rekening
								WHERE
									da.replid ='.$_POST['replid'];
						// print_r($s);
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						if(!$e){
							$stat ='gagal';
						}else{
							$stat ='sukses';
							$dt   =array(
										'kategorianggaran' =>$r['kategorianggaran'],
										'idrekening'       =>$r['idrekening'],
										'rekening'         =>$r['rekening'],
										'departemen'       =>$r['departemen'],
										'nama'             =>$r['nama'],
										'keterangan'       =>$r['keterangan']
									);						
						}$out 	= json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));					
					break;

					case 'barang';
						$s ='SELECT
								b.tempat,
								LPAD(b.urut,5,0) as barkode,(
									SELECT 
										CONCAT(ll.kode,"/",gg.kode,"/",tt.kode,"/",kk.kode,"/",LPAD(b.urut,5,0))
									from 
										sar_katalog kk,
										sar_grup gg,
										sar_tempat tt,
										sar_lokasi ll
									where 
										kk.replid = b.katalog AND
										kk.grup   = gg.replid AND
										b.tempat  = tt.replid AND
										tt.lokasi = ll.replid
								)as kode,
								b.harga,
								b.urut,
								b.kondisi,
								b.sumber,
								b.keterangan
							FROM
								sar_barang b, sar_kondisi k
							WHERE
								b.kondisi = k.replid and
								b.replid  = '.$_POST['replid'];
						// print_r($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						if(!$e){
							$stat ='gagal';
						}else{
							$stat ='sukses';
							$dt   =array(
										'tempat'     =>$r['tempat'],
										'barkode'    =>$r['barkode'],
										'urut'       =>$r['urut'],
										'kode'       =>$r['kode'],
										'harga'      =>$r['harga'],
										'kondisi'    =>$r['kondisi'],
										'sumber'     =>$r['sumber'],
										'keterangan' =>$r['keterangan']
									);						
						}$out 	= json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
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
			
			// cmb kategori anggaran -----------------------------------------------------------------
			case 'cmbkategorianggaran':
				$w='';
				if(isset($_POST['replid'])){
					$w.='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w.='where '.$mnu.'='.$_POST[$mnu];
					}elseif(isset($_POST['departemen'])){
						$w.='where departemen ='.$_POST['departemen'];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY 
							nama asc';
				// var_dump($s);exit();
				$e 	= mysql_query($s);
				$n 	= mysql_num_rows($e);
				$ar=$dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error');
				}else{
					if($n=0){ // kosong 
						$ar = array('status'=>'kosong');
					}else{ // ada data
						if(!isset($_POST['replid'])){
							while ($r=mysql_fetch_assoc($e)) {
								$dt[]=$r;
							}
						}else{
							$dt[]=mysql_fetch_assoc($e);
						}$ar = array('status'=>'sukses','kategorianggaran'=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbtahunajaran -----------------------------------------------------------------

			}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>