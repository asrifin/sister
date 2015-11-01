<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/tglindo.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'rekeningbiaya';
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
			// if(isset($_GET['subaksi']) && $_GET['subaksi']=='wali'){
				$ss='SELECT
						dr.replid,
						dr.kode,
						dr.nama detilRekening,
						kr.nama kategoriRekening,
						sr.nominal2 saldoRekening
					FROM
						keu_detilrekening dr 
						JOIN keu_kategorirekening kr on kr.replid = dr.kategorirekening 
						JOIN keu_saldorekening sr on sr.detilrekening=dr.replid 
					WHERE
						sr.tahunajaran = '.$_GET['tahunajaran'].' and (
							dr.nama LIKE "%'.$searchTerm.'%" OR 
							dr.kode LIKE "%'.$searchTerm.'%" OR 
							kr.nama LIKE "%'.$searchTerm.'%" 
						)		
					';
			// pr($ss);
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
			$ss.=' GROUP BY dr.replid';
			if($total_pages!=0) {
				$ss.=' ORDER BY '.$sidx.' '.$sord.' LIMIT '.$start.','.$limit;
			}else {
				$ss.=' ORDER BY '.$sidx.' '.$sord;
			}
			// print_r($ss);exit();
			$result = mysql_query($ss) or die("Couldn t execute query.".mysql_error());
			$rows 	= array();
			while($row = mysql_fetch_assoc($result)) {
				$rows[]= array(
					'replid'           =>$row['replid'],
					'kode'             =>$row['kode'],
					'detilRekening'    =>$row['detilRekening'],
					'kategoriRekening' =>$row['kategoriRekening'],
					'saldoRekening'    =>setuang($row['saldoRekening'])
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
			// -----------------------------------------------------------------
			case 'tampil':
				$departemen    = isset($_POST['departemenS'])?$_POST['departemenS']:'';
				$tahunajaran   = isset($_POST['tahunajaranS'])?$_POST['tahunajaranS']:'';
				$biaya         = isset($_POST['biayaS'])?$_POST['biayaS']:'';
				$detilrekening = isset($_POST['detilrekeningS'])?$_POST['detilrekeningS']:'';

				$sql = 'SELECT 
							rb.replid,
							b.replid idbiaya,
							b.biaya
						FROM
							'.$tb.' rb 
							JOIN psb_biaya b on b.replid = rb.biaya
						WHERE
							rb.departemen ='.$departemen.' AND
							rb.tahunajaran ='.$tahunajaran.' AND
							b.biaya LIKE "%'.$biaya.'%" 
						ORDER BY 
							b.biaya asc';
				// pr($sql);
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = 10;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button '.(isAksi('rekeningbiaya','u')?'onclick="viewFR('.$res['replid'].');"':'disabled').' data-hint="ubah">
										<i class="icon-pencil"></i>
									</button>';
						$out.= '<tr>
									<td>'.$res['biaya'].'</td>
									<td>'.getAllRekeningBiaya($res['idbiaya'],$departemen,$tahunajaran).'</td>
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
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$stat3=$stat2=true;
				if(isset($_POST['iDetilRekeningDelTR']) && $_POST['iDetilRekeningDelTR']!=''){
					$sd = 'DELETE FROM keu_detilrekeningbiaya WHERE replid in ('.$_POST['iDetilRekeningDelTR'].')';
					$ed = mysql_query($sd);
					$stat3=!$ed?false:true;
				}
				if($stat3){
					foreach ($_POST['idDetilRekeningTR'] as $i => $v) {
						$s = 'keu_detilrekeningbiaya SET
							 	rekeningbiaya ='.$_POST['idformH'].',
								detilrekening = '.$_POST['detilRekening'.$v.'H'].', 
						 		jenisrekening = "'.$_POST['jenisRekening'.$v.'TB'].'"';
						$s2 = $_POST['idDetilRekeningBiaya'.$v.'H']==''?'INSERT INTO '.$s:'UPDATE '.$s.' WHERE replid ='.$_POST['idDetilRekeningBiaya'.$v.'H'];
						$e = mysql_query($s2);
						$stat2=!$e?false:true;
					}
				}
				$stat = !$stat2?'gagal menyimpan':'sukses';
				$out = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s = '	SELECT rb.departemen,rb.tahunajaran,b.biaya
						FROM keu_rekeningbiaya rb
							JOIN psb_biaya b on b.replid= rb.biaya
						WHERE rb.replid ='.$_POST['replid'];
				$e  = mysql_query($s);
				$r  = mysql_fetch_assoc($e);
				
				$s2 = '	SELECT
							drb.replid idDetilRekeningBiaya,
							dr.replid idDetilRekening,
							CONCAT("[",dr.kode,"] ",dr.nama)detilRekening,
							sr.nominal2 saldoRekening,
							kr.nama  kategoriRekening,
							drb.jenisrekening jenisRekening
						FROM
							keu_detilrekeningbiaya drb
							JOIN keu_detilrekening dr on dr.replid = drb.detilrekening
							JOIN keu_kategorirekening kr  on kr.replid = dr.kategorirekening
							JOIN keu_saldorekening sr on sr.detilrekening = dr.replid
						WHERE
							drb.rekeningbiaya = '.$_POST['replid'].' and 
							sr.tahunajaran ='.$r['tahunajaran'].'
						ORDER BY 
							drb.jenisrekening DESC';
				// pr($s2);
				$e2 = mysql_query($s2);
				$detilrekeningbiaya = array();
				while ($r2 = mysql_fetch_assoc($e2)) $detilrekeningbiaya[]=$r2;
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array(
							'status'           =>$stat,
							'biaya'            =>$r['biaya'],
							'departemen'       =>$r['departemen'],
							'tahunajaran'      =>$r['tahunajaran'],
							'detilRekeningArr' =>$detilrekeningbiaya
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// cmb biaya -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w=' where replid ='.$_POST['replid'];
				}elseif(isset($_POST['isDiskon'])){
					$w=' where isDiskon IN(1,3)'; // 1 = reguler 3 = reguler & khusus
				}

				$s	= ' SELECT * FROM '.$tb.$w.' ORDER BY biaya ASC';
				// pr($s);
				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar =$dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error'.mysql_error());
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
			// cmb biaya -----------------------------------------------------------------
		}
	}echo $out;
?>