<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'siswa';
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
			$ss='SELECT * 
				FROM(
					SELECT p.nama,p.nisn,p.replid
					FROM aka_siswa p
						LEFT JOIN aka_alumni G ON p.replid=g.siswa
					where 
						p.replid NOT IN (SELECT siswa FROM aka_alumni) 
					)tb
				WHERE	
					tb.nama LIKE "%'.$searchTerm.'%"
					OR tb.nisn LIKE "%'.$searchTerm.'%"';
					// tb.tahunlulus = '.$_GET['tahunlulus'].' and 
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
				$tahunajaran = isset($_POST['tahunajaranS'])?filter(trim($_POST['tahunajaranS'])):'';
				$tingkat = isset($_POST['tingkatS'])?filter(trim($_POST['tingkatS'])):'';
				$subtingkat = isset($_POST['subtingkatS'])?filter(trim($_POST['subtingkatS'])):'';
				$kelas = isset($_POST['kelasS'])?filter(trim($_POST['kelasS'])):'';
				$nama = isset($_POST['namaS'])?filter(trim($_POST['namaS'])):'';
				$nisn = isset($_POST['nisnS'])?filter(trim($_POST['nisnS'])):'';
				// var_dump($nisn);exit();
						 // AND s.kelas ="%'.$kelas.'%"
				$sql = 'SELECT
							s.*
						FROM
							aka_siswa s
							LEFT JOIN aka_siswa_kelas k ON k.siswa = s.replid
							LEFT JOIN aka_angkatan a ON a.replid = s.angkatan
							LEFT JOIN aka_kelas l ON l.replid = k.kelas
							LEFT JOIN aka_subtingkat g ON g.replid = l.subtingkat
							LEFT JOIN aka_tingkat t ON t.replid = l.tingkat
							LEFT JOIN aka_tahunajaran j ON j.replid = t.tahunajaran
							LEFT JOIN departemen d ON d.replid = j.departemen
						WHERE
							j.departemen = '.$departemen.'
							AND a.departemen = '.$departemen.'
							AND l.tahunajaran = '.$tahunajaran.'
							AND l.tingkat = '.$tingkat.'
							AND l.subtingkat = '.$subtingkat.'
							AND k.kelas = '.$kelas.'
							AND s.aktif = 1';
				// print_r($sql);exit();
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
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
								 </td>';
						$out.= '<tr>
									<td>'.$res['nis'].'</td>
									<td>'.$res['nisn'].'</td>
									<td>'.$res['nama'].'</td>
									<td>'.$res['tmplahir'].', '.tgl_indo($res['tgllahir']).'</td>
									'.$btn.'
								</tr>';
									// <td>'.$res['tahunlulus'].'</td>
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
				// process 
				if(isset($_POST['replid']) && $_POST['replid']!='' ){ // ada id (edit mode)
					$s = 'UPDATE '.$tb.' set 	tahunlulus = "'.filter($_POST['tahunlulusH']).'",
												siswa    	= "'.filter($_POST['siswaH']).'",
												keterangan 	= "'.filter($_POST['keteranganTB']).'"
										WHERE 	replid='.$_POST['replid'];
									// print_r($s);exit();
					$e2    =mysql_query($s);
					$stat =$e2?'sukses':'gagal';
				}else{// tidak ada id (add mode)
					$stat2=true;
					if(isset($_POST['siswa'])){ // ada array (siswa)  
						foreach ($_POST['siswa'] as $i=> $v) {

							$s2='INSERT INTO aka_alumni set 	siswa 		= '.$v.',
																tahunlulus 	= "'.$_POST['tahunlulusTB'].'"';
							// $s2='INSERT INTO aka_alumni set 	tahunlulus = "'.filter($_POST['tahunlulusH'][]).'",
							// 									siswa    	= "'.filter($_POST['siswaH']).'",
							// 									keterangan 	= "'.filter($_POST['keteranganTB']).'"';
																// ,
																// keterangan 	= "'.$_POST['keteranganTB'].'"

							$s2 	='INSERT INTO aka_alumni set 	siswa 		= '.$v.',
																	tahunlulus 	= "'.$_POST['tahunlulusTB'].'"';

							$e2    =mysql_query($s2);
							$stat2 =$e2?true:false;
						}
						if($stat2){ //  berhasil insert
							$sq = 'UPDATE aka_siswa set aktif = 2';
							$esq=mysql_query($sq);
							$stats=$esq?'berhasil':'gagal';	
						}else{ // gagal insert 
							$stats='gagal';
						}
					}$stat=$stat2?'sukses':'gagal_simpan_barang';
				}$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['siswa']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT 
								a.replid, 
								t.nama AS tahunlulus, 
								t.replid AS idtahunlulus,
								s.nama AS nsiswa, 
								a.keterangan AS ket, 
								s.nisn,
								d.nama AS departemen, /*epiii*/
								d.replid AS iddepartemen,
								s.replid AS idsis

							FROM aka_alumni a 
							 	LEFT JOIN aka_tahunlulus t ON t.replid=a.tahunlulus
							 	LEFT JOIN departemen d ON d.replid=t.departemen
							 	LEFT JOIN aka_siswa s ON s.replid=a.siswa
							WHERE
								a.replid='.$_POST['replid'];
				// print_r($s);exit();	
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'       =>$stat,
							'departemen'   =>$r['departemen'],
							'iddepartemen' =>$r['iddepartemen'],
							'idtahunlulus' =>$r['idtahunlulus'],
							'tahunlulus'   =>$r['tahunlulus'],
							'siswa'        =>$r['nsiswa'],
							'siswak'       =>$r['idsis'],
							'nisn'         =>$r['nisn'],
							'ket'          =>$r['ket']
						));

			break;
			// ambiledit -----------------------------------------------------------------


		}
	}
	echo $out;

	// ---------------------- //
	// -- created by rovi -- //
	// ---------------------- //
?>