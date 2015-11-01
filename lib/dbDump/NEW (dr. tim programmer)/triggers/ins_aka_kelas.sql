CREATE TRIGGER `ins_aka_kelas` AFTER INSERT ON `aka_kelas`
 FOR EACH ROW BEGIN

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