CREATE DEFINER=`root`@`localhost` FUNCTION `getBiayaAfterDiskonReg`(`idsiswabiaya` INT) RETURNS decimal(14,0)
    READS SQL DATA
BEGIN
		declare biayaAfterDR DECIMAL default getBiayaAwal(idsiswabiaya);
		declare vDiskon FLOAT;
		declare rowHabis1 INT DEFAULT 0;  
		declare cursor1 cursor for
			SELECT
				dd.nilai
			FROM
				psb_siswadiskon sd
				JOIN psb_detaildiskon dd on dd.replid = sd.detaildiskon
			WHERE
				sd.siswabiaya = idsiswabiaya;
		declare continue handler for not found set rowHabis1 = 1;
		open cursor1;
		LOOP1: loop
			fetch cursor1
			into  vDiskon;
			if rowHabis1 then close cursor1; leave LOOP1;
			end if;
			
			SET biayaAfterDR=biayaAfterDR-(biayaAfterDR*vDiskon/100);
		END loop LOOP1;
		return biayaAfterDR;
END