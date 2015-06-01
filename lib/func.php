<?php	
// session_start();
/* common*/
	function filter($str){
		$str = mysql_real_escape_string(htmlentities($str));
		return $str;
	}function getuang($str){
		$old = array('-','Rp. ',',','.');
		$new = array('','','','');
		$x   = str_replace($old,$new, $str);
		$y= $x==''?0:$x; 
		return $y;
	}function setuang($str){
		$str = 'Rp. '.str_replace(',','.',number_format($str));
		return $str;
	}function getFileName(){
		$x=pathinfo(__FILE__, PATHINFO_FILENAME);
		return $x;
	}
	function topMenu($modul){
        $out='';
        // looping grup menu
        foreach ($_SESSION['grupmodulS']as $i => $v) {
            foreach ($v['modul'] as $i2 => $v2) {
                if($v2['modul']==$modul and $v2['statmod']==1) {
                    foreach ($v2['grupmenu'] as $i3 => $v3) {
                        $out.='<div class="element">                
                                <a class="dropdown-toggle" href="#">'.$v3['grupmenu'].'</a>
                                <ul class="dropdown-menu" data-role="dropdown">';
                        foreach ($v3['menu'] as $i4 => $v4) {
                            $out.='<li '.($v4['statmenu']==0?'class="disabled"':'').'> 
                                        <a href="'.($v4['statmenu']!=0?$v4['link']:'#').'">'.$v4['menu'].'</a>
                                    </li>';
                        }// end of menu looping
                        $out.='</ul>
                            </div>';
                    } // end of grupmenu looping
                } // end of modul checking
            } // end of  modul looping
        } // grup grupmodul looping 
        echo $out;
	}
	function isAksi($mn,$ak){
	    $aksi=false;
	    foreach ($_SESSION['grupmodulS']as $i => $v) {
	        foreach ($v['modul'] as $i2 => $v2) {
	            foreach ($v2['grupmenu'] as $i3 => $v3) {
	                foreach ($v3['menu'] as $i4 => $v4) {
	                    if($v4['menu']==$mn and $v4['statmenu']==1){
	                        foreach ($v4['aksi'] as $i5 => $v5) {
	                            if($v5['aksi']==$ak) $aksi=true;
	                        }// end of aksi looping
	                    } // end of checking menu
	                }// end of menu looping
	            } // end of grupmenu looping
	        } // end of  modul looping
	    } // grup grupmodul looping 
	    // return 'asem';
	    return $aksi;
	}function isDisabled($mn,$ak){
		return (isAksi($mn,$ak)==false?'disabled':'');
	}function isModul($mod){
	    // $w = array_pop(explode("/", $x));;
	    // $x = __FILE__;
		// $x=preg_replace('/\.php$/', '', __FILE__);
		// $x=pathinfo(__FILE__, PATHINFO_FILENAME);
        // $x = pathinfo(__FILE__, PATHINFO_FILENAME);
		// session_start();
	    $out=0; 
	    foreach ($_SESSION['grupmodulS'] as $i => $v) {
	        foreach ($v['modul'] as $i2 => $v2) {
	            if($v2['modul']==$mod and $v2['statmod']==1) {
	                $out+=1;
	            }
	        }
	    }
	    if($out==0 OR $_SESSION['loginS']==''){
	        header('location:../');
	    }
	}

/*aka*/
	function getTahunAjaran($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM aka_tahunajaran
			  WHERE replid ='.$id;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}
	function getKelas($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM aka_kelas
			  WHERE replid ='.$id;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}

	function getSubtingkat($f,$id){
		$s = 'SELECT '.$f.'
			  FROM aka_subtingkat
			  WHERE replid ='.$id;
			  // print_r($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$f];
	}
	function getTingkat($f,$id){
		$s = 'SELECT '.$f.'
			  FROM aka_tingkat
			  WHERE replid ='.$id;
		// var_dump($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$f];
	}

/*psb*/
	function getAngkatan($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM aka_angkatan
			  WHERE replid ='.$id;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getProses($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM psb_proses
			  WHERE replid ='.$id;
			  // print_r($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getKelompok($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM psb_kelompok
			  WHERE replid ='.$id;
			  // print_r($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getSiswaBy($f,$w){
		$s='SELECT '.$f.' FROM psb_calonsiswa WHERE replid ='.$w;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// var_dump($s);exit();
		return $r[$f];
	}
	
/*akademik*/
	function getDepartemen($typ,$id){
		$s='SELECT '.$typ.' FROM departemen WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$typ];
	}

/*pus*/
	function getBarcodeDT($data){
		// rule barkode  ----------------------------------------------- 
		$s = '	SELECT 
					d.nilai,
					d.nilai2,
					d.keterangan,
					d.isActive
				FROM pus_setting2 s 
				     left join pus_detail_setting d on d.kunci = s.replid
				WHERE 
					s.kunci ="bcfmt" 
				ORDER BY  
					d.urut asc';
		$e = mysql_query($s);
		$barcodeFormat ='';
		// kode buku -------------
		while ($r = mysql_fetch_assoc($e)) {
			if(strpos($r['nilai'],'nomorauto')!==FALSE and $r['isActive']==1){
				if($_POST['jml_koleksi']>1) {
					$barcodeFormat.='[auto]';
				}else {
					$id = $r['nilai2'];
					$barcodeFormat.=sprintf('%0'.$id.'d',$data['idbuku']);
				}
			}
			if(strpos($r['nilai'],'tahun')!==FALSE and $r['isActive']==1){
				$barcodeFormat.=$data['tahun'];
			}
			if(strpos($r['nilai'],'tingkat')!==FALSE and $r['isActive']==1){
				$tingkat = $data['tingkat'];
				$barcodeFormat.=$tingkat;						
			}
			if(strpos($r['nilai'],'lokasi')!==FALSE and $r['isActive']==1){
				$lokasi = $data['lokasi'];
				$barcodeFormat.=$lokasi;						
			}
		}return $barcodeFormat;
	}

	function getKodeBukuDT($data){
		// rule kode buku dan barkode  ----------------------------------------------- 
		$s1 = '	SELECT 
					d.nilai,
					d.nilai2,
					d.keterangan,
					d.isActive
				FROM pus_setting2 s 
				     left join pus_detail_setting d on d.kunci = s.replid
				WHERE 
					s.kunci ="idfmt" 
				ORDER BY  
					d.urut asc';
		$e1 = mysql_query($s1);
		$bukuFormat ='';
		// kode buku -------------
		while ($r1 = mysql_fetch_assoc($e1)) {
			if(strpos($r1['nilai'],'nomorauto')!==FALSE and $r1['isActive']==1){
				if($_POST['jml_koleksi']>1) {
					$bukuFormat.='/[auto]';
				}else {
					$id = $r1['nilai2'];
					$bukuFormat.='/'.sprintf('%0'.$id.'d',$data['idbuku']);
				}
			}
			if(strpos($r1['nilai'],'sumber')!==FALSE and $r1['isActive']==1){
				$bukuFormat.='/'.($data['sumber']=='0'?'B':'H');			
			}
			if(strpos($r1['nilai'],'sistem')!==FALSE and $r1['isActive']==1){
				$bukuFormat.='/'.$r1['nilai2'];						
			}
			if(strpos($r1['nilai'],'tahun')!==FALSE and $r1['isActive']==1){
				$bukuFormat.='/'.$data['tahun'];						
			}
			if(strpos($r1['nilai'],'tingkatbuku')!==FALSE and $r1['isActive']==1){
				$tingkat = getTingkatBuku('kode','replid',$data['tingkat']);
				$bukuFormat.='/'.$tingkat;						
			}
		}$bukuFormat=substr($bukuFormat, 1);
		return $bukuFormat;
	}

	function getSettingFormat($kunci){
		$s = '	SELECT
					d.nilai,
					d.nilai2,
					d.keterangan,
					d.isActive,
					d.urut
				FROM
					pus_setting2 s
					LEFT JOIN pus_detail_setting d ON d.kunci = s.replid
				WHERE
					s.kunci = "'.$kunci.'"
					AND d.isActive = 1
				ORDER BY
					urut ASC';
		// var_dump($s);exit();
		$e = mysql_query($s);
		$format = '';
		while ($r = mysql_fetch_assoc($e)) {
			$format.=($kunci=='idfmt'?'/':'').'['.$r['nilai'].( ($r['nilai2']!='' AND is_numeric($r['nilai2']))?'.'.$r['nilai2']:'').']';						
		}$format= $kunci=='idfmt'?substr($format,1):$format;	
		return $format;
	}
	function getLokasi($f,$w,$k){
		$s='SELECT * FROM pus_lokasi WHERE '.$w.'='.$k;
		// var_dump($s);exit();
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$f];
	}
	function getTingkatBuku($f,$w,$k){
		$s='SELECT * FROM pus_tingkatbuku WHERE '.$w.'='.$k;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r[$f];
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
	}function rp_satuan($angka,$debug)
{
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
	function getKatAnggaran($f,$id){
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
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// var_dump($s);
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
	}function getBiaya($typ,$siswa){ // to get : nominal yg harus dibayar
		if($typ=='pendaftaran'){ // formulir + joining fee
			$f = '(b.daftar + b.joiningf)';
		}elseif($typ=='daftar' || $typ=='formulir'){ // formulir
			$f = 'b.daftar';
		}elseif($typ=='joiningf' || $typ=='joining fee'){ // dpp
			$f = 'b.joiningf';
			$typ='joiningf';
		}elseif($typ=='dpp'){ // dpp
			$f = 'b.nilai';
		}else{ // spp
			$f = 'b.spp';
		}
			
		$s = 'SELECT '.$f.' as '.$typ.'
			  FROM psb_setbiaya b
			  LEFT JOIN psb_calonsiswa c on c.setbiaya = b.replid
			  WHERE c.replid ='.$siswa;
			  // var_dump($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getDiscTunai($typ,$siswa){
		$s     = 'SELECT nilai FROM psb_disctunai WHERE replid ='.getSiswaBy('disctunai',$siswa);
		$e     = mysql_query($s);
		$r     = mysql_fetch_assoc($e);
		$biaya = getBiaya($typ,$siswa);
		$ret   = $r['nilai'] * $biaya / 100;
		return $ret;
	}function getDiscTotal($typ,$siswa){
		// var_dump(getSiswaBy('discsaudara',$siswa));exit(); 	150.000
		// var_dump(getSiswaBy('disctb',$siswa));exit(); 		0
		// var_dump(getDiscTunai($typ,$siswa));exit();			750.000
		$ret = getDiscTunai($typ,$siswa)+getSiswaBy('disctb',$siswa)+getSiswaBy('discsaudara',$siswa);
		// var_dump($ret);exit();
		return $ret;
	}function getOperator($id){
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
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// var_dump($r);exit();
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
?>