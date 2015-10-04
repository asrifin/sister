<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'pemutihanpenerimaansiswa';
	$tb  = 'keu_'.$mnu;

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
				FROM '.$tb.' 
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
		}else $out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// view -----------------------------------------------------------------
			case 'tampil':
				$karyawan = (isset($_POST['karyawanS']) and trim($_POST['karyawanS'])!='')?filter($_POST['karyawanS']):'';
				$siswa    = (isset($_POST['siswaS']) and trim($_POST['siswaS'])!='')?filter($_POST['siswaS']):'';
				$tgl      = (isset($_POST['tglS']) and trim($_POST['tglS'])!='')?filter($_POST['tglS']):'';
				$nomom    = (isset($_POST['nomomS']) and trim($_POST['nomomS'])!='')?filter($_POST['nomomS']):'';
				$tglmom   = (isset($_POST['tglmomS']) and trim($_POST['tglmomS'])!='')?filter($_POST['tglmomS']):'';
				$total    = (isset($_POST['totalS']) and trim($_POST['totalS'])!='')?filter($_POST['totalS']):'';
				$sql  = 'SELECT 
							p.replid,
							p.tgl,
							p.tglmom,
							p.nomom,
							k.nama karyawan,
							s.namasiswa siswa
						FROM '.$tb.' p
							LEFT JOIN keu_subpemutihanpenerimaansiswa pp on pp.pemutihanpenerimaansiswa = p.replid
							JOIN psb_siswa s on s.replid = p.siswa
							JOIN hrd_karyawan k on k.id = p.karyawan
						WHERE 
							s.namasiswa like "%'.$siswa.'%" AND 
							p.nomom like "%'.$nomom.'%" AND 
							k.nama  like "%'.$karyawan.'%"';
						// pr($sql);	
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				$recpage = 10;
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  = $obj->result;

				$jum = mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox =$starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button '.(isAksi($mnu,'u')?'onclick="viewFR('.$res['replid'].');"':'disabled').' data-hint="ubah"  >
										<i class="icon-pencil"></i>
									</button>
									<button '.(isAksi($mnu,'d')?'onclick="del('.$res['replid'].');"':'disabled').' data-hint="hapus" >
										<i class="icon-remove"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td>'.$res['tgl'].'</td>
									<td>'.$res['siswa'].'</td>
									<td>'.$res['karyawan'].'</td>
									<td>'.$res['nomom'].'</td>
									<td>'.$res['tglmom'].'</td>
									'.$btn.'
								</tr>';
									// <td>'.getTotalPemutihan($res['replid']).'</td>
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
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s = $tb.' set 	viabayar   = "'.filter($_POST['viabayarTB']).'",
								keterangan = "'.filter($_POST['keteranganTB']).'"';
				$s2	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				// pr($s2);
				$e2 = mysql_query($s2);
				$stat = !$e2?'gagal menyimpan':'sukses';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid ='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid ='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s1 = '	SELECT * 
						FROM '.$tb.'
						WHERE replid ='.$_POST['replid'];
				$e1   = mysql_query($s1);
				$r1   = mysql_fetch_assoc($e1);
				$stat =!$e1?'gagal':'sukses';
				$out  = json_encode(array(
							'status'     =>$stat,
							'viabayar'   =>$r1['viabayar'],
							'keterangan' =>$r1['keterangan'],
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// aktifkan -----------------------------------------------------------------
			case 'aktifkan':
				$e1   = mysql_query('UPDATE  '.$tb.' set aktif="0"');
				if(!$e1){
					$stat='gagal menonaktifkan';
				}else{
					$s2 = 'UPDATE  '.$tb.' set aktif="1" where id_ .$mnu= '.$_POST['id_'.$mnu];
					$e2 = mysql_query($s2);
					if(!$e2){
						$stat='gagal mengaktifkan';
					}else{
						$stat='sukses';
					}
				}$out  = json_encode(array('status'=>$stat));
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbwarna -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w.='where sd.replid='.$_POST['replid'];
				}else{
					if(isset($_POST['tingkat'])){
						$w.='where sd.tingkat = '.$_POST['tingkat'];
					}
				}
				
				$s	= ' SELECT
							sd.replid,	
							d.dokumen,	
							sd.jumlah,
							sj.satuanjumlah
						FROM
							psb_subdokumen sd
							JOIN psb_dokumen d on d.replid = sd.dokumen
							JOIN psb_satuanjumlah sj on sj.replid = sd.satuanjumlah
						'.$w;
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
						}$ar = array('status'=>'sukses',$mnu=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbtahunajaran -----------------------------------------------------------------
		}
	}echo $out;

?>