<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'lokasi';
	$tb  = 'sar_'.$mnu;
	$out ='';
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// // -----------------------------------------------------------------
			case 'tampil':
				$kode       = isset($_POST['kodeS'])?filter(trim($_POST['kodeS'])):'';
				$nama       = isset($_POST['namaS'])?filter(trim($_POST['namaS'])):'';
				$alamat     = isset($_POST['alamatS'])?filter(trim($_POST['alamatS'])):'';
				$kontak     = isset($_POST['kontakS'])?filter(trim($_POST['kontakS'])):'';
				$keterangan = isset($_POST['keteranganS'])?filter(trim($_POST['keteranganS'])):'';
				$sql = 'SELECT *
						FROM '.$tb.'
						WHERE 
							kode like "%'.$kode.'%" and
							nama like "%'.$nama.'%" and
							alamat like "%'.$alamat.'%" and
							kontak like "%'.$kontak.'%" and
							keterangan like "%'.$keterangan.'%"
						ORDER BY kode asc';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				$recpage = 5;
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result  = $obj->result;

				#ada data
				$jum = mysql_num_rows($result);
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
									<td>'.$res['kode'].'</td>
									<td>'.$res['nama'].'</td>
									<td>'.$res['alamat'].'</td>
									<td>'.$res['kontak'].'</td>
									<td>'.$res['keterangan'].'</td>
									'.$btn.'
								</tr>';
						$nox++;
						// var_dump($nox);exit();
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan="10" ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.= '<tr class="info"><td colspan="10">'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan="10">'.$obj->total.'</td></tr>';
			break; 
			// // view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s 		= $tb.' set 	kode 	= "'.filter($_POST['kodeTB']).'",
										nama 	= "'.filter($_POST['namaTB']).'",
										alamat 	= "'.filter($_POST['alamatTB']).'",
										kontak 	= "'.filter($_POST['kontakTB']).'",
										keterangan 	= "'.filter($_POST['keteranganTB']).'"';
				$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e 		= mysql_query($s2);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array('status'=>$stat));
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
								kode,
								nama,
								alamat,
								kontak,
								keterangan
							from '.$tb.' 
							WHERE 
							replid='.$_POST['replid'];
					// print_r($s);exit();
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'kode'       =>$r['kode'],
							'nama'       =>$r['nama'],
							'alamat'     =>$r['alamat'],
							'kontak'     =>$r['kontak'],
							'keterangan' =>$r['keterangan']
						));
			break;
			// ambiledit -----------------------------------------------------------------
			
			// cmblokasi ---------------------------------------------------------
			case 'cmblokasi':
				$s	= ' SELECT *
						from '.$tb.'
						'.(isset($_POST['replid'])?'where replid ='.$_POST['replid']:'').'
						ORDER  BY kode asc';
				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar =$dt=array();

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
						}$ar = array('status'=>'sukses','lokasi'=>$dt);
					}
				}
				$out=json_encode($ar);
				// echo $out;
			break;
			// end of cmblokasi ---------------------------------------------------------
		}
	}
	echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>