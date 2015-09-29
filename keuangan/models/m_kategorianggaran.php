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
				$departemen       = isset($_POST['departemenS'])?$_POST['departemenS']:'';
				$tingkat          = isset($_POST['tingkatS'])?$_POST['tingkatS']:'';
				$kategorianggaran = isset($_POST['kategorianggaranS'])?filter($_POST['kategorianggaranS']):'';
				$detilrekening    = isset($_POST['detilrekeningS'])?filter($_POST['detilrekeningS']):'';
				$keterangan       = isset($_POST['keteranganS'])?filter($_POST['keteranganS']):'';

				$sql = 'SELECT
							ka.replid,	
							ka.kategorianggaran,
							ka.keterangan,
							concat("[",dr.kode,"] ",dr.nama)rekening
						FROM
							keu_kategorianggaran ka
							JOIN keu_detilrekening dr on dr.replid = ka.detilrekening
						where 
							ka.departemen = '.$departemen.'  and 
							ka.tingkat = '.$tingkat.'  and (
								dr.kode LIKE  "%'.$detilrekening.'%" OR
								dr.nama LIKE  "%'.$detilrekening.'%"
							)and 
							ka.kategorianggaran LIKE "%'.$kategorianggaran.'%" and 
							ka.keterangan LIKE "%'.$keterangan.'%"
						order by
							ka.kategorianggaran asc,
							dr.nama asc';
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
				$out ='';$totaset=0;
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_assoc($result)){	
						// <button data-hint="detail"  class="button" onclick="vwHeadDetilAnggaran('.$res['replid'].');">
						// 	<i class="icon-zoom-in"></i>
						// </button>
						$btn ='<td align="center">
									<button data-hint="ubah"  class="button" onclick="loadFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td>'.$res['kategorianggaran'].'</td>
									<td>'.$res['rekening'].'</td>
									<td>'.$res['keterangan'].'</td>
									<td>-</td>
									'.$btn.'
								</tr>';
									// <td class="text-right" >Rp. '.number_format(getKatAnggaran($res['replid'],'kuotaNum')).'</td>
									// <td class="text-right" >Rp. '.number_format(getKatAnggaran($res['replid'],'sisaNum')).'</td>
									// <td class="text-center">'.$res['jmlItem'].' item</td>
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
				$s= $tb.' set 	kategorianggaran = "'.$_POST['kategorianggaranTB'].'",
								departemen       = '.$_POST['departemenTB'].',
								tingkat          = '.$_POST['tingkatTB'].',
								detilrekening    = '.$_POST['detilrekeningH'].',
								keterangan       = "'.$_POST['keteranganTB'].'"';
				$s2  =(isset($_POST['replid']) AND $_POST['replid']!='')?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e   = mysql_query($s2);
				$out = json_encode(array('status'=>!$e?'gagal':'sukses'));
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
				$s = 	'SELECT 
							a.departemen,
							a.tingkat,
							a.kategorianggaran,
							a.keterangan,
							a.detilrekening iddetilrekening,
							concat("[",d.kode,"] ",d.nama)detilrekening
						FROM '.$tb.' a
							LEFT JOIN keu_detilrekening d on d.replid = a.detilrekening
						WHERE a.replid ='.$_POST['replid'];
				// pr($s);
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'           =>$stat,
							'departemen'       =>$r['departemen'],
							'tingkat'          =>$r['tingkat'],
							'kategorianggaran' =>$r['kategorianggaran'],
							'iddetilrekening'  =>$r['iddetilrekening'],
							'detilrekening'    =>$r['detilrekening'],
							'keterangan'       =>$r['keterangan'],
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
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w.='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w.='where '.$mnu.'='.$_POST[$mnu];
					}elseif(isset($_POST['departemen'])){
						$w.='where departemen ='.$_POST['departemen'].' AND  tingkat ='.$_POST['tingkat'];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY 
							kategorianggaran asc';
// pr($s);
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