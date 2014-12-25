/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-12-22 13:04:13
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_peminjaman2
-- ----------------------------
INSERT INTO `sar_peminjaman2` VALUES ('14', '1', 'sari puspa', '2014-12-05', '2014-12-12', '');
INSERT INTO `sar_peminjaman2` VALUES ('15', '1', 'H. subur', '2014-12-11', '2014-12-18', 'untuk mengecat kelas');
INSERT INTO `sar_peminjaman2` VALUES ('16', '1', 'p. sumarno', '2014-12-11', '2014-12-16', 'acara workshop IT');
INSERT INTO `sar_peminjaman2` VALUES ('17', '1', 'paijo', '2014-12-18', '2014-12-19', '');
INSERT INTO `sar_peminjaman2` VALUES ('18', '1', 'marijan', '2014-12-11', '2014-12-19', '');
