<?php
	function keuField($f,$t,$w){
		$fi='';
		for ($i=0;$i<count($f); $i++) {
			if($i==count($f) OR count($f)==1) $fi.=$f[$i];
			else $fi.=$f[$i].',';
		}

		$s = 'SELECT '.$fi.'  from '.$t.' WHERE replid='.$w;
		$e = mysql_query($s)or die('error=> '.print_r($s));
		$r = mysql_fetch_assoc($e);
		$out = array();
		foreach ($f as $v) {
			$out[]=$r[$v];
		}return $out;
	}
?>