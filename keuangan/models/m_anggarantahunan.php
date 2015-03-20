<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu  = 'anggarantahunan';
	$tb   = 'keu_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$kategorianggaran = (isset($_POST['kategorianggaranS']) and $_POST['kategorianggaranS']!='')?' da.kategorianggaran ='.$_POST['kategorianggaranS'].' AND':'';
				$departemen       = trim($_POST['departemenS'])?filter($_POST['departemenS']):'';
				$tahunbuku        = trim($_POST['tahunbukuS'])?filter($_POST['tahunbukuS']):'';
				$nama             = trim($_POST['namaS'])?filter($_POST['namaS']):'';
				$rekening         = trim($_POST['rekeningS'])?filter($_POST['rekeningS']):'';

				$sql = 'SELECT 
							`at`.replid,
							da.nama,
							CONCAT(dr.kode," - ",dr.nama) rekening,
							`at`.nominal
						from 
							keu_anggarantahunan at 
							LEFT JOIN keu_detilanggaran da on da.replid = `at`.detilanggaran
							LEFT JOIN keu_detilrekening dr on dr.replid = da.rekening
						WHERE
							'.$kategorianggaran.' 
							`at`.tahunbuku = '.$tahunbuku.' AND
							da.departemen = '.$departemen.' AND
							da.nama LIKE "%'.$nama.'%" AND
							(
								dr.nama LIKE "%'.$rekening.'%" OR 
								dr.kode LIKE "%'.$rekening.'%" 
							)';
							// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				// $menu='tampil';	
				$recpage = 10;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result  =$obj->result;
				#ada data
				$jum	= mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					$curKat = '';
					$ec = mysql_query($sql);
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td align="center">
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
							 </td>';
						$out.= '<tr>
									<td class="text-right">'.$res['nama'].'</td>
									<td>'.$res['rekening'].'</td>
									<td class="text-right">Rp. '.number_format($res['nominal']).',-</td>
									'.$btn.'
								</tr>';
						$nox++;
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan=9><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.='<tr class="info"><td colspan="9">'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan="9">'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s    = $tb.' set 	nominal 	= "'.getuang(filter($_POST['nominalTB'])).'"'; 
				$s2   = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e    = mysql_query($s2);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s = 'SELECT 
							da.nama,
							CONCAT(dr.kode," - ",dr.nama) rekening,
							`at`.nominal,
							tb.nama tahunbuku,
							ka.nama kategorianggaran,
							da.nama detilanggaran,
							d.nama departemen
						from 
							keu_anggarantahunan at 
							LEFT JOIN keu_tahunbuku tb on tb.replid = at.tahunbuku
							LEFT JOIN keu_detilanggaran da on da.replid = `at`.detilanggaran
							LEFT JOIN departemen d on d.replid = da.departemen
							LEFT JOIN keu_kategorianggaran ka on ka.replid = da.kategorianggaran
							LEFT JOIN keu_detilrekening dr on dr.replid = da.rekening
						WHERE
							at.replid = '.$_POST['replid'];
				// print_r($s);exit();
				$e   = mysql_query($s);
				$stat= $e?'sukses':'gagal';
				$r   = mysql_fetch_assoc($e);
				$out = json_encode(array(
							'status'           =>$stat,
							'departemen'       =>$r['departemen'],
							'kategorianggaran' =>$r['kategorianggaran'],
							'detilanggaran'    =>$r['detilanggaran'],
							'tahunbuku'        =>$r['tahunbuku'],
							'nama'             =>$r['nama'],
							'rekening'         =>$r['rekening'],
							'nominal'          =>$r['nominal']
						));
			break;
			// ambiledit -----------------------------------------------------------------
			
			// cmbkategorirek -----------------------------------------------------------------
			case 'cmbkategorirek':
				$w='';
				if(isset($_POST['replid'])){
					$w='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w='where '.$mnu.'='.$_POST[$mnu];
					}
				}
				
				$s	= ' SELECT *
						from keu_kategorirek
							'.$w.'		
						ORDER  BY 
							kode asc ,
							nama asc';

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
						}$ar = array('status'=>'sukses','kategorirek'=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbdepartemen -----------------------------------------------------------------

		}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>