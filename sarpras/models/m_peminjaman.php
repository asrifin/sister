<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
		require_once '../../lib/tglindo.php';

	$mnu  = 'peminjaman';
	$mnu2 = 'lokasi';
	$tb   = 'sar_'.$mnu;
	$tb2  = 'sar_'.$mnu2;
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$lokasi     = trim($_POST['lokasiS'])?filter($_POST['lokasiS']):'';
				$peminjam     = trim($_POST['peminjamS'])?filter($_POST['peminjamS']):'';
				
				$sql = 'SELECT p.*,b.kode,b.katalog,k.nama 
						FROM sar_peminjaman p
						LEFT JOIN sar_barang b ON b.replid=p.barang 
						LEFT JOIN sar_katalog k ON k.replid=b.katalog 
						WHERE
						p.lokasi ='.$lokasi.' and					
						p.status=1 and
						p.peminjam LIKE "%'.$peminjam.'%"
						ORDER BY p.replid asc';
						// , sar_barang b, sar_katalog k
				// print_r($sql);exit(); 	
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage= 5;//jumlah data per halaman
				// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
				$obj 	= new pagination_class($sql,$starting,$recpage);
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
									
									<td>'.$res['peminjam'].'</td>
									<td>'.$res['nama'].'</br>'.$res['kode'].'</td>
									<td>'.tgl_indo($res['tanggal1']).'</td>
									<td>'.tgl_indo($res['tanggal2']).'</td>
									<td>'.$res['tempat'].'</td>
									<td>'.$res['keterangan'].'</td>
								</tr>';
						$nox++;
									// '.$btn.'
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

			case 'tampil2':
				$nama     = trim($_POST['namaS'])?filter($_POST['namaS']):'';
				// $peminjam     = trim($_POST['peminjamS'])?filter($_POST['peminjamS']):'';
				
				$sql = 'SELECT b.replid, b.kode, k.nama, b.status
						FROM sar_barang b 
						LEFT JOIN sar_katalog k ON k.replid=b.katalog 
						WHERE
						b.status = 1 and				
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
				// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
				$obj 	= new pagination_class($sql,$starting,$recpage);
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
			case 'simpandftp':
				$s 		= 'INSERT INTO sar_dftp'.' set 	
										barang 	= "'.filter($_POST['kode']).'"';
				// $s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				// var_dump($s2);exit();
				$e 		= mysql_query($s);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpanall':
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
    									 status = 1,
										lokasi 	= '.$_POST['lokasiH'].',
    									barang ='.$v['barang'] ;
    									/*status =jika terpinjam =1, tersedia=0*/
						  	$e2 = mysql_query($s2);
						  	if(!$e2)
						      $err=false;
						}
						$sql    = 'DELETE from sar_dftp ';
						$e3    = mysql_query($sql);
						// var_dump($sql);exit();
						$stat=(!$err&$e3)?'gagal':'sukses';
						$out = json_encode(array('status'=>$stat));
						
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