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

	$mnu  = 'transaksi';
	$mnu2 = 'rekening';
	$mnu3 = 'katalog';
	$mnu4 = 'barang';
	$mnu5 = 'jenis';
	
	$tb   = 'keu_'.$mnu;
	$tb2  = 'keu_'.$mnu2;
	$tb3  = 'keu_'.$mnu3;
	$tb4  = 'keu_'.$mnu4;
	$tb5  = 'keu_'.$mnu5;

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
				$page       = $_GET['page']; // get the requested page
				$limit      = $_GET['rows']; // get how many rows we want to have into the grid
				$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
				$sord       = $_GET['sord']; // get the direction
				$searchTerm = $_GET['searchTerm'];

				if(!$sidx) 
					$sidx =1;
				$ss='SELECT
						d.*,
						k.jenis
					FROM
						keu_detilrekening d 
						LEFT JOIN keu_kategorirekening k on k.replid = d.kategorirekening
					WHERE
						k.jenis="'.$_GET['jenis'].'" AND (
							d.kode LIKE "%'.$searchTerm.'%"
							OR d.nama LIKE "%'.$searchTerm.'%"
						)';
				// print_r($ss);exit();
				$result = mysql_query($ss);
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
						'replid' =>$row['replid'],
						'kode'   =>$row['kode'],
						'nama'   =>$row['nama'],
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
					case 'ju':
						$ju_no     = isset($_POST['ju_noS'])?filter(trim($_POST['ju_noS'])):'';
						$ju_uraian = isset($_POST['ju_uraianS'])?filter(trim($_POST['ju_uraianS'])):'';
						$sql       = 'SELECT * 
									from '.$tb.' 
									WHERE 
										(nomer like "%'.$ju_no.'%" OR nomer like "%'.$ju_no.'%" ) AND
										uraian like "%'.$ju_uraian.'%"';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='ju';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_array($result)){	
								$btn ='<td>
											<button data-hint="ubah"  class="button" onclick="juFR('.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="grupDel('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$s2 = 'SELECT r.kode,r.nama,j.debet,j.kredit
										from keu_jurnal j,keu_rekening r 
										where 
											j.transaksi ='.$res['replid'].' AND 
											j.rek=r.replid
										ORDER BY kredit  ASC';
						// print_r($sql);exit(); 	
								$e2 = mysql_query($s2);
								$tb2='';
								if(mysql_num_rows($e2)!=0){
	   								$tb2.='<table class="bordered striped lightBlue" width="100%">';
		   							while($r2=mysql_fetch_assoc($e2)){
		   								$tb2.='<tr>
		   										<td>'.$r2['nama'].'</td>
		   										<td>'.$r2['kode'].'</td>
		   										<td>Rp. '.number_format($r2['debet']).',-</td>
		   										<td>Rp. '.number_format($r2['kredit']).',-</td>
		   									</tr>';
		   							}$tb2.='</table>';
								}$out.= '<tr>
											<td>'.tgl_indo($res['tanggal']).'</td>
											<td>'.ju_nomor($res['nomer'],$res['jenis'],$res['nobukti']).'</td>
											<td>'.$res['uraian'].'</td>
											<td style="display:visible;" class="uraianCOL">'.$tb2.'</td>
											'.$btn.'
										</tr>';
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
					//Neraca Saldo
					case 'ns':

						$kode     = isset($_POST['ns_kodeS'])?filter(trim($_POST['ns_kodeS'])):'';
						$nama	  = isset($_POST['ns_namaS'])?filter(trim($_POST['ns_namaS'])):'';
						$sql       = 'SELECT 
											kr.kode kode,
									        kr.nama nama,
									        kj.debet debet,
									        kj.kredit kredit
									    FROM
											keu_transaksi kt 
									        LEFT JOIN keu_jurnal kj ON kt.replid = kj.transaksi 
									        LEFT JOIN keu_rekening kr ON kr.replid = kj.rek
									    WHERE
									    	kr.kode like "%'.$kode.'%" and
											kr.nama like "%'.$nama.'%"
										GROUP BY
											kr.kode
									    ORDER BY
									        kr.kategorirek,
											kr.kode ';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='ns';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_array($result)){	
								$out.= '<tr>
											<td>'.$res['kode'].'</td>
											<td>'.$res['nama'].'</td>
											<td>'.$res['debet'].'</td>
											<td>'.$res['kredit'].'</td>
										</tr>';
								$nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan="4" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						#link paging
						$out.= '<tr class="info"><td colspan="4">'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan="4">'.$obj->total.'</td></tr>';
					break;
					//Buku Besar
					case 'bb':
						$ju_no     = isset($_POST['ju_noS'])?filter(trim($_POST['ju_noS'])):'';
						$ju_uraian = isset($_POST['ju_uraianS'])?filter(trim($_POST['ju_uraianS'])):'';
						$sql       = 'SELECT * 
									from '.$tb.' 
									WHERE 
										(nomer like "%'.$ju_no.'%" OR nomer like "%'.$ju_no.'%" ) AND
										uraian like "%'.$ju_uraian.'%"';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='ju';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_array($result)){	
								$btn ='<td>
											<button data-hint="ubah"  class="button" onclick="juFR('.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="grupDel('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$s2 = 'SELECT r.kode,r.nama,j.debet,j.kredit
										from keu_jurnal j,keu_rekening r 
										where 
											j.transaksi ='.$res['replid'].' AND 
											j.rek=r.replid
										ORDER BY kredit  ASC';
								$e2 = mysql_query($s2);
								$tb2='';
								if(mysql_num_rows($e2)!=0){
	   								$tb2.='<table class="bordered striped lightBlue" width="100%">';
		   							while($r2=mysql_fetch_assoc($e2)){
		   								$tb2.='<tr>
		   										<td>'.$r2['nama'].'</td>
		   										<td>'.$r2['kode'].'</td>
		   										<td>Rp. '.number_format($r2['debet']).',-</td>
		   										<td>Rp. '.number_format($r2['kredit']).',-</td>
		   									</tr>';
		   							}$tb2.='</table>';
								}
								$out.= '<tr>
											<td>'.tgl_indo($res['tanggal']).'</td>
											<td>'.ju_nomor($res['nomer'],$res['jenis'],$res['nobukti']).'</td>
											<td>'.$res['uraian'].'</td>
											<td style="display:visible;" class="uraianCOL">'.$tb2.'</td>
											'.$btn.'
										</tr>';
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
					case 'nl':

						$kode     = isset($_POST['ns_kodeS'])?filter(trim($_POST['ns_kodeS'])):'';
						$nama	  = isset($_POST['ns_namaS'])?filter(trim($_POST['ns_namaS'])):'';
						$sql       = 'SELECT 
											kr.kode kode,
									        kr.nama nama,
									        kr.kategorirek kategorirek,
									        kj.debet debet,
									        kj.kredit kredit
									    FROM
									        keu_jurnal kj
									        LEFT JOIN keu_rekening kr ON kr.replid = kj.rek
									    WHERE
									    	kr.kode like "%'.$kode.'%" and
											kr.nama like "%'.$nama.'%"
										GROUP BY
											kr.kode
									    ORDER BY
									        kr.kategorirek,
											kr.kode ';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='ns';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_array($result)){	
										// $neracasaldo_debet=0; $neracasaldo_kredit=0;
										// $labarugi_debet=0; $labarugi_kredit=0;
										// $neraca_debet=0; $neraca_kredit=0;

								// if($res['kategorirek']==4){
								// 		$debet_ns =$res['debet'];
								// 		$kredit_ns ='';
								// }
								$out.= '<tr>
											<td>'.$res['kode'].'</td>
											<td>'.$res['nama'].'</td>
											<td>'.$res['debet'].'</td>
											<td>'.$res['kredit'].'</td>
											<td>&nbsp</td>
											<td>&nbsp</td>
											<td>&nbsp</td>
											<td>&nbsp</td>
										</tr>';
								$nox++;
											// <td>'.$debet_ns.'</td>
											// <td>'.$kredit_ns.'</td>
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan="8" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						#link paging
						$out.= '<tr class="info"><td colspan="8">'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan="8">'.$obj->total.'</td></tr>';
					break;
					//Laba Rugi
					case 'lr':

						$kode     = isset($_POST['ns_kodeS'])?filter(trim($_POST['ns_kodeS'])):'';
						$nama	  = isset($_POST['ns_namaS'])?filter(trim($_POST['ns_namaS'])):'';
						$sql       = 'SELECT 
											kr.kode kode,
									        kr.nama nama,
									        kr.kategorirek kategorirek,
									        kj.debet debet,
									        kj.kredit kredit
									    FROM
									        keu_jurnal kj
									        LEFT JOIN keu_rekening kr ON kr.replid = kj.rek
									    WHERE
									    	kr.kategorirek BETWEEN 6 AND 7
										GROUP BY
											kr.kode
									    ORDER BY
									        kr.kategorirek,
											kr.kode';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='lr';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_array($result)){	
									$rek=isset($res['rek']);
									$kategorirek = $res['kategorirek'];
									$neracasaldo[$rek]=array('debet'=>0,'kredit'=>0,'kode'=>$res['koderek'],'nama'=>$res['nrek'],'kategorirek'=>$kategorirek);
									$labarugi[$rek]=array('debet'=>0,'kredit'=>0);

									if($debet>=$kredit){
										$neracasaldo[$rek]['debet']=$selisih;
									} else {
										$neracasaldo[$rek]['kredit']=$selisih;
									}
									if($kategorirek==6){
										$rekpendapatan[$rek]=array();
										if($neracasaldo[$rek]['debet']>$neracasaldo[$rek]['kredit']){
											$rekpendapatan[$rek]['nominal']=-$neracasaldo[$rek]['debet'];
										} else {
											$rekpendapatan[$rek]['nominal']=$neracasaldo[$rek]['kredit'];
										}
										$rekpendapatan[$rek]['nama']=$neracasaldo[$rek]['nama'];
									}
									if($kategorirek==7){
										$rekbeban[$rek]=array();
										if($neracasaldo[$rek]['kredit']>$neracasaldo[$rek]['debet']){
											$rekbeban[$rek]['nominal']=-$neracasaldo[$rek]['kredit'];
										} else {
											$rekbeban[$rek]['nominal']=$neracasaldo[$rek]['debet'];
										}
										$rekbeban[$rek]['nama']=$neracasaldo[$rek]['nama'];
									}									// if($kategorirek==6){
									// }
								$out.= '<tr>
											<td>Pendapatan :</td>
											<td>&nbsp</td>
											<td>&nbsp</td>
										</tr>
										<tr>
											<td>'.$rekpendapatan[$rek]['nama'].'</td>
											<td>'.$rekpendapatan[$rek]['nominal'].'</td>
											<td>&nbsp</td>
										</tr>';
								$nox++;
											// <td>'.$debet_ns.'</td>
											// <td>'.$kredit_ns.'</td>
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan="8" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						#link paging
						$out.= '<tr class="info"><td colspan="8">'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan="8">'.$obj->total.'</td></tr>';
					break;

				}
			break; 
			// tampil ---------------------------------------------------------------------

			// generate kode
			case 'codeGen':
				/*switch ($_POST['subaksi']) {
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
				}*/
				$kode = getNoTrans2($_POST['subaksi']);
				$out  = json_encode(array(
					'status' =>($kode!=null?'sukses':'gagal'),
					'kode'   =>$kode
				));
			break;
			// generate kode

			// case 'cmbakanbayar':
			// 	$out=json_encode(array(
			// 		'status' =>(akanBayarOpt($_POST['subaksi'],$_POST['siswa'])==null?'gagal':'sukses'),
			// 		'datax'  =>akanBayarOpt($_POST['subaksi'],$_POST['siswa'])
			// 	));
			// break;


			// head info ------------------------------------------------------------------
			case 'headinfo':
				switch ($_POST['subaksi']) {
					case 'katalog':
						$s = 'SELECT 
								g.nama as grup,
								l.nama as lokasi,
								sum(b.harga)as totaset
							  FROM 
							  	'.$tb4.' b,
							  	'.$tb3.' k,
							  	'.$tb2.' l,
							  	'.$tb.' g
							  WHERE 
								g.replid  = '.$_POST['grup'].' and 
								b.katalog = k.replid and
								g.lokasi  = l.replid and
								g.replid  = k.grup';
						$q    = mysql_query($s);
						$stat = ($q)?'sukses':'gagal';
						$r    = mysql_fetch_assoc($q);
						$out  = json_encode(array(
									'status'  =>$stat,
									'grup'    =>$r['grup'],
									'lokasi'  =>$r['lokasi'],
									'totaset' =>number_format($r['totaset'])
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
				// switch ($_POST['subaksi']) {
					// 1. simpan transaksi
					$nominal=0;
					$sub = $_POST['subaksi']; // ju, in, out
					$c   = count($_POST[$sub.'_rekH']);
					foreach ($_POST[$sub.'_rekH'] as $i => $v) {
						$nom = intval(getuang($_POST[$sub.'_nominal'.$v.'TB']));
						if($nom!='0'){
							$nominal+=$nom;
						}
					}
					$s = 'INSERT INTO keu_transaksi SET 	tahunbuku  ='.getTahunBuku('replid').',
															nominal    ='.$nominal.',
															nomer      ="'.getNoTrans2($_POST['subaksi']).'",
															tanggal    ="'.date('Y-m-d').'",
															uraian     ="'.$_POST[$sub.'_uraianTB'].'"
															nobukti    ="'.$_POST[$sub.'_nobuktiTB'].'"';
					var_dump($s);exit();
					$e  = mysql_query($s);
					$id = mysql_insert_id();
					if(!$e) $stat='gagal_insert_transaksi';
					else{
						// 2. simpan jurnal
						$stat2 = true;
						$nomDebit = $nomKredit = 0;
						foreach ($_POST[$sub.'_rekH'] as $i => $v) {
							if($_POST[$sub.'_jenis'.$v.'TB']=='debit'){ // kredit
								$nom = intval(getuang($_POST[$sub.'_nominal'.$v.'TB']));
								if($nom!='0'){
									$nominal+=$nom;
								}
								$nom = intval(getuang($_POST[$sub.'_nominal'.$v.'TB']));
								$nomDebit+=$nom;
								$s2 = 'INSERT INTO keu_jurnal SET transaksi ='.$id.', rek ='.$_POST[$sub.'_rek'.$v.'H'].', debet ='.$nom;
								$e2 = mysql_query($s2);
							}else{ // kredit
								$nom = intval(getuang($_POST[$sub.'_nominal'.$v.'TB']));
								$nomKredit+=$nom;
								$s2 = 'INSERT INTO keu_jurnal SET transaksi ='.$id.', rek ='.$_POST[$sub.'_rek'.$v.'H'].', kredit ='.$nom;
								$e2 = mysql_query($s2);
							}
						}

						if(!$stat2) $stat = 'gagal_insert_jurnal';
						else{
							// 3. update saldo rekening
							if($sub!='ju'){ // selain jurnal umum 
								if($nominal!='0'){
									$s5   = 'UPDATE keu_saldorekening SET nominal2 =nominal2 '.getOperator($_POST['rekkasH']).' '.$nominal.' WHERE rekening ='.$_POST['rekkasH'].' AND tahunbuku='.getTahunBuku('replid');
									$s6   = 'UPDATE keu_saldorekening SET nominal2 =nominal2 '.getOperator($_POST['rekitemH']).' '.$nominal.' WHERE rekening ='.$_POST['rekitemH'].' AND tahunbuku='.getTahunBuku('replid');
									// var_dump($s6);exit();
									$e5   = mysql_query($s5);
									$e6   = mysql_query($s6);
									$stat = ($e5 OR $e6)?'sukses':'gagal_update_saldorekening';
								}else 
									$stat = 'sukses';
							}else
								$stat = 'sukses';
						}
					}
				$out = json_encode(array('status'=>$stat));
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
					case 'ju';
						$s = 'SELECT * FROM '.$tb.'  WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array(
									'status' =>$stat,
									'datax'  =>array(
										'nomer'   =>$r['nomer'],
										'tanggal' =>$r['tanggal'],
										'uraian'  =>$r['uraian']
								)));					
					break;

					case 'katalog';
						$s = '	SELECT
									k.kode,
									k.nama,
									k.jenis,
									k.photo2,
									k.susut,
									k.keterangan,
									l.nama as lokasi, 
									g.nama as grup
								FROM 
									'.$tb3.' k,
									 '.$tb2.' l,
									 '.$tb.' g
								WHERE 
									g.replid = k.grup and 
									l.replid = g.lokasi and 
									k.replid ='.$_POST['replid'];
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						if(!$e){
							$stat ='gagal';
						}else{
							$stat ='sukses';
							$dt   =array(
										'kode'       =>$r['kode'],
										'nama'       =>$r['nama'],
										'susut'      =>$r['susut'],
										'lokasi'     =>$r['lokasi'],
										'grup'       =>$r['grup'],
										'photo2'     =>$r['photo2'],
										'jenis'      =>$r['jenis'],
										'keterangan' =>$r['keterangan']
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
			}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>