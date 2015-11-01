CREATE DEFINER=`root`@`localhost` FUNCTION `getStatusBayar`(`idsiswabiaya` INT) RETURNS varchar(25) CHARSET latin1
BEGIN
	DECLARE s varchar(25);
    declare terbayar  decimal default getBiayaTerbayar(idsiswabiaya);
    declare tagihan decimal default getBiayaNett(idsiswabiaya);
	
    IF terbayar = tagihan THEN SET s = 'lunas';
	ELSEIF terbayar =0 THEN SET s = 'belum';
	ELSE SET s = 'kurang';
	END IF;

	RETURN s;
END