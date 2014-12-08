/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-12-08 21:12:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sar_dpeminjaman
-- ----------------------------
DROP TABLE IF EXISTS `sar_dpeminjaman`;
CREATE TABLE `sar_dpeminjaman` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `peminjaman` int(11) NOT NULL,
  `barang` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_dpeminjaman
-- ----------------------------
INSERT INTO `sar_dpeminjaman` VALUES ('1', '1', '5', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('2', '1', '0', '0000-00-00', '0');
