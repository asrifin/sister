<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu  = 'detilrekening';
	$menu = 'COA';
	$tb   = 'keu_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$kategorirekening = (isset($_POST['kategorirekeningS']) && $_POST['kategorirekeningS']!='')?' kategorirekening='.$_POST['kategorirekeningS'].' AND':'';
				$kode             = isset($_POST['kodeS'])?filter($_POST['kodeS']):'';
				$nama             = isset($_POST['namaS'])?filter($_POST['namaS']):'';
				$keterangan       = isset($_POST['keteranganS'])?filter($_POST['keteranganS']):'';
				
				$sql = 'SELECT *
						FROM '.$tb.'
						WHERE 
							'.$kategorirekening.'
							kode like "%'.$kode.'%" and
							nama like "%'.$nama.'%" and
							keterangan like "%'.$keterangan.'%" 
						ORDER BY 
							kode asc';

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
					while($res = mysql_fetch_assoc($result)){
						if($res['kategorirekening']!=$curKat){
							$ss = 'SELECT replid,nama,RPAD(kode,6,0)kode from keu_kategorirekening where replid='.$res['kategorirekening'];	
							$ee = mysql_query($ss);
							$rr = mysql_fetch_assoc($ee);
							$out.= '<tr class="bg-lightTeal">
										<td align="right"><b>'.$rr['kode'].'</b></td>
										<td colspan="3"><b>'.$rr['nama'].'</b></td>
									</tr>';
						}
						$btn ='<td align="center">
									<button data-hint="ubah" '.isDisabled($menu,'u').' class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" '.isDisabled($menu,'d').'  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td class="text-right">'.$res['kode'].'</td>
									<td>'.$res['nama'].'</td>
									<td>'.$res['keterangan'].'</td>
									'.$btn.'
								</tr>';
						$curKat=$res['kategorirekening'];
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
				$s 	  = $tb.' set 	kategorirekening = "'.filter($_POST['kategorirekeningTB']).'",
									kode             = "'.filter($_POST['kodeTB']).'",
									nama             = "'.filter($_POST['namaTB']).'",
									keterangan       = "'.filter($_POST['keteranganTB']).'"';
				if(isset($_POST['replid']) and $_POST['replid']!=''){
					$s2   = 'UPDATE '.$s.' WHERE replid='.$_POST['replid'];
					$e    = mysql_query($s2);
					$stat = $e?'sukses':'gagal_'.mysql_error();
				}else{
					$s2 = 'INSERT INTO '.$s;				
					$e  = mysql_query($s2);
					$id = mysql_insert_id();
					if(!$e){
						$stat2  = false;
					}else{
						$tbuku = mysql_fetch_assoc(mysql_query('SELECT replid from keu_tahunbuku WHERE aktif=1'));
						$s3    = 'INSERT INTO keu_saldorekening SET tahunbuku ='.$tbuku['replid'].',rekening  ='.$id;
						$e2    = mysql_query($s3);
						$stat2 = $e2?true:false;
					}$stat  = $stat2?'sukses':'gagal_'.mysql_error();
				}$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				if(!$e){
					$stat = 'gagal_'.mysql_error();
				}else{
					$s2   = 'DELETE FROM keu_saldorekening WHERE rekening = '.$d['replid'];
					$e2   = mysql_query($s2);
					$stat = $e2?'sukses':'gagal_'.mysql_error();
				}$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 	  = ' SELECT 
								kategorirekening,
								kode,
								nama,
								keterangan
							from '.$tb.'
							WHERE 
								replid='.$_POST['replid'];
				// print_r($s);exit();
				$e   = mysql_query($s);
				$r   = mysql_fetch_assoc($e);
				$out = json_encode(array(
							'kategorirekening' =>$r['kategorirekening'],
							'keterangan'       =>$r['keterangan'],
							'kode'             =>$r['kode'],
							'nama'             =>$r['nama']
						));
			break;
			// ambiledit -----------------------------------------------------------------
			
			// cmbkategorirek -----------------------------------------------------------------
			case 'cmbkategorirek':
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where '.$mnu.'='.$_POST[$mnu];
					}
				}
				
				$s	= ' SELECT *
						from keu_kategorirek
							'.$w.'		
						ORDER  BY 
							kode asc ,
							nama asc';

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
						}$ar = array('status'=>'sukses','kategorirek'=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbdepartemen -----------------------------------------------------------------

		}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>