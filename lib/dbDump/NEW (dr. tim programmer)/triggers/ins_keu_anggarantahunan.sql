CREATE TRIGGER `ins_keu_anggarantahunan` AFTER INSERT ON `keu_anggarantahunan`
 FOR EACH ROW BEGIN

declare i int DEFAULT 1;
	WHILE i <=12 DO
		INSERT INTO keu_nominalanggaran SET 
			anggarantahunan = NEW.replid, 
			bulan = i;
		SET i:=i+1;
    END WHILE;
END