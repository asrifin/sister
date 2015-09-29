/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-09-27 11:45:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_anggarantahunan
-- ----------------------------
DROP TABLE IF EXISTS `keu_anggarantahunan`;
CREATE TABLE `keu_anggarantahunan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(11) NOT NULL,
  `hargasatuan` decimal(14,0) NOT NULL DEFAULT '0',
  `tahunajaran` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `detilanggaran` (`detilanggaran`) USING BTREE,
  KEY `tahunajaran` (`tahunajaran`) USING BTREE,
  CONSTRAINT `keu_anggarantahunan_ibfk_1` FOREIGN KEY (`detilanggaran`) REFERENCES `keu_detilanggaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tahunajaranFK4` FOREIGN KEY (`tahunajaran`) REFERENCES `aka_tahunajaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_anggarantahunan
-- ----------------------------
INSERT INTO `keu_anggarantahunan` VALUES ('4', '3', '3300000', '3');
INSERT INTO `keu_anggarantahunan` VALUES ('5', '3', '6500000', '5');
DROP TRIGGER IF EXISTS `ins_keu_anggarantahunan`;
DELIMITER ;;
CREATE TRIGGER `ins_keu_anggarantahunan` AFTER INSERT ON `keu_anggarantahunan` FOR EACH ROW BEGIN

declare i int DEFAULT 1;
	WHILE i <=12 DO
		INSERT INTO keu_nominalanggaran SET 
			anggarantahunan = NEW.replid, 
			bulan = i;
		SET i:=i+1;
    END WHILE;
END
;;
DELIMITER ;
