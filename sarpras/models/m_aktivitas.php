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
							)biayaRencana,(
								select 
									sum(biaya2)biayaRealisasi
								from sar_detailaktivitas 
								where aktivitas = a.replid
							)biayaRealisasi
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
					 	if($res['biayaRealisasi']==0){
							$hint = 'pending';
							$bg   = 'amber';
							$poBtn= '<a target="_blank" href="http://localhost/sister/purchaseorder/admin.php?pilih=po&mod=yes" data-hint="PO"  class="button"" >
									<i class="icon-checkmark"></i>
									</button>';
						}else{
							$hint = 'acc.';
							$bg   = 'lightTeal';
							$poBtn='';
					 	}
						$btn ='<td align="center">
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>&nbsp;'.$poBtn.'
								 </td>';
						$out.= '<tr data-hint="'.$hint.'" data-hint-position="left"  class="bg-'.$bg.'">
									<td class="text-center">'.tgl_indo5($res['tanggal1']).' - '.tgl_indo5($res['tanggal2']).'</td>
									<td>'.$res['aktivitas'].'</td>
									<td align="right">Rp. '.number_format($res['biayaRencana']).'</td>
									<td align="right">Rp. '.number_format($res['biayaRealisasi']).'</td>
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
				$s1 = $tb.' SET tanggal1   ="'.tgl_indo6($_POST['tanggal1TB']).'",
								tanggal2   ="'.tgl_indo6($_POST['tanggal2TB']).'",
								aktivitas  ="'.$_POST['aktivitasTB'].'",
								lokasi     ="'.$_POST['lokasiH'].'",
								keterangan ="'.$_POST['keteranganTB'].'"';
				$s  = (isset($_POST['replid']) AND $_POST['replid']!='')?'UPDATE '.$s1.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s1;
				$e  = mysql_query($s);
				$id = (isset($_POST['replid']) AND $_POST['replid']!='')?$_POST['replid']:mysql_insert_id();
				if(!$e) $stat='gagal_insert_aktivitas';
				else{
					// 2.a hapus item detail aktivitas (jika ada)
					$stat22 = true;
					if(isset($_POST['idDelTR']) AND $_POST['idDelTR']!=''){
						$ss2  = 'DELETE FROM '.$tb3.' WHERE replid IN ('.$_POST['idDelTR'].')';
						$ee2  = mysql_query($ss2);
						$stat22 = !$ee2?false:true; 
						// var_dump($ee2);exit();
					}
					// 2.b simpan detail aktivitas (wajib)
					$stat2 =$stat2 = true;
					$nomDebit = $nomKredit = 0;
					
					if(!$stat22) $stat='gagal_delete_detail_aktivitas'; // ada hapus detail aktivitas AND gagal 
					else{ // tidak ada hapus detail aktivitas OR sukses hapus
						$xx='';
						foreach ($itemArr as $i => $v) {
							$item     = isset($_POST['item_'.$v.'TB'])?'item="'.getuang($_POST['item_'.$v.'TB']).'",':'';
							$jumlah   = isset($_POST['jumlah_'.$v.'TB'])?'jumlah='.getuang($_POST['jumlah_'.$v.'TB']).',':'';
							$biaya    = isset($_POST['biaya_'.$v.'TB'])?'biaya='.getuang($_POST['biaya_'.$v.'TB']).',':'';
							$tglbayar = (isset($_POST['tglbayar_'.$v.'TB']) && $_POST['tglbayar_'.$v.'TB']!='-' )?'tglbayar="'.tgl_indo6($_POST['tglbayar_'.$v.'TB']).'",':'';
							$tgllunas = (isset($_POST['tgllunas_'.$v.'TB']) && $_POST['tgllunas_'.$v.'TB']!='-')?tgl_indo6($_POST['tgllunas_'.$v.'TB']):'0000-00-00';
							$s        = $tb3.' SET 	aktivitas='.$id.', 
													'.$biaya.'
													'.$jumlah.'
													'.$item.'
													'.$tglbayar.'
													tgllunas ="'.$tgllunas.'"';
							if($_POST['mode'.$v.'H']=='edit')//edit
								$s2   = 'UPDATE '.$s.' WHERE replid='.$_POST['iditem_'.$v.'H'];
							else // add
								$s2   ='INSERT INTO '.$s;
// var_dump($s2);exit();
							$xx.=$s2;
							$e2    = mysql_query($s2);
							$stat2 =!$e2?false:true;
						}
						// var_dump($xx);exit();
						if(!$stat2)  $stat = 'gagal_simpan_detail_aktivitas';
						else $stat = 'sukses';
					}
				}$out=json_encode(array('status'=>$stat));
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
							'biayaTot2' =>intval($r2['biaya2']),
							'tglbayar'  =>($r2['tglbayar']=='0000-00-00'?'-':tgl_indo5($r2['tglbayar'])),
							'tgllunas'  =>($r2['tgllunas']=='0000-00-00'?'-':tgl_indo5($r2['tgllunas'])),
						);
						$biayaSatSum+=intval($r2['biaya']);
						$biayaTotSum+=(intval($r2['biaya']) * intval($r2['jumlah']));
						$biayaTotSum2+=intval($r2['biaya2']);
					}
				 	$stat = ($e2)?'sukses':'gagal_ambil_detail_aktivitas';
				}$out  = json_encode(array(
							'status'       =>$stat,
							'lokasi'       =>$r['lokasi'],
							'tanggal1'     =>tgl_indo5($r['tanggal1']),
							'tanggal2'     =>tgl_indo5($r['tanggal2']),
							'aktivitas'    =>$r['aktivitas'],
							'keterangan'   =>$r['keterangan'],
							'itemArr'      =>$itemArr
						));
			break;
			// ambiledit -----------------------------------------------------------------
		}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>