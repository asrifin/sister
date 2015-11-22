/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-11-20 09:53:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for psb_biaya
-- ----------------------------
DROP TABLE IF EXISTS `psb_biaya`;
CREATE TABLE `psb_biaya` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `biaya` varchar(100) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `isAngsur` int(1) NOT NULL DEFAULT '1',
  `isDiskon` int(1) NOT NULL DEFAULT '0',
  `keterangan` text,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_biaya
-- ----------------------------
INSERT INTO `psb_biaya` VALUES ('3', 'Formulir', 'formulir', '0', '0', 'Formulr Pendafataran');
INSERT INTO `psb_biaya` VALUES ('4', 'DPP', 'dpp', '1', '3', 'Uang Gedung');
INSERT INTO `psb_biaya` VALUES ('7', 'SPP', 'spp', '0', '3', 'sumbangan per bulan ');
INSERT INTO `psb_biaya` VALUES ('8', 'Joining Fee', 'joining_fee', '1', '3', 'biaya yg dibayar sekali saat masuk');
INSERT INTO `psb_biaya` VALUES ('9', 'Lain - Lain', '', '1', '1', '');
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
