<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
<<<<<<< HEAD
=======
	// $mnu = 'kelompok';
>>>>>>> 5e763dc7da1da4a0c012a150dd0f4e990f58d772
	$mnu = 'proses';
	$tb  = 'psb_'.$mnu;
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$departemen  = trim($_POST['departemenS'])?filter($_POST['departemenS']):'';
				// $tahunajaran = trim($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';
<<<<<<< HEAD
				// $kelompok    = trim($_POST['kelompokS'])?filter($_POST['kelompokS']):'';
				// $keterangan  = trim($_POST['tglpendaftaranS'])?filter($_POST['tglpendaftaranS']):'';
				$sql = 'SELECT
							p.replid,
							p.kodeawalan,
							p.proses,
							a.angkatan,
							p.kapasitas,(
								SELECT count(*)
								from psb_calonsiswa
								where proses = p.replid and `status`=0
							)calonsiswa,(
								SELECT count(*)
								from psb_calonsiswa
								where proses = p.replid and `status`!=0
							)siswaditerima,if(
								p.aktif=1,"Dibuka","Ditutup"
							)status,
							p.keterangan
							
						FROM
							psb_proses p,
							aka_angkatan a,
							departemen d
						WHERE	
							a.departemen = '.$departemen.' and
							p.angkatan = a.replid and
							a.departemen = d.replid';
=======
				$departemen = trim($_POST['departemenS'])?filter($_POST['departemenS']):'';
				$periode    = trim($_POST['periodeS'])?filter($_POST['periodeS']):'';
				// $keterangan = trim($_POST['keteranganS'])?filter($_POST['keteranganS']):'';
				$sql = 'SELECT *
						FROM '.$tb.' 
						WHERE 
							proses like "%'.$periode.'%"
						ORDER 
							BY proses asc';
							// keterangan like "%'.$keterangan.'%"
					// 	kelompok like "%'.$kelompok.'%" and
>>>>>>> 5e763dc7da1da4a0c012a150dd0f4e990f58d772
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage= 5;//jumlah data per halaman
				// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
				$obj 	= new pagination_class($sql,$starting,$recpage);
				$result =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_array($result)){	
						if($res['aktif']=1){
							$dis  = 'disabled';
							$ico  = 'checkmark';
							$hint = 'telah Aktif';
							$func = '';
						}else{
							$dis  = '';
							$ico  = 'blocked';
							$hint = 'Aktifkan';
							$func = 'onclick="aktifkan('.$res['replid'].');"';
						}
						
						$btn ='<td>
									<button data-hint="ubah"  onclick="viewFR('.isset($res['replid']).');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" onclick="del('.isset($res['replid']).');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
									// <td><input type="checkbox"></td>	
						$out.= '<tr>
<<<<<<< HEAD
									<td id="'.$mnu.'TD_'.isset($res['replid']).'">'.$res['proses'].'</td>	
									<td>'.$res['kodeawalan'].'</td>
									<td>'.$res['angkatan'].'</td>
									<td>'.$res['kapasitas'].'</td>
									<td>'.$res['calonsiswa'].'</td>
									<td>'.$res['siswaditerima'].'</td>
									<td>'.($res['aktif']=='1'?'<span style="color:#00A000"><b>Dibuka</b></span>':'Ditutup').'</td>
=======
									<td id="'.$mnu.'TD_'.$res['replid'].'">'.$res['proses'].'</td>
									
									<td>'.$res['kodeawalan'].'</td>
									<td>'.tgl_indo($res['tglmulai']).' s/d '.tgl_indo($res['tglselesai']).'</td>
									<td>'.$res['kapasitas'].'</td>
									<td>'.$calon_siswa.'</td>
									<td>'.$siswa_diterima.'</td>
>>>>>>> 5e763dc7da1da4a0c012a150dd0f4e990f58d772
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
				$s = $tb.' set 	proses 		= "'.filter($_POST['periodeTB']).'",
								kodeawalan 	= "'.filter($_POST['kode_awalanTB']).'",
								angkatan  	= "'.filter($_POST['angkatanTB']).'",
								kapasitas   = "'.filter($_POST['kapasitasTB']).'",
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
				$s 		= ' SELECT *
							from '.$tb.' p, departemen d
							WHERE 
								p.replid='.$_POST['replid'].' AND
								d.replid= p.departemen' ;
				// print_r($s);exit();
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
<<<<<<< HEAD
							'status'     =>$stat,
							'proses'     =>$r['proses'],
							'kodeawalan' =>$r['kodeawalan'],
							'angkatan'   =>$r['angkatan'],
							'kapasitas'   =>$r['kapasitas'],
=======
							'status'      =>$stat,
							// 'kelompok' =>$r['kelompok'],
							'departemen' =>$r['nama'],
							'kelompok'   =>$r['proses'],
							'tglmulai'   =>$r['tglmulai'],
							'tglselesai' =>$r['tglselesai'],
							'kodeawalan' =>$r['kodeawalan'],
							'kapasitas'  =>$r['kapasitas'],
							'keterangan' =>$r['keterangan'],
>>>>>>> 5e763dc7da1da4a0c012a150dd0f4e990f58d772
							'keterangan' =>$r['keterangan'],
						));
						// var_dump($s);exit(); $e=mysql_query();
								// var_dump($stat);exit();
			break;
			// ambiledit -----------------------------------------------------------------

			// aktifkan -----------------------------------------------------------------
			case 'aktifkan':
				$e1   = mysql_query('UPDATE  '.$tb.' set aktif="0" where departemen = '.$_POST['departemen']);
				if(!$e1){
					$stat='gagal menonaktifkan';
				}else{
					$s2 = 'UPDATE  '.$tb.' set aktif="1" where replid = '.$_POST['replid'];
					$e2 = mysql_query($s2);
					if(!$e2){
						$stat='gagal mengaktifkan';
					}else{
						$stat='sukses';
					}
				}$out  = json_encode(array('status'=>$stat));
				// var_dump($stat);exit();
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbkelompok -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where'.$mnu.'='.$_POST[$mnu];
					}elseif (isset($_POST['tahunajaran'])) {
						$w='where proses='.$_POST['tahunajaran'];
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
						var_dump($n);exit();
						$ar = array('status'=>'kosong');
					}else{ // ada data
						if(!isset($_POST['replid'])){
							while ($r=mysql_fetch_assoc($e)) {
								$dt[]=$r;
							}
						}else{
							$dt[]=mysql_fetch_assoc($e);
						}$ar = array('status'=>'sukses','periode'=>$dt);
					}
				}
				// print_r($n);exit();
				$out=json_encode($ar);
			break;
			// cmbtingkat -----------------------------------------------------------------

		}
	}
	echo $out;

	
?>