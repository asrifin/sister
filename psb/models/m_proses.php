<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	// $mnu = 'kelompok';
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
				$departemen  = isset($_POST['departemenS'])?filter(trim($_POST['departemenS'])):'';
				// $tahunajaran = trim($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';
				// $kelompok    = trim($_POST['kelompokS'])?filter($_POST['kelompokS']):'';
				// $keterangan  = trim($_POST['tglpendaftaranS'])?filter($_POST['tglpendaftaranS']):'';
				/*$sql = 'SELECT
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
							// print_r($sql);exit();*/
				$sql='SELECT 
					       p.replid, 
					       p.kodeawalan, 
					       p.proses, 
					       a.angkatan, 
					       p.kapasitas,
					       ( SELECT count(*) from psb_calonsiswa where proses = p.replid and `status`=0 )calonsiswa,
					       ( SELECT count(*) from psb_calonsiswa where proses = p.replid and `status`!=0 )siswaditerima,
					       p.aktif statusx, 
					       	p.keterangan 
					FROM psb_proses p
					     LEFT JOIN aka_angkatan a ON a.replid = p.angkatan
					     LEFT JOIN departemen d ON d.replid = a.departemen
					WHERE 
					      a.departemen ='.$departemen;

				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage= 5;//jumlah data per halaman
				$aksi    ='';
				$subaksi ='periode';
				// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
				$obj 	= new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_array($result)){	
				// print_r($res);exit();
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
									// <td><input type="checkbox"></td>	
						$out.= '<tr>
									<td id="'.$mnu.'TD_'.isset($res['replid']).'">'.$res['proses'].'</td>	
									<td>'.$res['kodeawalan'].'</td>
									<td>'.$res['angkatan'].'</td>
									<td>'.$res['kapasitas'].'</td>
									<td>'.$res['calonsiswa'].'</td>
									<td>'.$res['siswaditerima'].'</td>
									<td>'.($res['statusx']=='1'?'<span style="color:#00A000"><b>Dibuka</b></span>':'Ditutup').'</td>
									<td>'.$res['keterangan'].'</td>
									'.$btn.'
								</tr>';
									// <td>'.$res['statusx'].'</td>
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
								departemen 	= "'.filter($_POST['departemenH']).'",
								kodeawalan 	= "'.filter($_POST['kode_awalanTB']).'",
								angkatan   = "'.filter($_POST['angkatanTB']).'",
								aktif      = "'.filter($_POST['aktifTB']).'",
								kapasitas  = "'.filter($_POST['kapasitasTB']).'",
								keterangan = "'.filter($_POST['keteranganTB']).'"';

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
							'status'       =>$stat,
							'nama'         =>$r['nama'],
							'iddepartemen' =>$r['departemen'],
							'proses'       =>$r['proses'],
							'kodeawalan'   =>$r['kodeawalan'],
							'angkatan'     =>$r['angkatan'],
							'aktif'        =>$r['aktif'],
							'kapasitas'    =>$r['kapasitas'],
							'keterangan'   =>$r['keterangan'],
						));
						// var_dump($s);exit(); 
				// $e=mysql_query();
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

			// cmbproses -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where'.$mnu.'='.$_POST[$mnu];
					}elseif (isset($_POST['angkatan'])) {
						$w='where angkatan='.$_POST['angkatan'];
					}else{
						$w='where departemen ='.$_POST['departemen'];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY aktif asc';
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
						}$ar = array('status'=>'sukses',$mnu=>$dt);
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