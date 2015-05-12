<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu  = 'tempat';
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
				switch ($_POST['subaksi']) {
					case 'main':
						$lokasi     = isset($_POST['lokasiS'])?filter($_POST['lokasiS']):'';
						$tempat     = isset($_POST['main_tempatS'])?filter($_POST['main_tempatS']):'';
						$keterangan = isset($_POST['main_keteranganS'])?filter($_POST['main_keteranganS']):'';
						$sql = 'SELECT t.*
								FROM '.$tb.' t, '.$tb2.' l
								WHERE 
									l.replid = t.lokasi and
									t.lokasi ='.$lokasi.' and
									t.nama LIKE "%'.$tempat.'%" and
									t.keterangan LIKE "%'.$keterangan.'%" 
								ORDER BY t.replid desc';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;
						$aksi    ='tampil';
						$subaksi ='main';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

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
											</button>
											<button data-hint="detail"  class="button" onclick="detailFR('.$res['replid'].');">
												<i class="icon-zoom-in on-left"></i>
											</button>
										 </td>';
								$out.= '<tr>
											<td>'.$res['kode'].'</td>
											<td>'.$res['nama'].'</td>
											<td>'.$res['keterangan'].'</td>
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

					case 'detail':
						$tempat     = isset($_POST['detail_tempatH'])?$_POST['detail_tempatH']:'';
						$kode       = isset($_POST['detail_kodeS'])?$_POST['detail_kodeS']:'';
						$nama       = isset($_POST['detail_namaS'])?$_POST['detail_namaS']:'';
						$barkode    = isset($_POST['detail_barkodeS'])?filter($_POST['detail_barkodeS']):'';
						$harga      = isset($_POST['detail_hargaS'])?filter($_POST['detail_hargaS']):'';
						$kondisi    = isset($_POST['detail_kondisiS'])?filter($_POST['detail_kondisiS']):'';
						$sumber     = isset($_POST['detail_sumberS'])?filter($_POST['detail_sumberS']):'';
						$status     = isset($_POST['detail_statusS'])?filter($_POST['detail_statusS']):'';
						$keterangan = isset($_POST['detail_keteranganS'])?filter($_POST['detail_keteranganS']):'';
						
						$sql = 'SELECT (
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
									b.replid,
									LPAD(b.urut,5,0) as barkode,(
										case b.sumber
											when 0 then "Beli"
											when 1 then "Pemberian" 
											when 2 then "Membuat Sendiri" 
										end
									)as sumber,
									b.harga,
									IF(b. STATUS=1,"Tersedia","Dipinjam")AS status,
									k.nama as kondisi,
									t.nama as tempat,
									b.keterangan,
									kg.nama as katalog

								FROM
									sar_barang b 
									LEFT JOIN sar_kondisi k on k.replid = b.kondisi
									LEFT JOIN sar_katalog kg on kg.replid = b.katalog
									LEFT JOIN sar_tempat t on t.replid = b.tempat
								WHERE
									t.replid ='.$tempat.' and
									kg.nama LIKE "%'.$nama.'%" and
									b.kode LIKE "%'.$kode.'%" and
									b.barkode LIKE "%'.$barkode.'%" and
									b.harga LIKE "%'.$harga.'%" and
									b.sumber LIKE "%'.$sumber.'%" and
									k.nama LIKE "%'.$kondisi.'%" and
									b.status LIKE "%'.$status.'%" and
									b.keterangan LIKE "%'.$keterangan.'%"
								ORDER BY 
									b.replid desc';	
						// var_dump($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;
						$aksi    ='tampil';
						$subaksi ='detail';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								// print_r($res);exit();
								$out.= '<tr>
											<td>'.$res['kode'].'</td>
											<td>'.$res['katalog'].'</td>
											<td>'.$res['barkode'].'</td>
											<td>'.$res['sumber'].'</td>
											<td align="right">Rp. '.number_format($res['harga']).'</td>
											<td>'.$res['kondisi'].'</td>
											<td>'.$res['status'].'</td>
											<td>'.$res['keterangan'].'</td>
										</tr>';
								$nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break; 
				}
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s 		= $tb.' set 	lokasi 	= "'.filter($_POST['lokasiH']).'",
										kode 	= "'.filter($_POST['kodeTB']).'",
										nama 	= "'.filter($_POST['namaTB']).'",
										keterangan 	= "'.filter($_POST['keteranganTB']).'"';
				$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				// var_dump($s2);exit();
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
				$s = ' SELECT 
							t.kode,
							t.nama,
							t.keterangan,
							l.nama as lokasi
						from '.$tb.' t, sar_lokasi l 
						WHERE 
							t.lokasi= l.replid and
							t.replid='.$_POST['replid'];
				// var_dump($s);exit();
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$out 	= json_encode(array(
							'kode'       =>$r['kode'],
							'lokasi'     =>$r['lokasi'],
							'nama'       =>$r['nama'],
							'keterangan' =>$r['keterangan']
						));
			break;
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