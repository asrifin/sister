/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu_20150417

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-04-17 02:24:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_modulpembayaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_modulpembayaran`;
CREATE TABLE `keu_modulpembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `katmodulpembayaran` int(11) unsigned NOT NULL DEFAULT '0',
  `angkatan` int(10) unsigned NOT NULL DEFAULT '0',
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_modulpembayaran
-- ----------------------------
INSERT INTO `keu_modulpembayaran` VALUES ('1', '1', '1', 'Uang sekolah tahun ajaran 2014-2015 (Aktif)', '0', '201', '28', '5500000', '200', '78', '55666', 'ok banget');
INSERT INTO `keu_modulpembayaran` VALUES ('2', '2', '2', 'Pendaftaran Tahun Ajaran 2014-2015', '14', '0', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('3', '2', '92', 'Pendaftaran Tahun Ajaran 2014-2015', '6', '194', '0', '0', '0', '0', '0', 'Kaitlynn Tiffany');
INSERT INTO `keu_modulpembayaran` VALUES ('4', '3', '3', 'Uang pangkal angkatan 2013', '6', '194', '29', '0', '0', '0', '0', 'DPP');
INSERT INTO `keu_modulpembayaran` VALUES ('5', '0', '0', 'ok', '1', '194', '27', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('6', '2', '992', 'Uang pangkal angkatan 2014', '2', '197', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('7', '1', '4', 'Uang sekolah tahun ajaran 2013-2014', '4', '8', '8', '0', '0', '0', '0', 'ok');
INSERT INTO `keu_modulpembayaran` VALUES ('8', '2', '0', 'bayar banyu', '0', '0', '0', '890000000', '788899', '0', '0', 'yes');
INSERT INTO `keu_modulpembayaran` VALUES ('9', '2', '0', 'bayar banyu', '1', '194', '23', '890000000', '788899', '0', '0', 'yes');
INSERT INTO `keu_modulpembayaran` VALUES ('10', '2', '0', 'bayar utang', '1', '193', '22', '4908989', '908908', '0', '0', 'sip');
INSERT INTO `keu_modulpembayaran` VALUES ('12', '2', '8', 'OPO', '4', '0', '24', '78098098', '545555', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('13', '1', '1', 'sip', '4', '199', '0', '98000', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('14', '3', '8', 'jol', '4', '193', '22', '550000777', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('15', '3', '1', 'ooo', '1', '194', '0', '8789999', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('16', '3', '2', 'pendaftaran tahun ajaran 2014  - 2015 formulir', '2', '200', '0', '800000', '0', '0', '0', 'uang formulir = 300000\r\nuang joining fee = 500000');
