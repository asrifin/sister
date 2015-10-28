<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'katalog';
	$tb  = 'pus_'.$mnu;
	$out ='';
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// // -----------------------------------------------------------------
			case 'tampil':
				$judul            = isset($_POST['cariopac'])?filter($_POST['cariopac']):'';
				// $kode_klasifikasi = isset($_POST['kode_klasifikasiS'])?filter($_POST['kode_klasifikasiS']):'';
				// $pengarang        = isset($_POST['pengarangS'])?filter($_POST['pengarangS']):'';
				// $penerbit         = isset($_POST['penerbitS'])?filter($_POST['penerbitS']):'';
				
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
							pkat.judul like "%'.$judul.'%" OR
							pkas.nama like "%'.$judul.'%" OR					
							pg.nama like "%'.$judul.'%" OR					
							penerbit like "%'.$judul.'%"						
						GROUP BY
							pkat.replid						
							ORDER BY pkat.replid asc';	
							// var_dump($sql);exit();
					// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = 36;
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result  = $obj->result;

				#ada data
				$jum = mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					$res = mysql_fetch_array($result);	
					$ee = mysql_query('SELECT * 
									FROM kon_warna');
					$dt = array();
					while ($rr = mysql_fetch_array($ee)) {
						$dt[] = $rr;
					}
					$w = array_rand($dt,$recpage+1);
					while($res = mysql_fetch_array($result)){	
								
									    // <a href="#" class="tile  bg-'.$res2['warna'].' data-click="transform">
							$out.='
									    <a href="#" onclick="viewFR('.$res['replid'].')" class="tile  bg-'.$dt[$w[$nox]]['warna'].' data-click="transform">
									        <div class="tile-content email">
	                                    		<div class="email-data-text">'.$res['judul'].'</div>
									        </div>
									        <div class="brand">
									            <div class="label"></div>
									        </div>
									    </a>
								   ';
							$nox++;
						}
					// }
				}else{ #kosong
					$out.= '<span style="color:red;text-align:center;">
							... data tidak ditemukan...</span>';
				}
				#link paging
				// $out.= '<tr class="info"><td colspan="10">'.$obj->anchors.'</td></tr>';
				// $out.='<tr class="info"><td colspan="10">'.$obj->total.'</td></tr>';
			break; 
			// // view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s 		= $tb.' set 	kode 	= "'.filter($_POST['kodeTB']).'",
										nama 	= "'.filter($_POST['namaTB']).'",
										alamat 	= "'.filter($_POST['alamatTB']).'",
										keterangan 	= "'.filter($_POST['keteranganTB']).'"';
				$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e 		= mysql_query($s2);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
						$s   = ' SELECT
								  kg.replid as replid,
		                          kg.judul,
		                          kf.kode kode_klas,
		                          kf.nama klasifikasi,
		                          pr.nama pengarang,
		                          pb.nama penerbit,
		                          (SELECT count(*) 
		                          	from pus_buku 
		                          	where katalog=kg.replid AND
		                          		  buku.status = 1
		                          	)tersedia,
							 	  if(buku.status=1,"Tersedia","Dipinjam") as statusbuku, 
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
		                          LEFT JOIN pus_buku buku ON kg.replid = buku.katalog
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
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'      =>$stat,
							'replid'      =>$r['replid'],
							'photo2'      =>$r['photo2'],
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
							'tersedia'  =>$r['tersedia'],		
						));
			break;
			// ambiledit -----------------------------------------------------------------
			
			// cmblokasi ---------------------------------------------------------
			case 'cmblokasi':
				$s	= ' SELECT *
						from '.$tb.'
						'.(isset($_POST['replid'])?'where replid ='.$_POST['replid']:'').'
						ORDER  BY kode asc';
				$e  = mysql_query($s);
				// var_dump($s);
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
						}$ar = array('status'=>'sukses','lokasi'=>$dt);
					}
				}
				$out=json_encode($ar);
				// echo $out;
			break;
			// end of cmblokasi ---------------------------------------------------------
		}
	}
	echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>