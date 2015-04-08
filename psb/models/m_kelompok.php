<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'kelompok';
	$tb  = 'psb_'.$mnu;
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
					$departemen  = isset($_POST['departemenS'])?filter($_POST['departemenS']):'';
				$tahunajaran = isset($_POST['prosesS'])?filter($_POST['prosesS']):'';
				$kelompok    = isset($_POST['kelompokS'])?filter($_POST['kelompokS']):'';
				// $keterangan  = trim($_POST['tglpendaftaranS'])?filter($_POST['tglpendaftaranS']):'';
				$sql = 'SELECT
							k.replid,
							k.kelompok,
							k.tglmulai,
							k.tglselesai,
							k.biaya,
							(
								SELECT
									count(*)
								FROM
									psb_calonsiswa
								WHERE
									kelompok = k.replid
								AND status = 0
							) calonsiswa,
							(
								SELECT
									count(*)
								FROM
									psb_calonsiswa
								WHERE
									kelompok = k.replid
								AND status != 0
							) siswaditerima,
							k.keterangan
						FROM psb_kelompok k 
						LEFT JOIN psb_proses p ON p.replid = k.proses
						WHERE 
						k.proses = '.$tahunajaran;
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage = 5;
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result  = $obj->result;

				#ada data
				$jum	= mysql_num_rows($result) or die(mysql_error());
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
									<button data-hint="ubah"  onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td id="'.$mnu.'TD_'.$res['replid'].'">'.$res['kelompok'].'</td>
									
									<td>'.tgl_indo($res['tglmulai']).' s/d '.tgl_indo($res['tglselesai']).'</td>
									<td>'.$res['biaya'].'</td>
									<td>'.$res['calonsiswa'].'</td>
									<td>'.$res['siswaditerima'].'</td>
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
				$out.= '<tr class="info"><td colspan=10>'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan=10>'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s = $tb.' set 	proses 		= "'.filter($_POST['tahunajaranH']).'",
								kelompok  	= "'.filter($_POST['kelompokTB']).'",
								tglmulai  	= "'.filter($_POST['tglmulaiTB']).'",
								tglselesai  = "'.filter($_POST['tglakhirTB']).'",
								biaya  		= "'.filter($_POST['biaya_pendaftaranTB']).'",
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
							from '.$tb.'
							WHERE 
								replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'kelompok'    =>$r['kelompok'],
							'tglmulai'    =>$r['tglmulai'],
							'tglselesai'  =>$r['tglselesai'],
							'biaya'    	  =>$r['biaya'],
							'keterangan' =>$r['keterangan'],
						));
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
				//var_dump($stat);exit();
				}$out  = json_encode(array('status'=>$stat));
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
					}elseif (isset($_POST['proses'])) {
						$w='where proses='.$_POST['proses'];
					}elseif(isset($_POST['proses'])){
						$w='where proses='.$_POST['proses'];
					}
				}
				
				$s	= ' SELECT *
						FROM '.$tb.' '.$w.'
						ORDER BY
							kelompok ASC';
							// psb_kelompok k,
							// psb_proses p,
							// aka_tahunajaran t
						// WHERE
						// 	k.proses = p.replid
						// AND t.replid = p.tahunajaran
						// AND t.replid = '.$_POST['tahunajaran'].'
				// print_r($s);exit();
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
						}$ar = array('status'=>'sukses','kelompok'=>$dt);
					}
				}
				// print_r($n);exit();
				$out=json_encode($ar);
			break;
			// cmbkelompok -----------------------------------------------------------------

		}
	}
	echo $out;

?>