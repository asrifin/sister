<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
// pr($_POST);
// pr($_FILES);
	// require_once '../../lib/excel_reader2.php';
	$mnu  = 'siswa';
	$mnu2 = 'siswaayah';
	$mnu3 = 'siswaibu';
	$mnu4 = 'siswawali';
	$mnu5 = 'siswakontakdarurat';
	$mnu6 = 'siswasaudara';
	$mnu7 = 'siswabiaya';
	
	$tb   = 'psb_'.$mnu;
	$tb2  = 'psb_'.$mnu2;
	$tb3  = 'psb_'.$mnu3;
	$tb4  = 'psb_'.$mnu4;
	$tb5  = 'psb_'.$mnu5;
	$tb6  = 'psb_'.$mnu6;
	$tb7  = 'psb_'.$mnu7;

	$upDir    = '../upload/';
	$fileDir  = $upDir.'files/';
	$imageDir = $upDir.'images/';

	if(!isset($_POST['aksi'])){
		if(isset($_GET['upload'])){
			if($_GET['upload']=='images'){ // images (jpg, png, dll)
				$tipex    = substr($_FILES[0]['type'],6);
				$namaAwal = $_FILES[0]['name'];
				$namaSkrg = $_SESSION['id_loginS'].'_'.substr((md5($namaAwal.rand())),2,10).'.'.$tipex;
				$src      = $_FILES[0]['tmp_name'];
				$destix   = '../upload/images/'.basename($namaSkrg);

				if(move_uploaded_file($src, $destix)) $o=array('status'=>'sukses','photosiswaTB'=>$namaSkrg);
				else $o=array('status'=>'gagal');
			}else{ // files (pdf)

			}
			$out=json_encode($o);
		}elseif(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
			$page       = $_GET['page']; // get the requested page
			$limit      = $_GET['rows']; // get how many rows we want to have into the grid
			$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
			$sord       = $_GET['sord']; // get the direction
			$searchTerm = $_GET['searchTerm'];

			if(!$sidx) $sidx =1;

			if(isset($_GET['subaksi']) && $_GET['subaksi']=='detaildiskon'){ // diskon
				$ss = '	SELECT 
							dd.replid,
							d.diskon,
							concat(dd.nilai," %")nilai,
							d.keterangan
						FROM psb_diskon d 
							JOIN psb_detaildiskon dd on dd.diskon = d.replid
						WHERE
							d.biaya = '.filter($_GET['biaya']).' AND
							d.departemen = '.filter($_GET['departemen']).' AND
							dd.tahunajaran = '.filter($_GET['tahunajaran']).' AND
							dd.isAktif = 1 AND (
								dd.nilai LIKE "%'.$searchTerm.'%" OR 
								d.diskon LIKE "%'.$searchTerm.'%" OR 
								d.keterangan LIKE "%'.$searchTerm.'%"
							)'.(isset($_GET['selectedDiskReg']) && $_GET['selectedDiskReg']!=''?' AND dd.replid NOT IN ('.$_GET['selectedDiskReg'].')':'');
 			}else{ //saudara 
 				// code here
 			}

			// pr($ss);
			$result = mysql_query($ss) or die(mysql_error());
			$row    = mysql_fetch_array($result,MYSQL_ASSOC);
			$count  = mysql_num_rows($result);

			if( $count >0 ) {
				$total_pages = ceil($count/$limit);
			} else {
				$total_pages = 0;
			}
			if ($page > $total_pages) $page=$total_pages;
			$start 	= $limit*$page - $limit; // do not put $limit*($page - 1)
			if($total_pages!=0) {
				$ss.='ORDER BY '.$sidx.' '.$sord.' LIMIT '.$start.','.$limit;
			}else {
				$ss.='ORDER BY '.$sidx.' '.$sord;
			}

			$result = mysql_query($ss) or die("Couldn t execute query.".mysql_error());
			// pr($result);
			$rows 	= array();
			while($row = mysql_fetch_assoc($result)) {
				$rows[] =$row; 
			}
			$response=array(
				'page'    =>$page,
				'total'   =>$total_pages,
				'records' =>$count,
				'rows'    =>$rows,
			);$out=json_encode($response);
		}else{
			$out=json_encode(array('status'=>'invalid_no_post'));	
		}	
	}else{
		switch ($_POST['aksi']) {
			case 'tampil':
				switch ($_POST['subaksi']) {
					case 'siswa':
						$detailgelombang = isset($_POST['detailgelombangS'])?filter($_POST['detailgelombangS']):'';
						$nis             = isset($_POST['nisS'])?filter($_POST['nisS']):'';
						$nisn            = isset($_POST['nisnS'])?filter($_POST['nisnS']):'';
						$nopendaftaran   = isset($_POST['nopendaftaranS'])?filter($_POST['nopendaftaranS']):'';
						$namasiswa       = isset($_POST['namasiswaS'])?filter($_POST['namasiswaS']):'';
						$status          = (isset($_POST['statusS']) && $_POST['statusS']!='')?' AND status="'.filter($_POST['statusS']).'"':'';
						
						$sql = 'SELECT 
									s.replid, 
									s.nopendaftaran, 
									s.namasiswa,
									s.status,
									s.nis,
									s.nisn
								FROM '.$tb.' s
									JOIN psb_siswabiaya sb on sb.siswa = s.replid
									JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
								WHERE 
									db.detailgelombang ='.$detailgelombang.' AND
									s.nopendaftaran LIKE "%'.$nopendaftaran.'%"  AND
									s.nis LIKE "%'.$nis.'%"  AND
									s.nisn LIKE "%'.$nisn.'%" AND
									s.namasiswa LIKE "%'.$namasiswa.'%" 
									'.$status.'
								GROUP BY
									s.replid
								ORDER BY
									s.nopendaftaran ASC,
									s.namasiswa ASC
									';
									// pr($sql);
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
						$result  =$obj->result;
						$jum     = mysql_num_rows($result);
						$out     ='';
						if($jum!=0){	
							$nox 	= $starting+1;
							while($r = mysql_fetch_assoc($result)){	
								$token=base64_encode($_SESSION['id_loginS'].$r['replid']);
								$btn ='<td align="center">
											<button data-hint="dokumen"   '.(isAksi('siswa','u')?'onclick="subdokumenFR('.$r['replid'].')"':' disabled').' >
												<i class="icon-file"></i>
											</button>
											<button data-hint="ubah"   '.(isAksi('siswa','u')?'onclick="viewFR('.$r['replid'].')"':' disabled').' >
												<i class="icon-pencil"></i>
											</button>
											<a class="button" '.(isAksi('siswa','r')?' href="report/r_siswa.php?token='.$token.'&replid='.$r['replid'].'"':' disabled href="#"').'  target="_blank" data-hint="cetak">
												<i class="icon-printer"></i>
											</a>
											<button data-hint="hapus"  '.(isAksi('siswa','d')?'onclick="del('.$r['replid'].')"':' disabled').'>
												<i class="icon-remove"></i>
											</button>
										 </td>';
								if($r['status']=='1'){
									$label = 'Diterima';
									$clr   = 'green';
									$func  = 'onclick="statusFR('.$r['replid'].')"';
								}elseif($r['status']=='2'){
									$label = 'Lulus';
									$clr   = 'blue';
									$func  = '';
								}else{
									$label = 'Belum Diterima';
									$clr   = 'red';
									$func  = 'onclick="statusFR('.$r['replid'].')"';
								}

											// <button data-hint="ubah"   '.(isAksi('siswa','u')?'onclick="viewFR('.$r['replid'].')"':' disabled').' >
											// 	<i class="icon-pencil"></i>
											// </button>
								// pr(getNoPendaftaran($r['replid']));
								$out.= '<tr>
											<td>'.getNoPendaftaran2($r['replid']).'</td>
											<td>'.$r['namasiswa'].'</td>
											<td>'.$r['nis'].'</td>
											<td>'.$r['nisn'].'</td>
											<td><button '.$func.' class="fg-white bg-'.$clr.'">'.$label.'</button></td>
											'.$btn.'
										</tr>';
								$nox++;
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=10 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						#link paging
						$out.= '<tr class="info"><td colspan=10>'.$obj->anchors.'</td></tr>';
						$out.='<tr class="info"><td colspan=10>'.$obj->total.'</td></tr>';
					break; 
					
					case 'subdokumen':
						if(isset($_POST['replid']) && $_POST['replid']!=''){
							$namasiswa = getField('namasiswa','psb_siswa','replid',$_POST['replid']);
							$deptNama  = getKriteriaSiswa('departemen',$_POST['replid']);
							$thnNama   = getKriteriaSiswa('tahunajaran',$_POST['replid']);
							$gelNama   = getKriteriaSiswa('gelombang',$_POST['replid']);
							$tingNama  = getKriteriaSiswa('tingkat',$_POST['replid']);
							$tingID    = getField('replid','aka_tingkat','tingkat',$tingNama);
							$s='SELECT
									sd.replid,
									ssd.file,
									ssd.replid idsiswadokumen,
									sd.jumlah,
									d.dokumen,
									sj.satuanjumlah,
									if(ssd.replid is null,0,1)isExist
								FROM
									psb_dokumen d
									JOIN psb_subdokumen sd ON sd.dokumen = d.replid
									JOIN psb_satuanjumlah sj ON sj.replid= sd.satuanjumlah
									LEFT JOIN (
										SELECT * 
										FROM psb_siswadokumen 
										WHERE siswa = '.$_POST['replid'].'
									)ssd ON ssd.subdokumen = sd.replid
								where 
									sd.tingkat = '.$tingID.'
								ORDER BY d.dokumen ASC';
							// pr($s);
							$e=mysql_query($s);
							$stat=!$e?'gagal':'sukses';
							$siswadokumenArr=array();
							while ($r=mysql_fetch_assoc($e)) $siswadokumenArr[]=$r;	
							$out=json_encode(array(
								'status'          =>$stat,
								'departemen'      =>$deptNama,
								'tahunajaran'     =>$thnNama.' - '.($thnNama+1),
								'detailgelombang' =>$gelNama,
								'tingkat'         =>$tingNama,
								'namasiswa'       =>$namasiswa,
								'siswadokumenArr' =>$siswadokumenArr
							));
						}
					break;

					case 'detaildiskon':
						if(isset($_POST['siswabiaya']) && $_POST['siswabiaya']!=''){
							$s='SELECT 
									dd.replid,
									sd.replid idsiswadiskon,
									d.diskon,
									d.keterangan,
									concat(dd.nilai," %")nilai
								FROM psb_siswadiskon sd 
									JOIN psb_detaildiskon dd on dd.replid = sd.detaildiskon
									JOIN psb_diskon d  on d.replid = dd.diskon
								WHERE 
									sd.siswabiaya='.$_POST['siswabiaya'];
							// pr($s);
							$e=mysql_query($s);
							$stat=!$e?'gagal':'sukses';
							$detaildiskonArr=array();
							while ($r=mysql_fetch_assoc($e)) {
								$detaildiskonArr[]=$r;	
							}$out=json_encode(array('status'=>$stat,'detaildiskonArr'=>$detaildiskonArr));
						}
					break;

					case 'biaya':
						if(isset($_POST['siswa']) && $_POST['siswa']!=''){ // edit
							$f=',sb.replid idsiswabiaya,
								sb.angsuran,
								sb.diskonkhusus,
								sb.ketdiskonkhusus';
							$j=' LEFT JOIN psb_detailbiaya db on db.biaya = b.replid
								LEFT JOIN psb_siswabiaya sb on sb.detailbiaya = db.replid';
							$w=' where sb.siswa ='.$_POST['siswa'];
							$g=' GROUP BY b.replid';
						}else {
							$f='';$j='';$w='';$g=''; // add 
						}

						// biaya ----------------
						$s='SELECT 	
								b.replid, 
								b.biaya, 
								b.kode, 
								b.isAngsur idIsAngsur,
								case b.isAngsur
									when 0 then "Tunai"
									when 1 then "Angsur Reguler"
									else "Angsur Bebas"
								end as isAngsur,
								b.isDiskon,
								t.jenistagihan '.$f.'
							FROM psb_biaya b
								JOIN psb_jenistagihan t on t.replid = b.jenistagihan 
								'.$j.$w.'
							'.$g.'
							ORDER BY 
								b.biaya ASC';
						// pr($s);	
						$e=mysql_query($s);
						$stat=!$e?'gagal':'sukses';
						$n=mysql_num_rows($e);
						$biayaArr=array();
						//end of : biaya ---------------

						if($n==0) $stat='kosong';
						else{
							$stat='sukses';
							while ($r=mysql_fetch_assoc($e)) {
								// diskon reguler -----------
								$biayaArr[]=array(
									'replid'          =>$r['replid'],
									'jenistagihan'    =>$r['jenistagihan'],
									'kode'            =>$r['kode'],
									'biaya'           =>$r['biaya'],
									'idIsAngsur'      =>$r['idIsAngsur'],
									'idsiswabiaya'    =>(isset($_POST['siswa']) && $_POST['siswa']!=''?$r['idsiswabiaya']:''),
									'angsuran'        =>(isset($_POST['siswa']) && $_POST['siswa']!=''?$r['angsuran']:''),
									'diskonkhusus'    =>(isset($_POST['siswa']) && $_POST['siswa']!=''?setuang($r['diskonkhusus']):''),
									'ketdiskonkhusus' =>(isset($_POST['siswa']) && $_POST['siswa']!=''?$r['ketdiskonkhusus']:''),
									'isAngsur'        =>$r['isAngsur'],
									'isDiskon'        =>$r['isDiskon'],
									'jenistagihan'    =>$r['jenistagihan'],
								);
							}
						}$out=json_encode(array('status'=>$stat,'levelurutan'=>$_SESSION['levelurutanS'],'biayaArr'=>$biayaArr));
					break;
				}
			break; 
			// view -----------------------------------------------------------------

			case 'getBiaya':
				if(!isset($_POST['detailgelombang']) || !isset($_POST['subtingkat']) || !isset($_POST['golongan']))
					$o = array('status' =>'invalid_no_post' );
				else{
					$biaya = getBiayaArr($_POST['detailgelombang'],$_POST['subtingkat'],$_POST['golongan']);
					// $stat=!$biaya || is_null($biaya)?'gagal':'sukses';
					$stat=!$biaya?'gagal':'sukses';
				}$out = json_encode(array('status'=>$stat,'biayaArr'=>$biaya));
			break;

			case 'getBiayaNett':
				if(!isset($_POST['iddetailbiaya'])) $o = array('status' =>'invalid_no_post' );
				else{
					$biaya = getBiayaNett($_POST['iddetailbiaya'],(isset($_POST['diskonreguler'])?$_POST['diskonreguler']:null),(isset($_POST['diskonkhusus'])?getuang($_POST['diskonkhusus']):0));
					$stat  = $biaya==0?'diskon melebihi biaya':'sukses';
				}$out = json_encode(array('status'=>$stat,'biayaNett'=>$biaya));
			break;

			case 'nopendaftaran':
				$no = getNoPendaftaran2($_POST['idsiswa']);
				$stat=!$no?'gagal':'sukses';
				$out = json_encode(array('status'=>$stat,'nopendaftaran'=>$no));
			break;

			case 'getSetBiaya':
				if(!isset($_POST['kelompok']) || !isset($_POST['tingkat']) || !isset($_POST['golongan'])){
					$o = array('status' =>'invalid_no_post' );
				}else{
					$biaya = getSetBiaya($_POST['kelompok'],$_POST['tingkat'],$_POST['golongan']);
					$o     = array(
								'status'   =>(($biaya!=null || $biaya!='')?'sukses':'gagal'),
								'setbiaya' =>$biaya['replid'],
							);				
				}$out = json_encode($o);
			break;

			case 'getDisc':
				if(!isset($_POST['replid'])){
					$o = array('status' =>'invalid_no_post' );
				}else{
					$disc = getField('nilai','psb_disctunai','replid',$_POST['replid']);
					// var_dump($disc);exit();
					$o    = array(
								'status' =>(($disc!=null || $disc!='')?'sukses':'gagal'),
								'nilai'  =>$disc
							);
				}$out = json_encode($o);
			break;

			case 'getDiscAngsuran':
				if(!isset($_POST['discAngsuran'])){
					$o = array('status' =>'invalid_no_post' );
				}else{
					$disc = getDiscAngsuran($_POST['regNum'],$_POST['discAngsuran']);
					$o    = array(
								'status'  =>(($disc!=null || $disc!='')?'sukses':'gagal'),
								'discNum' =>$disc
							);
				}$out = json_encode($o);
			break;

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				switch ($_POST['subaksi']) {
					case 'siswadokumen':
						if(isset($_POST['siswadokumenTB'])){
							$stat   = true;
							$dbstat = $upstat = $dfstat = true;
							// pr($_POST);
							foreach ($_POST['siswadokumenTB'] as $i => $v) {
								// upload file ---------------------------- 
								$namaAwal = $_FILES['file'.$v.'TB']['name'];
								$tipex    = substr($_FILES['file'.$v.'TB']['name'],-4);
								$namaSkrg = 'dok'.$_POST['siswaTB'].'_'.$v.'_'.substr((md5($namaAwal.rand())),2,10).$tipex;
								$src      = $_FILES['file'.$v.'TB']['tmp_name'];
								$dir='../upload/files/';
								if(!is_dir($dir)) mkdir($dir);
								$destix   = $dir.basename($namaSkrg);
								
								// edit mode 
								if($_POST['idsiswadokumen'.$v.'TB']!=''){
									if($_POST['siswadokumenCB'.$v]=='on'){// CHECKED checkbox  [replace]  
										// DELETE : old file & data_DB 
										if($_POST['fileawal'.$v.'TB'] && $namaAwal!=''){
											$df=delFile('../upload/files/'.$_POST['fileawal'.$v.'TB']);
											$dfstat=!$df?false:true;
											$sdok ='DELETE FROM psb_siswadokumen WHERE replid= '.$_POST['idsiswadokumen'.$v.'TB'];
										}
										// UPLOAD : new file 
										$file='';
										if($namaAwal!=''){ 
											$upload = move_uploaded_file($src, $destix);
											$upstat = !$upload?false:true;
											$file   = ',file="'.$namaSkrg.'"';
										}
										// SAVE : new data_DB 
										$s  ='UPDATE  psb_siswadokumen SET 	
												siswa      ='.$_POST['siswaTB'].',
												subdokumen ='.$v.$file.'
											  WHERE replid ='.$_POST['idsiswadokumen'.$v.'TB'];
										$e=mysql_query($s);
										$dbstat=!$e?false:true;
									}else{ // UNCHECKED checkbox [without]
										if($_POST['fileawal'.$v.'TB']){ // DELETE old_file & data_DB
											$df=delFile('../upload/files/'.$_POST['fileawal'.$v.'TB']);
											$dfstat=!$df?false:true;
											$s ='DELETE FROM psb_siswadokumen WHERE replid= '.$_POST['idsiswadokumen'.$v.'TB'];
											$e=mysql_query($s);
											$dbstat=!$e?false:true;
										}
									}
								}else{ //add mode 
									if($_POST['siswadokumenCB'.$v]=='on'){// CHECKED checkbox 
										// UPLOAD : new file 
										if($namaAwal!=''){ 
											$upload = move_uploaded_file($src, $destix);
											$upstat = !$upload?false:true;
										}	
										// SAVE : new data_DB 
										$s  ='INSERT INTO psb_siswadokumen SET 	
												siswa      ='.$_POST['siswaTB'].',
												subdokumen ='.$v.',
												file       ="'.$namaSkrg.'"';
										$e=mysql_query($s);
										$dbstat=!$e?false:true;
									}
								}
							}$out=json_encode(array(
								'status'=>(!$dfstat?'gagal_delete_file':(!$upstat?'gagal_upload_file':(!$dbstat?'gagal_db':'sukses')))
							));
						}
					break;

					case 'siswa':
						// delete file/image
						$photosiswa=null;
						if(empty($_POST['idformTB'])){// add 
							 $photosiswa = isset($_POST['photosiswaTB'])?$_POST['photosiswaTB']:null; // ada upload 
							$ss='masuk add';
						}else{ // edit
							$ss='masuk dit';
							if(isset($_POST['photosiswaTB'])){// ada upload 
								$aa='ada upload';
								$photosiswa = $_POST['photosiswaTB'];
								if(isset($_POST['photosiswa2TB']) && !empty($_POST['photosiswa2TB'])) delFile($imageDir.$_POST['photosiswa2TB']); // foto lama = ada 
							} 
						} 

						// biodata siswa -----------------------------------------------------------------------------------------
						$siswaF = array(
							'photosiswa'=>$photosiswa,
							'alamatsiswa',	
							'agamasiswa',	
							'bahasasiswa1',	
							'bahasasiswa2',	
							'beratsiswa',	
							'catatankesehatansiswa',	
							'darahsiswa',	
							'diasuh',
							'emailsiswa',	
							'hpsiswa',	
							'jkelaminsiswa',	
							'kodepossiswa',	
							'kotasekolahasalsiswa',	
							'kotasiswa',	
							'namasiswa',	
							'negarasekolahasalsiswa',	
							'nopendaftaran'=>(isset($_POST['idformTB']) && $_POST['idformTB']!=''?null:getNoPendaftaran('')),	
							'panggilansiswa',	
							'penyakitsiswa',	
							'pinbbsiswa',	
							'sekolahasalsiswa',	
							'sukusiswa',	
							'tanggallahirsiswa'=>($_POST['tanggallahirsiswaTB']!=''?tgl_indo6($_POST['tanggallahirsiswaTB']):'0000-00-00'),	
							'telponsiswa',	
							'tempatlahirsiswa',	
							'tinggisiswa',	
							'warganegarasiswa',
						);
						$siswaSV=(isset($_POST['idformTB']) && $_POST['idformTB']!='')?editRecord($siswaF,$tb,'replid',$_POST['idformTB']):addRecord($siswaF,$tb);
						if(!$siswaSV['isSukses']) $stat='gagal_insert_siswa';
						else{
							// hapus detail dskon (diskon reguler) --------------------------
							$diskRegStat=true;
							if(isset($_POST['iDetailDiskonDelTR']) && $_POST['iDetailDiskonDelTR']!=''){
								$sdd ='DELETE FROM psb_siswadiskon WHERE replid IN ('.$_POST['iDetailDiskonDelTR'].')';
								$edd = mysql_query($sdd);
								$diskRegStat=!$edd?false:true;
							}
							// siswa - biaya  -----------------------------------------------------------------------------------------
							$siswabiayaStat=true;$xx=$n=0;
							if(isset($_POST['iddetailbiayaTB'])){
								foreach ($_POST['iddetailbiayaTB'] as $i => $v) {
									$biaya = getField('biaya','psb_detailbiaya','replid',$v);
									if(isset($_POST['idsiswabiaya'.$biaya.'TB']) && $_POST['idsiswabiaya'.$biaya.'TB']!=''){
										$pre ='UPDATE ';
										$f   ='';
										$w   =' WHERE replid ="'.$_POST['idsiswabiaya'.$biaya.'TB'].'"';
									}else{
										$pre ='INSERT INTO ';
										$f   =' siswa="'.(isset($siswaSV['id'])?$siswaSV['id']:'').'",';
										$w   ='';
									}

									$angsuran        = isset($_POST['angsuran'.$biaya.'TB'])?',angsuran ='.$_POST['angsuran'.$biaya.'TB']:'';
									$diskonkhusus    = isset($_POST['diskonkhusus'.$biaya.'TB'])?',diskonkhusus ='.getuang($_POST['diskonkhusus'.$biaya.'TB']):'';
									$ketdiskonkhusus = isset($_POST['ketdiskonkhusus'.$biaya.'TB'])?',ketdiskonkhusus ="'.$_POST['ketdiskonkhusus'.$biaya.'TB'].'"':'';
									$siswabiayaS 	 = $pre.' psb_siswabiaya SET '.$f.' detailbiaya ='.$v.'
														'.$angsuran.$diskonkhusus.$ketdiskonkhusus.$w;
									$siswabiayaE    = mysql_query($siswabiayaS);
									$siswabiayaID   = (isset($_POST['idsiswabiaya'.$biaya.'TB']) && $_POST['idsiswabiaya'.$biaya.'TB']!='')?$_POST['idsiswabiaya'.$biaya.'TB']:mysql_insert_id();
									$siswabiayaStat =!$siswabiayaE?false:true;
									
									// siswa - diskon  -----------------------------------------------------------------------------------------
									if(isset($_POST['iddetaildiskonTB'][$biaya])){ 
										foreach ($_POST['iddetaildiskonTB'][$biaya] as $ii => $vv) {
											if(isset($_POST['idsiswadiskon'.$vv.'TB']) && $_POST['idsiswadiskon'.$vv.'TB']!=''){
												$pre ='UPDATE '; 
												$f   ='';
												$w   =' WHERE replid='.$_POST['idsiswadiskon'.$vv.'TB'];
											}else{
												$pre ='INSERT INTO '; 
												$f   ='siswabiaya = '.$siswabiayaID.',';
												$w   ='';
											}$diskRegS   =$pre.' psb_siswadiskon SET '.$f.' detaildiskon = '.$vv.$w;
											$diskRegE    = mysql_query($diskRegS);
											$diskRegStat =!$diskRegE?false:true;
										}
									}
							 	}
							}
							if(!$siswabiayaStat){
								$stat='gagal_insert_siswa_biaya';
							}elseif(!$diskRegStat){
								$stat='gagal_insert_diskon_reguler';
							}else{// sukses
							// 	// siswa - ayah -----------------------------------------------------------------------------------------
								$siswaayahF = array(
									'siswa'=>isset($siswaSV['id'])?$siswaSV['id']:null,
									'namaayah',
									'tempatlahirayah',
									'tanggallahirayah'=>($_POST['tanggallahirayahTB']!=''?tgl_indo6($_POST['tanggallahirayahTB']):'0000-00-00'),	
									'agamaayah',
									'warganegaraayah',
									'kodeposayah',
									'kotaayah',
									'pendidikanayah',
									'bidangpekerjaanayah',
									'pekerjaanayah',
									'posisiayah',
									'penghasilanayah'=>getuang($_POST['penghasilanayahTB']),
									'telponayah',
									'pinbbayah',
									'emailayah',
									'alamatayah',
									'hpayah',
									'faxrumahayah',
									'alamatkantorayah',
									'telponkantorayah',
									'faxkantorayah',
									'gerejaayah',
								);$siswaayahSV=(isset($_POST['idformTB']) && !empty($_POST['idformTB']))?editRecord($siswaayahF,$tb2,'siswa',$_POST['idformTB']):addRecord($siswaayahF,$tb2);
								if(!$siswaayahSV['isSukses']){
									$stat='gagal_insert_siswa_ayah';
								}else{
									// siswa - ibu -----------------------------------------------------------------------------------------
									$siswaibuF = array(
										'siswa'=>isset($siswaSV['id'])?$siswaSV['id']:null,
										'namaibu',
										'tempatlahiribu',
										'tanggallahiribu'=>($_POST['tanggallahiribuTB']!=''?tgl_indo6($_POST['tanggallahiribuTB']):'0000-00-00'),	
										'agamaibu',
										'warganegaraibu',
										'kodeposibu',
										'kotaibu',
										'pendidikanibu',
										'bidangpekerjaanibu',
										'pekerjaanibu',
										'posisiibu',
										'penghasilanibu'=>getuang($_POST['penghasilanibuTB']),
										'telponibu',
										'pinbbibu',
										'emailibu',
										'alamatibu',
										'hpibu',
										'faxrumahibu',
										'alamatkantoribu',
										'telponkantoribu',
										'faxkantoribu',
										'gerejaibu',
									);$siswaibuSV=(isset($_POST['idformTB']) && !empty($_POST['idformTB']))?editRecord($siswaibuF,$tb3,'siswa',$_POST['idformTB']):addRecord($siswaibuF,$tb3);
									if(!$siswaibuSV['isSukses']){
										$stat='gagal_insert_siswa_ibu';
									}else{
										// siswa - walimurid (optional) -----------------------------------------------------------------------------------------
										$siswawaliStat=true;
										if(isset($_POST['siswawaliTB']) && $_POST['siswawaliTB']=='on'){
											$siswawaliF = array(
												'siswa'=>$_POST['idformTB']==''?($siswaSV['id']!=''?$siswaSV['id']:null):$_POST['idformTB'],
												'namawali',
												'alamatwali',
												'telponwali',
												'jkelaminwali',
												'kotawali',
											);
											$siswawaliSV=isset($_POST['idsiswawaliTB']) && $_POST['idsiswawaliTB']!=''?editRecord($siswawaliF,$tb4,'siswa',$_POST['idformTB']):addRecord($siswawaliF,$tb4);
											$siswawaliStat=!$siswawaliSV['isSukses']?false:true;
										}else{
											$siswawaliStat=true;
											if(isset($_POST['idsiswawaliTB']) && $_POST['idsiswawaliTB']!=''){
												$s='DELETE FROM '.$tb4.' WHERE replid='.$_POST['idsiswawaliTB'];
												$e=mysql_query($s);
												$siswawaliStat=!$e?false:true;
											}
										}
										
										if(!$siswawaliStat){
											$stat='gagal_insert_or_update_wali';
										}else{
											// siswa - kontak darurat -----------------------------------------------------------------------------------------
											$siswakontakdaruratStat=true;
											// pr($_POST['iKontakDDelTR']);
											if(isset($_POST['iKontakDDelTR']) && $_POST['iKontakDDelTR']!=''){ // ada item terhapus
												$sd = 'DELETE FROM psb_siswakontakdarurat WHERE replid IN ('.$_POST['iKontakDDelTR'].')';
												$ed = mysql_query($sd);
												$siswakontakdaruratStat=!$ed?false:true;
											}
											if(isset($_POST['idKontakDTR'])){ // ada item di add/edit
												foreach ($_POST['idKontakDTR'] as $i => $v) {
													if(isset($_POST['idKontakD'.$v.'TB']) && $_POST['idKontakD'.$v.'TB']!=''){ // edit
														$pre = 'UPDATE ';
														$w   =' WHERE replid='.$_POST['idKontakD'.$v.'TB'];
														$f   = '';
													}else{ // add 
														$pre = 'INSERT INTO ';
														$w   ='';
														$f   = 'siswa='.($_POST['idformTB']!=''?$_POST['idformTB']:$siswaSV['id']).',';
													}
														
													$namakontakdarurat    = isset($_POST['namakontakdarurat'.$v.'TB'])?$_POST['namakontakdarurat'.$v.'TB']:'';
													$hubkontakdarurat     = isset($_POST['hubkontakdarurat'.$v.'TB'])?$_POST['hubkontakdarurat'.$v.'TB']:'';
													$telponkontakdarurat1 = isset($_POST['telponkontakdarurat1'.$v.'TB'])?$_POST['telponkontakdarurat1'.$v.'TB']:'';
													$telponkontakdarurat2 = isset($_POST['telponkontakdarurat2'.$v.'TB'])?$_POST['telponkontakdarurat2'.$v.'TB']:'';
													$siswakontakdaruratS  = $pre.$tb5.' SET 	
															'.$f.' 
															namakontakdarurat    ="'.$namakontakdarurat.'",
															hubkontakdarurat     ="'.$hubkontakdarurat.'",
															telponkontakdarurat1 ="'.$telponkontakdarurat1.'",
															telponkontakdarurat2 ="'.$telponkontakdarurat2.'" 
														'.$w;
													$siswakontakdaruratE    =mysql_query($siswakontakdaruratS);
													$siswakontakdaruratStat =!$siswakontakdaruratE?false:true;
												}
											}
											if(!$siswakontakdaruratStat){
												$stat='gagal_insert_update_kontak_darurat';
											}else{
												// siswa - saudara -----------------------------------------------------------------------------------------
												$siswasaudaraStat=true;
												if(isset($_POST['iSaudaraDelTR']) && $_POST['iSaudaraDelTR']!=''){ // ada item terhapus
													$sd = 'DELETE FROM '.$tb6.' WHERE replid IN ('.$_POST['iSaudaraDelTR'].')';
													$ed = mysql_query($sd);
													$siswasaudaraStat=!$ed?false:true;
												}
												if(isset($_POST['idSaudaraTR'])){ // ada item di add/edit
													foreach ($_POST['idSaudaraTR'] as $i => $v) {
														if(isset($_POST['idSaudara'.$v.'TB']) && $_POST['idSaudara'.$v.'TB']!=''){ // edit
															$pre = 'UPDATE ';
															$w   =' WHERE replid='.$_POST['idSaudara'.$v.'TB'];
															$f   = '';
														}else{ // add 
															$pre = 'INSERT INTO ';
															$w   ='';
															$f   = 'siswa='.($_POST['idformTB']!=''?$_POST['idformTB']:$siswaSV['id']).',';
														}
														$namasaudara         = isset($_POST['namasaudara'.$v.'TB'])?$_POST['namasaudara'.$v.'TB']:'';
														$jkelaminsaudara     = isset($_POST['jkelaminsaudara'.$v.'TB'])?$_POST['jkelaminsaudara'.$v.'TB']:'';
														$tempatlahirsaudara  = isset($_POST['tempatlahirsaudara'.$v.'TB'])?$_POST['tempatlahirsaudara'.$v.'TB']:'';
														$tanggallahirsaudara = isset($_POST['tanggallahirsaudara'.$v.'TB'])?$_POST['tanggallahirsaudara'.$v.'TB']:'';
														$sekolahsaudara      = isset($_POST['sekolahsaudara'.$v.'TB'])?$_POST['sekolahsaudara'.$v.'TB']:'';
														$gradesaudara        = isset($_POST['gradesaudara'.$v.'TB'])?$_POST['gradesaudara'.$v.'TB']:'';
														$siswasaudaraS = $pre.$tb6.' SET 	
																'.$f.' 
																namasaudara         ="'.$namasaudara.'",
																jkelaminsaudara     ="'.$jkelaminsaudara.'",
																tempatlahirsaudara  ="'.$tempatlahirsaudara.'",
																tanggallahirsaudara ="'.tgl_indo6($tanggallahirsaudara).'", 
																sekolahsaudara      ="'.$sekolahsaudara.'", 
																gradesaudara        ="'.$gradesaudara.'" 
															'.$w;
														$siswasaudaraE    =mysql_query($siswasaudaraS);
														$siswasaudaraStat =!$siswasaudaraE?false:true;
													}
												}// end of : saudara siswa  ----
												if(!$siswasaudaraStat){
													$stat='gagal_insert_update_wali_murid';
												}else{
													$stat='sukses';
												}
											}
										}
									}
								}
							}
						}$out=json_encode(array('status' =>$stat));
					break;

					case 'status':
						if(isset($_POST['idstatusTB'])){
							$s='UPDATE psb_siswa SET 	status ="'.(!empty($_POST['nisTB'])?'1':'0').'",
														nis ="'.$_POST['nisTB'].'",
														nisn ="'.$_POST['nisnTB'].'"
												WHERE replid = '.$_POST['idstatusTB'];
							// pr($s);
							$e=mysql_query($s);
							$stat=!$e?'gagal':'sukses';
						}
						$out=json_encode(array('status' =>$stat));
					break;
				}
			break;


			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				// var_dump($s);exit();
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['replid']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s =' 	SELECT s.*,a.*,i.*,
							w.replid idsiswawali,
							w.namawali,
							w.jkelaminwali,
							w.alamatwali,
							w.kotawali,
							w.telponwali,
							case s.status
								when "0" then "Belum Diterima"
								when "1" then "Diterima"
								else "Lulus"
							end as statusiswa
						FROM psb_siswa s 
							JOIN psb_siswaayah a on a.siswa = s.replid
							JOIN psb_siswaibu i on i.siswa = s.replid
							LEFT JOIN psb_siswawali w on w.siswa = s.replid
					 	WHERE s.replid='.$_POST['replid'];
				$e    = mysql_query($s) or die(mysql_error());
				$r    = mysql_fetch_assoc($e);
				$stat = !$e?'gagal':'sukses';

				$deptNama =getKriteriaSiswa('departemen',$_POST['replid']);
					$deptID =getField('replid','departemen','nama',$deptNama);
				$thnNama  =getKriteriaSiswa('tahunajaran',$_POST['replid']);
					$thnID  =getField('replid','aka_tahunajaran','tahunajaran',$thnNama);
				$gelNama =getKriteriaSiswa('gelombang',$_POST['replid']);
					$gelID   =getField('replid','psb_gelombang','gelombang',$gelNama);

				$ww[]=['tahunajaran','=',$thnID]; 
				$ww[]=['departemen','=',$deptID]; 
				$ww[]=['gelombang','=',$gelID]; 
					$dgelID =getFieldArr4('replid','psb_detailgelombang','',$ww);
				$tingNama =getKriteriaSiswa('tingkat',$_POST['replid']);
					$tingID   =getField('replid','aka_tingkat','tingkat',$tingNama);
				$stingNama =getKriteriaSiswa('subtingkat',$_POST['replid']);
					$stingID   =getField('replid','aka_subtingkat','subtingkat',$stingNama);
				$golNama =getKriteriaSiswa('golongan',$_POST['replid']);
					$golID   =getField('replid','psb_golongan','golongan',$golNama);
				// pr($golID);

				$kontakdaruratArr = getFieldArr2('*',$tb5,'siswa',$_POST['replid']);
				$saudaraArr       = getFieldArr2('*',$tb6,'siswa',$_POST['replid']);
				$biayaArr         = getFieldArr2('*',$tb7,'siswa',$_POST['replid']);
				// TODO : fetch psb_siswabiaya (tingkat & subtingkat terakhir/paling tinggi )
				// pr($biayaArr);
				$out    = json_encode(array(
							'status'          =>$stat,
							'statussiswa'     =>$r['statusiswa'],
							// kriteria siswa 
							'departemen'      =>$deptID,
							'departemennama'  =>$deptNama,
							'tahunajaran'     =>$thnID,
							'tahunajarannama' =>$thnNama.' - '.($thnNama+1),
							'detailgelombang' =>$dgelID,
							'tingkat'         =>$tingID,
							'subtingkat'      =>$stingID,
							'golongan'        =>$golID,
							// biaya
							'biayaArr'        =>$biayaArr,
							// biodata siswa
							'nopendaftaran'          =>getNoPendaftaran2($_POST['replid']),
							'namasiswa'              =>$r['namasiswa'],
							'nis'                    =>$r['nis'],
							'nisn'                   =>$r['nisn'],
							'panggilansiswa'         =>$r['panggilansiswa'],
							'jkelaminsiswa'          =>$r['jkelaminsiswa'],
							'tempatlahirsiswa'       =>$r['tempatlahirsiswa'],
							'tanggallahirsiswa'      =>$r['tanggallahirsiswa']=='0000-00-00'?'':tgl_indo5($r['tanggallahirsiswa']),
							'sukusiswa'              =>$r['sukusiswa'],
							'warganegarasiswa'       =>$r['warganegarasiswa'],
							'agamasiswa'             =>$r['agamasiswa'],
							'photosiswa'             =>$r['photosiswa'],
							'hpsiswa'                =>$r['hpsiswa'],
							'telponsiswa'            =>$r['telponsiswa'],
							'bahasasiswa1'           =>$r['bahasasiswa1'],
							'bahasasiswa2'           =>$r['bahasasiswa2'],
							'emailsiswa'             =>$r['emailsiswa'],
							'pinbbsiswa'             =>$r['pinbbsiswa'],
							'alamatsiswa'            =>$r['alamatsiswa'],
							'kotasiswa'              =>$r['kotasiswa'],
							'kodepossiswa'           =>$r['kodepossiswa'],
							'beratsiswa'             =>$r['beratsiswa'],
							'tinggisiswa'            =>$r['tinggisiswa'],
							'darahsiswa'             =>$r['darahsiswa'],
							'penyakitsiswa'          =>$r['penyakitsiswa'],
							'catatankesehatansiswa'  =>$r['catatankesehatansiswa'],
							'diasuh'                 =>$r['diasuh'],
							'sekolahasalsiswa'       =>$r['sekolahasalsiswa'],
							'kotasekolahasalsiswa'   =>$r['kotasekolahasalsiswa'],
							'negarasekolahasalsiswa' =>$r['negarasekolahasalsiswa'],
							//ayah
							'namaayah'               =>$r['namaayah'],
							'tempatlahirayah'        =>$r['tempatlahirayah'],
							'tanggallahirayah'      =>$r['tanggallahirayah']=='0000-00-00'?'':tgl_indo5($r['tanggallahirayah']),
							'agamaayah'              =>$r['agamaayah'],
							'warganegaraayah'        =>$r['warganegaraayah'],
							'kodeposayah'            =>$r['kodeposayah'],
							'kotaayah'               =>$r['kotaayah'],
							'pendidikanayah'         =>$r['pendidikanayah'],
							'bidangpekerjaanayah'    =>$r['bidangpekerjaanayah'],
							'pekerjaanayah'          =>$r['pekerjaanayah'],
							'posisiayah'             =>$r['posisiayah'],
							'penghasilanayah'        =>setuang($r['penghasilanayah']),
							'telponayah'             =>$r['telponayah'],
							'emailayah'              =>$r['emailayah'],
							'pinbbayah'              =>$r['pinbbayah'],
							'alamatayah'             =>$r['alamatayah'],
							'hpayah'                 =>$r['hpayah'],
							'faxrumahayah'           =>$r['faxrumahayah'],
							'alamatkantorayah'       =>$r['alamatkantorayah'],
							'telponkantorayah'       =>$r['telponkantorayah'],
							'faxkantorayah'          =>$r['faxkantorayah'],
							'gerejaayah'             =>$r['gerejaayah'],
							//ibu
							'namaibu'                =>$r['namaibu'],
							'tempatlahiribu'         =>$r['tempatlahiribu'],
							'tanggallahiribu'      =>$r['tanggallahiribu']=='0000-00-00'?'':tgl_indo5($r['tanggallahiribu']),
							'agamaibu'               =>$r['agamaibu'],
							'warganegaraibu'         =>$r['warganegaraibu'],
							'kodeposibu'             =>$r['kodeposibu'],
							'kotaibu'                =>$r['kotaibu'],
							'pendidikanibu'          =>$r['pendidikanibu'],
							'bidangpekerjaanibu'     =>$r['bidangpekerjaanibu'],
							'pekerjaanibu'           =>$r['pekerjaanibu'],
							'posisiibu'              =>$r['posisiibu'],
							'penghasilanibu'         =>setuang($r['penghasilanibu']),
							'telponibu'              =>$r['telponibu'],
							'emailibu'               =>$r['emailibu'],
							'pinbbibu'               =>$r['pinbbibu'],
							'alamatibu'              =>$r['alamatibu'],
							'hpibu'                  =>$r['hpibu'],
							'faxrumahibu'            =>$r['faxrumahibu'],
							'alamatkantoribu'        =>$r['alamatkantoribu'],
							'telponkantoribu'        =>$r['telponkantoribu'],
							'faxkantoribu'           =>$r['faxkantoribu'],
							'gerejaibu'              =>$r['gerejaibu'],
							// biodata wali
							'idsiswawali'            =>$r['idsiswawali'],
							'namawali'               =>$r['namawali'],
							'jkelaminwali'           =>$r['jkelaminwali'],
							'alamatwali'             =>$r['alamatwali'],
							'kotawali'               =>$r['kotawali'],
							'telponwali'             =>$r['telponwali'],
							// kontak darurat
							'kontakdaruratArr'       =>$kontakdaruratArr,
							// saudara siswa
							'saudaraArr'             =>$saudaraArr
						));
			break;
			// ambiledit -----------------------------------------------------------------
			
			//detail siswa
			case 'detail':
				$s = ' SELECT 
								t.replid,
								d.nama departemen,
								akt.tahunajaran tahunajaran,
								k.kelompok kelompok,
								t.nopendaftaran nopendaftaran,
								t.status statusx,
								t.nama as nama_siswa,
								if(t.kelamin="L","Laki-Laki","Perempuan") jk,
								t.tmplahir temp_lahir,
								t.tgllahir tgl_lahir,
								pa.agama agama,
								t.alamat,
								t.telpon telepon,
								t.darah goldarah,
								t.kesehatan penyakit,
								t.ketkesehatan alergi,
								t.photo photo,
								/* Data Ortu*/
								ta.nama as nama_ayah,
								ta.warga as kebangsaan_ayah,
								ta.tmplahir as temp_lahir_ayah,
								ta.tgllahir as tgl_lahir_ayah,
								ta.pekerjaan as pekerjaan_ayah,
								ta.telpon as telepon_ayah,
								ta.pinbb as pinbb_ayah,
								ta.email as email_ayah,
								ti.nama as nama_ibu,
								ti.warga as kebangsaan_ibu,
								ti.tmplahir as temp_lahir_ibu,
								ti.tgllahir as tgl_lahir_ibu,
								ti.pekerjaan as pekerjaan_ibu,
								ti.telpon as telepon_ibu,
								ti.pinbb as pinbb_ibu,
								ti.email as email_ibu,
								/*Keluarga Siswa */
								tkel.kakek_nama kakek,
								tkel.nenek_nama nenek,
								tkel.tglnikah tgl_perkawinan,
								/*Saudara Siswa*/
								ts.nama nama_saudara,
								ts.tgllahir tgl_lahir_saudara,
								ts.sekolah sekolah_saudara,
								/*Kontak Darurat Siswa */
								tk.nama as nama_darurat,
								tk.hubungan as hubungan,
								tk.telpon as nomor_darurat
							from 
								'.$tb.' t
								LEFT JOIN mst_agama pa ON t.agama = pa.replid
								LEFT JOIN '.$tb_ayah.' ta ON ta.calonsiswa = t.replid
								LEFT JOIN '.$tb_ibu.' ti ON ti.calonsiswa = t.replid
								LEFT JOIN '.$tb_kontakdarurat.' tk ON tk.calonsiswa = t.replid
								LEFT JOIN '.$tb_keluarga.' tkel ON tkel.calonsiswa = t.replid
								LEFT JOIN '.$tb_saudara.' ts ON tkel.calonsiswa = t.replid
								LEFT JOIN psb_kelompok k ON k.replid = t.kelompok
								LEFT JOIN aka_tahunajaran akt ON akt.replid = k.tahunajaran
								LEFT JOIN departemen d ON d.replid = akt.departemen
							WHERE 
								t.replid='.$_POST['replid'];
						// print_r($s);exit();
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status' =>$stat,
							'data'   =>array( // tambahi node array ('data')
							// data siswa 
								'departemen'    =>$r['departemen'],
								'tahunajaran'   =>$r['tahunajaran'],
								'kelompok'      =>$r['kelompok'],
								'nopendaftaran' =>$r['nopendaftaran'],
								'statusx'       =>($r['statusx']=='1'?'<span style="color:#00A000"><b>Diterima</b></span>':'Belum Diterima'),
								'nama_siswa'    =>$r['nama_siswa'],
								'jk'            =>$r['jk'],
								'temp_lahir'    =>$r['temp_lahir'],
								'tgl_lahir'     =>tgl_indo($r['tgl_lahir']),
								'agama'         =>$r['agama'],
								'alamat'        =>$r['alamat'],
								'telepon'       =>$r['telepon'],
								'goldarah'      =>$r['goldarah'],
								'penyakit'      =>$r['penyakit'],
								'alergi'        =>$r['alergi'],
								'photo'        =>$r['photo'],
								// 'tingkat'        =>$r['tingkat'],
								// 'golongan'        =>$r['golongan'],
								// 'sumpokok'        =>$r['sumpokok'],
								// 'sumnet'          =>$r['sumnet'],
								// 'sppbulan'        =>$r['sppbulan'],
								// 	// 'jmlangsuran'     =>$r['jmlangsuran'],
								// 'angsuran'        =>$r['angsuran'],
								// 'discsubsidi'          =>$r['discsubsidi'],
								// 'discsaudara'     =>$r['discsaudara'],
								// 'disctunai'       =>$r['disctunai'],
								// 'disctotal'       =>$r['disctotal'],
								// 'nopendaftaran'   =>$r['nopendaftaran'],
								// 'sekolahasal'     =>$r['sekolahasal'],
								// 'photo'           =>$r['photo'],
								
							// data ayah calon siswa	
								'nama_ayah'       =>$r['nama_ayah'],
								'kebangsaan_ayah' =>$r['kebangsaan_ayah'],
								'temp_lahir_ayah' =>$r['temp_lahir_ayah'],
								'tgl_lahir_ayah'  =>tgl_indo($r['tgl_lahir_ayah']),
								'pekerjaan_ayah'  =>$r['pekerjaan_ayah'],
								'telepon_ayah'    =>$r['telepon_ayah'],
								'pinbb_ayah'      =>$r['pinbb_ayah'],
								'email_ayah'      =>$r['email_ayah'],
								
							// data ibu calon siswa	
								'nama_ibu'       =>$r['nama_ibu'],
								'kebangsaan_ibu' =>$r['kebangsaan_ibu'],
								'temp_lahir_ibu' =>$r['temp_lahir_ibu'],
								'tgl_lahir_ibu'  =>tgl_indo($r['tgl_lahir_ibu']),
								'pekerjaan_ibu'  =>$r['pekerjaan_ibu'],
								'telepon_ibu'    =>$r['telepon_ibu'],
								'pinbb_ibu'      =>$r['pinbb_ibu'],
								'email_ibu'      =>$r['email_ibu'],
							//Data Saudara siswa
								'nama_saudara'      =>$r['nama_saudara'],
								'tgl_lahir_saudara' =>$r['tgl_lahir_saudara'],
								'sekolah_saudara'   =>$r['sekolah_saudara'],

							//Data Keluarga	
								'tgl_perkawinan' =>$r['tgl_perkawinan'],
								'kakek'          =>$r['kakek'],
								'nenek'          =>$r['nenek'],
							//Data Darurat	
								'nama_darurat'  =>$r['nama_darurat'],
								'hubungan'      =>$r['hubungan'],
								'nomor_darurat' =>$r['nomor_darurat']
						)));
		 // console.log(res);  alert(res); //epiii : console dan alert hanya untuk di javascript 
			break;
			// detail siswa -----------------------------------------------------------------

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

			/*case 'codeGen':
				switch ($_POST['subaksi']) {
					case'transNo':
						$no = 'PMB';
						$s    ='SELECT max(nopendaftaran)nopendaftaran from psb_calonsiswa ';
						$e    =mysql_query($s);
						$stat =!$e?'gagal_'.mysql_error():'sukses';
						if(mysql_num_rows($e)>0){
							$r  =mysql_fetch_assoc($e);
							$in =$r['nopendaftaran']+1;
						}else{
							$in=1;
						}$kode=$no.date("Y").sprintf("%04d",$in);
						$out=json_encode(array('status'=>$stat,'kode'=>$kode));
					break;
				}
			break;*/

			// cmbkelompok -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where'.$mnu.'='.$_POST[$mnu];
					}elseif (isset($_POST['tahunajaran'])) {
						$w='where kelompok='.$_POST['tahunajaran'];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY '.$mnu.' asc';
				// var_dump($s);exit();
				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar = $dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error');
				}else{
					if($n==0){ // kosong 
						var_dump($n);exit();
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
			// cmbtingkat -----------------------------------------------------------------
			
			case 'cmbagama':
				$s	= ' SELECT *
						from psb_agama
						ORDER  BY urutan asc';
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
						}$ar = array('status'=>'sukses','agama'=>$dt);
					}
				}$out=json_encode($ar);
			break;

			case 'cmbangsuran':
								
				$s	= ' SELECT *
						from psb_angsuran
						ORDER  BY cicilan desc';
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
						}$ar = array('status'=>'sukses','angsuran'=>$dt);
					}
				}$out=json_encode($ar);
			break;


		}
	}
	echo $out;
?>


