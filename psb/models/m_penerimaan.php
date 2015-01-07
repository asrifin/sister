<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'calonsiswa';
	$mnu2 = 'siswa';
	$tb  = 'psb_'.$mnu;
	$tb2  = 'aka_'.$mnu2;
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$nopendaftaran = trim($_POST['no_pendaftaranS'])?filter($_POST['no_pendaftaranS']):'';
				// $semester    = trim($_POST[$mnu.'S'])?filter($_POST[$mnu.'S']):'';
				$nama  = trim($_POST['namaS'])?filter($_POST['namaS']):'';
				$sql = 'SELECT *
						FROM '.$tb.'
						WHERE 
							nopendaftaran like "%'.$nopendaftaran.'%" and
							nama like "%'.$nama.'%"
						ORDER 
							BY nopendaftaran asc';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage= 5;//jumlah data per halaman

				$aksi    ='';
				$subaksi ='tampil';
				$obj 	= new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
				// $obj 	= new pagination_class($sql,$starting,$recpage);
				$result =$obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_array($result)){	
						// 						if($res['idsiswa']!=0){
						// 	$ts=mysql_query("SELECT nis,nisn FROM aka_siswa WHERE replid='".$res['idsiswa']."'");
						// 	$rs=mysql_fetch_array($ts);
						// 	$res['nis']=$rs['nis'];
						// 	$res['nisn']=$rs['nisn'];
						// }

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
										<i class="icon-search on-left"></i>
									</button>
								 </td>';
							//Tombol Status								 
						if($res['status']==1){
						$btn_terima ='<td>
									<button data-hint="Klik untuk membatalkan penerimaan"  class="bg-darkGreen fg-white" onclick="viewFR_terima('.$res['replid'].');">
										Diterima
									</button>
								 </td>';
						}else
						$btn_terima ='<td>
									<button data-hint="Klik untuk melakukan penerimaan"  onclick="viewFR('.$res['replid'].');">
										Blm diterima
									</button>
								 </td>';						

						$out.= '<tr>
									<td>'.$res['nopendaftaran'].'</td>
									<td id="'.$mnu.'TD_'.$res['replid'].'">'.$res['nama'].'</td>
									<td>-</td>
									<td>-</td>
									'.$btn_terima.'
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
				switch ($_POST['subaksi']) {
					case 'tidak_diterima':
						$s 		= $tb.' set 	nama 		= "'.filter($_POST['namaTB']).'",';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						// var_dump($s2);exit();
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;

					case 'penerimaan':
						$s = $tb.' set 	nama    	= "'.filter($_POST['namaTB']).'",
									nopendaftaran 	= "'.filter($_POST['nopendaftaranTB']).'"';

						$s2	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						$e2 = mysql_query($s2) or die(mysql_error());
						if(!$e2){
							$stat = 'gagal menyimpan';
						}else{
							$stat = 'sukses';
						}$out  = json_encode(array('status'=>$stat));
					break;
				}
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
				switch ($_POST['subaksi']) {
					case 'tidak_diterima';
						$s = 'SELECT * FROM '.$tb.'  WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array(
									// 'kode'       =>$r['kode'],
									'nama'       =>$r['nama'],
									// 'lokasi'     =>$r['lokasi'],
									// 'keterangan' =>$r['keterangan']
								));					
					break;

					case 'penerimaan':
						$s 		= ' SELECT *
							from '.$tb.'
							WHERE 
								replid='.$_POST['replid'];
						// print_r($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array(
							'status'     =>$stat,
							'nama'   	=>$r['nama'],
							'nopendaftaran' =>$r['nopendaftaran'],
						));
					break;
				}
			break;
			// ambiledit -----------------------------------------------------------------
		}
	}
	echo $out;
	// var_dump($out);
	
?>