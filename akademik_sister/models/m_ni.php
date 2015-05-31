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

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
			$page       = $_GET['page']; // get the requested page
			$limit      = $_GET['rows']; // get how many rows we want to have into the grid
			$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
			$sord       = $_GET['sord']; // get the direction
			$searchTerm = $_GET['searchTerm'];

			if(!$sidx) 
				$sidx =1;
			$ss=	'SELECT * 
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
							b.status = 1 
							and  l.replid = '.$_GET['lokasi'].' 
						)tb
					WHERE	
						tb.nama LIKE "%'.$searchTerm.'%"
						OR tb.kode LIKE "%'.$searchTerm.'%"';
						// '.(isset($_POST['barang']) and is_array($_POST['barang']) and !is_null($_POST['barang'])?'AND b.replid NOT IN ('.$_POST['barang'].')':'').'

			// print_r($ss);exit();
			$result = mysql_query($ss);
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
				$rows[]= array(
					'replid' =>$row['replid'],
					'nama'   =>$row['nama'],
					'kode'   =>$row['kode']
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
				$lokasi   = isset($_POST['lokasiS'])?filter(trim($_POST['lokasiS'])):'';
				$peminjam = isset($_POST['peminjamS'])?filter(trim($_POST['peminjamS'])):'';
				$keterangan = isset($_POST['keteranganS'])?filter(trim($_POST['keteranganS'])):'';
				$s        = 'SELECT 
								tb.*,
								IF (dikembalikan = allitem,"lunas","hutang") status
							from(
								SELECT
									p.*,(
										SELECT COUNT(*)
										from sar_dpeminjaman d
										where 
											d.peminjaman = p.replid AND 
											d.tgl_kembali!="0000-00-00"
									)dikembalikan,(
										SELECT COUNT(*)
										from sar_dpeminjaman d
										where d.peminjaman = p.replid 
									)allitem
								FROM
									sar_peminjaman2 p
								WHERE 
									p.lokasi 	 ='.$lokasi.' AND
									p.peminjam 	 LIKE "%'.$peminjam.'%" AND
									p.keterangan LIKE "%'.$keterangan.'%"
							)tb';
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
						$out.= '<tr>
									<td>'.$res['peminjam'].'</td>
									<td>'.tgl_indo($res['tgl_pinjam']).'</td>
									<td>'.tgl_indo($res['tgl_kembali']).'</td>
									<td>'.$res['keterangan'].'</td>
									<td>
										<button onclick="viewFR('.$res['replid'].');" '.($res['status']=='hutang'?'data-hint="status| '.($res['allitem']-$res['dikembalikan']).' belum dikembalikan" class="warning"':'class="info" data-hint="Status|Sudah dikembalikan"').' >
											<i class="icon-search on-left"></i>'.$res['allitem'].' item
										</button>
									 </td>
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

			// add  -----------------------------------------------------------------
			case 'simpan':
				$s='INSERT INTO sar_peminjaman2 set lokasi		='.$_POST['lokasiH'].',
													peminjam	="'.filter($_POST['peminjamTB']).'",
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
			//add --------------------------------------------------------------------

			case 'kembalikan':
				$s1='UPDATE sar_dpeminjaman set tgl_kembali=NOW() WHERE replid  IN ('.$_POST['dpeminjaman'].')';
				$e1=mysql_query($s1);

				if(!$e1){
					$stat='gagal_update_peminjaman_('.mysql_error().')';
				}else{
					$s2='UPDATE sar_barang set status=1 WHERE replid  IN ('.$_POST['barang'].')';
					$e2=mysql_query($s2);
					if(!$e2){
						$stat='gagal_update_barang_('.mysql_error().')';
					}else{
						$stat='sukses';
					}
				}$out=json_encode(array('status'=>$stat));
				// var_dump($s1);exit();
			break;

			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from sar_dftp  where replid='.$_POST['replid']));
				$s    = 'DELETE from sar_dftp WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['barang']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'detail':
				$s   = ' SELECT * FROM sar_peminjaman2 WHERE replid='.$_POST['peminjaman'];
				$e   = mysql_query($s);
				$r   = mysql_fetch_assoc($e);
				$barangArr=array();
				if(!$e){ 
					$stat='gagal_view_peminjaman';
				}else{
					$s2 = 'SELECT
								b.replid as idbarang,
								d.replid as iddpeminjaman,
								CONCAT(l.kode,"/",g.kode,"/",t.kode,"/",k.kode,"/",LPAD(b.urut, 5, 0)) kode,
								k.nama AS barang,
								d.tgl_kembali AS tgl_kembali2,
								CASE
									when d.tgl_kembali="0000-00-00"  and CURDATE()>p.tgl_kembali  then 1
									when d.tgl_kembali="0000-00-00"  and CURDATE()<=p.tgl_kembali  then 2
									when d.tgl_kembali!="0000-00-00"  and d.tgl_kembali>p.tgl_kembali  then 3
									when d.tgl_kembali!="0000-00-00"  and d.tgl_kembali<=p.tgl_kembali  then 4
								END as status
								
							FROM
								sar_dpeminjaman d
								JOIN sar_peminjaman2 p ON p.replid = d.peminjaman
								JOIN sar_barang b ON b.replid = d.barang
								JOIN sar_tempat t ON t.replid = b.tempat
								JOIN sar_lokasi l ON l.replid = t.lokasi
								JOIN sar_katalog k ON k.replid = b.katalog
								JOIN sar_grup g ON g.replid = k.grup
							WHERE
								d.peminjaman = '.$_POST['peminjaman'];
					// var_dump($s2);exit();
					$e2 = mysql_query($s2);
					if(!$e2){
						$stat=mysql_error();
					}else{
						while ($r2=mysql_fetch_assoc($e2)) {
							switch ($r2['status']) {
								case 1:
									$ket ='masih dipinjam';
									$clr ='blue';		
								break;
								case 2:
									$ket ='terlambat, belum dikembalikan';
									$clr ='red';		
								break;
								case 3:
									$ket ='sudah mengembalikan';
									$clr ='green';		
								break;
								case 4:
									$ket ='terlambat, sudah dikembalikan';
									$clr ='orange';		
								break;
								
								/*case 'borrowed_before':
									$stat ='masih dipinjam';
									$clr  ='blue';		
								break;
								case 'borrowed_after':
									$stat ='terlambat, belum dikembalikan';
									$clr  ='red';		
								break;
								case 'returned_before':
									$stat ='sudah mengembalikan';
									$clr  ='green';		
								break;
								case 'returned_after':
									$stat ='terlambat, sudah dikembalikan';
									$clr  ='orange';		
								break;*/
							}
							$barangArr[]=array(
									'idbarang'      =>$r2['idbarang'],
									'iddpeminjaman' =>$r2['iddpeminjaman'],
									'kode'          =>$r2['kode'],
									'barang'        =>$r2['barang'],
									'tgl_kembali2'  =>$r2['tgl_kembali2']!='0000-00-00'?tgl_indo($r2['tgl_kembali2']):'-',
									'status'        =>$r2['status'],
									'keterangan'    =>$ket,
									'color'         =>$clr
								);
						}$stat='sukses';
					}
				}
				$out = json_encode(array(
							'status' =>$stat,
							'data'   =>array(
								'replid'      =>$r['replid'],
								'peminjam'    =>$r['peminjam'],
								'tgl_pinjam'  =>tgl_indo($r['tgl_pinjam']),
								'tgl_kembali' =>tgl_indo($r['tgl_kembali']),
								'keterangan'  =>$r['keterangan'],
								'barangArr'   =>$barangArr
						)));
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