<?php

	function getBiayaNett($idBiaya,$idDiskReg,$diskKhus){
		$biaya = !is_null($idDiskReg)?getBiayaDiskReg($idBiaya,$idDiskReg):getField('nominal','psb_detailbiaya','replid',$idBiaya);
		$biayaNett = ($biaya<$diskKhus?0:(intval($biaya) - intval($diskKhus)) );
		// vd($biayaNett);
		return $biayaNett;
	}


	function getDiskReg($idDetailBiaya,$idDiskReg){
		if(is_array($idDiskReg)){
			$biaya = getField('nominal','psb_detailbiaya','replid',$idDetailBiaya); // biaya awal  Rp.
				// pr($biaya);
			foreach ($idDiskReg as $i => $v) {
				$diskReg = intval(getField('nilai','psb_detaildiskon','replid',$v)); // diskon %
				$biaya-=($biaya*$diskReg/100);
				// pr($biaya);
			}return $biaya;
		}
	}
	function getBiayaDiskReg($idDetailBiaya,$idDiskReg){
		if(is_array($idDiskReg)){
			$biaya = getField('nominal','psb_detailbiaya','replid',$idDetailBiaya); // biaya awal  Rp.
				// pr($biaya);
			foreach ($idDiskReg as $i => $v) {
				$diskReg = intval(getField('nilai','psb_detaildiskon','replid',$v)); // diskon %
				$biaya-=($biaya*$diskReg/100);
				// pr($biaya);
			}return $biaya;
		}
	}
	function getBiaya($dgel,$subt,$gol){
		$s = '	SELECT b.replid,db.nominal
				FROM psb_detailbiaya db JOIN psb_biaya b on b.replid = db.biaya 
				WHERE 	db.detailgelombang  ='.$dgel.' AND 
						db.subtingkat ='.$subt.' AND 
						db.golongan  ='.$gol.'
				ORDER BY b.biaya ASC';
		// pr($s);exit();
		$e = mysql_query($s);
		$o=array();
		while ($r=mysql_fetch_assoc($e)) {
			$o[]=$r;
		}return $o;
	}function getBiayaArr($dgel,$subt,$gol){
		$s = '	SELECT b.replid,db.nominal,db.replid iddetailbiaya
				FROM psb_detailbiaya db JOIN psb_biaya b on b.replid = db.biaya 
				WHERE 	db.detailgelombang  ='.$dgel.' AND 
						db.subtingkat ='.$subt.' AND 
						db.golongan  ='.$gol.'
				ORDER BY b.biaya ASC';
		// pr($s);exit();
		$e = mysql_query($s);
		$o=array();
		while ($r=mysql_fetch_assoc($e)) {
			$o[]=$r;
		}return $o;
	}

	function getKatAnggaran($id,$typ){
		$s='SELECT
				k.*, IFNULL(da.kuotaNum, 0) kuotaNum,
				IFNULL(t.totTerpakai, 0) terpakaiNum,
				IFNULL((da.kuotaNum - IFNULL(t.totTerpakai, 0)),0) sisaNum
			FROM
				keu_kategorianggaran k
				LEFT JOIN (
					SELECT
						sum(t.nominal) totTerpakai,
						d.kategorianggaran
					FROM
						keu_transaksi t
					LEFT JOIN keu_detilanggaran d ON d.replid = t.detilanggaran
					GROUP BY
						t.detilanggaran
				) t ON t.kategorianggaran = k.replid
				LEFT JOIN (
					SELECT
						tb.kategorianggaran,
						SUM(tb.totDetAnggaran) kuotaNum
					FROM(
							SELECT (
									SELECT
										(sum(jml) * d.hargasatuan) 
									FROM
										keu_nominalanggaran
									WHERE
										detilanggaran = d.replid
								)totDetAnggaran,
								d.replid,
								d.kategorianggaran
							FROM
								keu_detilanggaran d
							GROUP BY
								d.replid
						) tb
					GROUP BY
						tb.kategorianggaran
				) da ON da.kategorianggaran = k.replid
			WHERE
				k.replid ='.$id;
		// var_dump($s);exit();	
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$typ];
	}
	function getDetAnggaran($id,$typ){
		$s='SELECT
				(SUM(n.jml) * d.hargasatuan)kuotaNum,
				ifnull(t1.terpakaiNum, 0) terpakaiNum,
				ifnull(((SUM(n.jml) * d.hargasatuan) - t1.terpakaiNum),(SUM(n.jml) * d.hargasatuan)) sisaNum,
				ifnull(round(((t1.terpakaiNum) / (SUM(n.jml) * d.hargasatuan) * 100)),0) terpakaiPerc
			FROM
				keu_detilanggaran d
				LEFT JOIN keu_nominalanggaran n ON n.detilanggaran = d.replid
				LEFT JOIN (
					SELECT
						t.detilanggaran,
						SUM(t.nominal) terpakaiNum
					FROM
						keu_transaksi t
					GROUP BY
						t.detilanggaran
				) t1 ON t1.detilanggaran = d.replid
			WHERE
				d.replid = '.$id;
				// var_dump($s);exit();
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$typ];
	}



	/*keuangan*/
	// transact
	/*pembayaran*/
	function jenisRek2($rek){
		$ret = '<b class="fg-'.($rek=='d'?'green':'red').'">'.jenisRek($rek).'</b>';
		return $ret;
	}function jenisRek($rek){
		$ret = $rek=='d'?'debit':'kredit';
		return $ret;
	}function getTerbilang($angka,$debug){
		// $angka = str_replace('Rp. ','');
	    $angka = str_replace(".",",",'75.900.500');
	    // $angka = str_replace(".",",",$angka);
	    list ($angka, $desimal) = explode(",",$angka);
	    $panjang=strlen($angka);
	    for ($b=0;$b<$panjang;$b++){
	        $myindex=$panjang-$b-1;
	        $a_bil[$b]=substr($angka,$myindex,1);
	    }
	    if ($panjang>9){
	        $bil=$a_bil[9];
	        if ($panjang>10){
	            $bil=$a_bil[10].$bil;
	        }
		    // var_dump($bil);exit();

	        if ($panjang>11){
	            $bil=$a_bil[11].$bil;
	        }
	        if ($bil!="" && $bil!="000"){
	            $terbilang .= rp_satuan($bil,$debug)." milyar";
	        }
	    }

	    if ($panjang>6){
	        $bil=$a_bil[6];
	        if ($panjang>7){
	            $bil=$a_bil[7].$bil;
	        }

	        if ($panjang>8){
	            $bil=$a_bil[8].$bil;
	        }
	        if ($bil!="" && $bil!="000"){
	            $terbilang .= rp_satuan($bil,$debug)." juta";
	        }
	    }
	   
	    if ($panjang>3){
	        $bil=$a_bil[3];
	        if ($panjang>4){
	            $bil=$a_bil[4].$bil;
	        }

	        if ($panjang>5){
	            $bil=$a_bil[5].$bil;
	        }
	        if ($bil!="" && $bil!="000"){
	            $terbilang .= rp_satuan($bil,$debug)." ribu";
	        }
	    }

	    $bil=$a_bil[0];
	    if ($panjang>1){
	        $bil=$a_bil[1].$bil;
	    }

	    if ($panjang>2){
	        $bil=$a_bil[2].$bil;
	    }
	    //die($bil);
	    if ($bil!="" && $bil!="000"){
	        $terbilang .= rp_satuan($bil,$debug);
	    }
	    return trim($terbilang);
	}function rp_satuan($angka,$debug){
    $a_str['1']="satu";
    $a_str['2']="dua";
    $a_str['3']="tiga";
    $a_str['4']="empat";
    $a_str['5']="lima";
    $a_str['6']="enam";
    $a_str['7']="tujuh";
    $a_str['8']="delapan";
    $a_str['9']="sembilan";
   
   
    $panjang=strlen($angka);
    for ($b=0;$b<$panjang;$b++)
    {
        $a_bil[$b]=substr($angka,$panjang-$b-1,1);
    }
   
    if ($panjang>2)
    {
        if ($a_bil[2]=="1")
        {
            $terbilang=" seratus";
        }
        else if ($a_bil[2]!="0")
        {
            $terbilang= " ".$a_str[$a_bil[2]]. " ratus";
        }
    }

    if ($panjang>1)
    {
        if ($a_bil[1]=="1")
        {
            if ($a_bil[0]=="0")
            {
                $terbilang .=" sepuluh";
            }
            else if ($a_bil[0]=="1")
            {
                $terbilang .=" sebelas";
            }
            else
            {
                $terbilang .=" ".$a_str[$a_bil[0]]." belas";
            }
            return $terbilang;
        }
        else if ($a_bil[1]!="0")
        {
            $terbilang .=" ".$a_str[$a_bil[1]]." puluh";
        }
    }
   
    if ($a_bil[0]!="0")
    {
        $terbilang .=" ".$a_str[$a_bil[0]];
    }
    return $terbilang;
  
}
	function getKatAnggaran2($f,$id){
		$s='SELECT '.$f.' FROM keu_kategorianggaran WHERE replid='.$id;
		// print_r($s);exit();
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$f];
	}function getAnggaran($id){
		$s='SELECT * FROM keu_detilanggaran WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['nama'];
	}function getKuotaAnggaran($anggaran){
		$s='SELECT
				SUM(n.nominal)kuotaNum,
				ifnull(t1.terpakaiNum,0)terpakaiNum,
				ifnull((SUM(n.nominal)-t1.terpakaiNum),SUM(n.nominal))sisaNum,
				ifnull(round(((t1.terpakaiNum)/SUM(n.nominal)*100)),0)terpakaiPerc
			FROM
				keu_detilanggaran d
				LEFT JOIN keu_nominalanggaran n ON n.detilanggaran = d.replid
				LEFT JOIN (
					SELECT t.detilanggaran, SUM(t.nominal) terpakaiNum 
					FROM keu_transaksi t
					GROUP BY t.detilanggaran
				)t1 on t1.detilanggaran = d.replid
			WHERE d.replid='.$anggaran;
		var_dump($s);
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r;
	}function getPembayaran($siswa,$modul){
		$s ='SELECT max(replid) modul
			FROM keu_pembayaran
			WHERE
				siswa = '.$siswa.' AND 
				modul = '.$modul;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		// return $
	}
	function getTglTrans($siswa,$typ){
		$s='SELECT
				t.replid,
				max(t.tanggal)tgl
			FROM
				keu_transaksi t
				LEFT JOIN keu_pembayaran p ON p.replid = t.pembayaran
				LEFT JOIN keu_modulpembayaran m ON m.replid = p.modul
				LEFT JOIN keu_katmodulpembayaran k ON k.replid = m.katmodulpembayaran
			WHERE
				p.siswa = '.$siswa.' and (
				k.nama = "'.$typ.'"
			)';
		$e   =mysql_query($s);
		$r   =mysql_fetch_assoc($e);
		$tgl =$r['tgl']!=NULL?tgl_indo5($r['tgl']):'-' ;	
		return $tgl;
	}
	function getAngsur($id){
		$s='SELECT * FROM psb_angsuran WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// return $r[];	
	}
	function getBiayaNet($typ,$siswa){
		$biayaNet = getBiaya($typ,$siswa) - getDiscTotal($typ,$siswa); 		
		return $biayaNet;
	}
	function getStatusBayar($typ,$siswa){
		$biaya = getBiaya($typ,$siswa);
		if($typ=='dpp'){
			$diskonTotal= getDiscTotal($typ,$siswa);
			$biaya-=$diskonTotal; 		
		}$terbayar = getTerbayar($typ,$siswa);			
		// var_dump($biaya);exit();
		if($terbayar<=0){
			$status = 'belum';
		}else{
			if($terbayar==$biaya){
				$status = 'lunas';
			}else{ 
				$status = 'kurang';
			}
		}return $status;
	}
	function getAngsurNom($typ,$siswa){
		$biayaKotor = getBiaya($typ,$siswa);			
		$diskonTotal= getDiscTotal($typ,$siswa);
		$biaya      = $biayaKotor - $diskonTotal; 		
		$angsurkali = getSiswaBy('jmlangsur',$siswa);
		$ret = $biaya/$angsurkali;
		return $ret;
	}function akanBayarOpt($typ,$siswa){
		$biayaKotor = getBiaya($typ,$siswa);			// 15.000.000
		$diskonTotal= getDiscTotal($typ,$siswa); 		// 	  900.000
														// __________ -
		$biaya      = $biayaKotor - $diskonTotal; 		// 14.100.000
		$angsurkali = getSiswaBy('jmlangsur',$siswa);	// 3 x  		use
		$terbayar   = getTerbayar($typ,$siswa);			//  4.700.000
		$angsurnom 	= $biaya/$angsurkali;				// @4.700.000	use
		$sisabayar 	= $biaya-$terbayar;					//  9.400.000
		// var_dump($diskonTotal);exit();
		$ret     = array();
		$nominal = 0;
		$count = $sisabayar/$angsurnom; 				// 1 x  
		for ($i=1; $i<=$count; $i++) {
			$nominal+=$angsurnom;
			$ret[] = array(
				'idAngsur'  => $i,
				'nomAngsur' =>'Rp. '.number_format($nominal)
			);
		}
		return $ret;
	}
	function getTerbayar($typ,$siswa){ // to get : nominal yg telah terbayar
		$s ='SELECT
				SUM(p.cicilan) terbayar
			FROM
				keu_pembayaran p 
				LEFT JOIN keu_modulpembayaran m on m.replid = p.modul
				LEFT JOIN keu_katmodulpembayaran k on k.replid = m.katmodulpembayaran
			WHERE
				k.nama = "'.($typ=='joiningf' || $typ=='joining fee'?'joining fee':$typ).'" AND 
				p.siswa = '.$siswa.'
			GROUP BY
				p.siswa';
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		$rr = $r['terbayar']!=null?$r['terbayar']:0;
		return $rr;
	}
	// function getBiaya($typ,$siswa){ // to get : nominal yg harus dibayar
	// 	if($typ=='pendaftaran'){ // formulir + joining fee
	// 		$f = '(b.daftar + b.joiningf)';
	// 	}elseif($typ=='daftar' || $typ=='formulir'){ // formulir
	// 		$f = 'b.daftar';
	// 	}elseif($typ=='joiningf' || $typ=='joining fee'){ // dpp
	// 		$f = 'b.joiningf';
	// 		$typ='joiningf';
	// 	}elseif($typ=='dpp'){ // dpp
	// 		$f = 'b.nilai';
	// 	}else{ // spp
	// 		$f = 'b.spp';
	// 	}
			
	// 	$s = 'SELECT '.$f.' as '.$typ.'
	// 		  FROM psb_setbiaya b
	// 		  LEFT JOIN psb_calonsiswa c on c.setbiaya = b.replid
	// 		  WHERE c.replid ='.$siswa;
	// 		  // var_dump($s);exit();
	// 	$e = mysql_query($s);
	// 	$r = mysql_fetch_assoc($e);
	// 	return $r[$typ];
	// }function getDiscAngsuran($regNum,$disc){
	// 	$regNum   = getuang($regNum);
	// 	$discPerc = intval(getField('diskon','psb_angsuran','replid',$disc));
	// 	$discNum  = $regNum * $discPerc /100;
	// 	// var_dump($discNum);exit();
	// 	return $discNum;
	// }function getDisc($typ,$siswa){
	// 	if($typ=='disctunai'){ // diskon tunai
	// 		$s     = 'SELECT nilai FROM psb_disctunai WHERE replid ='.getSiswaBy($typ,$siswa);
	// 		$e     = mysql_query($s);
	// 		$r     = mysql_fetch_assoc($e);
	// 		$biaya = getBiaya('registration',$siswa);
	// 		$ret   = $r['nilai'] * $biaya / 100;
	// 	}elseif($typ=='discangsuran'){ // diskon angsuran 
	// 		$angsuran = getSiswaBy('angsuran',$siswa); // suadara || subsisi
	// 		$ret      = getDiscAngsuran(getBiaya('registration',$siswa),$angsuran);
	// 	}else{ // saudara || subsidi
	// 		$ret = getSiswaBy($typ,$siswa);
	// 	}return $ret;
	// }function getDiscTunai($typ,$siswa){
	// 	$s     = 'SELECT nilai FROM psb_disctunai WHERE replid ='.getSiswaBy('disctunai',$siswa);
	// 	$e     = mysql_query($s);
	// 	$r     = mysql_fetch_assoc($e);
	// 	$biaya = getBiaya($typ,$siswa);
	// 	$ret   = $r['nilai'] * $biaya / 100;
	// 	return $ret;
	// }function getDiscTotal($typ,$siswa){
	// 	// var_dump(getSiswaBy('discsaudara',$siswa));exit(); 	150.000
	// 	// var_dump(getSiswaBy('disctb',$siswa));exit(); 		0
	// 	// var_dump(getDiscTunai($typ,$siswa));exit();			750.000
	// 	$ret = getDisc('discangsuran',$siswa)+getDisc('disctunai',$siswa)+getSiswaBy('discsubsidi',$siswa)+getSiswaBy('discsaudara',$siswa);
	// 	// $ret = getDisc('discangsuran',$siswa)+getDisc('disctunai',$siswa)+getDiscTunai($typ,$siswa)+getSiswaBy('disctb',$siswa)+getSiswaBy('discsaudara',$siswa);
	// 	// var_dump($ret);exit();
	// 	return $ret;
	// }
	function getOperator($id){
		$s = '	SELECT k.jenis 
				FROM keu_detilrekening d
					LEFT JOIN keu_kategorirekening k on k.replid = d.kategorirekening  
				WHERE d.replid ='.$id;
		// var_dump($s);exit();		
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		$operator = ($r['jenis']=='debit' OR $r['jenis']=='debit_kredit')?'+':'-';
		return $operator; 
	}function getTahunBuku($x){
		$s = 'SELECT '.$x.' FROM keu_tahunbuku WHERE aktif =1';
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		// var_dump($s);exit();
		return $r[$x];
	}function getJenisTrans($f,$id){
		$s='SELECT * FROM keu_jenistrans WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// var_dump($r);exit();
		return $r[$f];
	}function getBuktiTrans2($id){
		$s='SELECT * FROM keu_detjenistrans WHERE kode="'.$id.'"';
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['bukti'];
	}function getBuktiTrans($id){
		$s='SELECT * FROM keu_detjenistrans WHERE replid="'.$id.'"';
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['bukti'];
	}function getDetJenisTrans($f,$w,$k){
		$s='SELECT '.$f.' FROM keu_detjenistrans WHERE '.$w.'="'.$k.'"';
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// var_dump($s);exit();
		return $r[$f];
	}function getKatModulPemb($nama){
		$s='SELECT * FROM keu_katmodulpembayaran WHERE nama="'.($nama=='joiningf' || $nama=='joining fee'?'joining fee':$nama).'"';
		// var_dump($s);exit();
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['detjenistrans'];
	}
	function getDetJenisTrans2($id){
		$s  = '	SELECT 
					d.nama jenis,
					CASE j.kode
						when "ju" then "blue" 
						when "in" then "green"
						else "red" 
					end as warna
				FROM keu_transaksi t
					left  JOIN keu_detjenistrans d on d.replid = t.detjenistrans
					left JOIN keu_jenistrans j on j.replid = d.jenistrans 
				WHERE t.replid='.$id;
		$e     = mysql_query($s);
		$r     = mysql_fetch_assoc($e);
		$warna =$r['warna'];
		$jenis =$r['jenis'];
		$ret   ='<span style="font-weight:bold;" class="fg-'.$warna.'">'.$jenis.'</span>';
		return $ret;
	}function getNoTrans2($typ){
		$s = 'SELECT LPAD(max(replid),4,0)replid from keu_transaksi';
		$e = mysql_query($s);
		$stat =!$e?'gagal_'.mysql_error():'sukses';
		if(mysql_num_rows($e)>0){
			$r  =mysql_fetch_assoc($e);
			$in =$r['replid']+1;
		}else{
			$in=1;
		}
		$kode=getBuktiTrans2($typ).'-'.sprintf("%04d",$in).'/'.date("m").'/'.date("Y");
		return $kode;
	}function getNoTrans($typ){
		$s = 'SELECT LPAD(max(replid),4,0)replid from keu_transaksi';
		$e = mysql_query($s);
		$stat =!$e?'gagal_'.mysql_error():'sukses';
		if(mysql_num_rows($e)>0){
			$r  =mysql_fetch_assoc($e);
			$in =$r['replid']+1;
		}else{
			$in=1;
		}$kode=getBuktiTrans(getKatModulPemb($typ)).'-'.sprintf("%04d",$in).'/'.date("m").'/'.date("Y");
		return $kode;
	}function getRekening($id){
		$s='SELECT concat(kode," - ",nama)rekening FROM keu_detilrekening WHERE replid='.$id;
		// var_dump($s);exit();
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['rekening'];
	}function getRekBy($f,$id){
		$s='SELECT '.$f.' FROM keu_detilrekening WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$f];
	}function getKatRekBy($f,$id){
		$s='SELECT '.$f.' FROM keu_kategorirekening WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$f];
	}

	/*transaksi*/
	function transKode($jt=0){
		$kode=array(0=>'MMJ',3=>'BKM',4=>'BKK');
		return $kode[$jt];
	}function jtrans($i1,$i2,$i3){
		$jArr=array(
				array(
					'kode'  =>'',
					'nama'  =>'jurnal umum',
					'warna' =>'fg-blue',
					'sub'   =>array(
						array('kode'=>1,'nama'=>''),
						array('kode'=>2,'nama'=>'')
					)
				),array(
					'kode'  =>'in',
					'nama'  =>'pemasukkan',
					'warna' =>'fg-lightGreen',
					'sub'   =>array(
						array('kode'=>3,'nama'=>'BKM'),
						array('kode'=>5,'nama'=>'BBM')
					)
				),array(
					'kode'  =>'out',
					'nama'  =>'pengeluaran',
					'warna' =>'fg-lightRed',
					'sub'   =>array(
						array('kode'=>4,'nama'=>'BKK'),
						array('kode'=>6,'nama'=>'BBK')
					)
				),
			);
		// if()
		// $ret=$jArr[$i1];
		// // print_r($ok);
		// return f
	}

	function jenisbukti($a){
		if($a==3) return 'BKM'; //masuk
		else if($a==5) return 'BBM'; //masuk	
		else if($a==4) return 'BKK'; //keluar
		else if($a==6) return 'BBK'; //keluar
		else return ''; //lainnya
	}function ju_nomor($no,$jenis,$bukti){
		#jurnal umum 
		if($jenis==0) $cl='fg-blue'; #umum / JT_UMUM
		#pemasukkan
		else if($jenis==1) $cl='fg-lightGreen'; #siswa /JT_SISWA
		else if($jenis==2) $cl='fg-lightGreen'; #calon siswa /JT_CALONSISWA
		else if($jenis==3) $cl='fg-lightGreen'; #income /JT_INCOME
		else if($jenis==5) $cl='fg-lightGreen'; #inbank /JT_INBANK
		#pengeluaran
		else if($jenis==4) $cl='fg-lightRed'; #outcome /JT_OUTCOME
		else if($jenis==6) $cl='fg-lightRed'; #outbank /JT_OUTBANK
		else if($jenis==7) $cl='fg-lightRed'; #Winbrg /JT_INBRG
		#lainnya
		else $cl=''; # /OTHERS

		$ret='<span style="font-weight:bold;" class="'.$cl.'">'.$no.'</span><br>
			'.jenisbukti($jenis).'<br>
			'.($bukti!=''?$bukti:'');
		return $ret;
	}

	function getuang($str){
		$old = array('-','Rp. ',',','.');
		$new = array('','','','');
		$x   = str_replace($old,$new, $str);
		$y= $x==''?0:$x; 
		return $y;
	}function setuang($str){
		$str = 'Rp. '.str_replace(',','.',number_format($str));
		return $str;
	}

?>