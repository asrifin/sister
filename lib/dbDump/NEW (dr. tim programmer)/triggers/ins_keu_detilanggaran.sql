CREATE TRIGGER `ins_keu_detilanggaran` AFTER INSERT ON `keu_detilanggaran`
 FOR EACH ROW BEGIN

/* tahun ajaran ---------------------------------------------------------------*/
BLOCK1: begin
		declare vTahunajaran int;
		declare rowsHabis1 INT DEFAULT 0;  
		declare cursor1 cursor for  
				SELECT replid FROM aka_tahunajaran ;
		declare continue handler for not found set rowsHabis1 =1;
		open cursor1;
		LOOP1: loop
						fetch cursor1
						into  vTahunajaran;
						if rowsHabis1 then  close cursor1; leave LOOP1;
						end if;
						/*insert saldo rekening ---------------------------------------------------------------*/
						INSERT INTO keu_anggarantahunan SET 
								detilanggaran = NEW.replid, 
								tahunajaran = vTahunajaran;
				end loop LOOP1;
		end BLOCK1;
END