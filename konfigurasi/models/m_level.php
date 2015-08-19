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
						$l = getField('level','kon_level','id_level',$_POST['id_level']);
						$k = getField('keterangan','kon_level','id_level',$_POST['id_level']);
						$level = $k.' ('.$l.')';

						$s2 = '	SELECT lk.*,kg.keterangan 
								FROM kon_levelkatgrupmenu lk 
									JOIN kon_katgrupmenu kg on kg.id_katgrupmenu = lk.id_katgrupmenu  
								WHERE lk.id_level ='.$_POST['id_level'].'
								ORDER BY lk.isDefault DESC';
								// pr($s2);
						$e2 = mysql_query($s2);
						$stat=!$e2?'gagal':'sukses';
						$katgrupmenuArr=array();
						while ($r2=mysql_fetch_assoc($e2)) {
							$s3 = 'SELECT
										a.*,
										if((
											SELECT id_levelaksi 
											FROM kon_levelaksi 
											WHERE 
												id_aksi = a.id_aksi and 
												id_levelkatgrupmenu='.$r2['id_levelkatgrupmenu'].'
											) IS null ,0,1)stataksi
									FROM
										kon_aksi a';
										// LEFT JOIN kon_levelaksi la ON la.id_aksi = a.id_aksi';
							// pr($s3);
							$e3      = mysql_query($s3);
							$stat    = $e3?'sukses':'gagal';
							$aksiArr = array();
							while($r3 = mysql_fetch_assoc($e3)){
								$aksiArr[] = array(
									'id_aksi'             =>$r3['id_aksi'],
									'aksi'                =>$r3['aksi'],
									'keterangan'          =>$r3['keterangan'],
									'stataksi'            =>$r3['stataksi'],
									'id_levelkatgrupmenu' =>$r2['id_levelkatgrupmenu'],
									'id_katgrupmenu'      =>$r2['id_katgrupmenu'],
								);		
							}
							$katgrupmenuArr[]=array(
								'keterangan' =>$r2['keterangan'],
								'isDefault'  =>$r2['isDefault'],
								'aksiArr'    =>$aksiArr
							);
						}
						$out = json_encode(array(
							'status' =>$stat,
							'data'   =>array(
								'level'          =>$level,
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
									BY urutan asc';
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
							while($res = mysql_fetch_assoc($result)){	
								$nox = '<span  class="input-control select"><select '.(isAksi('level','u')?'onchange="urutFC(this);"':'disabled').' class="text-center" replid1="'.$res['id_level'].'" urutan1="'.$res['urutan'].'"  >';
								for($i=1; $i<=$jum; $i++){
									if($i==$res['urutan'])
										$nox.='<option selected="selected" value="'.$i.'">'.$i.'</option>';
									else
										$nox.='<option value="'.$i.'">'.$i.'</option>';
								}$nox.='</select></span>';

								// <button data-hint="detail"  onclick="viewFR(\'aksi\','.$res['id_'.$mnu].');">
								$btn ='<td align="center">
											<button '.(isAksi('level','u')?'onclick="viewFR(\'levelaksi\','.$res['id_'.$mnu].');"':'disabled').'  data-hint="detail"  >
												<i class="icon-zoom-in"></i>
											</button>
											<button '.(isAksi('level','u')?'onclick="viewFR(\'level\','.$res['id_'.$mnu].');"':'disabled').' data-hint="ubah"  >
												<i class="icon-pencil"></i>
											</button>
											<button '.(isAksi('level','d')?'onclick="del('.$res['id_'.$mnu].');"':'disabled').' data-hint="hapus" >
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
						$stat2=true;
						$s1 = '	DELETE 
								from kon_levelaksi 
								WHERE id_levelkatgrupmenu IN (
										SELECT id_levelkatgrupmenu 
										FROM kon_levelkatgrupmenu 
										WHERE id_level = '.$_POST['id_level'].'
									)';	
						$e1 = mysql_query($s1);
						if(!$e1){
							$stat2=false;
						}else{
							if(isset($_POST['aksiTB'])){
								foreach ($_POST['aksiTB'] as $i => $v) { // katgrupmenu 2 :(M,T)
									foreach ($_POST['aksiTB'][$i] as $ii => $vv) { // aksi 6 :(c,r,u,d,s,p)
										foreach ($_POST['aksiTB'][$i][$ii] as $iii => $vvv) { // kelmpok modul 2:(default, tambahan)
											$sl = ' SELECT id_levelkatgrupmenu from kon_levelkatgrupmenu 
													where 
														id_level       ='.$_POST['id_level'].' AND
														id_katgrupmenu ='.$i.' AND
														isDefault      ='.$iii;
											// vd($sl);e
											$el=mysql_query($sl);
											$rl=mysql_fetch_assoc($el);

											$s2= 'INSERT INTO kon_levelaksi SET id_levelkatgrupmenu ='.$rl['id_levelkatgrupmenu'].',
																				id_aksi            ='.$ii;
											$e2= mysql_query($s2);
											$stat2=!$e2?false:true;
										}
									}
								}
							}
						}
						$stat=!$stat2?'gagal':'sukses';
						$out=json_encode(array('status'=>$stat));
					break;

					case 'level':
						$stat2 =true;
						$s = $tb.' set 	'.$mnu.' 	= "'.filter($_POST[''.$mnu.'TB']).'",
										keterangan 	= "'.filter($_POST['keteranganTB']).'"';
						if(isset($_POST['id_'.$mnu])){
							$s = 'UPDATE '.$s.' WHERE id_'.$mnu.'='.$_POST['id_'.$mnu];
							$e = mysql_query($s);
							if(!$e){
								$stat2 = false;
							}
						}else{
							$s2 ='INSERT INTO '.$s.', urutan=(SELECT (COUNT(*)+1) FROM kon_level l)';
							$e  = mysql_query($s2);
							$id = mysql_insert_id();

							if(!$e){
								$stat2=false;
							}else{
								$s1 = 'SELECT * from kon_katgrupmenu ';
								$e1 = mysql_query($s1);
								while ($r1=mysql_fetch_assoc($e1)) {
									for ($i=0; $i<=1 ; $i++) { 
										$s2 = 'INSERT INTO kon_levelkatgrupmenu set id_level 		= '.$id.',
																					id_katgrupmenu  = '.$r1['id_katgrupmenu'].
																					($i==1?',isDefault=0':'');
										$e2 = mysql_query($s2);
										$stat2=!$e2?false:true;
									}
								}
							}
						}
						$stat = ($stat2)?'sukses':'gagal';
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
					$w.='where id_'.$mnu.'='.$_POST['id_'.$mnu];
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
						ORDER  BY urutan ASC';
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

			// urutan -----------------------------------------------------------------
			case 'urutan':
				// 1 = asal
				// 2 = tujuan
				$_1 = mysql_fetch_assoc(mysql_query('SELECT urutan from '.$tb.' WHERE id_level='.$_POST['replid1']));
				$_2 = mysql_fetch_assoc(mysql_query('SELECT id_level from '.$tb.' WHERE urutan='.$_POST['urutan2']));
				$s1		= ' UPDATE '.$tb.' 
							SET urutan = '.$_POST['urutan2'].'  
							WHERE 
								id_level='.$_POST['replid1'];
				$s2		= ' UPDATE '.$tb.' 
							SET urutan = '.$_1['urutan'].'  
							WHERE 
								id_level='.$_2['id_level'];
				// var_dump($s1);exit();
				$e1 	= mysql_query($s1);
				if(!$e1){
					$stat='gagal ubah urutan semula ';
				}else{
					$e2 = mysql_query($s2);
					if(!$e2)
						$stat = 'gagal ubah urutan kedua';
					else
						$stat= 'sukses';
				}
				$out 	= json_encode(array(
							'status'  =>$stat,
						));
			break;
			// urutan ------			

		}
	}echo $out;

?>