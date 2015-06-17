/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-17 20:05:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_tahunajaran
-- ----------------------------
DROP TABLE IF EXISTS `aka_tahunajaran`;
CREATE TABLE `aka_tahunajaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunajaran` varchar(50) NOT NULL,
  `departemen` int(10) unsigned NOT NULL,
  `tglmulai` date NOT NULL,
  `tglakhir` date NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `FK_tahunajaran_departemen` (`departemen`),
  KEY `IX_tahunajaran_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_tahunajaran
-- ----------------------------
INSERT INTO `aka_tahunajaran` VALUES ('1', '2014-2015', '1', '2014-07-01', '2015-06-30', '1', 'ok', '2014-01-22 23:49:44');
INSERT INTO `aka_tahunajaran` VALUES ('2', '2014-2015', '2', '2014-07-15', '2015-06-15', '1', '', '2014-03-19 04:36:55');
INSERT INTO `aka_tahunajaran` VALUES ('3', '2014-2015', '3', '2014-07-15', '2015-06-15', '1', '', '2014-03-19 04:37:57');
INSERT INTO `aka_tahunajaran` VALUES ('4', '2013-2014', '1', '2013-05-01', '2014-06-30', '0', 'ok', '2014-12-04 08:24:04');
INSERT INTO `aka_tahunajaran` VALUES ('5', '2015-2016', '3', '2015-01-01', '2016-02-01', '0', 'tes bro', '2015-01-28 08:57:00');
