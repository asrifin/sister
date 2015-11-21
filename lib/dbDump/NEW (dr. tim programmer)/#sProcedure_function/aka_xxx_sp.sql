CREATE DEFINER=`root`@`localhost` PROCEDURE `listdept`()
BEGIN
		SELECT replid, nama departemen from departemen order by nama asc;
END