<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	$mnu  = 'kategorianggaran';
	$tb   = 'keu_'.$mnu;

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
			// tampil ---------------------------------------------------------------------

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
?>