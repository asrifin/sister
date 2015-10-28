<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'siswakelas';
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
				switch ($_POST['subaksi']) {
					case 'aktif':
						$detailkelas       = isset($_POST['detailkelasS'])?filter($_POST['detailkelasS']):'';
						$namasiswa         = isset($_POST['aktif_namasiswaS'])?filter($_POST['aktif_namasiswaS']):'';
						$nisn              = isset($_POST['aktif_nisnS'])?filter($_POST['aktif_nisnS']):'';
						$nis               = isset($_POST['aktif_nisS'])?filter($_POST['aktif_nisS']):'';
						$tempatlahirsiswa  = isset($_POST['tempatlahirsiswaS'])?filter($_POST['tempatlahirsiswaS']):'';
						$tanggallahirsiswa = isset($_POST['tanggallahirsiswaS'])?filter($_POST['tanggallahirsiswaS']):'';

						$sql = 'SELECT
									sk.replid,
									s.nis,
									s.nisn,
									s.namasiswa,
									s.tempatlahirsiswa,
									s.tanggallahirsiswa
								FROM
									aka_siswakelas sk
									join psb_siswa s on s.replid = sk.siswa 
									join aka_detailkelas dk on dk.replid = sk.detailkelas
								WHERE	
									dk.replid = '.$detailkelas.' AND
									s.namasiswa LIKE "%'.$namasiswa.'%" AND
									s.nis LIKE "%'.$nis.'%" AND
									s.nisn LIKE "%'.$nisn.'%" AND
									s.tempatlahirsiswa LIKE "%'.$tempatlahirsiswa.'%" and
									s.tanggallahirsiswa LIKE "%'.$tanggallahirsiswa.'%"';
									// pr($sql);
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$obj     = new pagination_class($sql,$starting,$recpage,'tampil','aktif');
						$result  =$obj->result;
						$jum     = mysql_num_rows($result);
						$out     ='';
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$btn ='<td>
											<button data-hint="hapus"  class="button fg-white bg-red" onclick="del('.$res['replid'].');">
												<i class="icon-cancel-2"></i>
											</button>
										 </td>';
								$out.= '<tr class="siswakelasTR" id="siswakelas'.$res['replid'].'TR">
											<td align="center">
												<div class="input-control switch">
													<label>
												        <input class="siswakelasTB" onclick="siswakelasSelTR('.$res['replid'].');" value="'.$res['replid'].'" id="siswakelas'.$res['replid'].'TB" type="checkbox" />
												        <span class="check"></span>
												    </label>
												</div>
											</td>
											<td>'.$res['namasiswa'].'</td>
											<td>'.$res['nis'].'</td>
											<td>'.$res['nisn'].'</td>
											<td>'.$res['tempatlahirsiswa'].', '.($res['tanggallahirsiswa']=='0000-00-00'?'-':tgl_indo($res['tanggallahirsiswa'])).'</td>
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

					case 'belum':
						$departemen      = isset($_POST['departemenTB'])?filter($_POST['departemenTB']):'';
						$tahunajaran     = isset($_POST['tahunajaranTB'])?filter($_POST['tahunajaranTB']):'';
						$subtingkat      = isset($_POST['subtingkatTB'])?filter($_POST['subtingkatTB']):'';
						$tahunajaran     = isset($_POST['tahunajaranTB'])?filter($_POST['tahunajaranTB']):'';
						$tahunajaranasal = isset($_POST['tahunajaranasalTB'])?filter($_POST['tahunajaranasalTB']):'';
						$detailkelas     = isset($_POST['detailkelasTB'])?filter($_POST['detailkelasTB']):'';
						$detailkelasasal = isset($_POST['detailkelasasalTB'])?filter($_POST['detailkelasasalTB']):'';
						
						$nis         = isset($_POST['belum_nisS'])?filter($_POST['belum_nisS']):'';
						$namasiswa   = isset($_POST['belum_namasiswaS'])?filter($_POST['belum_namasiswaS']):'';

						if($_POST['modeTB']=='1'){ // siswa baru
							$w=' and siswa.replid not in (SELECT sk.siswa from aka_siswakelas sk)';  
							$w.=' AND subtingkat.replid ='.$subtingkat;    
							$w.=' AND tahunajaran.replid = '.$tahunajaran; 
						}else{ // siswa lama ( naik kelas )
							$w=' and siswa.replid IN (
									SELECT sk.siswa
									FROM aka_siswakelas sk
									WHERE
										sk.detailkelas ='.$detailkelasasal.' and 
										sk.siswa NOT in (
											SELECT sk2.siswa FROM aka_siswakelas sk2 WHERE sk2.detailkelas = '.$detailkelas.'
										)
								)';  
							$w.='';    
							$w.=' AND tahunajaran.replid = '.$tahunajaranasal; 
						}

						$sql = 'SELECT
									siswa.replid,
									siswa.namasiswa,
									siswa.nis,	
									siswa.nisn
								FROM
									psb_siswa siswa
									JOIN psb_siswabiaya siswabiaya on siswabiaya.siswa = siswa.replid
									JOIN psb_detailbiaya detailbiaya on detailbiaya.replid = siswabiaya.detailbiaya
									JOIN psb_biaya biaya on biaya.replid = detailbiaya.biaya
									JOIN aka_subtingkat subtingkat on subtingkat.replid = detailbiaya.subtingkat
									JOIN aka_tingkat tingkat on tingkat.replid = subtingkat.tingkat
									JOIN psb_detailgelombang detailgelombang on detailgelombang.replid = detailbiaya.detailgelombang
									JOIN psb_gelombang gelombang on gelombang.replid = detailgelombang.gelombang
									JOIN aka_tahunajaran tahunajaran on tahunajaran.replid = detailgelombang.tahunajaran
									JOIN psb_golongan golongan on golongan.replid = detailbiaya.golongan
									JOIN departemen departemen  on departemen.replid = detailgelombang.departemen
								WHERE
									siswa.status ="1"  and  
									departemen.replid = '.$departemen.' and 
									siswa.nis LIKE "%'.$nis.'%" and 
									siswa.namasiswa LIKE "%'.$namasiswa.'%" '.$w.'
								GROUP BY 
									siswa.replid';
						// pr($sql);
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 10;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='belum';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						$jum     = mysql_num_rows($result);
						$out     ='';
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$out.= '<tr class="siswaTR" id="siswa'.$res['replid'].'TR">
											<td align="center">
												<div class="input-control switch">
													<label>
												        <input class="siswaTB" onclick="siswaSelTR('.$res['replid'].');" xvalue="'.$res['replid'].'" name="siswaTB['.$res['replid'].']" id="siswa'.$res['replid'].'TB" type="checkbox" />
												        <span class="check"></span>
												    </label>
												</div>
											</td>
											<td>'.$res['nis'].'</td>
											<td>'.$res['namasiswa'].'</td>
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
				}
			break;  
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$stat = true;
				if(isset($_POST['siswaTB']) && count($_POST['siswaTB'])>0){ // ada siswa terpilih 
					foreach ($_POST['siswaTB'] as $i => $v) {
						$s = 'INSERT INTO '.$tb.' set 	detailkelas = "'.filter($_POST['detailkelasTB']).'",
														siswa    	= '.$i;
						$e = mysql_query($s);
						$stat=!$e?false:true;
					}
				}$out  = json_encode(array('status'=>$stat?'sukses':'gagal'));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
			// pr($_POST);
				if(isset($_POST['siswakelasTB']) && count($_POST['siswakelasTB'])>0){
					$stat = true;
					foreach ($_POST['siswakelasTB'] as $i => $v) {
						$s = 'DELETE from '.$tb.' WHERE replid='.$v;
						$e = mysql_query($s);
						$stat=!$e?false:true;
					}$msg='semua';
				}elseif(isset($_POST['replid']) && $_POST['replid']!=''){
					$d   = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
					$msg = $d['siswa'];
					$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
					$e    = mysql_query($s);
					$stat = !$e?false:true;
				}else{// isset kosong 
					$stat = false;
				}$out  = json_encode(array(
					'status'   =>(!$stat?'gagal':'sukses'),
					'terhapus' =>$msg
				));
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
	}echo $out;
?>