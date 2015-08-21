<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'angsuran';
	$tb  = 'psb_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$cicilan    = isset($_POST['cicilanS'])?$_POST['cicilanS']:'';
				$keterangan = isset($_POST['keteranganS'])?$_POST['keteranganS']:'';
				$sql = 'SELECT *
						FROM  '.$tb.' 
						WHERE 
							cicilan LIKE "%'.$cicilan.'%" AND
							keterangan LIKE "%'.$keterangan.'%"
						ORDER BY 
							cicilan asc
							';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = 12;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					// $nox 	= $starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button '.(isAksi('user','u')?'onclick="viewFR('.$res['replid'].');"':'disabled').' data-hint="ubah"  >
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" '.(isAksi('user','d')?'onclick="del('.$res['replid'].');"':'disabled').'>
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td align="center">'.$res['cicilan'].'</td>
									<td align="center">'.$res['keterangan'].'</td>
									'.$btn.'
								</tr>';
						// $nox++;
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
				$s = $tb.' set 	cicilan = "'.filter($_POST['cicilanTB']).'",
								keterangan 	= "'.filter($_POST['keteranganTB']).'"';
				$s2	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e2 = mysql_query($s2);
				if(!$e2){
					$stat = 'gagal menyimpan';
				}else{
					$stat = 'sukses';
				}$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['cicilan']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT *
							from '.$tb.'
							WHERE  replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'cicilan'    =>$r['cicilan'],
							'keterangan' =>$r['keterangan'],
						));
			break;
			// ambiledit -----------------------------------------------------------------
		}
	}echo $out;

	// ---------------------- //
	// -- created by rovi -- //
	// ---------------------- //
?>