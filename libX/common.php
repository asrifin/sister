<?php
	function loginCheck(){
		$user = gpost('uname');
		$pass = md5(gpost('passwd'));
		$t      = mysql_query("SELECT * FROM admin WHERE uname='$uname' AND passwd='$passwd'");
		if(mysql_num_rows($t)==1){
			$r=mysql_fetch_array($t);
			if($r['app']==APID || $r['level']==1){
				$_SESSION[ASID.'admin_id']      =$r['replid'];
				$_SESSION[ASID.'admin_name']    =$r['nama'];
				$_SESSION[ASID.'admin_uname']   =$r['uname'];
				$_SESSION[ASID.'admin_level']   =$r['level'];
				$_SESSION[ASID.'admin_dept']    =$r['departemen'];
				$_SESSION[ASID.'admin_pegawai'] =$r['pegawai'];
				$_SESSION[ASID.'admin_bahasa']  =$r['bahasa'];
				dbUpdate("admin",Array('tlogin'=>date("Y-m-d H:i:s")),"replid='".$r['replid']."'");
				echo $r['nama'];
			} else {
				echo "0";
			//echo $r['nama'];
			}
		}else {
			//echo $r['nama'];
			echo "0";
		}
	}
?>