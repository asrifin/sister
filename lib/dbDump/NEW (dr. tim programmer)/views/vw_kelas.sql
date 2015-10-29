CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_kelas`AS 
SELECT
	t.replid idtingkat,
	t.tingkat,
	t.urutan,
	st.replid idsubtingkat,
	st.subtingkat,
	k.replid idkelas,
	k.kelas,
	k.departemen iddepartemen,
	dk.replid iddetailkelas,
	dk.tahunajaran idtahunajaran
FROM
	aka_tingkat t 
	JOIN aka_subtingkat st on st.tingkat = t.replid 
	JOIN aka_kelas k on k.subtingkat = st.replid
	JOIN aka_detailkelas dk on dk.kelas = k.replid 
ORDER BY
	t.urutan ASC,
	st.subtingkat ASC,
	k.kelas ASC ;

