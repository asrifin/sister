/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-17 00:00:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_jenislaporan
-- ----------------------------
DROP TABLE IF EXISTS `keu_jenislaporan`;
CREATE TABLE `keu_jenislaporan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` enum('in','out') NOT NULL DEFAULT 'in',
  `kategori` enum('o','n') NOT NULL DEFAULT 'o',
  `rekening` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jenislaporan
-- ----------------------------
INSERT INTO `keu_jenislaporan` VALUES ('7', 'in', 'o', '203');
INSERT INTO `keu_jenislaporan` VALUES ('8', 'in', 'o', '195');
INSERT INTO `keu_jenislaporan` VALUES ('9', 'in', 'o', '210');
INSERT INTO `keu_jenislaporan` VALUES ('10', 'in', 'o', '119');
INSERT INTO `keu_jenislaporan` VALUES ('11', 'in', 'n', '194');
INSERT INTO `keu_jenislaporan` VALUES ('12', 'out', 'o', '219');
INSERT INTO `keu_jenislaporan` VALUES ('13', 'out', 'o', '30');
INSERT INTO `keu_jenislaporan` VALUES ('14', 'out', 'o', '54');
