CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_siswa_kelas`AS 
SELECT
	s.replid idsiswa,
	sk.replid idsiswakelas,
	dk.replid iddetailkelas,
	k.replid idkelas,
	st.replid idsubtingkat,
	t.replid idtingkat,
	dk.tahunajaran idtahunajaran,
	k.departemen iddepartemen
FROM
	psb_siswa s
	JOIN aka_siswakelas sk on sk.siswa = s.replid
	JOIN aka_detailkelas dk on dk.replid = sk.detailkelas
	JOIN aka_kelas k on k.replid = dk.kelas
	JOIN aka_subtingkat st on st.replid = k.subtingkat
	JOIN aka_tingkat t on t.replid = st.tingkat ;

