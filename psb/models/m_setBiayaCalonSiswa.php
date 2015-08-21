<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'setbiaya';
	$tb  = 'psb_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$kelompok = isset($_POST['kelompokS'])?$_POST['kelompokS']:'';
				$nGol     = getNumRows('golongan');
				$nTing    = getNumRows2('tingkat');
				
				checkSetBiaya($kelompok);
				$sql ='SELECT
							k.tingkat,
							k.replid,
							(
								SELECT
									count(*)
								FROM
									psb_golongan
							) jumgol
						FROM
							aka_tingkat k';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = ($nGol*$nTing);//jumlah data per halaman
				$aksi    = 'tampil';
				$subaksi = '';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result  =$obj->result;

				$jum = mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;

					while($r1 = mysql_fetch_assoc($result)){	
						$out.= '<tr>
									<td valign="middle" rowspan="'.($r1['jumgol']+1).'">
										'.$nox.'. '.$r1['tingkat'].'
									</td>';
									// g.replid,
						$s2 ='	SELECT
									s.replid,
									g.golongan,
									g.keterangan,
									s.registration,
									s.tuition,
									s.material
								FROM
									psb_golongan g
									LEFT JOIN (
										SELECT * 
										FROM  psb_setbiaya s 
										WHERE 
											ting ='.$r1['replid'].' AND 
											kel = '.$kelompok.'
									)s ON s.gol = g.replid
									';
						// print_r($s2);exit();
						$e2  = mysql_query($s2);
						while ($r2=mysql_fetch_assoc($e2)) {
							$out.= '<tr>
										<td>'.$r2['golongan'].' ('.$r2['keterangan'].') <input name="golongan[]" value="'.$r2['replid'].'" type="hidden"></td> 
										<td align="right"><div class="input-control text"><input class="text-right" value="Rp. '.number_format($r2['registration']).'"   onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="registrationTB_'.$r2['replid'].'"></div></td> 
										<td align="right"><div class="input-control text"><input class="text-right"value="Rp. '.number_format($r2['tuition']).'"   onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="tuitionTB_'.$r2['replid'].'"></div></td> 
										<td align="right"><div class="input-control text"><input class="text-right"value="Rp. '.number_format($r2['material']).'"   onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="materialTB_'.$r2['replid'].'"></div></td> 
									</tr>';
						}
						$out.= '</tr>';
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
				$stat2= true;
				foreach ($_POST['golongan'] as $i => $v) {
					$s = 'UPDATE '.$tb.' set 	tuition      = '.filter(getuang($_POST['tuitionTB_'.$v])).',
												material     = '.filter(getuang($_POST['materialTB_'.$v])).',
												registration = '.filter(getuang($_POST['registrationTB_'.$v])).'
										WHERE 	replid 	 = '.$v;
					// print_r($s);exit();
					$e     = mysql_query($s);
					$stat2 = $e?true:false;
				}$stat = $stat2?'sukses':'gagal';
				$out = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT *
							from '.$tb.'
							WHERE 
								replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'kelas'      =>$r['kelas'],
							'wali'       =>$r['wali'],
							'kapasitas'  =>$r['kapasitas'],
							'keterangan' =>$r['keterangan'],
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// aktifkan -----------------------------------------------------------------
			case 'aktifkan':
				$e1   = mysql_query('UPDATE  '.$tb.' set aktif="0" where departemen = '.$_POST['departemen']);
				if(!$e1){
					$stat='gagal menonaktifkan';
				}else{
					$s2 = 'UPDATE  '.$tb.' set aktif="1" where replid = '.$_POST['replid'];
					$e2 = mysql_query($s2);
					if(!$e2){
						$stat='gagal mengaktifkan';
					}else{
						$stat='sukses';
					}
				}$out  = json_encode(array('status'=>$stat));
				//var_dump($stat);exit();
			break;
			// aktifkan -----------------------------------------------------------------

		}
	}echo $out;

	// ---------------------- //
	// -- created by epiii -- //
	// ---------------------- //
?>