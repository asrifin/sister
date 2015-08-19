/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-12-11 05:02:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sar_peminjaman2
-- ----------------------------
DROP TABLE IF EXISTS `sar_peminjaman2`;
CREATE TABLE `sar_peminjaman2` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi` int(11) NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_peminjaman2
-- ----------------------------
INSERT INTO `sar_peminjaman2` VALUES ('9', '1', 'parto', '2014-12-10', '2014-12-17', 'jangan telat ya');
INSERT INTO `sar_peminjaman2` VALUES ('10', '1', 'p. penjaga kantin', '2014-12-09', '2014-12-16', 'sip bos');
INSERT INTO `sar_peminjaman2` VALUES ('11', '1', 'einstein', '2014-12-11', '2014-12-17', 'ok');
INSERT INTO `sar_peminjaman2` VALUES ('12', '1', 'bajo', '2014-12-12', '2014-12-05', '');
INSERT INTO `sar_peminjaman2` VALUES ('13', '1', 'opo', '2014-12-12', '2014-12-18', '');
