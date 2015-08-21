<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	// require_once '../../lib/excel_reader2.php';
	$mnu               = 'calonsiswa';
	$mnu_ayah          = 'calonsiswa_ayah';
	$mnu_ibu           = 'calonsiswa_ibu';
	$mnu_keluarga      = 'calonsiswa_keluarga';
	$mnu_kontakdarurat = 'calonsiswa_kontakdarurat';
	$mnu_saudara       = 'calonsiswa_saudara';
	$tb                = 'psb_'.$mnu;
	$tb_ayah           = 'psb_'.$mnu_ayah;
	$tb_ibu            = 'psb_'.$mnu_ibu;
	$tb_keluarga       = 'psb_'.$mnu_keluarga;
	$tb_kontakdarurat  = 'psb_'.$mnu_kontakdarurat;
	$tb_saudara        = 'psb_'.$mnu_saudara;
	// $out=array();

	if(!isset($_POST['aksi'])){
		if(isset($_GET['upload'])){
			$tipex    = substr($_FILES[0]['type'],6);
			$namaAwal = $_FILES[0]['name'];
			$namaSkrg = $_SESSION['id_loginS'].'_'.substr((md5($namaAwal.rand())),2,10).'.'.$tipex;
			$src      = $_FILES[0]['tmp_name'];
			$destix   = '../img/upload/'.basename($namaSkrg);

			if(move_uploaded_file($src, $destix))
				$o=array('status'=>'sukses','file'=>$namaSkrg);
			else
				$o=array('status'=>'gagal');

			$out=json_encode($o);
		}elseif(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
			$page       = $_GET['page']; // get the requested page
			$limit      = $_GET['rows']; // get how many rows we want to have into the grid
			$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
			$sord       = $_GET['sord']; // get the direction
			$searchTerm = $_GET['searchTerm'];

			if(!$sidx) 
				$sidx =1;

				// FROM
				// 	'.$table.'
			$ss='SELECT *
					FROM (SELECT pc.replid, pc.nama siswa, d.nama sekolah FROM psb_calonsiswa pc
								LEFT JOIN psb_kelompok k ON k.replid = pc.kelompok
								LEFT JOIN aka_tahunajaran t ON t.replid = k.tahunajaran
								LEFT JOIN departemen d ON d.replid = t.departemen 
						)tb
				WHERE
						tb.siswa LIKE "%'.$searchTerm.'%"
						OR tb.sekolah LIKE "%'.$searchTerm.'%"';
			// print_r($ss);exit();
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
			$rows 	= array();
			while($row = mysql_fetch_assoc($result)) {
				// $kode = (isset($_GET['subaksi']) and $_GET['subaksi']=='klasifikasi')?$row['kode']:'';
				$rows[]= array(
					'replid' =>$row['replid'], 
					'siswa'	 =>$row['siswa'],
					'sekolah'   =>$row['sekolah'] 
				);
			}$response=array(
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
			// -----------------------------------------------------------------
			case 'tampil':
				$departemen    = isset($_POST['departemenS'])?filter($_POST['departemenS']):'';
				// $proses        = isset($_POST['prosesS'])?filter($_POST['prosesS']):'';
				$kelompok      = isset($_POST['kelompokS'])?filter($_POST['kelompokS']):'';
				$nopendaftaran = isset($_POST['nopendaftaranS'])?filter($_POST['nopendaftaranS']):'';
				$nama          = isset($_POST['namaS'])?filter($_POST['namaS']):'';
				$tingkat       = isset($_POST['tingkatS'])?filter($_POST['tingkatS']):'';
				// $sql = 'SELECT
				// 			c.replid,
				// 			c.nopendaftaran,
				// 			c.nama,
				// 			c.setbiaya,
				// 			a.cicilan,
				// 			c.kelompok
				// 		FROM
				// 			psb_calonsiswa c
				// 			LEFT JOIN psb_kelompok k ON k.replid = c.kelompok
				// 			LEFT JOIN departemen d ON d.replid = p.departemen
				// 			LEFT JOIN psb_angsuran a ON a.replid = c.angsuran
				// 		WHERE
				// 			c.nopendaftaran LIKE "%'.$nopendaftaran.'%"
				// 			AND c.nama LIKE "%'.$nama.'%"
				// 			AND c.kelompok = '.$kelompok.'
				// 		ORDER BY
				// 			c.nopendaftaran ASC,
				// 			c.nama ASC
				// 			';
				$sql = 'SELECT
							c.replid,
							c.nopendaftaran,
							c.nama,
							c.setbiaya,
							a.cicilan,
							c.kelompok,
						  	akt.tingkat
						FROM
							psb_calonsiswa c
						LEFT JOIN psb_kelompok k ON k.replid = c.kelompok
						LEFT JOIN aka_tingkat akt ON akt.replid = c.tingkat
						LEFT JOIN aka_tahunajaran t ON t.replid = akt.tahunajaran
						LEFT JOIN departemen d ON d.replid = t.departemen
						LEFT JOIN psb_angsuran a ON a.replid = c.angsuran
						WHERE
							c.nopendaftaran LIKE "%'.$nopendaftaran.'%"
						AND c.nama LIKE "%'.$nama.'%"
						AND c.kelompok = '.$kelompok.'
						AND akt.tingkat LIKE "%'.$tingkat.'%"
						ORDER BY
							c.nopendaftaran ASC,
							c.nama ASC
							';
				// print_r($sql);exit();	
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
									// <button data-hint="ubah"  onclick="switchPN(\'form\','.$r['replid'].');">
						$btn ='<td align="center">
									<a class="button" href="report/r_pendataan.php?token='.$token.'&replid='.$r['replid'].'" target="_blank" data-hint="cetak">
										<i class="icon-printer"></i>
									</a>
									<button data-hint="ubah"  onclick="switchPN(\'form\','.$r['replid'].');">
										<i class="icon-pencil"></i>
									</button>
									<button data-hint="hapus" onclick="del('.$r['replid'].');">
										<i class="icon-remove"></i>
									</button>
								 </td>';
						$no=getNoPendaftaran($r['replid'],$r['kelompok']) ;
						// var_dump($no);exit();
						$out.= '<tr>
									<td>'.$no['akhir'].'</td>
									<td>'.$r['nama'].'</td>
									<td>'.$r['tingkat'].'</td>
									<td align="right">'.setuang(getBiaya('registration',$r['replid'])).'</td>
									<td align="right">'.setuang(getDisc('discsaudara',$r['replid'])).'</td>
									<td align="right">'.setuang(getDisc('disctunai',$r['replid'])).'</td>
									<td align="right">'.setuang(getDisc('discangsuran',$r['replid'])).'</td>
									<td align="right" class="bg-green fg-white">'.setuang(getBiayaNet('registration',$r['replid'])).'</td>
									<td align="center">'.($r['cicilan']==1?'Cash':'Angsur '.$r['cicilan'].' x').'</td>
									'.$btn.'
								</tr>';
									// <td align="right">'.setuang(getDisc('discsubsidi',$r['replid'])).'</td>
									// <td align="center">'.($r['angsuran']==1?'<i class="fg-green icon-checkmark"></i>':'<i class="fg-red icon-minus"></i>').'</td>
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
			// view -----------------------------------------------------------------

			case 'getBiaya':
				if(!isset($_POST['kelompok']) || !isset($_POST['tingkat']) || !isset($_POST['golongan'])){
					$o = array('status' =>'invalid_no_post' );
				}else{
					$biaya = getSetBiaya($_POST['kelompok'],$_POST['tingkat'],$_POST['golongan']);
					$o     = array(
								'status'       =>(($biaya!=null || $biaya!='')?'sukses':'gagal'),
								'replid'       =>$biaya['replid'],
								'registration' =>$biaya['registration'],
								'material'     =>$biaya['material'],
								'tuition'      =>$biaya['tuition'],
							);				
				}$out = json_encode($o);
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
				$siswa = $tb.' set 	tingkat 	  = "'.filter($_POST['tingkatTB']).'",
									golongan      = "'.filter($_POST['golonganTB']).'",
									kelompok      = "'.filter($_POST['kelompokTB']).'",
									discsubsidi   = "'.getuang(filter($_POST['discsubsidiTB'])).'",
									discsaudara   = "'.getuang(filter($_POST['discsaudaraTB'])).'",
									disctunai     = "'.filter($_POST['disctunaiTB']).'",
									setbiaya     = "'.filter($_POST['setbiayaTB']).'",
									angsuran     = "'.filter($_POST['angsuranTB']).'",
									
									nopendaftaran = "'.filter($_POST['nopendaftaranH']).'",
									nama          = "'.filter($_POST['namaTB']).'",
									kelamin       = "'.filter($_POST['jkTB']).'",
									tmplahir      = "'.filter($_POST['tempatlahirTB']).'",
									'.(($_POST['tgllahiranakTB']=='' || $_POST['tgllahiranakTB']=='00  0000')?'':'tgllahir  ="'.tgl_indo6(filter($_POST['tgllahiranakTB'])).'",').'
									agama         = "'.filter($_POST['agamaTB']).'",
									alamat        = "'.filter($_POST['alamatsiswaTB']).'",
									telpon        = "'.filter($_POST['telpsiswaTB']).'",
									sekolahasal   = "'.filter($_POST['asalsekolahTB']).'",
									darah         = "'.($_POST['goldarahTB']==''?filter($_POST['goldarahTB']):'-').'",
									kesehatan     = "'.filter($_POST['penyakitTB']).'",
									ketkesehatan  = "'.filter($_POST['catatan_kesehatanTB']).'"
									'.(isset($_POST['file'])?', photo= "'.$_POST['file'].'"':'');

										// var_dump($siswa);exit();
				$ayah = $tb_ayah.' set 	nama 	  = "'.filter($_POST['ayahTB']).'",
										warga     = "'.filter($_POST['kebangsaan_ayahTB']).'",
										tmplahir  = "'.filter($_POST['tempatlahir_ayahTB']).'",
										'.(($_POST['tgllahir_ayahTB']=='' || $_POST['tgllahir_ayahTB']=='00  0000')?'':'tgllahir  ="'.tgl_indo6(filter($_POST['tgllahir_ayahTB'])).'",').'
										pekerjaan = "'.filter($_POST['pekerjaan_ayahTB']).'",
										telpon    = "'.filter($_POST['telpayahTB']).'",
										pinbb     = "'.filter($_POST['pinbb_ayahTB']).'",
										email     = "'.filter($_POST['email_ayahTB']).'" ';

				$ibu    = $tb_ibu.' set 	nama 	  = "'.filter($_POST['ibuTB']).'",
										tmplahir  = "'.filter($_POST['tempatlahir_ibuTB']).'",
										'.(($_POST['tgllahir_ibuTB']=='' || $_POST['tgllahir_ibuTB']=='00  0000')?'':'tgllahir  ="'.tgl_indo6(filter($_POST['tgllahir_ibuTB'])).'",').'
										warga     = "'.filter($_POST['kebangsaan_ibuTB']).'",
										pekerjaan = "'.filter($_POST['pekerjaan_ibuTB']).'",
										telpon    = "'.filter($_POST['telpibuTB']).'",
										pinbb     = "'.filter($_POST['pinbb_ibuTB']).'",
										email     = "'.filter($_POST['email_ibuTB']).'" ';
				
				$kontakdarurat  = $tb_kontakdarurat.' set 	nama 	  = "'.filter($_POST['nama_kontakTB']).'",
													hubungan = "'.filter($_POST['hubunganTB']).'",
													telpon   = "'.filter($_POST['nomorTB']).'" ';
											
				$keluarga    	= $tb_keluarga.' set 	kakek_nama 	  = "'.filter($_POST['kakekTB']).'",
														nenek_nama    = "'.filter($_POST['nenekTB']).'" ';
				if (!isset($_POST['replid'])){ //add
					$tipex     ='add';
					$sqsiswa   = 'INSERT INTO '.$siswa;
					$sqayah    = 'INSERT INTO  '.$ayah;
					
					$sqibu     = 'INSERT INTO '.$ibu;
					$sqkel     = 'INSERT INTO '.$keluarga;
					$sqdar     = 'INSERT INTO '.$kontakdarurat;
				}else{ //edit
					$tipex      ='edit';
					$s          = mysql_fetch_assoc(mysql_query('SELECT replid from psb_calonsiswa'));
					$calonsiswa = $s['replid'];
					if(isset($_POST['photo_asal'])){ //change image
						$img='../img/upload/'.$_POST['photo_asal'];
						if(file_exists($img)){ //checking image is exist
							$delimg = unlink($img);
							$statgb  = !$delimg?false:true;
						}
					}
					$sqsiswa = 'UPDATE '.$siswa.' WHERE replid='.$calonsiswa;
					$sqayah  = 'UPDATE '.$ayah.' WHERE calonsiswa='.$calonsiswa;
					$sqibu   = 'UPDATE '.$ibu.' WHERE calonsiswa='.$calonsiswa;
					$sqdar   = 'UPDATE '.$kontakdarurat.' WHERE calonsiswa='.$calonsiswa;
					$sqkel   = 'UPDATE '.$keluarga.' WHERE calonsiswa='.$calonsiswa;
				}									

				$exa = mysql_query($sqsiswa);
				$ida = mysql_insert_id();
				if(!$exa){
					$stat = 'gagal_insert_siswa_'.mysql_error();
				}else{
					if (!isset($_POST['replid'])) { //add
						$sqayah.=', calonsiswa 	= '.$ida;
						$sqibu.=', calonsiswa 	= '.$ida;
						$sqdar.=', calonsiswa 	= '.$ida;
						$sqkel.=', calonsiswa 	= '.$ida;
				
						// var_dump($sqkel);exit();						

						$stat2=true;
						/*if (isset($_POST['saudara'])) {
							foreach ($_POST['saudara'] as $i => $v) {
								$sqsaud = 'INSERT INTO '.$tb_saudara.' set  calonsiswa = '.$ida.',
																			nama       ='.filter($v['nama']).' 
																			'.($v['tgllahir']!=''?',tgllahir   ='.filter($v['tgllahir']:'');
								$esaud = mysql_query($sqsaud);
							}
						}*/

					}
					$exayah= mysql_query($sqayah);
					if (!$exayah) {
						// $stat='{"status":"gagal ayah"}';
						$stat='gagal ayah'; // epiii
					} else {
						$exibu= mysql_query($sqibu);
						if (!$exibu) {
							// $stat='{"status":"gagal ibu"}';
							$stat='gagal ibu'; // epiii
						} else {
							$exdar= mysql_query($sqdar);
							if (!$exdar) {
								// $stat='{"status":"gagal kontak darurat"}';
								$stat='gagal kontak darurat'; // epiii
							} else {
								$exkel= mysql_query($sqkel);
								if (!$exkel) {
									// $stat='{"status":"gagal keluarga"}';
									$stat='gagal keluarga'; // epiii
								} else {
									// $stat='{"status":"gagal keluarga"}';
									$stat='sukses'; // epiii
								} //keluarga
							}//kon darurat
						} //else ibu
					}//else ayah
				}//calon siswa
				$out=json_encode(array('status' =>$stat));
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
							'photo'          =>$r['photo'],
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