/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-12-11 05:02:11
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_dpeminjaman
-- ----------------------------
INSERT INTO `sar_dpeminjaman` VALUES ('10', '9', '10', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('11', '9', '65', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('12', '9', '67', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('13', '10', '394', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('14', '10', '427', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('15', '11', '10', '0000-00-00', '1');
INSERT INTO `sar_dpeminjaman` VALUES ('16', '11', '65', '0000-00-00', '1');
INSERT INTO `sar_dpeminjaman` VALUES ('17', '12', '67', '0000-00-00', '1');
INSERT INTO `sar_dpeminjaman` VALUES ('18', '12', '71', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('19', '12', '77', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('20', '12', '10', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('21', '13', '67', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('22', '13', '65', '0000-00-00', '0');
