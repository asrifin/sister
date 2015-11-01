<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'detaildiskon';	
	$tb  = 'psb_'.$mnu;

	if(!isset($_POST)){
		$out=array('status'=>'invalid_no_post');		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$departemen  = isset($_POST['departemenS'])?$_POST['departemenS']:'';
				$tahunajaran = isset($_POST['tahunajaranS'])?$_POST['tahunajaranS']:'';
				$biaya       = isset($_POST['biayaS'])?$_POST['biayaS']:'';
				$nilai       = isset($_POST['nilaiS'])?$_POST['nilaiS']:'';
				$diskon      = isset($_POST['diskonS'])?$_POST['diskonS']:'';
				$keterangan  = isset($_POST['keteranganS'])?$_POST['keteranganS']:'';
				$nilai       = (isset($_POST['nilaiS']) && $_POST['nilaiS']!='')?' dd.nilai LIKE "%'.$_POST['nilaiS'].'%" AND':'';
				$isAktif     = (isset($_POST['isAktifS']) && $_POST['isAktifS']!='')?' dd.isAktif='.$_POST['isAktifS'].' AND':'';

				$sql = 'SELECT 
							dd.replid,
							dd.nilai,
							d.diskon,
							d.keterangan,
							dd.isAktif
						FROM  psb_diskon d
							LEFT JOIN '.$tb.' dd on dd.diskon = d.replid
						WHERE 
							'.$nilai.$isAktif.'
							d.diskon like "%'.$diskon.'%" and 
							d.keterangan like "%'.$keterangan.'%" and
							dd.tahunajaran ='.$tahunajaran.' and
							d.departemen ='.$departemen.' and
							d.biaya ='.$biaya.'
						ORDER BY 
							d.diskon asc,
							dd.nilai asc';
							// pr($sql);
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage = 10;
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
				$result  = $obj->result;

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
								 </td>';
						if($res['isAktif']==1){
							$clr  ='green';
							$hint ='aktif';
							$icon ='checkmark';
						}else{
							$clr  ='red';
							$hint ='tidak aktif';
							$icon ='blocked';
						}						 
							
						$out.= '<tr>
									<td><pre>'.$res['diskon'].'</pre></td>
									<td align="center">'.$res['nilai'].' %</td>
									<td><pre>'.$res['keterangan'].'</pre></td>
									<td align="center"><button onclick="aktifkan('.$res['replid'].');" data-hint="'.$hint.'" class="fg-white bg-'.$clr.'"><i class="icon-'.$icon.'"></i></button></td>
									'.$btn.'
								</tr>';
						$nox++;
					}
				}
				#kosong
				else
				{
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
				$s    = ' UPDATE '.$tb.' set nilai = '.filter($_POST['nilaiTB']).' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$s 		= 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array('status'=>$stat));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s = 'SELECT
						dd.nilai,
						d.departemen,
						d.diskon,
						d.keterangan,
						b.biaya,
						d.biaya idbiaya,
						dd.tahunajaran
					FROM
						psb_detaildiskon dd 
						JOIN psb_diskon d ON d.replid= dd.diskon
						JOIN psb_biaya b ON b.replid= d.biaya
					WHERE
						dd.replid ='.$_POST['replid'];
						 	// pr($s);
				$e    = mysql_query($s);
				$r    = mysql_fetch_assoc($e);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array(
							'departemen'  =>$r['departemen'],
							'tahunajaran' =>$r['tahunajaran'],
							'diskon'      =>$r['diskon'],
							'biaya'       =>$r['biaya'],
							'idbiaya'     =>$r['idbiaya'],
							'keterangan'  =>$r['keterangan'],
							'status'      =>$stat,
							'nilai'       =>$r['nilai'],
						));
			break;
			// ambiledit -----------------------------------------------------------------

			case 'cmb'.$mnu:
				$s=$j=$w='';
				if(isset($_POST['replid'])){
					$w.='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST['tahunajaran']) && isset($_POST['departemen']) ){
						$j.=' JOIN psb_diskon d on d.replid = dd.diskon';
						// $j.=(isset($_POST['idsiswabiaya']) && $_POST['idsiswabiaya']!=''?'JOIN psb_siswabiaya sb on sb.detailbiaya = db.replid':'');
						$w.=' WHERE dd.isAktif=1 AND d.departemen ='.$_POST['departemen'].' AND dd.tahunajaran ='.$_POST['tahunajaran'];
					}
				}				
				$s	= ' SELECT dd.replid,d.diskon,dd.nilai
						from '.$tb.' dd
						'.$j.$w.'		
						ORDER  BY d.diskon asc';
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
						}$ar = array('status'=>'sukses',$mnu=>$dt);
					}
				}$out=json_encode($ar);
			break;

			// aktifkan -----------------------------------------------------------------
			case 'aktifkan':
				if(!isset($_POST['id_'.$mnu])) $stat='no_id_'.$mnu.'_to_post';
				else{
					$akt = getField('isAktif',$tb,'replid',$_POST['id_'.$mnu]);
					$s   = 'UPDATE  '.$tb.' set isAktif='.($akt==1?0:1).' where replid ='.$_POST['id_'.$mnu];
					$e   = mysql_query($s);
					$stat=!$e?'gagal mengaktifkan':'sukses';
				}$out  = json_encode(array('status'=>$stat));
			break;
			// aktifkan -----------------------------------------------------------------

		}

	}
	echo $out;
	// echo json_encode($out);
?>