<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'tahunbuku';
	$tb  = 'keu_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$tahunbuku = trim($_POST['tahunbukuS'])?filter($_POST['tahunbukuS']):'';
				$sql = 'SELECT *
						FROM '.$tb.'
						WHERE 
							nama like "%'.$tahunbuku.'%" 
						ORDER 
							BY tanggal1 desc';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				$recpage = 5;//jumlah data per halaman
				$aksi    ='';
				$subaksi ='tampil';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result =$obj->result;

				$jum = mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_array($result)){	
						if($res['aktif']==1){
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
									<button '.$dis.' data-hint="hapus" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
									<button '.$func.' '.$dis.' data-hint="'.$hint.'">
										<i class="icon-'.$ico.'"></i>
									</button>
								 </td>';
						$out.= '<tr class="'.($res['aktif']==1?'bg-lightGreen':'').'">
									<td>'.$nox.'</td>
									<td id="tahunbukuTD_'.$res['replid'].'">'.$res['nama'].'</td>
									<td>'.tgl_indo($res['tanggal1']).'</td>
									<td>'.$res['keterangan'].'</td>
									<td>'.($res['aktif']==1?'Aktif':'Tidak Aktif').'</td>
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
				$s = $tb.' set 	nama       = "'.filter($_POST['namaTB']).'",
								tanggal1   = "'.filter($_POST['tanggal1TB']).'",
								keterangan = "'.filter($_POST['keteranganTB']).'"';
				
				if(!isset($_POST['replid'])){ //add
					if(mysql_num_rows(mysql_query('SELECT * from '.$tb))>0){
						$s1 ='UPDATE '.$tb.' set aktif="0"';
						$e1 = mysql_query($s1);
					}$s2 = 'INSERT INTO '.$s.' ,aktif = "1"';
				}else{ //edit
					$s2 = 'UPDATE '.$s.' WHERE replid='.$_POST['replid'];
				}

				$ssr = 'SELECT max(replid) from keu_tahunbuku';
				$esr = mysql_query($ssr);
				$rsr = mysql_fetch_assoc($esr);


				$e2 = mysql_query($s2);
				$id = mysql_insert_id();
				// var_dump($id);exit();
				if(!$e2){ // gagal simpan
					$stat = 'gagal menyimpan';
				}else{// berhasil simpan 
					if($id='' or $id=null){ // add mode
						$stat='sukses';
					}else{
						
						$sr = 'SELECT * from keu_rekening';
						$er = mysql_query($sr);
						$stat2 = true;
						if(mysql_num_rows($er)>0){ // ada rekening
							$stat='ada data';
							while ($rc=mysql_fetch_assoc($er)) { // rekap saldo rekening untuk tahun x (baru) 
								$nominal = $rc['nominal2']!=0?',nominal='.$rc['nominal2'].',nominal2='.$rc['nominal2']:'';
								$si = 'INSERT INTO keu_saldorekening 
										SET rekening  = '.$rc['replid'].',
											tahunbuku = '.$id.$nominal;
											var_dump($id);exit();
								$ei   = mysql_query($si);
								$stat2 =!$ei?false:true;						
							} //end of rekap saldo rekening
						}$stat=!$stat2?'gagal_insert_saldorekening_'.mysql_error():'sukses';
					}
				}// end of berhasil simpan  
				$out  = json_encode(array('status'=>$stat));
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
				$s 		= ' SELECT 
								nama,
								tanggal1,
								saldoawal,
								keterangan
							from '.$tb.'
							WHERE 
								replid='.$_POST['replid'];
				// var_dump($s);exit();
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'nama'       =>$r['nama'],
							'tanggal1'   =>$r['tanggal1'],
							'saldoawal'  =>$r['saldoawal'],
							'keterangan' =>$r['keterangan'],
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// aktifkan -----------------------------------------------------------------
			case 'aktifkan':
				$e1   = mysql_query('UPDATE  '.$tb.' set aktif="0"');
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
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbtahunbuku -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w.='where replid ='.$_POST['replid'];
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
						ORDER  BY 
							aktif desc,
							nama desc';
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