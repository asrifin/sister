<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	
	// $tb   = 'pus_lokasi';
	// $tb2  = 'pus_buku';
	// $tb3  = 'pus_katalog';
	// $tb4  = 'pus_penerbit';
	// $tb5  = 'pus_pengarang';
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$lokasi 	= isset($_POST['lokasiS'])?filter(trim($_POST['lokasiS'])):'';
				$jenisbuku	= isset($_POST['jenisbukuS'])?filter(trim($_POST['jenisbukuS'])):'';
				$tingkatbuku= isset($_POST['tingkatbukuS'])?filter(trim($_POST['tingkatbukuS'])):'';
				$judul 		= isset($_POST['judulS'])?filter(trim($_POST['judulS'])):'';
				$callnumber = isset($_POST['callnumberS'])?filter(trim($_POST['callnumberS'])):'';
				$pengarang  = isset($_POST['pengarangS'])?filter(trim($_POST['pengarangS'])):'';
				$penerbit   = isset($_POST['penerbitS'])?filter(trim($_POST['penerbitS'])):'';
				$klasifikasi   = isset($_POST['klasifikasiS'])?filter(trim($_POST['klasifikasiS'])):'';
				
				$sql = 'SELECT *, b.idbuku AS kode,
								l.nama AS klasifikasi, 
								r.nama AS penerbit, 
								if(b.status=1,"Tersedia","Dipinjam") as status, 
								p.nama2 AS pengarang

						FROM pus_buku b

						LEFT JOIN pus_katalog k on k.replid=b.katalog
						LEFT JOIN pus_tingkatbuku t on t.replid=b.tingkatbuku
						LEFT JOIN pus_klasifikasi l on l.replid=k.klasifikasi
						LEFT JOIN pus_pengarang p on p.replid=k.pengarang
						LEFT JOIN pus_penerbit r on r.replid=k.penerbit
						LEFT JOIN pus_jenisbuku u on u.replid=k.jenisbuku
						WHERE 
						b.lokasi='.$lokasi.'
						AND b.tingkatbuku='.$tingkatbuku.'
						AND k.jenisbuku='.$jenisbuku.'
	
						';
						// 	b.replid
						// 	,b.barkode
						// 	,LPAD(b.idbuku,18,0)as kode
						// 	,k.judul
						// 	,k.callnumber
						// 	,CONCAT("[",f.kode,"] ",f.nama) klasifikasi
						// 	,r.nama2 as pengarang
						// 	,t.nama as penerbit
						// 	,if(b.status=1,"Tersedia","Dipinjam") as status
						// FROM pus_katalog k
						// LEFT JOIN pus_buku b on b.katalog = k.replid
						// LEFT JOIN pus_klasifikasi f on f.kode = k.klasifikasi
						// LEFT JOIN pus_penerbit t on t.replid=k.penerbit
						// LEFT JOIN pus_pengarang r on r.replid=k.pengarang
						// WHERE	
							 
						// 	AND klasifikasi = f.replid 
						// 	AND k.jenisbuku = "%'.$jenisbuku.'%"
						// 	AND b.tingkatbuku = "%'.$tingkatbuku.'%"
						// l.replid and
							// /*search*/
							// AND b.lokasi = "%'.$lokasi.'%"
				// var_dump($sql);exit();
							  // b.lokasi like "%'.$lokasi.'%" and
						// 	  l.replid=
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				$recpage= 5;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj 	= new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_array($result)){	
				// print_r($res);exit(); 	
						$btn ='<td>
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
								 </td>';
						$out.= '<tr>
									
									<td>'.$res['barkode'].'</td>
									<td>'.$res['kode'].'</td>
									<td>'.$res['judul'].'</td>
									<td>'.$res['callnumber'].'</td>
									<td>'.$res['klasifikasi'].'</td>
									<td>'.$res['pengarang'].'</td>
									<td>'.$res['penerbit'].'</td>
									<td>'.$res['status'].'</td>
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
			// case 'simpan':
			// 	$s 		= $tb.' set 	lokasi 	= "'.filter($_POST['lokasiH']).'",
			// 							kode 	= "'.filter($_POST['kodeTB']).'",
			// 							nama 	= "'.filter($_POST['namaTB']).'",
			// 							keterangan 	= "'.filter($_POST['keteranganTB']).'"';
			// 	$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
			// 	$e 		= mysql_query($s2);
			// 	$stat 	= ($e)?'sukses':'gagal';
			// 	$out 	= json_encode(array('status'=>$stat));
			// break;
			// // add / edit -----------------------------------------------------------------
			
			// // delete -----------------------------------------------------------------
			// case 'hapus':
			// 	$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb2.' where replid='.$_POST['replid']));
			// 	$s    = 'DELETE from '.$tb2.' WHERE replid='.$_POST['replid'];
			// 	$e    = mysql_query($s);
			// 	$stat = ($e)?'sukses':'gagal';
			// 	$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
			// break;
			// // delete -----------------------------------------------------------------

			// // ambiledit -----------------------------------------------------------------
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
			// // ambiledit -----------------------------------------------------------------

			// // cmbtempat ---------------------------------------------------------
			// case 'cmb'.$mnu:
			// 	$w='';
			// 	if(isset($_POST['replid'])){
			// 		$w.='where replid ='.$_POST['replid'];
			// 	}else{
			// 		if(isset($_POST[$mnu])){
			// 			$w.='where '.$mnu.'='.$_POST[$mnu];
			// 		}elseif(isset($_POST[$mnu2])){
			// 			$w.='where '.$mnu2.' ='.$_POST[$mnu2];
			// 		}
			// 	}
				
			// 	$s	= ' SELECT *
			// 			from '.$tb.'
			// 			'.$w.'		
			// 			ORDER  BY nama desc';
			// 	// var_dump($s);exit();
			// 	$e 	= mysql_query($s);
			// 	$n 	= mysql_num_rows($e);
			// 	$ar=$dt=array();

			// 	if(!$e){ //error
			// 		$ar = array('status'=>'error');
			// 	}else{
			// 		if($n=0){ // kosong 
			// 			$ar = array('status'=>'kosong');
			// 		}else{ // ada data
			// 			if(!isset($_POST['replid'])){
			// 				while ($r=mysql_fetch_assoc($e)) {
			// 					$dt[]=$r;
			// 				}
			// 			}else{
			// 				$dt[]=mysql_fetch_assoc($e);
			// 			}$ar = array('status'=>'sukses',$mnu=>$dt);
			// 		}
			// 	}$out=json_encode($ar);
			// break;
			// end of cmblokasi ---------------------------------------------------------

		}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>