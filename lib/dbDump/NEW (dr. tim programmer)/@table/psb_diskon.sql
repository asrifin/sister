/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-27 19:39:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for psb_diskon
-- ----------------------------
DROP TABLE IF EXISTS `psb_diskon`;
CREATE TABLE `psb_diskon` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `departemen` int(11) NOT NULL,
  `diskon` varchar(50) NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `departemen` (`departemen`) USING BTREE,
  CONSTRAINT `departemenFK3` FOREIGN KEY (`departemen`) REFERENCES `departemen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_diskon
-- ----------------------------
INSERT INTO `psb_diskon` VALUES ('20', '1', 'jemaat GKA', '( DPP ) Second Intake // ( SPP ) untuk anak ke 3 berdasarkan urutan kelahiran // ( SPP ) untuk ortu jemaat aktif GKA Elyon // ( SPP ) untuk anak sekolah minggu aktif GKA Elyon\r\n');
INSERT INTO `psb_diskon` VALUES ('21', '1', 'anak ke-2', 'Tambahan subsidi ( DPP ) untuk anak ke 2 dan selanjutnya // ( SPP ) untuk anak ke 2 berdasarkan urutan kelahiran');
INSERT INTO `psb_diskon` VALUES ('22', '1', 'hamba Tuhan', 'Subsidi ( DPP ) untuk hamba Tuhan di luar GKA Elyon &amp;amp; Calon Siswa Baru Secondary\\n\\n// ( DPP ) untuk : Guru full timer,staff,Kepsek, dengan masa kerja kurang dari 2 th');
INSERT INTO `psb_diskon` VALUES ('23', '1', 'anak ke-4', '( DPP ) First Intake, Siswa Baru High School // ( SPP ) anak ke 4 sesuai urutan kelahiran, High School 2 th ajaran, siswa secondary suko 1 th ajaran');
INSERT INTO `psb_diskon` VALUES ('24', '1', 'naik jenjang', 'first intake naik jenjang');
INSERT INTO `psb_diskon` VALUES ('25', '1', 'JAPRES', 'siswa jalur prestasi');
INSERT INTO `psb_diskon` VALUES ('26', '1', 'pengurus', 'pengurus PPK Elyon, Hamba Tuhan GKA Elyon, Guru Full Timer, Staff, Kepsek');
INSERT INTO `psb_diskon` VALUES ('27', '1', 'DPP ', '( DPP ) second intake untuk siswa dalam // ( SPP ) ortu jemaat &amp; anak sekolah minggu ELYON, secondary rungkut 2 th ajaran // Permohonan khusus melalui disposisi untuk siswa baru yg memiliki sibling');
INSERT INTO `psb_diskon` VALUES ('28', '1', 'prestasi - ekonomi', 'siswa berprestasi dan kurang mampu');
DROP TRIGGER IF EXISTS `ins_psb_diskon`;
DELIMITER ;;
CREATE TRIGGER `ins_psb_diskon` AFTER INSERT ON `psb_diskon` FOR EACH ROW BEGIN
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
					INSERT INTO psb_detaildiskon SET 
						diskon = NEW.replid, 
						tahunajaran = v_col2;
			end loop LOOP2;
	end BLOCK2;
END
;;
DELIMITER ;
