<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'detailbiaya';
	$tb  = 'psb_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$subtingkat      = isset($_POST['subtingkatS'])?$_POST['subtingkatS']:'';
				$detailgelombang = isset($_POST['detailgelombangS'])?$_POST['detailgelombangS']:'';

				$s1  = 'SELECT * FROM psb_golongan ';
				$e1  = mysql_query($s1);
				$n1  = mysql_num_rows($e1);
				$out='';$nox=1;
				if($n1<=0) $out.= '<tr align="center"><td  colspan="7" ><span style="color:red;text-align:center;"> ... data tidak ditemukan...</span></td></tr>';
				else{
					while($r1 = mysql_fetch_assoc($e1)){	
						$out.='<tr>
							<td>'.$nox.'. '.$r1['golongan'].'<br> 
								<sup class="fg-orange">('.$r1['keterangan'].')</sup>
							</td>';
						$s2 = 'SELECT
									db.replid,
									db.nominal,
									b.biaya
								FROM
									'.$tb.' db JOIN psb_biaya b on b.replid = db.biaya
								WHERE
									db.golongan = '.$r1['replid'].'
									AND db.subtingkat = '.$subtingkat.'
									AND db.detailgelombang = '.$detailgelombang.'
								ORDER BY
									b.biaya asc';
									// pr($s2);
						$e2= mysql_query($s2);
						while ($r2=mysql_fetch_assoc($e2)) {
							if(!isAksi('detailbiaya','u')){
								$field=setuang($r2['nominal']);
							}else{
								$field='<div class="input-control text" >
											<input data-hint="'.$r2['biaya'].'" class="text-right" value="Rp. '.number_format($r2['nominal']).'" 
											onclick="inputuang(this);" onfocus="inputuang(this);" type="text" name="nominalTB['.$r2['replid'].']">
										</div>';
									// <a onclick="viewFR('.$r2['replid'].');" class="button fg-white bg-blue" href="#" data-hint="rekening">
									// 	<i class=" icon-cc-nc"></i>
									// </a>
							}$out.='<td align="right">'.$field.'</td>';
						}$out.='</tr>';
						$nox++;
					}
				}
				// vd($sss);
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$stat2= true;
				foreach ($_POST['nominalTB'] as $i => $v) {
					$s = 'UPDATE '.$tb.' set nominal = '.filter(getuang($v)).' WHERE replid ='.$i;
					$e     = mysql_query($s);
					$stat2 = $e?true:false;
				}$stat = $stat2?'sukses':'gagal';
				$out = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 	= 'SELECT 
							db.replid,
							st.subtingkat,
							gol.golongan,
							g.gelombang,
							t.tingkat,
							concat(ta.tahunajaran," - ",ta.tahunajaran+1)tahunajaran,
							d.nama
						from 
							psb_detailbiaya db 
							JOIN psb_detailgelombang dg on dg.replid = db.detailgelombang
							JOIN psb_gelombang g on g.replid = dg.gelombang
							JOIN psb_golongan gol on gol.replid = db.golongan
							JOIN aka_subtingkat st on st.replid = db.subtingkat
							JOIN aka_tingkat t on t.replid = st.tingkat
							JOIN aka_tahunajaran ta on ta.replid = dg.tahunajaran
							JOIN departemen d on d.replid = dg.departemen
						WHERE 
							db.replid ='.$_POST['replid'];
				// pr($s);
				$e    = mysql_query($s);
				$r    = mysql_fetch_assoc($e);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array(
							'status'      =>$stat,
							'departemen'  =>$r['departemen'],
							'tahunajaran' =>$r['tahunajaran'],
							'tingkat'     =>$r['tingkat'],
							'subtingkat'  =>$r['subtingkat'],
							'golongan'    =>$r['golongan'],
						));
			break;
			// ambiledit -----------------------------------------------------------------

		}
	}echo $out;
?>