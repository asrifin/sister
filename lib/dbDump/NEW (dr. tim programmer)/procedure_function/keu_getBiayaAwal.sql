CREATE DEFINER=`root`@`localhost` FUNCTION `getBiayaAwal`(`idsiswabiaya` INT) RETURNS decimal(11,0)
BEGIN
	DECLARE hasil int;
		SELECT
			db.nominal INTO hasil
		FROM  psb_siswabiaya sb 
			JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
		WHERE 
			sb.replid = idsiswabiaya;
	RETURN hasil;
END