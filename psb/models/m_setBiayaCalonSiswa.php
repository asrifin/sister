<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'setbiaya';
	$tb  = 'psb_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
		// $out=['status'=>'invalid_no_post'];		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$kelompok  = isset($_POST['kelompokS'])?filter(trim($_POST['kelompokS'])):'';
				$sql ='SELECT
							k.*,(
								SELECT count(*)
								FROM psb_golongan
							) jumgol
						FROM 
							psb_setbiaya b
							LEFT JOIN psb_kriteria k ON k.replid = b.krit
						WHERE
							b.kel = '.$kelompok.'
						GROUP by
							k.replid';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = 16;//jumlah data per halaman
				$aksi    = 'tampil';
				$subaksi = '';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result  =$obj->result;

				#ada data
				$jum = mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$out.= '<tr><td valign="middle" rowspan="'.($res['jumgol']+1).'">'.$nox.'. '.$res['kriteria'].'</td>';
						$sql2= 'SELECT 
									ps.replid, 
									ps.daftar, 
									ps.spp, 
									ps.nilai dpp, 
									ps.joiningf,	
									g.golongan, 
									g.keterangan 
								FROM 
									psb_setbiaya ps
									LEFT JOIN psb_kriteria pk ON pk.replid = ps.krit
									LEFT JOIN psb_golongan g ON g.replid = ps.gol
								WHERE
									pk.replid = '.$res['replid'].'
								GROUP by
									ps.gol';
						// print_r($sql2);exit();

						$qry2 = mysql_query($sql2);
						$num  = mysql_num_rows($qry2);

						while ($r2=mysql_fetch_assoc($qry2)) {
							$out.= '<tr>
										<td>'.$r2['golongan'].' ('.$r2['golongan'].')<input name="biaya['.$r2['replid'].']" type="hidden"></td> 
										<td align="right"><input value="Rp. '.number_format($r2['daftar']).'"   onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="daftarTB_'.$r2['replid'].'"></td> 
										<td align="right"><input value="Rp. '.number_format($r2['dpp']).'"   onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="dppTB_'.$r2['replid'].'"></td> 
										<td align="right"><input value="Rp. '.number_format($r2['spp']).'"   onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="sppTB_'.$r2['replid'].'"></td> 
										<td align="right"><input value="Rp. '.number_format($r2['joiningf']).'"   onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="joiningfTB_'.$r2['replid'].'"></td> 
									</tr>';
						}
						$out.= '</tr>';
						$nox++;
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan=9 ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				// print_r($_POST['biaya']);exit();
				$stat2= true;
				foreach ($_POST['biaya'] as $i => $v) {
					$s = 'UPDATE '.$tb.' set 	daftar 	 = '.filter(getuang($_POST['daftarTB_'.$i])).',
												spp      = '.filter(getuang($_POST['sppTB_'.$i])).',
												joiningf = '.filter(getuang($_POST['joiningfTB_'.$i])).',
												nilai    = '.filter(getuang($_POST['dppTB_'.$i])).'
										WHERE 	replid 	 = '.$i;
					// print_r($s);exit();
					$e     = mysql_query($s);
					$stat2 = $e?true:false;
				}$stat = $stat2?'sukses':'gagal';
				$out = json_encode(array('status'=>$stat));
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
							WHERE 
								replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'     =>$stat,
							'kelas'      =>$r['kelas'],
							'wali'       =>$r['wali'],
							'kapasitas'  =>$r['kapasitas'],
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

		}
	}echo $out;

	// ---------------------- //
	// -- created by epiii -- //
	// ---------------------- //
?>