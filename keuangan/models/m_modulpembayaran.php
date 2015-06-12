<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/keu_func.php';
	require_once '../../konfigurasi/models/keu_func.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	$mnu  = 'modulpembayaran';
	$tb   = 'keu_'.$mnu;
	$mnu2 = 'detilrekening';
	$tb2  = 'keu_'.$mnu2;

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
			$page       = $_GET['page']; // get the requested page
			$limit      = $_GET['rows']; // get how many rows we want to have into the grid
			$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
			$sord       = $_GET['sord']; // get the direction
			$searchTerm = $_GET['searchTerm'];

			if(!$sidx) 
				$sidx =1;

			$ss='SELECT dr.kode,dr.nama,dr.replid
				FROM keu_detilrekening dr 
					LEFT JOIN keu_kategorirekening kr on kr.replid = dr.kategorirekening
				WHERE 
					'.((isset($_GET['nama']) AND $_GET['nama']=='piutang')?' dr.nama LIKE "%piutang%" AND':' kr.nama="'.$_GET['subaksi'].'"  AND ').'
					(dr.kode LIKE "%'.$searchTerm.'%" OR dr.nama LIKE "%'.$searchTerm.'%")';
			// print_r($ss);exit();
			$result = mysql_query($ss) or die(mysql_error());
			$row    = mysql_fetch_array($result,MYSQL_ASSOC);
			$count  = mysql_num_rows($result);

			if( $count >0 ) {
				$total_pages = ceil($count/$limit);
			} else {
				$total_pages = 0;
			}
			if ($page > $total_pages) $page=$total_pages;
			$start 	= $limit*$page - $limit; // do not put $limit*($page - 1)
			if($total_pages!=0) {
				$ss.='ORDER BY '.$sidx.' '.$sord.' LIMIT '.$start.','.$limit;
			}else {
				$ss.='ORDER BY '.$sidx.' '.$sord;
			}

			$result = mysql_query($ss) or die("Couldn t execute query.".mysql_error());
			$rows 	= array();
			while($row = mysql_fetch_assoc($result)) {
				$kode = (isset($_GET['subaksi']) and $_GET['subaksi']=='klasifikasi')?$row['kode']:'';
				$rows[]= array(
					'replid' =>$row['replid'], 
					'nama'   =>$row['nama'], 
					'kode'	 =>$row['kode']
				);
			}$response=array(
				'page'    =>$page,
				'total'   =>$total_pages,
				'records' =>$count,
				'rows'    =>$rows,
			);$out=json_encode($response);
		}else
			$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			// -----------------------------------------------------------------
			case 'tampil':
				$katmodulpembayaran = (isset($_POST['katmodulpembayaranS']) AND $_POST['katmodulpembayaranS']!='')?'m.katmodulpembayaran ='.$_POST['katmodulpembayaranS'].' AND ':'';
				$angkatan           = isset($_POST['angkatanS'])?filter($_POST['angkatanS']):'';
				$nama               = isset($_POST['namaS'])?filter($_POST['namaS']):'';
				// $nominal            = isset($_POST['nominalS'])?filter($_POST['nominalS']):'';
				$keterangan         = isset($_POST['keteranganS'])?filter($_POST['keteranganS']):'';
				
				// m.nominal
				$sql = 'SELECT 
							m.replid,
							m.nama,
							m.keterangan,
							m.rek1,
							m.rek2,
							m.rek3
						FROM '.$tb.' m 
							left join keu_katmodulpembayaran k on k.replid = m.katmodulpembayaran
						WHERE 
							'.$katmodulpembayaran.'
							m.angkatan = '.$angkatan.' and
							m.nama like "%'.$nama.'%" and
							m.keterangan like "%'.$keterangan.'%" 
						ORDER BY 
							m.nama asc';
				// var_dump($sql);exit();	
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
					while($res = mysql_fetch_assoc($result)){
						$btn ='<td>
									<button data-hint="ubah"  class="button" onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus"  class="button" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$rekening='';
						if($res['rek1']!=0){
							$kode = keuField(array('kode'),$tb2,$res['rek1']);
							$nama = keuField(array('nama'),$tb2,$res['rek1']);
							$rekening.= '<b> Kas :</b> ['.$kode[0].'] '.$nama[0].'<br>'; 
						}if($res['rek2']!=0){
							$kode = keuField(array('kode'),$tb2,$res['rek2']);
							$nama = keuField(array('nama'),$tb2,$res['rek2']);
							$rekening.= '<b> Pendapatan :</b> ['.$kode[0].'] '.$nama[0].'<br>'; 
						}if($res['rek3']!=0){
							$kode = keuField(array('kode'),$tb2,$res['rek3']);
							$nama = keuField(array('nama'),$tb2,$res['rek3']);
							$rekening.= '<b> Piutang :</b> ['.$kode[0].'] '.$nama[0].'<br>'; 
						}
						
						$out.= '<tr>
									<td>'.$res['nama'].'</td>
									<td>'.$rekening.'</td>
									<td>'.$res['keterangan'].'</td>
									'.$btn.'
								</tr>';
								// <td align="right">Rp. '.number_format($res['nominal']).'</td>
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
				$s 	  = $tb.' set 	katmodulpembayaran = "'.$_POST['katmodulpembayaranTB'].'",
									angkatan           = "'.$_POST['angkatanH'].'",
									nama               = "'.filter($_POST['namaTB']).'",
									rek1               = "'.filter($_POST['rek1H']).'",
									rek2               = "'.filter($_POST['rek2H']).'",
									rek3               = "'.filter($_POST['rek3H']).'",
									keterangan         = "'.filter($_POST['keteranganTB']).'"';
									// cicilan            = "'.getuang($_POST['cicilanTB']).'",
									// diskon             = "'.getuang($_POST['diskonTB']).'",
									// biayaadmin         = "'.getuang($_POST['biayaadminTB']).'",
									// nominal            = "'.getuang($_POST['nominalTB']).'",

				$s2   = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e    = mysql_query($s2);
				$stat = ($e)?'sukses':'gagal_'.print_r($s2);
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
							// m.nominal,
				$s = 'SELECT 
							m.katmodulpembayaran,
							m.nama,
							m.keterangan,
							m.rek1,
							m.rek2,
							m.rek3,
							m.cicilan,
							m.diskon,
							m.biayaadmin
						FROM '.$tb.' m 
							left join keu_katmodulpembayaran k on k.replid = m.katmodulpembayaran
						WHERE 
							m.replid='.$_POST['replid'];
				$e   = mysql_query($s);
				// print_r($s);exit();
				$r   = mysql_fetch_assoc($e);
				$out = json_encode(array(
							'katmodulpembayaran' =>$r['katmodulpembayaran'],
							'nama'               =>$r['nama'],
							'keterangan'         =>$r['keterangan'],
							'idrek1'             =>$r['rek1'],
							'idrek2'             =>$r['rek2'],
							'idrek3'             =>$r['rek3'],
							'rek1'               =>keuField(array('nama'),$tb2,$r['rek1']),
							'rek2'               =>keuField(array('nama'),$tb2,$r['rek2']),
							'rek3'               =>keuField(array('nama'),$tb2,$r['rek3']),
							'cicilan'            =>$r['cicilan'],
							'diskon'             =>$r['diskon'],
							'biayaadmin'         =>$r['biayaadmin'],
						));
							// 'nominal'            =>$r['nominal'],
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