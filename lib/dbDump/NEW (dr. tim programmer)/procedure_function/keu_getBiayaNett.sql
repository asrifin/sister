CREATE DEFINER=`root`@`localhost` FUNCTION `getBiayaNett`(`idsiswabiaya` int) RETURNS decimal(14,0)
BEGIN
	DECLARE ret decimal default getBiayaAfterDiskonReg(idsiswabiaya);
		declare r decimal;
        select ifnull(diskonkhusus,0)  into r 
        from psb_siswabiaya 
        where replid=idsiswabiaya;
	set ret=ret-r;
    RETURN ret;
END