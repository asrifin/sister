<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
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
				// $tahunajaran = trim($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';
				$nopendaftaran = isset($_POST['nopendaftaranS'])?filter($_POST['nopendaftaranS']):'';
				$nama          = isset($_POST['namaS'])?filter($_POST['namaS']):'';
				$sql = 'SELECT *
						FROM '.$tb.' 							
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

			// add / edit -----------------------------------------------------------------
			case 'simpan':
								$siswa        = $tb.' set 	kriteria 		= "'.filter($_POST['kriteriaTB']).'",
								golongan      = "'.filter($_POST['golonganTB']).'",
								sumpokok      = "'.filter($_POST['uang_pangkalTB']).'",
								sumnet        = "'.filter($_POST['uang_pangkalnetTB']).'",
								sppbulan      = "'.filter($_POST['angsuranTB']).'",
								jmlangsuran   = "'.filter($_POST['angsuranTB']).'",
								angsuran      = "'.filter($_POST['angsuranbulanTB']).'",
								disctb        = "'.filter($_POST['diskon_subsidiTB']).'",
								discsaudara   = "'.filter($_POST['diskon_saudaraTB']).'",
								disctunai     = "'.filter($_POST['diskon_tunaiTB']).'",
								disctotal     = "'.filter($_POST['diskon_totalTB']).'",
								nopendaftaran = "'.filter($_POST['nopendaftaranTB']).'",
								nama          = "'.filter($_POST['namaTB']).'",
								kelamin       = "'.filter($_POST['jkTB']).'",
								templahir     = "'.filter($_POST['tempatlahirTB']).'",
								tgllahir      = "'.filter($_POST['tgllahiranakTB']).'",
								agama         = "'.filter($_POST['agamaTB']).'",
								alamat        = "'.filter($_POST['alamatsiswaTB']).'",
								telpon        = "'.filter($_POST['telpsiswaTB']).'",
								sekolahasal   = "'.filter($_POST['asalsekolahTB']).'",
								darah         = "'.filter($_POST['goldarahTB']).'",
								kesehatan     = "'.filter($_POST['penyakitTB']).'",
								ketkesehatan  = "'.filter($_POST['catatan_kesehatanTB']).'",
								'.(isset($_POST['file'])?', photo2= "'.$_POST['file'].'"':'');
								var_dump($siswa);exit();
								
								$ayah         = $tb.' set 	nama 	= "'.filter($_POST['ayahTB']).'",
								kebangsaan    = "'.filter($_POST['kebangsaan_ayahTB']).'",
								templahir     = "'.filter($_POST['tempatlahir_ayahTB']).'",
								tgllahir      = "'.filter($_POST['tgllahir_ayahTB']).'",
								pekerjaan     = "'.filter($_POST['pekerjaan_ayahTB']).'",
								telpon        = "'.filter($_POST['telpayahTB']).'",
								pinbb         = "'.filter($_POST['pinbb_ayahTB']).'",
								email         = "'.filter($_POST['email_ayahTB']).'"';
								
								$ibu          = $tb.' set 	nama 	= "'.filter($_POST['ibuTB']).'",
								kebangsaan    = "'.filter($_POST['kebangsaan_ibuTB']).'",
								templahir     = "'.filter($_POST['tempatlahir_ibuTB']).'",
								tgllahir      = "'.filter($_POST['tgllahir_ibuTB']).'",
								pekerjaan     = "'.filter($_POST['pekerjaan_ibuTB']).'",
								telpon        = "'.filter($_POST['telpibuTB']).'",
								pinbb         = "'.filter($_POST['pinbb_ibuTB']).'",
								email         = "'.filter($_POST['email_ibuTB']).'"';
								
								$dar          = $tb.' set 	nama 	= "'.filter($_POST['nama_kontakTB']).'",
								hubungan      = "'.filter($_POST['hubunganTB']).'",
								telpon        = "'.filter($_POST['nomorTB']).'"';
								
								$keluarga     = $tb.' set 	kakek-nama 	= "'.filter($_POST['kakekTB']).'",
								nenek-nama    = "'.filter($_POST['nenekTB']).'"';

				if (!isset($_POST['replid'])){ //add
				// if ($jumc==0){
					$tipex ='add';
					$siswa = 'INSERT INTO '.$tb.' set '.$siswa;
					$sqayah = 'INSERT INTO '.$tb_ayah.' set '.$ayah;
					$sqibu = 'INSERT INTO '.$tb_ibu.' set '.$ibu;
					$sqdar = 'INSERT INTO '.$tb_kontakdarurat.' set '.$dar;
					$sqkel = 'INSERT INTO '.$tb_keluarga.' set '.$keluarga;
				}else{ //edit
					$tipex ='edit';
					$s=mysql_fetch_assoc(mysql_query('SELECT calonsiswa from psb_calonsiswa'));
					$calonsiswa=$s['calonsiswa'];
					$siswa = 'UPDATE '.$tb.' set '.$siswa.' WHERE calonsiswa='.$calonsiswa;
					$sqayah = 'UPDATE '.$tb_ayah.' set '.$ayah.' WHERE calonsiswa='.$calonsiswa;
					$sqibu = 'UPDATE '.$tb_ibu.' set '.$ibu.' WHERE calonsiswa='.$calonsiswa;
					$sqdar = 'UPDATE '.$tb_kontakdarurat.' set '.$dar.' WHERE calonsiswa='.$calonsiswa;
					$sqkel = 'UPDATE '.$tb_keluarga.' set '.$keluarga.' WHERE calonsiswa='.$calonsiswa;

				}									

				$exa = mysql_query($siswa);
				$ida =  mysql_insert_id();
				if(!$exa){
					$out = '{"status";"gagal insert siswa"}';
				}else{
					if ($jumc==0) { //add
						// $siswa.=', calonsiswa 	= '.$ida;
						$sqayah.=', calonsiswa 	= '.$ida;
						$sqibu.=', calonsiswa 	= '.$ida;
						$sqdar.=', calonsiswa 	= '.$ida;
						$sqkel.=', calonsiswa 	= '.$ida;
					}

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
							} //ibu
						}//ayah
					}//calon siswa
				echo $out;
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
				$s 		= ' SELECT 
								t.*,
								ta.*,
								ti.*,
								tk.*,
								tkel.*
							from 
								JOIN '.$tb.' t
								JOIN '.$tb_ayah.' ta ON ta.psb_calonsiswa_ayah = t.psb_calonsiswa
								JOIN '.$tb_ibu.' ti ON ti.pwb_calonsiswa_ibu = t.psb_calonsiswa
								JOIN '.$tb_kontakdarurat.' tk ON tk.psb_calonsiswa_kontakdarurat = t.psb_calonsiswa
								JOIN '.$tb_keluarga.' tkel ON tkel.psb_keluarga_calonsiswa = t.psb_calonsiswa_keluarga
							WHERE 
								t.replid='.$_POST['replid'];
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'          =>$stat,
							'kriteria'        =>$r['kriteria'],
							'golongan'        =>$r['golongan'],
							'sumpokok'        =>$r['sumpokok'],
							'sumnet'          =>$r['sumnet'],
							'sppbulan'        =>$r['sppbulan'],
							'jmlangsuran'     =>$r['jmlangsuran'],
							'angsuran'        =>$r['angsuran'],
							'disctb'          =>$r['disctb'],
							'discsaudara'     =>$r['discsaudara'],
							'disctunai'       =>$r['disctunai'],
							'disctotal'       =>$r['disctotal'],
							'nopendaftaran'   =>$r['nopendaftaran'],
							'nama'            =>$r['nama'],
							'kelamin'         =>$r['kelamin'],
							'templahir'       =>$r['templahir'],
							'tgllahir'        =>$r['tgllahir'],
							'agama'           =>$r['agama'],
							'alamat'          =>$r['alamat'],
							'telpon'          =>$r['telpon'],
							'sekolahasal'     =>$r['sekolahasal'],
							'darah'           =>$r['darah'],
							'kesehatan'       =>$r['kesehatan'],
							'ketkesehatan'    =>$r['ketkesehatan'],
							'photo'           =>$r['photo'],
							
							'nama_ayah'       =>$r['nama'],
							'kebangsaan_ayah' =>$r['kebangsaan'],
							'templahir_ayah'  =>$r['templahir'],
							'tgllahir_ayah'   =>$r['tgllahir'],
							'pekerjaan_ayah'  =>$r['pekerjaan'],
							'telpon_ayah'     =>$r['telpon'],
							'pinbb_ayah'      =>$r['pinbb'],
							'email_ayah'      =>$r['email'],
							
							'nama_ibu'        =>$r['nama'],
							'kebangsaan_ibu'  =>$r['kebangsaan'],
							'templahir_ibu'   =>$r['templahir'],
							'tgllahir_ibu'    =>$r['tgllahir'],
							'pekerjaan_ibu'   =>$r['pekerjaan'],
							'telpon_ibu'      =>$r['telpon'],
							'pinbb_ibu'       =>$r['pinbb'],
							'email_ibu'       =>$r['email'],
							
							'nama_dar'        =>$r['nama'],
							'hubungan'        =>$r['hubungan'],
							'telpon'          =>$r['telpon'],
							'kakek-nama'      =>$r['kakek-nama'],
							'nenek-nama'      =>$r['nenek-nama']
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
				//var_dump($stat);exit();
				}$out  = json_encode(array('status'=>$stat));
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbkelompok -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where'.$mnu.'='.$_POST[$mnu];
					}elseif (isset($_POST['tahunajaran'])) {
						$w='where tahunajaran='.$_POST['tahunajaran'];
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

		}
	}
	echo $out;

?>