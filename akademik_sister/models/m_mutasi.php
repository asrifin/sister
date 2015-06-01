<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	$tb = 'aka_mutasi';
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
						SELECT s.nama,s.nisn,s.replid
						FROM aka_siswa s
						LEFT JOIN aka_mutasi m ON s.replid=m.siswa
						where 
							s.replid NOT IN (SELECT siswa FROM aka_mutasi) 
						)tb
					WHERE	
						tb.nama LIKE "%'.$searchTerm.'%"
						OR tb.nisn LIKE "%'.$searchTerm.'%"';
							// '.(isset($_POST['barang'])and is_array($_POST['barang']) and !is_null($_POST['barang'])?'AND b.replid NOT IN ('.$_POST['barang'].')':'').'
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
					'nisn'   =>$row['nisn'],
					'nama'   =>$row['nama']
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
				$departemen = isset($_POST['departemenS'])?filter(trim($_POST['departemenS'])):'';
				// $tanggal = isset($_POST['tanggalS'])?filter(trim($_POST['tanggalS'])):'';
				$nisn = isset($_POST['nisnS'])?filter(trim($_POST['nisnS'])):'';
				$nama = isset($_POST['namaS'])?filter(trim($_POST['namaS'])):'';
				$jenismutasi = isset($_POST['jenismutasiS'])?filter(trim($_POST['jenismutasiS'])):'';
				$keterangan = isset($_POST['keteranganS'])?filter(trim($_POST['keteranganS'])):'';
				$sql = 'SELECT m.*, s.nisn,s.nama,j.nama AS jenismutasi
						FROM aka_mutasi m
						LEFT JOIN aka_siswa s ON s.replid=m.siswa
						LEFT JOIN aka_jenismutasi j ON j.replid=m.jenismutasi
						LEFT JOIN departemen d ON d.replid=m.departemen
						WHERE 
							departemen = '.$departemen.'
							AND s.nisn like "%'.$nisn.'%"
							AND s.nama like "%'.$nama.'%"
							AND j.nama like "%'.$jenismutasi.'%"
							AND m.keterangan like "%'.$keterangan.'%"';

							// AND m.tanggal like "%'.$tanggal.'%"
					// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
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
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
								 </td>';
						$out.= '<tr>
									<td>'.tgl_indo($res['tanggal']).'</td>
									<td>'.$res['nisn'].'</td>
									<td>'.$res['nama'].'</td>
									<td>'.$res['jenismutasi'].'</td>
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
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s 		= $tb.' set 	departemen 	= "'.filter($_POST['departemenH']).'",
										siswa 		= "'.filter($_POST['siswaH']).'",
										tanggal		= "'.filter($_POST['tanggalTB']).'",
										jenismutasi = "'.filter($_POST['jenismutasiTB']).'",
										keterangan 	= "'.filter($_POST['keteranganTB']).'"';
				$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e 		= mysql_query($s2);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['replid']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT m.*, s.nisn,s.nama,j.nama AS jenismutasi,d.nama AS departemen
						FROM aka_mutasi m, aka_siswa s, aka_jenismutasi j, departemen d
						WHERE
						   s.replid=m.siswa AND
						   j.replid=m.jenismutasi AND
						   d.replid=m.departemen AND
								m.replid='.$_POST['replid'];
				// print_r($s);exit();
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'siswa'       =>$r['siswa'],
							'departemen'       =>$r['departemen'],
							'nama'       =>$r['nama'],
							'tanggal'   =>$r['tanggal'],
							'jenismutasi'   =>$r['jenismutasi'],
							'nisn'   =>$r['nisn'],
							'keterangan' =>$r['keterangan']
						));
			break;
			// ambiledit -----------------------------------------------------------------
		}
	}echo $out;

	// ---------------------- //
	// -- created by rovi -- //
	// ---------------------- //
?>