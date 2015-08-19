<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu= 'grupmodul';
	$tb = 'kon_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$grupmodul = isset($_POST['grupmodulS'])?filter($_POST['grupmodulS']):'';
				$size      = isset($_POST['sizeS'])?filter($_POST['sizeS']):'';
				$sql = 'SELECT *
						FROM '.$tb.'
						WHERE 
							grupmodul like "%'.$grupmodul.'%" and 
							size like "%'.$size.'%"
						ORDER BY	
							grupmodul ASC'; 
				// pr($sql);
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = 5;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  =$obj->result;

				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button data-hint="ubah"  class="button" '.(isAksi('grupmodul','u')?'onclick="viewFR('.$res['id_grupmodul'].');"':'disabled').'>
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" '.(isAksi('grupmodul','d')?'onclick="del('.$res['id_grupmodul'].');"':'disabled').' onclick="del('.$res['id_grupmodul'].');">
										<i class="icon-remove on-left"></i>
								 </td>';
						$out.= '<tr>
									<td>'.$res['grupmodul'].'</td>
									<td>'.$res['size'].'</td>
									'.$btn.'
								</tr>';
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan="9" ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.= '<tr class="info"><td colspan="9">'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan="9">'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s 		= $tb.' set 	grupmodul 	= "'.filter($_POST['grupmodulTB']).'",
										size 	= "'.filter($_POST['sizeTB']).'"';
				$s2   = isset($_POST['replid'])?'UPDATE '.$s.' WHERE id_grupmodul='.$_POST['replid']:'INSERT INTO '.$s;
				// pr($s2);
				$e    = mysql_query($s2);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where id_grupmodul='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE id_grupmodul='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['grupmodul']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT *
							from '.$tb.'  
							WHERE id_grupmodul='.$_POST['replid'];
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'    =>$stat,
							'grupmodul' =>$r['grupmodul'],
							'size'      =>$r['size'],
						));
			break;
			// ambiledit ------			

			// cmbdepartemen -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where id_'.$mnu.' ='.$_POST['replid'];
				}

				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY 
							'.$mnu.' asc';
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
						}$ar = array('status'=>'sukses',$mnu=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbdepartemen -----------------------------------------------------------------

			// urutan -----------------------------------------------------------------
			case 'urutan':
				// 1 = asal
				// 2 = tujuan
				$_1 = mysql_fetch_assoc(mysql_query('SELECT urut from '.$tb.' WHERE replid='.$_POST['replid1']));
				$_2 = mysql_fetch_assoc(mysql_query('SELECT replid from '.$tb.' WHERE urut='.$_POST['urutan2']));
				$s1		= ' UPDATE '.$tb.' 
							SET urut = '.$_POST['urutan2'].'  
							WHERE 
								replid='.$_POST['replid1'];
				$s2		= ' UPDATE '.$tb.' 
							SET urut = '.$_1['urut'].'  
							WHERE 
								replid='.$_2['replid'];
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
		}
	}echo $out;
?>