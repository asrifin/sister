/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-22 15:14:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_transaksi
-- ----------------------------
DROP TABLE IF EXISTS `keu_transaksi`;
CREATE TABLE `keu_transaksi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` int(10) unsigned NOT NULL DEFAULT '0',
  `nomer` varchar(50) NOT NULL,
  `nobukti` varchar(50) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `rekkas` int(10) unsigned NOT NULL DEFAULT '0',
  `rekitem` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `uraian` varchar(250) NOT NULL,
  `modul` int(10) unsigned NOT NULL DEFAULT '0',
  `kategori` int(10) unsigned NOT NULL DEFAULT '0',
  `pembayaran` int(10) unsigned NOT NULL DEFAULT '0',
  `penerimaanbrg` int(10) unsigned NOT NULL DEFAULT '0',
  `jenis` tinyint(4) NOT NULL DEFAULT '0',
  `budget` int(10) unsigned NOT NULL DEFAULT '0',
  `ct` int(10) unsigned NOT NULL DEFAULT '0',
  `detjenistrans` int(10) NOT NULL,
  `detilanggaran` int(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_transaksi
-- ----------------------------
INSERT INTO `keu_transaksi` VALUES ('1', '1', 'MMJ-0001/05/2015', 'ju1', '2015-05-22', '0', '0', '50000', 'u1', '0', '0', '0', '0', '0', '0', '0', '8', '0');
INSERT INTO `keu_transaksi` VALUES ('2', '1', 'BKM-0002/05/2015', '', '2015-05-22', '2', '18', '40000', 'in1', '0', '0', '0', '0', '0', '0', '0', '4', '0');
INSERT INTO `keu_transaksi` VALUES ('3', '1', 'BKK-0003/05/2015', 'ou1', '2015-05-22', '4', '33', '20000', 'ou1', '0', '0', '0', '0', '0', '0', '0', '7', '42');
INSERT INTO `keu_transaksi` VALUES ('4', '1', 'BKM-0004/05/2015', '', '2015-05-22', '1', '23', '60000', 'in2', '0', '0', '0', '0', '0', '0', '0', '4', '0');
INSERT INTO `keu_transaksi` VALUES ('5', '1', 'BKK-0005/05/2015', 'o2', '2015-05-22', '1', '85', '15000', 'out2', '0', '0', '0', '0', '0', '0', '0', '7', '39');
