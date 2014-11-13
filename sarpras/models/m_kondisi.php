<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'kondisi';
	$tb  = 'sar_'.$mnu;
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			// case 'tampil':
			// 	$nama    = trim($_POST['namaS'])?filter($_POST['namaS']):'';
			// 	$alamat  = trim($_POST['alamatS'])?filter($_POST['alamatS']):'';
			// 	$telepon = trim($_POST['teleponS'])?filter($_POST['teleponS']):'';
			// 	$sql = 'SELECT *
			// 			FROM '.$tb.'
			// 			WHERE 
			// 				nama like "%'.$nama.'%" and 
			// 				alamat like "%'.$alamat.'%" and 
			// 				telepon like "%'.$telepon.'%" 
			// 			ORDER 
			// 				BY urut asc';
			// 	// print_r($sql);exit();
			// 	if(isset($_POST['starting'])){ //nilai awal halaman
			// 		$starting=$_POST['starting'];
			// 	}else{
			// 		$starting=0;
			// 	}
			// 	// $menu='tampil';	
			// 	$recpage= 5;//jumlah data per halaman
			// 	// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
			// 	$obj 	= new pagination_class($sql,$starting,$recpage);
			// 	$result =$obj->result;

			// 	#ada data
			// 	$jum	= mysql_num_rows($result);
			// 	$out ='';
			// 	if($jum!=0){	
			// 		$nox 	= $starting+1;
			// 		while($res = mysql_fetch_array($result)){	
			// 			$btn ='<td>
			// 						<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
			// 							<i class="icon-pencil on-left"></i>
			// 						</button>
			// 						<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
			// 							<i class="icon-remove on-left"></i>
			// 					 </td>';
			// 			$out.= '<tr>
			// 						<td>'.$nox.'</td>
			// 						<td>'.$res['nama'].'</td>
			// 						<td>'.$res['alamat'].'</td>
			// 						<td>'.$res['telepon'].'</td>
			// 						'.$btn.'
			// 					</tr>';
			// 			$nox++;
			// 		}
			// 	}else{ #kosong
			// 		$out.= '<tr align="center">
			// 				<td  colspan=9 ><span style="color:red;text-align:center;">
			// 				... data tidak ditemukan...</span></td></tr>';
			// 	}
			// 	#link paging
			// 	$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
			// 	$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
			// break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			// case 'simpan':
			// 	$s 		= $tb.' set 	nama 	= "'.filter($_POST['namaTB']).'",
			// 							alamat 	= "'.filter($_POST['alamatTB']).'",
			// 							telepon	= "'.filter($_POST['teleponTB']).'"';
			// 	$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
			// 	$e 		= mysql_query($s2);
			// 	$stat 	= ($e)?'sukses':'gagal';
			// 	$out 	= json_encode(array('status'=>$stat));
			// break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			// case 'hapus':
			// 	$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
			// 	$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
			// 	$e    = mysql_query($s);
			// 	$stat = ($e)?'sukses':'gagal';
			// 	$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
			// break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			// case 'ambiledit':
			// 	$s 		= ' SELECT *
			// 				from '.$tb.'  
			// 				WHERE 
			// 					replid='.$_POST['replid'];
			// 	$e 		= mysql_query($s);
			// 	$r 		= mysql_fetch_assoc($e);
			// 	$stat 	= ($e)?'sukses':'gagal';
			// 	// var_dump($s);
			// 	$out 	= json_encode(array(
			// 				'status'  =>$stat,
			// 				'nama'    =>$r['nama'],
			// 				'alamat'  =>$r['alamat'],
			// 				'telepon' =>$r['telepon']
			// 			));
			// break;
			// ambiledit ------			

			// cmbjenis -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$s	= ' SELECT *
						from '.$tb.'
						'.(isset($_POST['replid'])?'where replid ='.$_POST['replid']:'').'
						ORDER  BY replid asc';
				$e  = mysql_query($s);
				// var_dump($s);
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
						}$ar = array('status'=>'sukses',$mnu=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbjenis -----------------------------------------------------------------

			// cmbdepartemen -----------------------------------------------------------------
			// case 'cmbdepartemen':
			// 	$s	= ' SELECT *
			// 			from '.$tb.'
			// 			'.(isset($_POST['replid'])?'where replid ='.$_POST['replid']:'').'
			// 			ORDER  BY nama asc';
			// 	$e  = mysql_query($s);
			// 	// var_dump($s);
			// 	$n  = mysql_num_rows($e);
			// 	$ar =$dt=array();

			// 	if(!$e){ //error
			// 		$ar = array('status'=>'error');
			// 	}else{
			// 		if($n=0){ // kosong 
			// 			$ar = array('status'=>'kosong');
			// 		}else{ // ada data
			// 			if(!isset($_POST['replid'])){
			// 				while ($r=mysql_fetch_assoc($e)) {
			// 					$dt[]=$r;
			// 				}
			// 			}else{
			// 				$dt[]=mysql_fetch_assoc($e);
			// 			}
			// 			$ar = array('status'=>'sukses','departemen'=>$dt);
			// 		}
			// 	}$out=json_encode($ar);
			// break;
			// cmbdepartemen -----------------------------------------------------------------
		}
	}echo $out;
	// echo json_encode($out);
?>