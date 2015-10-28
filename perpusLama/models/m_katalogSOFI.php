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
	// $out=array();

	if(!isset($_POST['aksi'])){
		// $out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];	

		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
			$page       = $_GET['page']; // get the requested page
			$limit      = $_GET['rows']; // get how many rows we want to have into the grid
			$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
			$sord       = $_GET['sord']; // get the direction
			$searchTerm = $_GET['searchTerm'];


			if(!$sidx) 
				$sidx =1;
			if(isset($_GET['subaksi']) && $_GET['subaksi']=='penerbit'){
				$table = 'pus_penerbit';
			}else{
				$table = 'pus_pengarang';

			}
				$ss=	'SELECT * 
					FROM(
						SELECT replid, nama
						FROM '.$table.'
						where 
							replid 
						)tb
					WHERE	
						tb.nama LIKE "%'.$searchTerm.'%"';
							// '.(isset($_POST['barang'])and is_array($_POST['barang']) and !is_null($_POST['barang'])?'AND b.replid NOT IN ('.$_POST['barang'].')':'').'
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
			// print_r($ss);exit();
			$result = mysql_query($ss) or die("Couldn t execute query.".mysql_error());
			$rows 	= array();
			while($row = mysql_fetch_assoc($result)) {
			if ($_GET['pengarang'] == 'pengarang'){
				$f1 = 'nama_pengarang';
			}else{
				$f1 = 'nama_penerbit';				
			}
				$rows[]= array(
					'replid' =>$row['replid'],
					// 'nama'   =>$row['nama']
					// 'replid' =>$row['replid'],
					'nama'   =>$row[$f1]
				);
			}
			$response=array(
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
				// $tahunajaran = trim($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';
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
								JOIN pus_klasifikasi pkas ON pkat.klasifikasi = pkas.replid 
								JOIN pus_pengarang pg ON pkat.pengarang = pg.replid
								JOIN pus_penerbit pn ON pkat.penerbit = pn.replid
								JOIN pus_buku pb ON pb.katalog = pkat.replid							
						WHERE 
							pkat.judul like "%'.$judul.'%" and
							pkas.nama like "%'.$kode_klasifikasi.'%"	and					
							pg.nama like "%'.$pengarang.'%" and					
							pn.nama like "%'.$pengarang.'%"						
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

					case 'katalog':
						$s 		= $tb.' set 	judul 			 = "'.$_POST['judulTB'].'",
												klasifikasi-kode = "'.filter($_POST['klasifikasiTB']).'",
												klasifikasi      = "'.filter($_POST['klasifikasi_selectTB']).'",
												pengarang        = "'.filter($_POST['pengarangTB']).'",
												callnumber       = "'.$_POST['callnumberTB'].'",
												penerjemah       = "'.filter($_POST['penerjemahTB']).'",
												editor           = "'.filter($_POST['editorTB']).'",
												penerbit         = "'.filter($_POST['penerbitTB']).'",
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
								$img='../../img/upload/'.$_POST['photo_asal'];
								if(file_exists($img)){ //checking image is exist
									$delimg = unlink($img);
									$stat2  = !$delimg?false:true;
								}
							}
						}
						if(!$stat2){// gagal hapus
							$stat='gagal_hapus_file';
						}else{ //sukses hapus file
							$e    = mysql_query($s2);
							$stat = $e?'sukses':'gagal_simpan_db';
						}$out  = json_encode(array('status'=>$stat));
					break;

				}
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
				switch ($_POST['subaksi']) {
					case 'katalog':
						$s 		= ' SELECT
		                          kg.judul,
		                          kf.kode kode_klas,
		                          kf.nama klasifikasi,
		                          pr.nama pengarang,
		                          pb.nama penerbit,
		                          kg.editor,
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
		                          kg.deskripsi, 
		                          (SELECT count(*) from pus_buku where katalog=kg.replid)jum
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
									'status'      =>$stat,
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
									'deskripsi'   =>$r['deskripsi']			
								));

					break;
					
					case 'k_detail':
						$s 		= ' SELECT
		                          kg.judul,
		                          kf.kode kode_klas,
		                          kf.nama klasifikasi,
		                          pr.nama pengarang,
		                          pb.nama penerbit,
		                          kg.editor,
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
		                          kg.deskripsi, 
		                          (SELECT count(*) from pus_buku where katalog=kg.replid)jum
		                        FROM
		                          pus_katalog kg
		                          LEFT JOIN pus_pengarang pr ON pr.replid = kg.pengarang
		                          LEFT JOIN pus_penerbit pb ON pb.replid = kg.penerbit
		                          LEFT JOIN pus_klasifikasi kf ON kf.replid = kg.klasifikasi
		                          LEFT JOIN pus_bahasa b ON b.replid = kg.bahasa
		                          LEFT JOIN pus_jenisbuku pj ON pj.replid = kg.jenisbuku
		                        order BY
		                          kg.judul asc';
											// print_r($s);exit();
						$e 		= mysql_query($s) or die(mysql_error());
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out    = json_encode(array(
									'status'      =>$stat,
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
									'deskripsi'   =>$r['deskripsi']			
								));

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
										  if(pb.sumber=0,"Beli","Pemberian") as sumber,
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
									'jumlah'      =>$r['jum'],
									'kode'      =>$r['kode'],
									'barkode'     =>$r['barkode'],
									'sumber'      =>$r['sumber'],
									'harga'       =>$r['harga'],
									'tanggal'     =>$r['tanggal'],
									'lokasi'      =>$r['lokasi'],
									'tingkatbuku' =>$r['tingkatbuku']
								));

					break;
					
				}
			break;
			// ambiledit -----------------------------------------------------------------
			

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
						var_dump($n);exit();
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

?>