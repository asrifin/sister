<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu= 'grupmenu';
	$tb = 'kon_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$modul       = isset($_POST['modulS']) && $_POST['modulS']!=''?' m.id_modul='.filter($_POST['modulS']).' AND ':'';
				$grupmodul   = isset($_POST['grupmodulS']) && $_POST['grupmodulS']!=''?' gmd.id_grupmodul='.filter($_POST['grupmodulS']).' AND ':'';
				$katgrupmenu = isset($_POST['katgrupmenuS']) && $_POST['katgrupmenuS']!=''?' kgm.id_katgrupmenu='.filter($_POST['katgrupmenuS']).' AND ':'';
				$grupmenu    = isset($_POST['grupmenuS'])?filter($_POST['grupmenuS']):'';
				$sql = 'SELECT
							gmn.id_grupmenu,
							gmn.grupmenu,
							gmd.grupmodul,
							m.modul,
							m.link,
							kgm.keterangan katgrupmenu
						FROM
							kon_grupmenu gmn
							LEFT JOIN kon_modul m ON m.id_modul = gmn.id_modul
							LEFT JOIN kon_grupmodul gmd ON gmd.id_grupmodul = m.id_grupmodul
							LEFT JOIN kon_katgrupmenu kgm ON kgm.id_katgrupmenu = gmn.id_katgrupmenu
						WHERE
							'.$grupmodul.$modul.$katgrupmenu.'
							gmn.grupmenu LIKE "%'.$grupmenu.'%"
						ORDER BY
							gmd.grupmodul ASC,
							m.modul ASC,
							gmn.grupmenu ASC
							'; 
				// pr($sql);
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}

				$recpage = 10;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  =$obj->result;

				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button  '.(isAksi('grupmenu','u')?'onclick="onclick="viewFR('.$res['id_grupmenu'].');"':'disabled').' data-hint="ubah"  class="button" >
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" '.(isAksi('grupmenu','d')?'onclick="del('.$res['id_grupmenu'].');"':'disabled').'  >
										<i class="icon-remove on-left"></i>
								 </td>';
						$out.= '<tr>
									<td>'.$res['grupmodul'].'</td>
									<td>'.$res['modul'].' ['.$res['link'].']</td>
									<td>'.$res['grupmenu'].'</td>
									<td>'.$res['katgrupmenu'].'</td>
									'.$btn.'
								</tr>';
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan="9" ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.= '<tr class="info"><td colspan="9">'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan="9">'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s = $tb.' set 	id_modul       = "'.filter($_POST['modulTB']).'",
								id_katgrupmenu = "'.filter($_POST['katgrupmenuTB']).'",
								grupmenu       = "'.filter($_POST['grupmenuTB']).'",
								size           = "'.filter($_POST['sizeTB']).'"';
				$s2   = isset($_POST['replid'])?'UPDATE '.$s.' WHERE id_'.$mnu.'='.$_POST['replid']:'INSERT INTO '.$s;
				// pr($s2);
				$e    = mysql_query($s2);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where id_'.$mnu.'='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE id_'.$mnu.'='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d[$mnu]));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s = '	SELECT *
					  	FROM '.$tb.' gm
					  		LEFT JOIN kon_modul m on m.id_modul = gm.id_modul
					 	WHERE gm.id_'.$mnu.'='.$_POST['id_'.$mnu];
					 	// pr($s);
				$e 		= mysql_query($s);
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'      =>$stat,
							'grupmodul'   =>$r['id_grupmodul'],
							'modul'       =>$r['id_modul'],
							'grupmenu'    =>$r['grupmenu'],
							'katgrupmenu' =>$r['id_katgrupmenu'],
							'size'        =>$r['size'],
						));
			break;
			// ambiledit ------			

			// cmb grup menu -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$s=$j=$w='';
				if(isset($_POST['id_level']) && isset($_POST['id_modul'])){
					$s=',t1.aktif';
					$j=' LEFT JOIN (
							SELECT 
								kg.id_katgrupmenu,
								lk.id_level,
								kg.keterangan,
								IF(la.id_levelaksi IS NULL,0,1)aktif
							from kon_levelkatgrupmenu lk
								LEFT JOIN kon_levelaksi la on la.id_levelkatgrupmenu = lk.id_levelkatgrupmenu
								LEFT JOIN kon_katgrupmenu kg on kg.id_katgrupmenu = lk.id_katgrupmenu
							where lk.id_level = '.$_POST['id_level'].'
							GROUP BY kg.id_katgrupmenu 
						)t1 on t1.id_katgrupmenu = kg.id_katgrupmenu
					';
					$w=' WHERE gm.id_modul = '.$_POST['id_modul'].' AND lk.id_level ='.$_POST['id_level'];
				} elseif(isset($_POST['id_modul'])){
					$w=' where id_modul ='.$_POST['id_modul'];
				}

				$s	= ' SELECT
							gm.id_grupmenu,
							gm.grupmenu,
							gm.id_modul,
							kg.keterangan,
							lk.id_level
							'.$s.'
						FROM
							kon_grupmenu gm
							LEFT JOIN kon_katgrupmenu kg ON kg.id_katgrupmenu = gm.id_katgrupmenu
							LEFT JOIN kon_levelkatgrupmenu lk ON lk.id_katgrupmenu = kg.id_katgrupmenu
						'.$j.$w.'
						
						GROUP BY 
							gm.id_grupmenu
						ORDER BY  
							kg.katgrupmenu ASC,
							gm.grupmenu ASC
							';
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
						}
						$ar = array('status'=>'sukses',$mnu=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbdepartemen -----------------------------------------------------------------

			// urutan -----------------------------------------------------------------
			case 'urutan':
				// 1 = asal
				// 2 = tujuan
				$_1 = mysql_fetch_assoc(mysql_query('SELECT urut from '.$tb.' WHERE replid='.$_POST['replid1']));
				$_2 = mysql_fetch_assoc(mysql_query('SELECT replid from '.$tb.' WHERE urut='.$_POST['urutan2']));
				$s1		= ' UPDATE '.$tb.' 
							SET urut = '.$_POST['urutan2'].'  
							WHERE 
								replid='.$_POST['replid1'];
				$s2		= ' UPDATE '.$tb.' 
							SET urut = '.$_1['urut'].'  
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
	}echo $out;

	// ---------------------- //
	// -- created by epiii -- //
	// ---------------------- //
?>