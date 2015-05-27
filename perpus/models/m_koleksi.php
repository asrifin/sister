<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
		//Note
	// pus_buku
	// status = 0 Dipinjam, 1 tersedia 

	// $tb   = 'pus_lokasi';
	$tb2  = 'pus_buku';
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
				$lokasi      = isset($_POST['lokasiS'])?filter(trim($_POST['lokasiS'])):'';
				$jenisbuku   = isset($_POST['jenisbukuS'])?filter(trim($_POST['jenisbukuS'])):'';
				$tingkatbuku = isset($_POST['tingkatbukuS'])?filter(trim($_POST['tingkatbukuS'])):'';
				$barkode     = isset($_POST['barkodeS'])?filter(trim($_POST['barkodeS'])):'';
				$idbuku      = isset($_POST['idbukuS'])?filter(trim($_POST['idbukuS'])):'';
				$judul       = isset($_POST['judulS'])?filter(trim($_POST['judulS'])):'';
				$callnumber  = isset($_POST['callnumberS'])?filter(trim($_POST['callnumberS'])):'';
				$klasifikasi = isset($_POST['klasifikasiS'])?filter(trim($_POST['klasifikasiS'])):'';
				$pengarang   = isset($_POST['pengarangS'])?filter(trim($_POST['pengarangS'])):'';
				$penerbit    = isset($_POST['penerbitS'])?filter(trim($_POST['penerbitS'])):'';
				$status      = isset($_POST['statusS'])?filter(trim($_POST['statusS'])):'';
				
				

				// $sql = 'SELECT *, b.idbuku AS kode,
				// 				k.replid as replid,
				// 				k.judul AS judul,
				// 				l.nama AS klasifikasi, 
				// 				r.nama AS penerbit, 
								// if(b.status=1,"Tersedia","Dipinjam") as status, 
				// 				p.nama2 AS pengarang

				// 		FROM pus_buku b
				// 		LEFT JOIN pus_katalog k on k.replid=b.katalog
				// 		LEFT JOIN pus_tingkatbuku t on t.replid=b.tingkatbuku
				// 		LEFT JOIN pus_klasifikasi l on l.replid=k.klasifikasi
						// LEFT JOIN pus_pengarang p on p.replid=k.pengarang
						// LEFT JOIN pus_penerbit r on r.replid=k.penerbit
				// 		LEFT JOIN pus_jenisbuku u on u.replid=k.jenisbuku
				// 		WHERE 
				// 		b.lokasi ='.$lokasi.' AND
				// 		b.tingkatbuku ='.$tingkatbuku.' AND
				// 		k.jenisbuku ='.$jenisbuku.' AND
				// 		b.barkode like "%'.$barkode.'%"
				// 		AND b.idbuku like "%'.$idbuku.'%"
				// 		AND k.judul like "%'.$judul.'%"
				// 		AND b.callnumber like "%'.$callnumber.'%"
				// 		AND b.status like "%'.$status.'%"
				// 		ORDER BY k.replid asc';
				// print_r($sql);exit();
				$sql 	= ' SELECT
	                          kg.replid as replid,
	                          kg.judul,
							  LPAD(pb.idbuku,18,0)as kode,
							  pb.barkode,
							  pb.harga,
							  pb.tanggal,
							  pb.lokasi,
							  pb.tingkatbuku,
							  pb.sumber,
							  if(pb.status=1,"Tersedia","Dipinjam") as status, 
							  --if(pb.sumber=0,"Beli","Pemberian") as sumber,
							  pj.nama jenisbuku,
	                          kg.callnumber,
	                          kg.dimensi,
	                          kg.deskripsi, 
	                          kf.nama AS klasifikasi,
	                          p.nama2 AS pengarang,
	                          r.nama AS penerbit,
	                          (SELECT count(*) from pus_buku where katalog=kg.replid) as jum
	                        FROM
	                          pus_katalog kg
	                          LEFT JOIN pus_buku pb ON pb.replid = kg.pengarang
					      	  LEFT JOIN pus_tingkatbuku t on t.replid= pb.tingkatbuku
	                          LEFT JOIN pus_klasifikasi kf ON kf.replid = kg.klasifikasi
	                          LEFT JOIN pus_bahasa b ON b.replid = kg.bahasa
							  LEFT JOIN pus_pengarang p on p.replid= kg.pengarang
							  LEFT JOIN pus_penerbit r on r.replid= kg.penerbit
	                          LEFT JOIN pus_jenisbuku pj ON pj.replid = kg.jenisbuku
	                        WHERE
					    		pb.lokasi ='.$lokasi.' AND
					    		pb.tingkatbuku ='.$tingkatbuku.' AND
					    		kg.jenisbuku ='.$jenisbuku.' AND
					    		pb.barkode like "%'.$barkode.'%"
					    		AND pb.idbuku like "%'.$idbuku.'%"
					    		AND kg.judul like "%'.$judul.'%"
					    		AND pb.callnumber like "%'.$callnumber.'%"
					    		AND pb.status like "%'.$status.'%"
	                        order BY
	                          kg.replid asc';
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
									<button data-hint="ubah"  class="button" onclick="koleksiFR('.$res['replid'].');">
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
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb2.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb2.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
			break;
			// // delete -----------------------------------------------------------------

			// // ambiledit -----------------------------------------------------------------
			case 'ambiledit':
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
									'jum'      	  =>$r['jum'],
									'kode'        =>$r['kode'],
									'barkode'     =>$r['barkode'],
									'sumber'      =>$r['sumber'],
									'harga'       =>$r['harga'],
									'tanggal'     =>$r['tanggal'],
									'lokasi'      =>$r['lokasi'],
									'tingkatbuku' =>$r['tingkatbuku']
								));
			break;
			// // ambiledit -----------------------------------------------------------------


		}
	}echo $out;

    
?>