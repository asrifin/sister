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
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				// $departemen    = trim($_POST['departemenSS'])?filter($_POST['departemenSS']):'';
				// $prosesS       = trim($_POST['prosesSS'])?filter($_POST['prosesSS']):'';
				// $kelompok      = trim($_POST['kelompokS'])?filter($_POST['kelompokS']):'';
				$departemen    = isset($_POST['departemenS'])?filter($_POST['departemenS']):'';
				$proses        = isset($_POST['prosesS'])?filter($_POST['prosesS']):'';
				$kelompok      = isset($_POST['kelompokS'])?filter($_POST['kelompokS']):'';
				$nopendaftaran = isset($_POST['nopendaftaranS'])?filter($_POST['nopendaftaranS']):'';
				$nama          = isset($_POST['namaS'])?filter($_POST['namaS']):'';
				$sql = 'SELECT pc.*
						FROM psb_calonsiswa pc
						LEFT JOIN psb_kelompok pk ON pk.replid = pc.kelompok
						LEFT JOIN psb_proses pp ON pp.replid = pk.proses
						LEFT JOIN departemen d ON d.replid = pp.departemen
						WHERE
						pc.kelompok = '.$kelompok.' AND
						pc.nopendaftaran LIKE "'.$nopendaftaran.'%" AND
						pc.nama LIKE "'.$nama.'%"
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
				$aksi    ='tampil';
				$subaksi ='';
				// $obj 	= new pagination_class($menu,$sql,$starting,$recpage);
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
									<button data-hint="ubah"  onclick="Modal('.$res['replid'].');">
										<i class="icon-zoom-in on-left"></i>
									</button>
									<button data-hint="ubah"  onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td id="'.$mnu.'TD_'.$res['replid'].'">'.$res['nopendaftaran'].'</td>
									
									<td>'.$res['nama'].'</td>
									<td>'.number_format($res['sumpokok']).'</td>
									<td>'.number_format($res['disctb']).'</td>
									<td>'.number_format($res['discsaudara']).'</td>
									<td>'.number_format($res['disctunai']).'</td>
									<td>'.number_format($res['denda']).'</td>
									<td>'.number_format($res['sumnet']).'</td>
									<td>'.number_format($res['angsuran']).'</td>
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
			// view -----------------------------------------------------------------

			case 'getbiaya':
				$s 		='SELECT 
							*
						FROM 
							psb_setbiaya
						WHERE
							kel = '.$_POST['kelompok'].' AND
							krit = '.$_POST['kriteria'].' AND
							gol = '.$_POST['golongan'] 
							;

									// print_r($s);exit();
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out    = json_encode(array(
							'status'   =>$stat,
							'spp'      =>$r['spp'],
							'joiningf' =>$r['joiningf'],
							'nilai'    =>$r['nilai']
						));				
			break;

			case 'getdiskon':
				$s 		='SELECT 
							*
						FROM 
							psb_disctunai
						WHERE
							nilai = '.$_POST['replid']
							;

									// print_r($s);exit();
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out    = json_encode(array(
							'status'          =>$stat,
							'nilai'          =>$r['nilai']
						));				
			break;

			case 'getangsuran':
				$s 		='SELECT 
							*
						FROM 
							psb_angsuran
						WHERE
							cicilan = '.$_POST['replid']
							;

									// print_r($s);exit();
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out    = json_encode(array(
							'status'          =>$stat,
							'cicilan'         =>$r['cicilan']
						));				
			break;

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				switch ($_POST['subaksi']) {
					case 'siswa':
												// sppbulan      = "'.filter($_POST['angsuranTB']).'",
						$siswa  = $tb.' set 	kriteria 		= "'.filter($_POST['kriteriaH']).'",
												golongan      = "'.filter($_POST['golonganH']).'",
												sumpokok      = "'.filter($_POST['uang_pangkalTB']).'",
												sumnet        = "'.filter($_POST['uang_pangkalnetTB']).'",
												jmlangsur     = "'.filter($_POST['angsuranH']).'",
												angsuran      = "'.filter($_POST['angsuranbulanTB']).'",
												disctb        = "'.filter($_POST['diskon_subsidiTB']).'",
												discsaudara   = "'.filter($_POST['diskon_saudaraTB']).'",
												disctunai     = "'.filter($_POST['diskon_tunaiH']).'",
												disctotal     = "'.filter($_POST['diskon_totalTB']).'",
												nopendaftaran = "'.filter($_POST['nopendaftaranTB']).'",
												nama          = "'.filter($_POST['namaTB']).'",
												kelamin       = "'.filter($_POST['jkTB']).'",
												tmplahir      = "'.filter($_POST['tempatlahirTB']).'",
												tgllahir      = "'.filter($_POST['tgllahiranakTB']).'",
												agama         = "'.filter($_POST['agamaTB']).'",
												alamat        = "'.filter($_POST['alamatsiswaTB']).'",
												telpon        = "'.filter($_POST['telpsiswaTB']).'",
												sekolahasal   = "'.filter($_POST['asalsekolahTB']).'",
												darah         = "'.filter($_POST['goldarahTB']).'",
												kesehatan     = "'.filter($_POST['penyakitTB']).'",
												ketkesehatan  = "'.filter($_POST['catatan_kesehatanTB']).'"
												'.(isset($_POST['file'])?', photo2= "'.$_POST['file'].'"':'');

												// var_dump($siswa);exit();
						$ayah    = $tb_ayah.' set 	nama 	  = "'.filter($_POST['ayahTB']).'",
													tgllahir  = "'.filter($_POST['tempatlahir_ayahTB']).'",
													tgllahir  = "'.filter($_POST['tgllahir_ayahTB']).'",
													warga     = "'.filter($_POST['kebangsaan_ayahTB']).'",
													pekerjaan = "'.filter($_POST['pekerjaan_ayahTB']).'",
													telpon    = "'.filter($_POST['telpayahTB']).'",
													pinbb     = "'.filter($_POST['pinbb_ayahTB']).'",
													email     = "'.filter($_POST['email_ayahTB']).'" ';

						$ibu    = $tb_ibu.' set 	nama 	  = "'.filter($_POST['ibuTB']).'",
													tgllahir  = "'.filter($_POST['tempatlahir_ibuTB']).'",
													tgllahir  = "'.filter($_POST['tgllahir_ibuTB']).'",
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
						// $saudara    	= $tb_saudara.' set 	nama 	   = "'.filter($_POST['saudara']).'",
						// 										sekolah    = "'.filter($_POST['nenekTB']).'" ';
												
						if (!isset($_POST['replid'])){ //add
						// if ($jumc==0){
							$tipex     ='add';
							$siswa     = 'INSERT INTO '.$siswa;
							$sqayah    = 'INSERT INTO  '.$ayah;
							
							$sqibu     = 'INSERT INTO '.$ibu;
							$sqkel     = 'INSERT INTO '.$keluarga;
							$sqkel     = 'INSERT INTO '.$keluarga;
							$sqdar     = 'INSERT INTO '.$kontakdarurat;
							// $sqsaudara = 'INSERT INTO '.$saudara;
						}else{ //edit
							$tipex ='edit';
							// $s=mysql_fetch_assoc(mysql_query('SELECT calonsiswa from psb_calonsiswa'));
							// $calonsiswa=$s['calonsiswa'];
							// $siswa = 'UPDATE '.$tb.' set '.$siswa.' WHERE calonsiswa='.$calonsiswa;
							// $sqayah = 'UPDATE '.$tb_ayah.' set '.$ayah.' WHERE calonsiswa='.$calonsiswa;
							// $sqibu = 'UPDATE '.$tb_ibu.' set '.$ibu.' WHERE calonsiswa='.$calonsiswa;
							// $sqdar = 'UPDATE '.$tb_kontakdarurat.' set '.$dar.' WHERE calonsiswa='.$calonsiswa;
							// $sqkel = 'UPDATE '.$tb_keluarga.' set '.$keluarga.' WHERE calonsiswa='.$calonsiswa;

						}									

						// $jumc= mysql_num_rows(mysql_query('SELECT * from psb_calonsiswa'));
						// var_dump($siswa);exit();
						$exa = mysql_query($siswa);
						$ida =  mysql_insert_id();
						if(!$exa){
							$out = '{"status":"gagal insert siswa"}';
						}else{
							$out = '{"status":"OK"}';
								// $siswa.=', calonsiswa 	= '.$ida;
							if (!isset($_POST['replid'])) { //add
							// if ($jumc==0) { //add
								$sqayah.=', calonsiswa 	= '.$ida;

								$sqibu.=', calonsiswa 	= '.$ida;
								$sqdar.=', calonsiswa 	= '.$ida;
								$sqkel.=', calonsiswa 	= '.$ida;

								if (isset($_POST['saudara'])) {
									foreach ($_POST['saudara'] as $i => $v) {
									$sqkel = 'INSERT INTO '.$tb_saudara.' set calonsiswa = '.$ida.',
																				 nama 	 ='.$v['nama'].', 
																				 tgllahir 	 ='.$v['tgllahir'] ;
									}
								}

							}
							// else{
								$exayah= mysql_query($sqayah);
								if (!$exayah) {
									$out='{"status":"gagal ayah"}';
								} else {
									$exibu= mysql_query($sqibu);
									if (!$exibu) {
										$out='{"status":"gagal ibu"}';
									} else {
										$exdar= mysql_query($sqdar);
										if (!$exdar) {
											$out='{"status":"gagal kontak darurat"}';
										} else {
											$exkel= mysql_query($sqkel);
											if (!$exkel) {
												// var_dump($sqas);exit();
												$out='{"status":"gagal keluarga"}';
											} else {
												$out='{
														"status":"sukses"
													  }';
											} //keluarga
										}//kon darurat
									} //else ibu
								}//else ayah
							}//calon siswa

						echo $out;
					break;
					case 'variable':
						# code...
						break;

					}
				break;


			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.isset($_POST['replid']);
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT 
								t.*,
								t.nama as siswa,
								/* Data Ortu*/
								ta.nama as nama_ayah,
								ta.warga as kebangsaan_ayah,
								ta.tmplahir as tmplahir_ayah,
								ta.tgllahir as tgllahir_ayah,
								ta.pekerjaan as pekerjaan_ayah,
								ta.telpon as telpon_ayah,
								ta.pinbb as pinbb_ayah,
								ta.email as email_ayah,
								ti.nama as nama_ibu,
								ti.warga as kebangsaan_ibu,
								ti.tmplahir as tmplahir_ibu,
								ti.tgllahir as tgllahir_ibu,
								ti.pekerjaan as pekerjaan_ibu,
								ti.telpon as telpon_ibu,
								ti.pinbb as pinbb_ibu,
								ti.email as email_ibu,
								tset.joiningf as joining,
								tset.spp spp,
								tset.nilai dpp,
								tk.nama as namalain,
								tk.hubungan as hubungan,
								tk.telpon as telponlain,
								tkel.kakek_nama kakek,
								tkel.nenek_nama nenek
							from 
								'.$tb.' t
								LEFT JOIN '.$tb_ayah.' ta ON ta.calonsiswa = t.replid
								LEFT JOIN '.$tb_ibu.' ti ON ti.calonsiswa = t.replid
								LEFT JOIN '.$tb_kontakdarurat.' tk ON tk.calonsiswa = t.replid
								LEFT JOIN '.$tb_keluarga.' tkel ON tkel.calonsiswa = t.replid
								LEFT JOIN psb_setbiaya pset ON pset.replid = t.setbiaya
							WHERE 
								t.replid='.$_POST['replid'];

									// print_r($s);exit();
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out    = json_encode(array(
							'status'          =>$stat,
							'kriteria'        =>$r['kriteria'],
							'golongan'        =>$r['golongan'],
							'sumpokok'        =>'Rp. '.number_format($r['sumpokok']),
							'sumnet'          =>$r['sumnet'],
							'spp'             =>$r['spp'],
							'jmlangsur'       =>$r['jmlangsur'],
							'angsuran'        =>$r['angsuran'],
							'disctb'          =>$r['disctb'],
							'discsaudara'     =>$r['discsaudara'],
							'disctunai'       =>$r['disctunai'],
							'disctotal'       =>$r['disctotal'],
							'joining'         =>$r['joining'],
							'nopendaftaran'   =>$r['nopendaftaran'],
							'siswa'           =>$r['siswa'],
							'kelamin'         =>$r['kelamin'],
							'tmplahir'        =>$r['tmplahir'],
							'tgllahir'        =>$r['tgllahir'],
							'agama'           =>$r['agama'],
							'alamat'          =>$r['alamat'],
							'telpon'          =>$r['telpon'],
							'sekolahasal'     =>$r['sekolahasal'],
							'darah'           =>$r['darah'],
							'kesehatan'       =>$r['kesehatan'],
							'ketkesehatan'    =>$r['ketkesehatan'],
							// 'photo'           =>$r['photo'],
							'photo2'           =>$r['photo2'],
							
							'nama_ayah'       =>$r['nama_ayah'],
							'kebangsaan_ayah' =>$r['kebangsaan_ayah'],
							'tmplahir_ayah'   =>$r['tmplahir_ayah'],
							'tgllahir_ayah'   =>$r['tgllahir_ayah'],
							'pekerjaan_ayah'  =>$r['pekerjaan_ayah'],
							'telpon_ayah'     =>$r['telpon_ayah'],
							'pinbb_ayah'      =>$r['pinbb_ayah'],
							'email_ayah'      =>$r['email_ayah'],
							
							'nama_ibu'        =>$r['nama_ibu'],
							'kebangsaan_ibu'  =>$r['kebangsaan_ibu'],
							'tmplahir_ibu'    =>$r['tmplahir_ibu'],
							'tgllahir_ibu'    =>$r['tgllahir_ibu'],
							'pekerjaan_ibu'   =>$r['pekerjaan_ibu'],
							'telpon_ibu'      =>$r['telpon_ibu'],
							'pinbb_ibu'       =>$r['pinbb_ibu'],
							'email_ibu'       =>$r['email_ibu'],
							
							'nama_dar'        =>$r['namalain'],
							'hubungan'        =>$r['hubungan'],
							'telpon'          =>$r['telponlain'],

							'kakek_nama'      =>$r['kakek'],
							'nenek_nama'      =>$r['nenek']
						));
			break;
			// ambiledit -----------------------------------------------------------------
			
			//detail siswa
			case 'detail':
				/*epiii*/
				/*tips :
					-definisikan satu2 select nya ( takut rancu ada nama field yang sama di lain tabel) (-_-)
					-inisialisasi nama tabel (FROM)ambil yg mudah saja : satu atau dua hurufawal  dri nama tabel
					-inisialisasi nama field (SELECT) samakan dengan id textbox form (view/controller ) ex : "kebangsaan_ayah" 
						query(model) = array/output(model) = ajax-success(controller) = textbox-form(view atau controller)   
				*/
				$s 		= ' SELECT 
								-- t.*,
								t.replid,
								d.nama departemen,
								p.proses proses,
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
								t.photo2 photo2,
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
								LEFT JOIN psb_proses p ON p.replid = k.proses
								LEFT JOIN departemen d ON d.replid = p.departemen
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
								'proses'        =>$r['proses'],
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
								'photo2'        =>$r['photo2'],
								// 'kriteria'        =>$r['kriteria'],
								// 'golongan'        =>$r['golongan'],
								// 'sumpokok'        =>$r['sumpokok'],
								// 'sumnet'          =>$r['sumnet'],
								// 'sppbulan'        =>$r['sppbulan'],
								// 	// 'jmlangsuran'     =>$r['jmlangsuran'],
								// 'angsuran'        =>$r['angsuran'],
								// 'disctb'          =>$r['disctb'],
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

			case 'codeGen':
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
			break;

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
						from mst_agama
						ORDER  BY urutan desc';
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