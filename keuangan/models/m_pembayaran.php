<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	// note :
	// ju : jurnal umum
	// in : pemasukkan
	// out : pengeluaran

	$mnu  = 'pembayaran';
	$mnu2 = 'rekening';
	$mnu3 = 'katalog';
	$mnu4 = 'barang';
	$mnu5 = 'jenis';
	
	$tb   = 'keu_'.$mnu;
	$tb2  = 'keu_'.$mnu2;
	$tb3  = 'keu_'.$mnu3;
	$tb4  = 'keu_'.$mnu4;
	$tb5  = 'keu_'.$mnu5;

	if(!isset($_POST['aksi'])){
		if(isset($_GET['aksi']) && $_GET['aksi']=='autocomp'){
				$page       = $_GET['page']; // get the requested page
				$limit      = $_GET['rows']; // get how many rows we want to have into the grid
				$sidx       = $_GET['sidx']; // get index row - i.e. user click to sort
				$sord       = $_GET['sord']; // get the direction
				$searchTerm = $_GET['searchTerm'];

				if(!$sidx) 
					$sidx =1;
				$ss='SELECT *
					FROM '.$tb2.' 
					WHERE	kode  LIKE "%'.$searchTerm.'%"
							OR nama LIKE "%'.$searchTerm.'%"';
				// print_r($ss);exit();
				$result = mysql_query($ss);
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
				// print_r($ss);exit();
				$result = mysql_query($ss) or die("Couldn t execute query.".mysql_error());
				$rows 	= array();
				while($row = mysql_fetch_assoc($result)) {
					$rows[]= array(
						'replid' =>$row['replid'],
						'kode'   =>$row['kode'],
						'nama'   =>$row['nama'],
					);
				}$response=array(
					'page'    =>$page,
					'total'   =>$total_pages,
					'records' =>$count,
					'rows'    =>$rows,
				);
			$out=json_encode($response);
		}else{
			$out=json_encode(array('status'=>'invalid_no_post'));
		}
	}else{
		switch ($_POST['aksi']) {
			// tampil ---------------------------------------------------------------------
			case 'tampil':
				switch ($_POST['subaksi']) {
					case 'pendaftaran':
						// $kelompok      = isset($_POST['kelompokS'])&& $_POST['kelompokS']!=''?' c.kelompok ='.$_POST['kelompokS'].' AND ':'';
						$kelompok      = isset($_POST['kelompokS'])?filter($_POST['kelompokS']):'';
						$nama          = isset($_POST['namaS'])?filter($_POST['namaS']):'';
						$daftar        = isset($_POST['daftarS'])?filter($_POST['daftarS']):'';
						$joiningf      = isset($_POST['joiningfS'])?filter($_POST['joiningfS']):'';
						$nopendaftaran = isset($_POST['nopendaftaranS'])?filter($_POST['nopendaftaranS']):'';
						$sql = 'SELECT
									c.replid,	
									c.nopendaftaran,
									c.nama,
									b.daftar,	
									b.joiningf,
									tbx.tanggal,
									IF(tbx.idpembayaran IS NULL,0,1)status
								FROM
									psb_calonsiswa c
									LEFT JOIN psb_setbiaya b on b.replid = c.setbiaya
									LEFT JOIN (
										SELECT
											p.replid idpembayaran,
											p.siswa,
											t.tanggal
										FROM
											keu_pembayaran p
										LEFT JOIN keu_modulpembayaran m ON m.replid = p.modul
										LEFT JOIN keu_katmodulpembayaran k ON k.replid = m.katmodulpembayaran
										LEFT JOIN keu_transaksi t ON t.pembayaran = p.replid
										WHERE
											k.nama = "pendaftaran"
									)tbx on tbx.siswa = c.replid
								WHERE
									c.kelompok='.$kelompok.' AND
									c.nama LIKE "%'.$nama.'%" AND
									b.daftar LIKE "%'.$daftar.'%" AND
									b.joiningf LIKE "%'.$joiningf.'%"';
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ 
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 10;
						$aksi    ='tampil';
						$subaksi ='pendaftaran';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								if($res['status']=='1'){ // lunas
									$clr  = 'success';
									$icon = 'checkmark';
									$hint = 'lunas';
									$func = '';
								}else{ // belum lunas
									$clr  = '';
									$icon = 'history';
									$hint = 'belum lunas';
									$func = 'onclick="pendaftaranFR('.$res['replid'].');"';
								}
								$btn ='<td align="center">
											<button data-hint="'.$hint.'" class="'.$clr.'"   '.$func.'>
												<i class="icon-'.$icon.'"></i>
											</button>
										 </td>';
							 	$out.= '<tr>
											<td>'.$res['nopendaftaran'].'</td>
											<td>'.$res['nama'].'</td>
											<td align="right">Rp. '.number_format($res['daftar']).'</td>
											<td align="right">Rp. '.number_format($res['joiningf']).'</td>
											<td  align="center">'.(($res['tanggal']=='0000-00-00' OR $res['tanggal']==null)?'-':tgl_indo5($res['tanggal'])).'</td>
											'.$btn.'
										</tr>';
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
					// pendaftaran 

					// spp 
					case 'spp':
						$kelas = isset($_POST['kelasS'])?filter(trim($_POST['kelasS'])):'';
						$nis   = isset($_POST['nisS'])?filter(trim($_POST['nisS'])):'';
						$nama  = isset($_POST['namaS'])?filter(trim($_POST['namaS'])):'';
						$biaya = isset($_POST['biayaS'])?filter(trim($_POST['biayaS'])):'';

						$sql       = 'SELECT
											s.nis,
											s.nama,
											p.lunas
										FROM
											aka_siswa_kelas sk
											LEFT JOIN aka_siswa s on s.replid = sk.siswa
											LEFT JOIN keu_pembayaran p on p.siswa= s.replid
											LEFT JOIN keu_modulpembayaran m on m.replid = p.modul
											LEFT JOIN keu_katmodulpembayaran k on k.replid = m.katmodulpembayaran
										WHERE	
											k.nama 		= "spp" and 
											sk.kelas 	='.$kelas;
						// print_r($sql);exit(); 		
						if(isset($_POST['starting'])){ //nilai awal halaman
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 5;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='spp';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$btn ='<td>
											<button data-hint="ubah"  class="button" onclick="juFR('.$res['replid'].');">
												<i class="icon-pencil on-left"></i>
											</button>
											<button data-hint="hapus"  class="button" onclick="grupDel('.$res['replid'].');">
												<i class="icon-remove on-left"></i>
										 </td>';
								 $out.= '<tr>
											<td>'.$res['nis'].'</td>
											<td>'.$res['nama'].'</td>
											<td>'.$res['lunas'].'</td>
											'.$btn.'
										</tr>';
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
					// spp 
				}
			break; 
			// tampil ---------------------------------------------------------------------

			// head info ------------------------------------------------------------------
			case 'headinfo':
				switch ($_POST['subaksi']) {
					case 'katalog':
						$s = 'SELECT 
								g.nama as grup,
								l.nama as lokasi,
								sum(b.harga)as totaset
							  FROM 
							  	'.$tb4.' b,
							  	'.$tb3.' k,
							  	'.$tb2.' l,
							  	'.$tb.' g
							  WHERE 
								g.replid  = '.$_POST['grup'].' and 
								b.katalog = k.replid and
								g.lokasi  = l.replid and
								g.replid  = k.grup';
						$q    = mysql_query($s);
						$stat = ($q)?'sukses':'gagal';
						$r    = mysql_fetch_assoc($q);
						$out  = json_encode(array(
									'status'  =>$stat,
									'grup'    =>$r['grup'],
									'lokasi'  =>$r['lokasi'],
									'totaset' =>number_format($r['totaset'])
								));
					break;

					case 'barang':
						$s = '	SELECT
									g.replid,
									g.nama as grup,(
										SELECT nama
										from sar_lokasi 
										where replid = g.lokasi
									)as lokasi,
									IFNULL(tbjum.totbarang,0)totbarang,
									tbjum.susut,
									tbjum.nama as katalog,
									tbjum.totaset,
									tbjum.photo2
								from 
									sar_grup g
									LEFT JOIN (
										SELECT 
											k.replid,
											k.grup,
											k.susut,
											k.nama,
											k.photo2,
											count(*)totbarang,
											sum(b.harga)totaset
										from 
											sar_katalog k,
											sar_barang b
										WHERE
											k.replid = b.katalog AND
											k.replid = '.$_POST['katalog'].'
									)tbjum on tbjum.grup = g.replid
								where 
									tbjum.replid= '.$_POST['katalog'];
						// var_dump($s);exit();
						$e = mysql_query($s) or die(mysql_error());
						$r = mysql_fetch_assoc($e);
						if(!$e){
							$stat='gagal';
						}else{
							$stat ='sukses';
							$dt   = array(
										'idkatalog' =>$r['replid'],
										'katalog'   =>$r['katalog'],
										'grup'      =>$r['grup'],
										'photo2'    =>$r['photo2'],
										'lokasi'    =>$r['lokasi'],
										'susut'     =>$r['susut'],
										'totbarang' =>$r['totbarang'],
										'totaset'   =>number_format($r['totaset'])
									);
						}
						$out  = json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));
					break;
				}
			break;
			// head info ------------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				// simpan pembayaran
				$s 	= 'INSERT INTO '.$tb.' set 	modul = '.$_POST['idmodulH'].',siswa = '.$_POST['idsiswaH'];
				$e  = mysql_query($s);
				$id = mysql_insert_id();
				if(!$e) $stat='gagal_insert_pembayaran';
				else{
					// simpan transaksi
					$nominal = getBiaya('pendaftaran',$_POST['idsiswaH']);
					$s2 = 'INSERT INTO keu_transaksi SET 	tahunbuku  ='.getTahunBuku('replid').',
															pembayaran ='.$id.',
															nominal    ='.$nominal.',
															nomer      ="'.$_POST['nomerTB'].'",
															tanggal    ="'.date('Y-m-d').'",
															uraian     ="'.$_POST['uraianTB'].'",
															rekkas     ='.$_POST['rekkasH'].',
															rekitem    ='.$_POST['rekitemH'];
					// print_r($s2);exit();
					$e2  = mysql_query($s2);
					$id2 = mysql_insert_id();
					if(!$e2) $stat='gagal_insert_transaksi';
					else{
						// simpan jurnal
						$s3 = 'INSERT INTO ke_jurnal SET transaksi ='.$id2.', rek ='.$_POST['rekkasH'].', debet ='.$nominal;
						$s4 = 'INSERT INTO ke_jurnal SET transaksi ='.$id2.', rek ='.$_POST['rekitemH'].', kredit ='.$nominal;
						$e3 = mysql_query($s3);
						$e4 = mysql_query($s4);
						$stat = ($e3 OR $e4)?'gagal_insert_jurnal':'sukses';
					}
				}$out = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			
			// delete ---------------------------------------------------------------------
			case 'hapus':
				switch ($_POST['subaksi']) {
					case 'grup':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
					break;

					case 'katalog':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb3.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb3.' WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
					break;

					case 'barang':
						$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb4.' where replid='.$_POST['replid']));
						$s    = 'DELETE from '.$tb4.' WHERE replid='.$_POST['replid'];
						// var_dump($s);exit();
						$e    = mysql_query($s);
						$stat = ($e)?'sukses':'gagal';
						$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['kode']));
					break;
				}
			break;
			// delete ---------------------------------------------------------------------

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				switch ($_POST['subaksi']) {
					case 'pendaftaran';
						// get angkatan by : siswa -> kelompok -> angkatan
						$s1 = 'SELECT
									p.angkatan,
									c.nopendaftaran,	
									c.replid idsiswa,	
									c.nama siswa,	
									b.daftar nominal
								FROM
									psb_calonsiswa c 
									LEFT JOIN psb_setbiaya b on b.replid = c.setbiaya
									LEFT JOIN psb_kelompok k on k.replid = c.kelompok
									LEFT JOIN psb_proses p on p.replid = k.proses
								WHERE
									c.replid ='.$_POST['replid']; 
						$e1 = mysql_query($s1);
						$r1 = mysql_fetch_assoc($e1);

						// get data : modul pembayaran (untuk form) 
						$s2   = 'SELECT
									m.replid,
									m.rek1,	
									m.rek2,	
									m.rek3,	
									m.nama modul,
									m.replid idmodul
								FROM
									keu_modulpembayaran m
									LEFT JOIN keu_katmodulpembayaran k ON k.replid = m.katmodulpembayaran
								WHERE
									m.angkatan = '.$r1['angkatan'].' AND 
									k.nama = "pendaftaran"';
							// print_r($s2);exit();
						$e2   = mysql_query($s2);
						$r2   = mysql_fetch_assoc($e2);
						$stat = ($e2)?'sukses':'gagal';
						$out  = json_encode(array(
									'status' =>$stat,
									'datax'  =>array(
										//data siswa 
										'nopendaftaran' =>$r1['nopendaftaran'],
										'idsiswa'       =>$r1['idsiswa'],
										'siswa'         =>$r1['siswa'],
										//data pembayaran
										'nomer'         =>getNoTrans('in_calonsiswa'),
										'tanggal'       =>tgl_indo5(date('Y-m-d')),
										'rekkas'        =>$r2['rek1'],
										'rekitem'       =>$r2['rek2'],
										'rek1'          =>getRekening($r2['rek1']),
										'rek2'          =>getRekening($r2['rek2']),
										'rek3'          =>getRekening($r2['rek3']),
										'modul'         =>$r2['modul'],
										'idmodul'       =>$r2['idmodul'],
										'nominal'       =>$r1['nominal']
								)));					
					break;

					case 'katalog';
						$s = '	SELECT
									k.kode,
									k.nama,
									k.jenis,
									k.photo2,
									k.susut,
									k.keterangan,
									l.nama as lokasi, 
									g.nama as grup
								FROM 
									'.$tb3.' k,
									 '.$tb2.' l,
									 '.$tb.' g
								WHERE 
									g.replid = k.grup and 
									l.replid = g.lokasi and 
									k.replid ='.$_POST['replid'];
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						if(!$e){
							$stat ='gagal';
						}else{
							$stat ='sukses';
							$dt   =array(
										'kode'       =>$r['kode'],
										'nama'       =>$r['nama'],
										'susut'      =>$r['susut'],
										'lokasi'     =>$r['lokasi'],
										'grup'       =>$r['grup'],
										'photo2'     =>$r['photo2'],
										'jenis'      =>$r['jenis'],
										'keterangan' =>$r['keterangan']
									);						
						}$out 	= json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));					
					break;

					case 'barang';
						$s ='SELECT
								b.tempat,
								LPAD(b.urut,5,0) as barkode,(
									SELECT 
										CONCAT(ll.kode,"/",gg.kode,"/",tt.kode,"/",kk.kode,"/",LPAD(b.urut,5,0))
									from 
										sar_katalog kk,
										sar_grup gg,
										sar_tempat tt,
										sar_lokasi ll
									where 
										kk.replid = b.katalog AND
										kk.grup   = gg.replid AND
										b.tempat  = tt.replid AND
										tt.lokasi = ll.replid
								)as kode,
								b.harga,
								b.urut,
								b.kondisi,
								b.sumber,
								b.keterangan
							FROM
								sar_barang b, sar_kondisi k
							WHERE
								b.kondisi = k.replid and
								b.replid  = '.$_POST['replid'];
						// print_r($s);exit();
						$e 		= mysql_query($s);
						$r 		= mysql_fetch_assoc($e);
						$stat 	= ($e)?'sukses':'gagal';
						if(!$e){
							$stat ='gagal';
						}else{
							$stat ='sukses';
							$dt   =array(
										'tempat'     =>$r['tempat'],
										'barkode'    =>$r['barkode'],
										'urut'       =>$r['urut'],
										'kode'       =>$r['kode'],
										'harga'      =>$r['harga'],
										'kondisi'    =>$r['kondisi'],
										'sumber'     =>$r['sumber'],
										'keterangan' =>$r['keterangan']
									);						
						}$out 	= json_encode(array(
									'status' =>$stat,
									'data'   =>$dt
								));					
					break;
				}
			break;
			// ambiledit ------------------------------------------------------------------

			// generate barcode -----------------------------------------------------------
			case 'kodegenerate':
				$s='SELECT
						tb1.lokasi,
						tb1.grup,
						tb1.tempat,
						tb1.katalog,
						tb2.barang,
						LPAD(tb2.barang,5,0)barkode	
					FROM (
						SELECT
							l.kode lokasi,
							g.kode grup,
							t.kode tempat,
							k.kode katalog
						FROM
							sar_lokasi l 
							JOIN sar_grup g on g.lokasi = l.replid
							JOIN sar_katalog k on k.grup= g.replid
							JOIN sar_tempat t on t.lokasi = l.replid
						WHERE	
							t.replid = '.$_POST['tempat'].' 
							and k.replid = '.$_POST['katalog'].'
						)tb1,';

				if($_POST['replid']!=''){//edit
					$s.= '(SELECT urut AS barang FROM sar_barang WHERE replid='.$_POST['replid'].')tb2';
				}else{ //add 
					$s.= '(SELECT (MAX(urut) + 1) AS barang FROM sar_barang )tb2';
				}

				// print_r($s);exit();
				$e    = mysql_query($s);
				$r    = mysql_fetch_assoc($e);
				$stat = !$e?'gagal':'sukses';
				$out  = json_encode(array(
							'status' =>$stat,
							'data'   =>array(
										'urut'    =>$r['barang'],
										'lokasi'  =>$r['lokasi'],
										'grup'    =>$r['grup'],
										'tempat'  =>$r['tempat'],
										'katalog' =>$r['katalog'],
										'barang'  =>$r['barang'],
										'barkode' =>$r['barkode']
						)));
			break;
			// generate barcode -----------------------------------------------------------
			}
	}echo $out;

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
?>