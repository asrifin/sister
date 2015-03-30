/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-01-06 17:12:59
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
  `status` int(2) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_dpeminjaman
-- ----------------------------
INSERT INTO `sar_dpeminjaman` VALUES ('23', '14', '11', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('24', '14', '74', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('25', '15', '11', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('26', '16', '394', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('27', '16', '427', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('28', '16', '251', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('29', '17', '65', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('30', '17', '415', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('31', '17', '10', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('32', '18', '65', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('33', '18', '11', '2014-12-17', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('34', '19', '65', '2014-12-22', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('35', '19', '67', '2014-12-23', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('36', '20', '65', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('37', '20', '75', '0000-00-00', '0');
INSERT INTO `sar_dpeminjaman` VALUES ('38', '20', '245', '2014-12-27', '0');
