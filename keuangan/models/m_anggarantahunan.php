<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	$mnu = 'anggarantahunan';
	$tb  = 'keu_'.$mnu;

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
				$kategorianggaran = isset($_POST['kategorianggaranS'])?filter($_POST['kategorianggaranS']):'';
				$detilanggaran    = isset($_POST['detilanggaranS'])?filter($_POST['detilanggaranS']):'';
				$keterangan       = isset($_POST['keteranganS'])?filter($_POST['keteranganS']):'';
				$tahunajaran      = isset($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';

				$sql = 'SELECT
							ath.replid,
							da.detilanggaran,
							da.keterangan,
							getAnggaranPerItem(ath.replid)kuotaAnggaran
						FROM
							keu_detilanggaran da
						LEFT JOIN keu_anggarantahunan ath ON ath.detilanggaran = da.replid
						WHERE
							ath.tahunajaran = '.$tahunajaran.'
							AND da.kategorianggaran = "'.$kategorianggaran.'"
							AND da.detilanggaran LIKE "%'.$detilanggaran.'%"
							AND da.keterangan LIKE "%'.$keterangan.'%"
						ORDER BY
							da.detilanggaran ASC';
				// pr($sql);
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = 5;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result  = $obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center" rowspan="2">
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
								 </td>';
										// <div class="slider" data-role="slider" data-position="0" data-accuracy="0" data-colors="blue, red, yellow, green"></div>									
						$out.= '<tr>
									<td rowspan="2">'.$res['detilanggaran'].'</td>
									<td rowspan="2">'.$res['keterangan'].'</td>
									<td colspan="2" xalign="right">
										<div class="bg-green progress-bar" data-role="progress-bar" data-color="bg-red" data-value="25 "></div>
									</td>
									'.$btn.'
								</tr>
								<tr>
									<td align="right">
										'.setuang($res['kuotaAnggaran']/4).' 	
									</td>
									<td align="right">
										'.setuang($res['kuotaAnggaran']).'
									</td>
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
			// tampil ---------------------------------------------------------------------

			case 'headerInfo':
				$s ='SELECT getAnggaranPerKategori('.$_POST['kategorianggaran'].','.$_POST['tahunajaran'].') anggaranKuotaPerKategori';
				$e =mysql_query($s);
				$r =mysql_fetch_assoc($e);
				$out =json_encode(array(
					'status'                   =>(!$e?'gagal':'sukses'),
					'anggaranKuotaPerKategori' => setuang($r['anggaranKuotaPerKategori'])
				));
			break;

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				// simpan anggaran tahunan  -----
				$s  ='	UPDATE '.$tb.' set hargasatuan = '.getuang($_POST['hargasatuanTB']).' 
						WHERE replid='.$_POST['replid'];
				$e = mysql_query($s);
				// nominal anggaran ----
				if($e && isset($_POST['idnominalH'])){
					$stat2=true;
					foreach ($_POST['idnominalH'] as $i => $v) {
						$s2='UPDATE keu_nominalanggaran SET jml 	='.$_POST['jml'.$v.'TB'].',
															bulan   ='.$v.' 
													WHERE 	anggarantahunan	='.$_POST['replid'].' AND bulan ='.$v;
						$e2    =mysql_query($s2);
						$stat2 =!$e2?false:true;
					}$stat  = !$stat2?'gagal_nominal':'sukses';
				}$out = json_encode(array('status'=>(!$e|| !$stat2?'gagal':'sukses')));
			break;
			
			// delete ---------------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
			break;
			// delete ---------------------------------------------------------------------

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				$s = '	SELECT
							ta.hargasatuan,	
							da.detilanggaran,	
							ka.departemen,
							ta.tahunajaran,
							ka.tingkat,
							ka.kategorianggaran,
							da.keterangan
						FROM
							keu_anggarantahunan ta
							JOIN keu_detilanggaran da ON da.replid = ta.detilanggaran
							JOIN keu_kategorianggaran ka ON ka.replid = da.kategorianggaran
						WHERE
							ta.replid ='.$_POST['replid'];
				// pr($s);
				$e = mysql_query($s);
				$r = mysql_fetch_assoc($e);
				if(!$e) $stat ='gagal_ambiledit_anggaran_tahunan';
				else{
					$s2 ='SELECT replid, jml, bulan FROM keu_nominalanggaran WHERE anggarantahunan ='.$_POST['replid'];
					$e2 = mysql_query($s2);
					$stat=!$e2?'gagal_nominalanggaran':'sukses';
					$nominalArr=array();
					$totJml=$totJmlHrg=0;
					while ($r2=mysql_fetch_assoc($e2)) {
						$jmlHrg=(intval($r2['jml'])*intval($r['hargasatuan']));
						$totJml+=$r2['jml'];
						$totJmlHrg+=$jmlHrg;
						$nominalArr[]=array(
							'replid' =>$r2['replid'],
							'jml'    =>$r2['jml'],
							'bulan'  =>$r2['bulan'],
							'jmlHrg' =>setuang($jmlHrg),
						);
					}
				}
				$out = json_encode(array(
						'status'           =>$stat,
						'departemen'       =>$r['departemen'],
						'tahunajaran'      =>$r['tahunajaran'],
						'tingkat'          =>$r['tingkat'],
						'kategorianggaran' =>$r['kategorianggaran'],
						'detilanggaran'    =>$r['detilanggaran'],	
						'hargasatuan'      =>setuang($r['hargasatuan']),	
						'keterangan'       =>$r['keterangan'],
						'nominalArr'       =>$nominalArr,
						'totJml'           =>$totJml,
						'totJmlHrg'        =>setuang($totJmlHrg)
					));
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