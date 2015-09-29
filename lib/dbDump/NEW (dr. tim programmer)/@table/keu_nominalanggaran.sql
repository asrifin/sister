/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-09-27 12:05:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_nominalanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_nominalanggaran`;
CREATE TABLE `keu_nominalanggaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `anggarantahunan` int(11) NOT NULL,
  `bulan` int(2) NOT NULL,
  `jml` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `anggarantahunan` (`anggarantahunan`) USING BTREE,
  CONSTRAINT `anggarantahunanFK` FOREIGN KEY (`anggarantahunan`) REFERENCES `keu_anggarantahunan` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_nominalanggaran
-- ----------------------------
INSERT INTO `keu_nominalanggaran` VALUES ('1', '4', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('2', '4', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('3', '4', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('4', '4', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('5', '4', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('6', '4', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('7', '4', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('8', '4', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('9', '4', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('10', '4', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('11', '4', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('12', '4', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('13', '5', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('14', '5', '2', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('15', '5', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('16', '5', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('17', '5', '5', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('18', '5', '6', '11');
INSERT INTO `keu_nominalanggaran` VALUES ('19', '5', '7', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('20', '5', '8', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('21', '5', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('22', '5', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('23', '5', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('24', '5', '12', '0');
