<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	// note :
	/*ju : jurnal umum
	in : pemasukkan
	out : pengeluaran*/

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
				$page       = $_GET['page']; 
				$limit      = $_GET['rows'];
				$sidx       = $_GET['sidx']; 
				$sord       = $_GET['sord'];
				$searchTerm = $_GET['searchTerm'];
				$rekArr           = (isset($_GET['rekArr']) AND $_GET['rekArr']!='')?' AND r.replid NOT IN ('.$_GET['rekArr'].')':''; /*epiii*/
				$detilanggaranArr = (isset($_GET['detilanggaranArr']) AND $_GET['detilanggaranArr']!='')?' AND d.replid NOT IN ('.$_GET['detilanggaranArr'].')':''; /*epiii*/

				if(isset($_GET['jenis']) AND $_GET['jenis']!=''){
					if($_GET['jenis']=='rekitem') // in || out 
						$jenis = ' AND k.nama IN ("aktiva","modal","pendapatan","biaya","kewajiban")';
					elseif($_GET['jenis']=='rekkas') // in || out
						$jenis = ' AND k.nama IN ("kas","bank")';
					else // ju 
						$jenis = ' AND k.nama IN ("kas","aktiva") OR r.nama LIKE "%piutang%"';
				}

				if(isset($_GET['subaksi']) && $_GET['subaksi']=='rek'){ // rekening
					$ss='SELECT
							r.replid,
							r.kode,
							r.nama,
							s.nominal2 saldoSementara
						FROM
							keu_detilrekening r 
							LEFT JOIN keu_kategorirekening k on k.replid = r.kategorirekening
							LEFT JOIN keu_saldorekening s on s.rekening = r.replid
						WHERE
							(
								r.kode LIKE "%'.$searchTerm.'%"
								OR r.nama LIKE "%'.$searchTerm.'%"
							)'.$rekArr.$jenis;
							// '.(isset($_GET['jenis']) AND $_GET['jenis']!=''?'k.jenis="'.$_GET['jenis'].'" AND ':'').' (
				}elseif(isset($_GET['subaksi']) && $_GET['subaksi']=='invoice'){ // invoice pembelian dr. PO
					$ss='SELECT p.*
						FROM po_pembelian p
						WHERE 
							p.noinvoice LIKE "%'.$searchTerm.'%" OR
							p.nopo LIKE "%'.$searchTerm.'%" OR
							p.kodesupplier LIKE "%'.$searchTerm.'%"';
				}elseif(isset($_GET['subaksi']) && $_GET['subaksi']=='detilanggaran'){ // anggaran 
							// sum(n.nominal)nominal,
					$ss='SELECT
							d.replid,
							d.nama,
							k.nama kategorianggaran,
							departemen.nama departemen,
							concat(t.tingkat," (",t.keterangan,")") tingkat,
							concat(r.nama," (",r.kode,") ")rekening,
							r.replid idrekening
						FROM
							keu_detilanggaran d
							LEFT JOIN keu_nominalanggaran n ON n.detilanggaran = d.replid
							LEFT JOIN keu_kategorianggaran k ON k.replid = d.kategorianggaran
							LEFT JOIN keu_detilrekening r ON r.replid = k.rekening
							LEFT JOIN aka_tingkat t ON t.replid = k.tingkat
							LEFT JOIN aka_tahunajaran ta ON ta.replid = t.tahunajaran
							LEFT JOIN departemen ON departemen.replid = ta.departemen
						WHERE
							(
								d.nama LIKE "%'.$searchTerm.'%"
								OR k.nama LIKE "%'.$searchTerm.'%"
								OR r.nama LIKE "%'.$searchTerm.'%"
								OR r.kode LIKE "%'.$searchTerm.'%" 
							)
							'.$detilanggaranArr.'
						GROUP BY	
							d.replid ';
							// print_r(ss);exit();
				}
				// elseif(isset($_GET['subaksi']) && $_GET['subaksi']=='detilanggaran'){ // anggaran 
				// 	// sum(n.nominal)nominal,
				// 	$ss='SELECT
				// 			d.replid,
				// 			d.nama,
				// 			k.nama kategorianggaran,
				// 			concat(t.tingkat," (",t.keterangan,")") tingkat,
				// 			concat(r.nama," (",r.kode,") ")rekening,
				// 			r.replid idrekening
				// 		FROM
				// 			keu_detilanggaran d
				// 			LEFT JOIN keu_nominalanggaran n ON n.detilanggaran = d.replid
				// 			LEFT JOIN keu_kategorianggaran k ON k.replid = d.kategorianggaran
				// 			LEFT JOIN keu_detilrekening r ON r.replid = k.rekening
				// 			LEFT JOIN aka_tingkat t ON t.replid = d.tingkat
				// 		WHERE
				// 			(
				// 				d.nama LIKE "%'.$searchTerm.'%"
				// 				OR k.nama LIKE "%'.$searchTerm.'%"
				// 				OR r.nama LIKE "%'.$searchTerm.'%"
				// 				OR r.kode LIKE "%'.$searchTerm.'%" 
				// 			)
				// 			'.$detilanggaranArr.'
				// 		GROUP BY	
				// 			d.replid ';
				
				// }
				if(!$sidx) 
					$sidx =1;
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
					if($_GET['subaksi']=='rek'){ // rekening 
						$arr= array(
							'replid'         =>$row['replid'],
							'kode'           =>$row['kode'],
							'nama'           =>$row['nama'],
							'saldoSementara' =>$row['saldoSementara']
						);
					}elseif($_GET['subaksi']=='detilanggaran'){ // anggaran 
						$kuotaNum     = getDetAnggaran($row['replid'],'kuotaNum');
						$terpakaiPerc = getDetAnggaran($row['replid'],'terpakaiPerc');
						$terpakaiNum  = getDetAnggaran($row['replid'],'terpakaiNum');
						$sisaNum      = getDetAnggaran($row['replid'],'sisaNum');
						$arr= array(
							'replid'           =>$row['replid'],
							'nama'             =>$row['nama'],
							'kategorianggaran' =>$row['kategorianggaran'],
							'departemen'       =>$row['departemen'],
							'tingkat'          =>$row['tingkat'],
							'kuotaBilCur'      =>'Rp. '.number_format($kuotaNum),
							'sisaBilCur'       =>'Rp. '.number_format($sisaNum),
							'terpakaiBilCur'   =>'Rp. '.number_format($terpakaiNum),
							'sisaBilNum'       => $sisaNum,
							'idrekening'       => $row['idrekening'],
							'rekening'         => $row['rekening'],
						);
					}else{
						$arr[]=$row;
					}$rows[]=$arr; 
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
			// jenis laporan  (checkbox)
			case 'jenislaporan':
				// if(l.kategori="o","Operasional","Non Operasional")kategori, 
				$s = '	SELECT 
							r.replid idrekening,
							l.kategori,
							concat("(",r.kode,") ",r.nama)rekening 
						FROM 
							keu_jenislaporan l 
							LEFT JOIN keu_detilrekening r on r.replid = l.rekening
						WHERE
							l.jenis ="'.$_POST['jenis'].'"
						ORDER BY r.kode ASC';
				$e        = mysql_query($s);
				var_dump($s);exit();
				$jenisArr =array();
				$stat     =!$e?'gagal':'sukses';
				while ($r=mysql_fetch_assoc($e)) {
					$jenisArr[] =$r;
			 	}$out=json_encode(array('status'=>$stat,'jenisArr'=>$jenisArr));
			break;

			// jenis transaksi (checkbox)
			case 'jenistrans':
				$s = 'SELECT replid idjenis, nama jenistrans from keu_jenistrans';
				$e = mysql_query($s);
				$jenisArr=array();
				if(!$e) $stat='gagal_ambil_jenis-trans';
				else{
					while ($r=mysql_fetch_assoc($e)) {
						$s2= 'SELECT replid iddetjenis, nama detjenistrans FROM keu_detjenistrans WHERE jenistrans='.$r['idjenis'];
						// print_r($s2);exit();
						$e2=mysql_query($s2);
						if(!$e2) $stat='gagal_ambil_detil-jenis-trans';
						else{
							$detjenisArr=array();
							while ($r2=mysql_fetch_assoc($e2)) {
								$detjenisArr[]=$r2;
							}$jenisArr[] = array(
								'idjenis'     => $r['idjenis'],
								'jenistrans'  => $r['jenistrans'],
								'detjenisArr' =>$detjenisArr
							);$stat='sukses';
						}
				 	}$out=json_encode(array('status'=>$stat,'jenisArr'=>$jenisArr));
				}
			break;

			// tampil ---------------------------------------------------------------------
			case 'tampil':
				switch ($_POST['subaksi']) {
					// laporan sarpras (PO)
					case 'ls':
						$out ='';
						$no     = isset($_POST['ls_noS'])?filter($_POST['ls_noS']):'';
						$uraian = isset($_POST['ls_uraianS'])?filter($_POST['ls_uraianS']):'';
						$rekArr = '';

						$sql='SELECT *
							FROM keu_transaksi
							WHERE(
									nomer LIKE "%'.$no.'%"
									OR nobukti LIKE "%'.$no.'%"
								)
								AND uraian LIKE "%'.$uraian.'%"
								AND tanggal BETWEEN "'.tgl_indo6($_POST['tgl1TB']).'"
								AND "'.tgl_indo6($_POST['tgl2TB']).'"
								AND isPO =1
							ORDER BY
								replid DESC';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='ls';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$s2 = ' SELECT replid,rek,nominal,jenis
										FROM keu_jurnal 
										WHERE 
											transaksi ='.$res['replid'].'
										ORDER BY 
											jenis ASC';
								$e2  = mysql_query($s2);
						
								$tb2 ='';
								if(mysql_num_rows($e2)!=0){
	   								$tb2.='<table class="bordered striped lightBlue" width="100%">
												<tr class="info fg-white text-center">
			   										<td width="60%">Rekening</td>
													<td width="20%">Debit</td>
													<td width="20%">Kredit</td>
												</tr>';
		   							while($r2=mysql_fetch_assoc($e2)){
										$debit  =$r2['rek']==$res['rekkas']?$res['nominal']:0;
										$kredit =$r2['rek']==$res['rekitem']?$res['nominal']:0;
		   								$tb2.='<tr>
			   										<td>'.getRekening($r2['rek']).'</td>
			   										<td class="text-right">Rp. '.number_format($debit).',-</td>
			   										<td class="text-right">Rp. '.number_format($kredit).',-</td>
			   									</tr>';
		   							}$tb2.='</table>';
								}$out.= '<tr>
											<td>'.tgl_indo($res['tanggal']).'</td>
											<td style="font-weight:bold;">'.$res['nomer'].'<br>'.getDetJenisTrans2($res['replid']).'<br>'.$res['nobukti'].'</td>
											<td>'.$res['uraian'].'</td>
											<td style="display:visible;" class="uraianCOL">'.$tb2.'</td>
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
					
					// laporan penerimaan & pengeluaran (custom)
					case 'li':
						$out    = $rekArr = '';
						$no     = isset($_POST['li_noS'])?filter($_POST['li_noS']):'';
						$uraian = isset($_POST['li_uraianS'])?filter($_POST['li_uraianS']):'';
						$tahun  = (isset($_POST['li_tahunS']) && $_POST['li_tahunS']!='')?' AND YEAR(t.tanggal)='.$_POST['li_tahunS']:'';
						$bulan  = (isset($_POST['li_bulanS']) && $_POST['li_bulanS']!='')?' AND MONTH(t.tanggal)='.$_POST['li_bulanS']:'';

						// echo "<pre>";
						// print_r($_POST);
						// echo "</pre>";
						// exit();
						if(isset($_POST['jenisLaporanCB']) && count($_POST['jenisLaporanCB']>0)){
							$c = count($_POST['jenisLaporanCB'])-1;
							$rekArr.='rekitem IN ( ';
							foreach ($_POST['jenisLaporanCB'] as $i => $v) {
								if($i==$c) $rekArr.=$v;
								else $rekArr.=$v.',';
							}$rekArr.=')';
						
							$sql='SELECT t.*
								FROM keu_transaksi t
								WHERE '.$rekArr.$tahun.$bulan.'
								ORDER BY t.replid DESC';
							// print_r($sql);exit(); 	
							if(isset($_POST['starting'])){ //nilai awal halaman
								$starting=$_POST['starting'];
							}else{
								$starting=0;
							}

							$recpage = 5;//jumlah data per halaman
							$aksi    ='tampil';
							$subaksi ='li';
							$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
							$result  = $obj->result;

							#ada data
							$jum = mysql_num_rows($result);
							if($jum!=0){	
								$nox = $starting+1;
								while($res = mysql_fetch_assoc($result)){	
									$s2 = ' SELECT replid,rek,nominal,jenis
											FROM keu_jurnal 
											WHERE 
												transaksi ='.$res['replid'].'
											ORDER BY 
												jenis ASC';
									$e2  = mysql_query($s2);
							
									$tb2 ='';
									if(mysql_num_rows($e2)!=0){
		   								$tb2.='<table class="bordered striped lightBlue" width="100%">
													<tr class="info fg-white text-center">
				   										<td width="60%">Rekening</td>
														<td width="20%">Debit</td>
														<td width="20%">Kredit</td>
													</tr>';
			   							while($r2=mysql_fetch_assoc($e2)){
											$debit  =$r2['rek']==$res['rekkas']?$res['nominal']:0;
											$kredit =$r2['rek']==$res['rekitem']?$res['nominal']:0;
			   								$tb2.='<tr>
				   										<td>'.getRekening($r2['rek']).'</td>
				   										<td class="text-right">Rp. '.number_format($debit).',-</td>
				   										<td class="text-right">Rp. '.number_format($kredit).',-</td>
				   									</tr>';
			   							}$tb2.='</table>';
									}$out.= '<tr>
												<td>'.tgl_indo($res['tanggal']).'</td>
												<td style="font-weight:bold;">'.$res['nomer'].'<br>'.getDetJenisTrans2($res['replid']).'<br>'.$res['nobukti'].'</td>
												<td>'.$res['uraian'].'</td>
												<td style="display:visible;" class="uraianCOL">'.$tb2.'</td>
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
						}else{
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
					break;
					
					// jurnal umum 
					case 'ju':
						$jurnalArr = $ju_detjenistrans ='';
						if(isset($_POST['jenisAllCB'])){ //select all
							$s='SELECT replid FROM keu_detjenistrans';
							$e=mysql_query($s);
							while($r=mysql_fetch_assoc($e)){
								$jurnalArr.=','.$r['replid'];
							}$jurnalArr=substr($jurnalArr,1);
						}else{ // tidak select all
							if(isset($_POST['detjenisTB'])){
								foreach ($_POST['detjenisTB'] as $i=>$v) {
									$jurnalArr.=','.$i;
								}$jurnalArr=substr($jurnalArr,1);
							}else{
								$jurnalArr=0;
							}
						}$ju_detjenistrans=' AND detjenistrans in('.$jurnalArr.')';
						// var_dump($jurnalArr);exit();
						
						$ju_no     = isset($_POST['ju_noS'])?filter($_POST['ju_noS']):'';
						$ju_uraian = isset($_POST['ju_uraianS'])?filter($_POST['ju_uraianS']):'';
						$sql       = 'SELECT * 
									from '.$tb.' 
									WHERE 
										(nomer like "%'.$ju_no.'%" OR nobukti like "%'.$ju_no.'%" ) AND
										uraian like "%'.$ju_uraian.'%" '.$ju_detjenistrans.' AND 
										tanggal between "'.tgl_indo6($_POST['tgl1TB']).'" AND "'.tgl_indo6($_POST['tgl2TB']).'" 
									ORDER BY	
										replid DESC';
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
							while($res = mysql_fetch_assoc($result)){	
								$jDetTrans = getDetJenisTrans('jenistrans','replid',$res['detjenistrans']);
								$jTrans    = getJenisTrans('kode',$jDetTrans);
								if($jTrans=='ju'){
									$j='ju';
								}else{
									$j=$jTrans.'_come';
								}
								$btn ='<td align="center">
											<button data-hint="ubah"  class="button" onclick="loadFR(\''.$j.'\','.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
											</button>
										</td>';
								$s2 = ' SELECT replid,rek,nominal,jenis
										FROM keu_jurnal 
										WHERE 
											transaksi ='.$res['replid'].'
										ORDER BY 
											jenis ASC';
								$e2  = mysql_query($s2);
						// var_dump($s2);exit(); 	
								$tb2 ='';
								if(mysql_num_rows($e2)!=0){
	   								$tb2.='<table class="bordered striped lightBlue" width="100%">
												<tr class="info fg-white text-center">
			   										<td width="60%">Rekening</td>
													<td width="20%">Debit</td>
													<td width="20%">Kredit</td>
												</tr>';
		   							while($r2=mysql_fetch_assoc($e2)){
										// $jDetTrans = getDetJenisTrans('jenistrans','replid',$res['detjenistrans']);
										// $jTrans    = getJenisTrans('kode',$jDetTrans);
										// $jRek      = getKatRekBy('jenis',getRekBy('kategorirekening',$r2['rek']));
										// var_dump($jRek);exit();
		   								if($jTrans=='ju'){
		   									$debit=($r2['jenis']=='d'?$r2['nominal']:0);
		   									$kredit=($r2['jenis']=='k'?$r2['nominal']:0);
		   									// $debit=($jRek=='d'?$r2['nominal']:0);
		   									// $kredit=($jRek=='k'?$r2['nominal']:0);
		   								}else{
		   									if($jTrans=='out'){
		   										$debit=$r2['rek']==$res['rekitem']?$res['nominal']:0;
		   										$kredit=$r2['rek']==$res['rekkas']?$res['nominal']:0;
		   									}else{ // in
		   										$debit=$r2['rek']==$res['rekkas']?$res['nominal']:0;
		   										$kredit=$r2['rek']==$res['rekitem']?$res['nominal']:0;
		   									}
		   								}
		   								$tb2.='<tr>
			   										<td>'.getRekening($r2['rek']).'</td>
			   										<td class="text-right">Rp. '.number_format($debit).',-</td>
			   										<td class="text-right">Rp. '.number_format($kredit).',-</td>
			   									</tr>';
		   							}$tb2.='</table>';
								}$out.= '<tr>
											<td>'.tgl_indo($res['tanggal']).'</td>
											<td style="font-weight:bold;">'.$res['nomer'].'<br>'.getDetJenisTrans2($res['replid']).'<br>'.$res['nobukti'].'</td>
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
						$kode = isset($_POST['ns_kodeS'])?$_POST['ns_kodeS']:'';
						$nama = isset($_POST['ns_namaS'])?filter($_POST['ns_namaS']):'';
						$s = 'SELECT
									d.replid,
									d.kode,
									d.nama,IFNULL((
										SELECT  
											sum(kj.nominal)
										FROM	
											keu_jurnal kj
										WHERE 
											kj.jenis = "d" AND kj.rek= d.replid
									),0)nomDeb,IFNULL((
										SELECT  
											sum(kj.nominal)
										FROM	
											keu_jurnal kj
										WHERE 
											kj.jenis = "k" AND kj.rek= d.replid
									),0)nomKre
								FROM
									keu_jurnal j 
									LEFT JOIN keu_detilrekening d on d.replid = j.rek
									LEFT JOIN keu_saldorekening s on s.rekening = d.replid
								WHERE	
									s.tahunbuku = '.getTahunBuku('replid').'
								GROUP BY
									j.rek';
						// print_r($s);exit(); 	
						$aksi    ='tampil';
						$subaksi ='ns';
						$e       = mysql_query($s);
						$n       = mysql_num_rows($e);
						$out     ='';$totaset=0;
						$debitTot=$kreditTot=0;
						if($n!=0){	
							while($r = mysql_fetch_assoc($e)){	
								$debitTot+=$r['nomDeb'];
								$kreditTot+=$r['nomKre'];								
								$out.= '<tr>
											<td>'.$r['kode'].'</td>
											<td>'.$r['nama'].'</td>
											<td class="text-right">Rp. '.number_format($r['nomDeb']).'</td>
											<td class="text-right">Rp. '.number_format($r['nomKre']).'</td>
										</tr>';
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan="4" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						#link paging
						// var_dump($debitTot);exit();
						$out.= '<tr class="info"><td colspan="2" class="text-right">Jumlah :</td>
							<td class="text-right"><b>Rp. '.number_format($debitTot).'</b></td>
							<td class="text-right"><b>Rp. '.number_format($kreditTot).'</b></td>
						</tr>';
						// $out.='<tr class="info"><td colspan="4">'.$obj->total.'</td></tr>';
					break;

					//Buku Besar
					case 'bb':
						$bb_detilrekening = (isset($_POST['bb_detilrekeningS']) AND $_POST['bb_detilrekeningS']!='')?' AND  d.replid = '.$_POST['bb_detilrekeningS']:'';
						$sql  = 'SELECT
									d.replid,
									d.kode kode,
									d.nama nama,
									s.nominal2 saldo
								FROM
									keu_transaksi t
									LEFT JOIN keu_jurnal j ON t.replid = j.transaksi
									LEFT JOIN keu_detilrekening d ON d.replid = j.rek
									LEFT JOIN keu_saldorekening s  ON s.rekening = d.replid
								WHERE 
									t.tahunbuku='.getTahunBuku('replid').'
									'.$bb_detilrekening.'
								GROUP BY
									d.kode
								ORDER BY
									d.kategorirekening ASC,
									d.kode ASC';
						// var_dump($sql);exit();
						$result = mysql_query($sql);
						$jum    = mysql_num_rows($result);
						$out    ='';$totaset=0;
						if($jum!=0){	
							while($res = mysql_fetch_assoc($result)){
								// $out.='<ul class="fg-gray" style="list-style:none;">';
									$out.='<span>['.$res['kode'].'] '.$res['nama'].'</span> <b class="place-right fg-'.($res['saldo']<0?'red':($res['saldo']==0?'blue':'green')).'">Rp.'.number_format($res['saldo']).'</b>';
			                    		$out.='<table width="100%" class="table hovered bordered striped">
							                        <thead>
							                            <tr style="color:white;"class="info">
							                                <th class="text-center">Tanggal </th>
							                                <th class="text-center">No. Transaksi</th>
							                                <th class="text-center">Uraian</th>
							                                <th class="text-center">Debet</th>
							                                <th class="text-center">Kredit</th>
							                            </tr>
							                        </thead>
							                        <tbody class="fg-black">';
							                        $s2='SELECT 
															t.replid,
															t.tanggal,
															t.nomer,
															t.uraian,
													        d.nama,
												        	j.nominal,
												        	j.rek,
											        		t.rekkas,
											        		t.rekitem,
										        			t.detjenistrans
													    FROM
															keu_transaksi t 
													        LEFT JOIN keu_jurnal j ON t.replid = j.transaksi 
													        LEFT JOIN keu_detilrekening d ON d.replid = j.rek
													    WHERE d.replid='.$res['replid'].'
													    ORDER BY
													        d.kategorirekening ASC, 
															d.kode ASC';
													// var_dump($s2);exit();
													$e2       =mysql_query($s2);
													$debitTot =$kreditTot=0;
													while ($r2=mysql_fetch_assoc($e2)) {
														$jenis = getJenisTrans('kode',getDetJenisTrans('jenistrans','replid',$r2['detjenistrans']));
														if($jenis=='ju'){ // ju
															$debit=99;
															$kredit=0;
														}else{
															if($jenis=='out'){ // outcome
																$debit  = $r2['rekkas']==$r2['rek']?0:$r2['nominal'];
																$kredit = $r2['rekitem']==$r2['rek']?0:$r2['nominal'];
															}else{ // income
																$debit  = $r2['rekkas']==$r2['rek']?$r2['nominal']:0;
																$kredit = $r2['rekitem']==$r2['rek']?$r2['nominal']:0;
															}
														}
														$debitTot+=$debit;
														$kreditTot+=$kredit;
														$out.='<tr >
															<td width="10%">'.tgl_indo5($r2['tanggal']).'</td>
															<td  width="20%">'.$r2['nomer'].'</td>
															<td  width="30%">'.$r2['uraian'].'</td>
															<td  class="text-right" width="20%">Rp. '.number_format($debit).'</td>
															<td  class="text-right" width="20%">Rp. '.number_format($kredit).'</td>
														</tr>';
													}$out.='</tbody>
							                        <tfoot>
							                        	<tr class="info fg-white">
							                        		<th colspan="3" class="text-right">Jumlah</th>
							                        		<th class="text-right">Rp. '.number_format($debitTot).'</th>
							                        		<th class="text-right">Rp. '.number_format($kreditTot).'</th>
							                        	</tr>
							                        	<tr class="info fg-white">
							                        		<th colspan="3" class="text-right">Selisih</th>
							                        		<th colspan="2" class="text-cen">Rp. '.number_format($debitTot-$kreditTot).'</th>
							                        	</tr>
						                        	</tfoot>
							                    </table>'; 
								// $out.='</ul>';
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
					break;

					// neraca lajur
					case 'nl':
						$kode = isset($_POST['ns_kodeS'])?filter($_POST['ns_kodeS']):'';
						$nama = isset($_POST['ns_namaS'])?filter($_POST['ns_namaS']):'';
						$s  = 'SELECT
									d.replid,
									d.kode,
									d.nama,IFNULL((
										SELECT  
											sum(kj.nominal)
										FROM	
											keu_jurnal kj
										WHERE 
											kj.jenis = "d" AND kj.rek= d.replid
									),0)nomDeb,IFNULL((
										SELECT  
											sum(kj.nominal)
										FROM	
											keu_jurnal kj
										WHERE 
											kj.jenis = "k" AND kj.rek= d.replid
									),0)nomKre
								FROM
									keu_jurnal j 
									LEFT JOIN keu_detilrekening d on d.replid = j.rek
									LEFT JOIN keu_saldorekening s on s.rekening = d.replid
								WHERE	
									s.tahunbuku = '.getTahunBuku('replid').'
								GROUP BY
									j.rek ';
						$e   = mysql_query($s);
						$n   = mysql_num_rows($e);
						$out ='';$totaset=0;
						if($n!=0){	
							while($r = mysql_fetch_assoc($e)){	
								$out.= '<tr>
											<td>'.$r['kode'].'</td>
											<td>'.$r['nama'].'</td>
											<td class="text-right">Rp. '.number_format($r['nomDeb']).'</td>
											<td class="text-right">Rp. '.number_format($r['nomKre']).'</td>
											<td>&nbsp</td>
											<td>&nbsp</td>
											<td>&nbsp</td>
											<td>&nbsp</td>
										</tr>';
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan="8" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}$out.='<tr>
							<td colspan="2" class="text-right">Jumlah : </td>
							<td class="text-right"></td>
							<td class="text-right"></td>
							<td class="text-right"></td>
							<td class="text-right"></td>
							<td class="text-right"></td>
							<td class="text-right"></td>
						</tr>';
					break;

					//Laba Rugi
					case 'lr':
						$out ='';
						$pendapatanTot=$biayaTot=0;
						$s=' SELECT
								d.kode,
								d.nama,
								j.nominal
							FROM
								keu_transaksi t
								LEFT JOIN keu_jurnal j ON j.transaksi = t.replid
								LEFT JOIN keu_detilrekening d ON d.replid = j.rek
								LEFT JOIN keu_kategorirekening k ON k.replid = d.kategorirekening
							WHERE
								k.nama=';
						$s1 = $s.'"pendapatan"';
						$s2 = $s.'"biaya"';
						$e1  = mysql_query($s1);
						$n1  = mysql_num_rows($e1);
						$e2  = mysql_query($s2);
						$n2  = mysql_num_rows($e2);
						
						// pendapatan
						$out.='<table width="100%" class="table">
			                        <thead>
			                            <tr class="info fg-white">
			                                <th width="50%" class="text-left">Rekening</th>
			                                <th width="25%" class="text-right">Nominal</th>
			                                <th  width="25%" class="text-right">Sub Total</th>
			                            </tr>
			                            <tr>
			                                <th class="text-left" colspan="3" >Pendapatan</th>
			                            </tr>
			                        </thead>
			                        <tbody>';
						if($n1!=0){	
							while($r1 = mysql_fetch_assoc($e1)){
								$out.= '<tr>
											<td>['.$r1['kode'].'] '.$r1['nama'].'</td>
											<td align="right">Rp. '.number_format($r1['nominal']).'</td>
											<td></td>
										</tr>';
								$pendapatanTot+=$r1['nominal'];
							}
						}else{
							$out.= '<tr align="center">
									<td  colspan="8" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}$out.='</tbody>';
						$out.='<tfoot>
									<tr>
										<td align="right" colspan="2">Total :</td>
										<td class="bg-green fg-white" align="right">Rp. '.number_format($pendapatanTot).'</td>
									</tr>
								</tfoot>';
						$out.='</table>';                 
						
						//biaya
						$out.='<table width="100%" class="table">
			                        <thead>
			                            <tr>
			                                <th colspan="3" class="text-left">Beban</th>
			                            </tr>
			                        </thead>
			                        <tbody>';
						if($n2!=0){	
							while($r2 = mysql_fetch_assoc($e2)){
								$out.= '<tr>
											<td width="50%">['.$r2['kode'].'] '.$r2['nama'].'</td>
											<td width="25%"align="right">Rp. '.number_format($r2['nominal']).'</td>
											<td width="25%"></td>
										</tr>';
								$biayaTot+=$r2['nominal'];

							}
						}else{
							$out.= '<tr align="center">
									<td  colspan="8" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}$out.='</tbody>';
						$out.='<tfoot>
									<tr>
										<td align="right" colspan="2">Total :</td>
										<td class="bg-red fg-white" align="right">Rp. '.number_format($biayaTot).'</td>
									</tr>
								</tfoot>';
						$out.='</table>';
						$selisih = $pendapatanTot-$biayaTot;
						$status  = $selisih<0?'Kerugian : ':($selisih==0?'normal':'Laba :');
						$warna   = $selisih<0?'red':($selisih==0?'blue':'green');
						$out.='<table wiidth="100%" class="table">
									<tr>
										<th width="75%" colspan="2" align="right">'.$status.'</th>
										<th class="bg-'.$warna.' fg-white" width="25%" align="right">Rp. '.number_format($pendapatanTot-$biayaTot).'</th>
									</tr>
								</table>';                 
					break;

					//laporan neraca 
					case 'ln':
						$out ='';
						$aktivaTot=$pasivaTot=0;
						$s1=' SELECT
								d.kode,
								d.nama,
								SUM(if(j.jenis="k",concat("-",j.nominal),j.nominal))nominal
							FROM
								keu_transaksi t
								LEFT JOIN keu_jurnal j ON j.transaksi = t.replid
								LEFT JOIN keu_detilrekening d ON d.replid = j.rek
								LEFT JOIN keu_kategorirekening k ON k.replid = d.kategorirekening
							WHERE
								k.nama IN (
									"KAS",
									"BANK",
									"AKTIVA",
									"KEWAJIBAN",
									"MODAL"
								) AND t.tahunbuku ='.getTahunBuku('replid').'
							GROUP BY
								k.replid';
						// var_dump($s1);exit();
						$s2=' SELECT 
									IF(sum(tb.nominal)<0,0,sum(tb.nominal)) selisih 
								from (
									SELECT
										d.replid,
										d.kode,
										d.nama,
										k.replid idkaterek,
										k.nama katrek,
										if(k.nama="BIAYA",concat("-",sum(j.nominal)),sum(j.nominal))nominal
									FROM 
										keu_transaksi t
										LEFT JOIN keu_jurnal j on j.transaksi = t.replid
										LEFT JOIN keu_detilrekening d on d.replid = j.rek
										LEFT JOIN keu_kategorirekening k on k.replid= d.kategorirekening
									WHERE
										k.nama IN ("PENDAPATAN","BIAYA")
									GROUP BY 
										d.kategorirekening
									ORDER BY
										k.nama DESC
								)tb';
						$e1 = mysql_query($s1);
						$n1 = mysql_num_rows($e1);
						$e2 = mysql_query($s2);
						$n2 = mysql_num_rows($e2);
						
						// AKTIVA -------------------------
						$out.='<table width="100%" class="table">
			                        <thead>
			                            <tr class="info fg-white">
			                                <th width="50%" class="text-left">Rekening</th>
			                                <th width="25%" class="text-right">Nominal</th>
			                                <th  width="25%" class="text-right">Sub Total</th>
			                            </tr>
			                            <tr>
			                                <th class="text-left" colspan="3" >Aktiva : </th>
			                            </tr>
			                        </thead>
			                        <tbody>';
						if($n1!=0){	
							while($r1 = mysql_fetch_assoc($e1)){
							// <td>['.$r1['kode'].'] '.$r1['nama'].'</td>
								$out.= '<tr>
											<td>- '.$r1['nama'].'</td>
											<td class="fg-'.($r1['nominal']<0?'red':'').'" align="right">Rp. '.number_format($r1['nominal']).'</td>
											<td></td>
										</tr>';
								$aktivaTot+=$r1['nominal'];
							}
						}else{
							$out.= '<tr align="center">
									<td  colspan="8" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}$out.='</tbody>';
						$out.='<tfoot>
									<tr>
										<td align="right" colspan="2">Total Aktiva:</td>
										<td class="bg-green fg-white" align="right">Rp. '.number_format($aktivaTot).'</td>
									</tr>
								</tfoot>';
						$out.='</table>';                 
						
						// PASIVA -------------------------
						$out.='<table width="100%" class="table">
			                        <thead>
			                            <tr>
			                                <th colspan="3" class="text-left">Passiva :</th>
			                            </tr>
			                        </thead>
			                        <tbody>';
						if($n2!=0){	
							$r2 = mysql_fetch_assoc($e2);
							// while($r2 = mysql_fetch_assoc($e2)){
								// <td width="50%">['.$r2['kode'].'] '.$r2['nama'].'</td>
								$out.= '<tr>
											<td width="50%">- Laba Bersih </td>
											<td width="25%"align="right">Rp. '.number_format($r2['selisih']).'</td>
											<td width="25%"></td>
										</tr>';
								$pasivaTot+=$r2['selisih'];
							// }
						}else{
							$out.= '<tr align="center">
									<td  colspan="8" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}$out.='</tbody>';
						$out.='<tfoot>
									<tr>
										<td align="right" colspan="2">Total Passiva:</td>
										<td class="bg-green fg-white" align="right">Rp. '.number_format($pasivaTot).'</td>
									</tr>
								</tfoot>';
								// <td class="bg-green fg-white" align="right">Rp. '.number_format($pasivaTot).'</td>
						$out.='</table>';
						// $selisih = $aktivaTot-$pasivaTot;
						// $status  = $selisih<0?'Kerugian : ':($selisih==0?'normal':'Laba :');
						// $warna   = $selisih<0?'red':($selisih==0?'blue':'green');
						// $out.='<table width="100%" class="table">
						// 			<tr>
						// 				<th width="75%" colspan="2" align="right">'.$status.'</th>
						// 				<th class="bg-green fg-white" width="25%" align="right">Rp. '.number_format($aktivaTot-$pasivaTot).'</th>
						// 			</tr>
						// 		</table>';                 
								// <th class="bg-'.$warna.' fg-white" width="25%" align="right">Rp. '.number_format($pendapatanTot-$pasivaTot).'</th>
					break;

					// posisi kas bank
					case 'pkb':
						// $bb_detilrekening = (isset($_POST['bb_detilrekeningS']) AND $_POST['bb_detilrekeningS']!='')?' AND  d.replid = '.$_POST['bb_detilrekeningS']:'';
						$s  = 'SELECT
									d.replid,
									d.kode kode,
									d.nama nama,
									s.nominal saldoAwal,
									s.nominal2 saldoAkhir
								FROM
									keu_transaksi t
									LEFT JOIN keu_jurnal j ON t.replid = j.transaksi
									LEFT JOIN keu_detilrekening d ON d.replid = j.rek
									LEFT JOIN keu_kategorirekening k ON k.replid = d.kategorirekening
									LEFT JOIN keu_saldorekening s  ON s.rekening = d.replid
								WHERE 
									t.tahunbuku='.getTahunBuku('replid').' AND(
										k.nama ="KAS" OR 
										k.nama ="BANK"
									) 
								GROUP BY
									d.kode
								ORDER BY
									d.kategorirekening ASC,
									d.kode ASC';
						// var_dump($s);exit();
						$e   = mysql_query($s);
						$jum = mysql_num_rows($e);
						$out ='';$totaset=0;
						if($jum!=0){	
							while($r = mysql_fetch_assoc($e)){
								// $out.='<ul class="fg-gray" style="list-style:none;">';
									$out.='	<span>['.$r['kode'].'] '.$r['nama'].'</span> 
											<b class="place-right fg-'.($r['saldoAwal']<0?'red':($r['saldoAwal']==0?'blue':'green')).'">
												Saldo Awal : Rp.'.number_format($r['saldoAwal']).'
											</b>';
										
										// tabel penerimaan -------------------------------------
										$out.='<div>Penerimaan :</div>';
			                    		$out.='<table width="100%" class="table hovered bordered striped">
							                        <thead>
							                            <tr style="color:white;"class="info">
							                                <th class="text-center">Tanggal </th>
							                                <th class="text-center">No. Transaksi</th>
							                                <th class="text-center">Uraian</th>
							                                <th class="text-center">Nominal</th>
							                            </tr>
							                        </thead>
							                        <tbody class="fg-black">';
							                        $s2='SELECT 
															t.replid,
															t.tanggal,
															t.nomer,
															t.uraian,
													        d.nama,
												        	j.nominal,
												        	j.rek,
											        		t.rekkas,
											        		t.rekitem,
										        			t.detjenistrans
													    FROM
															keu_transaksi t 
													        LEFT JOIN keu_jurnal j ON t.replid = j.transaksi 
													        LEFT JOIN keu_detilrekening d ON d.replid = j.rek
													    WHERE 
													    	d.replid='.$r['replid'].' AND	
												    		j.jenis = "d"
													    ORDER BY
													        d.kategorirekening ASC, 
															d.kode ASC';
													$e2       =mysql_query($s2);
													$debitTot =0;
													if(mysql_num_rows($e2)<=0){
														$out.='<tr>
															<td colspan="4" class="fg-red text-center">data kosong</td>
														</tr>';
													}else{
														while ($r2=mysql_fetch_assoc($e2)) {
															$debitTot+=$r2['nominal'];
															$out.='<tr >
																<td width="10%">'.tgl_indo5($r2['tanggal']).'</td>
																<td  width="20%">'.$r2['nomer'].'</td>
																<td  width="30%">'.$r2['uraian'].'</td>
																<td style="font-weight:bold;" class="text-right fg-green" width="20%">Rp. '.number_format($r2['nominal']).'</td>
															</tr>';
														}
													}$out.='</tbody>
							                        <tfoot>
							                        	<tr class="info fg-white">
							                        		<th colspan="3" class="text-right">Jumlah : </th>
							                        		<th class="text-right">Rp. '.number_format($debitTot).'</th>
							                        	</tr>
						                        	</tfoot>
							                    </table>';

										// tabel pengeluaran -------------------------------------
										$out.='<div>Pengeluaran :</div>';
			                    		$out.='<table width="100%" class="table hovered bordered striped">
							                        <thead>
							                            <tr style="color:white;"class="info">
							                                <th class="text-center">Tanggal </th>
							                                <th class="text-center">No. Transaksi</th>
							                                <th class="text-center">Uraian</th>
							                                <th class="text-center">Nominal</th>
							                            </tr>
							                        </thead>
							                        <tbody class="fg-black">';
							                        $s3='SELECT 
															t.replid,
															t.tanggal,
															t.nomer,
															t.uraian,
													        d.nama,
												        	j.nominal,
												        	j.rek,
											        		t.rekkas,
											        		t.rekitem,
										        			t.detjenistrans
													    FROM
															keu_transaksi t 
													        LEFT JOIN keu_jurnal j ON t.replid = j.transaksi 
													        LEFT JOIN keu_detilrekening d ON d.replid = j.rek
													    WHERE 
													    	d.replid='.$r['replid'].' AND	
												    		j.jenis = "k"
													    ORDER BY
													        d.kategorirekening ASC, 
															d.kode ASC';
													$e3 =mysql_query($s3);
													$kreditTot =0;

													if(mysql_num_rows($e3)<=0){
														$out.='<tr>
															<td colspan="4" class="fg-red text-center">data kosong</td>
														</tr>';
													}else{
														while ($r3=mysql_fetch_assoc($e3)) {
															$kreditTot+=$r3['nominal'];
															$out.='<tr >
																<td width="10%">'.tgl_indo5($r3['tanggal']).'</td>
																<td  width="20%">'.$r3['nomer'].'</td>
																<td  width="30%">'.$r3['uraian'].'</td>
																<td  style="font-weight:bold;"  class="text-right fg-red" width="20%">Rp. '.number_format($r3['nominal']).'</td>
															</tr>';
														}
													}$out.='</tbody>
							                        <tfoot>
							                        	<tr class="info fg-white">
							                        		<th colspan="3" class="text-right">Jumlah : </th>
							                        		<th class="text-right">Rp. '.number_format($kreditTot).'</th>
							                        	</tr>
						                        	</tfoot>
							                    </table>';
				                    	$out.='<b class="place-right"> Saldo Akhir : Rp. '.number_format($r['saldoAkhir']).'</b><br><br>';
				                    	$out.='<hr>';
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
					break;

					//buku tambahan 
					case 'bt':
						$out='<div style="font-weight:bold;" class="text-right">Tahun Buku : '.getTahunBuku('nama').'</div>
							<table class="table hovered bordered striped">
 	                        <thead>
 	                            <tr style="color:white;"class="info">
 	                                <th class="text-center">Tanggal </th>
 	                                <th class="text-center">Kode Rekening</th>
 	                                <th class="text-center">Nama Perkiraan</th>
 	                                <th class="text-center">No. Transaksi</th>
 	                                <th class="text-center">Uraian</th>
 	                                <th class="text-center">Debet</th>
 	                                <th class="text-center">Kredit</th>
 	                            </tr>
 	                            <tr style="display:none;" id="btTR" class="info">
 	                                <th class="text-center"></th>
 	                                <th class="text-center"><div class="input-control text"><input placeholder="cari" id="bt_kodeS" class="bt_cari"></div></th>
 	                                <th class="text-center"><div class="input-control text"><input placeholder="cari" id="bt_namaS" class="bt_cari"></div></th>
 	                                <th class="text-center"></th>
 	                                <th class="text-center"></th>
 	                                <th class="text-center"></th>
 	                                <th class="text-center"></th>
 	                            </tr>
 	                        </thead>
 	                        <tbody>';
						$s    = 'SELECT
									t.tanggal,
									d.kode,
									d.nama,
									t.nomer,
									t.uraian,
									s.nominal saldoAwal,
									s.nominal2 saldoAkhir,
									(SELECT sum(nominal) FROM keu_jurnal where transaksi=t.replid and jenis="d")nomDeb,
									(SELECT sum(nominal) FROM keu_jurnal where transaksi=t.replid and jenis="k")nomKre
								FROM
									keu_transaksi t 
									LEFT JOIN keu_jurnal j on j.transaksi = t.replid
									LEFT JOIN keu_detilrekening d on d.replid = j.rek
									LEFT JOIN keu_kategorirekening k on k.replid = d.kategorirekening
									LEFT JOIN keu_saldorekening s on s.rekening = d.replid
								WHERE
									t.tahunbuku=1 
									and k.nama="kas"
								GROUP BY 
									t.replid';
						$e    = mysql_query($s);
						$n    = mysql_num_rows($e);
						$saldoAwal=$saldoAkhir=$mutasiTot=0;
						if($n>=0){	
							while($r = mysql_fetch_assoc($e)){	
								$saldoAwal+=$r['saldoAwal'];								
								$saldoAkhir+=$r['saldoAkhir'];								
								$mutasiTot+=$r['nomKre'];								
								$out.= '<tr>
											<td>'.tgl_indo5($r['tanggal']).'</td>
											<td>'.$r['kode'].'</td>
											<td>'.$r['nama'].'</td>
											<td>'.$r['nomer'].'</td>
											<td>'.$r['uraian'].'</td>
											<td class="text-right">Rp. '.number_format($r['nomDeb']).'</td>
											<td class="text-right">Rp. '.number_format($r['nomKre']).'</td>
										</tr>';
							}
						}else{ #kosong
							$outx.= '<tr align="center">
									<td  colspan="4" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}$out.='<tr style="font-weight:bold;">
							<td colspan="4"></td>
							<td>Total Mutasi</td>
							<td colspan="2" class="text-right">Rp. '.number_format($mutasiTot).'</td>
						</tr><tr style="font-weight:bold;">
							<td colspan="4"></td>
							<td>Total Saldo Awal</td>
							<td colspan="2" class="text-right">Rp. '.number_format($saldoAwal).'</td>
						</tr><tr style="font-weight:bold;">
							<td colspan="4"></td>
							<td>Total Saldo Akhir</td>
							<td colspan="2" class="text-right">Rp. '.number_format($saldoAkhir).'</td>
						</tr>';
                        $out.='</tbody>
 	                    </table>'; 
 	                    // $out='okok';
					break;
				}
			break; 
			// tampil ---------------------------------------------------------------------

			// generate kode
			case 'codeGen':
				$kode = getNoTrans2($_POST['subaksi']);
				$out  = json_encode(array(
					'status' =>($kode!=null?'sukses':'gagal'),
					'kode'   =>$kode
				));
			break;
			// generate kode

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
				$sub = $_POST['subaksiH']; // ju, in, out
				if($sub=='ju'){
					// 1. simpan transaksi
					$totNominal = 0;
					$c          = count($_POST[$sub.'_idTR']);
					$rekArr     = $_POST[$sub.'_idTR'];
					foreach ($rekArr as $i => $v) {
						$nom = intval(getuang($_POST[$sub.'_nominal'.$v.'TB']));
						$totNominal+=$nom;
					}
					$totNominal =$sub=='ju'?($totNominal/2):$totNominal;
					$s1 = 'keu_transaksi SET 	tahunbuku     ='.getTahunBuku('replid').',
												nominal       ='.$totNominal.',
												tanggal       ="'.tgl_indo6($_POST['tanggalTB']).'",
												detjenistrans ='.getDetJenisTrans('replid','kode',$_POST['detjenistransH']).',
												nobukti       ="'.$_POST['nobuktiTB'].'",
												uraian        ="'.$_POST['uraianTB'].'",
												nomer         ="'.$_POST['nomerH'].'"';
					$s  = (isset($_POST['idformH']) AND $_POST['idformH']!='')?'UPDATE '.$s1.' WHERE replid='.$_POST['idformH']:'INSERT INTO '.$s1;
					$e  = mysql_query($s);
					$id = mysql_insert_id();
					if(!$e) $stat='gagal_insert_transaksi';
					else{
						// 2.a hapus jurnal (jika ada)
						$stat22 = true;
						if(isset($_POST['idDelTR']) AND $_POST['idDelTR']!=''){
							$ss2  = 'DELETE FROM keu_jurnal WHERE replid IN ('.$_POST['idDelTR'].')';
							$ee2  = mysql_query($ss2);
							$stat22 = !$ee2?false:true; 
						}
						// 2.b simpan jurnal
						$stat2 =$stat2 = true;
						$nomDebit = $nomKredit = 0;
						
						if(!$stat22) $stat='gagal_delete_jurnal'; // ada hapus jurnal AND gagal 
						else{ // tidak ada hapus jurnal OR sukses hapus
							
							foreach ($rekArr as $i => $v) {
								$nom2  = getuang($_POST[$sub.'_nominal'.$v.'TB']);
								$jenis = $_POST[$sub.'_jenis'.$v.'TB'];
								$s     = ' keu_jurnal SET 	rek     ='.$_POST[$sub.'_rek'.$v.'H'].', 
															jenis   ="'.$jenis.'",
															nominal ='.$nom2;
								if($_POST[$sub.'_mode'.$v.'H']=='edit'){ //edit
									$s4   = 'SELECT * from keu_jurnal WHERE replid='.$_POST[$sub.'_idjurnal'.$v.'H'];
									$e4   = mysql_query($s4);	
									$r4   = mysql_fetch_assoc($e4);
									
									$nom3 = $r4['nominal']-$nom2;
									$opt  = $jenis=='d'?'-':'+';
									$s2   = 'UPDATE '.$s.' WHERE replid='.$_POST[$sub.'_idjurnal'.$v.'H'];
								}else{ // add
									$nom3 = $nom2;
									$opt  = $jenis=='d'?'+':'-';
									$s2   ='INSERT INTO '.$s.'	, transaksi ='.($id==''?$_POST['idformH']:$id);
								}
								$s3    ='UPDATE keu_saldorekening SET nominal2=nominal2 '.$opt.$nom3.' WHERE rekening ='.$_POST[$sub.'_rek'.$v.'H'];
								$e2    = mysql_query($s2);
								$e3    = mysql_query($s3);
								$stat2 =!$e2?false:true;
								$stat3 =!$e3?false:true;
							}
		
							if(!$stat2) {
								$stat = 'gagal_insert_jurnal';
							}elseif(!$stat3){
								$stat = 'gagal_update_saldorekening';
							}else{
								$stat = 'sukses';
							}
						}
					}
				}else{ // in / our
					if($sub=='in_come'){
						// 1. simpan transaksi
						$totNominal = 0;
						$rekArr     = $_POST[$sub.'_idTR'];
						$stat1=$stat2=$stat3=true;
						// var_dump($rekArr);exit();
						foreach ($rekArr as $i => $v) {
							$nom = intval(getuang($_POST[$sub.'_nominal'.$v.'TB']));
							// $jenis = $_POST[$sub.'_jenis'.$v.'TB'];
							$s1 = 'keu_transaksi SET 	tahunbuku     ='.getTahunBuku('replid').',
														rekkas        ='.$_POST['rekkasH'].',
														uraian        ="'.$_POST[$sub.'_uraian'.$v.'TB'].'",
														rekitem       ='.$_POST[$sub.'_rek'.$v.'H'].',
														nominal       ='.$nom.',
														nomer         ="'.getNoTrans2($sub).'",
														tanggal       ="'.tgl_indo6($_POST['tanggalTB']).'",
														detjenistrans ='.getDetJenisTrans('replid','kode',$_POST['detjenistransH']).',
														nobukti       ="'.$_POST['nobuktiTB'].'"';
							$s  = (isset($_POST['idformH']) AND $_POST['idformH']!='')?'UPDATE '.$s1.' WHERE replid='.$_POST['idformH']:'INSERT INTO '.$s1;
							$e  = mysql_query($s);

							$idx = mysql_insert_id();
							$id = ($idx!='' OR !empty($idx))?$idx:$_POST['idformH'];
							// $id = (mysql_insert_id()!='' OR !empty(mysql_insert_id()))?mysql_insert_id():$_POST['idformH'];
								// 2. simpan jurnal umum 
							if(!$e) $stat1= false;
							else {
								// jurnal debit & kredit
								$sjd = ' keu_jurnal SET rek ='.$_POST['rekkasH'].',nominal ='.$nom.',jenis="d"';
								$sjk = ' keu_jurnal SET rek ='.$_POST[$sub.'_rek'.$v.'H'].',nominal ='.$nom.',jenis="k"';

								if($_POST[$sub.'_mode'.$v.'H']=='edit'){ //edit
									// info  jurnal debit
									$ssd = 'SELECT * from keu_jurnal WHERE transaksi='.$id.' AND jenis = "d"';
									$esd = mysql_query($ssd);	
									$rsd = mysql_fetch_assoc($esd);
									// info  jurnal kredit
									$ssk = 'SELECT * from keu_jurnal WHERE transaksi='.$id.' AND jenis = "k"';
									$esk = mysql_query($ssk);	
									$rsk = mysql_fetch_assoc($esk);
									// nominal jurnal 
									$nomd = $rsd['nominal']-$nom; // debit 
									$nomk = $rsk['nominal']-$nom; // kredit
									// saldo rekening
									$ssd2 ='UPDATE keu_saldorekening SET nominal2=nominal2 -'.$nomd.' WHERE rekening ='.$_POST['rekkasH'];
									$ssk2 ='UPDATE keu_saldorekening SET nominal2=nominal2 +'.$nomk.' WHERE rekening ='.$_POST[$sub.'_rek'.$v.'H'];
									$esd2 = mysql_query($ssd2);
									$esk2 = mysql_query($ssk2);
									$stat3 = (!$esd2 AND !$esk2)?false:true;
									// jurnal
									$sjd2 = 'UPDATE '.$sjd.' WHERE transaksi='.$id.' AND jenis="d"';
									$sjk2 = 'UPDATE '.$sjk.' WHERE transaksi='.$id.' AND jenis="k"';
								}else{ // add
									// saldo rekening
									$ssd2 ='UPDATE keu_saldorekening SET nominal2=nominal2 +'.$nom.' WHERE rekening ='.$_POST['rekkasH'];
									$ssk2 ='UPDATE keu_saldorekening SET nominal2=nominal2 -'.$nom.' WHERE rekening ='.$_POST[$sub.'_rek'.$v.'H'];
									$esd2 = mysql_query($ssd2);
									$esk2 = mysql_query($ssk2);
									$stat3 = (!$esd2 AND !$esk2)?false:true;

									$sjd2 = 'INSERT INTO '.$sjd.',transaksi ='.$id; 
									$sjk2 = 'INSERT INTO '.$sjk.',transaksi ='.$id; 
								}
								$ejd2 = mysql_query($sjk2);
								$ejk2 = mysql_query($sjd2);
								$stat2 =(!$ejd2 AND !$ejk2)?false:true;
							}
						}$stat=!$stat1?'gagal_insert_transaksi':(!$stat2?'gagal_jurnal':(!$stat3?'gagal_update_saldoawal':'sukses'));						
					}else{ // out_come
						// 1. simpan transaksi
						$totNominal = 0;
						$rekArr     = $_POST[$sub.'_idTR'];
						$stat1=$stat2=$stat3=true;
						// var_dump($rekArr);exit();
						foreach ($rekArr as $i => $v) {
							$nom = intval(getuang($_POST[$sub.'_nominal'.$v.'TB']));
							// $jenis = $_POST[$sub.'_jenis'.$v.'TB'];
							$s1 = 'keu_transaksi SET 	tahunbuku     ='.getTahunBuku('replid').',
														isPO          ='.$_POST['nobuktiCB'].',
														rekkas        ='.$_POST['rekkasH'].',
														uraian        ="'.$_POST[$sub.'_uraian'.$v.'TB'].'",
														rekitem       ='.$_POST[$sub.'_rek'.$v.'H'].',
														nominal       ='.$nom.',
														nomer         ="'.getNoTrans2($sub).'",
														tanggal       ="'.tgl_indo6($_POST['tanggalTB']).'",
														detjenistrans ='.getDetJenisTrans('replid','kode',$_POST['detjenistransH']).',
														detilanggaran ='.$_POST['out_come_detilanggaran'.$v.'H'].',
														nobukti       ="'.$_POST['nobuktiTB'].'"';
							$s  = (isset($_POST['idformH']) AND $_POST['idformH']!='')?'UPDATE '.$s1.' WHERE replid='.$_POST['idformH']:'INSERT INTO '.$s1;
							$e  = mysql_query($s);

							$idx= mysql_insert_id();
							$id = ($idx!='' OR !empty($idx))?$idx:$_POST['idformH'];
							// $id = (mysql_insert_id()!='' OR !empty(mysql_insert_id()))?mysql_insert_id():$_POST['idformH'];
								// 2. simpan jurnal umum 
							if(!$e) $stat1= false;
							else {
								// jurnal debit & kredit
								$sjd = ' keu_jurnal SET rek ='.$_POST['rekkasH'].',nominal ='.$nom.',jenis="k"';
								$sjk = ' keu_jurnal SET rek ='.$_POST[$sub.'_rek'.$v.'H'].',nominal ='.$nom.',jenis="d"';

								if($_POST[$sub.'_mode'.$v.'H']=='edit'){ //edit
									// info  jurnal debit
									$ssd = 'SELECT * from keu_jurnal WHERE transaksi='.$id.' AND jenis = "d"';
									$esd = mysql_query($ssd);	
									$rsd = mysql_fetch_assoc($esd);
									// info  jurnal kredit
									$ssk = 'SELECT * from keu_jurnal WHERE transaksi='.$id.' AND jenis = "k"';
									$esk = mysql_query($ssk);	
									$rsk = mysql_fetch_assoc($esk);
									// nominal jurnal 
									$nomd = $rsd['nominal']-$nom; // debit 
									$nomk = $rsk['nominal']-$nom; // kredit
									// saldo rekening
									$ssd2 ='UPDATE keu_saldorekening SET nominal2=nominal2 +'.$nomd.' WHERE rekening ='.$_POST['rekkasH'];
									$ssk2 ='UPDATE keu_saldorekening SET nominal2=nominal2 -'.$nomk.' WHERE rekening ='.$_POST[$sub.'_rek'.$v.'H'];
									$esd2 = mysql_query($ssd2);
									$esk2 = mysql_query($ssk2);
									$stat3 = (!$esd2 AND !$esk2)?false:true;
									// jurnal
									$sjd2 = 'UPDATE '.$sjd.' WHERE transaksi='.$id.' AND jenis="d"';
									$sjk2 = 'UPDATE '.$sjk.' WHERE transaksi='.$id.' AND jenis="k"';
								}else{ // add
									// saldo rekening
									$ssd2 ='UPDATE keu_saldorekening SET nominal2=nominal2 -'.$nom.' WHERE rekening ='.$_POST['rekkasH'];
									$ssk2 ='UPDATE keu_saldorekening SET nominal2=nominal2 +'.$nom.' WHERE rekening ='.$_POST[$sub.'_rek'.$v.'H'];
									$esd2 = mysql_query($ssd2);
									$esk2 = mysql_query($ssk2);
									$stat3 = (!$esd2 AND !$esk2)?false:true;

									$sjd2 = 'INSERT INTO '.$sjd.',transaksi ='.$id; 
									$sjk2 = 'INSERT INTO '.$sjk.',transaksi ='.$id; 
								}
								$ejd2 = mysql_query($sjk2);
								$ejk2 = mysql_query($sjd2);
								$stat2 =(!$ejd2 AND !$ejk2)?false:true;
							}
						}$stat=!$stat1?'gagal_insert_transaksi':(!$stat2?'gagal_jurnal':(!$stat3?'gagal_update_saldoawal':'sukses'));						
					}
				}$out = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete ---------------------------------------------------------------------
			case 'hapus':
				// $out='mbuh';
				// get transact's info
				$sb = 'SELECT * FROM '.$tb.' WHERE replid='.$_POST['replid'];
				$eb = mysql_query($sb);
				$rb = mysql_fetch_assoc($eb);

				// delete transact
				$sd = 'DELETE FROM '.$tb.' WHERE replid='.$_POST['replid'];
				$ed = mysql_query($sd);
				if(!$ed) $stat = 'gagal_hapus_transaksi';
				else{
					// get number of record will be resetted
					$sa = 'SELECT * FROM '.$tb;
					$ea = mysql_query($sa);
					$na = mysql_num_rows($ea);
					// reset kode transaksi -> 0 
					if($na==0){
						$st = 'TRUNCATE TABLE keu_transaksi';
						$et = mysql_query($st);
						$stat=!$et?'gagal':'sukses_truncate_transaksi';
					}

					// delete pembayaran (optional)
					if($rb['pembayaran']!=0){
						$sy = 'DELETE * FROM keu_pembayaran WHERE replid='.$rb['pembayaran'];
						$ey = mysql_query($sy);
						if(!$ey){
							$stat='gagal_hapus_pembayaran';
							break;
						}
					}

					// get jurnal's info (debit/kredit)
					$sij = 'SELECT * FROM keu_jurnal WHERE transaksi = '.$_POST['replid'];
					$eij = mysql_query($sij);
					while ($rij=mysql_fetch_assoc($eij)) {
						// reverse saldo rekening by : rek
						$ss ='UPDATE keu_saldorekening SET nominal2=nominal2'.($rij['jenis']=='k'?'+':'-').$rij['nominal'].' WHERE rekening = '.$rij['rek'];
						$es = mysql_query($ss);
						if(!$es) $stat='gagal_update_saldorekeking';
						else{
							// delete jurnal by transaksi
							$sj   = 'DELETE FROM keu_jurnal WHERE transaksi= '.$_POST['replid'];
							$ej   = mysql_query($sj);
							$stat =!$ej?'gagal_hapus_jurnal':'sukses';
						}
					}
				}
				$out = json_encode(array('status'=>$stat,'terhapus'=>$rb['nomer']));
			break;
			// delete ---------------------------------------------------------------------

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				switch ($_POST['subaksi']) {
					case 'out_come';
						$s = 'SELECT 
								t.*,
								j.replid idjurnal 
							  FROM '.$tb.' t 
							  	LEFT JOIN keu_jurnal j on j.transaksi = t.replid
							  WHERE
							  	t.replid ='.$_POST['replid'].' AND
							  	j.jenis ="k"';

						// var_dump($s);exit();
						$e    = mysql_query($s);
						$r    = mysql_fetch_assoc($e);
						$stat = ($e)?'sukses':'gagal';
						if(!$e) $stat='gagal';
						else{ //sukses
							$kuotaNum    =getDetAnggaran($r['detilanggaran'],'kuotaNum'); 
							$kuotaCur    =setuang(getDetAnggaran($r['detilanggaran'],'kuotaNum')); 
							// var_dump($kuotaCur);exit();
								$terpakaiNum =getDetAnggaran($r['detilanggaran'],'terpakaiNum');
								$terpakaiCur =setuang(getDetAnggaran($r['detilanggaran'],'terpakaiNum'));
							$sisaNum     =getDetAnggaran($r['detilanggaran'],'sisaNum');
							$sisaCur     =setuang(getDetAnggaran($r['detilanggaran'],'sisaNum'));
								$stat  ='sukses';

							$nobuktiTyp =strpos($r['nobukti'],'INV')===false?'0':'1';//==TRUE?1:0;
							$transaksiArr = array(
								// transaksi
								'nomer'           =>$r['nomer'],
								'nobuktiTyp'      =>$nobuktiTyp,
								'nobukti'         =>$r['nobukti'],
								'tanggal'         =>tgl_indo7($r['tanggal']),
								'idrekkas'        =>$r['rekkas'],
								'rekkas'          =>getRekening($r['rekkas']),
								// 	'kuotaBilCur'      =>$kuota,
								// 	'kuotaBilCur'      =>$kuota,
								// 	'sisaBilCur'       =>setuang($kuota['sisaNum']),
								// 	'terpakaiBilCur'   =>setuang($kuota['terpakaiNum']),
								// 	'sisaBilNum'       => $kuota['sisaNum'],
								//jurnal
								'outcome' => array(
									'iddetilanggaran' =>$r['detilanggaran'],
									'detilanggaran'   =>(getAnggaran($r['detilanggaran']).'[sisa :'.$sisaCur.' kuota '.$kuotaCur.']'),
									'sisaanggaran'    =>$sisaNum,
									'sisaanggaran'    =>$sisaNum,
									'idjurnal'        =>$r['idjurnal'],
									'idrekitem'       =>$r['rekitem'],
									'rekitem'         =>getRekening($r['rekitem']),
									'nominal'         =>setuang($r['nominal']),
									'uraian'          =>$r['uraian']
								),
							);
						}$out = json_encode(array(
									'status'       =>$stat,
									'transaksiArr' =>$transaksiArr
								));					
					break;

					case 'in_come';
						$s = 'SELECT 
								t.*, 
								j.replid idjurnal 
							  FROM '.$tb.' t 
							  	LEFT JOIN keu_jurnal j on j.transaksi = t.replid
							  WHERE
							  	t.replid ='.$_POST['replid'].' AND
							  	j.jenis ="d"';
						// var_dump($s);exit();
						$e    = mysql_query($s);
						$r    = mysql_fetch_assoc($e);
						$stat = ($e)?'sukses':'gagal';
						if(!$e) $stat='gagal';
						else{ //sukses
							$stat ='sukses';
							$transaksiArr = array(
								// transaksi
								'nomer'    =>$r['nomer'],
								'nobukti'  =>$r['nobukti'],
								'tanggal'  =>tgl_indo7($r['tanggal']),
								'idrekkas' =>$r['rekkas'],
								'rekkas'   =>getRekening($r['rekkas']),
								//jurnal
								'income'   => array(
									'idjurnal'  =>$r['idjurnal'],
									'idrekitem' =>$r['rekitem'],
									'rekitem'   =>getRekening($r['rekitem']),
									'nominal'   =>setuang($r['nominal']),
									'uraian'    =>$r['uraian']
								),
							);
						}$out = json_encode(array(
									'status'       =>$stat,
									'transaksiArr' =>$transaksiArr
								));					
					break;

					case 'ju';
						$s = 'SELECT * FROM '.$tb.'  WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e    = mysql_query($s);
						$r    = mysql_fetch_assoc($e);
						$stat = ($e)?'sukses':'gagal';
						if(!$e) $stat='gagal';
						else{ //sukses
							$s2        ='SELECT * FROM keu_jurnal WHERE transaksi ='.$_POST['replid'].' ORDER BY jenis ASC';
							$e2        =mysql_query($s2);
							$jurnalArr =array();
							while ($r2 =mysql_fetch_assoc($e2)) {
								$jurnalArr[]=array(
									'idjurnal' =>$r2['replid'],
									'idrek'    =>$r2['rek'],
									'rek'      =>getRekBy('nama',$r2['rek']),
									'nominal'  =>setuang($r2['nominal']),
									'jenis'    =>$r2['jenis']
									// 'jenis'    =>getKatRekBy('jenis',getRekBy('kategorirekening',$r2['rek'])),
								);
							}$transaksiArr=array(
								'nomer'     =>$r['nomer'],
								'nobukti'   =>$r['nobukti'],
								'tanggal'   =>tgl_indo7($r['tanggal']),
								'uraian'    =>$r['uraian'],
								'jurnalArr' =>$jurnalArr
							);$stat='sukses';
						}$out = json_encode(array(
									'status'       =>$stat,
									'transaksiArr' =>$transaksiArr
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
						
			// cmbbuku besar -----------------------------------------------------------------
			case 'cmbbukubesar':
				$s  = 'SELECT 
							kr.replid,
							kr.kode kode,
					        kr.nama nama
					    FROM
							keu_transaksi kt 
					        LEFT JOIN keu_jurnal kj ON kt.replid = kj.transaksi 
					        LEFT JOIN keu_detilrekening kr ON kr.replid = kj.rek
						GROUP BY
							kr.kode
					    ORDER BY
					        kr.kategorirekening,
							kr.kode ';				
				// print_r($s);exit();
				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar = $dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error');
				}else{
					if($n==0){ // kosong 
						$ar = array('status'=>'kosong');
					}else{ // ada data
						if(!isset($_POST['replid'])){
							while ($r=mysql_fetch_assoc($e)) {
								$dt[]=$r;
							}
						}else{
							$dt[]=mysql_fetch_assoc($e);
						}$ar = array('status'=>'sukses','bukubesar'=>$dt);
					}
				}
				$out=json_encode($ar);
			break;
			// cmbpelajaran -----------------------------------------------------------------

			}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>