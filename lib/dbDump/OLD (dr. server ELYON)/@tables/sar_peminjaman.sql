/*
Navicat MySQL Data Transfer

Source Server         : locale
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : sister

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2014-12-19 14:43:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sar_peminjaman
-- ----------------------------
DROP TABLE IF EXISTS `sar_peminjaman`;
CREATE TABLE `sar_peminjaman` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lokasi` int(10) unsigned NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `barang` int(10) unsigned NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `lokasi_pinjam` int(10) unsigned NOT NULL,
  `lokasi_lain` varchar(250) NOT NULL,
  `tempat` varchar(200) NOT NULL,
  `kondisi` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keterangan` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sar_peminjaman
-- ----------------------------
INSERT INTO `sar_peminjaman` VALUES ('1', '1', 'Kurniawan', '5', '2013-09-06', '2013-09-07', '0', '', '', '1', '', '1');
INSERT INTO `sar_peminjaman` VALUES ('2', '1', 'Joko', '1', '2013-09-17', '2013-09-18', '0', '', '', '1', '', '0');
INSERT INTO `sar_peminjaman` VALUES ('3', '1', 'Joko', '3', '2013-09-17', '2013-09-18', '0', '', '', '1', '', '1');
INSERT INTO `sar_peminjaman` VALUES ('4', '1', 'Hadi', '5', '2013-09-17', '2013-09-18', '0', '', 'Gudang A', '1', '', '0');
INSERT INTO `sar_peminjaman` VALUES ('5', '1', 'Hadi', '16', '2013-09-17', '2013-09-18', '0', '', 'Gudang A', '1', '', '0');
INSERT INTO `sar_peminjaman` VALUES ('6', '1', 'Adi', '1', '2013-09-17', '2013-09-18', '0', '', 'Gudang B', '1', '', '1');
INSERT INTO `sar_peminjaman` VALUES ('7', '1', 'Adi', '2', '2013-09-17', '2013-09-18', '0', '', 'Gudang B', '1', '', '1');
INSERT INTO `sar_peminjaman` VALUES ('8', '1', 'Sule', '11', '2013-09-17', '2013-09-18', '0', '', 'Gudang C', '1', 'Rekomendasi Mr. Parto', '1');
INSERT INTO `sar_peminjaman` VALUES ('9', '1', 'a', '1', '2013-10-22', '2013-10-23', '0', '', 'b', '1', '', '1');
INSERT INTO `sar_peminjaman` VALUES ('10', '1', 'a', '2', '2013-10-22', '2013-10-23', '0', '', 'b', '1', '', '1');
INSERT INTO `sar_peminjaman` VALUES ('11', '1', 'suryo', '1', '2014-03-25', '2014-03-26', '0', '', 'gedung A', '1', '', '1');
