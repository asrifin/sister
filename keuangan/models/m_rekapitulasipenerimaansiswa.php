<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	$mnu  = 'pembayaran';
	$mnu2 = 'rekening';
	$mnu3 = 'katalog';
	$mnu4 = 'barang';
	$mnu5 = 'jenis';
	
	$tb   = 'keu_'.$mnu;
	$tb2  = 'keu_'.$mnu2;
	$tb3  = 'keu_'.$mnu3;
	$tb4  = 'keu_'.$mnu4;
	$tb5  = 'keu_'.$mnu5;

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
				$page       = $_GET['page']; // get the requested page
				$limit      = $_GET['rows']; // get how many rows we want to have into the grid
				$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
				$sord       = $_GET['sord']; // get the direction
				$searchTerm = $_GET['searchTerm'];

				if(!$sidx) 
					$sidx =1;
				$ss='SELECT *
					FROM '.$tb2.' 
					WHERE	kode  LIKE "%'.$searchTerm.'%"
							OR nama LIKE "%'.$searchTerm.'%"';
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
						'kode'   =>$row['kode'],
						'nama'   =>$row['nama'],
					);
				}$response=array(
					'page'    =>$page,
					'total'   =>$total_pages,
					'records' =>$count,
					'rows'    =>$rows,
				);
			$out=json_encode($response);
		}else{
			$out=json_encode(array('status'=>'invalid_no_post'));
		}
	}else{
		switch ($_POST['aksi']) {
			// tampil ---------------------------------------------------------------------
			case 'tampil':
				$biaya       = isset($_POST['biayaS'])?filter($_POST['biayaS']):'';
				$departemen  = isset($_POST['departemenS'])?filter($_POST['departemenS']):'';
				$tahunajaran = isset($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';
				
				$sql = 'SELECT 
							vk.idtingkat,
							vk.tingkat,
							IFNULL(tb.biayaTotal,0)biayaTotal,
							IFNULL(tb.biayaTerbayar,0)biayaTerbayar,
							IFNULL(tb.biayaKurang,0)biayaKurang
						FROM	
							vw_kelas vk
							LEFT JOIN (
								SELECT
									vsk.idtingkat,
									sum(getBiayaNett(vsb.idsiswabiaya))biayaTotal,	
									sum(getBiayaTerbayar(vsb.idsiswabiaya))biayaTerbayar,
									sum((getBiayaNett(vsb.idsiswabiaya)-getBiayaTerbayar(vsb.idsiswabiaya)))biayaKurang
								FROM
									vw_siswa_biaya vsb 
									JOIN vw_siswa_kelas vsk on vsk.idsiswa = vsb.idsiswa
								WHERE
									vsb.idbiaya = '.$biaya.' and
									vsb.iddepartemen = '.$departemen.' and
									vsb.idtahunajaran='.$tahunajaran.'
								GROUP BY 
									vsk.idtingkat
							)tb on tb.idtingkat = vk.idtingkat
						WHERE	
							vk.iddepartemen = '.$departemen.' and 
							vk.idtahunajaran = '.$tahunajaran.'
						GROUP BY
							vk.idtingkat
						ORDER BY
							vk.urutan asc';
				if(isset($_POST['starting'])){ 
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				#ada data
				$result = mysql_query($sql);
				$jum    = mysql_num_rows($result);
				$out    ='';$grandTotal=$lunasTotal=$terbayarTotal=$kurangTotal=0;
				if($jum!=0){	
					$nox=1;
					while($res = mysql_fetch_assoc($result)){
					 	$out.= '<tr>
								 <td>'.$nox.'. '.$res['tingkat'].'</td>
								 <td align="right">'.setuang($res['biayaTerbayar']).'</td>
								 <td align="right">'.setuang($res['biayaKurang']).'</td>
								 <td align="right">'.setuang($res['biayaTotal']).'</td>
								</tr>';
						$terbayarTotal+=$res['biayaTerbayar'];
						$kurangTotal+=$res['biayaKurang'];
						$grandTotal+=$res['biayaTotal'];
						$nox++;
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan="9" ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}$out.='<tr class="bg-blue fg-white">
					<th align="right">Total</th>
					<th align="right">'.setuang($terbayarTotal).'</th>
					<th align="right">'.setuang($kurangTotal).'</th>
					<th align="right">'.setuang($grandTotal).'</th>
				</tr>';
			break; 
			// tampil ---------------------------------------------------------------------
		}
	}echo $out;
?>