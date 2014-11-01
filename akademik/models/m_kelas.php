<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'kelas';
	$tb  = 'aka_'.$mnu;
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$tingkat     = trim($_POST['tingkatS'])?filter($_POST['tingkatS']):'';
				$kelas       = trim($_POST['kelasS'])?filter($_POST['kelasS']):'';
				$wali        = trim($_POST['waliS'])?filter($_POST['waliS']):'';

				// $sql = 'SELECT *
				// 		FROM '.$tb.'
				// 		WHERE 
				// 			tingkat like "%'.$tingkat.'%" and
				// 			kelas like "%'.$kelas.'%" and
				// 			wali like "%'.$wali.'%" 
				// 		ORDER 
				// 			BY kelas asc';
				$sql ='SELECT 
							k.replid,
							k.kelas,
							p.nama as wali,
							k.kapasitas,
							k.keterangan
						FROM 
							aka_kelas k,
							aka_guru g,
							hrd_pegawai p
						WHERE
							k.tingkat LIKE "%'.$tingkat.'%"
							AND k.kelas LIKE "%'.$kelas.'%"
							AND k.wali LIKE "%'.$wali.'%"
							and k.wali    = g.replid
							and g.pegawai = p.replid
						ORDER BY
							k.kelas ASC';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage= 5;//jumlah data per halaman
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
									<button data-hint="ubah"  onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td>'.$nox.'</td>
									<td id="'.$mnu.'TD_'.$res['replid'].'">'.$res['kelas'].'</td>
									<td>'.$res['wali'].'</td>
									<td>'.$res['kapasitas'].'</td>
									<td>-</td>
									<td>'.$res['keterangan'].'</td>
									'.$btn.'
								</tr>';
								// <td>'.$res['terisi'].'</td>
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
				$s 		= ' SELECT *
							from '.$tb.'
							WHERE 
								replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'tingkat'    =>$r['tingkat'],
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
				}$out  = json_encode(array('status'=>$stat));
				//var_dump($stat);exit();
			break;
			// aktifkan -----------------------------------------------------------------

		}
	}echo $out;
	// echo json_encode($out);
?>