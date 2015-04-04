<?php
	// session_start();
/* common*/
	function filter($str){
		$str = mysql_real_escape_string(htmlentities($str));
		return $str;
	}function getuang($str){
		$old = array('Rp. ',',','.');
		$new = array('','','');
		$x   = str_replace($old,$new, $str);
		return $x;
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