<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu  = 'jenislaporan';
	$tb   = 'keu_'.$mnu;

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
				$page       = $_GET['page']; 
				$limit      = $_GET['rows'];
				$sidx       = $_GET['sidx']; 
				$sord       = $_GET['sord'];
				$searchTerm = $_GET['searchTerm'];
				// $rekArr           = (isset($_GET['rekArr']) AND $_GET['rekArr']!='')?' AND r.replid NOT IN ('.$_GET['rekArr'].')':''; /*epiii*/
				// $detilanggaranArr = (isset($_GET['detilanggaranArr']) AND $_GET['detilanggaranArr']!='')?' AND d.replid NOT IN ('.$_GET['detilanggaranArr'].')':''; /*epiii*/

				// if(isset($_GET['jenis']) AND $_GET['jenis']!=''){
				// 	if($_GET['jenis']=='rekitem') // in || out 
				// 		$jenis = ' AND k.nama IN ("aktiva","modal","pendapatan","biaya","kewajiban")';
				// 	elseif($_GET['jenis']=='rekkas') // in || out
				// 		$jenis = ' AND k.nama IN ("kas","bank")';
				// 	else // ju 
				// 		$jenis = ' AND k.nama IN ("kas","aktiva") OR r.nama LIKE "%piutang%"';
				// }

				// if(isset($_GET['subaksi']) && $_GET['subaksi']=='rek'){ // rekening
					$ss='SELECT
							r.replid,
							r.kode,
							r.nama
						FROM
							keu_detilrekening r 
							LEFT JOIN keu_kategorirekening k on k.replid = r.kategorirekening
						WHERE
							(
								r.kode LIKE "%'.$searchTerm.'%"
								OR r.nama LIKE "%'.$searchTerm.'%"
							)';
							// '.$rekArr.$jenis;
							// '.(isset($_GET['jenis']) AND $_GET['jenis']!=''?'k.jenis="'.$_GET['jenis'].'" AND ':'').' (
				// }elseif(isset($_GET['subaksi']) && $_GET['subaksi']=='invoice'){ // invoice pembelian dr. PO
				// 	$ss='SELECT p.*
				// 		FROM po_pembelian p
				// 		WHERE 
				// 			p.noinvoice LIKE "%'.$searchTerm.'%" OR
				// 			p.nopo LIKE "%'.$searchTerm.'%" OR
				// 			p.kodesupplier LIKE "%'.$searchTerm.'%"';
				// }
	
				if(!$sidx) 
					$sidx =1;
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
					// if($_GET['subaksi']=='rek'){ // rekening 
						$arr= array(
							'replid' =>$row['replid'],
							'kode'   =>$row['kode'],
							'nama'   =>$row['nama'],
							// 'saldoSementara' =>$row['saldoSementara']
						);
					// }elseif($_GET['subaksi']=='detilanggaran'){ // anggaran 
					// 	$kuota=getKuotaAnggaran($row['replid']);
					// 	$arr= array(
					// 		'replid'           =>$row['replid'],
					// 		'nama'             =>$row['nama'],
					// 		'kategorianggaran' =>$row['kategorianggaran'],
					// 		'tingkat'          =>$row['tingkat'],
					// 		'kuotaBilCur'      =>'Rp. '.number_format($kuota['kuotaNum']),
					// 		'sisaBilCur'       =>'Rp. '.number_format($kuota['sisaNum']),
					// 		'terpakaiBilCur'   =>'Rp. '.number_format($kuota['terpakaiNum']),
					// 		'sisaBilNum'       => $kuota['sisaNum'],
					// 		'idrekening'       => $row['idrekening'],
					// 		'rekening'         => $row['rekening'],
					// 	);
					// }else{
					// 	$arr[]=$row;
					// }
					$rows[]=$arr; 
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
			// -----------------------------------------------------------------
			case 'tampil':
				$rekening = isset($_POST['rekeningS'])?filter($_POST['rekeningS']):'';
				$jenis    = isset($_POST['jenisS'])?filter($_POST['jenisS']):'';
				$kategori = isset($_POST['kategoriS'])?filter($_POST['kategoriS']):'';

				$sql = 'SELECT
							j.replid,
							concat("(",r.kode,") ",r.nama)rekening,
							IF ( j.kategori = "o","operasional","non operasional") kategori,
							IF(j.jenis="in","Penerimaan", "Pengeluaran")jenis
						FROM
							keu_jenislaporan j
							LEFT JOIN keu_detilrekening r ON r.replid = j.rekening
						WHERE
							(r.nama LIKE "%'.$rekening.'%" OR r.kode LIKE "%'.$rekening.'%" ) AND
							j.jenis LIKE "%'.$jenis.'%" AND 
							j.kategori LIKE "%'.$kategori.'%"
						ORDER BY	
							j.jenis ASC,	
							j.kategori ASC,
							r.kode ASC';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage = 10;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  =$obj->result;
				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					$curKat = '';
					$ec = mysql_query($sql);
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
							 </td>';
						$out.= '<tr>
									<td>'.$res['rekening'].'</td>
									<td class="text-center fg-white '.($res['kategori']=='operasional'?'bg-steel':'bg-gray').'">'.$res['kategori'].'</td>
									<td class="text-center fg-white '.($res['jenis']=='Pengeluaran'?'bg-red':'bg-green').'">'.$res['jenis'].'</td>
									'.$btn.'
								</tr>';
						$nox++;
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan=9><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.='<tr class="info"><td colspan="9">'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan="9">'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s    = $tb.' set 	rekening = "'.$_POST['rekeningH'].'", 
									kategori = "'.$_POST['kategoriTB'].'", 
									jenis    = "'.filter($_POST['jenisTB']).'"'; 
				$s2   = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
							// var_dump($s2);exit();
				$e    = mysql_query($s2);
				$stat = !$e?'gagal':'sukses';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s = ' SELECT 
							j.kategori,
							j.jenis,
							r.replid idrekening,
							concat("(",r.kode,") ",r.nama)rekening
						from '.$tb.' j
							LEFT JOIN keu_detilrekening r on r.replid = j.rekening 
						WHERE j.replid = '.$_POST['replid'];
				$e   = mysql_query($s);
				$stat= $e?'sukses':'gagal';
				$r   = mysql_fetch_assoc($e);
				// print_r($r);exit();
				$out = json_encode(array(
							'status'     =>$stat,
							'idrekening' =>$r['idrekening'],
							'rekening'   =>$r['rekening'],
							'kategori'   =>$r['kategori'],
							'jenis'      =>$r['jenis']
						));
			break;
			// ambiledit -----------------------------------------------------------------
			
			// cmbkategorirek -----------------------------------------------------------------
			case 'cmbkatmodulpembayaran':
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where '.$mnu.'='.$_POST[$mnu];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
							'.$w.'		
						ORDER  BY nama asc';

				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar =$dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error'.mysql_error());
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
			// cmbdepartemen -----------------------------------------------------------------

			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['rekening']));
			break;
			// delete -----------------------------------------------------------------
		}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>