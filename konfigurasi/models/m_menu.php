<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu= 'menu';
	$tb = 'kon_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$modul     = isset($_POST['modulS']) && $_POST['modulS']!=''?' md.id_modul='.filter($_POST['modulS']).' AND ':'';
				$grupmodul = isset($_POST['grupmodulS']) && $_POST['grupmodulS']!=''?' gmd.id_grupmodul='.filter($_POST['grupmodulS']).' AND ':'';
				$grupmenu  = isset($_POST['grupmenuS']) && $_POST['grupmenuS']!=''?' gmn.id_grupmenu='.filter($_POST['grupmenuS']).' AND ':'';
				$warna     = isset($_POST['warnaS']) && $_POST['warnaS']!=''?' w.id_warna='.filter($_POST['warnaS']).' AND ':'';
				$icon      = isset($_POST['iconS']) && $_POST['iconS']!=''?' i.id_icon='.filter($_POST['iconS']).' AND ':'';
				
				$menu      = isset($_POST['menuS'])?filter($_POST['menuS']):'';
				$link      = isset($_POST['linkS'])?filter($_POST['linkS']):'';

				$sql = 'SELECT
							mn.id_menu,
							gmn.grupmenu,
							gmd.grupmodul,
							concat(md.modul," [",md.link,"]")modul,
							mn.menu,
							mn.link,
							mn.keterangan,
							w.warna,
							if(mn.size="","kecil","Besar")size,
							i.icon
						FROM
							kon_menu mn
							LEFT JOIN kon_grupmenu gmn ON gmn.id_grupmenu = mn.id_grupmenu
							LEFT JOIN kon_modul md ON md.id_modul = gmn.id_modul
							LEFT JOIN kon_grupmodul gmd ON gmd.id_grupmodul = md.id_grupmodul
							LEFT JOIN kon_warna w ON w.id_warna = mn.id_warna
							LEFT JOIN kon_icon i ON i.id_icon = mn.id_icon
						WHERE
							'.$grupmodul.$modul.$grupmenu.$warna.$icon.'
							mn.menu LIKE "%'.$menu.'%" AND
							mn.link LIKE "%'.$link.'%" 
						ORDER BY
							gmd.grupmodul ASC,
							md.modul ASC,
							gmn.grupmenu ASC,
							mn.menu ASC
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
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['id_menu'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['id_menu'].');">
										<i class="icon-remove on-left"></i>
								 </td>';
						$out.= '<tr>
									<td>'.$res['grupmodul'].'</td>
									<td>'.$res['modul'].'</td>
									<td>'.$res['grupmenu'].'</td>
									<td>'.$res['menu'].'</td>
									<td>'.$res['link'].'</td>
									<td><button class="bg-'.$res['warna'].'"></button> '.$res['warna'].'</td>
									<td><i class="icon-'.$res['icon'].'"></i> '.$res['icon'].'</td>
									<td>'.$res['size'].'</td>
									<td>'.$res['keterangan'].'</td>
									'.$btn.'
								</tr>';
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan="10" ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.= '<tr class="info"><td colspan="10">'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan="10">'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s = $tb.' set 	id_grupmenu   = "'.filter($_POST['grupmenuTB']).'",
								menu          = "'.filter($_POST['menuTB']).'",
								link          = "'.filter($_POST['linkTB']).'",
								id_warna      = "'.filter($_POST['warnaTB']).'",
								id_icon       = "'.filter($_POST['iconTB']).'",
								keterangan = "'.filter($_POST['keteranganTB']).'",
								size          = "'.filter($_POST['sizeTB']).'"';
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
				$s = '	SELECT
							mn.menu,
							mn.link,
							mn.size,
							mn.keterangan,
							mn.id_warna,
							mn.id_icon,
							mn.id_grupmenu,
							md.id_modul,
							md.id_grupmodul
						FROM
							kon_menu mn
							JOIN kon_grupmenu gmn on gmn.id_grupmenu = mn.id_grupmenu 
							JOIN kon_modul md on md.id_modul = gmn.id_modul
						WHERE 
							mn.id_'.$mnu.'='.$_POST['replid'];
					 	// pr($s);
				$e    = mysql_query($s);
				$r    = mysql_fetch_assoc($e);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array(
							'status'     =>$stat,
							'grupmodul'  =>$r['id_grupmodul'],
							'modul'      =>$r['id_modul'],
							'grupmenu'   =>$r['id_grupmenu'],
							'warna'      =>$r['id_warna'],
							'icon'       =>$r['id_icon'],
							'menu'       =>$r['menu'],
							'link'       =>$r['link'],
							'keterangan' =>$r['keterangan'],
							'size'       =>$r['size'],
						));
			break;
			// ambiledit ------			

			// cmbdepartemen -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST['id_grupmenu'])){
						$w='where id_grupmenu='.$_POST['id_grupmenu'];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY menu asc';
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