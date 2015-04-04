<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';

	// var_dump($_SESSION);exit();
	$mnu  = 'grupmodul';
	$mnu2 = 'lokasi';
	$mnu3 = 'katalog';
	$mnu4 = 'barang';
	$mnu5 = 'jenis';
	
	$tb   = 'kon'.$mnu;
	$tb2  = 'sar_'.$mnu2;
	$tb3  = 'sar_'.$mnu3;
	$tb4  = 'sar_'.$mnu4;
	$tb5  = 'sar_'.$mnu5;
	// $out=array();

	if(!isset($_POST['aksi'])){
		if(isset($_GET['upload'])){
			$tipex    = substr($_FILES[0]['type'],6);
			$namaAwal = $_FILES[0]['name'];
			$namaSkrg = $_SESSION['id_loginS'].'_'.substr((md5($namaAwal.rand())),2,10).'.'.$tipex;
			$src      = $_FILES[0]['tmp_name'];
			$destix   = '../../img/upload/'.basename($namaSkrg);

			if(move_uploaded_file($src, $destix))
				$o=array('status'=>'sukses','file'=>$namaSkrg);
			else
				$o=array('status'=>'gagal');

			$out=json_encode($o);
		}else{
			$out=json_encode(array('status'=>'invalid_no_post'));		
		}
	}else{
		switch ($_POST['aksi']) {
			// tampil ---------------------------------------------------------------------
			case 'tampil':
				switch ($_POST['subaksi']) {
					// grup modul
					case 'grupmodul':
						$gm_grupmodul = isset($_POST['gm_grupmodulS'])?filter(trim($_POST['gm_grupmodulS'])):'';
						$gm_size      = isset($_POST['gm_sizeS'])?filter(trim($_POST['gm_sizeS'])):'';
						
						$sql = 'SELECT * FROM kon_grupmodul';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='grupmodul';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum	= mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$btn ='<td align="center">
											<button data-hint="detail"  class="button" onclick="vwModul('.$res['id_grupmodul'].');">
												<i class="icon-zoom-in"></i>
											</button>
											<button data-hint="ubah"  class="button" onclick="grupFR('.$res['id_grupmodul'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="grupDel('.$res['id_grupmodul'].');">
												<i class="icon-remove on-left"></i>
											</button>
										 </td>';
								$out.= '<tr>
											<td>'.$nox.'</td>
											<td>'.$res['grupmodul'].'</td>
											<td>'.$res['size'].'</td>
											'.$btn.'
										</tr>';
								$nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan="9" ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						#link paging
						$out.= '<tr class="info"><td colspan="9">'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan="9">'.$obj->total.'</td></tr>';
					break;
					// grup barang

					// modul
					case 'modul':
						$m_grupmodul  = isset($_POST['m_grupmodulS'])?filter(trim($_POST['m_grupmodulS'])):'';
						$m_modul      = isset($_POST['m_modul'])?filter(trim($_POST['m_modul'])):'';
						$m_warna      = isset($_POST['m_warnaS'])?filter(trim($_POST['m_warnaS'])):'';
						$m_icon       = isset($_POST['m_iconS'])?filter(trim($_POST['m_iconS'])):'';
						$m_size       = isset($_POST['m_sizeS'])?filter(trim($_POST['m_sizeS'])):'';
						$m_keterangan = isset($_POST['m_keteranganS'])?filter(trim($_POST['m_keteranganS'])):'';
						// var_dump($k_grup);exit();
						$sql = 'SELECT * 
								FROM 
									kon_modul m 
									LEFT JOIN kon_icon i on i.id_icon = m.id_icon
									LEFT JOIN kon_warna w on w.id_warna = m.id_warna
								WHERE	
									m.id_grupmodul = '.$m_grupmodul.' and
									m.modul        LIKE "%'.$m_modul.'%" and
									w.warna        LIKE "%'.$m_warna.'%" and
									i.icon         LIKE "%'.$m_icon.'%" and
									m.size         LIKE "%'.$m_size.'%" and
									m.keterangan   LIKE "%'.$m_keterangan.'%"';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='grupmodul';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;
						
						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$btn ='<td>
											<button data-hint="detail"  class="button" onclick="vwGrupMenu('.$res['id_modul'].');">
												<i class="icon-zoom-in"></i>
											</button>
											<button data-hint="ubah"  class="button" onclick="katalogFR('.$res['id_modul'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="katalogDel('.$res['id_modul'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$out.= '<tr>
											<td>'.$res['modul'].'</td>
											<td>'.$res['link'].'</td>
											<td>'.$res['warna'].'</td>
											<td><span class="icon-'.$res['icon'].'"></span></td>
											<td>'.$res['size'].'</td>
											<td>'.$res['keterangan'].'</td>
											'.$btn.'
										</tr>';
								$nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan="9"><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						// $out.= '<tr class="info"><td colspan="10">'..'</td></tr>';
						#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break;
					// modul

					// grup menu
					case 'grupmenu':
						$gmn_modul    = isset($_POST['gmn_modulS'])?filter(trim($_POST['gmn_modulS'])):'';
						$gmn_grupmenu = isset($_POST['gmn_grupmenuS'])?filter(trim($_POST['gmn_grupmenuS'])):'';
						$gmn_size     = isset($_POST['gmn_sizeS'])?filter(trim($_POST['gmn_sizeS'])):'';
						
						$sql = 'SELECT 
									* 
								FROM 
									kon_grupmenu 
								WHERE 
									id_modul = '.$gmn_modul.' AND
									grupmenu LIKE "%'.$gmn_grupmenu.'%" AND
									size     LIKE "%'.$gmn_size.'%"';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;
						$aksi    ='tampil';
						$subaksi ='grupmenu';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);  
						$result  =$obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$btn ='<td align="center">			
											<button data-hint="detail"  class="button" onclick="vwMenu('.$res['id_grupmenu'].');">
												<i class="icon-zoom-in"></i>
											</button>
											<button data-hint="ubah"  class="button" onclick="barangFR('.$res['id_grupmenu'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="barangDel('.$res['id_grupmenu'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$out.= '<tr>
											<td>'.$res['grupmenu'].'</td>
											<td>'.$res['size'].'</td>
											'.$btn.'
										</tr>';
								// $nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						// $out.= '<tr class="info"><td colspan="10">'..'</td></tr>';
						#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break;
					// grup menu
					
					// menu
					case 'menu':
						$mn_grupmenu   = isset($_POST['mn_grupmenuS'])?filter(trim($_POST['mn_grupmenuS'])):'';
						$mn_menu       = isset($_POST['mn_menuS'])?filter(trim($_POST['mn_menuS'])):'';
						$mn_link       = isset($_POST['mn_linkS'])?filter(trim($_POST['mn_linkS'])):'';
						$mn_size       = isset($_POST['mn_sizeS'])?filter(trim($_POST['mn_sizeS'])):'';
						$mn_warna      = isset($_POST['mn_warnaS'])?filter(trim($_POST['mn_warnaS'])):'';
						$mn_icon       = isset($_POST['mn_iconS'])?filter(trim($_POST['mn_iconS'])):'';
						$mn_keterangan = isset($_POST['mn_keteranganS'])?filter(trim($_POST['mn_keteranganS'])):'';
						
						$sql = 'SELECT 
									* 
								FROM 
									kon_menu mn 
									LEFT JOIN kon_warna w on w.id_warna = mn.id_warna 
									LEFT JOIN kon_icon i on i.id_icon = mn.id_icon 
								WHERE 
									mn.id_grupmenu = '.$mn_grupmenu.' AND
									i.icon LIKE "%'.$mn_icon.'%" AND
									w.warna LIKE "%'.$mn_warna.'%" AND
									mn.menu LIKE "%'.$mn_menu.'%" AND
									mn.keterangan LIKE "%'.$mn_keterangan.'%" AND
									mn.size  LIKE "%'.$mn_size.'%"';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage= 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='menu';
					 // $obj 	= new pagination_class($sql,$starting,$recpage);  // lawas
						$obj 	= new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);  //baru
						$result =$obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox 	= $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$btn ='<td>			
											<button data-hint="ubah"  class="button" onclick="barangFR('.$res['id_menu'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="barangDel('.$res['id_menu'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								$out.= '<tr>
											<td>'.$nox.'</td>
											<td>'.$res['menu'].'</td>
											<td>'.$res['link'].'</td>
											<td>'.$res['size'].'</td>
											<td>'.$res['warna'].'</td>
											<td>'.$res['icon'].'</td>
											<td>'.$res['keterangan'].'</td>
											'.$btn.'
										</tr>';
								// $nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						// $out.= '<tr class="info"><td colspan="10">'..'</td></tr>';
						#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break;
					// menu
				}
			break; 
			// tampil ---------------------------------------------------------------------

			// head info ------------------------------------------------------------------
			case 'headinfo':
				switch ($_POST['subaksi']) {
					case 'modul':
						$s = 'SELECT * FROM kon_grupmodul WHERE id_grupmodul='.$_POST['id_grupmodul'];
						$q = mysql_query($s);
						$stat = ($q)?'sukses':'gagal';
						$r    = mysql_fetch_assoc($q);
						$out  = json_encode(array(
									'status'    =>$stat,
									'grupmodul' =>$r['grupmodul'],
									'size'      =>$r['size']
								));
					break;

					case 'grupmenu':
						$s = 'SELECT * 
							FROM kon_grupmenu gmn
								LEFT JOIN kon_modul m on m.id_modul = gmn.id_modul 
							WHERE 
								gmn.id_grupmenu='.$_POST['id_grupmenu'];
						// var_dump($s);exit();
						$e = mysql_query($s) or die(mysql_error());
						$r = mysql_fetch_assoc($e);
						if(!$e){
							$stat='gagal';
						}else{
							$stat ='sukses';
							$dt   = array(
								'modul'      =>$r['modul'],	
								'keterangan' =>$r['keterangan'],
							);
						}
						$out  = json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));
					break;

					case 'menu':
						$s = 'SELECT * FROM kon_grupmenu WHERE id_grupmenu='.$_POST['id_grupmenu'];
						// var_dump($s);exit();
						$e = mysql_query($s) or die(mysql_error());
						$r = mysql_fetch_assoc($e);
						if(!$e){
							$stat='gagal';
						}else{
							$stat ='sukses';
							$dt   = array(
								'grupmenu' =>$r['grupmenu']
							);
						}
						$out  = json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));
					break;
				}
			break;
			// head info ------------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				switch ($_POST['subaksi']) {
					case 'grup':
						$s 		= $tb.' set 	lokasi 		= "'.filter($_POST['g_lokasiH']).'",
												kode 		= "'.filter($_POST['g_kodeTB']).'",
												nama 		= "'.filter($_POST['g_namaTB']).'",
												keterangan 	= "'.filter($_POST['g_keteranganTB']).'"';
						$s2 	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
						// var_dump($s2);exit();
						$e 		= mysql_query($s2);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array('status'=>$stat));
					break;

					case 'katalog':
						$s 		= $tb3.' set 	grup 		= "'.$_POST['k_grupH2'].'",
												kode 		= "'.filter($_POST['k_kodeTB']).'",
												nama 		= "'.filter($_POST['k_namaTB']).'",
												jenis 		= "'.$_POST['k_jenisTB'].'",
												susut 		= "'.filter($_POST['k_susutTB']).'",
												keterangan 	= "'.filter($_POST['k_keteranganTB']).'"
												'.(isset($_POST['file'])?', photo2= "'.$_POST['file'].'"':'');
						$stat2=true;
						if(!isset($_POST['replid'])){ //add
							$s2 = 'INSERT INTO '.$s;
						}else{ //edit
							$s2 = 'UPDATE '.$s.' WHERE replid='.$_POST['replid'];
							if(isset($_POST['photo_asal'])){ //change image
								$img='../../img/upload/'.$_POST['photo_asal'];
								if(file_exists($img)){ //checking image is exist
									$delimg = unlink($img);
									$stat2  = !$delimg?false:true;
								}
							}
						}
						if(!$stat2){// gagal hapus
							$stat='gagal_hapus_file';
						}else{ //sukses hapus file
							$e    = mysql_query($s2);
							$stat = $e?'sukses':'gagal_simpan_db';
						}$out  = json_encode(array('status'=>$stat));
					break;

					case 'barang':
						$s 		= $tb4.' set 	katalog    = "'.$_POST['b_katalogH2'].'",
												tempat     = "'.$_POST['b_tempatTB'].'",
												sumber     = "'.$_POST['b_sumberTB'].'",
												harga      = "'.getuang($_POST['b_hargaTB']).'",
												kondisi    = "'.$_POST['b_kondisiTB'].'",
												keterangan = "'.filter($_POST['b_keteranganTB']).'"';
						$stat = true;
						if(!isset($_POST['replid'])){ //add
							if(isset($_POST['b_jumbarangTB']) and $_POST['b_jumbarangTB']>1){ //  lebih dr 1 unit barang
								for($i=0; $i<($_POST['b_jumbarangTB']); $i++) { // iterasi sbnyak jum barang 
									$s2 ='INSERT INTO '.$s.', urut='.($_POST['b_urutH']+$i);
									// var_dump($s2);exit();
									$e  = mysql_query($s2);
									if(!$e)$stat=false;
								}
							}else{ // 1 unit barang
								$s2='INSERT INTO '.$s.', urut='.$_POST['b_urutH'];
								// var_dump($s2);exit();
								$e=mysql_query($s2);
								if(!$e)$stat=false;  
							// var_dump($e);exit();
							}
						}else{ //edit
							$s2 = 'UPDATE '.$s.', urut='.$_POST['b_urutH'].' WHERE replid='.$_POST['replid'];
							// var_dump($s2);exit();
							$e  = mysql_query($s2);
							if(!$e)$stat=false;  
						}
						$out 	= json_encode(array('status'=>($stat?'sukses':'gagal')));
					break;
				}
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete ---------------------------------------------------------------------
			case 'hapus':
				switch ($_POST['subaksi']) {
					case 'grup':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
					break;

					case 'katalog':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb3.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb3.' WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
					break;

					case 'barang':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb4.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb4.' WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['kode']));
					break;
				}
			break;
			// delete ---------------------------------------------------------------------

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				switch ($_POST['subaksi']) {
					case 'grup';
						$s = 'SELECT * FROM '.$tb.'  WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						$out 	= json_encode(array(
									'kode'       =>$r['kode'],
									'nama'       =>$r['nama'],
									'lokasi'     =>$r['lokasi'],
									'keterangan' =>$r['keterangan']
								));					
					break;

					case 'katalog';
						$s = '	SELECT
									k.kode,
									k.nama,
									k.jenis,
									k.photo2,
									k.susut,
									k.keterangan,
									l.nama as lokasi, 
									g.nama as grup
								FROM 
									'.$tb3.' k,
									 '.$tb2.' l,
									 '.$tb.' g
								WHERE 
									g.replid = k.grup and 
									l.replid = g.lokasi and 
									k.replid ='.$_POST['replid'];
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						if(!$e){
							$stat ='gagal';
						}else{
							$stat ='sukses';
							$dt   =array(
										'kode'       =>$r['kode'],
										'nama'       =>$r['nama'],
										'susut'      =>$r['susut'],
										'lokasi'     =>$r['lokasi'],
										'grup'       =>$r['grup'],
										'photo2'     =>$r['photo2'],
										'jenis'      =>$r['jenis'],
										'keterangan' =>$r['keterangan']
									);						
						}$out 	= json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));					
					break;

					case 'barang';
						$s ='SELECT
								b.tempat,
								LPAD(b.urut,5,0) as barkode,(
									SELECT 
										CONCAT(ll.kode,"/",gg.kode,"/",tt.kode,"/",kk.kode,"/",LPAD(b.urut,5,0))
									from 
										sar_katalog kk,
										sar_grup gg,
										sar_tempat tt,
										sar_lokasi ll
									where 
										kk.replid = b.katalog AND
										kk.grup   = gg.replid AND
										b.tempat  = tt.replid AND
										tt.lokasi = ll.replid
								)as kode,
								b.harga,
								b.urut,
								b.kondisi,
								b.sumber,
								b.keterangan
							FROM
								sar_barang b, sar_kondisi k
							WHERE
								b.kondisi = k.replid and
								b.replid  = '.$_POST['replid'];
						// print_r($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						if(!$e){
							$stat ='gagal';
						}else{
							$stat ='sukses';
							$dt   =array(
										'tempat'     =>$r['tempat'],
										'barkode'    =>$r['barkode'],
										'urut'       =>$r['urut'],
										'kode'       =>$r['kode'],
										'harga'      =>$r['harga'],
										'kondisi'    =>$r['kondisi'],
										'sumber'     =>$r['sumber'],
										'keterangan' =>$r['keterangan']
									);						
						}$out 	= json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));					
					break;
				}
			break;
			// ambiledit ------------------------------------------------------------------

			// generate barcode -----------------------------------------------------------
			case 'kodegenerate':
				$s='SELECT
						tb1.lokasi,
						tb1.grup,
						tb1.tempat,
						tb1.katalog,
						tb2.barang,
						LPAD(tb2.barang,5,0)barkode	
					FROM (
						SELECT
							l.kode lokasi,
							g.kode grup,
							t.kode tempat,
							k.kode katalog
						FROM
							sar_lokasi l 
							JOIN sar_grup g on g.lokasi = l.replid
							JOIN sar_katalog k on k.grup= g.replid
							JOIN sar_tempat t on t.lokasi = l.replid
						WHERE	
							t.replid = '.$_POST['tempat'].' 
							and k.replid = '.$_POST['katalog'].'
						)tb1,';

				if($_POST['replid']!=''){//edit
					$s.= '(SELECT urut AS barang FROM sar_barang WHERE replid='.$_POST['replid'].')tb2';
				}else{ //add 
					$s.= '(SELECT (MAX(urut) + 1) AS barang FROM sar_barang )tb2';
				}

				// print_r($s);exit();
				$e    = mysql_query($s);
				$r    = mysql_fetch_assoc($e);
				$stat = !$e?'gagal':'sukses';
				$out  = json_encode(array(
							'status' =>$stat,
							'data'   =>array(
										'urut'    =>$r['barang'],
										'lokasi'  =>$r['lokasi'],
										'grup'    =>$r['grup'],
										'tempat'  =>$r['tempat'],
										'katalog' =>$r['katalog'],
										'barang'  =>$r['barang'],
										'barkode' =>$r['barkode']
						)));
			break;
			// generate barcode -----------------------------------------------------------
			}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>