<?php

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
?>