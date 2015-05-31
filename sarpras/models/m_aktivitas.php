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
				$lokasi = isset($_POST['lokasiS'])?filter($_POST['lokasiS']):'';
				// $tempat     = trim($_POST['tempatS'])?filter($_POST['tempatS']):'';
				// $keterangan = trim($_POST['keteranganS'])?filter($_POST['keteranganS']):'';
				$sql = 'SELECT t.*
						FROM '.$tb.' t, '.$tb2.' l
						WHERE 
							l.replid = t.lokasi and
							t.lokasi ='.$lokasi.'
						ORDER BY t.tanggal1 asc';
				// print_r($sql);exit(); 	
							// t.nama LIKE "%'.$tempat.'%" and
							// t.keterangan LIKE "%'.$keterangan.'%" 
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
						// <button data-hint="detail"  class="button" onclick="viewFR('.$res['replid'].');">
						// 	<i class="icon-zoom-in"></i>
						// </button>
						$btn ='<td>
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td class="text-center">'.tgl_indo5($res['tanggal1']).' - '.tgl_indo5($res['tanggal2']).'</td>
									<td>'.$res['aktivitas'].'</td>
									<td>'.$res['aktivitas'].'</td>
									<td>'.$res['aktivitas'].'</td>
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
				// 1. simpan aktivitas
				$totNominal = 0;
				$c          = count($_POST['idTR']);
				$itemArr    = $_POST['idTR'];
				// var_dump($c);exit();
				// foreach ($itemArr as $i => $v) {
				// 	$nom = intval(getuang($_POST[$sub.'_nominal'.$v.'TB']));
				// 	$totNominal+=$nom;
				// }
				// $totNominal =$sub=='ju'?($totNominal/2):$totNominal;
				$s1 = $tb.' SET tanggal1   ="'.tgl_indo6($_POST['tanggal1TB']).'",
								tanggal2   ="'.tgl_indo6($_POST['tanggal2TB']).'",
								aktivitas  ="'.$_POST['aktivitasTB'].'",
								lokasi     ="'.$_POST['lokasiH'].'",
								keterangan ="'.$_POST['keteranganTB'].'"';
				$s  = (isset($_POST['idformH']) AND $_POST['idformH']!='')?'UPDATE '.$s1.' WHERE replid='.$_POST['idformH']:'INSERT INTO '.$s1;
				$e  = mysql_query($s);
				$id = (isset($_POST['idformH']) AND $_POST['idformH']!='')?$_POST['idformH']:mysql_insert_id();
				if(!$e) $stat='gagal_insert_aktivitas';
				else{
					// 2.a hapus item detail aktivitas (jika ada)
					$stat22 = true;
					if(isset($_POST['idDelTR']) AND $_POST['idDelTR']!=''){
						$ss2  = 'DELETE FROM '.$tb2.' WHERE replid IN ('.$_POST['idDelTR'].')';
						$ee2  = mysql_query($ss2);
						$stat22 = !$ee2?false:true; 
					}
					// 2.b simpan detail aktivitas (wajib)
					$stat2 =$stat2 = true;
					$nomDebit = $nomKredit = 0;
					
					if(!$stat22) $stat='gagal_delete_detail_aktivitas'; // ada hapus detail aktivitas AND gagal 
					else{ // tidak ada hapus detail aktivitas OR sukses hapus
						$xx='';
						foreach ($itemArr as $i => $v) {
							$item     = getuang($_POST['item_'.$v.'TB']);
							$jumlah   = $_POST['jumlah_'.$v.'TB'];
							$biaya    = isset($_POST['biaya_'.$v.'TB'])?'biaya='.getuang($_POST['biaya_'.$v.'TB']).',':'';
							$tglbayar = isset($_POST['tglbayar_'.$v.'TB'])?tgl_indo6($_POST['tglbayar_'.$v.'TB']):'0000-00-00';
							$tgllunas = isset($_POST['tgllunas_'.$v.'TB'])?tgl_indo6($_POST['tgllunas_'.$v.'TB']):'0000-00-00';
							$s        = $tb3.' SET 	aktivitas='.$id.', 
													'.$biaya.'
													jumlah   ='.$jumlah.',
													tglbayar ="'.$tglbayar.'",
													tgllunas ="'.$tgllunas.'"';
							if($_POST['mode'.$v.'H']=='edit')//edit
								$s2   = 'UPDATE '.$s.' WHERE replid='.$_POST['iditem_'.$v.'H'];
							else // add
								$s2   ='INSERT INTO '.$s;

							$xx.=$s2;
							$e2    = mysql_query($s2);
							$stat2 =!$e2?false:true;
						}
						// var_dump($xx);exit();
	
						if(!$stat2) {
							$stat = 'gagal_simpan_detail_aktivitas';
						}else{
							$stat = 'sukses';
						}
					}
				}$out=json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['aktivitas']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT 
								t.tanggal1,
								t.tanggal2,
								t.aktivitas,
								t.keterangan,
								l.nama as lokasi
							from '.$tb.' t, sar_lokasi l 
							WHERE 
								t.lokasi= l.replid and
								t.replid='.$_POST['replid'];
				// var_dump($s);exit();
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				// $stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'lokasi'     =>$r['lokasi'],
							'tanggal1'  =>$r['tanggal1'],
							'tanggal2'  =>$r['tanggal2'],
							'aktivitas'  =>$r['aktivitas'],
							'keterangan' =>$r['keterangan']
						));
			break;
			// ambiledit -----------------------------------------------------------------
		}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>