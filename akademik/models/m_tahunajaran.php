<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'tahunajaran';
	$tb  = 'aka_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$tahunajaran = isset($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';
				$keterangan  = isset($_POST['keteranganS'])?filter($_POST['keteranganS']):'';
				$sql = 'SELECT replid,concat(tahunajaran," - ",tahunajaran+1)tahunajaran,keterangan
						FROM '.$tb.'
						WHERE 
							tahunajaran like "%'.$tahunajaran.'%" and
							keterangan like "%'.$keterangan.'%" 
						ORDER 
							BY tahunajaran desc';
							// vdump($sql);
				if(isset($_POST['starting'])) $starting=$_POST['starting'];
				else  $starting=0;

				$recpage = 5;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button data-hint="ubah" '.(isAksi('tahunajaran','u')?'onclick="viewFR('.$res['replid'].');"':'disabled').'  >
										<i class="icon-pencil on-left"></i>
									</button>
									<button  data-hint="hapus" '.(isAksi('tahunajaran','d')?'onclick="del('.$res['replid'].');"':'disabled').'>
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td align="center">'.$res['tahunajaran'].'</td>
									<td>'.$res['keterangan'].'</td>
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
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s = $tb.' set 	tahunajaran = "'.filter($_POST['tahunajaranTB']).'",
								keterangan  = "'.filter($_POST['keteranganTB']).'"';
				if(!isset($_POST['replid'])){ //add
					$s2 = 'INSERT INTO '.$s;
				}else{ //edit
					$s2 = 'UPDATE '.$s.' WHERE replid='.$_POST['replid'];
				}
				// pr($s2);
				$e2 = mysql_query($s2);
				if(!$e2){
					$stat = 'gagal menyimpan';
				}else{
					$stat = 'sukses';
				}
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['tahunajaran']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT *
							from '.$tb.'
							WHERE replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'      =>$stat,
							'tahunajaran' =>$r['tahunajaran'],
							'keterangan'  =>$r['keterangan'],
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
				}$out  = json_encode(array('status'=>$stat));
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbtahunajaran -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w.='where ta.replid ='.$_POST['replid'];
				}

				$s	= ' SELECT 
							ta.*,(
								SELECT replid FROM aka_tahunajaran where tahunajaran = (ta.tahunajaran-1)
							)idtahunajaransblm,
							(ta.tahunajaran-1)tahunajaransblm
						from 
							aka_tahunajaran ta 
						'.$w.'
						ORDER BY ta.tahunajaran DESC';
						// pr($s);
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
						}$ar = array('status'=>'sukses','tahunajaran'=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbtahunajaran -----------------------------------------------------------------

		}
	}echo $out;

	// ---------------------- //
	// -- created by epiii -- //
	// ---------------------- //
?>