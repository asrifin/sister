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
				switch ($_POST['aksi']) {
					case 'subdokumen':
						$s  = ' SELECT 	
									sd.replid,
									t.replid idtingkat,
									t.tingkat,
									sd.jumlah,
								FROM aka_tingkat t 
									LEFT JOIN psb_subdokumen sd on sd.tingkat = t.replid 
								WHERE 
									sd.dokumen = '.$_POST['replid'];
						$e    = mysql_query($s);
						$n    = mysql_num_rows($e);
						$subdokumenArr=array();
						if(!$e) $stat='gagal_'.mysql_error();
						else{
							if($jum<=0) $stat='subdokumen_kosong';
							else{
								$stat ='sukses';
								while($r = mysql_fetch_assoc($e)) $subdokumenArr[]=$r;
							} 
						}$out=json_encode(array('stat'=>$stat,'subdokumenArr'=>$subdokumenArr));
					break;

					case 'dokumen':
						$item = (isset($_POST['itemS']) and trim($_POST['itemS'])!='')?filter($_POST['itemS']):'';
						$sql  = 'SELECT *
								FROM '.$tb.'
								WHERE dokumen like "%'.$item.'%"';
								pr($sql);
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
								$out.= '<tr>
											<td align="center">'.$res['dokumen'].'</td>
											<td align="center">'.getFieldArr('tingkat','psb_subdokumen','dokumen',$res['replid']).'</td>
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
				// pr($_POST);
				$stat2 =true;
				$s = $tb.' set 	'.$mnu.' 	= "'.filter($_POST['dokumenTB']).'"';
				if(isset($_POST['replid'])){
					$s = 'UPDATE '.$s.' WHERE id_'.$mnu.'='.$_POST['id_'.$mnu];
					$e = mysql_query($s);
					if(!$e){
						$stat2 = false;
					}
				}else{
					$s2 ='INSERT INTO '.$s;
					$e  = mysql_query($s2);
					$id = mysql_insert_id();

					if(!$e){
						$stat2=false;
					}else{
						foreach ($_POST['tingkatTB'] as $i => $v) {
							$ss = 'INSERT INTO psb_subdokumen set 	dokumen = '.$id.',
																	tingkat = '.$i.',
																	jumlah  = '.filter($_POST['jumlah'.$i.'TB']);
							$ee = mysql_query($ss);
							$stat2=!$ee?false:true;
						}
					}
				}
				$stat = ($stat2)?'sukses':'gagal';
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
				// pr($s1);
				$e1 = mysql_query($s1);
				$r1 = mysql_fetch_assoc($e1);
				$stat=!$e1?'gagal':'sukses';
				$subdokumenArr=array();

				$s2 = ' SELECT * 
						FROM psb_subdokumen 
						WHERE dokumen = '.$r1['replid'];
				// pr($s3);
				$e2      = mysql_query($s2);
				$stat    = $e2?'sukses':'gagal';
				$aksiArr = array();
				
				while($r2 = mysql_fetch_assoc($e2)){
					$subdokumenArr[]=array(
						'replid'  =>$r3['replid'],
						'tingkat' =>$r3['tingkat'],
						'jumlah'  =>$r3['jumlah'],
					);		
				}
				$out = json_encode(array(
					'status'        =>$stat,
					'dokumen'        =>$r1['dokumen'],
					'subdokumenArr' =>$subdokumenArr
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