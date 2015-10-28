<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu  = 'katalog';
	$mnu2 = 'klasifikasi';
	$mnu3 = 'pengarang';
	$mnu4 = 'penerbit';
	$tb   = 'pus_'.$mnu;
	$tb2  = 'pus_'.$mnu2;
	$tb3  = 'pus_'.$mnu3;
	$tb4  = 'pus_'.$mnu4;
	$tb5  = 'pus_bahasa';
	$tb6  = 'pus_jenisbuku';

	if(!isset($_POST['aksi'])){
		if(isset($_GET['upload'])){
			$tipex    = substr($_FILES[0]['type'],6);
			$namaAwal = $_FILES[0]['name'];
			$namaSkrg = $_SESSION['id_loginS'].'_'.substr((md5($namaAwal.rand())),2,10).'.'.$tipex;
			$src      = $_FILES[0]['tmp_name'];
			$destix   = '../img/upload/'.basename($namaSkrg);

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
			if(isset($_GET['subaksi']) && $_GET['subaksi']=='penerbit'){
				$table = 'pus_penerbit';
				$where = 'nama LIKE "%'.$searchTerm.'%"';
			}elseif (isset($_GET['subaksi']) && $_GET['subaksi']=='klasifikasi') {
				$table = 'pus_klasifikasi';
				$where = 'kode LIKE "%'.$searchTerm.'%" OR nama LIKE "%'.$searchTerm.'%"';
			}
			else{
				$table = 'pus_pengarang';
				$where = 'nama LIKE "%'.$searchTerm.'%"';
			}

			$ss='SELECT
					*
				FROM
					'.$table.'
				WHERE
					'.$where;
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
			// if ($_GET['pengarang'] == 'pus_pengarang'){
			// 	$f = $row['replid'] AND
			// 		  $row['nama'];
			// }elseif ($_GET['klasifikasi'] == 'pus_klasifikasi') {
			// 	$f = $row['replid'] AND 
			// 		  $row['kode'] AND
			// 		  $row['nama'];
			// }
			// else{
			// 	$f = $row['replid'] AND
			// 		  $row['nama'];				
			// }
				$kode = (isset($_GET['subaksi']) and $_GET['subaksi']=='klasifikasi')?$row['kode']:'';
				$rows[]= array(
					'replid' =>$row['replid'], /*epiii*/
					'nama'   =>$row['nama'], /*epiii*/
					'kode'	 =>$kode
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
				$judul            = isset($_POST['judulS'])?filter($_POST['judulS']):'';
				$kode_klasifikasi = isset($_POST['kode_klasifikasiS'])?filter($_POST['kode_klasifikasiS']):'';
				$pengarang        = isset($_POST['pengarangS'])?filter($_POST['pengarangS']):'';
				$penerbit         = isset($_POST['penerbitS'])?filter($_POST['penerbitS']):'';
				
				$sql = 'SELECT  pkat.replid as replid,
								pkat.judul,
								pkat.callnumber,
								pkas.kode as kode_klas,
								pkas.nama as klas,
								pg.nama as pengarang,
								pn.nama as penerbit,
								 (SELECT count(*) from pus_buku where katalog=pkat.replid)jum
								FROM pus_katalog pkat 
								LEFT JOIN pus_klasifikasi pkas ON pkat.klasifikasi = pkas.replid 
								LEFT JOIN pus_pengarang pg ON pkat.pengarang = pg.replid
								LEFT JOIN pus_penerbit pn ON pkat.penerbit = pn.replid
								LEFT JOIN pus_buku pb ON pb.katalog = pkat.replid	
						WHERE 
							pkat.judul like "%'.$judul.'%" and
							pkas.nama like "%'.$kode_klasifikasi.'%" and					
							pg.nama like "%'.$pengarang.'%" and					
							penerbit like "%'.$penerbit.'%"						
						GROUP BY
							pkat.replid						
							ORDER BY pkat.replid asc';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage= 5;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
				$obj 	= new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);

				// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
				// $obj 	= new pagination_class($sql,$starting,$recpage);
				$result =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_array($result)){	
						if($res['aktif']=1){
							$dis  = 'disabled';
							$ico  = 'checkmark';
							$hint = 'telah Aktif';
							$func = '';
						}else{
							$dis  = '';
							$ico  = 'blocked';
							$hint = 'Aktifkan';
							$func = 'onclick="aktifkan('.$res['replid'].');"';
						}
						
						$btn ='<td>
									<button data-hint="Lihat Katalog"  onclick="k_view('.$res['replid'].');">
										<i class="icon-zoom-in on-left"></i>
									</button>
									<button data-hint="Ubah"  onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
									<button data-hint="Tambah Koleksi"  onclick="koleksiFR('.$res['replid'].');">
										<i class="icon-plus-2 on-left"></i> Koleksi
									</button>
								 </td>';
						$out.= '<tr>
									<td id="'.$mnu.'TD_'.$res['replid'].'">'.$res['judul'].'</td>									
									<td>['.$res['kode_klas'].'] '.$res['klas'].'</td>
									<td>'.$res['pengarang'].'</td>
									<td>'.$res['penerbit'].'</td>
									<td>'.$res['callnumber'].'</td>
									<td>'.$res['jum'].'</td>
									'.$btn.'
								</tr>';
						$nox++;
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan=10 ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.= '<tr class="info"><td colspan=10>'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan=10>'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

				// add / edit -----------------------------------------------------------------
			case 'simpan':
			// echo "string"; exit();
				switch ($_POST['subaksi']) {
					case 'klasifikasi':
						$s 		= $tb2.' set 	kode 		= "'.filter($_POST['kode_klasifikasiTB']).'",
												nama 		= "'.filter($_POST['nama_klasifikasiTB']).'",
												keterangan 	= "'.filter($_POST['ket_klasifikasiTB']).'"';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						// var_dump($s2);exit();
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;

					case 'pengarang':
						$s 		= $tb3.' set 	nama 		= "'.filter($_POST['nama_pengarangTB']).'",
												nama2 		= "'.filter($_POST['nama_kutipanTB']).'",
												keterangan 	= "'.filter($_POST['ket_pengarangTB']).'"';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						// var_dump($s2);exit();
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;

					case 'penerbit':
						$s 		= $tb4.' set 	nama 		= "'.filter($_POST['nama_penerbitTB']).'",
												keterangan 	= "'.filter($_POST['ket_penerbitTB']).'"';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						// var_dump($s2);exit();
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;

					case 'bahasa':
						$s 		= $tb5.' set 	kode 		= "'.filter($_POST['kode_bahasaTB']).'",
												nama 		= "'.filter($_POST['nama_bahasaTB']).'",
												keterangan 	= "'.filter($_POST['ket_bahasaTB']).'"';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						// var_dump($s2);exit();
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;

					case 'jenisbuku':
						$s 		= $tb6.' set 	kode 		= "'.filter($_POST['kode_jenisTB']).'",
												nama 		= "'.filter($_POST['nama_jenisTB']).'",
												keterangan 	= "'.filter($_POST['ket_jenisTB']).'"';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						// var_dump($s2);exit();
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;

					case 'koleksi':
						$s 		= 'pus_buku set 	
												katalog      = "'.filter($_POST['idbukuH']).'",
												idbuku      = "'.filter($_POST['idbukuTB']).'",
												barkode     = "'.filter($_POST['barcodeTB']).'",
												sumber      = "'.filter($_POST['sumberTB']).'",
												harga       = "'.filter($_POST['hargaTB']).'",
												tanggal     = "'.filter($_POST['tglTB']).'",
												lokasi      = "'.filter($_POST['lokasiTB']).'",
												tingkatbuku = "'.filter($_POST['tingkatTB']).'"';
						$stat = true;
						if(!isset($_POST['replid'])){ //add
							if(isset($_POST['jml_koleksiTB']) and $_POST['jml_koleksiTB']>1){ //  lebih dr 1 unit barang
								for($i=0; $i<($_POST['jml_koleksiTB']); $i++) { // iterasi sbnyak jum barang 
									$s2 ='INSERT INTO '.$s.', urut='.($_POST['idbukuH']+$i);
									// var_dump($s2);exit();
									$e  = mysql_query($s2);
									if(!$e)$stat=false;
								}
							}else{ // 1 unit barang
								$s2='INSERT INTO '.$s.', urut='.$_POST['idbukuH'];
								// var_dump($s2);exit();
								$e=mysql_query($s2);
								if(!$e)$stat=false;  
							// var_dump($e);exit();
							}
						}else{ //edit
							$s2 = 'UPDATE '.$s.', urut='.$_POST['idbukuH'].' WHERE replid='.$_POST['replid'];
							// var_dump($s2);exit();
							$e  = mysql_query($s2);
							if(!$e)$stat=false;  
						}
					break;

					case 'katalog':
						$s 		= $tb.' set 	judul 			 = "'.$_POST['judulTB'].'",
												klasifikasi_kode = "'.filter($_POST['klasifikasiTB']).'",
												klasifikasi      = "'.filter($_POST['klasifikasi_selectH']).'",
												pengarang      = "'.filter($_POST['pengarang_autoH']).'",
												callnumber       = "'.$_POST['callnumberTB'].'",
												penerjemah       = "'.filter($_POST['penerjemahTB']).'",
												editor           = "'.filter($_POST['editorTB']).'",
												penerbit         = "'.filter($_POST['penerbit_autoH']).'",
												tahunterbit      = "'.filter($_POST['tahun_terbitTB']).'",
												kota             = "'.filter($_POST['kotaTB']).'",
												isbn             = "'.filter($_POST['isbnTB']).'",
												issn             = "'.filter($_POST['issnTB']).'",
												bahasa           = "'.filter($_POST['bahasaTB']).'",
												seri             = "'.filter($_POST['seri_bukuTB']).'",
												volume           = "'.filter($_POST['volumeTB']).'",
												edisi            = "'.filter($_POST['edisiTB']).'",
												jenisbuku        = "'.filter($_POST['jenis_bukuTB']).'",
												halaman          = "'.filter($_POST['jumlahTB']).'",
												dimensi          = "'.filter($_POST['dimensiTB']).'",
												deskripsi        = "'.filter($_POST['sinopsisTB']).'"
												'.(isset($_POST['file'])?', photo2 = "'.$_POST['file'].'"':'');
														// print_r($s);exit();

						$stat2=true;
						if(!isset($_POST['replid'])){ //add
							$s2 = 'INSERT INTO '.$s;
						}else{ //edit
							$s2 = 'UPDATE '.$s.' WHERE replid='.$_POST['replid'];
							if(isset($_POST['photo_asal'])){ //change image
								$img='../img/upload/'.$_POST['photo_asal'];
								if(file_exists($img)){ //checking image is exist
									$delimg = unlink($img);
									$stat2  = !$delimg?false:true;
								}
							}
						}
						if(!$stat2){// gagal hapus
							$stat='gagal_hapus_file';
						}else{ //sukses hapus file
							$e  = mysql_query($s2);
							$id ='';
							if (!isset($_POST['replid'])) {
								$id   = mysql_insert_id();
							}
							// var_dump($id);exit();
							$stat = $e?'sukses':'gagal_simpan_db';
						}$out  = json_encode(array('status'=>$stat,'id'=>$id));
					break;

				}
			break;
			// add / edit -----------------------------------------------------------------
		
			// delete -----------------------------------------------------------------
			case 'hapus':
				switch ($_POST['subaksi']) {
					case 'katalog':
							$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
							$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
							$e    = mysql_query($s);
							$stat = ($e)?'sukses':'gagal';
							$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
						break;
					
					case 'koleksi':
							$d    = mysql_fetch_assoc(mysql_query('SELECT * from pus_buku where replid='.$_POST['replid']));
							$s    = 'DELETE from pus_buku WHERE replid='.$_POST['replid'];
							$e    = mysql_query($s);
							$stat = ($e)?'sukses':'gagal';
							$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
						break;
				}
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				switch ($_POST['subaksi']) {
					case 'katalog':
						$s 		= ' SELECT
		                          kg.judul,
		                          kf.kode kode_klas,
		                          kf.replid as idklasifikasi,
		                          kf.nama klasifikasi,
		                          pr.replid idpengarang,
		                          pr.nama pengarang,
		                          pb.replid idpenerbit,
		                          pb.nama penerbit,
		                          kg.editor,
		                          kg.photo2,
		                          kg.tahunterbit,
		                          kg.kota,
		                          kg.isbn,
		                          kg.issn,
		                          kg.penerjemah,
		                          kg.seri,
		                          kg.edisi,
		                          kg.volume,
		                          kg.halaman,
								  kg.bahasa,
								  kg.jenisbuku,
		                          kg.callnumber,
		                          kg.dimensi,
		                          kg.deskripsi
		                          -- (SELECT count(*) from pus_buku where katalog=kg.replid)jum
		                        FROM
		                          pus_katalog kg
		                          LEFT JOIN pus_pengarang pr ON pr.replid = kg.pengarang
		                          LEFT JOIN pus_penerbit pb ON pb.replid = kg.penerbit
		                          LEFT JOIN pus_klasifikasi kf ON kf.replid = kg.klasifikasi
		                        WHERE 
		                          kg.replid = '.$_POST['replid'].'
		                        order BY
		                          kg.judul asc';
											// print_r($s);exit();
						$e 		= mysql_query($s) or die(mysql_error());
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out    = json_encode(array(
									'status'      	=>$stat,
									'judul'         =>$r['judul'],
									'kode_klas'     =>$r['kode_klas'],
									'idklasifikasi' =>$r['idklasifikasi'],
									'klasifikasi'   =>$r['klasifikasi'],
									'idpengarang'   =>$r['idpengarang'],
									'pengarang'     =>$r['pengarang'],
									'callnumber'    =>$r['callnumber'],
									'penerjemah'    =>$r['penerjemah'],
									'editor'        =>$r['editor'],
									'photo2'        =>$r['photo2'],
									'idpenerbit'    =>$r['idpenerbit'],
									'penerbit'      =>$r['penerbit'],
									'tahunterbit'   =>$r['tahunterbit'],
									'kota'          =>$r['kota'],
									'isbn'          =>$r['isbn'],
									'issn'          =>$r['issn'],
									'bahasa'        =>$r['bahasa'],
									'seri'          =>$r['seri'],
									'volume'        =>$r['volume'],
									'edisi'         =>$r['edisi'],
									'jenisbuku'     =>$r['jenisbuku'],
									'halaman'       =>$r['halaman'],
									'dimensi'       =>$r['dimensi'],
									'deskripsi'     =>$r['deskripsi']			
								));

					break;

					case 'k_detail':						
						$s   = ' SELECT
								  kg.replid as replid,
		                          kg.judul,
		                          kf.kode kode_klas,
		                          kf.nama klasifikasi,
		                          pr.nama pengarang,
		                          pb.nama penerbit,
		                          kg.editor,
		                          kg.photo2,
		                          kg.tahunterbit,
		                          kg.kota,
		                          kg.isbn,
		                          kg.issn,
		                          kg.penerjemah,
		                          kg.seri,
		                          kg.edisi,
		                          kg.volume,
		                          kg.halaman,
								  b.nama bahasa,
								  pj.nama jenisbuku,
		                          kg.callnumber,
		                          kg.dimensi,
		                          kg.deskripsi
		                        FROM
		                          pus_katalog kg
		                          LEFT JOIN pus_pengarang pr ON pr.replid = kg.pengarang
		                          LEFT JOIN pus_penerbit pb ON pb.replid = kg.penerbit
		                          LEFT JOIN pus_klasifikasi kf ON kf.replid = kg.klasifikasi
				                  LEFT JOIN pus_bahasa b ON b.replid = kg.bahasa
				                  LEFT JOIN pus_jenisbuku pj ON pj.replid = kg.jenisbuku
		                        WHERE 
		                          kg.replid = '.$_POST['replid'].'
		                        order BY
		                          kg.judul asc';
						// print_r($s);exit();
						$e   = mysql_query($s);
						$r   = mysql_fetch_assoc($e);
						$barangArr=array();
						if(!$e){ 
							$stat='gagal_view';
						}else{
							$s2 = 'SELECT
				                          kg.replid as replid,
				                          kg.judul,
										  LPAD(pb.idbuku,18,0)as idbuku,
										  pb.barkode,
										  pb.harga,
										  pb.tanggal,
										  pl.nama lokasi,
										  pt.nama tingkatbuku,
										  if(pb.sumber=0,"Beli","Pemberian") as sumber,
				                          kg.callnumber,
							 			  if(pb.status=1,"Tersedia","Dipinjam") as statusbuku, 
				                          kg.dimensi,
				                          kg.deskripsi, 
				                          (SELECT count(*) from pus_buku where katalog=kg.replid) as jum
				                        FROM
				                          pus_buku pb
				                          LEFT JOIN pus_katalog kg ON kg.replid = pb.katalog
				                          LEFT JOIN pus_tingkatbuku pt ON pt.replid = pb.tingkatbuku
				                          LEFT JOIN pus_lokasi pl ON pl.replid = pb.lokasi
				                          LEFT JOIN pus_klasifikasi kf ON kf.replid = kg.klasifikasi
				                        WHERE
				                        	kg.replid = '.$_POST['replid'].'
				                        order BY
				                          kg.replid asc';
							// var_dump($s2);exit();
							$e2 = mysql_query($s2);
							if(!$e2){
								$stat=mysql_error();
							}else{
								while ($r2=mysql_fetch_assoc($e2)) {
									$barangArr[]=array(
											'barkode'     =>$r2['barkode'],		
											'idbuku'      =>$r2['idbuku'],	
											'sumber'      =>$r2['sumber'],		
											'harga'       =>$r2['harga'],		
											'tanggal'     =>$r2['tanggal'],		
											'statusbuku'  =>$r2['statusbuku'],		
											'lokasi'      =>$r2['lokasi'],		
											'tingkatbuku' =>$r2['tingkatbuku']	
										);
								}$stat='sukses';
							}
						}
						$out = json_encode(array(
									'status' =>$stat,
									'data'   =>array(
										'replid'      =>$r['replid'],
										'judul'       =>$r['judul'],
										'kode_klas'   =>$r['kode_klas'],
										'klasifikasi' =>$r['klasifikasi'],
										'pengarang'   =>$r['pengarang'],
										'callnumber'  =>$r['callnumber'],
										'penerjemah'  =>$r['penerjemah'],
										'editor'      =>$r['editor'],
										'penerbit'    =>$r['penerbit'],
										'tahunterbit' =>$r['tahunterbit'],
										'kota'        =>$r['kota'],
										'isbn'        =>$r['isbn'],
										'issn'        =>$r['issn'],
										'bahasa'      =>$r['bahasa'],
										'seri'        =>$r['seri'],
										'volume'      =>$r['volume'],
										'edisi'       =>$r['edisi'],
										'jenisbuku'   =>$r['jenisbuku'],
										'halaman'     =>$r['halaman'],
										'dimensi'     =>$r['dimensi'],
										'deskripsi'   =>$r['deskripsi'],		
										'barangArr'   =>$barangArr
								)));					
					break;							

					case 'koleksi':
						$s 		= ' SELECT
				                          kg.replid as replid,
				                          kg.judul,
										  LPAD(pb.idbuku,18,0)as kode,
										  pb.barkode,
										  pb.harga,
										  pb.tanggal,
										  pb.lokasi,
										  pb.tingkatbuku,
										  pb.sumber,
										  --if(pb.sumber=0,"Beli","Pemberian") as sumber,
										  pj.nama jenisbuku,
				                          kg.callnumber,
				                          kg.dimensi,
				                          kg.deskripsi, 
				                          (SELECT count(*) from pus_buku where katalog=kg.replid) as jum
				                        FROM
				                          pus_katalog kg
				                          LEFT JOIN pus_buku pb ON pb.replid = kg.pengarang
				                          LEFT JOIN pus_klasifikasi kf ON kf.replid = kg.klasifikasi
				                          LEFT JOIN pus_bahasa b ON b.replid = kg.bahasa
				                          LEFT JOIN pus_jenisbuku pj ON pj.replid = kg.jenisbuku
				                        WHERE
				                        	kg.replid = '.$_POST['replid'].'
				                        order BY
				                          kg.replid asc';
											// print_r($s);exit();
						$e 		= mysql_query($s) or die(mysql_error());
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out    = json_encode(array(
									'status'      =>$stat,
									'judul'       =>$r['judul'],
									'jum'      =>$r['jum'],
									'kode'        =>$r['kode'],
									'barkode'     =>$r['barkode'],
									'sumber'      =>$r['sumber'],
									'harga'       =>'Rp. '.number_format($r['harga']),
									'tanggal'     =>$r['tanggal'],
									'lokasi'      =>$r['lokasi'],
									'tingkatbuku' =>$r['tingkatbuku']
								));
					break;
					
				}
			break;
			// ambiledit -----------------------------------------------------------------
			
			// generate kode
			case 'codeGen':
				switch ($_POST['subaksi']) {
					case'trans':
						// idbuku  ------------------------------------------------
						if(isset($_POST['replid']) and $_POST['replid']!=''){//edit
							$s= 'SELECT urut idbuku FROM pus_buku WHERE replid='.$_POST['replid'].'';
						}else{ //add 
							$s ='SELECT (max(urut)+1)idbuku from pus_buku';
						}$e = mysql_query($s) or die(mysql_error());
						$r = mysql_fetch_assoc($e);
					
						// u/ id buku 
						$data1 = array(
							'idbuku'  =>$r['idbuku'],
							'sumber'  =>$_POST['sumber'],
							'tahun'   =>substr($_POST['tanggal'],7,4),
							'tingkat' => getTingkatBuku('kode','replid',$_POST['tingkat'])
						);

						// u/ barcode
						$data2 = array(
							'lokasi'  => getLokasi('kode','replid',$_POST['lokasi']),
							'tingkat' => getTingkatBuku('kode','replid',$_POST['tingkat']),
							'tahun'   =>substr($_POST['tanggal'],7,4),
							'idbuku'  =>$r['idbuku']
						);

						// panggil fungsi  generate
						$idbuku  = getKodeBukuDT($data1);
						$barcode = getBarcodeDT($data2);
						
						// output --------------------------------
						$stat = ($idbuku==NULL && $barcode==NULL) ?'gagal':'sukses';
						$out  = json_encode(array(
							'status'  =>$stat,
							'idbuku'  =>$idbuku,
							'barcode' =>$barcode
						));
					break;
				}
			break;
					// generate kode

			// aktifkan -----------------------------------------------------------------
			case 'aktifkan':
				$e1   = mysql_query('UPDATE  '.$tb.' set aktif="0" where departemen = '.$_POST['departemen']);
				if(!$e1){
					$stat='gagal menonaktifkan';
				}else{
					$s2 = 'UPDATE  '.$tb.' set aktif="1" where replid = '.$_POST['replid'];
					$e2 = mysql_query($s2);
					if(!$e2){
						$stat='gagal mengaktifkan';
					}else{
						$stat='sukses';
					}
				//var_dump($stat);exit();
				}$out  = json_encode(array('status'=>$stat));
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbkelompok -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where'.$mnu.'='.$_POST[$mnu];
					}elseif (isset($_POST['tahunajaran'])) {
						$w='where tahunajaran='.$_POST['tahunajaran'];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY '.$mnu.' asc';
				// var_dump($s);exit();
				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar = $dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error');
				}else{
					if($n==0){ // kosong 
						// var_dump($n);exit();
						$ar = array('status'=>'kosong');
					}else{ // ada data
						if(!isset($_POST['replid'])){
							while ($r=mysql_fetch_assoc($e)) {
								$dt[]=$r;
							}
						}else{
							$dt[]=mysql_fetch_assoc($e);
						}$ar = array('status'=>'sukses','kelompok'=>$dt);
					}
				}
				// print_r($n);exit();
				$out=json_encode($ar);
			break;
			// cmbtingkat -----------------------------------------------------------------
			
			case 'cmbagama':
								
				$s	= ' SELECT *
						from mst_agama
						ORDER  BY urutan desc';
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
						}$ar = array('status'=>'sukses','agama'=>$dt);
					}
				}$out=json_encode($ar);
			break;

			case 'cmbangsuran':
								
				$s	= ' SELECT *
						from psb_angsuran
						ORDER  BY cicilan desc';
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
						}$ar = array('status'=>'sukses','angsuran'=>$dt);
					}
				}$out=json_encode($ar);
			break;


		}
	}echo $out;
// ..../lokasi/tahun/idbuku
?>