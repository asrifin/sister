<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu= $tb = 'aka_jenismutasi';
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				// $nama       = isset($_POST['namaS'])?filter(trim($_POST['namaS'])):'';
				// $alamat  = isset($_POST['alamatS'])?filter(trim($_POST['alamatS'])):'';
				// $telepon = isset($_POST['teleponS'])?filter(trim($_POST['teleponS'])):'';
				$sql = 'SELECT *
						FROM '.$tb.'
						 
						ORDER 
							BY nama asc';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage= 5;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj 	= new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);

				// $obj 	= new pagination_class($sql,$starting,$recpage);
				$result =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_array($result)){	
						$btn ='<td>
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
								 </td>';
						$out.= '<tr>
									<td>'.$res['nama'].'</td>
									'.$btn.'
								</tr>';
						$nox++;
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
				$s 		= $tb.' set 	nama 	= "'.filter($_POST['namaTB']).'"';

				$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e 		= mysql_query($s2);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
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
				// var_dump($s);
				$out 	= json_encode(array(
							'status'  =>$stat,
							'nama'    =>$r['nama']
						));
			break;
			// ambiledit ------			

			// cmbdepartemen -----------------------------------------------------------------
			case 'cmbjenismutasi':
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
						ORDER  BY replid asc';

				// $s	= ' SELECT *
				// 		from '.$tb.'
				// 		'.(isset($_POST['replid'])?'where replid ='.$_POST['replid']:'').'
				// 		ORDER  BY urut asc';
				$e  = mysql_query($s);
				// var_dump($s);exit();
				$n  = mysql_num_rows($e);
				$ar =$dt=array();

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
						}
						$ar = array('status'=>'sukses','nama'=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbdepartemen -----------------------------------------------------------------

			// // urutan -----------------------------------------------------------------
			// case 'urutan':
			// 	// 1 = asal
			// 	// 2 = tujuan
			// 	$_1 = mysql_fetch_assoc(mysql_query('SELECT urut from '.$tb.' WHERE replid='.$_POST['replid1']));
			// 	$_2 = mysql_fetch_assoc(mysql_query('SELECT replid from '.$tb.' WHERE urut='.$_POST['urutan2']));
			// 	$s1		= ' UPDATE '.$tb.' 
			// 				SET urut = '.$_POST['urutan2'].'  
			// 				WHERE 
			// 					replid='.$_POST['replid1'];
			// 	$s2		= ' UPDATE '.$tb.' 
			// 				SET urut = '.$_1['urut'].'  
			// 				WHERE 
			// 					replid='.$_2['replid'];
			// 	// var_dump($s1);exit();
			// 	$e1 	= mysql_query($s1);
			// 	if(!$e1){
			// 		$stat='gagal ubah urutan semula ';
			// 	}else{
			// 		$e2 = mysql_query($s2);
			// 		if(!$e2)
			// 			$stat = 'gagal ubah urutan kedua';
			// 		else
			// 			$stat= 'sukses';
			// 	}
			// 	$out 	= json_encode(array(
			// 				'status'  =>$stat,
			// 			));
			// break;
			// urutan ------			
		}
	}echo $out;

	// ---------------------- //
	// -- created by epiii -- //
	// ---------------------- //
?>