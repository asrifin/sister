<?php
	session_start();
	// error_reporting(0);
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	$mnu  = 'peminjaman';
	$mnu2 = 'lokasi';
	$tb   = 'sar_'.$mnu;
	$tb2  = 'sar_'.$mnu2;

	if(!isset($_POST['aksi'])){
		if($_GET['aksi']=='autocomp'){
			$page       = $_GET['page']; // get the requested page
			$limit      = $_GET['rows']; // get how many rows we want to have into the grid
			$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
			$sord       = $_GET['sord']; // get the direction
			$searchTerm = $_GET['searchTerm'];

			if(!$sidx) $sidx =1;
			$ss     = 'SELECT * 
						FROM(
							SELECT
								b.replid,
								k.nama,
								CONCAT(l.kode,"/",g.kode,"/",t.kode,"/",k.kode,"/",LPAD(b.urut,5,0)) kode
							FROM
								sar_barang b
								JOIN sar_tempat t on t.replid = b.tempat
								JOIN sar_lokasi l on l.replid = t.lokasi
								JOIN sar_katalog k on k.replid = b.katalog
								JOIN sar_grup g on g.replid = k.grup
							where 
								`status` = 1 
								'.(isset($_POST['barang']) and is_array($_POST['barang']) and !is_null($_POST['barang'])?'AND b.replid NOT IN ('.$_POST['barang'].')':'').'
								and  l.replid = '.$_GET['lokasi'].' 
							)tb
						WHERE	
							tb.nama LIKE "%'.$searchTerm.'%"
							OR tb.kode LIKE "%'.$searchTerm.'%"';
							// '.(isset($_POST['barang'])and is_array($_POST['barang']) and !is_null($_POST['barang'])?'AND b.replid NOT IN ('.$_POST['barang'].')':'').'
			// print_r($ss);exit();
			$result = mysql_query($ss);
			$row    = mysql_fetch_array($result,MYSQL_ASSOC);
			// $count  = $row['count'];
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
			$rows=array();
			while($row = mysql_fetch_assoc($result)) {
				$rows[]= array(
					'replid' =>$row['replid'],
					'nama'   =>$row['nama'],
					'kode'   =>$row['kode']
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
				$lokasi   = isset($_POST['lokasiS'])?filter(trim($_POST['lokasiS'])):'';
				$peminjam = isset($_POST['peminjamS'])?filter(trim($_POST['peminjamS'])):'';
				$s        = 'SELECT 
								p.*,b.kode,b.katalog,k.nama 
							FROM sar_peminjaman2 p
								LEFT JOIN sar_barang b ON b.replid=p.barang 
								LEFT JOIN sar_katalog k ON k.replid=b.katalog 
							WHERE
								p.lokasi ='.$lokasi.' and					
								p.status=0 and
								p.peminjam LIKE "%'.$peminjam.'%"
							ORDER BY p.replid asc';
				// print_r($s);exit(); 	
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				$recpage = 5;//jumlah data per halaman
				$aksi    ="tampil";
				$subaksi ="peminjaman";
				$obj     = new pagination_class($s,$starting,$recpage,$aksi,$subaksi);
				$result  = $obj->result;
				
				#ada data
				$jum    = mysql_num_rows($result);
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
									<td>'.$res['peminjam'].'</td>
									<td>'.$res['nama'].'</br>'.$res['kode'].'</td>
									<td>'.tgl_indo($res['tanggal1']).'</td>
									<td>'.tgl_indo($res['tanggal2']).'</td>
									<td>'.$res['tempat'].'</td>
									<td>'.$res['keterangan'].'</td>
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

			case 'tampil2':
				$nama = isset($_POST['namaS'])?filter(trim($_POST['namaS'])):'';
				
				$sql = 'SELECT b.replid, b.kode, k.nama, b.status
						FROM sar_barang b 
						LEFT JOIN sar_katalog k ON k.replid=b.katalog 
						WHERE
						b.status = 1 and 
						b.replid NOT IN (SELECT barang FROM sar_dftp) and			
						k.nama LIKE "%'.$nama.'%"
						ORDER BY b.replid asc';
						// , sar_barang b, sar_katalog k
				// print_r($sql);exit(); 	
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage= 3;//jumlah data per halaman
				$aksi="tampil2";
				$subaksi="barang";
				// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
				$obj 	= new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_array($result)){	
						$btn ='<td>
									
									<button data-hint="hapus"  class="button" onclick="pilih('.$res['replid'].');">
										<i class="icon-enter"></i>
								 </td>';
						$out.= '<tr>
									
									<td>'.$res['kode'].'</td>
									<td>'.$res['nama'].'</td>
									'.$btn.'
								</tr>';
						$nox++;
									// <td>'.$res['status'].'</td>
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

			case 'tampil3':
				// $nama     = trim($_POST['namaS'])?filter($_POST['namaS']):'';
				// $peminjam     = trim($_POST['peminjamS'])?filter($_POST['peminjamS']):'';
				
				$sql = 'SELECT d.*,b.kode,b.katalog,k.nama 
						FROM sar_dftp d
						LEFT JOIN sar_barang b ON b.replid=d.barang 
						LEFT JOIN sar_katalog k ON k.replid=b.katalog 
						
						ORDER BY d.replid asc';
						// , sar_barang b, sar_katalog k
				// print_r($sql);exit(); 	
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage= 5;//jumlah data per halaman
				$aksi="tampil3";
				$subaksi="dftp";
				// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
				$obj 	= new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_array($result)){	
						$btn ='<td>
									
									<button data-hint="hapus"  class="button" onclick="deldftp('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
								 </td>';
						$out.= '<tr>
									
									<td>'.$res['kode'].'</td>
									<td>'.$res['nama'].'</td>
									'.$btn.'
								</tr>';
						$nox++;
									// <td>'.$res['status'].'</td>
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
			// case 'simpandftp':
			// 	$s 		= 'INSERT INTO sar_dftp'.' set 	
			// 							barang 	= "'.filter($_POST['kode']).'"';
			// 	// $s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
			// 	// var_dump($s2);exit();
			// 	$e 		= mysql_query($s);
			// 	$stat 	= ($e)?'sukses':'gagal';
			// 	$out 	= json_encode(array('status'=>$stat));
			// break;
			// add / edit -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s='INSERT INTO sar_peminjaman2 set peminjam	="'.filter($_POST['peminjamTB']).'",
													tgl_pinjam	="'.filter($_POST['tgl_pinjamTB']).'",
													tgl_kembali	="'.filter($_POST['tgl_kembaliTB']).'",
													keterangan	="'.filter($_POST['keteranganTB']).'"';
				$e  =mysql_query($s);
				$id =mysql_insert_id();
				if(!$e){ //gagal simpan peminjaman 
					$stat = 'gagal_simpan_peminjaman';
				}else{ //sukses simpan peminjaman
					$stat2=true;
					if(isset($_POST['barang'])){
						foreach ($_POST['barang'] as $i=> $v) {
							$s2='INSERT INTO sar_dpeminjaman set 	peminjaman 	= '.$id.',
																	barang 		= "'.$v.'"';
							$e2    =mysql_query($s2);
							$stat2 =$e2?true:false;
						}
					}$stat=$stat2?'sukses':'gagal_simpan_barang';
				}$out=json_encode(array('status'=>$stat));
			break;

			case 'simpanx':
				$s = 'SELECT * from sar_dftp';
				$e = mysql_query($s);
				$ar=array();
				while($r = mysql_fetch_assoc($e)){
					$ar[]=array('barang'=>$r['barang']);
				}
				$err = true;
				foreach($ar as $i => $v){
					$s2 = 'INSERT INTO sar_peminjaman set peminjam = "'.$_POST['peminjamTB'].'",
								 tanggal1 = "'.$_POST['tanggal1TB'].'",
								 tanggal2 = "'.$_POST['tanggal2TB'].'",

								 status = 0,
								lokasi 	= '.$_POST['lokasiH'].',
								barang ='.$v['barang'] ;
				  	$e2 = mysql_query($s2);
				  	if(!$e2)
				      $err=false;
				}

				$sql  = 'DELETE from sar_dftp ';
				$e3   = mysql_query($sql);
				$stat =(!$err&$e3)?'gagal':'sukses';
				$stat =(!$err)?'gagal':'sukses';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				// $d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from sar_dftp  where replid='.$_POST['replid']));
				// $s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$s    = 'DELETE from sar_dftp WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['barang']));
			break;
			// delete -----------------------------------------------------------------

			// delete -----------------------------------------------------------------
			case 'hapusdftp':
				// $d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from sar_dftp  where replid='.$_POST['replid']));
				// $s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$s    = 'DELETE from sar_dftp WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['barang']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			// case 'ambiledit':
			// 	$s 		= ' SELECT 
			// 					t.kode,
			// 					t.nama,
			// 					t.keterangan,
			// 					l.nama as lokasi
			// 				from '.$tb.' t, sar_lokasi l 
			// 				WHERE 
			// 					t.lokasi= l.replid and
			// 					t.replid='.$_POST['replid'];
			// 	// var_dump($s);exit();
			// 	$e 		= mysql_query($s);
			// 	$r 		= mysql_fetch_assoc($e);
			// 	// $stat 	= ($e)?'sukses':'gagal';
			// 	$out 	= json_encode(array(
			// 				'kode'       =>$r['kode'],
			// 				'lokasi'     =>$r['lokasi'],
			// 				'nama'       =>$r['nama'],
			// 				'keterangan' =>$r['keterangan']
			// 			));
			// break;
			// ambiledit -----------------------------------------------------------------

			// cmbtempat ---------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w.='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w.='where '.$mnu.'='.$_POST[$mnu];
					}elseif(isset($_POST[$mnu2])){
						$w.='where '.$mnu2.' ='.$_POST[$mnu2];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY nama desc';
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
			// end of cmblokasi ---------------------------------------------------------

		}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>