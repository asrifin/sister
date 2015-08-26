<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'biaya';
	$tb  = 'psb_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$departemen      = isset($_POST['departemenS'])?$_POST['departemenS']:'';
				$detailgelombang = isset($_POST['detailgelombangS'])?$_POST['detailgelombangS']:'';
				$nGol            = getNumRows('golongan');
				$s1 = 'SELECT 
							t2.idtingkat,
							t2.tingkat,
							count(*)nSubt
						from (
								SELECT
									s.replid,	
									t.tingkat,
									t.replid idtingkat,	
									s.subtingkat
								FROM
									aka_tingkat t
									JOIN aka_subtingkat s ON s.tingkat = t.replid
									JOIN aka_kelas k ON k.subtingkat = s.replid
								WHERE
									k.departemen = '.$departemen.'
								GROUP BY
									s.replid
							)t2 
						GROUP BY 
							t2.idtingkat';
				$e1  = mysql_query($s1);
				$n1  = mysql_num_rows($e1);
				$nox = 1;
				$out ='';
				if($n1<=0) $out.= '<tr align="center"><td  colspan="7" ><span style="color:red;text-align:center;"> ... data tidak ditemukan...</span></td></tr>';
				else{
					while($r1 = mysql_fetch_assoc($e1)){	
						// $out.= '<tr class="bg-hover-'.($nox%2==0?'green':'red').'">
						$out.= '<tr data-hint-mode="2" data-hint-position="left"  data-hint="'.$r1['tingkat'].'" class="bg-hover-*">
									<td valign="middle" rowspan="'.((intval($r1['nSubt'])*$nGol)+ (intval($r1['nSubt'])+1)).'">
										'.$nox.'.'.$r1['tingkat'].'
									</td>';
						$s2 =' 	SELECT s.replid, s.subtingkat
								FROM aka_subtingkat s
								WHERE s.tingkat = '.$r1['idtingkat'];
						$eTing = mysql_query($s2);
						$nTing = mysql_num_rows($eTing);
						
						$e2    = mysql_query($s2);
						$n2    = mysql_num_rows($e2);
						if($n2>0){	
							while($r2 = mysql_fetch_assoc($e2)){	
								// $out.= '<tr class="bg-'.($nox%2==0?'green':'red').'">
											// <td data-hint="okokok" class="text-center" valign="middle" rowspan="'.(intval($nGol)+1).'">
								$out.= '<tr data-hint-mode="2" data-hint-position="botttom"  data-hint="'.$r1['tingkat'].'-'.$r2['subtingkat'].'">
											<td class="text-center" valign="middle" rowspan="'.(intval($nGol)+1).'">
												'.$r2['subtingkat'].'
											</td>
											';
								$s3 ='	SELECT
											b.replid,
											b.spp,
											b.formulir,
											b.joiningf,
											b.dpp,
											g.golongan,
											s.tingkat,
											g.keterangan
										FROM
											psb_golongan g
											JOIN psb_biaya b ON b.golongan = g.replid
											JOIN aka_subtingkat s ON s.replid = b.subtingkat
										WHERE
											b.subtingkat = '.$r2['replid'].'
											AND b.detailgelombang = '.$detailgelombang;
								$e3  = mysql_query($s3);
								while ($r3=mysql_fetch_assoc($e3)) {
									$out.= '<tr>
												<td>'.$r3['golongan'].'<br> <sup class="fg-orange">('.$r3['keterangan'].')</sup> <input name="golongan[]" value="'.$r3['replid'].'" type="hidden"></td> 
												<td align="right">'.(!isAksi('biaya','u')?setuang($r3['formulir']):'<div class="input-control text" ><input data-hint="Formulir" class="text-right" value="Rp. '.number_format($r3['formulir']).'"    onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="formulirTB_'.$r3['replid'].'"></div>').'</td> 
												<td align="right">'.(!isAksi('biaya','u')?setuang($r3['dpp']):'<div class="input-control text" ><input data-hint="dpp" class="text-right" value="Rp. '.number_format($r3['dpp']).'"    onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="dppTB_'.$r3['replid'].'"></div>').'</td> 
												<td align="right">'.(!isAksi('biaya','u')?setuang($r3['joiningf']):'<div class="input-control text" ><input data-hint="joiningf" class="text-right" value="Rp. '.number_format($r3['joiningf']).'"    onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="joiningfTB_'.$r3['replid'].'"></div>').'</td> 
												<td align="right">'.(!isAksi('biaya','u')?setuang($r3['spp']):'<div class="input-control text" ><input data-hint="spp" class="text-right" value="Rp. '.number_format($r3['spp']).'"    onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="sppTB_'.$r3['replid'].'"></div>').'</td> 
											</tr>';
								}
								$out.= '</tr>';
							}
						}else{ #kosong
							$out.= '<tr align="center">
									<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span></td></tr>';
						}
						$nox++;
						$out.='</tr>';
					}
				}
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$stat2= true;
				foreach ($_POST['golongan'] as $i => $v) {
					$s = 'UPDATE '.$tb.' set 	dpp      = '.filter(getuang($_POST['dppTB_'.$v])).',
												spp      = '.filter(getuang($_POST['sppTB_'.$v])).',
												joiningf = '.filter(getuang($_POST['joiningfTB_'.$v])).',
												formulir = '.filter(getuang($_POST['formulirTB_'.$v])).'
										WHERE 	replid 	 = '.$v;
					// print_r($s);exit();
					$e     = mysql_query($s);
					$stat2 = $e?true:false;
				}$stat = $stat2?'sukses':'gagal';
				$out = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
		}
	}echo $out;

	// ---------------------- //
	// -- created by epiii -- //
	// ---------------------- //
?>