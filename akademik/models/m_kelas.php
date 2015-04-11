<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'kelas';
	$tb  = 'aka_'.$mnu;
	// $out=array();

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
			$page       = $_GET['page']; // get the requested page
			$limit      = $_GET['rows']; // get how many rows we want to have into the grid
			$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
			$sord       = $_GET['sord']; // get the direction
			$searchTerm = $_GET['searchTerm'];


			if(!$sidx) 
				$sidx =1;
			$ss=	'SELECT * 
					FROM(
						SELECT p.nama AS wali, p.nip, p.replid
							
						FROM hrd_pegawai p
							LEFT JOIN aka_kelas k ON p.replid = k.wali
						
						)tb
					WHERE	
						tb.wali LIKE "%'.$searchTerm.'%"
						OR tb.nip LIKE "%'.$searchTerm.'%"';
							// '.(isset($_POST['barang'])and is_array($_POST['barang']) and !is_null($_POST['barang'])?'AND b.replid NOT IN ('.$_POST['barang'].')':'').'
			//print_r($ss);exit();
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
					'wali'   =>$row['wali'],
					'nip'   =>$row['nip']
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
				$departemen     	= isset($_POST['departemenS'])?filter(trim($_POST['departemenS'])):'';
				$tingkat       		= isset($_POST['tingkatS'])?filter(trim($_POST['tingkatS'])):'';
				$tahunajaran        = isset($_POST['tahunajaranS'])?filter(trim($_POST['tahunajaranS'])):'';

				$sql ='SELECT 
							k.replid,
							k.kelas,
							p.nama AS wali,
							k.kapasitas,
							k.keterangan
						FROM aka_kelas k
							LEFT JOIN hrd_pegawai p ON p.replid = k.wali
							LEFT JOIN aka_tahunajaran t ON t.replid=k.tahunajaran
							LEFT JOIN departemen d ON d.replid=t.departemen
							LEFT JOIN aka_tingkat g ON g.replid=k.tingkat
						WHERE
							k.tahunajaran='.$tahunajaran.' AND
							k.tingkat='.$tingkat.' AND 
							t.departemen ='.$departemen.'

						ORDER BY
							k.kelas ASC';
							// t.replid ='.$tahunajaran.$tingkat.'
				// print_r($sql);exit();
				// var_dump($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage= 5;//jumlah data per halaman
				$obj 	= new pagination_class($sql,$starting,$recpage,'tampil','');
				$result =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_array($result)){	
						
						$btn ='<td>
									<button data-hint="ubah"  onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td>'.$nox.'</td>
									<td id="'.$mnu.'TD_'.$res['replid'].'">'.$res['kelas'].'</td>
									<td>'.$res['wali'].'</td>
									<td>'.$res['kapasitas'].'</td>
									<td>-</td>
									<td>'.$res['keterangan'].'</td>
									'.$btn.'
								</tr>';
								// <td>'.$res['terisi'].'</td>
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
				$s = $tb.' set 	tahunajaran = "'.filter($_POST['tahunajaranH']).'",
								kelas    	= "'.filter($_POST['kelasTB']).'",
								kapasitas    	= "'.filter($_POST['kapasitasTB']).'",
								tingkat    	= "'.filter($_POST['tingkatH']).'",
								wali    	= "'.filter($_POST['guruH']).'",
								keterangan 	= "'.filter($_POST['keteranganTB']).'"';

				$s2	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e2 = mysql_query($s2);
								// print_r($e2);exit();
				if(!$e2){
					$stat = 'gagal menyimpan';
				}else{
					$stat = 'sukses';
				}$out  = json_encode(array('status'=>$stat));
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
				$s 		= ' SELECT k.*, p.nip AS nip, p.nama AS nama
							from aka_kelas k, 
							hrd_pegawai p
							WHERE
								 p.replid =k.wali AND
								k.replid='.$_POST['replid'];

												// print_r($s);exit();
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'kelas'      =>$r['kelas'],
							'wali'      =>$r['wali'],
							'nip'       =>$r['nip'],
							'nama'       =>$r['nama'],
							'kapasitas'  =>$r['kapasitas'],
							'tahunajaran' =>$r['tahunajaran'],
							'keterangan' =>$r['keterangan']
						));
			break;
			// ambiledit -----------------------------------------------------------------

		// cmbkelas ---------------------------------------------------------
			case 'cmbkelas':
				$w='';
				if(isset($_POST['replid'])){
					$w.='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w.='where '.$mnu.'='.$_POST[$mnu];
					}elseif(isset($_POST['subtingkat'])){
						$w.='where subtingkat ='.$_POST['subtingkat'];
					}
				}

				$s	= 'SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY '.$mnu.' asc';
				$e  = mysql_query($s);
				// var_dump($s);
				$n  = mysql_num_rows($e);
				$ar =$dt=array();

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
						}$ar = array('status'=>'sukses','kelas'=>$dt);
					}
				}
				$out=json_encode($ar);
				// echo $out;
			break;
			// end of cmbkelas ---------------------------------------------------------

		}
	}echo $out;

	// ---------------------- //
	// -- created by rovi -- //
	// ---------------------- //
?>