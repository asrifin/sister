/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-13 08:03:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sar_aktivitas
-- ----------------------------
DROP TABLE IF EXISTS `sar_aktivitas`;
CREATE TABLE `sar_aktivitas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `aktivitas` text,
  `lokasi` int(10) unsigned NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgltagihan` date NOT NULL,
  `tglpelunasan` date NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `IX_aktivitas_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_aktivitas
-- ----------------------------
INSERT INTO `sar_aktivitas` VALUES ('30', '2015-06-03', '2015-06-10', 'perbaikan taman', '1', 'perbaikan taman menyambut HUT kemerdeka RI', '2015-06-01 19:10:17', '0000-00-00', '0000-00-00');
INSERT INTO `sar_aktivitas` VALUES ('31', '2015-06-01', '2015-06-01', 'okkokok', '1', '', '2015-06-01 20:05:23', '0000-00-00', '0000-00-00');
INSERT INTO `sar_aktivitas` VALUES ('32', '2015-06-13', '2015-06-13', 'bersih bersih', '1', 'ok', '2015-06-13 04:01:52', '0000-00-00', '0000-00-00');
