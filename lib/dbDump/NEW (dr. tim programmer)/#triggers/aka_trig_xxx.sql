DROP TRIGGER IF EXISTS `ins_aka_kelas`;
DELIMITER ;;
CREATE TRIGGER `ins_aka_kelas` AFTER INSERT ON `aka_kelas` FOR EACH ROW BEGIN

/*untuk aka_detailkelas*/
BLOCK1: begin
    declare v_col1 int;                     
    declare no_more_rows1 INT DEFAULT 0;  
    declare cursor1 cursor for              
        select replid
        from  aka_tahunajaran;
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
        INSERT INTO aka_detailkelas SET 
          kelas = NEW.replid, 
          tahunajaran = v_col1;
    end loop LOOP1;
end BLOCK1;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ins_aka_subtingkat`;
DELIMITER ;;
CREATE TRIGGER `ins_aka_subtingkat` AFTER INSERT ON `aka_subtingkat` FOR EACH ROW BEGIN

/*INSERT psb_detailbiaya*/
/*detailgelombang-----------------------------------------------------------------------*/
BLOCK2: begin
    declare v_col2 int;
    declare no_more_rows2 INT DEFAULT 0;  
    declare cursor2 cursor for
        SELECT s.replid
        FROM aka_kelas k
          JOIN aka_subtingkat s on s.replid = k.subtingkat
        WHERE k.departemen = v_col1
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
DROP TRIGGER IF EXISTS `ins_aka_tahunajaran`;
DELIMITER ;;
CREATE TRIGGER `ins_aka_tahunajaran` AFTER INSERT ON `aka_tahunajaran` FOR EACH ROW BEGIN

/*untuk psb_deteailgelombang*/
BLOCK1: begin
    declare v_col1 int;                     
    declare no_more_rows1 INT DEFAULT 0;  
    declare cursor1 cursor for              
        select replid
        from  psb_gelombang;
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
        BLOCK2: begin
            declare v_col2 int;
            declare no_more_rows2 INT DEFAULT 0;  
						declare cursor2 cursor for
                select replid
                from  departemen;
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
									tahunajaran = NEW.replid, 
            			gelombang  = v_col1, 
            			departemen = v_col2;
            end loop LOOP2;
        end BLOCK2;
    end loop LOOP1;
end BLOCK1;

/*untuk psb_detaildiskon*/
/*diskon*/
BLOCK3: begin
    declare v_col3 int;                     
    declare no_more_rows3 INT DEFAULT 0;  
    declare cursor3 cursor for              
        select replid
        from   psb_diskon;
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
				INSERT INTO psb_detaildiskon SET 
					tahunajaran = NEW.replid, 
					diskon = v_col3;
    end loop LOOP3;
end BLOCK3;

/*untuk aka_detailkelas*/
BLOCK5: begin
    declare v_col5 int;                     
    declare no_more_rows5 INT DEFAULT 0;  
    declare cursor5 cursor for              
        select replid
        from  aka_kelas;
    declare continue handler for not found  
    		set no_more_rows5 =1;           
    open cursor5;
    LOOP5: loop
        fetch cursor5
        into  v_col5;
        if no_more_rows5 then
            close cursor5;
            leave LOOP5;
        end if;
				INSERT INTO aka_detailkelas SET 
					tahunajaran = NEW.replid, 
					kelas = v_col5;
    end loop LOOP5;
end BLOCK5;

/*untuk aka_detailkelas*/
BLOCK6: begin
		DECLARE hasil INT DEFAULT 0;
		SET @i= 1;
		WHILE @i <= 2 DO
			INSERT INTO aka_semester SET 	tahunajaran = NEW.replid,semester = i;
			SET @i= @i+1;
		END WHILE;
end BLOCK6;

END
;;
DELIMITER ;
