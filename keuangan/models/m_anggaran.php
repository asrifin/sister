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
						$departemen  = (isset($_POST['a_departemenS']) && $_POST['a_departemenS']!='')?' ta.departemen='.$_POST['a_departemenS'].' AND ':'';
						$tahunajaran = (isset($_POST['a_tahunajaranS']) && $_POST['a_tahunajaranS']!='')?' t.tahunajaran='.$_POST['a_tahunajaranS'].' AND ':'';
						$tingkat     = (isset($_POST['a_tingkatS']) && $_POST['a_tingkatS']!='')?' k.tingkat='.$_POST['a_tingkatS'].' AND ':'';
						$nama        = isset($_POST['a_namaS'])?filter($_POST['a_namaS']):'';
						$rekening    = isset($_POST['a_rekeningS'])?filter($_POST['a_rekeningS']):'';
						$keterangan  = isset($_POST['a_keteranganS'])?filter($_POST['a_keteranganS']):'';

						$sql = 'SELECT
									k.replid,
									k.nama,
									k.keterangan,
									r.nama namarek,
									r.kode koderek,
									round((IF (count(*) = 1, 0, count(*) / 12)),0) jmlItem
								FROM
									keu_kategorianggaran k
									LEFT JOIN aka_tingkat t ON t.replid = k.tingkat
									LEFT JOIN aka_tahunajaran ta ON ta.replid = t.tahunajaran
									LEFT JOIN keu_detilrekening r ON r.replid = k.rekening
									LEFT JOIN keu_detilanggaran d ON d.kategorianggaran = k.replid
									LEFT JOIN keu_nominalanggaran n ON n.detilanggaran = d.replid
								WHERE
									'.$departemen.$tahunajaran.$tingkat.'
									k.nama LIKE "%'.$nama.'%"
									AND (
										r.nama LIKE "%'.$rekening.'%"
										OR r.kode LIKE "%'.$rekening.'%"
									)AND k.keterangan LIKE "%'.$keterangan.'%"
								GROUP BY
									k.replid
								ORDER BY
									k.replid ASC';
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
											<button data-hint="ubah"  class="button" onclick="loadFR(\'anggaran\','.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="anggaranDel('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
											</button>
										 </td>';
								$out.= '<tr>
											<td>'.$res['nama'].'</td>
											<td>'.$res['koderek'].' - '.$res['namarek'].'</td>
											<td>'.$res['keterangan'].'</td>
											<td class="text-center">'.$res['jmlItem'].' item</td>
											<td class="text-right" >Rp. '.number_format(getKatAnggaran($res['replid'],'kuotaNum')).'</td>
											<td class="text-right" >Rp. '.number_format(getKatAnggaran($res['replid'],'sisaNum')).'</td>
											'.$btn.'
										</tr>';
											// <td class="text-right" >Rp. '.number_format($res['nominal']).'</td>
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
					// kategori anggaran 

					// detil anggaran 
					case 'detilanggaran':
						$d_kategorianggaran = isset($_POST['d_kategorianggaranH'])?filter(trim($_POST['d_kategorianggaranH'])):'';
						$d_tingkat          = isset($_POST['d_tingkatS'])&& $_POST['d_tingkatS']!=''?' d.tingkat ='.$_POST['d_tingkatS'].' AND ':'';
						$d_nama             = isset($_POST['d_namaS'])?filter(trim($_POST['d_namaS'])):'';
						$d_keterangan       = isset($_POST['d_keteranganS'])?filter(trim($_POST['d_keteranganS'])):'';

						$sql = 'SELECT 
									replid,
									nama,
									keterangan
								FROM '.$tb2.' 
								WHERE 
									kategorianggaran ='.$d_kategorianggaran.' and 
									'.$d_tingkat.'
									nama LIKE"%'.$d_nama.'%" AND 
									keterangan LIKE"%'.$d_keterangan.'%"
								GROUP BY	
									replid';
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
								$kuota        = 'Rp. '.number_format(getDetAnggaran($res['replid'],'kuotaNum')); 
								$terpakaiNum  ='Rp. '.number_format(getDetAnggaran($res['replid'],'terpakaiNum'));
								$terpakaiPerc =intval(getDetAnggaran($res['replid'],'terpakaiPerc'));
								if($terpakaiPerc>75) {$clr='red';}
								elseif($terpakaiPerc>50) {$clr='orange';}
								elseif($terpakaiPerc>25) {$clr='yellow';}
								elseif($terpakaiPerc>0 OR $terpakaiPerc<25) {$clr='green';}
								$prog='<span class="progress-bar" data-role="progress-bar" data-value="'.($terpakaiPerc==0?1:$terpakaiPerc).'" data-color="bg-'.$clr.'"></span>';
								$out.= '<tr>
											<td>'.$res['nama'].'</td>
											<td align="right">'.$kuota.'</td>
											<td align="right">
												'.$prog.'
												<span class="place-left">'.$terpakaiPerc.' %</span> 
												<span class="place-right">'.$terpakaiNum.'</span>
											</td>
											<td >'.$res['keterangan'].'</td>
											'.$btn.'
										</tr>';
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
				}
			break; 
			// tampil ---------------------------------------------------------------------

			// head info ------------------------------------------------------------------
			case 'headinfo':
				switch ($_POST['subaksi']) {
					case 'detilanggaran':
						$s = '	SELECT 
									k.nama,
									k.keterangan,
									ta.tahunajaran,
									CONCAT(t.tingkat,"(",t.keterangan,")") tingkat,
									d.nama departemen
								FROM keu_kategorianggaran k
									LEFT JOIN aka_tingkat t on t.replid = k.tingkat
									LEFT JOIN aka_tahunajaran ta on ta.replid = t.tahunajaran
									LEFT JOIN departemen d on d.replid = ta.departemen
								WHERE 
									k.replid = '.$_POST['kategorianggaran'];
							// print_r($s);exit();
						$q    = mysql_query($s);
						$stat = $q?'sukses':'gagal';
						$r    = mysql_fetch_assoc($q);
						$katAnggKuotaNum = getKatAnggaran($_POST['kategorianggaran'],'kuotaNum');
						$katAnggSisaNum  = getKatAnggaran($_POST['kategorianggaran'],'sisaNum');
						$out  = json_encode(array(
									'status'          =>$stat,
									'nama'            =>$r['nama'],
									'keterangan'      =>$r['keterangan'],
									'tahunajaran'     =>$r['tahunajaran'],
									'tingkat'         =>$r['tingkat'],
									'departemen'      =>$r['departemen'],
									'katAnggKuotaNum' =>$katAnggKuotaNum,
									'katAnggSisaNum'  =>$katAnggSisaNum,
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
					// kategori anggaran
					case 'anggaran':
						$s 		= $tb.' set nama   		= "'.filter($_POST['a_namaTB']).'",
											tingkat 	= "'.filter($_POST['a_tingkatTB']).'",
											rekening   	= "'.filter($_POST['a_rekeningH']).'",
											keterangan 	= "'.filter($_POST['a_keteranganTB']).'"';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;

					// detil anggaran
					case 'detilanggaran':
						$su = 'keu_detilanggaran  set 	nama             = "'.$_POST['d_namaTB'].'",
														hargasatuan      = "'.getuang($_POST['d_hargasatuanTB']).'",
														keterangan       = "'.$_POST['d_keteranganTB'].'"';
						if(isset($_POST['replid']) AND $_POST['replid']!=''){
							$s1='UPDATE '.$su.' WHERE replid='.$_POST['replid'];
						}else{
							$s1='INSERT INTO '.$su.',kategorianggaran='.$_POST['d_kategorianggaranH2'];
						}
						$e1 = mysql_query($s1);
						$id = mysql_insert_id();
						if(!$e1){
							$stat = 'gagal_detilanggaran_'.mysql_error();
						}else{
							$stat='sukses';
							if(isset($_POST['d_idnominalH'])){
								$stat2=true;
								foreach ($_POST['d_idnominalH'] as $i => $v) {
									$su=' keu_nominalanggaran SET 	jml 	='.$_POST['d_jml'.$v.'TB'].',
																	bulan   ='.$v;
									if(isset($_POST['replid']) AND $_POST['replid']!=''){
										$s2='UPDATE '.$su.' WHERE detilanggaran='.$_POST['replid'].' AND bulan ='.$v;
									}else{
										$s2='INSERT INTO '.$su.', detilanggaran ='.$id;
									}
									$e2    =mysql_query($s2);
									$stat2 =!$e2?false:true;
								}$stat  = !$stat2?'gagal_nominal':'sukses';
							}
						}$out = json_encode(array('status'=>$stat));
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
							$s2   = 'DELETE FROM keu_nominalanggaran WHERE detilanggaran ='.$_POST['replid'];
							$e2   = mysql_query($s2);
							$stat = !$e?'gagal':'sukses';
						}
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
						$s = 	'SELECT 
									a.replid,
									a.nama,
									a.keterangan,
									d.replid idrekening,
									concat(d.kode," - ",d.nama)rekening,
									a.tingkat,
									t.tahunajaran,
									ta.departemen
								FROM '.$tb.' a
									LEFT JOIN aka_tingkat t on t.replid = a.tingkat
									LEFT JOIN aka_tahunajaran ta on ta.replid = t.tahunajaran
									LEFT JOIN keu_detilrekening d on d.replid = a.rekening
								WHERE
									a.replid ='.$_POST['replid'];
						// print_r($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array(
									'status'      =>$stat,
									'nama'        =>$r['nama'],
									'idrekening'  =>$r['idrekening'],
									'rekening'    =>$r['rekening'],
									'keterangan'  =>$r['keterangan'],
									'tingkat'     =>$r['tingkat'],
									'tahunajaran' =>$r['tahunajaran'],
									'departemen'  =>$r['departemen']
								));
					break;

					case 'detilanggaran';
						$s = '	SELECT 
									a.replid,
									a.nama,
									a.keterangan,	
									a.hargasatuan
								FROM keu_detilanggaran a
								WHERE a.replid='.$_POST['replid'];
						// print_r($s);
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						if(!$e){
							$stat ='gagal';
						}else{
							$s2     = '	SELECT 
											replid,
											bulan,
											jml,
											(jml * '.$r['hargasatuan'].')jmlHrg 
										FROM keu_nominalanggaran 
										WHERE detilanggaran = '.$r['replid'];
							$e2     = mysql_query($s2);
							$nomArr = array();
							$totJml =$totJmlHrg = 0;
							while ($r2=mysql_fetch_assoc($e2)) {
								$nomArr[]=$r2;
								$totJml+=$r2['jml'];
								$totJmlHrg+=$r2['jmlHrg'];
							}
							$dt = array(
								'nama'        =>$r['nama'],
								'hargasatuan' =>$r['hargasatuan'],
								'keterangan'  =>$r['keterangan'],
								'totJml'      =>$totJml,
								'totJmlHrg'   =>$totJmlHrg,
								'nomArr'      =>$nomArr
							);						
							$stat ='sukses';
						}$out = json_encode(array(
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