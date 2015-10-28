<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'siswa';
	$tb  = 'psb_'.$mnu;
	// $out=array();

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$departemen  = isset($_POST['departemenS'])?filter(trim($_POST['departemenS'])):'';
				$tahunajaran = isset($_POST['tahunajaranS'])?filter($_POST['tahunajaranS']):'';
				// pr($tahunajaran);
				$sql = 'SELECT 
							t.replid,
							t.tingkat,
							ifnull(tb.belum,0)belum,
							ifnull(tb.sudah,0)sudah
						from 
							aka_tingkat t 
							JOIN aka_subtingkat st on st.tingkat = t.replid 
							JOIN aka_kelas k on k.subtingkat = st.replid 
						LEFT JOIN (
								SELECT 
									sum(tb2.status="0")belum,
									sum(tb2.status="1")sudah,
									tb2.tingkat
								FROM (
									SELECT
										siswa.replid,
										siswa.status,
										tingkat.replid tingkat
									FROM
										psb_siswa siswa
										JOIN psb_siswabiaya siswabiaya on siswabiaya.siswa = siswa.replid
										JOIN psb_detailbiaya detailbiaya on detailbiaya.replid = siswabiaya.detailbiaya
										JOIN psb_biaya biaya on biaya.replid = detailbiaya.biaya
										JOIN aka_subtingkat subtingkat on subtingkat.replid = detailbiaya.subtingkat
										JOIN aka_tingkat tingkat on tingkat.replid = subtingkat.tingkat
										JOIN psb_detailgelombang detailgelombang on detailgelombang.replid = detailbiaya.detailgelombang
										JOIN psb_gelombang gelombang on gelombang.replid = detailgelombang.gelombang
										JOIN aka_tahunajaran tahunajaran on tahunajaran.replid = detailgelombang.tahunajaran
										JOIN psb_golongan golongan on golongan.replid = detailbiaya.golongan
										JOIN departemen departemen  on departemen.replid = detailgelombang.departemen	
									Where 
										siswa.status != "2" and detailgelombang.tahunajaran = '.$tahunajaran.' and departemen.replid='.$departemen.'
									GROUP BY
										siswa.replid
								)tb2 
								GROUP BY tb2.tingkat
							)tb on tb.tingkat = t.replid
							WHERE
								k.departemen = '.$departemen.'
							GROUP BY
								t.replid
							ORDER BY t.urutan ASC';
				// vd($sql);
				$e   = mysql_query($sql);
				$jum = mysql_num_rows($e);
				$out ='';
				if($jum!=0){	
					$nox =1;
					$sudah = $belum = 0;
					while($res = mysql_fetch_assoc($e)){	
						$sudah+=$res['sudah'];
						$belum+=$res['belum'];
						$out.= '<tr>
									<td>'.$nox.'. '.$res['tingkat'].'</td>
									<td align="center">'.$res['sudah'].'</td>
									<td align="center">'.$res['belum'].'</td>
									<td align="center">'.(intval($res['sudah'])+intval($res['belum'])).'</td>
								</tr>';
						$nox++;
					}$total=$belum+$sudah;
					$out.='<tr class="bg-lightBlue fg-white">
						<td align="center">Total</td>
						<td align="center">'.$sudah.'</td>
						<td align="center">'.$belum.'</td>
						<td align="center">'.$total.'</td>
					</tr>';
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan=9 ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				// pr($out);
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s = $tb.' set 	golongan	= "'.filter($_POST['golonganTB']).'",
								keterangan 	= "'.filter($_POST['keteranganTB']).'"';
				if(isset($_POST['replid'])){
					$s2 = 'UPDATE '.$s.' WHERE replid='.$_POST['replid'];
				}else{
					$n  = mysql_num_rows(mysql_query('SELECT * from '.$tb));
					$s2 = 'INSERT INTO '.$s.', urutan='.($n+1);
				}

				$e2   = mysql_query($s2);
				$stat =!$e2?'gagal menyimpan':'sukses';
				$out  = json_encode(array('status'=>$stat));
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
				$s 		= ' SELECT *
							from '.$tb.' 
							WHERE replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'golongan'   =>$r['golongan'],
							'keterangan' =>$r['keterangan'],
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
				}$out  = json_encode(array('status'=>$stat));
				//var_dump($stat);exit();
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbtingkat -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where'.$mnu.'='.$_POST[$mnu];
					}
				}
				
				$s	= ' SELECT * 
						from '.$tb.'
						'.$w.'		
						ORDER  BY 
							urutan asc';
				// var_dump($s);exit();
				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar = $dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error');
				}else{
					if($n==0){ // kosong 
						$ar = array('status'=>'kosong');
					}else{ // ada data
						if(!isset($_POST['replid'])){
							while ($r=mysql_fetch_assoc($e)) {
								$dt[]=$r;
							}
						}else{
							$dt[]=mysql_fetch_assoc($e);
						}
					}$ar = array('status'=>'sukses',$mnu=>$dt);
				}$out=json_encode($ar);
			break;
			// cmbtingkat -----------------------------------------------------------------
			// urutan -----------------------------------------------------------------
			case 'urutan':
				// 1 = asal
				// 2 = tujuan
				$_1 = mysql_fetch_assoc(mysql_query('SELECT urutan from '.$tb.' WHERE replid='.$_POST['replid1']));
				$_2 = mysql_fetch_assoc(mysql_query('SELECT replid from '.$tb.' WHERE urutan='.$_POST['urutan2']));
				$s1		= ' UPDATE '.$tb.' 
							SET urutan = '.$_POST['urutan2'].'  
							WHERE 
								replid='.$_POST['replid1'];
				$s2		= ' UPDATE '.$tb.' 
							SET urutan = '.$_1['urutan'].'  
							WHERE 
								replid='.$_2['replid'];
				// var_dump($s1);exit();
				$e1 	= mysql_query($s1);
				if(!$e1){
					$stat='gagal ubah urutan semula ';
				}else{
					$e2 = mysql_query($s2);
					if(!$e2)
						$stat = 'gagal ubah urutan kedua';
					else
						$stat= 'sukses';
				}
				$out 	= json_encode(array(
							'status'  =>$stat,
						));
			break;
			// urutan ------			


		}
	}
	echo $out;
?>