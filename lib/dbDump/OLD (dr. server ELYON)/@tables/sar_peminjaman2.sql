/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-12-08 21:11:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sar_peminjaman2
-- ----------------------------
DROP TABLE IF EXISTS `sar_peminjaman2`;
CREATE TABLE `sar_peminjaman2` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `peminjam` varchar(100) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_peminjaman2
-- ----------------------------
INSERT INTO `sar_peminjaman2` VALUES ('1', 'kurniawan', '2013-09-06', '2013-09-07', '');
INSERT INTO `sar_peminjaman2` VALUES ('2', 'joko', '2013-09-17', '2013-09-18', '');
INSERT INTO `sar_peminjaman2` VALUES ('3', 'hadi', '2013-09-17', '2013-09-18', '');
INSERT INTO `sar_peminjaman2` VALUES ('4', 'sule', '0000-00-00', '0000-00-00', '');
INSERT INTO `sar_peminjaman2` VALUES ('5', 'suryo', '0000-00-00', '0000-00-00', '');
