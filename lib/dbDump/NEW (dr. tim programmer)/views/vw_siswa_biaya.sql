CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_siswa_biaya`AS 
SELECT
	s.replid idsiswa,
	db.replid iddetailbiaya,
	db.subtingkat idsubtingkat,
	db.biaya idbiaya,
	sb.replid idsiswabiaya,
	dg.replid iddetailgelombang,
	dg.departemen iddepartemen,
	dg.tahunajaran idtahunajaran
FROM
	psb_siswa s 
	JOIN psb_siswabiaya sb on sb.siswa = s.replid
	JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
	JOIN psb_detailgelombang dg on dg.replid = db.detailgelombang ;

