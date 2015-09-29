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
			// history bayar
			case 'histBayar':
				$s ='SELECT
						p.replid,
						p.cicilan,
						t.tanggal
					FROM
						keu_pembayaran p 
						LEFT JOIN keu_transaksi t on t.pembayaran = p.replid
						LEFT JOIN keu_modulpembayaran m on m.replid = p.modul
						LEFT JOIN keu_katmodulpembayaran k on k.replid = m.katmodulpembayaran
					WHERE
						k.nama = "'.$_POST['subaksi'].'" AND 
						p.siswa = '.$_POST['siswa'];
			// var_dump($s);exit();
				$e   = mysql_query($s);
				$arr = array();
				while ($r=mysql_fetch_assoc($e)){
					$arr[]=array(
						'replid'  =>$r['replid'],
						'cicilan' =>'Rp. '.number_format($r['cicilan']),
						'tanggal' =>tgl_indo5($r['tanggal'])
					);
				}$out = json_encode(array('status'=>$e?'sukses':'gagal','datax'=>$arr));
			break;

			// tampil ---------------------------------------------------------------------
			case 'tampil':
				$biaya         = isset($_POST['biayaS'])?filter($_POST['biayaS']):'';
				$subtingkat    = isset($_POST['subtingkatS'])?filter($_POST['subtingkatS']):'';
				$tingkat       = isset($_POST['tingkatS'])?filter($_POST['tingkatS']):'';
				$nis           = isset($_POST['nisS'])?filter($_POST['nisS']):'';
				$nisn          = isset($_POST['nisnS'])?filter($_POST['nisnS']):'';
				$namasiswa     = isset($_POST['namasiswaS'])?filter($_POST['namasiswaS']):'';
				$nopendaftaran = isset($_POST['nopendaftaranS'])?filter($_POST['nopendaftaranS']):'';
				$status        = (isset($_POST['statusS']) AND $_POST['statusS']!='') ?' AND t2.statbayar="'.filter($_POST[$pre.'_statusS']).'"':'';
				$sql = 'SELECT 	
							v.idsiswa,
							v.namasiswa,	
							v.nis,
							v.nopendaftaran,
							v.nisn,
							db.biaya
						FROM 
							psb_siswabiaya sb 
							JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
							JOIN vw_psb_siswa_kriteria v on sb.siswa = v.idsiswa 
						WHERE
							v.status!="2" AND 
							v.idtingkat ='.$tingkat.' AND 
							v.idsubtingkat ='.$subtingkat.' AND 
							v.namasiswa LIKE "%'.$namasiswa.'%" AND 
							v.nis LIKE "%'.$nis.'%" AND 
							v.nisn LIKE "%'.$nisn.'%" AND 
							v.nopendaftaran LIKE "%'.$nopendaftaran.'%" and 
							db.biaya  ='.$biaya;
							// pr($sql);
							// '.$status;
				if(isset($_POST['starting'])){ 
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = 10;
				$aksi    ='tampil';
				$subaksi = '';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result  = $obj->result;

				#ada data
				$jum = mysql_num_rows($result);
				$out ='';$totaset=0;
				if($jum!=0){	
					$nox = $starting+1;
					while($res = mysql_fetch_assoc($result)){
						
						/*$biaya    = getBiaya($pre,$res['replid']);
						$terbayar = getTerbayar('joining fee',$res['replid']);
						$status   = getStatusBayar('joining fee',$res['replid']);
						if($status=='belum'){ // belum
							$clr  = 'red';
							$icon = 'empty';
							$hint = 'belum bayar';
							$func = 'onclick="pembayaranFR(\'joiningf\','.$res['replid'].');"';
						}else{
						 	if($status=='lunas'){ // lunas
								$clr  = 'green';
								$icon = 'full';
								$hint = 'lunas';
								$func = 'onclick="pembayaranFR(\'joiningf\','.$res['replid'].');"';
							}else{ // kurang
								$clr  = 'yellow';
								$icon = 'half';
								$hint = 'kurang';
								$func = 'onclick="pembayaranFR(\'joiningf\','.$res['replid'].');"';
							}
						}*/
									// <button data-hint="'.$hint.'" class="fg-white bg-'.$clr.'"   '.$func.'>
						$btn ='<td align="center">
									<button onclick="viewFR('.$res['idsiswa'].')"; class="fg-white bg-blue">
										<i class="icon-battery-full"></i>
									</button>
							   </td>';
					 	$out.= '<tr>
									<td>'.getNoPendaftaran2($res['idsiswa']).'</td>
									<td>'.$res['nisn'].'</td>
									<td>'.$res['nis'].'</td>
									<td>'.$res['namasiswa'].'</td>
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
				// 1. simpan pembayaran
				if($_POST['subaksi']=='dpp'){ // dpp 
					$nominal       = $_POST['akanbayarTB'] * getAngsurNom($_POST['subaksi'],$_POST['idsiswaH']);
					$detjenistrans = 'in_siswa';
				}elseif($_POST['subaksi']=='joiningf'){ //joining fee
					$nominal       = getuang($_POST['akanbayar2TB']);
					$detjenistrans = 'in_calonsiswa';
				}else{ // spp , formulir
					$nominal = getBiaya($_POST['subaksi'],$_POST['idsiswaH']); // pendaftaran & spp
					if($_POST['subaksi']=='spp'){ // spp
						$detjenistrans = 'in_siswa';
					}else{  // formulir
						$detjenistrans = 'in_calonsiswa';
					}
				}$s = 'INSERT INTO '.$tb.' set 	modul   = '.$_POST['idmodulH'].',
												cicilan = '.$nominal.',
												siswa   = '.$_POST['idsiswaH'];
				$e  = mysql_query($s);
				$id = mysql_insert_id();
				if(!$e) $stat='gagal_insert_pembayaran';
				else{
					// 2. simpan transaksi
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
					}
				}$out = json_encode(array('status'=>$stat));
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

			case 'cmbakanbayar':
				$out=json_encode(array(
					'status' =>(akanBayarOpt($_POST['subaksi'],$_POST['siswa'])==null?'gagal':'sukses'),
					'datax'  =>akanBayarOpt($_POST['subaksi'],$_POST['siswa'])
				));
			break;

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				$s= 'SELECT 	
							v.namasiswa,	
							v.nis,
							concat(v.tingkat," ",v.subtingkat,"-",k.kelas)kelas,
							b.biaya,
							db.nominal biayaAwal,
							sb.angsuran
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
							v.idsubtingkat = '.$_POST['subtingkat'];
				// pr($s); 
				$e    = mysql_query($s);
				$r    = mysql_fetch_assoc($e);
				$stat                 = $e?'sukses':'gagal';
				$biayaNett            = getBiayaNett2($_POST['replid'],$_POST['biaya']);
				$angsuranNominal      = getAngsuranNominal($_POST['replid'],$_POST['biaya']);
				$terbayarAngsuranke   = getTerbayarAngsuranke($_POST['replid'],$_POST['biaya']);
				$terbayarBaru         = getTerbayarBaru($_POST['replid'],$_POST['biaya']);
				$akanBayarke          = $terbayarBaru<$angsuranNominal?$terbayarAngsuranke:($terbayarAngsuranke+1);
				$terbayarTotal        = getTerbayarTotal($_POST['replid'],$_POST['biaya']);
				$belumBayarNominalTot = $biayaNett-($terbayarTotal+$angsuranNominal);
				$belumBayarAngsuranke   = intval($r['angsuran'])-intval($akanBayarke);
				$out  = json_encode(array(
							'status' =>$stat,
							'datax'  =>array(
								// header
								'namasiswa'            =>$r['namasiswa'],
								'kelas'                =>$r['kelas'],
								'biaya'                =>$r['biaya'],
								'nis'                  =>$r['nis'],
								// detail pembayaran 
								// harus dibayar
								'biayaAwal'            =>setuang($r['biayaAwal']),
								'biayaNett'            =>setuang($biayaNett),
								'totalDiskon'          =>setuang($r['biayaAwal']-$biayaNett),
								//angsuran
								'angsuran'             => $r['angsuran'],
								'angsuranNominal'      => setuang($angsuranNominal),
								//sudah bayar
								'terbayarAngsuranke'   => $terbayarAngsuranke,
								'terbayarBaru'         => setuang($terbayarBaru),
								'terbayarTotal'        => setuang($terbayarTotal),
								//akan bayar
								'akanBayarke'          => $akanBayarke,
								//belum bayar
								'belumBayarNominalTot' => setuang($belumBayarNominalTot),
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