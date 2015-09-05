<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/tglindo.php';
	require_once '../../lib/pagination_class.php';
	$mnu = 'biaya';
	$tb  = 'psb_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$jenistagihan = isset($_POST['jenistagihanS']) && $_POST['jenistagihanS']!=''?' b.jenistagihan = '.$_POST['jenistagihanS'].' AND  ':'';
				$isDiskon     = isset($_POST['isDiskonS']) && $_POST['isDiskonS']!=''?' b.isDiskon = '.$_POST['isDiskonS'].' AND  ':'';
				$isAngsur     = isset($_POST['isAngsurS']) && $_POST['isAngsurS']!=''?' b.isAngsur = '.$_POST['isAngsurS'].' AND  ':'';
				$biaya        = isset($_POST['biayaS'])?$_POST['biayaS']:'';
				$keterangan   = isset($_POST['keteranganS'])?$_POST['keteranganS']:'';
				$sql = 'SELECT
							b.replid,
							b.biaya,
							case b.isAngsur
								when 0 then "Tunai"
								when 1 then "Angsur Reguler"
								else "Angsur Bebas"
							end as isAngsur,
							case b.isDiskon
								when 0 then "Tidak Ada"
								when 1 then "Diskon Reguler"
								when 2 then "Diskon Khusus"
								else "Diskon Reguler & Khusus Khusus"
							end as isDiskon,
							t.jenistagihan,
							b.keterangan
						FROM
							psb_biaya b
							LEFT JOIN psb_jenistagihan t ON t.replid = b.jenistagihan
						WHERE
							'.$isAngsur.$isDiskon.$jenistagihan.'
							b.keterangan LIKE "%'.$keterangan.'%" AND
							b.biaya LIKE "%'.$biaya.'%"';
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
									<button '.(isAksi('biaya','u')?'onclick="viewFR('.$res['replid'].');"':'disabled').' data-hint="ubah">
										<i class="icon-pencil on-left"></i>
									</button>
									<button '.(isAksi('biaya','d')?'onclick="del('.$res['replid'].');"':'disabled').' data-hint="hapus">
										<i class="icon-remove on-left"></i>
									</button>';
						$out.= '<tr>
									<td align="center">'.$res['biaya'].'</td>
									<td align="center">'.$res['isAngsur'].'</td>
									<td align="center">'.$res['isDiskon'].'</td>
									<td align="center">'.$res['jenistagihan'].'</td>
									<td align="justify">'.$res['keterangan'].'</td>
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
				$s = $tb.' set 	biaya        = "'.filter($_POST['biayaTB']).'",
								isAngsur     = '.filter($_POST['isAngsurTB']).',
								isDiskon     = '.filter($_POST['isDiskonTB']).',
								jenistagihan = '.filter($_POST['jenistagihanTB']).',
								keterangan   = "'.filter($_POST['keteranganTB']).'"';
				$s2	= isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				// pr($s2);
				$e2 = mysql_query($s2);
				$stat = !$e2?'gagal menyimpan':'sukses';
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
				$s = 'SELECT
							replid,
							biaya,
							isAngsur,
							isDiskon,
							jenistagihan,
							keterangan
						FROM
							psb_biaya
						WHERE replid='.$_POST['replid'];
				$e 		= mysql_query($s);
				// pr($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'       =>$stat,
							'biaya'        =>$r['biaya'],
							'isAngsur'     =>$r['isAngsur'],
							'jenistagihan' =>$r['jenistagihan'],
							'isDiskon'     =>$r['isDiskon'],
							'keterangan'     =>$r['keterangan'],
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// cmb biaya -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w=' where replid ='.$_POST['replid'];
				}elseif(isset($_POST['isDiskon'])){
					$w=' where isDiskon IN(1,3)'; // 1 = reguler 3 = reguler & khusus
				}

				$s	= ' SELECT * FROM '.$tb.$w.' ORDER BY biaya ASC';
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
			// cmb biaya -----------------------------------------------------------------
		}
	}echo $out;
?>