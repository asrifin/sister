<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu   = 'aktivitas';
	$mnu2  = 'lokasi';
	$mnu3 = 'detailaktivitas';
	$tb    = 'sar_'.$mnu;
	$tb2   = 'sar_'.$mnu2;
	$tb3   = 'sar_'.$mnu3;
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$lokasi     = isset($_POST['lokasiS'])?filter($_POST['lokasiS']):'';
				$aktivitas  = isset($_POST['aktivitasS'])?filter($_POST['aktivitasS']):'';
				$keterangan = isset($_POST['keteranganS'])?filter($_POST['keteranganS']):'';
				$sql = 'SELECT
							a.*,(
								select 
									sum(biaya*jumlah)biayaRencana
								from sar_detailaktivitas 
								where aktivitas = a.replid
							)biaya
						FROM
							sar_aktivitas a
							LEFT JOIN sar_lokasi l ON l.replid = a.lokasi
						WHERE
							a.aktivitas LIKE "%'.$aktivitas.'%"
							and a.keterangan LIKE "%'.$keterangan.'%"
							AND a.lokasi = '.$lokasi.'
						ORDER BY
							a.ts DESC';
				// print_r($sql);exit(); 	
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				$recpage = 5;//jumlah data per halaman
				$aksi    ='';
				$subaksi ='tampil';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  =$obj->result;
				#ada data
				$jum     = mysql_num_rows($result);
				$out     ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button data-hint="lihat"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-zoom-in"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td class="text-center">'.tgl_indo5($res['tanggal1']).' - '.tgl_indo5($res['tanggal2']).'</td>
									<td>'.$res['aktivitas'].'</td>
									<td align="right">Rp. '.number_format($res['biaya']).'</td>
									<td><pre>'.$res['keterangan'].'</pre></td>
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
			case 'simpan':
				$itemArr = $_POST['idTR'];
				$stat2   =true;
				foreach ($itemArr as $i => $v) {
					$s    = 'UPDATE '.$tb3.' SET biaya2='.getuang($_POST['biaya2_'.$v.'TB']).' WHERE replid='.$_POST['iditem_'.$v.'H'];
					$e    = mysql_query($s);
					$stat2 =!$e?false:true;
				}
				// var_dump($xx);exit();
				$stat =!$stat2?'gagal_simpan_detail_aktivitas':'sukses';
				$out  =json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e = mysql_query($s);
				if(!$e){
					$stat='gagal_hapus_aktivitas';
				}else{
					$s2 = 'DELETE FROM '.$tb3.' WHERE aktivitas = '.$d['replid'];
					$e2 = mysql_query($s2);
					$stat=!$e2?'gagal_hapus_aktivitas':'sukses';
				}$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['aktivitas']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT 
								a.tanggal1,
								a.tanggal2,
								a.aktivitas,
								a.keterangan,
								a.tgltagihan,
								l.nama as lokasi
							from '.$tb.' a, sar_lokasi l 
							WHERE 
								a.lokasi= l.replid and
								a.replid='.$_POST['replid'];
				// var_dump($s);exit();
				$e       = mysql_query($s);
				$r       = mysql_fetch_assoc($e);
				$itemArr = array();
				$biayaSatSum=$biayaTotSum=$biayaTotSum2=0;
				if(!$e) $stat = ($e)?'sukses':'gagal_ambil_data_aktivitas';
				else{
					$s2 ='SELECT * FROM '.$tb3.' WHERE aktivitas ='.$_POST['replid'];
					$e2  = mysql_query($s2);
					while($r2 = mysql_fetch_assoc($e2)){
						$itemArr[]=array(
							'iditem'    =>$r2['replid'],
							'item'      =>$r2['item'],
							'jumlah'    =>$r2['jumlah'],
							'biayaSat'  =>intval($r2['biaya']),
							'biayaTot'  =>(intval($r2['biaya']) * intval($r2['jumlah'])),
						);
						$biayaSatSum+=intval($r2['biaya']);
						$biayaTotSum+=(intval($r2['biaya']) * intval($r2['jumlah']));
					}
				 	$stat = ($e2)?'sukses':'gagal_ambil_detail_aktivitas';
				}$out  = json_encode(array(
							'status'     =>$stat,
							'lokasi'     =>$r['lokasi'],
							'tanggal1'   =>tgl_indo5($r['tanggal1']),
							'tanggal2'   =>tgl_indo5($r['tanggal2']),
							'tgltagihan' =>tgl_indo5($r['tgltagihan']),
							'aktivitas'  =>$r['aktivitas'],
							'keterangan' =>$r['keterangan'],
							'itemArr'    =>$itemArr
						));
			break;
			// ambiledit -----------------------------------------------------------------
		}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>