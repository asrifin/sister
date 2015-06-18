<?php
	// bulan
	// $bulanArr=[
	// 	'Jan'=>'01',
	// 	'Feb'=>'02',
	// 	'Mar'=>'03',
	// 	'Apr'=>'04',
	// 	'May'=>'05',
	// 	'Jun'=>'06',
	// 	'Jul'=>'07',
	// 	'Aug'=>'08',
	// 	'Sep'=>'09',
	// 	'Oct'=>'10',
	// 	'Nov'=>'11',
	// 	'Dec'=>'12'
	// ];

	function bln_nama($bln,$neg,$typ){ // (1,'id','c')
		if ($neg=='id') {
			if($typ=='c') //long
				$arr=['Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];
			else //short
				$arr=['Jan','Feb','Mar','Apr','Mei','Jun','Jul','Ags','Sep','Okt','Nov','Des'];
		}else{
			if($typ=='c') //long
				$arr=['January','February','March','April','May','June','July','August','September','October','November','December'];
			else
				$arr=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
		}return $arr[$bln-1]; 
	}
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
	}function tgl_indo3($tgl){ // 2012-05-25
			$bulan		= substr($tgl,0,2);
			$tanggal 	= substr($tgl,3,2);
			$tahun 		= substr($tgl,6,4);
			return $tahun.'-'.$bulan.'-'.$tanggal;		 
	}function tgl_indo4($tgl){ //05/29/2012
			$tahun 		= substr($tgl,2,2);
			$bulan		= substr($tgl,5,2);
			$tanggal 	= substr($tgl,8,2);
			return $bulan.'/'.$tanggal.'/'.$tahun;		 
	}function tgl_indo5($tgl){ //from 2012-09-29 --> 29 Sep 2012 
		$tahun 		= substr($tgl,0,4);
		$bulan 		= getBulan(substr($tgl,5,2));
		$bulan		= substr($bulan,0,3);
		$tanggal 	= substr($tgl,8,2);
		return $tanggal.' '.$bulan.' '.$tahun;		 
	}function tgl_indo6($tgl){ //from 09 Sep 2012 --> 2012-05-09
		$tahun   =substr($tgl, 7,11);
		$bulan   =substr($tgl, 3,3);
		$tanggal =substr($tgl, 0,2);
		// var_dump($tahun.'-'.getBulan2($bulan).'-'.$tanggal);exit();
		return $tahun.'-'.getBulan2($bulan).'-'.$tanggal;
	}function tgl_indo7($tgl){ //from 2012-05-09 --> 09 Sep 2012
		$tahun   =substr($tgl,0,4);
		$bulan   =substr($tgl,5,2);
		$tanggal =substr($tgl,8,2);
		$bulanArr=[
			'Jan'=>'01',
			'Feb'=>'02',
			'Mar'=>'03',
			'Apr'=>'04',
			'May'=>'05',
			'Jun'=>'06',
			'Jul'=>'07',
			'Aug'=>'08',
			'Sep'=>'09',
			'Oct'=>'10',
			'Nov'=>'11',
			'Dec'=>'12'
		];return $tanggal.' '.array_search($bulan,$bulanArr).' '.$tahun;
	}function tgl_indo8($tgl){ //from 2012-05-09 --> 09 September 2012
		$tahun   =substr($tgl,0,4);
		$bul     =substr($tgl,5,2);
		$tanggal =substr($tgl,8,2);
		$bulan   = bln_nama($bul,'id','c');
		// var_dump($bulan);exit();
		return $tanggal.' '.$bulan.' '.$tahun;
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
			'Oct'=>'10',
			'Nov'=>'11',
			'Dec'=>'12'
 		];
 		// var_dump($blnArr[$b]);exit();	
 		return $blnArr[$b];	
	}
	// function getBulan($bln){
	// 			switch ($bln){
	// 				case 1: 
	// 					return "Jan";
	// 					break;
	// 				case 2:
	// 					return "Feb";
	// 					break;
	// 				case 3:
	// 					return "Mar";
	// 					break;
	// 				case 4:
	// 					return "Apr";
	// 					break;
	// 				case 5:
	// 					return "May";
	// 					break;
	// 				case 6:
	// 					return "Jun";
	// 					break;
	// 				case 7:
	// 					return "Jul";
	// 					break;
	// 				case 8:
	// 					return "Aug";
	// 					break;
	// 				case 9:
	// 					return "Sep";
	// 					break;
	// 				case 10:
	// 					return "Oct";
	// 					break;
	// 				case 11:
	// 					return "Nov";
	// 					break;
	// 				case 12:
	// 					return "Dec";
	// 					break;
	// 			}
	// }
	function getBulan($bln){
				switch ($bln){
					case 1: 
						return "January";
						break;
					case 2:
						return "February";
						break;
					case 3:
						return "March";
						break;
					case 4:
						return "April";
						break;
					case 5:
						return "May";
						break;
					case 6:
						return "June";
						break;
					case 7:
						return "July";
						break;
					case 8:
						return "August";
						break;
					case 9:
						return "September";
						break;
					case 10:
						return "October";
						break;
					case 11:
						return "November";
						break;
					case 12:
						return "December";
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