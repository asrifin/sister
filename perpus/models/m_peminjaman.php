<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	//Note
	// pus_peminjaman
	// status = 1 Dipinjam, 0 tersedia 
	// mtipe  = 1 siswa, 2 guru, 3 member luar


	$mnu  = 'katalog';
	
	$tb   = 'pus_'.$mnu;

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
				$page       = $_GET['page']; // get the requested page
				$limit      = $_GET['rows']; // get how many rows we want to have into the grid
				$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
				$sord       = $_GET['sord']; // get the direction
				$searchTerm = $_GET['searchTerm'];
				$pinjamArr   = (isset($_GET['pinjamArr']) AND $_GET['pinjamArr']!='')?' AND tb.replid NOT IN ('.$_GET['pinjamArr'].')':''; 
				$kembaliArr   = (isset($_GET['kembaliArr']) AND $_GET['kembaliArr']!='')?' AND tb.replid NOT IN ('.$_GET['kembaliArr'].')':''; 

				if(isset($_GET['subaksi']) && $_GET['subaksi']=='pinjam'){
					$ss='SELECT *
							FROM(SELECT
										pus_katalog.replid,
										pus_buku.lokasi,
										pus_buku.barkode barkode,
										pus_katalog.judul judul
								FROM pus_katalog
								LEFT JOIN pus_buku ON pus_buku.katalog = pus_katalog.replid 
								LEFT JOIN pus_lokasi ON pus_lokasi.replid = pus_buku.lokasi
								WHERE pus_buku.status = 1
								)tb
								WHERE	tb.lokasi = '.$_GET['lokasi'].' AND (tb.barkode  LIKE "%'.$searchTerm.'%"
										OR tb.judul LIKE "%'.$searchTerm.'%")'.$pinjamArr;
						// var_dump($ss);exit()
						// print_r($_GET['lokasi']);exit();
				}elseif(isset($_GET['subaksi']) && $_GET['subaksi']=='kembali'){
					$ss='SELECT *
							FROM(SELECT
											    pj.replid,
	                                            pb.barkode barkode,                          
											    pk.judul judul
											FROM pus_peminjaman pj
											LEFT JOIN pus_buku pb ON pb.replid = pj.buku
											LEFT JOIN pus_katalog pk ON pk.replid = pb.katalog
										WHERE pj.status = 1
								)tb
								WHERE	tb.barkode  LIKE "%'.$searchTerm.'%"
										OR tb.judul LIKE "%'.$searchTerm.'%" '.$kembaliArr;

				}elseif(isset($_GET['subaksi']) && $_GET['subaksi']=='pilihan'){

					if (isset($_GET['tipe']) && $_GET['tipe']==1) {
						
						$ss='SELECT *
								FROM(SELECT
											replid,
											nis,
											namasiswa
										FROM
											psb_siswa
										WHERE
											replid
										AND `status` = 1
									)tb
									WHERE	tb.nis  LIKE "%'.$searchTerm.'%"
											OR tb.namasiswa LIKE "%'.$searchTerm.'%" ';
					}
					if (isset($_GET['tipe']) && $_GET['tipe']==2) {
						
						$ss='SELECT *
								FROM(SELECT
											id,
											nip,
											nama
										FROM
											hrd_karyawan
									)tb
									WHERE	tb.nip  LIKE "%'.$searchTerm.'%"
											OR tb.nama LIKE "%'.$searchTerm.'%" ';
					}
					if (isset($_GET['tipe']) && $_GET['tipe']==3) {
						
						$ss='SELECT *
								FROM(SELECT
											replid,
											nid,
											nama
										FROM
											pus_member
									)tb
									WHERE	tb.nid  LIKE "%'.$searchTerm.'%"
											OR tb.nama LIKE "%'.$searchTerm.'%" ';
						}

				}
				if(!$sidx) 
					$sidx =1;
				print_r($ss);exit();
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
				// print_r($ss);exit();
				$result = mysql_query($ss) or die("Couldn t execute query.".mysql_error());
				$rows 	= array();
				while($row = mysql_fetch_assoc($result)) {
					if ($_GET['subaksi']=='pinjam' || $_GET['subaksi']=='kembali') {
						$rows[]= array(
							'replid'  =>$row['replid'],
							'barkode' =>$row['barkode'],
							'judul'   =>$row['judul']
						);
					}				
					elseif ($_GET['subaksi']=='pilihan') {

						if ($_GET['tipe']==1) {
							$rows[]= array(
								'replid'     =>$row['replid'],
								'nis'        =>$row['nis'],
								'nama'       =>$row['nama'],
								// 'departemen' =>$row['departemen'],
								// 'tingkat'    =>$row['tingkat'],
								// 'kelas'      =>$row['kelas']
							);
						}
						elseif($_GET['tipe']==2) {
							$rows[]= array(
								'id' =>$row['id'],
								'nip'    =>$row['nip'],
								'nama'   =>$row['nama']
							);
						}
						elseif($_GET['tipe']==3) {
							$rows[]= array(
								'replid' =>$row['replid'],
								'nid'    =>$row['nid'],
								'nama'   =>$row['nama']
							);
						}
					}				
				}$response=array(
					'page'    =>$page,
					'total'   =>$total_pages,
					'records' =>$count,
					'rows'    =>$rows,
				);
			$out=json_encode($response);
		}else{
			$out=json_encode(array('status'=>'invalid_no_post'));	
		}
	}else{
		switch ($_POST['aksi']) {
			// tampil ---------------------------------------------------------------------
			case 'tampil':
				switch ($_POST['subaksi']) {
					case 'sirkulasi':
						// $member  = isset($_POST['memberS'])?filter(trim($_POST['memberS'])):'';
						$member =  $_POST['memberS']!=''?' pj.mtipe='.filter($_POST['memberS']).' AND ':'';
						$barkode = isset($_POST['barkodeS'])?filter(trim($_POST['barkodeS'])):'';
						$judul   = isset($_POST['judulS'])?filter(trim($_POST['judulS'])):'';
						$tgl1   = isset($_POST['tgl1TB'])?tgl_indo6($_POST['tgl1TB']):'';
						$tgl2   = isset($_POST['tgl2TB'])?tgl_indo6($_POST['tgl2TB']):'';

						$sql       = 'SELECT
											tanggal1 tgl_pinjam,
										    tanggal2 pengembalian,
										    tanggal3 dikembalikan,
										    pb.barkode,
										    pk.judul,
										    a.nis nis,
										    a.nama siswa,
										    hk.nip,
										    hk.nama pegawai,
										    pm.nid idmember,
										    pm.nama member
										FROM pus_peminjaman pj
										LEFT JOIN aka_siswa a ON a.replid = pj.mtipe
										LEFT JOIN aka_guru ag ON ag.replid = pj.mtipe 
										LEFT JOIN hrd_karyawan hk ON hk.id = ag.pegawai
										LEFT JOIN pus_member pm ON pm.replid = pj.mtipe 
										LEFT JOIN pus_buku pb ON pb.replid = pj.buku
										LEFT JOIN pus_katalog pk ON pk.replid = pb.katalog
									WHERE 
										'.$member.'
										judul like "%'.$judul.'%" AND
										barkode like "%'.$barkode.'%" AND
										pj.tanggal1 between "'.$tgl1.'" AND "'.$tgl2.'" 

										';
										// tgl_pinjam between "'.tgl_indo6($_POST['tgl1TB']).'" AND "'.tgl_indo6($_POST['tgl2TB']).'" 
						// print_r($sql);exit();
						// var_dump($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='sirkulasi';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_array($result)){	
								$tipe = isset($res['mtipe']);
								if ($tipe==1) {
									$anggota = $res['siswa'].'<br>NIS :'.$res['nis'];
								}elseif ($tipe==2) {
									$anggota = $res['pegawai'].'<br>NIP :'.$res['nip'];
								}else{
									$anggota = $res['pegawai'].'<br>No ID :'.$res['idmember'];
								}
								$tgl2 = isset($res['pengembalian'])?tgl_indo6($res['pengembalian']):'';
								$tgl3 = isset($res['dikembalikan'])?tgl_indo6($res['dikembalikan']):' ';
						
									// var_dump($res);exit();
								//tgl pengembalian
								$tgl_pengembalian=fftgl($tgl2); 

								if($res['status']!=0){
									$lewat=diffDay($res['pengembalian']);
									if($lewat<0 && $res['status']!=0){
										$tgl_pengembalian='<span style="color:red">'.$tgl_pengembalian.'</span>';
									}
								} else {
									$telat=diffDay($tgl3,$tgl2);
									// if($telat>0)$telat='<br/><span style="color:#ff9000">Terlambat: '.$telat.' hari</span>';
									// else $telat="";
								}
								// //tgl dikembalikan
								if(isset($res['telat'])>0){
									$tgl_dikembalikan='<span style="color:red">'.fftgl($tgl3).'</span>';
								} else {
									$tgl_dikembalikan=fftgl($tgl3);
								}

								// if ($res['status']==1) {
									$btn = '<td>
											<button data-hint="ubah"  class="button" onclick="kembalikan('.isset($res['replid']).');">
												<i class="icon-enter on-left"></i>
											</button>
											</td>';
								// }else{
								// 	$btn ='<td>&nbsp</td>';
								// }
								$terlambat = isset($res['telat']);
								$out.= '<tr>
											<td>'.tgl_indo($res['tgl_pinjam']).'</td>
											<td>'.$anggota.'</td>
											<td>'.$res['barkode'].'</td>
											<td>'.$res['judul'].'</td>
											<td>'.tgl_indo6($tgl_pengembalian).'</td>
											<td>'.tgl_indo6($tgl_dikembalikan).'</td>
											<td>'.($terlambat==0?'-':$res['telat'].' hari').'</td> 
											<td>&nbsp</td>
											'.$btn.'
										</tr>';
											// <td>'.$res['status'].'</td>
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=10 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						#link paging
						$out.= '<tr class="info"><td colspan=10>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=10>'.$obj->total.'</td></tr>';
											// <td style="display:visible;" class="uraianCOL">'.$tb2.'</td>
											// '.$btn.'
					break;

					case 'statistik':
						$judul       = isset($_POST['judulS'])?filter(trim($_POST['judulS'])):'';
						$klasifikasi = isset($_POST['klasifikasiS'])?filter(trim($_POST['klasifikasiS'])):'';
						$pengarang   = isset($_POST['pengarangS'])?filter(trim($_POST['pengarangS'])):'';
						$penerbit    = isset($_POST['penerbitS'])?filter(trim($_POST['penerbitS'])):'';
						$tgl1        = isset($_POST['s_tgl1TB'])?filter(trim($_POST['s_tgl1TB'])):'';
						$tgl2        = isset($_POST['s_tgl2TB'])?filter(trim($_POST['s_tgl2TB'])):'';
						$lokasi      = isset($_POST['lokasiS'])?filter(trim($_POST['lokasiS'])):'';
						$statistik   = isset($_POST['statistikS'])?filter(trim($_POST['statistikS'])):'';

						$sql       = 'SELECT 
			       							pj.replid as replid,
											k.judul AS judul,
											l.nama AS klasifikasi, 
											r.nama AS penerbit, 
											p.nama2 AS pengarang,
											(SELECT count(*)
												FROM pus_peminjaman 
												WHERE 
												buku=b.replid AND
												status=1) dipinjam
									FROM pus_peminjaman pj
                                    LEFT JOIN pus_buku b ON b.replid=pj.buku
                                    LEFT JOIN pus_lokasi pl ON pl.replid = b.lokasi
									LEFT JOIN pus_katalog k on k.replid=b.katalog
									LEFT JOIN pus_tingkatbuku t on t.replid=b.tingkatbuku
									LEFT JOIN pus_klasifikasi l on l.replid=k.klasifikasi
									LEFT JOIN pus_pengarang p on p.replid=k.pengarang
									LEFT JOIN pus_penerbit r on r.replid=k.penerbit
									LEFT JOIN pus_jenisbuku u on u.replid=k.jenisbuku

									WHERE 
										pj.status = 1 AND
										pj.tanggal1 >= "%'.$tgl1.'" AND
										pj.tanggal2 <= "%'.$tgl2.'" AND
										b.lokasi = "%'.$lokasi.'%" AND
										k.judul like "%'.$judul.'%" OR
										r.nama like "%'.$penerbit.'%" OR
										p.nama like "%'.$pengarang.'%" OR
										l.nama like "%'.$klasifikasi.'%"';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='statistik';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_array($result)){	
								// $btn ='<td>
								// 			<button data-hint="ubah"  class="button" onclick="juFR('.$res['replid'].');">
								// 				<i class="icon-pencil on-left"></i>
								// 			</button>
								// 			<button data-hint="hapus"  class="button" onclick="grupDel('.$res['replid'].');">
								// 				<i class="icon-remove on-left"></i>
								// 		 </td>';
								
								$out.= '<tr>
											<td>'.$res['judul'].'</td>
											<td>'.$res['klasifikasi'].'</td>
											<td>'.$res['pengarang'].'</td>
											<td>'.$res['penerbit'].'</td>
											<td>'.$res['dipinjam'].'</td>
										</tr>';
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=10 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						#link paging
						$out.= '<tr class="info"><td colspan=10>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=10>'.$obj->total.'</td></tr>';
											// <td style="display:visible;" class="uraianCOL">'.$tb2.'</td>
											// '.$btn.'
					break;				}
			break; 
			// tampil ---------------------------------------------------------------------

			// head info ------------------------------------------------------------------
			case 'headinfo':
				switch ($_POST['subaksi']) {
					case 'katalog':
						$s = 'SELECT 
								g.nama as grup,
								l.nama as lokasi,
								sum(b.harga)as totaset
							  FROM 
							  	'.$tb4.' b,
							  	'.$tb3.' k,
							  	'.$tb2.' l,
							  	'.$tb.' g
							  WHERE 
								g.replid  = '.$_POST['grup'].' and 
								b.katalog = k.replid and
								g.lokasi  = l.replid and
								g.replid  = k.grup';
						$q    = mysql_query($s);
						$stat = ($q)?'sukses':'gagal';
						$r    = mysql_fetch_assoc($q);
						$out  = json_encode(array(
									'status'  =>$stat,
									'grup'    =>$r['grup'],
									'lokasi'  =>$r['lokasi'],
									'totaset' =>number_format($r['totaset'])
								));
					break;

				}
			break;
			// head info ------------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				switch ($_POST['subaksi']) {
					case 'ju':
						$s 		= $tb.' set 	nomer   = "'.$_POST['ju_nomerTB'].'",
												nobukti = "'.filter($_POST['ju_nobuktiTB']).'",
												uraian  = "'.filter($_POST['ju_uraianTB']).'",
												tanggal = "'.tgl_indo6($_POST['ju_tanggalTB']).'"';
						$s  = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						var_dump($s);exit();
						// $e  = mysql_query($s);
						// $id =mysql_insert_id();
						// if(!$e){
						// 	$stat='gagal_'.mysql_error();
						// }else{
							if(isset($_POST['ju_rekTB'])){
								// var_dump(count($_POST['ju_rekTB']));
								// var_dump($_POST['ju_rekTB']);
								// $s2	= 'keu_jurnal set 	transaksi = '.$id.',
								// 						rek       = '.$_POST['ju_rekTB'].',
								// 						debet     = '.$_POST['ju_debetTB'].',
								// 						kredit    = '.$_POST['ju_kreditTB'];
								// $s2 = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
							}
						// }
						// $stat 	= ($e)?'sukses':'gagal';
						// $out 	= json_encode(array('status'=>$stat));
					break;

					case 'barang':
						$s 		= $tb4.' set 	katalog    = "'.$_POST['b_katalogH2'].'",
												tempat     = "'.$_POST['b_tempatTB'].'",
												sumber     = "'.$_POST['b_sumberTB'].'",
												harga      = "'.getuang($_POST['b_hargaTB']).'",
												kondisi    = "'.$_POST['b_kondisiTB'].'",
												keterangan = "'.filter($_POST['b_keteranganTB']).'"';
						$stat = true;
						if(!isset($_POST['replid'])){ //add
							if(isset($_POST['b_jumbarangTB']) and $_POST['b_jumbarangTB']>1){ //  lebih dr 1 unit barang
								for($i=0; $i<($_POST['b_jumbarangTB']); $i++) { // iterasi sbnyak jum barang 
									$s2 ='INSERT INTO '.$s.', urut='.($_POST['b_urutH']+$i);
									// var_dump($s2);exit();
									$e  = mysql_query($s2);
									if(!$e)$stat=false;
								}
							}else{ // 1 unit barang
								$s2='INSERT INTO '.$s.', urut='.$_POST['b_urutH'];
								// var_dump($s2);exit();
								$e=mysql_query($s2);
								if(!$e)$stat=false;  
							// var_dump($e);exit();
							}
						}else{ //edit
							$s2 = 'UPDATE '.$s.', urut='.$_POST['b_urutH'].' WHERE replid='.$_POST['replid'];
							// var_dump($s2);exit();
							$e  = mysql_query($s2);
							if(!$e)$stat=false;  
						}
						$out 	= json_encode(array('status'=>($stat?'sukses':'gagal')));
					break;
				}
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete ---------------------------------------------------------------------
			case 'hapus':
				switch ($_POST['subaksi']) {
					case 'grup':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
					break;

					case 'katalog':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb3.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb3.' WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
					break;

					case 'barang':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb4.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb4.' WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['kode']));
					break;
				}
			break;
			// delete ---------------------------------------------------------------------

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				switch ($_POST['subaksi']) {
					case 'kembalikan';
						$s = 'SELECT
											pj.replid as replid,
											tanggal1 tgl_pinjam,
										    tanggal2 pengembalian,
										    tanggal3 dikembalikan,
										    pb.barkode,
										    pk.judul,
										    a.nis nis,
										    a.nama siswa,
										    hk.nip,
										    hk.nama pegawai,
										    pm.nid idmember,
										    pm.nama member,
										    if(pj.status = 1,"Dipinjam", "Dikembalikan") status
										FROM pus_peminjaman pj
										LEFT JOIN aka_siswa a ON a.replid = pj.mtipe
										LEFT JOIN aka_guru ag ON ag.replid = pj.mtipe 
										LEFT JOIN hrd_karyawan hk ON hk.id = ag.pegawai
										LEFT JOIN pus_member pm ON pm.replid = pj.mtipe 
										LEFT JOIN pus_buku pb ON pb.replid = pj.buku
										LEFT JOIN pus_katalog pk ON pk.replid = pb.katalog
									WHERE 
										pj.replid ';
						// var_dump($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array(
									'status' =>$stat,
									'datax'  =>array(
										'judul'   =>$r['judul'],
										'barkode' =>$r['barkode']
								)));					
					break;

					case 'katalog';
						$s = '	SELECT
									k.kode,
									k.nama,
									k.jenis,
									k.photo2,
									k.susut,
									k.keterangan,
									l.nama as lokasi, 
									g.nama as grup
								FROM 
									'.$tb3.' k,
									 '.$tb2.' l,
									 '.$tb.' g
								WHERE 
									g.replid = k.grup and 
									l.replid = g.lokasi and 
									k.replid ='.$_POST['replid'];
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						if(!$e){
							$stat ='gagal';
						}else{
							$stat ='sukses';
							$dt   =array(
										'kode'       =>$r['kode'],
										'nama'       =>$r['nama'],
										'susut'      =>$r['susut'],
										'lokasi'     =>$r['lokasi'],
										'grup'       =>$r['grup'],
										'photo2'     =>$r['photo2'],
										'jenis'      =>$r['jenis'],
										'keterangan' =>$r['keterangan']
									);						
						}$out 	= json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));					
					break;

					case 'barang';
						$s ='SELECT
								b.tempat,
								LPAD(b.urut,5,0) as barkode,(
									SELECT 
										CONCAT(ll.kode,"/",gg.kode,"/",tt.kode,"/",kk.kode,"/",LPAD(b.urut,5,0))
									from 
										sar_katalog kk,
										sar_grup gg,
										sar_tempat tt,
										sar_lokasi ll
									where 
										kk.replid = b.katalog AND
										kk.grup   = gg.replid AND
										b.tempat  = tt.replid AND
										tt.lokasi = ll.replid
								)as kode,
								b.harga,
								b.urut,
								b.kondisi,
								b.sumber,
								b.keterangan
							FROM
								sar_barang b, sar_kondisi k
							WHERE
								b.kondisi = k.replid and
								b.replid  = '.$_POST['replid'];
						// print_r($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						if(!$e){
							$stat ='gagal';
						}else{
							$stat ='sukses';
							$dt   =array(
										'tempat'     =>$r['tempat'],
										'barkode'    =>$r['barkode'],
										'urut'       =>$r['urut'],
										'kode'       =>$r['kode'],
										'harga'      =>$r['harga'],
										'kondisi'    =>$r['kondisi'],
										'sumber'     =>$r['sumber'],
										'keterangan' =>$r['keterangan']
									);						
						}$out 	= json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));					
					break;
				}
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
			}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>