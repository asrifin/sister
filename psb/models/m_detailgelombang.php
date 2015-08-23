<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/tglindo.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'detailgelombang';
	$tb  = 'psb_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$departemen  = isset($_POST['departemenS'])?$_POST['departemenS']:'';
				$tahunajaran = isset($_POST['tahunajaranS'])?$_POST['tahunajaranS']:'';
				$sql = 'SELECT 
							dg.replid,
							dg.tglmulai,
							dg.tglselesai,
							g.gelombang
						FROM  '.$tb.' dg
							JOIN psb_gelombang g on g.replid = dg.gelombang
						WHERE 
							dg.departemen ='.$departemen.' AND
							dg.tahunajaran ='.$tahunajaran.'
						ORDER BY 
							g.urutan asc';
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

				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					// $nox 	= $starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button '.(isAksi('detailgelombang','u')?'onclick="viewFR('.$res['replid'].');"':'disabled').' data-hint="ubah">
										<i class="icon-pencil on-left"></i>
									</button>';
						$out.= '<tr>
									<td align="center">'.$res['gelombang'].'</td>
									<td align="center">'.($res['tglmulai']=='0000-00-00'?'-':tgl_indo5($res['tglmulai'])).'</td>
									<td align="center">'.($res['tglselesai']=='0000-00-00'?'-':tgl_indo5($res['tglselesai'])).'</td>
									'.$btn.'
								</tr>';
						// $nox++;
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
				$s = $tb.' set 	tglmulai 	= "'.tgl_indo6($_POST['tglmulaiTB']).'",
								tglselesai 	= "'.tgl_indo6($_POST['tglselesaiTB']).'"';
				$s2	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				// pr($s2);
				$e2 = mysql_query($s2);
				if(!$e2){
					$stat = 'gagal menyimpan';
				}else{
					$stat = 'sukses';
				}$out  = json_encode(array('status'=>$stat));
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
								g.gelombang,
								dg.tahunajaran,
								dg.departemen,
								dg.tglmulai,
								dg.tglselesai
							from '.$tb.' dg 
								JOIN psb_gelombang g on g.replid = dg.gelombang
							WHERE dg.replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'      =>$stat,
							'gelombang'   =>$r['gelombang'],
							'departemen'  =>$r['departemen'],
							'tahunajaran' =>$r['tahunajaran'],
							'tglmulai'    =>($r['tglmulai']=='0000-00-00'?'-':tgl_indo5($r['tglmulai'])),
							'tglselesai'  =>($r['tglselesai']=='0000-00-00'?'-':tgl_indo5($r['tglselesai'])),
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// cmbdetailgelombang -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST['tahunajaran']) && isset($_POST['departemen'])){
						$w='where 	tahunajaran ='.$_POST['tahunajaran'].' AND
									departemen  ='.$_POST['departemen'];
					}
				}
				
				$s	= ' SELECT 
							dg.replid,
							g.gelombang,
							dg.tglmulai,
							dg.tglselesai
						from '.$tb.' dg 
							JOIN psb_gelombang g ON g.replid = dg.gelombang
						'.$w.'		
						ORDER BY 
							g.urutan ASC';
				// pr($s);
				$e  = mysql_query($s);
				$n  = mysql_num_rows($e);
				$ar =$dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error'.mysql_error());
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
			// cmbsubtingkat -----------------------------------------------------------------
		}
	}echo $out;

	// ---------------------- //
	// -- created by rovi -- //
	// ---------------------- //
?>