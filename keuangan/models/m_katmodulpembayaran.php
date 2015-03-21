<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu  = 'katmodulpembayaran';
	$tb   = 'keu_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$nama       = trim($_POST['namaS'])?filter($_POST['namaS']):'';
				$siswa      = trim($_POST['siswaS'])?filter($_POST['siswaS']):'';
				$sifat      = trim($_POST['sifatS'])?filter($_POST['sifatS']):'';
				$keterangan = trim($_POST['keteranganS'])?filter($_POST['keteranganS']):'';

				$sql = 'SELECT * 
						from keu_katmodulpembayaran
						WHERE
							nama LIKE "%'.$nama.'%" AND 
							siswa LIKE "%'.$siswa.'%" AND 
							sifat LIKE "%'.$sifat.'%" AND 
							keterangan LIKE "%'.$keterangan.'%"';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage = 10;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  =$obj->result;
				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					$curKat = '';
					$ec = mysql_query($sql);
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
							 </td>';
						$out.= '<tr>
									<td>'.$res['nama'].'</td>
									<td>'.$res['siswa'].'</td>
									<td>'.$res['sifat'].'</td>
									<td>'.$res['keterangan'].'</td>
									'.$btn.'
								</tr>';
						$nox++;
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan=9><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.='<tr class="info"><td colspan="9">'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan="9">'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s    = $tb.' set 	nama 	   = "'.filter($_POST['namaTB']).'", 
									sifat      = "'.$_POST['sifatTB'].'", 
									keterangan = "'.filter($_POST['keteranganTB']).'", 
									siswa      = "'.$_POST['siswaTB'].'"'; 
				$s2   = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e    = mysql_query($s2);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s = ' SELECT *
						from keu_katmodulpembayaran
						WHERE replid = '.$_POST['replid'];
				// print_r($s);exit();
				$e   = mysql_query($s);
				$stat= $e?'sukses':'gagal';
				$r   = mysql_fetch_assoc($e);
				$out = json_encode(array(
							'status'     =>$stat,
							'nama'       =>$r['nama'],
							'siswa'      =>$r['siswa'],
							'sifat'      =>$r['sifat'],
							'keterangan' =>$r['keterangan']
						));
			break;
			// ambiledit -----------------------------------------------------------------
			
			// cmbkategorirek -----------------------------------------------------------------
			case 'cmbkatmodulpembayaran':
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
						ORDER  BY nama asc';

				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar =$dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error'.mysql_error());
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
			// cmbdepartemen -----------------------------------------------------------------

			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
			break;
			// delete -----------------------------------------------------------------
		}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>