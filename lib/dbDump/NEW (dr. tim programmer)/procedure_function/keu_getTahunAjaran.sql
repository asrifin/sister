CREATE DEFINER = `root`@`localhost` FUNCTION `getTahunAjaran`(`tgl` date)
 RETURNS int(11)
BEGIN
	DECLARE idTahunAjaran INT;
	SELECT tahunajaran into idTahunAjaran
	FROM aka_semester 
	WHERE tgl BETWEEN tglMulai and tglSelesai;
	RETURN idTahunAjaran;
END;

