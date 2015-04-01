/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-03-30 15:37:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for grupmenu
-- ----------------------------
DROP TABLE IF EXISTS `grupmenu`;
CREATE TABLE `grupmenu` (
  `id_grupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_modul` int(11) NOT NULL,
  `grupmenu` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of grupmenu
-- ----------------------------
INSERT INTO `grupmenu` VALUES ('1', '1', 'kesiswaan', 'four');
INSERT INTO `grupmenu` VALUES ('2', '1', 'Guru dan Pelajaran', 'four');
INSERT INTO `grupmenu` VALUES ('3', '1', 'referensi', 'four');
INSERT INTO `grupmenu` VALUES ('4', '2', 'ok', 'four');
INSERT INTO `grupmenu` VALUES ('5', '6', 'Transaksi Keuangan', 'four');
