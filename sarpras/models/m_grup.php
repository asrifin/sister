<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	$mnu  = 'grup';
	$mnu2 = 'lokasi';
	$mnu3 = 'katalog';
	$mnu4 = 'barang';

	$tb   = 'sar_'.$mnu;
	$tb2  = 'sar_'.$mnu2;
	$tb3  = 'sar_'.$mnu3;
	$tb4  = 'sar_'.$mnu4;
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// tampil -----------------------------------------------------------------
			case 'tampil':
				switch ($_POST['subaksi']) {
					// grup barang
					case 'grup':
						$lokasi       = trim($_POST['lokasiS'])?filter($_POST['lokasiS']):'';
						$g_kode       = trim($_POST['g_kodeS'])?filter($_POST['g_kodeS']):'';
						$g_nama       = trim($_POST['g_namaS'])?filter($_POST['g_namaS']):'';
						$g_keterangan = trim($_POST['g_keteranganS'])?filter($_POST['g_keteranganS']):'';
						
						$sql = 'SELECT
									g.replid,
									g.kode,
									g.nama,
									IFNULL(tbtot.jum,0) u_total,
									IFNULL(tbpjm.jum,0) u_dipinjam,
									IFNULL(tbtot.jum,0) - IFNULL(tbpjm.jum,0) u_tersedia,
									IFNULL(tbaset.aset,0) aset,
									g.keterangan
								FROM
									sar_grup g
									LEFT JOIN (
										SELECT 
											k.grup,
											count(*) jum 
										from 
											sar_katalog k
											left JOIN sar_barang b on b.katalog = k.replid
										GROUP BY
											k.grup
									)tbtot on tbtot.grup = g.replid
									
									LEFT JOIN(
										SELECT 
											k.grup,
											count(*)jum
										from 
											sar_peminjaman pj
											left JOIN sar_pengembalian kb on kb.peminjaman = pj.replid
											LEFT JOIN sar_barang b on b.replid = pj.barang
											left JOIN sar_katalog k on k.replid = b.katalog
										WHERE
											kb.replid is NULL
										GROUP BY	
											k.grup
									)tbpjm on tbpjm.grup = g.replid

									LEFT JOIN(
										SELECT
											k.grup,
											SUM(b.harga)aset
										from 
											sar_barang b
											join sar_katalog k on k.replid = b.katalog
										GROUP BY 
											k.grup
									)tbaset on tbaset.grup = g.replid
								WHERE
									g.lokasi = '.$lokasi.' and
									g.kode like "%'.$g_kode.'%" and
									g.nama like "%'.$g_nama.'%" and
									g.keterangan like "%'.$g_keterangan.'%" 
								ORDER BY
									g.kode asc';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage= 5;//jumlah data per halaman
						$obj 	= new pagination_class($sql,$starting,$recpage);
						$result =$obj->result;

						#ada data
						$jum	= mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_array($result)){	
								$btn ='<td>
											<button data-hint="detail"  class="button" onclick="vwKatalog('.$res['replid'].');">
												<i class="icon-zoom-in"></i>
											</button>
											<button data-hint="ubah"  class="button" onclick="grupFR('.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="grupDel('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$out.= '<tr>
											<td>'.$res['kode'].'</td>
											<td>'.$res['nama'].'</td>
											<td>'.$res['u_total'].'</td>
											<td>'.$res['u_tersedia'].'</td>
											<td>'.$res['u_dipinjam'].'</td>
											<td class="text-right">Rp. '.number_format($res['aset']).',-</td>
											<td>'.$res['keterangan'].'</td>
											'.$btn.'
										</tr>';
								$totaset+=$res['aset'];
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
					// grup barang

					// katalog
					case 'katalog':
						$k_grup       = isset($_POST['grup'])?filter(trim($_POST['grup'])):'';
						$k_kode       = isset($_POST['k_kodeS'])?filter(trim($_POST['k_kodeS'])):'';
						$k_nama       = isset($_POST['k_namaS'])?filter(trim($_POST['k_namaS'])):'';
						$k_keterangan = isset($_POST['k_keteranganS'])?filter(trim($_POST['k_keteranganS'])):'';
						// var_dump($k_grup);exit();
						$sql = 'SELECT
									k.replid,
									k.kode,
									k.nama,
									j.nama jenis,
									COUNT(*) jum_unit,
									SUM(b.harga) aset,
									k.susut,
									k.keterangan
								FROM	
									sar_katalog k
									LEFT JOIN sar_jenis  j on j.replid = k.jenis
									LEFT JOIN sar_barang b on b.katalog = k.replid
								WHERE
									k.grup = "'.$k_grup.'" and
									k.kode like "%'.$k_kode.'%" and
									k.nama like "%'.$k_nama.'%" and
									k.keterangan like "%'.$k_keterangan.'%"
								GROUP BY 
									k.replid
								ORDER BY
									k.kode asc';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage= 5;//jumlah data per halaman
						$obj 	= new pagination_class($sql,$starting,$recpage);
						$result =$obj->result;

						#ada data
						$jum	= mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_array($result)){	
								$btn ='<td>
											<button data-hint="detail"  class="button" onclick="vwBarang('.$res['replid'].');">
												<i class="icon-zoom-in"></i>
											</button>
											<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="grupDel('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$out.= '<tr>
											<td>'.$res['kode'].'</td>
											<td>'.$res['nama'].'</td>
											<td>'.$res['jenis'].'</td>
											<td>'.$res['jum_unit'].'</td>
											<td class="text-right">Rp. '.number_format($res['aset']).',-</td>
											<td class="text-right">'.$res['susut'].'%</td>
											<td>'.$res['keterangan'].'</td>
											'.$btn.'
										</tr>';
								$totaset+=$res['aset'];
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
					// katalog

					// barang
					case 'barang':
						$grup       = trim($_POST['grup'])?filter($_POST['grup']):'';
						// $lokasi       = trim($_POST['lokasiS'])?filter($_POST['lokasiS']):'';
						// $g_kode       = trim($_POST['g_kodeS'])?filter($_POST['g_kodeS']):'';
						// $g_nama       = trim($_POST['g_namaS'])?filter($_POST['g_namaS']):'';
						// $g_utotal     = trim($_POST['g_utotalS'])?filter($_POST['g_utotalS']):'';
						// $g_utersedia  = trim($_POST['g_utersediaS'])?filter($_POST['g_utersediaS']):'';
						// $g_udipinjam  = trim($_POST['g_udipinjamS'])?filter($_POST['g_udipinjamS']):'';
						// $g_keterangan = trim($_POST['g_keteranganS'])?filter($_POST['g_keteranganS']):'';
						
						$sql = 'SELECT
									k.replid,
									k.kode,
									k.nama,
									j.nama jenis,
									COUNT(*) jum_unit,
									SUM(b.harga) aset,
									k.susut,
									k.keterangan
								FROM	
									sar_katalog k
									LEFT JOIN sar_jenis  j on j.replid = k.jenis
									LEFT JOIN sar_barang b on b.katalog = k.replid
								WHERE
									k.grup = '.$grup.'
								GROUP BY 
									k.replid
								ORDER BY
									k.kode asc';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage= 5;//jumlah data per halaman
						$obj 	= new pagination_class($sql,$starting,$recpage);
						$result =$obj->result;

						#ada data
						$jum	= mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_array($result)){	
								$btn ='<td>
											<button data-hint="detail"  class="button" onclick="vwBarang('.$res['replid'].');">
												<i class="icon-zoom-in"></i>
											</button>
											<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$out.= '<tr>
											<td>'.$res['kode'].'</td>
											<td>'.$res['nama'].'</td>
											<td>'.$res['jenis'].'</td>
											<td>'.$res['jum_unit'].'</td>
											<td class="text-right">Rp. '.number_format($res['aset']).',-</td>
											<td class="text-right">'.$res['susut'].'%</td>
											<td>'.$res['keterangan'].'</td>
											'.$btn.'
										</tr>';
								$totaset+=$res['aset'];
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
					// barang
				}
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
								g.replid ='.$_POST['grup'].' and 
								b.katalog = k.replid and
							  	g.lokasi = l.replid and
							  	g.replid=k.grup';
						$q 	= mysql_query($s);
						$stat = ($q)?'sukses':'gagal';
						$r = mysql_fetch_assoc($q);
						$out = json_encode(array(
								'status'=>$stat,
								'grup'=>$r['grup'],
								'lokasi'=>$r['lokasi'],
								'totaset'=>number_format($r['totaset'])
							));
					break;
				}
			break;
			// head info ------------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				switch ($_POST['subaksi']) {
					case 'grup':
						$s 		= $tb.' set 	lokasi 		= "'.filter($_POST['g_lokasiH']).'",
												kode 		= "'.filter($_POST['g_kodeTB']).'",
												nama 		= "'.filter($_POST['g_namaTB']).'",
												keterangan 	= "'.filter($_POST['g_keteranganTB']).'"';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;

					case 'katalog':
						$s 		= $tb.' set 	lokasi 		= "'.filter($_POST['g_lokasiH']).'",
												kode 		= "'.filter($_POST['g_kodeTB']).'",
												nama 		= "'.filter($_POST['g_namaTB']).'",
												keterangan 	= "'.filter($_POST['g_keteranganTB']).'"';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;
				}
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
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
						$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
					break;
				}
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				switch ($_POST['subaksi']) {
					case 'grup';
						$s = 'SELECT * FROM '.$tb.'  WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array(
									'kode' =>$r['kode'],
									'nama' =>$r['nama'],
									'lokasi' =>$r['lokasi'],
									'keterangan' =>$r['keterangan']
								));					
						break;
				}

			break;
			// ambiledit -----------------------------------------------------------------
		}
	}//awal letak echo disini
	echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>