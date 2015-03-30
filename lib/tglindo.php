<?php
	function tgl_indo($tgl){
			$tanggal= substr($tgl,8,2);
			$bulan 	= getBulan(substr($tgl,5,2));
			$tahun 	= substr($tgl,0,4);
			$jam	= substr($tgl,11,2);
			$menit	= substr($tgl,14,2);
			return $tanggal.' '.$bulan.' '.$tahun;		 
	}function tgl_indo2($tgl){
			$tanggal= substr($tgl,8,2);
			$bulan 	= getBulan(substr($tgl,5,2));
			$tahun 	= substr($tgl,0,4);
			$jam	= substr($tgl,11,2);
			$menit	= substr($tgl,14,2);
			return $tanggal.' '.$bulan.' '.$tahun.' ('.$jam.':'.$menit.')' ;		 
	}function tgl_indo3($tgl){ // 05/25/2012
			$bulan		= substr($tgl,0,2);
			$tanggal 	= substr($tgl,3,2);
			$tahun 		= substr($tgl,6,4);
			return $tahun.'-'.$bulan.'-'.$tanggal;		 
	}function tgl_indo4($tgl){ //2012-01-29 
			$tahun 		= substr($tgl,0,4);
			$bulan		= substr($tgl,5,2);
			$tanggal 	= substr($tgl,8,2);
			return $bulan.'/'.$tanggal.'/'.$tahun;		 
	}function tgl_indo5($tgl){ //2012-01-29 
			$tahun 		= substr($tgl,0,4);
			$tahun 		= substr($tgl,2,2);
			$bulan 		= getBulan(substr($tgl,5,2));
			$bulan		= substr($bulan,0,3);
			$tanggal 	= substr($tgl,8,2);
			return $tanggal.' '.$bulan.' '.$tahun;		 
	}function tgl_indo6($tgl){ //09 sep 1925
		$tahun   =substr($tgl, 6,11);
		$bulan   =substr($tgl, 3,3);
		$tanggal =substr($tgl, 0,2);
		return $tahun.'-'.getBulan2($bulan).'-'.$tanggal;
	}function getBulan2($b){
		$blnArr=[
			'Jan'=>'01',
			'Feb'=>'02',
			'Mar'=>'03',
			'Apr'=>'04',
			'May'=>'05',
			'Jun'=>'06',
			'Jul'=>'07',
			'Aug'=>'08',
			'Sep'=>'09',
			'Okt'=>'10',
			'Nov'=>'11',
			'Des'=>'12'
		];return $blnArr[$b];	
	}
	function getBulan($bln){
				switch ($bln){
					case 1: 
						return "Januari";
						break;
					case 2:
						return "Februari";
						break;
					case 3:
						return "Maret";
						break;
					case 4:
						return "April";
						break;
					case 5:
						return "Mei";
						break;
					case 6:
						return "Juni";
						break;
					case 7:
						return "Juli";
						break;
					case 8:
						return "Agustus";
						break;
					case 9:
						return "September";
						break;
					case 10:
						return "Oktober";
						break;
					case 11:
						return "November";
						break;
					case 12:
						return "Desember";
						break;
				}
	}
	$MNTHN=Array('','January','February','March','April','May','June','July','August','September','October','November','December');
	$MNTHS=Array('','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');

	function diffDay($t1,$t2="",$a=false){
		if($t2=="") $t2=date("Y-m-d");
		$stamp1 = strtotime($t1);
		$stamp2 = strtotime($t2);
		$difstamp = $stamp1-$stamp2;
		$difday = intval(ceil($difstamp/86400));
		if($a) $difday=abs($difday);
		return $difday;
	}
	function fftgl($a){
		global $MNTHN;
		if($a=="" || $a=="0000-00-00") return "-";
		else{
		$b=explode("-",$a);
		return $MNTHN[intval($b[1])]." ".intval($b[2]).", ".$b[0];
		}
	}
?>