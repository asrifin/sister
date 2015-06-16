/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-17 00:01:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_nominalanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_nominalanggaran`;
CREATE TABLE `keu_nominalanggaran` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(10) NOT NULL,
  `bulan` int(2) NOT NULL,
  `jml` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_nominalanggaran
-- ----------------------------
INSERT INTO `keu_nominalanggaran` VALUES ('367', '62', '7', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('368', '62', '8', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('369', '62', '9', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('370', '62', '10', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('371', '62', '11', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('372', '62', '12', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('373', '62', '1', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('374', '62', '2', '40');
INSERT INTO `keu_nominalanggaran` VALUES ('375', '62', '3', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('376', '62', '4', '8');
INSERT INTO `keu_nominalanggaran` VALUES ('377', '62', '5', '8');
INSERT INTO `keu_nominalanggaran` VALUES ('378', '62', '6', '8');
INSERT INTO `keu_nominalanggaran` VALUES ('379', '63', '7', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('380', '63', '8', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('381', '63', '9', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('382', '63', '10', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('383', '63', '11', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('384', '63', '12', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('385', '63', '1', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('386', '63', '2', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('387', '63', '3', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('388', '63', '4', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('389', '63', '5', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('390', '63', '6', '1');
