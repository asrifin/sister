<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'level';
	$tb  = 'kon_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// view -----------------------------------------------------------------
			case 'tampil':
				switch ($_POST['subaksi']) {
					case 'levelaksi':
						$s1 = 'SELECT * FROM kon_level WHERE id_level='.$_POST['id_level'];
						$e1 = mysql_query($s1);
						$r1 = mysql_fetch_assoc($e1);

						$s2 = 'SELECT
									k.id_katgrupmenu,
									k.katgrupmenu,
									k.keterangan,
									IF (tbk.id_katgrupmenu IS NULL,0,1) statgrupmenu
								FROM
									kon_katgrupmenu k
									LEFT JOIN (
										SELECT
											kg.keterangan,
											kg.id_katgrupmenu
										FROM
											kon_levelkatgrupmenu lkg
										LEFT JOIN kon_katgrupmenu kg ON kg.id_katgrupmenu = lkg.id_katgrupmenu
										WHERE
											lkg.id_level = '.$_POST['id_level'].'
									) tbk ON tbk.id_katgrupmenu = k.id_katgrupmenu';
						$e2 = mysql_query($s2);
						$katgrupmenuArr=array();
						while ($r2=mysql_fetch_assoc($e2)) {
							$s3 = 'SELECT 
										tba.id_katgrupmenu,	
										tba.id_levelaksi,	
										ka.id_aksi,	
										ka.aksi,	
										ka.keterangan,
										IF(tba.id_aksi IS NOT NULL,1,0)stataksi
									FROM kon_aksi ka 
									LEFT JOIN (
										SELECT
											la.id_levelaksi,	
											a.id_aksi,	
											a.aksi,	
											a.keterangan,
											kg.id_katgrupmenu
										FROM
											kon_aksi a 
											left JOIN kon_levelaksi la on la.id_aksi = a.id_aksi 
											LEFT JOIN kon_levelkatgrupmenu lkg on lkg.id_levelkatgrupmenu = la.id_levelkatgrupmenu
											LEFT JOIN kon_katgrupmenu kg on kg.id_katgrupmenu = lkg.id_katgrupmenu
										WHERE	
											lkg.id_level = '.$_POST['id_level'].' and
											lkg.id_katgrupmenu= '.$r2['id_katgrupmenu'].'
										) tba on tba.id_aksi = ka.id_aksi';
							// var_dump($s3);exit();
							$e3   = mysql_query($s3);
							$stat = $e3?'sukses':'gagal';
							$aksiArr = array();
							while($r3 = mysql_fetch_assoc($e3)){
								$aksiArr[] = $r3;	
							}$katgrupmenuArr[]=array(
								'keterangan' =>$r2['keterangan'],
								'aksiArr'    =>$aksiArr
							);
						}$out = json_encode(array(
							'status' =>$stat,
							'data'   =>array(
								'level'          =>$r1['level'],
								'keterangan'     =>$r1['keterangan'],
								'katgrupmenuArr' =>$katgrupmenuArr
							)
						));
					break; 

					case 'level':
						$level      = (isset($_POST['levelS']) and trim($_POST['levelS'])!='')?filter($_POST['levelS']):'';
						$keterangan = (isset($_POST['keteranganS']) and trim($_POST['keteranganS'])!='')?filter($_POST['keteranganS']):'';
						$sql  = 'SELECT *
								FROM '.$tb.'
								WHERE 
									'.$mnu.' like "%'.$level.'%" and
									level like "%'.$level.'%" and
									keterangan like "%'.$keterangan.'%" 
								ORDER 
									BY '.$mnu.' asc';
						// print_r($sql);exit();
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}
						$recpage = 10;
						$aksi    ='tampil';
						$subaksi ='';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
						$result  = $obj->result;

						$jum = mysql_num_rows($result);
						$out ='';
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								// <button data-hint="detail"  onclick="viewFR(\'aksi\','.$res['id_'.$mnu].');">
								$btn ='<td align="center">
											<button data-hint="detail"  onclick="viewFR(\'levelaksi\','.$res['id_'.$mnu].');">
												<i class="icon-zoom-in"></i>
											</button>
											<button '.isDisabled($mnu,'u').' data-hint="ubah"  onclick="viewFR(\'level\','.$res['id_'.$mnu].');">
												<i class="icon-pencil"></i>
											</button>
											<button '.isDisabled($mnu,'d').' data-hint="hapus" onclick="del('.$res['id_'.$mnu].');">
												<i class="icon-remove"></i>
											</button>
										 </td>';
								$out.= '<tr>
											<td align="center">'.$nox.'</td>
											<td align="center">'.$res['level'].'</td>
											<td align="center">'.$res['keterangan'].'</td>
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
				}
			break;
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				switch ($_POST['subaksi']) {
					case 'levelaksi':
						/*search id_levelkatgrupmenu 
						delete levelaksi by id_levelkatgrupmenu
						insert levelaksi set id_levelkatgrupmenu & id_aksi*/
						
						// $c = count($_POST['aksiTB']);
						// var_dump($_POST['aksiTB'][1]);
							// var_dump($_POST['id_level']);
						$stat2 = true;
							var_dump($_POST['aksiTB']);exit();
						foreach ($_POST['aksiTB'] as $i => $v) {
							// get id_levelkatgrupmenu
							// $xx.=$v.
							// $s1 = 'SELECT id_levelkatgrupmenu FROM kon_levelkatgrupmenu WHERE id_katgrupmenu ='.$i.' AND id_level='.$_POST['id_level'];
							// $e1 = mysql_query($s1) or die('gagal_pilih_idlevelkatgrupmenu_'.mysql_error());
							// $r1 = mysql_fetch_assoc($e1);
							
							// // delete levelaksi by id_leveljatgrupmenu
							// $s2 = 'DELETE FROM kon_levelaksi WHERE id_levelkatgrupmenu='.$r1['id_levelkatgrupmenu']; 
							// $e2 = mysql_query($s2) or die('gagal_hapus_levelaksi_ke_'.$i);

							// $stat2 = !$e1?false:true;
							// foreach ($v as $i2 => $v2) {
							// 	// insert new levelaksi by idlevelkatgrupmenu
							// 	$s3 = 'INSERT INTO kon_levelaksi SET id_aksi='.$v2x.', id_levelkatgrupmenu ='.$r1['id_levelkatgrupmenu'];
							// 	$e3 = mysql_query($s3);
							// 	// var_dump($r1);
							// 	// exit();
							// 	$stat2 = !$e3?false:true;
							// }
						}$stat=!$stat2?'gagal':'sukses';
						$out=json_encode(array('status'=>$stat));
					break;

					case 'level':
						$s 	  = $tb.' set 	'.$mnu.' 	= "'.filter($_POST[''.$mnu.'TB']).'",
											keterangan 	= "'.filter($_POST['keteranganTB']).'"';
						$s2   = isset($_POST['id_'.$mnu])?'UPDATE '.$s.' WHERE id_'.$mnu.'='.$_POST['id_'.$mnu]:'INSERT INTO '.$s;
						$e    = mysql_query($s2);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat));
					break;
					
				}
			break;
			// add / edit -----------------------------------------------------------------
			

			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where id_'.$mnu.'='.$_POST['id_'.$mnu]));
				$s    = 'DELETE from '.$tb.' WHERE id_'.$mnu.'='.$_POST['id_'.$mnu];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 	= ' SELECT *
						from '.$tb.'
						WHERE id_'.$mnu.'='.$_POST['id_'.$mnu];
				// var_dump($s);exit();
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'level'      =>$r[$mnu],
							'keterangan' =>$r['keterangan']
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// aktifkan -----------------------------------------------------------------
			case 'aktifkan':
				$e1   = mysql_query('UPDATE  '.$tb.' set aktif="0"');
				if(!$e1){
					$stat='gagal menonaktifkan';
				}else{
					$s2 = 'UPDATE  '.$tb.' set aktif="1" where id_ .$mnu= '.$_POST['id_'.$mnu];
					$e2 = mysql_query($s2);
					if(!$e2){
						$stat='gagal mengaktifkan';
					}else{
						$stat='sukses';
					}
				}$out  = json_encode(array('status'=>$stat));
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbwarna -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['id_'.$mnu])){
					$w.='where id_ .$mnu='.$_POST['id_'.$mnu];
				}else{
					if(isset($_POST[$mnu])){
						$w.='where '.$mnu.'='.$_POST[$mnu];
					}elseif(isset($_POST['departemen'])){
						$w.='where departemen ='.$_POST['departemen'];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY 
							aktif desc,
							nama desc';
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
						if(!isset($_POST['id_'.$mnu])){
							while ($r=mysql_fetch_assoc($e)) {
								$dt[]=$r;
							}
						}else{
							$dt[]=mysql_fetch_assoc($e);
						}$ar = array('status'=>'sukses',$mnu=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbtahunajaran -----------------------------------------------------------------

		}
	}echo $out;

?>