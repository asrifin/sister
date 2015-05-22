/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-22 15:14:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_modulpembayaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_modulpembayaran`;
CREATE TABLE `keu_modulpembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `katmodulpembayaran` int(11) NOT NULL DEFAULT '0',
  `angkatan` int(10) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `diskon` decimal(10,0) NOT NULL DEFAULT '0',
  `biayaadmin` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_modulpembayaran
-- ----------------------------
INSERT INTO `keu_modulpembayaran` VALUES ('31', '2', '4', 'DPP Angkatan 2014', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('27', '2', '1', 'DPP Angkatan 2013', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('39', '4', '2', 'Joining Fee Tahun  Angkatan 2014', '1', '195', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('4', '2', '3', 'DPP angkatan 2013', '6', '194', '29', '0', '0', '0', '0', 'DPP');
INSERT INTO `keu_modulpembayaran` VALUES ('7', '1', '4', 'Uang sekolah tahun ajaran 2013-2014', '4', '8', '8', '0', '0', '0', '0', 'ok');
INSERT INTO `keu_modulpembayaran` VALUES ('32', '3', '4', 'Pendaftaran Tahun Ajaran 2014 - 2015', '4', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('21', '3', '1', 'Pendaftaran Tahun Ajaran 2013 - 2014', '1', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('30', '1', '2', 'SPP Tahun ajaran 2014 - 2015', '1', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('24', '2', '7', 'DPP Angkatan 2015', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('29', '3', '2', 'Pendaftaran Tahun Ajaran 2014 - 2015', '1', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('16', '3', '3', 'Pendaftaran Tahun Ajaran 2014 - 2015 ', '2', '200', '0', '800000', '0', '0', '0', 'uang formulir = 300000\r\nuang joining fee = 500000');
INSERT INTO `keu_modulpembayaran` VALUES ('17', '1', '3', 'SPP Tahun Ajaran 2014 - 2015', '2', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('19', '1', '1', 'SPP Tahun Ajaran 2013 - 2014 ', '2', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('25', '3', '7', 'Pendaftaran Tahun Ajaran 2015 - 2016', '1', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('26', '1', '7', 'SPP Tahun Ajaran 2015 - 2016', '1', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('28', '2', '2', 'DPP Angkatan 2014', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('33', '2', '12', 'DPP Angkatan 2015', '4', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('34', '3', '12', 'Pendaftaran Tahun Ajaran 2015 -2016', '4', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('35', '1', '12', 'SPP Tahun Ajaran 2015 - 2016', '4', '203', '23', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('36', '2', '11', 'DPP Angkatan 2015', '2', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('37', '3', '11', 'Pendaftaran  Tahun Ajaran 2015 - 2016', '3', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('38', '1', '11', 'SPP Tahun Ajaran 2015 -2016', '4', '203', '0', '0', '0', '0', '0', '');
