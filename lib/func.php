<?php
/* common*/
	function filter($str){
		$str = mysql_real_escape_string(htmlentities($str));
		return $str;
	}function getuang($str){
		$old = array('Rp. ',',','.');
		$new = array('','','');
		$x   = str_replace($old,$new, $str);
		return $x;
	}

/*keuangan*/
	// transaksi
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