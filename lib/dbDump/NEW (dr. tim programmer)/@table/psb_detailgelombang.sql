/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-23 22:09:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for psb_detailgelombang
-- ----------------------------
DROP TABLE IF EXISTS `psb_detailgelombang`;
CREATE TABLE `psb_detailgelombang` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `gelombang` int(11) NOT NULL,
  `departemen` int(11) NOT NULL,
  `tahunajaran` int(11) NOT NULL,
  `tglmulai` date NOT NULL DEFAULT '0000-00-00',
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `gelombang` (`gelombang`) USING BTREE,
  KEY `departemen` (`departemen`) USING BTREE,
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  KEY `tahunajaran_2` (`tahunajaran`),
  KEY `departemen_2` (`departemen`),
  CONSTRAINT `departemenFK` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gelombangFK` FOREIGN KEY (`gelombang`) REFERENCES `psb_gelombang` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tahunajaranFK3` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_detailgelombang
-- ----------------------------
INSERT INTO `psb_detailgelombang` VALUES ('39', '42', '1', '3', '0000-00-00', '0000-00-00', '2015-08-22 23:08:35');
INSERT INTO `psb_detailgelombang` VALUES ('40', '42', '1', '5', '2015-05-01', '2015-07-10', '2015-08-22 23:08:35');
INSERT INTO `psb_detailgelombang` VALUES ('41', '42', '2', '3', '0000-00-00', '0000-00-00', '2015-08-22 23:08:35');
INSERT INTO `psb_detailgelombang` VALUES ('42', '42', '2', '5', '0000-00-00', '0000-00-00', '2015-08-22 23:08:35');
INSERT INTO `psb_detailgelombang` VALUES ('43', '42', '3', '3', '0000-00-00', '0000-00-00', '2015-08-22 23:08:35');
INSERT INTO `psb_detailgelombang` VALUES ('44', '42', '3', '5', '0000-00-00', '0000-00-00', '2015-08-22 23:08:35');
INSERT INTO `psb_detailgelombang` VALUES ('45', '43', '1', '3', '0000-00-00', '0000-00-00', '2015-08-22 23:10:14');
INSERT INTO `psb_detailgelombang` VALUES ('46', '43', '1', '5', '2015-10-01', '2016-01-10', '2015-08-22 23:10:14');
INSERT INTO `psb_detailgelombang` VALUES ('47', '43', '2', '3', '0000-00-00', '0000-00-00', '2015-08-22 23:10:14');
INSERT INTO `psb_detailgelombang` VALUES ('48', '43', '2', '5', '0000-00-00', '0000-00-00', '2015-08-22 23:10:14');
INSERT INTO `psb_detailgelombang` VALUES ('49', '43', '3', '3', '0000-00-00', '0000-00-00', '2015-08-22 23:10:14');
INSERT INTO `psb_detailgelombang` VALUES ('50', '43', '3', '5', '0000-00-00', '0000-00-00', '2015-08-22 23:10:14');
DROP TRIGGER IF EXISTS `ins_psb_detailgelombang`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_detailgelombang` AFTER INSERT ON `psb_detailgelombang` FOR EACH ROW BEGIN

/*untuk psb_biaya*/
BLOCK1: begin
    declare v_col1 int;                     
    declare no_more_rows1 INT DEFAULT 0;  
    /*tingkat*/
		declare cursor1 cursor for              
        select replid
        from  aka_tingkat;
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
				/*golongan*/
        BLOCK2: begin
            declare v_col2 int;
            declare no_more_rows2 INT DEFAULT 0;  
						declare cursor2 cursor for
                select replid
                from  psb_golongan;
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
								INSERT INTO psb_biaya SET 
									detailgelombang  = NEW.replid, 
            			tingkat = v_col1, 
            			golongan = v_col2;
            end loop LOOP2;
        end BLOCK2;
    end loop LOOP1;
end BLOCK1;

/*untuk psb_detaildiskontunai*/
BLOCK3: begin
    declare v_col3 int;                     
    declare no_more_rows3 INT DEFAULT 0;  
    declare cursor3 cursor for              
        select replid
        from   psb_diskontunai;
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
        BLOCK4: begin
            declare v_col4 int;
            declare no_more_rows4 INT DEFAULT 0;  
						declare cursor4 cursor for
                select replid
                from  departemen;
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
								INSERT INTO psb_detaildiskontunai SET 
									tahunajaran = NEW.replid, 
            			diskontunai = v_col3, 
            			departemen = v_col4;
            end loop LOOP4;
        end BLOCK4;
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

END
;;
DELIMITER ;
