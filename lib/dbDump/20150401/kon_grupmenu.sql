/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-04-01 14:49:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kon_grupmenu
-- ----------------------------
DROP TABLE IF EXISTS `kon_grupmenu`;
CREATE TABLE `kon_grupmenu` (
  `id_grupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_modul` int(11) NOT NULL,
  `grupmenu` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_grupmenu
-- ----------------------------
INSERT INTO `kon_grupmenu` VALUES ('1', '1', 'kesiswaan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('2', '1', 'Guru dan Pelajaran', 'four');
INSERT INTO `kon_grupmenu` VALUES ('3', '1', 'referensi', 'four');
INSERT INTO `kon_grupmenu` VALUES ('4', '2', 'ok', 'four');
INSERT INTO `kon_grupmenu` VALUES ('5', '6', 'Transaksi Keuangan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('6', '6', 'Referensi', 'four');
INSERT INTO `kon_grupmenu` VALUES ('7', '10', 'Sistem', 'four');
INSERT INTO `kon_grupmenu` VALUES ('8', '10', 'User', 'four');
