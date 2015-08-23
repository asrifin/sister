/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-23 22:08:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for psb_gelombang
-- ----------------------------
DROP TABLE IF EXISTS `psb_gelombang`;
CREATE TABLE `psb_gelombang` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `gelombang` varchar(100) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `urutan` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_kelompokcalonsiswa_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psb_gelombang
-- ----------------------------
INSERT INTO `psb_gelombang` VALUES ('42', 'First Intake', 'gelombang pendaftaran pertama', '1', '2015-08-22 23:08:35');
INSERT INTO `psb_gelombang` VALUES ('43', 'Second Intake', 'gelombang pendaftaran kedua', '2', '2015-08-22 23:10:14');
DROP TRIGGER IF EXISTS `ins_psb_gelombang`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_gelombang` AFTER INSERT ON `psb_gelombang` FOR EACH ROW BEGIN
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
        BLOCK2: begin
            declare v_col2 int;
            /*declare no_more_rows2 boolean := FALSE;*/
            declare no_more_rows2 INT DEFAULT 0;  
						declare cursor2 cursor for
                select replid
                from  aka_tahunajaran;
           declare continue handler for not found
               /*set no_more_rows2 := TRUE;*/
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
