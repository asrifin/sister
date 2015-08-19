/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-01-06 17:10:55
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_peminjaman2
-- ----------------------------
INSERT INTO `sar_peminjaman2` VALUES ('14', '1', 'sari puspa', '2014-12-05', '2014-12-12', '');
INSERT INTO `sar_peminjaman2` VALUES ('15', '1', 'H. subur', '2014-12-11', '2014-12-18', 'untuk mengecat kelas');
INSERT INTO `sar_peminjaman2` VALUES ('16', '1', 'p. sumarno', '2014-12-11', '2014-12-16', 'acara workshop IT');
INSERT INTO `sar_peminjaman2` VALUES ('17', '1', 'paijo', '2014-12-18', '2014-12-19', '');
INSERT INTO `sar_peminjaman2` VALUES ('18', '1', 'marijan', '2014-12-11', '2014-12-19', '');
INSERT INTO `sar_peminjaman2` VALUES ('19', '1', 'sofi', '2014-12-19', '2014-12-25', 'oke bos');
INSERT INTO `sar_peminjaman2` VALUES ('20', '1', 'ok', '0000-00-00', '0000-00-00', '');
