<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'dokumen';
	$tb  = 'psb_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// view -----------------------------------------------------------------
			case 'tampil':
				switch ($_POST['subaksi']) {
					case 'subdokumen':
						if(isset($_POST['replid'])){ //edit
							$s  = ' SELECT
										t.replid idtingkat,	
										t.tingkat,
										t.kode,
										t1.jumlah,
										t1.satuanjumlah,
										t1.replid idsubdokumen
									FROM
										aka_tingkat t
										LEFT JOIN (
											SELECT
												replid,
												tingkat,
												satuanjumlah,
												jumlah
											FROM
												psb_subdokumen
											WHERE
												dokumen = '.$_POST['replid'].'
										)t1 on t1.tingkat = t.replid
									ORDER BY t.urutan asc';
								// pr($s);
						}else{ //add 
							$s  = ' SELECT replid idtingkat,tingkat,kode  FROM aka_tingkat ORDER BY urutan asc';
						}
						$e = mysql_query($s);
						$n = mysql_num_rows($e);
						$subdokumenArr=array();
						if(!$e) $stat='gagal_'.mysql_error();
						else{
							if($n<=0) $stat='subdokumen_kosong';
							else{
								$stat ='sukses';
								while($r = mysql_fetch_assoc($e)) $subdokumenArr[]=$r;
							} 
						}$out=json_encode(array('status'=>$stat,'subdokumenArr'=>$subdokumenArr));
					break;

					case 'dokumen':
						$dokumen = (isset($_POST[$mnu.'_dokumenS']) and trim($_POST[$mnu.'_dokumenS'])!='')?filter($_POST[$mnu.'_dokumenS']):'';
						$sql  = 'SELECT *
								FROM '.$tb.'
								WHERE dokumen like "%'.$dokumen.'%"';
								// pr($sql);
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
							$nox =$starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$btn ='<td align="center">
											<button '.(isAksi($mnu,'u')?'onclick="viewFR('.$res['replid'].');"':'disabled').' data-hint="ubah"  >
												<i class="icon-pencil"></i>
											</button>
											<button '.(isAksi($mnu,'d')?'onclick="del('.$res['replid'].');"':'disabled').' data-hint="hapus" >
												<i class="icon-remove"></i>
											</button>
										 </td>';
										$ss ='SELECT * FROM psb_subdokumen sd join aka_tingkat t on t.replid = sd.tingkat WHERE sd.dokumen='.$res['replid'];
										$ee = mysql_query($ss);
										$t = $tt = '';
										while ($rr = mysql_fetch_assoc($ee)) {
											$t.=','.$rr['tingkat'];
										}$tt.=substr($t,1);
								$out.= '<tr>
											<td align="justify"><pre>'.$res['dokumen'].'</pre></td>
											<td align="justify">'.$tt.'</td>
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
				$s = $tb.' set 	'.$mnu.' 	= "'.filter($_POST['dokumenTB']).'"';
				if(!isset($_POST['tingkatTB'])) $stat='silahkan pilih miniaml 1 tingkat/jenjang ';
				else{
					if(isset($_POST['replid'])){ //edit
						$s = 'UPDATE '.$s.' WHERE replid='.$_POST['replid'];
						$e = mysql_query($s);
						if(!$e) $stat2 = 'edit:gagal_update_dokumen';
						else{
							$ss='';
							foreach ($_POST['idsubdokumenH'] as $i => $v) {
								if(!empty($_POST['idsubdokumenH'][$i]) && isset($_POST['tingkatTB'][$i])){ //edit
									$ss   = ' UPDATE psb_subdokumen SET satuanjumlah='.$_POST['satuanjumlah'.$i.'TB'].',jumlah ='.$_POST['jumlah'.$i.'TB'].' WHERE replid='.$_POST['idsubdokumenH'][$i];
									$ee   = mysql_query($ss);
									$stat =!$ee?'edit:gagal_update_subdokumen':'sukses';
								}elseif(!empty($_POST['idsubdokumenH'][$i])){ // hapus
									$ss   ='DELETE FROM psb_subdokumen  where replid ='.$_POST['idsubdokumenH'][$i];
									$ee   = mysql_query($ss);
									$stat =!$ee?'edit:gagal_hapus_subdokumen':'sukses';
								}elseif(empty($_POST['idsubdokumenH'][$i]) && isset($_POST['tingkatTB'][$i])){ // add
									$ss= ' INSERT INTO psb_subdokumen SET  satuanjumlah='.$_POST['satuanjumlah'.$i.'TB'].', dokumen='.$_POST['replid'].', tingkat='.$i.', jumlah ='.$_POST['jumlah'.$i.'TB'];
									$ee = mysql_query($ss);
									$stat =!$ee?'edit:gagal_add_subdokumen':'sukses';
								}
							}
						}
					}else{ // add 
						$s2 ='INSERT INTO '.$s;
						$e  = mysql_query($s2);
						$id = mysql_insert_id();

						if(!$e){
							$stat='add:gagal_insert_dokumen';
						}else{
							foreach ($_POST['tingkatTB'] as $i => $v) {
								$ss = 'INSERT INTO psb_subdokumen set 	dokumen = '.$id.',
																		tingkat = '.$i.', 
																		satuanjumlah='.$_POST['satuanjumlah'.$i.'TB'].',
																		jumlah  = '.filter($_POST['jumlah'.$i.'TB']);
								$ee   = mysql_query($ss);
								$stat =!$ee?'add:gagal_add_subdokumen':'sukses';
							}
						}
					}
				}
				// $stat = ($stat2)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			

			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid ='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid ='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s1 = '	SELECT * 
						FROM '.$tb.'
						WHERE replid ='.$_POST['replid'];
				$e1   = mysql_query($s1);
				$r1   = mysql_fetch_assoc($e1);
				$stat =!$e1?'gagal':'sukses';
				$out  = json_encode(array(
							'status'  =>$stat,
							'dokumen' =>$r1['dokumen'],
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
				if(isset($_POST['replid'])){
					$w.='where sd.replid='.$_POST['replid'];
				}else{
					if(isset($_POST['tingkat'])){
						$w.='where sd.tingkat = '.$_POST['tingkat'];
					}
				}
				
				$s	= ' SELECT
							sd.replid,	
							d.dokumen,	
							sd.jumlah,
							sj.satuanjumlah
						FROM
							psb_subdokumen sd
							JOIN psb_dokumen d on d.replid = sd.dokumen
							JOIN psb_satuanjumlah sj on sj.replid = sd.satuanjumlah
						'.$w;
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
			// cmbtahunajaran -----------------------------------------------------------------
		}
	}echo $out;

?>