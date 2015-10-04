<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'viabayar';
	$tb  = 'keu_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// view -----------------------------------------------------------------
			case 'tampil':
				$viabayar   = (isset($_POST['viabayarS']) and trim($_POST['viabayarS'])!='')?filter($_POST['viabayarS']):'';
				$keterangan = (isset($_POST['keteranganS']) and trim($_POST['keteranganS'])!='')?filter($_POST['keteranganS']):'';
				$sql  = 'SELECT *
						FROM '.$tb.'
						WHERE 
							viabayar like "%'.$viabayar.'%" and
							keterangan like "%'.$keterangan.'%"
						ORDER BY viabayar asc';
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
						$out.= '<tr>
									<td>'.$res['viabayar'].'</td>
									<td>'.$res['keterangan'].'</td>
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
				$s = $tb.' set 	viabayar   = "'.filter($_POST['viabayarTB']).'",
								keterangan = "'.filter($_POST['keteranganTB']).'"';
				$s2	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				// pr($s2);
				$e2 = mysql_query($s2);
				$stat = !$e2?'gagal menyimpan':'sukses';
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
							'status'     =>$stat,
							'viabayar'   =>$r1['viabayar'],
							'keterangan' =>$r1['keterangan'],
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// cmb viabayar -----------------------------------------------------------------
			case 'cmbviabayar':
				// pr($_POST);
				$w='';
				if(isset($_POST['replid'])){
					$w.='where replid='.$_POST['replid'];
				}
				
				$s	= ' SELECT *
						FROM '.$tb.'
						'.$w.'
						ORDER BY viabayar asc';
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