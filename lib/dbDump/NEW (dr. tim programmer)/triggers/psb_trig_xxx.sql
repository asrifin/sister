DROP TRIGGER IF EXISTS `ins_psb_biaya`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_biaya` AFTER INSERT ON `psb_biaya` FOR EACH ROW BEGIN

/*INSERT psb_detailbiaya */
/*detail detail gelombang -----------------------------------------------------------------------*/
	BLOCK1: begin
		declare vDetGelombang, vDept int;
		declare rowHabis1 INT DEFAULT 0;  
		declare cursor1 cursor for
								select replid,departemen
								from  psb_detailgelombang;
		declare continue handler for not found set rowHabis1 = 1;
		open cursor1;
		LOOP1: loop
			fetch cursor1
			into  vDetGelombang,vDept;
			if rowHabis1 then
							close cursor1;
							leave LOOP1;
			end if;
			/*subtingkat  ---------------------------------------------------------------*/
			BLOCK2: begin
					declare vSubtingkat int;
					declare rowsHabis2 INT DEFAULT 0;  
					declare cursor3 cursor for  
							SELECT s.replid
							FROM aka_kelas k
									JOIN aka_subtingkat s on s.replid = k.subtingkat
							WHERE k.departemen = vDept
							GROUP BY s.replid;
					declare continue handler for not found set rowsHabis2 =1;
					open cursor3;
					LOOP2: loop
									fetch cursor3
									into  vSubtingkat;
									if rowsHabis2 then   
													close cursor3;
													leave LOOP2;
									end if;
									/*golongan ---------------------------------------------------------------*/
									BLOCK3: begin
											declare vGolongan int;
											declare rowsHabis3 INT DEFAULT 0;  
											declare cursor4 cursor for
															select replid
															from  psb_golongan;
											declare continue handler for not found set rowsHabis3 =1;
											open cursor4;
											LOOP3: loop
												fetch cursor4
												into  vGolongan;
												if rowsHabis3 then
																close cursor4;
																leave LOOP3;
												end if;
		
												INSERT INTO psb_detailbiaya SET 
														biaya = NEW.replid, 
														subtingkat = vSubtingkat, 
														detailgelombang = vDetGelombang, 
														golongan = vGolongan;
											end loop LOOP3;
									end BLOCK3;
							end loop LOOP2;
					end BLOCK2;
		end loop LOOP1;
	end BLOCK1;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ins_psb_detailgelombang`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_detailgelombang` AFTER INSERT ON `psb_detailgelombang` FOR EACH ROW BEGIN

/*INSERT psb_detailbiaya FIX*/
/*subtingkat-----------------------------------------------------------------------*/
BLOCK2: begin
		declare v_col2 int;
		declare no_more_rows2 INT DEFAULT 0;  
		declare cursor2 cursor for
				SELECT s.replid
				FROM aka_kelas k
					JOIN aka_subtingkat s on s.replid = k.subtingkat
				WHERE k.departemen = NEW.departemen
				GROUP BY s.replid;
	 declare continue handler for not found
			 set no_more_rows2 =1;
		open cursor2;
		LOOP2: loop
				fetch cursor2
				into  v_col2;
				if no_more_rows2 then
						close cursor2;
						leave LOOP2;
				end if;
				/*biaya---------------------------------------------------------------*/
				BLOCK3: begin
							declare v_col3 int;
							declare no_more_rows3 INT DEFAULT 0;  
							declare cursor3 cursor for
									select replid
									from  psb_biaya;
						 declare continue handler for not found
								 set no_more_rows3 =1;
							open cursor3;
							LOOP3: loop
									fetch cursor3
									into  v_col3;
									if no_more_rows3 then
											close cursor3;
											leave LOOP3;
									end if;
									/*golongan ---------------------------------------------------------------*/
									BLOCK4: begin
												declare v_col4 int;
												declare no_more_rows4 INT DEFAULT 0;  
												declare cursor4 cursor for
														select replid
														from  psb_golongan;
											 declare continue handler for not found
													 set no_more_rows4 =1;
												open cursor4;
												LOOP4: loop
														fetch cursor4
														into  v_col4;
														if no_more_rows4 then
																close cursor4;
																leave LOOP4;
														end if;
									
														INSERT INTO psb_detailbiaya SET 
															biaya = v_col3, 
															subtingkat = v_col2, 
															detailgelombang = NEW.replid, 
															golongan = v_col4;
												end loop LOOP4;
									end BLOCK4;
						end loop LOOP3;
					end BLOCK3;
		end loop LOOP2;
end BLOCK2;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ins_psb_diskon`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_diskon` AFTER INSERT ON `psb_diskon` FOR EACH ROW BEGIN

/*untuk psb_detaildiskon*/
/*tahun ajaran*/
	BLOCK1: begin
		declare v_col1 int;
		declare no_more_rows1 INT DEFAULT 0;  
		declare cursor1 cursor for
				select replid
				from  aka_tahunajaran;
		declare continue handler for not found set no_more_rows1 =1;
		open cursor1;
		LOOP1: loop
				fetch cursor1
				into  v_col1;
				if no_more_rows1 then
						close cursor1;
						leave LOOP1;
				end if;

				INSERT INTO psb_detaildiskon SET 
					diskon = NEW.replid, 
					tahunajaran = v_col1;

		end loop LOOP1;
end BLOCK1;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ins_psb_gelombang`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_gelombang` AFTER INSERT ON `psb_gelombang` FOR EACH ROW BEGIN

/*untuk detail gelombang*/
/*departemen*/
BLOCK1: begin
    declare v_col1 int;                     
    declare no_more_rows1 INT DEFAULT 0;  
    declare cursor1 cursor for              
        select replid
        from departemen;
    declare continue handler for not found  
    		set no_more_rows1 =1;           
    open cursor1;
    LOOP1: loop
        fetch cursor1
        into  v_col1;
        if no_more_rows1 then
            close cursor1;
            leave LOOP1;
        end if;
				/*tahun ajaran*/
        BLOCK2: begin
            declare v_col2 int;
            declare no_more_rows2 INT DEFAULT 0;  
						declare cursor2 cursor for
                select replid
                from  aka_tahunajaran;
						declare continue handler for not found
               set no_more_rows2 =1;
            open cursor2;
            LOOP2: loop
                fetch cursor2
                into  v_col2;
                if no_more_rows2 then
                    close cursor2;
                    leave LOOP2;
                end if;
								INSERT INTO psb_detailgelombang SET 
									gelombang = NEW.replid, 
            			departemen = v_col1, 
            			tahunajaran = v_col2;
            end loop LOOP2;
        end BLOCK2;
    end loop LOOP1;
end BLOCK1;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ins_psb_golongan`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_golongan` AFTER INSERT ON `psb_golongan` FOR EACH ROW BEGIN

/*INSERT psb_detailbiaya*/
/*subtingkat-----------------------------------------------------------------------*/
BLOCK2: begin
		declare v_col2 int;
		declare no_more_rows2 INT DEFAULT 0;  
		declare cursor2 cursor for
				SELECT s.replid
				FROM aka_kelas k
					JOIN aka_subtingkat s on s.replid = k.subtingkat
				GROUP BY s.replid;
	 declare continue handler for not found
			 set no_more_rows2 =1;
		open cursor2;
		LOOP2: loop
				fetch cursor2
				into  v_col2;
				if no_more_rows2 then
						close cursor2;
						leave LOOP2;
				end if;
				/*biaya---------------------------------------------------------------*/
				BLOCK3: begin
							declare v_col3 int;
							declare no_more_rows3 INT DEFAULT 0;  
							declare cursor3 cursor for
									select replid
									from  psb_biaya;
						 declare continue handler for not found
								 set no_more_rows3 =1;
							open cursor3;
							LOOP3: loop
									fetch cursor3
									into  v_col3;
									if no_more_rows3 then
											close cursor3;
											leave LOOP3;
									end if;
									/*detail gelombang---------------------------------------------------------------*/
									BLOCK4: begin
												declare v_col4 int;
												declare no_more_rows4 INT DEFAULT 0;  
												declare cursor4 cursor for
														select replid
														from  psb_detailgelombang;
											 declare continue handler for not found
													 set no_more_rows3 =1;
												open cursor4;
												LOOP4: loop
														fetch cursor4
														into  v_col4;
														if no_more_rows4 then
																close cursor4;
																leave LOOP4;
														end if;
									
														INSERT INTO psb_detailbiaya SET 
															biaya = v_col3, 
															subtingkat = v_col2, 
															detailgelombang = v_col4, 
															golongan = NEW.replid;
												end loop LOOP4;
									end BLOCK4;
						end loop LOOP3;
					end BLOCK3;
		end loop LOOP2;
end BLOCK2;
END
;;
DELIMITER ;
