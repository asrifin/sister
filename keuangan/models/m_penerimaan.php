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
			// history bayar
			case 'histBayar':
				$s ='SELECT
						p.replid,
						p.cicilan,
						t.tanggal
					FROM
						keu_pembayaran p 
						LEFT JOIN keu_transaksi t on t.pembayaran = p.replid
						LEFT JOIN keu_modulpembayaran m on m.replid = p.modul
						LEFT JOIN keu_katmodulpembayaran k on k.replid = m.katmodulpembayaran
					WHERE
						k.nama = "'.$_POST['subaksi'].'" AND 
						p.siswa = '.$_POST['siswa'];
			// var_dump($s);exit();
				$e   = mysql_query($s);
				$arr = array();
				while ($r=mysql_fetch_assoc($e)){
					$arr[]=array(
						'replid'  =>$r['replid'],
						'cicilan' =>'Rp. '.number_format($r['cicilan']),
						'tanggal' =>tgl_indo5($r['tanggal'])
					);
				}$out = json_encode(array('status'=>$e?'sukses':'gagal','datax'=>$arr));
			break;

			// tampil ---------------------------------------------------------------------
			case 'tampil':
				switch ($_POST['subaksi']) {
					case 'formulir':
						$pre           = 'formulir';
						$kelompok      = isset($_POST['kelompokS'])?filter($_POST['kelompokS']):'';
						$nama          = isset($_POST[$pre.'_namaS'])?filter($_POST[$pre.'_namaS']):'';
						$nopendaftaran = isset($_POST[$pre.'_nopendaftaranS'])?filter($_POST[$pre.'_nopendaftaranS']):'';
						$status        = (isset($_POST[$pre.'_statusS']) AND $_POST[$pre.'_statusS']!='') ?' AND t2.statbayar="'.filter($_POST[$pre.'_statusS']).'"':'';
						$sql = 'SELECT
									t2.*
								FROM
									psb_calonsiswa c
									LEFT JOIN (
										SELECT 
											if(t1.cicilan=t1.daftar,"lunas","belum")statbayar,
											cs.replid,
											cs.nama, 
											t1.cicilan,
											t1.daftar,
											cs.kelompok,	 	
											cs.nopendaftaran	 	
										FROM psb_calonsiswa cs 
											LEFT JOIN (
												SELECT ss.replid,	p.cicilan,s.daftar
												from  psb_calonsiswa ss
													LEFT JOIN keu_pembayaran p on p.siswa= ss.replid
													LEFT JOIN keu_modulpembayaran m on m.replid = p.modul
													LEFT JOIN keu_katmodulpembayaran k on k.replid = m.katmodulpembayaran
													LEFT JOIN psb_setbiaya s on s.replid = ss.setbiaya
												WHERE k.nama = "formulir"
											)t1 on t1.replid = cs.replid 
									)t2 on t2.replid= c.replid
								WHERE
									c.kelompok = '.$kelompok.'
									AND c.nama LIKE "%'.$nama.'%"
									AND c.nopendaftaran LIKE "%'.$nopendaftaran.'%"
									'.$status;
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ 
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 10;
						$aksi    ='tampil';
						$subaksi = $pre;
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$biaya    = getBiaya($pre,$res['replid']);
								$terbayar = getTerbayar($pre,$res['replid']);
								$status   = getStatusBayar($pre,$res['replid']);
								// var_dump($status);exit();
								if($status=='lunas'){ // lunas
									$clr  = 'green';
									$icon = 'full';
									$hint = 'lunas';
									$func = 'onclick="pembayaranFR(\''.$pre.'\','.$res['replid'].');"';
								}else{ // belum lunas
									$clr  = 'red';
									$icon = 'empty';
									$hint = 'belum lunas';
									$func = 'onclick="pembayaranFR(\''.$pre.'\','.$res['replid'].');"';
								}
								$btn ='<td align="center">
											<button data-hint="'.$hint.'" class="fg-white bg-'.$clr.'"   '.$func.'>
												<i class="icon-battery-'.$icon.'"></i>
											</button>
									   </td>';
							 	$out.= '<tr>
											<td>'.$res['nopendaftaran'].'</td>
											<td>'.$res['nama'].'</td>
											<td align="right">Rp. '.number_format(getBiaya('daftar',$res['replid'])).'</td>
											<td  align="center">'.getTglTrans($res['replid'],'formulir').'</td>
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
					// formulir 
					
					// joiing fee
					case 'joiningf':
						// $joiningf      = isset($_POST[$pre.'_joiningfS'])?filter($_POST[$pre.'_joiningfS']):'';
						$pre = $_POST['subaksi'];
						$kelompok      = isset($_POST['kelompokS'])?filter($_POST['kelompokS']):'';
						$nama          = isset($_POST[$pre.'_namaS'])?filter($_POST[$pre.'_namaS']):'';
						$nopendaftaran = isset($_POST[$pre.'_nopendaftaranS'])?filter($_POST[$pre.'_nopendaftaranS']):'';
						$status        = (isset($_POST[$pre.'_statusS']) AND $_POST[$pre.'_statusS']!='') ?' AND t2.statbayar="'.filter($_POST[$pre.'_statusS']).'"':'';
						$sql = 'SELECT t2.*
								FROM psb_calonsiswa c
									LEFT JOIN (
										SELECT	
											case 
												when t1.cicilan = 0 OR  t1.cicilan is NULL  then "belum"
												when t1.cicilan = sb.joiningf then "lunas"
												when t1.cicilan < sb.joiningf then "kurang"
											end as statbayar,
											sb.joiningf,
											cs.replid,
											cs.nama,
											t1.cicilan,
											cs.kelompok,
											cs.nopendaftaran
										FROM
											psb_calonsiswa cs
											LEFT JOIN psb_setbiaya sb on sb.replid = cs.setbiaya
											LEFT JOIN (
												SELECT
													ss.replid,
													sum(p.cicilan)cicilan
												FROM
													psb_calonsiswa ss
													LEFT JOIN keu_pembayaran p ON p.siswa = ss.replid
													LEFT JOIN keu_modulpembayaran m ON m.replid = p.modul
													LEFT JOIN keu_katmodulpembayaran k ON k.replid = m.katmodulpembayaran
													LEFT JOIN psb_setbiaya s ON s.replid = ss.setbiaya
												WHERE
													k.nama = "joining fee"
												GROUP BY	
													ss.replid
											) t1 ON t1.replid = cs.replid
									) t2 ON t2.replid = c.replid
								WHERE
									c.kelompok = '.$kelompok.'
									AND c.nama LIKE "%'.$nama.'%"
									AND c.nopendaftaran LIKE "%'.$nopendaftaran.'%"
									'.$status;
						// print_r($sql);exit(); 	
						if(isset($_POST['starting'])){ 
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 10;
						$aksi    ='tampil';
						$subaksi = $pre;
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){
								$biaya    = getBiaya($pre,$res['replid']);
								$terbayar = getTerbayar('joining fee',$res['replid']);
								$status   = getStatusBayar('joining fee',$res['replid']);
								if($status=='belum'){ // belum
									$clr  = 'red';
									$icon = 'empty';
									$hint = 'belum bayar';
									$func = 'onclick="pembayaranFR(\'joiningf\','.$res['replid'].');"';
								}else{
								 	if($status=='lunas'){ // lunas
										$clr  = 'green';
										$icon = 'full';
										$hint = 'lunas';
										$func = 'onclick="pembayaranFR(\'joiningf\','.$res['replid'].');"';
									}else{ // kurang
										$clr  = 'yellow';
										$icon = 'half';
										$hint = 'kurang';
										$func = 'onclick="pembayaranFR(\'joiningf\','.$res['replid'].');"';
									}
								}
								$btn ='<td align="center">
											<button data-hint="'.$hint.'" class="fg-white bg-'.$clr.'"   '.$func.'>
												<i class="icon-battery-'.$icon.'"></i>
											</button>
									   </td>';
							 	$out.= '<tr>
											<td>'.$res['nopendaftaran'].'</td>
											<td>'.$res['nama'].'</td>
											<td align="right">Rp. '.number_format($biaya).'</td>
											<td align="right">Rp. '.number_format($biaya-$terbayar).'</td>
											<td  align="center">'.getTglTrans($res['replid'],'joining fee').'</td>
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
					// joining fee 

					// dpp
					case 'dpp':
						$pre = 'dpp_';
						$angkatan = isset($_POST['angkatanS'])?filter($_POST['angkatanS']):'';
						$nama     = isset($_POST['namaS'])?filter($_POST['namaS']):'';
						$nis      = isset($_POST['nisS'])?filter($_POST['nisS']):'';
						$status   = (isset($_POST[$pre.'statusS']) AND $_POST[$pre.'statusS']!='') ?' AND t2.statbayar="'.filter($_POST[$pre.'statusS']).'"':'';
						$sql = 'SELECT t2.*
								FROM psb_calonsiswa c
									LEFT JOIN (
										SELECT	
											case 
												when t1.cicilan = 0 OR t1.cicilan is NULL  then "belum"
												when t1.cicilan = sb.nilai-(cs.discsaudara+cs.disctb+ifnull(sb.nilai*dt.nilai/100,0))then "lunas"
												when t1.cicilan < sb.nilai-(cs.discsaudara+cs.disctb+ifnull(sb.nilai*dt.nilai/100,0))then "kurang"
											end as statbayar,
											sb.nilai-(cs.discsaudara+cs.disctb+ifnull(sb.nilai*dt.nilai/100,0))biayanet,
											cs.replid,
											cs.nama,
											t1.cicilan,
											p.angkatan,
											cs.nis
										FROM
											psb_calonsiswa cs
											LEFT JOIN psb_disctunai dt on dt.replid = cs.disctunai
											LEFT JOIN psb_setbiaya sb on sb.replid = cs.setbiaya
											LEFT JOIN (
												SELECT
													ss.replid,
													sum(p.cicilan)cicilan
												FROM
													psb_calonsiswa ss
													LEFT JOIN keu_pembayaran p ON p.siswa = ss.replid
													LEFT JOIN keu_modulpembayaran m ON m.replid = p.modul
													LEFT JOIN keu_katmodulpembayaran k ON k.replid = m.katmodulpembayaran
													LEFT JOIN psb_setbiaya s ON s.replid = ss.setbiaya
												WHERE
													k.nama = "dpp"
												GROUP BY	
													ss.replid
											) t1 ON t1.replid = cs.replid
											LEFT JOIN psb_kelompok k on k.replid = cs.kelompok
											LEFT JOIN psb_proses p on p.replid = k.proses
									) t2 ON t2.replid = c.replid
								WHERE
									t2.angkatan = '.$angkatan.' AND
									t2.nama LIKE "%'.$nama.'%" AND
									t2.nis LIKE "%'.$nis.'%" '.$status;
	                  	// var_dump($sql);exit();
						if(isset($_POST['starting'])){ 
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 10;
						$aksi    ='tampil';
						$subaksi ='dpp';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$status = getStatusBayar('dpp',$res['replid']);
								if($status=='belum'){ // belum
									$clr  = 'red';
									$icon = 'empty';
									$hint = 'belum bayar';
									$func = 'onclick="pembayaranFR(\'dpp\','.$res['replid'].');"';
								}else{
								 	if($status=='lunas'){ // lunas
										$clr  = 'green';
										$icon = 'full';
										$hint = 'lunas';
										$func = 'onclick="pembayaranFR(\'dpp\','.$res['replid'].');"';
									}else{ // kurang
										$clr  = 'yellow';
										$icon = 'half';
										$hint = 'kurang';
										$func = 'onclick="pembayaranFR(\'dpp\','.$res['replid'].');"';
									}
								}
								$btn ='<td align="center">
									<button data-hint="'.$hint.'" class="fg-white bg-'.$clr.'"   '.$func.'>
										<i class="icon-battery-'.$icon.'"></i>
									</button>
								</td>';
								$dpp      = getBiaya('dpp',$res['replid'])-getDiscTotal('dpp',$res['replid']);
								$kurangan = $dpp-getTerbayar('dpp',$res['replid']);
							 	$out.= '<tr>
									<td>'.$res['nis'].'</td>
									<td>'.$res['nama'].'</td>
									<td align="right">Rp. '.number_format($dpp).'</td>
									<td align="right">Rp. '.number_format($kurangan).'</td>
									<td  align="center">'.getTglTrans($res['replid'],'dpp').'</td>
									'.$btn.'
								</tr>';
							}
						}else{ #kosong
							$out.= '<tr align="center">
								<td  colspan=9 ><span style="color:red;text-align:center;">
									... data tidak ditemukan...</span>
								</td>
							</tr>';
						}
						#link paging
						$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
						$out.= '<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
					break;
					// dpp 

					// spp 
					case 'spp':
						$pre    = 'spp_';
						$status = (isset($_POST[$pre.'statusS']) AND $_POST[$pre.'statusS']!='') ?' AND t2.statbayar="'.filter($_POST[$pre.'statusS']).'"':'';
						$kelas  = isset($_POST[$pre.'kelasS'])?filter($_POST[$pre.'kelasS']):'';
						$nis    = isset($_POST[$pre.'nisS'])?filter($_POST[$pre.'nisS']):'';
						$nama   = isset($_POST[$pre.'namaS'])?filter($_POST[$pre.'namaS']):'';
						$sql    ='SELECT
									t2.*
								FROM
									psb_calonsiswa c
									LEFT JOIN aka_siswa_kelas a on a.siswa = c.replid
									LEFT JOIN (
										SELECT
											IF (t1.cicilan = t1.spp,"lunas","belum") statbayar,
											cs.replid,
											cs.nama,
											t1.cicilan,
											t1.spp,
											cs.kelompok,
											cs.nis
										FROM psb_calonsiswa cs
											LEFT JOIN (
												SELECT
													ss.replid,
													p.cicilan,
													s.spp
												FROM
													psb_calonsiswa ss
													LEFT JOIN keu_pembayaran p ON p.siswa = ss.replid
													LEFT JOIN keu_modulpembayaran m ON m.replid = p.modul
													LEFT JOIN keu_katmodulpembayaran k ON k.replid = m.katmodulpembayaran
													LEFT JOIN psb_setbiaya s ON s.replid = ss.setbiaya
												WHERE
													k.nama = "spp"
											) t1 ON t1.replid = cs.replid
									) t2 ON t2.replid = c.replid
								WHERE
									a.kelas = '.$kelas.'
									AND c.nama LIKE "%'.$nama.'%"
									AND c.nis LIKE "%'.$nis.'%" '.$status;
						// print_r($sql);exit(); 		
						if(isset($_POST['starting'])){
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 10;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='spp';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';
						$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$status = getStatusBayar('spp',$res['replid']);
								// var_dump($status);exit();
								if($status=='belum'){ // belum
									$clr  = 'red';
									$icon = 'empty';
									$hint = 'belum bayar';
									$func = 'onclick="pembayaranFR(\'spp\','.$res['replid'].');"';
								}else{
								 	if($status=='lunas'){ // lunas
										$clr  = 'green';
										$icon = 'full';
										$hint = 'lunas';
										$func = 'onclick="pembayaranFR(\'spp\','.$res['replid'].');"';
									}else{ // kurang
										$clr  = 'yellow';
										$icon = 'half';
										$hint = 'kurang';
										$func = 'onclick="pembayaranFR(\'spp\','.$res['replid'].');"';
									}
								}
								$btn ='<td align="center">
									<button data-hint="'.$hint.'" class="fg-white bg-'.$clr.'"   '.$func.'>
										<i class="icon-battery-'.$icon.'"></i>
									</button>
								</td>';
								
								$spp = 'Rp '.number_format(getBiaya('spp',$res['replid']));
								$out.= '<tr>
											<td>'.$res['nis'].'</td>
											<td>'.$res['nama'].'</td>
											<td align="right">'.$spp.'</td>
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
					 
					// semua 
					case 'semua':
						$pre           = 'semua_';
						$status        = (isset($_POST[$pre.'statusS']) AND $_POST[$pre.'statusS']!='') ?' AND t2.statbayar="'.filter($_POST[$pre.'statusS']).'"':'';
						$nama          = isset($_POST[$pre.'namaS'])?filter($_POST[$pre.'namaS']):'';
						$nopendaftaran = isset($_POST[$pre.'nopendaftaranS'])?filter($_POST[$pre.'nopendaftaranS']):'';
						$sql    ='SELECT
									c.replid,
									c.nopendaftaran,
									c.nama
								FROM
									psb_calonsiswa c
								WHERE
									c.nama LIKE "%'.$nama.'%"
									AND c.nopendaftaran LIKE "%'.$nopendaftaran.'%"';
						// print_r($sql);exit(); 		
						if(isset($_POST['starting'])){
							$starting=$_POST['starting'];
						}else{
							$starting=0;
						}

						$recpage = 10;//jumlah data per halaman
						$aksi    ='tampil';
						$subaksi ='semua';
						$obj     = new pagination_class($sql,$starting,$recpage,$aksi,$subaksi);
						$result  = $obj->result;

						#ada data
						$jum = mysql_num_rows($result);
						$out ='';
						$totaset=0;
						if($jum!=0){	
							$nox = $starting+1;
							while($res = mysql_fetch_assoc($result)){	
								$formulir = getStatusBayar('formulir',$res['replid']);
								$dpp      = getStatusBayar('dpp',$res['replid']);
								$spp      = getStatusBayar('spp',$res['replid']);
								$joiningf = getStatusBayar('joiningf',$res['replid']);
								// var_dump($formulir);exit();
								
								$out.= '<tr>
											<td>'.$res['nopendaftaran'].'</td>
											<td>'.$res['nama'].'</td>
											<td align="center"><button class="fg-white bg-'.($formulir=='lunas'?'green':($formulir=='kurang'?'orange':'red')).'" data-hint="'.$formulir.'"><!--<i class="icon-battery-full"></i></button>-->'.$formulir.'</td>
											<td align="center"><button class="fg-white bg-'.($dpp=='lunas'?'green':($dpp=='kurang'?'orange':'red')).'" data-hint="'.$dpp.'"><!--<i class="icon-battery-full"></i></button>-->'.$dpp.'</td>
											<td align="center"><button class="fg-white bg-'.($spp=='lunas'?'green':($spp=='kurang'?'orange':'red')).'" data-hint="'.$spp.'"><!--<i class="icon-battery-full"></i></button>-->'.$spp.'</td>
											<td align="center"><button class="fg-white bg-'.($joiningf=='lunas'?'green':($joiningf=='kurang'?'orange':'red')).'" data-hint="'.$joiningf.'"><!--<i class="icon-battery-full"></i></button>-->'.$joiningf.'</td>
										</tr>';
											// <td data-hint="'.$formulir.'" class="'.($formulir=='lunas'?'green':($formulir=='kurang'?'orange':'red')).'" align="center">
											// 	<i class="icon-battery-'.($formulir=='lunas'?'full':($formulir=='kurang'?'half':'empty')).'</i>
											// </td>
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
					// semua
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
				// 1. simpan pembayaran
				if($_POST['subaksi']=='dpp'){ // dpp 
					$nominal       = $_POST['akanbayarTB'] * getAngsurNom($_POST['subaksi'],$_POST['idsiswaH']);
					$detjenistrans = 'in_siswa';
				}elseif($_POST['subaksi']=='joiningf'){ //joining fee
					$nominal       = getuang($_POST['akanbayar2TB']);
					$detjenistrans = 'in_calonsiswa';
				}else{ // spp , formulir
					$nominal = getBiaya($_POST['subaksi'],$_POST['idsiswaH']); // pendaftaran & spp
					if($_POST['subaksi']=='spp'){ // spp
						$detjenistrans = 'in_siswa';
					}else{  // formulir
						$detjenistrans = 'in_calonsiswa';
					}
				}$s = 'INSERT INTO '.$tb.' set 	modul   = '.$_POST['idmodulH'].',
												cicilan = '.$nominal.',
												siswa   = '.$_POST['idsiswaH'];
				$e  = mysql_query($s);
				$id = mysql_insert_id();
				if(!$e) $stat='gagal_insert_pembayaran';
				else{
					// 2. simpan transaksi
					$s2 = 'INSERT INTO keu_transaksi SET 	tahunbuku  ='.getTahunBuku('replid').',
															pembayaran ='.$id.',
															nominal    ='.$nominal.',
															nomer      ="'.getNoTrans($_POST['subaksi']).'",
															tanggal    ="'.date('Y-m-d').'",
															uraian     ="'.$_POST['uraianTB'].'",
															rekkas     ='.$_POST['rekkasH'].',
															detjenistrans='.getDetJenisTrans('replid','kode',$detjenistrans).',
															rekitem    ='.$_POST['rekitemH'];
					$e2  = mysql_query($s2);
					$id2 = mysql_insert_id();
					if(!$e2) $stat='gagal_insert_transaksi';
					else{
						// 3. simpan jurnal
						$s3 = 'INSERT INTO keu_jurnal SET transaksi ='.$id2.', rek ='.$_POST['rekkasH'].', jenis = "d", nominal ='.$nominal;
						$s4 = 'INSERT INTO keu_jurnal SET transaksi ='.$id2.', rek ='.$_POST['rekitemH'].',jenis = "k", nominal ='.$nominal;
						// $s3 = 'INSERT INTO keu_jurnal SET transaksi ='.$id2.', rek ='.$_POST['rekkasH'].', debet ='.$nominal;
						// $s4 = 'INSERT INTO keu_jurnal SET transaksi ='.$id2.', rek ='.$_POST['rekitemH'].', kredit ='.$nominal;
						$e3 = mysql_query($s3);
						$e4 = mysql_query($s4);

						if(!$e3 OR !$e4) $stat = 'gagal_insert_jurnal';
						else{
							// 4. update saldo rekening
							$s5   = 'UPDATE keu_saldorekening SET nominal2 = nominal2 + '.$nominal.' WHERE rekening ='.$_POST['rekkasH'].' AND tahunbuku='.getTahunBuku('replid');
							$s6   = 'UPDATE keu_saldorekening SET nominal2 = nominal2 - '.$nominal.' WHERE rekening ='.$_POST['rekitemH'].' AND tahunbuku='.getTahunBuku('replid');
							// var_dump($s6);exit();
							$e5   = mysql_query($s5);
							$e6   = mysql_query($s6);
							$stat = ($e5 OR $e6)?'sukses':'gagal_update_saldorekening';
						}
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

			case 'cmbakanbayar':
				$out=json_encode(array(
					'status' =>(akanBayarOpt($_POST['subaksi'],$_POST['siswa'])==null?'gagal':'sukses'),
					'datax'  =>akanBayarOpt($_POST['subaksi'],$_POST['siswa'])
				));
			break;

			// ambiledit ------------------------------------------------------------------
			case 'ambiledit':
				switch ($_POST['subaksi']) {
					case 'formulir';
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
									k.nama = "formulir"';
						$e2       = mysql_query($s2);
						$r2       = mysql_fetch_assoc($e2);
						// print_r($r2);exit();
						$stat     = ($e2)?'sukses':'gagal';
						$biaya    = getBiaya('formulir',$_POST['replid']);
						$terbayar = getTerbayar('formulir',$_POST['replid']);
						$out      = json_encode(array(
									'status' =>$stat,
									'datax'  =>array(
										//data siswa 
										'nopendaftaran' =>$r1['nopendaftaran'],
										'idsiswa'       =>$r1['idsiswa'],
										'siswa'         =>$r1['siswa'],
										//data pembayaran
										// 'nomer'         =>getNoTrans('in_calonsiswa'),
										'nomer'         =>getNoTrans($_POST['subaksi']),
										'tanggal'       =>tgl_indo5(date('Y-m-d')),
										'rekkas'        =>$r2['rek1'],
										'rekitem'       =>$r2['rek2'],
										'rek1'          =>getRekening($r2['rek1']),
										'rek2'          =>getRekening($r2['rek2']),
										'rek3'          =>getRekening($r2['rek3']),
										'modul'         =>$r2['modul'],
										'idmodul'       =>$r2['idmodul'],
										'status'       	=>($biaya==$terbayar && $biaya!=0?'lunas':'belum'),
										'nominal'       =>'Rp. '.number_format($biaya)
								)));					
					break;					

					case 'joiningf';
						// get angkatan by : siswa -> kelompok -> angkatan
						$s1 = 'SELECT
									p.angkatan,
									c.nopendaftaran,	
									c.replid idsiswa,	
									c.nama siswa,	
									b.joiningf nominal
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
									k.nama = "Joining Fee"';
						$e2   = mysql_query($s2);
						$r2   = mysql_fetch_assoc($e2);
							// print_r($r2);exit();
						$stat = ($e2)?'sukses':'gagal';
						$nominal  = getBiaya('joiningf',$_POST['replid']);
						$terbayar = getTerbayar('Joining Fee',$_POST['replid']);
						$maxbayar = getBiaya('joiningf',$_POST['replid'])-getTerbayar('Joining Fee',$_POST['replid']);
						$out  = json_encode(array(
									'status' =>$stat,
									'datax'  =>array(
										//data siswa 
										'nopendaftaran' =>$r1['nopendaftaran'],
										'idsiswa'       =>$_POST['replid'],
										'siswa'         =>$r1['siswa'],
										//data pembayaran
										'nomer'         =>getNoTrans($_POST['subaksi']),
										'tanggal'       =>tgl_indo5(date('Y-m-d')),
										'rekkas'        =>$r2['rek1'],
										'rekitem'       =>$r2['rek2'],
										'rek1'          =>($r2['rek1']=='0'?'':getRekening($r2['rek1'])),
										'rek2'          =>($r2['rek2']=='0'?'':getRekening($r2['rek2'])),
										'rek3'          =>($r2['rek3']=='0'?'':getRekening($r2['rek3'])),
										'modul'         =>$r2['modul'],
										'idmodul'       =>$r2['idmodul'],
										'nominal'       =>$nominal,
										'nominal2'       =>'Rp. '.number_format($nominal),
										'terbayar'      =>$terbayar,
										'terbayar2'     =>'Rp. '.number_format($terbayar),
										'maxbayar'      =>$maxbayar,
										'status'       	=>getStatusBayar('joiningf',$_POST['replid']),
										'maxbayar2'     =>'Rp. '.number_format($maxbayar)
								)));					
					break;					

					case 'dpp';
						// get angkatan by : siswa -> kelompok -> angkatan
						$s1 = 'SELECT
									p.angkatan,
									b.nilai nominal,
									c.nis,
									c.replid idsiswa,
									c.nama siswa,
									c.jmlangsur,
									a.cicilan,
									c.discsaudara,
									c.disctb,
									d.nilai disctunaipers,
									(b.nilai * IFNULL(d.nilai,0)/100)disctunairp,
									(c.discsaudara + c.disctb + (b.nilai * IFNULL(d.nilai,0)/100))disctotal,
									(b.nilai -(c.discsaudara + c.disctb + (b.nilai * IFNULL(d.nilai,0)/100)))nominalnet

								FROM
									psb_calonsiswa c
									LEFT JOIN psb_setbiaya b ON b.replid = c.setbiaya
									LEFT JOIN psb_kelompok k ON k.replid = c.kelompok
									LEFT JOIN psb_proses p ON p.replid = k.proses
									LEFT JOIN psb_angsuran a on a.replid = c.jmlangsur
									LEFT JOIN psb_disctunai d on d.replid = c.disctunai
								WHERE
									c.replid ='.$_POST['replid'];
									// print_r($s1);exit(); 
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
									LEFT JOIN keu_pembayaran p ON p.modul = m.replid
								WHERE
									m.angkatan = '.$r1['angkatan'].' AND 
									k.nama = "dpp"';
						// print_r($s2);exit();
						$e2   = mysql_query($s2);
						$r2   = mysql_fetch_assoc($e2);

						// get data : pembayaran (cicilan)
						$s3 = 'SELECT
									SUM(cicilan) terbayar
								FROM
									keu_pembayaran p
								WHERE
									p.modul = '.$r2['idmodul'].'
								AND p.siswa = '.$r1['idsiswa'].'
								GROUP BY
									p.siswa';
						$e3 = mysql_query($s3);
						$r3 = mysql_fetch_assoc($e3);

						$stat = ($e2)?'sukses':'gagal';
						$out  = json_encode(array(
									'status' =>$stat,
									'datax'  =>array(
										//data siswa 
										'nis'           =>$r1['nis'],
										'idsiswa'       =>$r1['idsiswa'],
										'siswa'         =>$r1['siswa'],
										
										//info pembayaran
										'nomer'         =>getNoTrans($_POST['subaksi']),
										'tanggal'       =>tgl_indo5(date('Y-m-d')),
										'rekkas'        =>$r2['rek1'],		// id rek. KAS
										'rekitem'       =>$r2['rek2'],		// id rek. ITEM 
										'rek1'          =>getRekening($r2['rek1']), // rek.KAS
										'rek2'          =>getRekening($r2['rek2']), // rek.ITEM
										'rek3'          =>getRekening($r2['rek3']), // rek.TAMBAHAN
										'modul'         =>$r2['modul'],
										'idmodul'       =>$r2['idmodul'],
										// data nominal dll (syarat)
										'nominal'       =>'Rp. '.number_format($r1['nominal']), 	// dpp
										'nominalnet'    =>'Rp. '.number_format($r1['nominalnet']), 	// dpp net
										'discsubsidi'   =>'Rp. '.number_format($r1['disctb']), 		// disc subsidi (Rp.)
										'discsaudara'   =>'Rp. '.number_format($r1['discsaudara']),	// disc saudara (Rp.)
										'disctunaipers' =>$r1['disctunaipers'], 					// disc tunai (%)  
										'disctunairp'   =>'Rp. '.number_format($r1['disctunairp']),	// disc tunai (Rp.) 
										'disctotal' 	=>'Rp. '.number_format($r1['disctotal']), 	// disc total (Rp.)  
										'jmlangsur'     =>$r1['cicilan'],							// angsuran (berapa x ) 
										'angsuran'     	=>'Rp. '.number_format($r1['nominalnet']/$r1['cicilan']),		// angsuran (Rp. ) 
										// data nominal (terbayar)
										'status'       	=>getStatusBayar('dpp',$_POST['replid']),
										'terbayar'     	=>'Rp. '.number_format($r3['terbayar'])
								)));					
					break;

					case 'spp';
						$sis  = $_POST['replid'];			  // 
						$kel  = getSiswaBy('kelompok',$sis);  // 5
						$pros = getKelompok('proses',$kel);   // 3
						$ang  = getAngkatan('replid',$pros);  // 3

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
									LEFT JOIN keu_pembayaran p ON p.modul = m.replid
								WHERE
									m.angkatan = '.$ang.' AND 
									k.nama = "spp"';
									// var_dump($s2);exit();
						$e2   = mysql_query($s2);
						// var_dump($s2);exit();
						$r2   = mysql_fetch_assoc($e2);

						$stat = ($e2)?'sukses':'gagal';
						$out  = json_encode(array(
									'status' =>$stat,
									'datax'  =>array(
										//data siswa 
										'nis'           =>getSiswaBy('nis',$sis),
										'idsiswa'       =>$sis,
										'siswa'         =>getSiswaBy('nama',$sis),
										//info pembayaran
										'nomer'         =>getNoTrans($_POST['subaksi']),
										'tanggal'       =>tgl_indo5(date('Y-m-d')),
										'rekkas'        =>$r2['rek1'],		// id rek. KAS
										'rekitem'       =>$r2['rek2'],		// id rek. ITEM 
										'rek1'          =>getRekening($r2['rek1']), // rek.KAS
										'rek2'          =>getRekening($r2['rek2']), // rek.ITEM
										'rek3'          =>getRekening($r2['rek3']), // rek.TAMBAHAN
										'modul'         =>$r2['modul'],
										'idmodul'       =>$r2['idmodul'],
										'status'       	=>getStatusBayar('spp',$_POST['replid']),
										'nominal'       =>'Rp. '.number_format(getBiaya('spp',$sis)), 	// spp
								)));					
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