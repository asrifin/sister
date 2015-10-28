<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	$mnu  = 'pembayaran';
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
				$ss='SELECT *
					FROM '.$tb2.' 
					WHERE	kode  LIKE "%'.$searchTerm.'%"
							OR nama LIKE "%'.$searchTerm.'%"';
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
				$biaya       = isset($_POST['biayaS'])?filter($_POST['biayaS']):'';
				$departemen  = isset($_POST['departemenS'])?filter($_POST['departemenS']):'';
				$tahunajaran = isset($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';
				
				$sql = 'SELECT 
							ting.replid,
							ting.tingkat, 
							sum(IFNULL(tb.total,0))total, 
							sum(IFNULL(tb.kurang,0))kurang, 
							sum(IFNULL(tb.lunas,0))lunas 
						from 
							aka_tingkat ting
							JOIN aka_subtingkat sting on sting.tingkat = ting.replid
							JOIN aka_kelas kel on kel.subtingkat = sting.replid
							LEFT JOIN (
								SELECT
									t.replid tingkat,
									(getBiayaAfterDiskonReg (sb.replid, db.nominal)-sb.diskonkhusus)total,(
										SELECT (getBiayaAfterDiskonReg(sb.replid,db.nominal) - sb.diskonkhusus-(IFNULL(SUM(nominal),0))) 
										FROM keu_pembayaran 
										where  siswabiaya = sb.replid
									) kurang,(
										SELECT ifnull(sum(nominal),0)
										FROM keu_pembayaran 
										where  siswabiaya = sb.replid
									) lunas
								FROM
									psb_siswa s
									JOIN psb_siswabiaya sb ON sb.siswa = s.replid
									JOIN psb_detailbiaya db ON db.replid = sb.detailbiaya
									JOIN psb_biaya b ON b.replid = db.biaya
									JOIN aka_subtingkat st ON st.replid = db.subtingkat
									JOIN aka_tingkat t ON t.replid = st.tingkat
									JOIN psb_detailgelombang dg ON dg.replid = db.detailgelombang
									JOIN psb_gelombang g ON g.replid = dg.gelombang
									JOIN aka_tahunajaran ta ON ta.replid = dg.tahunajaran
									JOIN psb_golongan gol ON gol.replid = db.golongan
									JOIN departemen d ON d.replid = dg.departemen
								WHERE
									s. STATUS != "2"
									AND dg.tahunajaran = '.$tahunajaran.'
									AND d.replid = '.$departemen.'
									AND b.replid = '.$biaya.'
								GROUP BY
									s.replid
							)tb on tb.tingkat = ting.replid
						WHERE kel.departemen = '.$departemen.'
						GROUP BY ting.tingkat
						ORDER BY ting.urutan asc'; 
							// pr($sql);
							// and 
							// db.biaya  ='.$biaya;
							// '.$status;
							// pr($sql);
				if(isset($_POST['starting'])){ 
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				#ada data
				$result =mysql_query($sql);
				$jum    = mysql_num_rows($result);
				$out ='';$grandTotal=$lunasTotal=$kurangTotal=0;
				if($jum!=0){	
					$nox=1;
					while($res = mysql_fetch_assoc($result)){
					 	$out.= '<tr>
								 <td>'.$nox.'. '.$res['tingkat'].'</td>
								 <td align="right">'.setuang($res['lunas']).'</td>
								 <td align="right">'.setuang($res['kurang']).'</td>
								 <td align="right">'.setuang($res['total']).'</td>
								</tr>';
						$grandTotal+=$res['total'];
						$lunasTotal+=$res['lunas'];
						$kurangTotal+=$res['kurang'];
						$nox++;
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan="9" ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}$out.='<tr class="bg-blue fg-white">
					<th align="right">Total</th>
					<th align="right">'.setuang($lunasTotal).'</th>
					<th align="right">'.setuang($kurangTotal).'</th>
					<th align="right">'.setuang($grandTotal).'</th>
				</tr>';
			break; 
			// tampil ---------------------------------------------------------------------

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
				$idkw = getField('max(idkwitansi)+1','keu_pembayaran','','');
				$s = 'INSERT INTO '.$tb.' set 	siswabiaya = '.$_POST['idsiswabiayaTB'].',
												nominal    = '.getuang($_POST['akanBayarJenisTB']=='1'?$_POST['akanBayarNominalTB1']:$_POST['akanBayarNominalTB2']).',
												viabayar2  = '.$_POST['viaBayarTB'].',
												tanggal    = "'.tgl_indo6($_POST['tanggalTB']).'",
												idkwitansi = '.$idkw;

				$e  = mysql_query($s);
				$id = mysql_insert_id();
				if(!$e) $stat='gagal_insert_pembayaran';
				else{
					/*// 2. simpan transaksi
					$s2 = 'INSERT INTO keu_transaksi SET 	tahunbuku  ='.getTahunBuku('replid').',
															pembayaran ='.$id.',
															nominal    ='.$nominal.',
															nomer      ="'.getNoTrans($_POST['subaksi']).'",
															tanggal    ="'.date('Y-m-d').'",
															uraian     ="'.$_POST['uraianTB'].'",
															rekkas     ='.$_POST['rekkasH'].',
															detjenistrans='.getDetJenisTrans('replid','kode',$detjenistrans).',
															rekitem    ='.$_POST['rekitemH'];
					$e2  = mysql_query($s2);
					$id2 = mysql_insert_id();
					if(!$e2) $stat='gagal_insert_transaksi';
					else{
						// 3. simpan jurnal
						$s3 = 'INSERT INTO keu_jurnal SET transaksi ='.$id2.', rek ='.$_POST['rekkasH'].', jenis = "d", nominal ='.$nominal;
						$s4 = 'INSERT INTO keu_jurnal SET transaksi ='.$id2.', rek ='.$_POST['rekitemH'].',jenis = "k", nominal ='.$nominal;
						// $s3 = 'INSERT INTO keu_jurnal SET transaksi ='.$id2.', rek ='.$_POST['rekkasH'].', debet ='.$nominal;
						// $s4 = 'INSERT INTO keu_jurnal SET transaksi ='.$id2.', rek ='.$_POST['rekitemH'].', kredit ='.$nominal;
						$e3 = mysql_query($s3);
						$e4 = mysql_query($s4);

						if(!$e3 OR !$e4) $stat = 'gagal_insert_jurnal';
						else{
							// 4. update saldo rekening
							$s5   = 'UPDATE keu_saldorekening SET nominal2 = nominal2 + '.$nominal.' WHERE rekening ='.$_POST['rekkasH'].' AND tahunbuku='.getTahunBuku('replid');
							$s6   = 'UPDATE keu_saldorekening SET nominal2 = nominal2 - '.$nominal.' WHERE rekening ='.$_POST['rekitemH'].' AND tahunbuku='.getTahunBuku('replid');
							// var_dump($s6);exit();
							$e5   = mysql_query($s5);
							$e6   = mysql_query($s6);
							$stat = ($e5 OR $e6)?'sukses':'gagal_update_saldorekening';
						}
					}*/
						$stat='sukses';
				}$out = json_encode(array('status'=>$stat,'idpembayaran'=>$id));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete ---------------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$mnu));
			break;
			// delete ---------------------------------------------------------------------

			case 'cmbakanbayar':
				$out=json_encode(array(
					'status' =>(akanBayarOpt($_POST['subaksi'],$_POST['siswa'])==null?'gagal':'sukses'),
					'datax'  =>akanBayarOpt($_POST['subaksi'],$_POST['siswa'])
				));
			break;

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				$s= 'SELECT sb.replid idsiswabiaya,	
							v.namasiswa,	
							v.nis,
							concat(v.tingkat," ",v.subtingkat,"-",k.kelas)kelas,
							b.biaya,
							db.nominal biayaAwal,
							sb.angsuran,
							sb.isAngsur2,
							sb.viabayar
						FROM 
							psb_siswabiaya sb 
							JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
							JOIN psb_biaya b  on b.replid = db.biaya
							JOIN vw_psb_siswa_kriteria v on sb.siswa = v.idsiswa 
							JOIN aka_siswakelas sk on sk.siswa = v.idsiswa 
							JOIN aka_detailkelas dk on dk.replid = sk.detailkelas
							JOIN aka_kelas k on k.replid = dk.kelas 
						WHERE
							db.biaya  ='.$_POST['biaya'].' and 
							v.idsiswa  ='.$_POST['replid'].' AND 
							v.idsubtingkat = '.$_POST['subtingkat'].'
						GROUP BY
							sb.replid';
				// pr($s); 
				$e    = mysql_query($s);
				$r    = mysql_fetch_assoc($e);
				$stat                 = $e?'sukses':'gagal';
			// awal
				$biayaNett            = getBiayaNett2($_POST['replid'],$_POST['biaya']);
				$angsuranNominal      = getAngsuranNominal($_POST['replid'],$_POST['biaya']);
			// terbayar
				$terbayarAngsurankeReal = getTerbayarAngsuranke($_POST['replid'],$_POST['biaya']);
				$terbayarBaru         = getTerbayarBaru($_POST['replid'],$_POST['biaya']);
				$terbayarTotal        = getTerbayarTotal($_POST['replid'],$_POST['biaya']);
				$terbayarAngsurankeRule = ceil($terbayarTotal/$angsuranNominal);
				// pr($terbayarAngsuranke2);
			// akan bayar
				// $akanBayarke          = $terbayarBaru<$angsuranNominal?$terbayarAngsurankeRule:($terbayarAngsuranke+1);
				$akanBayarke          = ($terbayarTotal%$angsuranNominal==0)?($terbayarAngsurankeRule+1):$terbayarAngsurankeRule;
				$lunasPerAngsuran     =($terbayarTotal%$angsuranNominal==0)?true:false;
				$lunasTotalAngsuran   = $terbayarTotal==$biayaNett?true:false;
				$kuranganAngsuran     = $terbayarAngsurankeRule==$akanBayarke?$angsuranNominal-$terbayarBaru:0;
			//belum bayar
				// $belumBayarNominalTot = $biayaNett-($terbayarTotal+$angsuranNominal);
				$belumBayarAngsuranke = intval($r['angsuran'])-intval($akanBayarke);

				$out  = json_encode(array(
							'status' =>$stat,
							'datax'  =>array(
							// header
								'idsiswabiaya'         =>$r['idsiswabiaya'],
								'namasiswa'            =>$r['namasiswa'],
								'kelas'                =>$r['kelas'],
								'biaya'                =>$r['biaya'],
								'nis'                  =>$r['nis'],
							// harus dibayar
								'biayaAwal'            =>setuang($r['biayaAwal']),
								'biayaNett'            =>setuang($biayaNett),
								'totalDiskon'          =>setuang($r['biayaAwal']-$biayaNett),
							//angsuran
								'kuranganAngsuran'     => $kuranganAngsuran,
								'viabayar'             => $r['viabayar'],
								'isAngsur2'            => $r['isAngsur2'],
								'angsuran'             => $r['angsuran'],
								'angsuranNominal'      => setuang($angsuranNominal),
								'lunasPerAngsuran'=>$lunasPerAngsuran,
								'lunasTotalAngsuran'=>$lunasTotalAngsuran,
							//sudah bayar
								'terbayarAngsurankeReal'   => $terbayarAngsurankeReal,
								'terbayarAngsurankeRule'   => $terbayarAngsurankeRule,
								'terbayarBaru'         => setuang($terbayarBaru),
								'terbayarTotal'        => setuang($terbayarTotal),
							//akan bayar
								'akanBayarke'          => $akanBayarke,
							//belum bayar
								// 'belumBayarNominalTot' => setuang($belumBayarNominalTot),
								'belumBayarAngsuranke' => $belumBayarAngsuranke,
						)));					
			break;
			
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