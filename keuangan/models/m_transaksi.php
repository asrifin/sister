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
						$jenis = ''; 
					// 	$jenis = ' AND k.nama IN ("kas","aktiva") OR r.nama LIKE "%piutang%"';
				}
				// ju
						// $jenis = ' AND k.nama IN ("kas","aktiva") OR r.nama LIKE "%piutang%"';

				// pr($_GET['tanggal']);
				// $th = substr($date,0,4);
				// $bl = substr($date,5,2);
				// $tg = substr($date,8,2);
				// pr($tg);
				$tahunajaran = getField('replid','aka_tahunajaran','tahunajaran',substr($_GET['tanggal'],7,4));
				if(isset($_GET['subaksi']) && $_GET['subaksi']=='rek'){ // rekening
					$ss='SELECT
							r.replid,
							r.kode,
							r.nama,
							s.nominal2 saldoSementara
						FROM
							keu_detilrekening r 
							LEFT JOIN keu_kategorirekening k on k.replid = r.kategorirekening
							LEFT JOIN keu_saldorekening s on s.detilrekening = r.replid
						WHERE
							s.tahunajaran = '.$tahunajaran.' and (
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
					// $thn = 
					$date = tgl_indo6($_GET['tanggal']);
					$ss='SELECT
							ath.replid,
							dr.replid iddetilrekening,
							concat(da.detilanggaran," (",ka.kategorianggaran,")")detilanggaran,
							concat(dr.kode," - ",dr.nama) detilrekening,
							getAnggaranKuota(ath.replid)anggaranKuota,
							getSaldoRekening(dr.replid,ath.tahunajaran)saldoRekening
						FROM
							keu_anggarantahunan ath
							JOIN keu_detilanggaran da on da.replid = ath.detilanggaran 
							JOIN keu_kategorianggaran ka on ka.replid = da.kategorianggaran
							JOIN keu_detilrekening dr on dr.replid = ka.detilrekening
						WHERE
							ka.tingkat = '.$_GET['tingkat'].' and 
							ath.tahunajaran = getTahunAjaran("'.$date.'") and
							ka.departemen = '.$_GET['departemen'].' AND (
								da.detilanggaran LIKE "%'.$searchTerm.'%" OR
								da.keterangan LIKE "%'.$searchTerm.'%" OR
								ka.kategorianggaran LIKE "%'.$searchTerm.'%" OR
								dr.nama LIKE "%'.$searchTerm.'%"
							)
							'.$detilanggaranArr;
							//get tahun ajaran by (tanggal--> semester)
				}
				// pr($ss);
				if(!$sidx) $sidx =1;
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
							'saldoSementara' =>setuang($row['saldoSementara'])
						);
					}elseif($_GET['subaksi']=='detilanggaran'){ // anggaran 
						$arr= array(
							'replid'          =>$row['replid'],
							'detilanggaran'   =>$row['detilanggaran'],
							'detilrekening'   =>$row['detilrekening'],
							'nominalanggaran' =>setuang($row['anggaranKuota']),
							'saldorekening'   =>setuang($row['saldoRekening']),
							'iddetilrekening' =>$row['iddetilrekening'],
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
				$s = '	SELECT
							replid idjenistransaksi,
							jenistransaksi
						FROM
							keu_jenistransaksi';
							// pr($s);
				$e = mysql_query($s);
				$jenisArr=array();
				if(!$e) $stat='gagal_ambil_jenis-trans';
				else{
					while ($r=mysql_fetch_assoc($e)) {
						$s2= '	SELECT
									dj.replid iddetjenistransaksi,
									concat(jt.jenistransaksi," ",kt.kategoritransaksi)detjenistransaksi
								FROM
									keu_detjenistransaksi dj
									JOIN keu_kategoritransaksi kt on kt.replid = dj.kategoritransaksi
									JOIN keu_jenistransaksi jt on jt.replid = dj.jenistransaksi
								WHERE
									dj.jenistransaksi ='.$r['idjenistransaksi'];
				// pr($s2);
						$e2=mysql_query($s2);
						if(!$e2) $stat='gagal_ambil_detil-jenis-trans';
						else{
							$detjenisArr=array();
							while ($r2=mysql_fetch_assoc($e2)) {
								$detjenisArr[]=$r2;
							}$jenisArr[] = array(
								'idjenistransaksi' => $r['idjenistransaksi'],
								'jenistransaksi'   => $r['jenistransaksi'],
								'detjenisArr'      => $detjenisArr
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
									idkwitansi LIKE "%'.$no.'%"
									OR nobukti LIKE "%'.$no.'%"
								)
								AND uraian LIKE "%'.$uraian.'%"
								AND tanggal BETWEEN "'.tgl_indo6($_POST['tgl1TB']).'"
								AND "'.tgl_indo6($_POST['tgl2TB']).'"
								AND type="sar"
							ORDER BY
								replid DESC';
								// pr($sql);
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
								$s2 = ' SELECT replid,detilrekening,nominal,jenisrekening
										FROM keu_jurnal 
										WHERE transaksi ='.$res['replid'].'
										ORDER BY jenisrekening ASC';
										// pr($s2);
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
										$debit  =$r2['jenisrekening']=='d'?setuang($r2['nominal']):'';
										$kredit  =$r2['jenisrekening']=='k'?setuang($r2['nominal']):'';
		   								$tb2.='<tr>
			   										<td>'.getRekening($r2['detilrekening']).'</td>
			   										<td class="text-right">'.$debit.'</td>
			   										<td class="text-right">'.$kredit.'</td>
			   									</tr>';
		   							}$tb2.='</table>';
								}$out.= '<tr>
											<td>'.tgl_indo($res['tanggal']).'</td>
											<td style="font-weight:bold;">'.getNoKwitansi($res['replid']).'<br>'.$res['nobukti'].'</td>
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
					// pr($_POST);
						$jurnalArr = $ju_detjenistrans ='';
						if(isset($_POST['jenisAllCB'])){ //select all
							$s='SELECT replid FROM keu_detjenistransaksi';
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
						}$ju_detjenistrans=' AND detjenistransaksi in('.$jurnalArr.')';
						// var_dump($jurnalArr);exit();
						
						$ju_no     = isset($_POST['ju_noS'])?filter($_POST['ju_noS']):'';
						$ju_uraian = isset($_POST['ju_uraianS'])?filter($_POST['ju_uraianS']):'';
						$sql       = 'SELECT * 
									from '.$tb.' 
									WHERE 
										(idkwitansi like "%'.$ju_no.'%" OR nobukti like "%'.$ju_no.'%" ) AND
										uraian like "%'.$ju_uraian.'%" '.$ju_detjenistrans.' AND 
										tanggal between "'.tgl_indo6($_POST['tgl1TB']).'" AND "'.tgl_indo6($_POST['tgl2TB']).'" 
									ORDER BY	
										replid DESC';
										// pr($sql);
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 10;//jumlah data per halaman
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
								$jDetTrans = getJenisTransaksi($res['detjenistransaksi']);
								$btn ='<td align="center">
											<button data-hint="ubah"  class="button" onclick="loadFR(\''.$jDetTrans.'\','.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
											</button>
										</td>';
								$s2 = ' SELECT *
										FROM keu_jurnal 
										WHERE 
											transaksi ='.$res['replid'].'
										ORDER BY 
											jenisrekening ASC ';
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
										$debit  =$r2['jenisrekening']=='d'?setuang($r2['nominal']):'-';
										$kredit =$r2['jenisrekening']=='k'?setuang($r2['nominal']):'-';
		   								$tb2.='<tr>
			   										<td>'.getRekening($r2['detilrekening']).'</td>
			   										<td class="text-right">'.$debit.'</td>
			   										<td class="text-right">'.$kredit.'</td>
			   									</tr>';
		   							}$tb2.='</table>';
								}$out.= '<tr>
											<td>'.tgl_indo($res['tanggal']).'</td>
											<td style="font-weight:bold;">'.getNoKwitansi($res['replid']).'<br>'.$res['nobukti'].'</td>
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
									// -- CONCAT(dr.kode," - ",dr.nama)detilrekening,
						$s = '	SELECT 
									j.detilrekening replid, 
									dr.kode,
									dr.nama,
									getSaldoRekeningByTgl(j.detilrekening,"2015-11-01","2016-11-01")saldoRekening
								FROM keu_jurnal j 
									JOIN keu_detilrekening dr on dr.replid = j.detilrekening
									JOIN keu_transaksi t on t.replid = j.transaksi
								WHERE 
									t.tanggal BETWEEN "'.tgl_indo6($_POST['tgl1']).'" and "'.tgl_indo6($_POST['tgl2']).'"
								GROUP BY j.detilrekening
								ORDER BY dr.kode asc,dr.nama asc';
								// pr($s);
						$aksi    ='tampil';
						$subaksi ='ns';
						$e       = mysql_query($s);
						$n       = mysql_num_rows($e);
						$out     ='';$totaset=0;
						$debitTot=$kreditTot=0;
						if($n!=0){	
							while($r = mysql_fetch_assoc($e)){	
								$debitTot+=($r['saldoRekening']<0?0:$r['saldoRekening']);
								$kreditTot+=($r['saldoRekening']>0?0:abs($r['saldoRekening']));
								$out.= '<tr>
											<td align="center">'.$r['kode'].'</td>
											<td>'.$r['nama'].'</td>
											<td class="text-right">'.($r['saldoRekening']<0?'':setuang($r['saldoRekening'])).'</td>
											<td class="text-right">'.($r['saldoRekening']>0?'':setuang(abs($r['saldoRekening']))).'</td>
										</tr>';
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan="4" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						$out.= '<tr class="info"><td colspan="2" class="text-right">Jumlah :</td>
							<td class="text-right"><b>'.setuang($debitTot).'</b></td>
							<td class="text-right"><b>'.setuang($kreditTot).'</b></td>
						</tr>';
					break;

					//Buku Besar
					case 'bb':
						$bb_detilrekening = (isset($_POST['bb_detilrekeningS']) AND $_POST['bb_detilrekeningS']!='')?' dr.replid = '.$_POST['bb_detilrekeningS'].' AND ':'';
						$sql  = 'SELECT 
									j.detilrekening replid, 
									CONCAT(dr.kode," - ",dr.nama)detilrekening
								FROM keu_jurnal j 
									JOIN keu_detilrekening dr on dr.replid = j.detilrekening
									JOIN keu_transaksi t on t.replid = j.transaksi
								WHERE 
									'.$bb_detilrekening.'
									t.tanggal BETWEEN "'.tgl_indo6($_POST['tgl1']).'" and "'.tgl_indo6($_POST['tgl2']).'"
								GROUP BY j.detilrekening
								ORDER BY dr.kode asc,dr.nama asc';
									// pr($sql);
						$result = mysql_query($sql);
						$jum    = mysql_num_rows($result);
						$out    ='';$totaset=0;
						if($jum!=0){	
							while($res = mysql_fetch_assoc($result)){
								// $out.='<ul class="fg-gray" style="list-style:none;">';
									// $out.='<span>'.$res['detilrekening'].'</span> <b class="place-right fg-'.($res['saldo']<0?'red':($res['saldo']==0?'blue':'green')).'">Rp.'.number_format($res['saldo']).'</b>';
									$out.='<span>'.$res['detilrekening'].'</span>';
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
																t.idkwitansi,
																t.uraian,
																d.nama namarekening,
																d.kode koderekening,
																j.nominal,
																j.detilrekening,
																t.detjenistransaksi,
																j.jenisrekening
															FROM
																keu_transaksi t
																LEFT JOIN keu_jurnal j ON t.replid = j.transaksi
																LEFT JOIN keu_detilrekening d ON d.replid = j.detilrekening
															WHERE
																d.replid ='.$res['replid'].'
															ORDER BY
																t.tanggal ASC,
																d.kategorirekening ASC,
																d.kode ASC';
															// pr($s2);
													$e2       =mysql_query($s2);
													$debitTot =$kreditTot=0;
													while ($r2=mysql_fetch_assoc($e2)) {
														$debit  = $r2['jenisrekening']=='d'?setuang($r2['nominal']):'';
														$kredit = $r2['jenisrekening']=='k'?setuang($r2['nominal']):'';
														$debitTot+=$debit==''?0:$r2['nominal'];
														$kreditTot+=$kredit==''?0:$r2['nominal'];
														$out.='<tr >
															<td width="10%">'.tgl_indo5($r2['tanggal']).'</td>
															<td  width="20%">'.getNoKwitansi($r2['replid']).'</td>
															<td  width="30%">'.$r2['uraian'].'</td>
															<td  class="text-right" width="20%">'.$debit.'</td>
															<td  class="text-right" width="20%">'.$kredit.'</td>
														</tr>';
													}
													$selisihDebit  = ($debitTot-$kreditTot)>=0?setuang($debitTot-$kreditTot):'';
													$selisihKredit = ($debitTot-$kreditTot)<0?setuang(abs($debitTot-$kreditTot)):'';
													$out.='</tbody>
							                        <tfoot>
							                        	<tr class="info fg-white">
							                        		<th colspan="3" class="text-right">Total</th>
							                        		<th class="text-right">'.($debitTot!=0?setuang($debitTot):'').'</th>
							                        		<th class="text-right">'.($kreditTot!=0?setuang($kreditTot):'').'</th>
							                        	</tr>
							                        	<tr class="info fg-white">
							                        		<th colspan="3" class="text-right">Grand Total</th>
							                        		<th class="text-right">'.$selisihDebit.'</th>
							                        		<th class="text-right">'.$selisihKredit.'</th>
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
						$kode = isset($_POST['nl_kodeS'])?$_POST['nl_kodeS']:'';
						$nama = isset($_POST['nl_namaS'])?filter($_POST['nl_namaS']):'';
									// -- CONCAT(dr.kode," - ",dr.nama)detilrekening,
						$s = '	SELECT 
									j.detilrekening replid, 
									dr.kode,
									dr.nama,
									j.nominal
								FROM keu_jurnal j 
									JOIN keu_detilrekening dr on dr.replid = j.detilrekening
									JOIN keu_transaksi t on t.replid = j.transaksi
								WHERE 
									t.tanggal BETWEEN "'.tgl_indo6($_POST['tgl1']).'" and "'.tgl_indo6($_POST['tgl2']).'"
								GROUP BY j.detilrekening
								ORDER BY dr.kode asc,dr.nama asc';
						$e   = mysql_query($s);
						$n   = mysql_num_rows($e);
						$out ='';$totaset=0;
						if($n!=0){	
							while($r = mysql_fetch_assoc($e)){	
								$out.= '<tr>
											<td align="center">'.$r['kode'].'</td>
											<td>'.$r['nama'].'</td>
											<td class="text-right">'.setuang($r['nominal']).'</td>
											<td class="text-right">'.setuang($r['nominal']).'</td>
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
						$s1=' SELECT
								kr.replid,	
								kr.nama kategorirekening,
								sj.posisi
							FROM
								keu_jenisreport jr
								JOIN keu_subjenisreport sj on sj.jenisreport = jr.replid
								JOIN keu_kategorirekening kr on kr.replid = sj.kategorirekening
							WHERE
								jr.jenisreport = "labarugi" 
							ORDER BY 
								sj.posisi asc';
								// pr($s1);
						$e1 = mysql_query($s1);
						$n1 = mysql_num_rows($e1);
						
						$out.='<table width="100%" class="table">
		                        <thead>
		                            <tr class="fg-white bg-blue">
		                                <th width="50%" class="text-left">Rekening</th>
		                                <th width="25%" class="text-right">Nominal</th>
		                                <th  width="25%" class="text-right">Sub Total</th>
		                            </tr>
		                        </thead>';
                			$out.='<tbody>';
                			$grandTot=0;
            				while ($r1=mysql_fetch_assoc($e1)) {
        						$out.='<tr><td class="fg-white  bg-'.($r1['posisi']=='l'?'lightGreen':'red').'" colspan="3">'.$r1['kategorirekening'].'</td></tr>';
    							$s2='SELECT
										dr.replid,
										CONCAT(dr.kode," - ",dr.nama)detilrekening,
										sum(j.nominal)nominal
									FROM
										keu_jurnal j 
										JOIN keu_transaksi t on t.replid = j.transaksi
										JOIN keu_detilrekening dr on dr.replid = j.detilrekening
									WHERE 
										dr.kategorirekening ='.$r1['replid'].' and
										t.tanggal BETWEEN "'.tgl_indo6($_POST['tgl1']).'" and "'.tgl_indo6($_POST['tgl2']).'"
									GROUP BY dr.replid';
    							// pr($s2);
    							$e2=mysql_query($s2);
    							$subtot=0;
    							while ($r2=mysql_fetch_assoc($e2)) {
    								$out.='<tr>
    									<td>'.$r2['detilrekening'].'</td>
    									<td  align="right">'.setuang($r2['nominal']).'</td>
    								</tr>';
    								$subtot+=$r2['nominal'];
        							$grandTot=$r1['posisi']=='r'?($grandTot-$r2['nominal']):($grandTot+$r2['nominal']);
    							}
								$out.='<tr>
									<td colspan="2"></td>
									<td class="fg-white bg-'.($r1['posisi']=='l'?'green':'red').'" align="right">'.setuang($subtot).'</td>
								</tr>';
        						$out.='</tr>';
            				}
                        	$out.='</tbody>
                        	<tfoot>
                        		<tr class="fg-white bg-blue">
                        			<th colspan="2" align="right" >'.($grandTot<0?' Rugi':'Laba').'</th>
                        			<th class="fg-white bg-'.($grandTot<0?'red':'green').'" align="right">'.setuang($grandTot).'</th>
                        		</tr>
                        	</tfoot>';
						$out.='</table>';                 
					break;

					//laporan neraca 
					case 'ln':
						$out ='';
						$s1=' SELECT
								kr.replid,	
								kr.nama kategorirekening,
								sj.posisi
							FROM
								keu_jenisreport jr
								JOIN keu_subjenisreport sj on sj.jenisreport = jr.replid
								JOIN keu_kategorirekening kr on kr.replid = sj.kategorirekening
							WHERE
								jr.jenisreport = "neraca" 
							ORDER BY 
								sj.posisi asc';
								// pr($s1);
						$e1 = mysql_query($s1);
						$n1 = mysql_num_rows($e1);
						
						$out.='<table width="100%" class="table bordered striped">
		                        <thead>
		                            <tr class="info fg-white">
		                                <th class="bg-green text-center">Kiri</th>
		                                <th class="bg-red text-center">Kanan</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            <tr>';
		                            // kiri -----------------------------------------------------------------------------------------------
		                                $out.='<td class="text-left">
		                                	<table>';
	                                		$sl='SELECT
													sj.replid,
													kr.nama kategorirekening
												FROM
													keu_subjenisreport sj
													JOIN keu_jenisreport jr ON jr.replid = sj.jenisreport
													JOIN keu_kategorirekening kr ON kr.replid = sj.kategorirekening
												WHERE
													jr.jenisreport = "neraca"
													AND posisi = "l"';
											$el=mysql_query($sl);
											$grandtotall=$grandtotalr=0;
											// looping kategorrekening ---------------------------------------------------------------------
											while ($rl=mysql_fetch_assoc($el)) {
												$out.='<tr>';
													$out.='<td class="fg-white bg-green" colspan="3">'.$rl['kategorirekening'].'</td>';
		                                		$out.='</tr>';
	                                			$ssl='	SELECT 
															t.replid,
															t.detilrekening,
															sum(concat(t.operator,t.nominal))nominal
														from (
															SELECT
																dr.replid,
																CONCAT(dr.kode," - ",dr.nama)detilrekening,
																j.nominal nominal,
																t.tanggal,
																j.jenisrekening,
																dr.kategorirekening,
																getOperatorDetRekening(j.detilrekening,j.jenisrekening)operator
															FROM
																keu_jurnal j 
																JOIN keu_transaksi t on t.replid = j.transaksi
																JOIN keu_detilrekening dr on dr.replid = j.detilrekening
															WHERE 
																t.tanggal BETWEEN "'.tgl_indo6($_POST['tgl1']).'"
																AND "'.tgl_indo6($_POST['tgl2']).'"
															ORDER BY 
																j.detilrekening asc,
																j.jenisrekening asc
														)t
														WHERE t.kategorirekening = '.$rl['replid'].'
														GROUP BY t.replid';
												// pr($ssl);
												$eel=mysql_query($ssl);
												$subtotal=0;
												// looping detil rekekning ------------------------------------------------------------------
												while ($rrl=mysql_fetch_assoc($eel)) {
													$out.='<tr>
														<td>'.$rrl['detilrekening'].'</td>
														<td align="right">'.($rrl['nominal']<0?'<span class="fg-red">'.setuang($rrl['nominal']).'</span>':setuang($rrl['nominal'])).'</td>
														<td></td>
													</tr>';
													$subtotal+=$rrl['nominal'];
													// $subtotal=($rrl['nominal']<0?($subtotal-$rrl['nominal']):($subtotal+$rrl['nominal']));
												}$grandtotall+=$subtotal;
												// subtotal
												$out.='<tr>
													<td align="right" colspan="2">Subtotal</td>
													<td align="right" class="fg-white bg-green">'.setuang($subtotal).'</td>
												</tr><tr>
													<td colspan="3">&nbsp;</td>
												</tr>';
											}
											$out.='
												<tr>
													<td align="right" colspan="2">Grand Total</td>
													<td class="bg-green fg-white" align="right">'.setuang($grandtotall).'</td>
												</tr>
											</table>
		                                </td>';

		                                // kanan  ----------------------------------------------------
		                                $out.='<td width="50%" class="text-left">
		                                	<table>';
	                                		$sl='SELECT
													sj.replid,
													kr.nama kategorirekening
												FROM
													keu_subjenisreport sj
													JOIN keu_jenisreport jr ON jr.replid = sj.jenisreport
													JOIN keu_kategorirekening kr ON kr.replid = sj.kategorirekening
												WHERE
													jr.jenisreport = "neraca"
													AND posisi = "r"';
											$el=mysql_query($sl);
											$grandtotall=$grandtotalr=0;
											// looping kategorrekening ---------------------------------------------------------------------
											while ($rl=mysql_fetch_assoc($el)) {
												$out.='<tr>';
													$out.='<td class="fg-white bg-red" colspan="3">'.$rl['kategorirekening'].'</td>';
		                                		$out.='</tr>';
	                                			$ssl='	SELECT
															dr.replid,
															CONCAT(dr.kode, " - ", dr.nama) detilrekening,
															sum(j.nominal) nominal
														FROM
															keu_jurnal j
															JOIN keu_transaksi t ON t.replid = j.transaksi
															JOIN keu_detilrekening dr ON dr.replid = j.detilrekening
														WHERE
															dr.kategorirekening = '.$rl['replid'].'
															AND t.tanggal BETWEEN "'.tgl_indo6($_POST['tgl1']).'"
															AND "'.tgl_indo6($_POST['tgl2']).'"
														GROUP BY
															dr.replid';
												$eel=mysql_query($ssl);
												$subtotal=0;
												// looping detil rekekning ------------------------------------------------------------------
												while ($rrl=mysql_fetch_assoc($eel)) {
													$out.='<tr>
														<td>'.$rrl['detilrekening'].'</td>
														<td align="right">'.setuang($rrl['nominal']).'</td>
														<td></td>
													</tr>';
													$subtotal+=$rrl['nominal'];
												}$grandtotalr+=$subtotal;
												
													// <td align="right">'.getLabaRugi().'</td>
												// subtotal
												$out.='<tr>
													<td align="right" colspan="2">Subtotal</td>
													<td align="right" class="fg-white bg-red">'.setuang($subtotal).'</td>
												</tr><tr>
													<td colspan="3">&nbsp;</td>
												</tr>';
											}
											// laba tahun berjalan 
											$out.='<tr>
												<td>Laba Tahun berjalan </td>
												<td align="right">Rp. 500.000</td>
											</tr>';
											$out.='
												<tr>
													<td align="right" colspan="2">Grand Total</td>
													<td class="bg-red fg-white" align="right">'.setuang($grandtotalr).'</td>
												</tr>
											</table>
		                                </td>
		                            </tr>
		                        </tbody>';
                			$out.='<tbody>';
                			$grandTot=0;
						$out.='</table>';                 
					break;

					// posisi kas bank
					case 'pkb':
						$pkb_detilrekening = (isset($_POST['pkb_detilrekeningS']) AND $_POST['pkb_detilrekeningS']!='')?' dr.replid = '.$_POST['pkb_detilrekeningS'].' AND ':'';
						$s  = 'SELECT 
									j.detilrekening replid, 
									CONCAT(dr.kode," - ",dr.nama)detilrekening,
									sr.nominal
								FROM keu_jurnal j 
									JOIN keu_detilrekening dr on dr.replid = j.detilrekening
									JOIN keu_saldorekening sr on dr.replid = sr.detilrekening
									JOIN keu_kategorirekening kr  on kr.replid = dr.kategorirekening
									JOIN keu_transaksi t on t.replid = j.transaksi
								WHERE 
									(kr.nama LIKE "%KAS%" OR kr.nama LIKE "%BANK%" )  and 
									t.tanggal BETWEEN "'.tgl_indo6($_POST['tgl1']).'" and "'.tgl_indo6($_POST['tgl2']).'"
								GROUP BY j.detilrekening
								ORDER BY dr.kode asc,dr.nama asc';
									// '.$pkb_detilrekening.'
									// pr($sql);
						$e   = mysql_query($s);
						$jum = mysql_num_rows($e);
						$out ='';$totaset=0;
						if($jum!=0){	
							while($r = mysql_fetch_assoc($e)){
									$out.='	<span>'.$r['detilrekening'].'</span> 
											<b class="place-right fg-'.($r['nominal']<0?'red':($r['nominal']==0?'blue':'green')).'">
												Saldo Awal : '.setuang($r['nominal']).'
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
															j.nominal,
															t.tanggal,
															t.uraian,
															t.replid idTransaksi
														FROM
															keu_jurnal j
															JOIN keu_transaksi t ON t.replid = j.transaksi
														WHERE
															j.detilrekening = '.$r['replid'].'
															AND j.jenisrekening ="d" 
															AND t.tanggal BETWEEN "'.tgl_indo6($_POST['tgl1']).'"
															AND "'.tgl_indo6($_POST['tgl2']).'"
														ORDER BY
															t.tanggal ASC';
															// pr($s2);
													$e2       =mysql_query($s2);
													$masukTot =0;
													if(mysql_num_rows($e2)<=0){
														$out.='<tr>
															<td colspan="4" class="fg-red text-center">data kosong</td>
														</tr>';
													}else{
														while ($r2=mysql_fetch_assoc($e2)) {
															$masukTot+=$r2['nominal'];
															$out.='<tr >
																<td width="10%">'.tgl_indo5($r2['tanggal']).'</td>
																<td  width="20%">'.getNoKwitansi($r2['idTransaksi']).'</td>
																<td  width="30%">'.$r2['uraian'].'</td>
																<td style="font-weight:bold;" class="text-right fg-green" width="20%">'.setuang($r2['nominal']).'</td>
															</tr>';
														}
													}$out.='</tbody>
							                        <tfoot>
							                        	<tr class="info fg-white">
							                        		<th colspan="3" class="text-right">Jumlah : </th>
							                        		<th class="text-right">'.setuang($masukTot).'</th>
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
															j.nominal,
															t.tanggal,
															t.uraian,
															t.replid idTransaksi
														FROM
															keu_jurnal j
															JOIN keu_transaksi t ON t.replid = j.transaksi
														WHERE
															j.detilrekening = '.$r['replid'].'
															AND j.jenisrekening ="k" 
															AND t.tanggal BETWEEN "'.tgl_indo6($_POST['tgl1']).'"
															AND "'.tgl_indo6($_POST['tgl2']).'"
														ORDER BY
															t.tanggal ASC';
													$e3 =mysql_query($s3);
													$keluarTot =0;

													if(mysql_num_rows($e3)<=0){
														$out.='<tr>
															<td colspan="4" class="fg-red text-center">data kosong</td>
														</tr>';
													}else{
														while ($r3=mysql_fetch_assoc($e3)) {
															$keluarTot+=$r3['nominal'];
															$out.='<tr >
																<td width="10%">'.tgl_indo5($r3['tanggal']).'</td>
																<td  width="20%">'.getNoKwitansi($r3['idTransaksi']).'</td>
																<td  width="30%">'.$r3['uraian'].'</td>
																<td style="font-weight:bold;" class="text-right fg-red" width="20%">'.setuang($r3['nominal']).'</td>
															</tr>';
														}
													}$out.='</tbody>
							                        <tfoot>
							                        	<tr class="info fg-white">
							                        		<th colspan="3" class="text-right">Jumlah : </th>
							                        		<th class="text-right">'.setuang($keluarTot).'</th>
							                        	</tr>
						                        	</tfoot>
							                    </table>';
					                    $saldoAkhir = $r['nominal']+$masukTot-$keluarTot;
				                    	$out.='<b class="fg-'.($saldoAkhir<0?'red':'green').' place-right"> Saldo Akhir : '.setuang($saldoAkhir).'</b><br><br>';
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

					$s1 = 'keu_transaksi SET	tanggal           ="'.tgl_indo6($_POST['tanggalTB']).'",
												detjenistransaksi ='.$_POST['detjenistransaksiTB'].',
												nobukti           ="'.$_POST['nobuktiTB'].'",
												uraian            ="'.$_POST['uraianTB'].'",
												idkwitansi        ='.getIdKwitansi();
					$s  = (isset($_POST['idformH']) AND $_POST['idformH']!='')?'UPDATE '.$s1.' WHERE replid='.$_POST['idformH']:'INSERT INTO '.$s1;
					// pr($s);
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
								$s     = ' keu_jurnal SET 	
												detilrekening ='.$_POST[$sub.'_rek'.$v.'H'].', 
												jenisrekening ="'.$jenis.'",
												nominal       ='.$nom2;
								if($_POST[$sub.'_mode'.$v.'H']=='edit'){ //edit
									$s2 = 'UPDATE '.$s.' WHERE replid='.$_POST[$sub.'_idjurnal'.$v.'H'];
								}else{ // add
									$s2   ='INSERT INTO '.$s.'	, transaksi ='.($id==''?$_POST['idformH']:$id);
								}
								// pr($s2);
								$e2    = mysql_query($s2);
								$stat2 =!$e2?false:true;
							}
		
							if(!$stat2) {
								$stat = 'gagal_insert_jurnal';
							}else{
								$stat = 'sukses';
							}
						}
					}
				}else{ // in / our
					if($sub=='in'){
						// 1. simpan transaksi
						$totNominal = 0;
						$rekArr     = $_POST[$sub.'_idTR'];
						$stat1=$stat2=$stat3=true;
						$xx='';
						// pr($_POST['idformH']);
						if(isset($_POST['idformH']) && $_POST['idformH']!=''){ // edit
							$s  = 'UPDATE keu_transaksi SET 	
										uraian  ="'.$_POST[$sub.'_uraian1TB'].'",
										tanggal ="'.tgl_indo6($_POST['tanggalTB']).'",
										nobukti ="'.$_POST['nobuktiTB'].'"
									WHERE replid='.$_POST['idformH'];
							$e   = mysql_query($s);
							// update jurnal
							$stat1=!$e?false:true;
							$sjd = 'UPDATE  keu_jurnal SET 
									detilrekening ='.$_POST['rekkasH'].',
									nominal       ='.getuang($_POST[$sub.'_nominal1TB']).'
									WHERE 
										jenisrekening ="d" and 
										transaksi     ='.$_POST['idformH'];
							$ejd= mysql_query($sjd);
							$sjk = 'UPDATE  keu_jurnal SET 
									detilrekening ='.$_POST[$sub.'_rek1H'].',
									nominal       ='.getuang($_POST[$sub.'_nominal1TB']).'
									WHERE 
										jenisrekening ="k" and 
										transaksi     ='.$_POST['idformH'];
							$ejk = mysql_query($sjk);
							$stat2=!$ejk || !$ejd?false:true;
						}else{ // add
							foreach ($rekArr as $i => $v) {
								$nom = intval(getuang($_POST[$sub.'_nominal'.$v.'TB']));
								$s   = 'INSERT INTO keu_transaksi SET 	
											idkwitansi        ='.getIdKwitansi().',
											uraian            ="'.$_POST[$sub.'_uraian'.$v.'TB'].'",
											tanggal           ="'.tgl_indo6($_POST['tanggalTB']).'",
											detjenistransaksi ='.$_POST['detjenistransaksiTB'].',
											nobukti           ="'.$_POST['nobuktiTB'].'"';
								// pr($s);
								$e   = mysql_query($s);
								$idTransaksi = mysql_insert_id();
								// 2. simpan jurnal umum 
								if(!$e) $stat1= false;
								else {
									// jurnal debit & kredit
									$nom = getuang($_POST[$sub.'_nominal'.$v.'TB']);
									$sjd = ' INSERT INTO keu_jurnal SET 
												detilrekening ='.$_POST['rekkasH'].',
												nominal       ='.$nom.',
												jenisrekening ="d",
												transaksi     ='.$idTransaksi; 
									$sjk = 'INSERT INTO keu_jurnal SET 
												detilrekening ='.$_POST[$sub.'_rek'.$v.'H'].',
												nominal       ='.$nom.',
												jenisrekening ="k",
												transaksi     ='.$idTransaksi; 
									$ejd = mysql_query($sjk);
									$ejk = mysql_query($sjd);
									$stat2 =(!$ejd AND !$ejk)?false:true;
								}
							}
						}
						$stat=!$stat1?'gagal_insert_transaksi':(!$stat2?'gagal_jurnal':(!$stat3?'gagal_update_saldoawal':'sukses'));						
					}else{ // out_come
						// 1. simpan transaksi
						$totNominal = 0;
						$rekArr     = $_POST[$sub.'_idTR'];
						$stat1=$stat2=$stat3=true;
						$xx='';
						// pr($_POST['idformH']);
						if(isset($_POST['idformH']) && $_POST['idformH']!=''){ // edit
							$s  = 'UPDATE keu_transaksi SET 	
										uraian  ="'.$_POST[$sub.'_uraian1TB'].'",
										tanggal ="'.tgl_indo6($_POST['tanggalTB']).'",
										nobukti ="'.$_POST['nobuktiTB'].'"
									WHERE replid='.$_POST['idformH'];
							$e   = mysql_query($s);
							// update jurnal
							$stat1=!$e?false:true;
							$sjd = 'UPDATE  keu_jurnal SET 
									detilrekening ='.$_POST['rekkasH'].',
									nominal       ='.getuang($_POST[$sub.'_nominal1TB']).'
									WHERE 
										jenisrekening ="d" and 
										transaksi     ='.$_POST['idformH'];
							$ejd= mysql_query($sjd);
							$sjk = 'UPDATE  keu_jurnal SET 
									detilrekening ='.$_POST[$sub.'_rek1H'].',
									nominal       ='.getuang($_POST[$sub.'_nominal1TB']).'
									WHERE 
										jenisrekening ="k" and 
										transaksi     ='.$_POST['idformH'];
							$ejk = mysql_query($sjk);
							$stat2=!$ejk || !$ejd?false:true;
						}else{ // add
							foreach ($rekArr as $i => $v) {
								$nom = intval(getuang($_POST[$sub.'_nominal'.$v.'TB']));
								$s   = 'INSERT INTO keu_transaksi SET 	
											idkwitansi        ='.getIdKwitansi().',
											uraian            ="'.$_POST[$sub.'_uraian'.$v.'TB'].'",
											tanggal           ="'.tgl_indo6($_POST['tanggalTB']).'",
											detjenistransaksi ='.$_POST['detjenistransaksiTB'].',
											anggarantahunan   ='.$_POST[$sub.'_detilanggaran'.$v.'H'].',
											nobukti           ="'.$_POST['nobuktiTB'].'"';
								// pr($s);
								$e   = mysql_query($s);
								$idTransaksi = mysql_insert_id();
								// 2. simpan jurnal umum 
								if(!$e) $stat1= false;
								else {
									// jurnal debit & kredit
									$nom = getuang($_POST[$sub.'_nominal'.$v.'TB']);
									$sjd = ' INSERT INTO keu_jurnal SET 
												detilrekening ='.$_POST['rekkasH'].',
												nominal       ='.$nom.',
												jenisrekening ="k",
												transaksi     ='.$idTransaksi; 
									$sjk = 'INSERT INTO keu_jurnal SET 
												detilrekening ='.$_POST[$sub.'_rek'.$v.'H'].',
												nominal       ='.$nom.',
												jenisrekening ="d",
												transaksi     ='.$idTransaksi; 
									$ejd = mysql_query($sjk);
									$ejk = mysql_query($sjd);
									$stat2 =(!$ejd AND !$ejk)?false:true;
								}
							}
						}
						$stat=!$stat1?'gagal_insert_transaksi':(!$stat2?'gagal_jurnal':(!$stat3?'gagal_update_saldoawal':'sukses'));						
					}
				}$out = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete ---------------------------------------------------------------------
			case 'hapus':
				// delete transact
				$detjenistransaksi = getField('detjenistransaksi','keu_transaksi','replid',$_POST['replid']);
				$idref=getField('idref','keu_transaksi','replid',$_POST['replid']);
				$sd = 'DELETE FROM '.$tb.' WHERE replid='.$_POST['replid'];
				$ed = mysql_query($sd);
				if(!$ed) $stat = 'gagal_hapus_transaksi';
				else{
					// checking detail jenis transaksi (penerimaan siswa --> delete keu_peneirmaansiswa)
					$sr = 'SELECT 
								kt.kategoritransaksi,
								jt.kode
							FROM keu_detjenistransaksi dj
								JOIN keu_jenistransaksi jt on jt.replid = dj.jenistransaksi
								JOIN keu_kategoritransaksi kt on kt.replid = dj.kategoritransaksi
							WHERE dj.replid ='.$detjenistransaksi;
					// pr($sr);
					$er=mysql_query($sr);
					$rr=mysql_fetch_assoc($er);
					// delete tb penerimaan siswa 
					
					if($rr['kategoritransaksi']=='siswa' && $rr['kode']=='in'){
						$del=delRecord('keu_penerimaansiswa',array('replid'=>$idref));
						$stat=!$del?'gagal_hapus_penerimaan_siswa':'sukses';
					}else{
						$stat='sukses';
					}
				}$out = json_encode(array('status'=>$stat));
			break;
			// delete ---------------------------------------------------------------------

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				switch ($_POST['subaksi']) {
					// case 'out_come';
					case 'out';
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
								$terpakaiNum =getDetAnggaran($r['detilanggaran'],'terpakaiNum');
								$terpakaiCur =setuang(getDetAnggaran($r['detilanggaran'],'terpakaiNum'));
							$sisaNum     =getDetAnggaran($r['detilanggaran'],'sisaNum');
							$sisaCur     =setuang(getDetAnggaran($r['detilanggaran'],'sisaNum'));
								$stat  ='sukses';

							$nobuktiTyp =strpos($r['nobukti'],'INV')===false?'0':'1';//==TRUE?1:0;
							$transaksiArr = array(
								// transaksi
								'nomer'      =>$r['nomer'],
								'nobuktiTyp' =>$nobuktiTyp,
								'nobukti'    =>$r['nobukti'],
								'tanggal'    =>tgl_indo7($r['tanggal']),
								'idrekkas'   =>$r['rekkas'],
								'rekkas'     =>getRekening($r['rekkas']),
								// 	'kuotaBilCur'      =>$kuota,
								// 	'kuotaBilCur'      =>$kuota,
								// 	'sisaBilCur'       =>setuang($kuota['sisaNum']),
								// 	'terpakaiBilCur'   =>setuang($kuota['terpakaiNum']),
								// 	'sisaBilNum'       => $kuota['sisaNum'],
								//jurnal
								'outcome' => array(
									'departemen' =>$r['departemen'],
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

					// case 'in_come';
					case 'in';
						$s = 'SELECT
									t.replid,
									t.tanggal,
									t.idkwitansi,
									t.detjenistransaksi,
									t.nobukti,(
										SELECT detilrekening 
										FROM keu_jurnal 
										WHERE transaksi = t.replid and jenisrekening = "d"
									)idrekkas,(
										SELECT detilrekening 
										FROM keu_jurnal 
										WHERE transaksi = t.replid and jenisrekening = "k"
									)idrekitem,
									t.uraian,(
										SELECT nominal FROM keu_jurnal WHERE transaksi = t.replid and jenisrekening = "k"
									)nominal,(
										SELECT replid from keu_jurnal WHERE transaksi = t.replid and jenisrekening="k"
									)idjurnal
								FROM keu_transaksi t
								WHERE t.replid ='.$_POST['replid'];
							  	// pr($s);
						$e    = mysql_query($s);
						$r    = mysql_fetch_assoc($e);
						$stat = ($e)?'sukses':'gagal';
						if(!$e) $stat='gagal';
						else{ //sukses
							$stat ='sukses';
							$kodekas = getField('kode','keu_detilrekening','replid',$r['idrekkas']);
							$namakas = getField('nama','keu_detilrekening','replid',$r['idrekkas']);
							$transaksiArr = array(
								// header (transaksi)
								'nomer'             =>getNoKwitansi($_POST['replid']),
								'nobukti'           =>$r['nobukti'],
								'tanggal'           =>tgl_indo7($r['tanggal']),
								'idrekkas'          =>$r['idrekkas'],
								'rekkas'            =>$kodekas.' - '.$namakas,
								'saldokas'          =>setuang(getSaldoRek($r['idrekkas'],getField('replid','aka_tahunajaran','tahunajaran',substr($r['tanggal'],0,4)))),
								'detjenistransaksi' =>$r['detjenistransaksi'],
								// detail (jurnal)
								'income'   => array(
									'idjurnal'  =>$r['idjurnal'],
									'idrekitem' =>$r['idrekitem'],
									'rekitem'   =>getRekening($r['idrekitem']),
									'rekitemsaldo'  =>setuang(getSaldoRek($r['idrekitem'],getField('replid','aka_tahunajaran','tahunajaran',substr($r['tanggal'],0,4)))),
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
							$s2 ='	SELECT 
										j.replid,
										j.jenisrekening,
										j.detilrekening,
										concat(dr.nama," - ",dr.nama)detilrekening,
										j.nominal,
										sr.nominal saldorekening
									FROM keu_jurnal j
										JOIN keu_detilrekening dr on dr.replid = j.detilrekening
										JOIN keu_saldorekening sr on sr.detilrekening = dr.replid
									WHERE j.transaksi ='.$_POST['replid'].' 
									GROUP BY dr.replid 
									ORDER BY j.jenisrekening ASC';
									// pr($s2);
							$e2        =mysql_query($s2);
							$jurnalArr =array();
							while ($r2 =mysql_fetch_assoc($e2)) {
								$jurnalArr[]=array(
									'idjurnal'        =>$r2['replid'],
									'jenisrekening'   =>$r2['jenisrekening'],
									'iddetilrekening' =>$r2['detilrekening'],
									'detilrekening'   =>$r2['detilrekening'],
									'nominal'         =>setuang($r2['nominal']),
									'saldorekening'   =>setuang($r2['saldorekening']),
								);
							}
							$transaksiArr=array(
								'idkwitansi'        =>$r['idkwitansi'],
								'detjenistransaksi' =>$r['detjenistransaksi'],
								'nobukti'           =>$r['nobukti'],
								'tanggal'           =>tgl_indo7($r['tanggal']),
								'uraian'            =>$r['uraian'],
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
				$s  = '	SELECT 
							j.detilrekening replid, 
							CONCAT(dr.kode," - ",dr.nama)detilrekening
						FROM keu_jurnal j 
							JOIN keu_detilrekening dr on dr.replid = j.detilrekening
							JOIN keu_transaksi t on t.replid = j.transaksi
						WHERE t.tanggal BETWEEN "'.tgl_indo6($_POST['tgl1']).'" and "'.tgl_indo6($_POST['tgl2']).'"
						GROUP BY j.detilrekening
						ORDER BY dr.kode asc,dr.nama asc';				
							// pr($s);
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
?>