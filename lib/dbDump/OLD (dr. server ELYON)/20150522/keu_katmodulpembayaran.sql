/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-22 15:15:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_katmodulpembayaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_katmodulpembayaran`;
CREATE TABLE `keu_katmodulpembayaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `siswa` enum('aktif','calon') DEFAULT NULL,
  `sifat` enum('wajib','sukarela') DEFAULT NULL,
  `keterangan` text NOT NULL,
  `detjenistrans` int(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_katmodulpembayaran
-- ----------------------------
INSERT INTO `keu_katmodulpembayaran` VALUES ('1', 'SPP', 'aktif', 'wajib', 'sumbangan wajib tiap semester', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('2', 'DPP', 'aktif', 'wajib', 'uang gedung ', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('3', 'Formulir ', 'calon', 'wajib', 'biaya formulir untuk pendaftaran siswa baru ', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('4', 'Joining Fee', 'aktif', 'wajib', 'biaya Joining Fee untuk Pendaftaran Siswa Baru , dibayar di awal masuk\r\n', '1');
