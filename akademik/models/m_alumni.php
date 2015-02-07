<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'alumni';
	$tb  = 'aka_'.$mnu;
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
			$departemen = isset($_POST['departemenS'])?filter(trim($_POST['departemenS'])):'';
				$tahunlulus = isset($_POST['tahunlulusS'])?filter(trim($_POST['tahunlulusS'])):'';
				$sql = 'SELECT a.replid, t.nama AS tahunlulus, s.nama AS siswa, a.keterangan AS ket, s.nisn
						 FROM aka_alumni a 
						 LEFT JOIN aka_tahunlulus t ON t.replid=a.tahunlulus
						 LEFT JOIN aka_siswa s ON s.replid=a.siswa 
						 WHERE t.departemen = '.$departemen.'
						ORDER BY a.tahunlulus ASC';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage= 5;//jumlah data per halaman
				$obj 	= new pagination_class($sql,$starting,$recpage,'tampil','');
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
									<td>'.$res['nisn'].'</td>
									<td>'.$res['siswa'].'</td>
									<td>'.$res['tahunlulus'].'</td>
									<td>'.$res['ket'].'</td>
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
				$s = $tb.' set 	tahunajaran = "'.filter($_POST['tahunajaranH']).'",
								tingkat    	= "'.filter($_POST['tingkatTB']).'",
								keterangan 	= "'.filter($_POST['keteranganTB']).'"';

				$s2	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e2 = mysql_query($s2);
				if(!$e2){
					$stat = 'gagal menyimpan';
				}else{
					$stat = 'sukses';
				}$out  = json_encode(array('status'=>$stat));
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
				$s 		= ' SELECT 
								a.replid, 
								t.nama AS tahunlulus, 
								s.nama AS siswa, 
								a.keterangan AS ket, 
								s.nisn,
								t.departemen /*epiii*/

							FROM aka_alumni a 
							 	LEFT JOIN aka_tahunlulus t ON t.replid=a.tahunlulus
							 	LEFT JOIN aka_siswa s ON s.replid=a.siswa
							WHERE
								a.replid='.$_POST['replid'];
				// print_r($s);exit();	
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'departemen' =>$r['departemen'],
							'tahunlulus' =>$r['tahunlulus'],
							'siswa'      =>$r['siswa'],
							'nisn'       =>$r['nisn'],
							'ket'        =>$r['ket']
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// // aktifkan -----------------------------------------------------------------
			// case 'aktifkan':
			// 	$e1   = mysql_query('UPDATE  '.$tb.' set aktif="0" where departemen = '.$_POST['departemen']);
			// 	if(!$e1){
			// 		$stat='gagal menonaktifkan';
			// 	}else{
			// 		$s2 = 'UPDATE  '.$tb.' set aktif="1" where replid = '.$_POST['replid'];
			// 		$e2 = mysql_query($s2);
			// 		if(!$e2){
			// 			$stat='gagal mengaktifkan';
			// 		}else{
			// 			$stat='sukses';
			// 		}
			// 	}$out  = json_encode(array('status'=>$stat));
			// 	//var_dump($stat);exit();
			// break;
			// // aktifkan -----------------------------------------------------------------

			// cmbtingkat -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where'.$mnu.'='.$_POST[$mnu];
					}elseif (isset($_POST['tahunajaran'])) {
						$w='where tahunajaran='.$_POST['tahunajaran'];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY '.$mnu.' asc';
				// var_dump($s);exit();
				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar = $dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error');
				}else{
					if($n==0){ // kosong 
						// var_dump($n);exit();
						$ar = array('status'=>'kosong');
					}else{ // ada data
						if(!isset($_POST['replid'])){
							while ($r=mysql_fetch_assoc($e)) {
								$dt[]=$r;
							}
						}else{
							$dt[]=mysql_fetch_assoc($e);
						}$ar = array('status'=>'sukses','tingkat'=>$dt);
					}
				}
				// print_r($n);exit();
				$out=json_encode($ar);
			break;
			// cmbtingkat -----------------------------------------------------------------

		}
	}
	echo $out;

	// ---------------------- //
	// -- created by epiii -- //
	// ---------------------- //
?>