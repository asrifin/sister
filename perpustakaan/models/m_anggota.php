<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'anggota';
	$tb  = 'pus_'.$mnu;
	$out ='';
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
// tampil ---------------------------------------------------------------------
			case 'tampil':
				switch ($_POST['subaksi']) {
					// Siswa
					case 'siswa':
						$nis         = isset($_POST['nisS'])?filter(trim($_POST['nisS'])):'';
						$nama        = isset($_POST['namaS'])?filter(trim($_POST['namaS'])):'';
						$lokasi      = isset($_POST['lokasiS'])?filter(trim($_POST['lokasiS'])):'';
						$tahunajaran = isset($_POST['tahunajaranS'])?filter(trim($_POST['tahunajaranS'])):'';
						$tingkatbuku = isset($_POST['tingkatbukuS'])?filter(trim($_POST['tingkatbukuS'])):'';
						$kelas       = isset($_POST['kelasS'])?filter(trim($_POST['kelasS'])):'';
						
						// // $sql = 'SELECT
						// 			a.nis,
						// 			a.nama,
						// 		/*	(SELECT 
						// 				COOUNT(*)
						// 				FROM pus_buku
						// 				WHERE pus_buku.replid = pus_peminjaman.buku)
						// 			jumlah */
						// 			SUM(if (pus_peminjaman.status=1,1,0)) total
						// 		FROM
						// 			aka_siswa_kelas ask
						// 		LEFT JOIN aka_siswa a ON a.replid = ask.siswa 
								// LEFT JOIN aka_kelas ak ON ak.replid = ask.kelas
								// LEFT JOIN aka_tingkat at ON at.replid = ak.kelas
								// LEFT JOIN aka_tahunajaran aj ON aj.replid = at.replid
								// LEFT JOIN departemen d ON d.replid = aj.departemen
						// 		LEFT JOIN pus_peminjaman ON (pus_peminjaman.member = a.replid AND pus_peminjaman.mtipe = 1)
						// 		WHERE
						// 			a.nis like "%'.$nis.'%" and
						// 			a.nama like "%'.$nama.'%" 
						// 		ORDER BY
						// 			a.replid asc';
						$sql = 'SELECT
									s.nis,
									s.nama,(
											SELECT count(*)
											FROM
												pus_peminjaman 
											where 
											mtipe = pj.mtipe and 
											member= s.replid and 
											status=1
									)borrowing,(
										SELECT
											count(*)
										FROM
											pus_peminjaman 
										WHERE
											mtipe = pj.mtipe and 
											member= s.replid
									) total
								FROM
									aka_siswa s 
									left JOIN pus_peminjaman pj ON pj.member = s.replid 
								WHERE
									pj.mtipe = 1 AND
									s.aktif != 2 
								GROUP BY
									s.replid';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='siswa';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum	= mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_array($result)){	
								$out.= '<tr>
											<td>'.$res['nis'].'</td>
											<td>'.$res['nama'].'</td>
											<td>'.$res['borrowing'].'</td>
											<td>'.$res['total'].'</td>
										</tr>';
								/*$totaset+=$res['aset'];	*/
								$nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						// $out.= '<tr class="info"><td colspan="10">'..'</td></tr>';
						#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break;
					// Siswa

					// Pegawai
					case 'pegawai':
						$nip     = isset($_POST['nipS'])?filter(trim($_POST['nipS'])):'';
						$pegawai = isset($_POST['pegawaiS'])?filter(trim($_POST['pegawaiS'])):'';
						// var_dump($k_grup);exit();
						$sql = 'SELECT
									s.nip,
									s.nama,(
											SELECT count(*)
											FROM
												pus_peminjaman pj
											where 
											mtipe = pj.mtipe and 
											member= s.id and 
											status=1
									)borrowing,(
										SELECT
											count(*)
										FROM
											pus_peminjaman pj
										WHERE
											mtipe = pj.mtipe and 
											member= s.id
									) total
								FROM
									hrd_karyawan s 
									left JOIN pus_peminjaman pj ON pj.member = s.id 
								WHERE
									pj.mtipe = 2 AND
									s.nip like "%'.$nip.'%" AND
									s.nama like "%'.$pegawai.'%"  
								GROUP BY
									s.id';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='pegawai';
						// $obj  = new pagination_class($sql,$starting,$recpage);
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;
						
						#ada data
						$jum     = mysql_num_rows($result);
						$out     ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_array($result)){	
								$out.= '<tr>
											<td>'.$res['nip'].'</td>
											<td>'.$res['nama'].'</td>
											<td>'.$res['borrowing'].'</td>
											<td>'.$res['total'].'</td>
										</tr>';
								$totaset+=$res['aset'];
								$nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan="9"><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						// $out.= '<tr class="info"><td colspan="10">'..'</td></tr>';
						#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break;
					// Pegawai

					// luar
					case 'luar':
						$idmember     = isset($_POST['idmemberS'])?filter(trim($_POST['idmemberS'])):'';
						$nama_luar    = isset($_POST['nama_luarS'])?filter(trim($_POST['nama_luarS'])):'';
						
						$sql = 'SELECT
									s.*,(
											SELECT count(*)
											FROM
												pus_peminjaman 
											where 
											mtipe = pj.mtipe and 
											member= s.replid and 
											status=1
									)borrowing,(
										SELECT
											count(*)
										FROM
											pus_peminjaman 
										WHERE
											mtipe = pj.mtipe and 
											member= s.replid
									) total
								FROM
									pus_member s 
									left JOIN pus_peminjaman pj ON pj.member = s.replid 
								WHERE
									pj.mtipe = 3 AND
									s.nid like "%'.$idmember.'%" AND
									s.nama like "%'.$nama_luar.'%"  
								GROUP BY
									s.replid';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage= 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='luar';
					 // $obj 	= new pagination_class($sql,$starting,$recpage);  // lawas
						$obj 	= new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);  //baru
						$result =$obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							// $nox 	= $starting+1;
							while($res = mysql_fetch_array($result)){	
								$btn ='<td>
											<button data-hint="ubah"  class="button" onclick="luarFR('.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="luarDel('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$out.= '<tr>
											<td>'.$res['nid'].'</td>
											<td>'.$res['nama'].'</td>
											<td>'.$res['kontak'].'</td>
											<td>'.$res['alamat'].'</td>
											<td>'.$res['borrowing'].'</td>
											<td>'.$res['total'].'</td>
											'.$btn.'
										</tr>';
								// $nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						// $out.= '<tr class="info"><td colspan="10">'..'</td></tr>';
						#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break;
					// luar
				}
			break; 
			// tampil ---------------------------------------------------------------------
			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s 		= 'pus_member set nid 	= "'.filter($_POST['idmemberTB']).'",
										nama   = "'.filter($_POST['namaTB']).'",
										kontak = "'.filter($_POST['kontakTB']).'",
										alamat = "'.filter($_POST['alamatTB']).'"';
				$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e 		= mysql_query($s2);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from pus_member where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT *
								from pus_member 
							WHERE 
							replid='.$_POST['replid'];
					// print_r($s);exit();
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status' =>$stat,
							'nid'    =>$r['nid'],
							'nama'   =>$r['nama'],
							'kontak' =>$r['kontak'],
							'alamat' =>$r['alamat']
						));
			break;
			// ambiledit -----------------------------------------------------------------
			
			// cmbjenisbuku ---------------------------------------------------------
			case 'cmbjenisbuku':
				$s	= ' SELECT *
						from '.$tb.'
						'.(isset($_POST['replid'])?'where replid ='.$_POST['replid']:'').'
						ORDER  BY kode asc';
				
				// $s	= ' SELECT kode,
				// 			   nama as jenisbuku,
				// 			   keterangan
				// 		from '.$tb.'
				// 		'.(isset($_POST['replid'])?'where replid ='.$_POST['replid']:'').'
				// 		ORDER  BY kode asc';
				// var_dump($s);
				$e  = mysql_query($s);
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
						}$ar = array('status'=>'sukses','nama'=>$dt);
					}
				}
				$out=json_encode($ar);
				// echo $out;
			break;
			// end of cmbjenisbuku ---------------------------------------------------------		

		}
	}
	echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>