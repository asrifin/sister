<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	// require_once '../../lib/excel_reader2.php';
	$mnu  = 'siswa';
	$mnu2 = 'siswaayah';
	$mnu3 = 'siswaibu';
	$mnu4 = 'siswawali';
	$mnu5 = 'siswakontakdarurat';
	$mnu6 = 'siswasaudara';
	
	$tb   = 'psb_'.$mnu;
	$tb2  = 'psb_'.$mnu2;
	$tb3  = 'psb_'.$mnu3;
	$tb4  = 'psb_'.$mnu4;
	$tb5  = 'psb_'.$mnu5;
	$tb6  = 'psb_'.$mnu6;

	$upDir    = '../upload/';
	$fileDir  = $upDir.'files';
	$imageDir = $upDir.'images';

	if(!isset($_POST['aksi'])){
		if(isset($_GET['upload'])){
			if($_GET['upload']=='images'){ // images (jpg, png, dll)
				$tipex    = substr($_FILES[1]['type'],6);
				$namaAwal = $_FILES[1]['name'];
				$namaSkrg = $_SESSION['id_loginS'].'_'.substr((md5($namaAwal.rand())),2,10).'.'.$tipex;
				$src      = $_FILES[1]['tmp_name'];
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
						$nis           = isset($_POST['nisS'])?filter($_POST['nisS']):'';
						$nisn          = isset($_POST['nisnS'])?filter($_POST['nisnS']):'';
						$nopendaftaran = isset($_POST['nopendaftaranS'])?filter($_POST['nopendaftaranS']):'';
						$namasiswa     = isset($_POST['namasiswaS'])?filter($_POST['namasiswaS']):'';
						$status        = (isset($_POST['statusS']) && !empty($_POST['statusS']))?' AND status="'.filter($_POST['statusS']).'"':'';
						
						$sql = 'SELECT 
									replid, 
									nopendaftaran, 
									namasiswa,
									status,
									nis,
									nisn
								FROM '.$tb.'
								WHERE 
									nopendaftaran LIKE "%'.$nopendaftaran.'%"  AND
									nis LIKE "%'.$nis.'%"  AND
									nisn LIKE "%'.$nisn.'%" AND
									namasiswa LIKE "%'.$namasiswa.'%" 
									'.$status.'
								ORDER BY
									nopendaftaran ASC,
									namasiswa ASC
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
											<a class="button" '.(isAksi('siswa','r')?' href="report/r_siswa.php?token='.$token.'&replid='.$r['replid'].'"':' disabled href="#"').'  target="_blank" data-hint="cetak">
												<i class="icon-printer"></i>
											</a>
											<button data-hint="ubah"   '.(isAksi('siswa','u')?'onclick="viewFR('.$r['replid'].')"':' disabled').' >
												<i class="icon-pencil"></i>
											</button>
											<button data-hint="hapus"  '.(isAksi('siswa','d')?'onclick="del('.$r['replid'].')"':' disabled').'>
												<i class="icon-remove"></i>
											</button>
										 </td>';
								$out.= '<tr>
											<td>'.$r['nopendaftaran'].'</td>
											<td>'.$r['namasiswa'].'</td>
											<td>'.$r['nis'].'</td>
											<td>'.$r['nisn'].'</td>
											<td>'.($r['status']=='1'?'Diterima':($r['status']=='2'?'Lulus':'Belum Diterima')).'</td>
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
					
					case 'biaya':
						// pr($_SESSION);
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
								t.jenistagihan
							FROM psb_biaya b
								JOIN psb_jenistagihan t on t.replid = b.jenistagihan 
							ORDER BY 
								b.biaya ASC';
						$e=mysql_query($s);
						$stat=!$e?'gagal':'sukses';
						$n=mysql_num_rows($e);
						$biayaArr=array();
						if($n==0) $stat='kosong';
						else{
							$stat='sukses';
							while ($r=mysql_fetch_assoc($e)) {
								$biayaArr[]=array(
									'replid'       =>$r['replid'],
									'jenistagihan' =>$r['jenistagihan'],
									'kode'         =>$r['kode'],
									'biaya'        =>$r['biaya'],
									'idIsAngsur'   =>$r['idIsAngsur'],
									'isAngsur'     =>$r['isAngsur'],
									'isDiskon'     =>$r['isDiskon'],
									'jenistagihan' =>$r['jenistagihan'],
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
					$stat=!$biaya || is_null($biaya)?'gagal':'sukses';
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
				$no = getNoPendaftaran('',$_POST['kelompok']);
				$o  = array(
						'status'         =>(($no!=null || $no!='')?'sukses':'gagal'),
						'nopendaftaran'  =>$no['akhir'],
						'nopendaftaranH' =>$no['akhir'],
					);
				$out = json_encode($o);
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
					case 'subdokumen':
					break;

					case 'siswa':
						// delete file/image [edit:mode]
						$photosiswa=null;
						if(empty($_POST['idformTB'])){// add 
							 $photosiswa = isset($_POST['photosiswaTB'])?$_POST['photosiswaTB']:null; // ada upload 
						}else{ // edit
							if(isset($_POST['photosiswaTB'])){// ada upload 
								$photosiswa = $_POST['photosiswaTB'];
								if(isset($_POST['photosiswa2TB']) && !empty($_POST['photosiswa2TB'])) fileDel($imageDir.$_POST['photosiswa2TB']); // foto lama = ada 
							} 
						} 
						// biodata siswa -----------------------------------------------------------------------------------------
						$siswaF = array(
							'photosiswa'=>$photosiswa,
							'alamatsiswa',	
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
							'nopendaftaran',	
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
						);$siswaSV=(isset($_POST['idformTB'])&& !empty($_POST['idformTB']))?editRecord($siswaF,$tb,'replid',$_POST['idformTB']):addRecord($siswaF,$tb);
						// $stat='sukses'; // sementara
						if(!$siswaSV['isSukses']) $stat='gagal_insert_siswa';
						else{
							// siswa - biaya  -----------------------------------------------------------------------------------------
							$siswabiayaStat=true;
							$xx=$n=0;
							foreach ($_POST['iddetailbiayaTB'] as $i => $v) {
								$biaya           = getField('biaya','psb_detailbiaya','replid',$v);
								$angsuran        = isset($_POST['angsuran'.$biaya.'TB'])?',angsuran ='.$_POST['angsuran'.$biaya.'TB']:'';
								$diskonkhusus    = isset($_POST['diskonkhusus'.$biaya.'TB'])?',diskonkhusus ='.getuang($_POST['diskonkhusus'.$biaya.'TB']):'';
								$ketdiskonkhusus = isset($_POST['ketdiskonkhusus'.$biaya.'TB'])?',ketdiskonkhusus ="'.$_POST['ketdiskonkhusus'.$biaya.'TB'].'"':'';
								$siswabiayaS 	 ='INSERT INTO psb_siswabiaya SET 	siswa 	 	='.$siswaSV['id'].',
																					detailbiaya ='.$v.'
																					'.$angsuran.$diskonkhusus.$ketdiskonkhusus;
								$siswabiayaE    =mysql_query($siswabiayaS);
								$siswabiayaID   =mysql_insert_id();
								$siswabiayaStat =!$siswabiayaE?false:true;
								
								// siswa - diskon  -----------------------------------------------------------------------------------------
								$nn=1;
								$diskRegStat=true;
								if(isset($_POST['iddetaildiskonTB'][$biaya])){ 
									foreach ($_POST['iddetaildiskonTB'][$biaya] as $ii => $vv) {
										$diskRegS    ='INSERT INTO psb_siswadiskon SET siswabiaya = '.$siswabiayaID.', detaildiskon = '.$vv;
										$diskRegE    =mysql_query($diskRegS);
										$diskRegStat =!$diskRegE?false:true;
									}
								}
						 	}
							if(!$siswabiayaStat){
								$stat='gagal_insert_siswa_biaya';
							}elseif(!$diskRegStat){
								$stat='gagal_insert_diskon_reguler';
							}else{// sukses
								// siswa - ayah -----------------------------------------------------------------------------------------
								$siswaayahF = array(
									'siswa'=>isset($siswaSV['id'])?$siswaSV['id']:null,
									'namaayah',
									'tempatlahirayah',
									'tanggallahirayah',
									'agamaayah',
									'warganegaraayah',
									'kodeposayah',
									'kotaayah',
									'pendidikanayah',
									'bidangpekerjaanayah',
									'pekerjaanayah',
									'posisiayah',
									'penghasilanayah',
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
										'tanggallahiribu',
										'agamaibu',
										'warganegaraibu',
										'kodeposibu',
										'kotaibu',
										'pendidikanibu',
										'bidangpekerjaanibu',
										'pekerjaanibu',
										'posisiibu',
										'penghasilanibu',
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
										if(isset($_POST['namawaliTB']) && !empty($_POST['namawaliTB'])){
											$siswawaliF = array(
												'siswa'=>isset($siswaSV['id'])?$siswaSV['id']:null,
												'namawali',
												'alamatwali',
												'telponwali',
												'jkelaminwali',
												'kotawali',
											);$siswawaliSV=(isset($_POST['idformTB']) && !empty($_POST['idformTB']))?editRecord($siswawaliF,$tb4,'siswa',$_POST['idformTB']):addRecord($siswawaliF,$tb4);
											if(!$siswawaliSV['isSukses']){
												$stat='gagal_insert_siswawali';
											}
										}// end of : siswa - wali murid --------------------------------------------------------
										
										// siswa - kontak darurat -----------------------------------------------------------------------------------------
										$siswakontakdaruratStat=true;
										if(isset($_POST['idkontakdaruratTB'])){
											foreach ($_POST['idkontakdaruratTB'] as $i => $v) {
												$namakontakdarurat    = isset($_POST['namakontakdarurat'.$v.'TB'])?$_POST['namakontakdarurat'.$v.'TB']:'';
												$hubkontakdarurat     = isset($_POST['hubkontakdarurat'.$v.'TB'])?$_POST['hubkontakdarurat'.$v.'TB']:'';
												$telponkontakdarurat1 = isset($_POST['telponkontakdarurat1'.$v.'TB'])?$_POST['telponkontakdarurat1'.$v.'TB']:'';
												$telponkontakdarurat2 = isset($_POST['telponkontakdarurat2'.$v.'TB'])?$_POST['telponkontakdarurat2'.$v.'TB']:'';
												$siswakontakdaruratS  ='INSERT INTO '.$tb5.' SET 	
														siswa 				 ='.$siswaSV['id'].',
														namakontakdarurat    ="'.$namakontakdarurat.'",
														hubkontakdarurat     ="'.$hubkontakdarurat.'",
														telponkontakdarurat1 ="'.$telponkontakdarurat1.'",
														telponkontakdarurat2 ="'.$telponkontakdarurat2.'"';
												$siswakontakdaruratE    =mysql_query($siswakontakdaruratS);
												$siswakontakdaruratStat =!$siswakontakdaruratE?false:true;
											}
										}
										if(!$siswakontakdaruratStat) $stat='gagal_insert_siswa_kontakdarurat';
										else{
											$siswasaudaraStat=true;
											if(isset($_POST['idsaudaraTB'])){
												foreach ($_POST['idsaudaraTB'] as $i => $v) {
													$namasaudara         = isset($_POST['namasaudara'.$v.'TB'])?$_POST['namasaudara'.$v.'TB']:'';
													$jkelaminsaudara     = isset($_POST['jkelaminsaudara'.$v.'TB'])?$_POST['jkelaminsaudara'.$v.'TB']:'';
													$tempatlahirsaudara  = isset($_POST['tempatlahirsaudara'.$v.'TB'])?$_POST['tempatlahirsaudara'.$v.'TB']:'';
													$tanggallahirsaudara = isset($_POST['tanggallahirsaudara'.$v.'TB'])?$_POST['tanggallahirsaudara'.$v.'TB']:'';
													$sekolahsaudara      = isset($_POST['sekolahsaudara'.$v.'TB'])?$_POST['sekolahsaudara'.$v.'TB']:'';
													$gradesaudara        = isset($_POST['gradesaudara'.$v.'TB'])?$_POST['gradesaudara'.$v.'TB']:'';
													$siswasaudaraS  ='INSERT INTO '.$tb6.' SET 	
															siswa               ='.$siswaSV['id'].',
															namasaudara         ="'.$namasaudara.'",         
															jkelaminsaudara     ="'.$jkelaminsaudara.'",     
															tempatlahirsaudara  ="'.$tempatlahirsaudara.'",  
															tanggallahirsaudara ="'.tgl_indo6($tanggallahirsaudara).'", 
															sekolahsaudara      ="'.$sekolahsaudara.'",      
															gradesaudara        ="'.$gradesaudara.'"';        
													$siswasaudaraE    =mysql_query($siswasaudaraS);
													$siswasaudaraStat =!$siswasaudaraE?false:true;
												}
											}
											$stat=!$siswasaudaraStat?'gagal_insert_siswa_kontakdarurat':'sukses';
										}
									}
								}
							}
						}
					break;
				}$out=json_encode(array('status' =>$stat));
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
				$s = 'SELECT 
							/* Data  Siswa*/
							c.*,
							c.nama namaSiswa,
							-- t.tingkat,
							/* pembayaran*/
							b.material,
							b.tuition,
							b.registration,
							
							/* Data Ortu*/
							a.nama namaAyah,
							a.warga kebangsaanAyah,
							a.tmplahir tmplahirAyah,
							a.tgllahir tgllahirAyah,
							a.pekerjaan pekerjaanAyah,
							a.telpon telponAyah,
							a.pinbb pinbbAyah,
							a.email emailAyah,
							i.nama namaIbu,
							i.warga kebangsaanIbu,
							i.tmplahir tmplahirIbu,
							i.tgllahir tgllahirIbu,
							i.pekerjaan pekerjaanIbu,
							i.telpon telponIbu,
							i.pinbb pinbbIbu,
							i.email emailIbu,
							
							/* Data Ortu*/
							d.nama namaDarurat,
							d.hubungan,
							d.telpon telponDarurat,

							/* kakek nenek*/
							k.kakek_nama namaKakek,
							k.nenek_nama namaNenek
					 FROM psb_calonsiswa c 
							LEFT JOIN psb_calonsiswa_ayah a ON a.calonsiswa = c.replid
							LEFT JOIN psb_calonsiswa_ibu i ON i.calonsiswa = c.replid
							LEFT JOIN psb_calonsiswa_kontakdarurat d ON d.calonsiswa = c.replid
							LEFT JOIN psb_calonsiswa_keluarga k ON k.calonsiswa = c.replid
							LEFT JOIN psb_setbiaya b ON b.replid = c.setbiaya
							-- LEFT JOIN aka_tingkat t ON t.replid = c.tingkat
					 WHERE 
						c.replid='.$_POST['replid'];
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				// print_r($r);exit();
				$stat          = ($e)?'sukses':'gagal';
				$regNum        = setuang(getBiaya('registration',$_POST['replid']));
				$regNumNet     = setuang(getBiayaNet('registration',$_POST['replid']));
				$nopendaftaran = getNoPendaftaran($_POST['replid'],$r['kelompok'])['akhir'];
				// $tingkat   	   = getField('tingkat','psb_calonsiswa','replid',$r['tingkat']);
				$tahunajaran   = getField('tahunajaran','psb_kelompok','replid',$r['kelompok']);
				$discangsuran  = setuang(getDiscAngsuran($regNum, $r['angsuran']));
				$disctunai 	   = setuang(getDisc('disctunai',$_POST['replid']));
				// var_dump($tingkat);exit();
				$out    = json_encode(array(
							'status'          =>$stat,
						// pembayaran
							'setbiaya'        =>$r['setbiaya'],
							'registration'    =>$regNum,
							'angsuran'        =>$r['angsuran'],
							'discangsuran'    =>$discangsuran,
							'discsubsidi'     =>setuang($r['discsubsidi']),
							'discsaudara'     =>setuang($r['discsaudara']),
							'iddisctunai'     =>$r['disctunai'],
							'disctunai'       =>$disctunai,
							'disctotal'       =>setuang(getDiscTotal($_POST['replid'])),
							'registrationnet' =>$regNumNet,
							'material'        =>setuang($r['material']),
							'tuition'         =>setuang($r['tuition']),
						// data siswa
							
							'nopendaftaranH'  =>$r['nopendaftaran'],
							'nopendaftaran'  =>$nopendaftaran,
							'namaSiswa'      =>$r['namaSiswa'],
							'tahunajaran'    =>$tahunajaran,
							'kelompok'       =>$r['kelompok'],
							'tingkat'        =>$r['tingkat'],
							'golongan'       =>$r['golongan'],
							'kelamin'        =>$r['kelamin'],
							'tmplahir'       =>$r['tmplahir'],
							'tgllahir'       =>tgl_indo5($r['tgllahir']),
							'agama'          =>$r['agama'],
							'alamat'         =>$r['alamat'],
							'telpon'    	 =>$r['telpon'],
							'sekolahasal'    =>$r['sekolahasal'],
							'photosiswa'          =>$r['photosiswa'],
							'darah'          =>$r['darah'],
							'kesehatan'      =>$r['kesehatan'],
							'ketkesehatan'   =>$r['ketkesehatan'],
						// ayah 
							'namaAyah'       =>$r['namaAyah'],
							'kebangsaanAyah' =>$r['kebangsaanAyah'],
							'tmplahirAyah'   =>$r['tmplahirAyah'],
							'tgllahirAyah'   =>tgl_indo5($r['tgllahirAyah']),
							'pekerjaanAyah'  =>$r['pekerjaanAyah'],
							'telponAyah'     =>$r['telponAyah'],
							'pinbbAyah'      =>$r['pinbbAyah'],
							'emailAyah'      =>$r['emailAyah'],
						// ibu
							'namaIbu'        =>$r['namaIbu'],
							'kebangsaanIbu'  =>$r['kebangsaanIbu'],
							'tmplahirIbu'    =>$r['tmplahirIbu'],
							'tgllahirIbu'    =>tgl_indo5($r['tgllahirIbu']),
							'pekerjaanIbu'   =>$r['pekerjaanIbu'],
							'telponIbu'      =>$r['telponIbu'],
							'pinbbIbu'       =>$r['pinbbIbu'],
							'emailIbu'       =>$r['emailIbu'],
						/*kakek nenek*/
							'namaKakek'      =>$r['namaKakek'],
							'namaNenek'      =>$r['namaNenek'],
						/*darurat*/
							'namaDarurat'    =>$r['namaDarurat'],
							'hubungan'       =>$r['hubungan'],
							'telponDarurat'  =>$r['telponDarurat'],
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


