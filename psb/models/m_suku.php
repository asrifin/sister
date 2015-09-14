<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'suku';
	$tb  = 'psb_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			/*case 'tampil':
				$departemen = isset($_POST['departemenS'])?$_POST['departemenS']:'';
				$diskon     = isset($_POST['diskonS'])?$_POST['diskonS']:'';
				$keterangan = isset($_POST['keteranganS'])?$_POST['keteranganS']:'';
				$biaya      = isset($_POST['biayaS'])?$_POST['biayaS']:'';
				$sql = 'SELECT *
						FROM  '.$tb.' 
						WHERE 
							biaya ='.$biaya.' AND
							departemen ='.$departemen.' AND
							diskon LIKE "%'.$diskon.'%" AND
							keterangan LIKE "%'.$keterangan.'%"
						ORDER BY
							diskon asc';
							// pr($sql);
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = 10;//jumlah data per halaman
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
									<button data-hint="ubah"  onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td><pre>'.$res['diskon'].'</pre></td>
									<td><pre>'.$res['keterangan'].'</pre></td>
									'.$btn.'
								</tr>';
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan=9 ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
			break; */
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			/*case 'simpan':
				$s = $tb.' set 	diskon     = "'.filter($_POST['diskonTB']).'",
								biaya      = '.$_POST['biayaTB'].',
								departemen = '.$_POST['departemenTB'].',
								keterangan = "'.filter($_POST['keteranganTB']).'"';
				$s2	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				// pr($s2);
				$e2 = mysql_query($s2);
				if(!$e2){
					$stat = 'gagal menyimpan';
				}else{
					$stat = 'sukses';
				}$out  = json_encode(array('status'=>$stat));
			break;*/
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			/*case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
			break;*/
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			/*case 'ambiledit':
				$s 		= ' SELECT *
							from '.$tb.'
							WHERE  replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'departemen' =>$r['departemen'],
							'biaya'      =>$r['biaya'],
							'diskon'     =>$r['diskon'],
							'keterangan' =>$r['keterangan'],
						));
			break;*/
			// ambiledit -----------------------------------------------------------------
			// cmbsubtingkat -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where '.$mnu.'='.$_POST[$mnu];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY '.$mnu.' asc';
				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar =$dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error'.mysql_error());
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
						}
						$ar = array('status'=>'sukses',$mnu=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbsubtingkat -----------------------------------------------------------------
		}
	}echo $out;

	// ---------------------- //
	// -- created by rovi -- //
	// ---------------------- //
?>