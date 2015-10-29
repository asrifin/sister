CREATE TRIGGER `ins_aka_subtingkat` AFTER INSERT ON `aka_subtingkat`
 FOR EACH ROW BEGIN

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