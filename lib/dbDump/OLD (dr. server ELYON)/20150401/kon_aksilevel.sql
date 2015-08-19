/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-04-01 14:49:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kon_aksilevel
-- ----------------------------
DROP TABLE IF EXISTS `kon_aksilevel`;
CREATE TABLE `kon_aksilevel` (
  `id_aksilevel` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `aksi` int(11) NOT NULL,
  PRIMARY KEY (`id_aksilevel`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_aksilevel
-- ----------------------------
INSERT INTO `kon_aksilevel` VALUES ('1', '1', '1');
INSERT INTO `kon_aksilevel` VALUES ('2', '1', '2');
INSERT INTO `kon_aksilevel` VALUES ('3', '1', '3');
INSERT INTO `kon_aksilevel` VALUES ('4', '1', '4');
INSERT INTO `kon_aksilevel` VALUES ('5', '1', '5');
INSERT INTO `kon_aksilevel` VALUES ('6', '1', '6');
INSERT INTO `kon_aksilevel` VALUES ('7', '2', '1');
INSERT INTO `kon_aksilevel` VALUES ('8', '2', '2');
INSERT INTO `kon_aksilevel` VALUES ('9', '2', '3');
INSERT INTO `kon_aksilevel` VALUES ('10', '2', '4');
INSERT INTO `kon_aksilevel` VALUES ('11', '2', '5');
INSERT INTO `kon_aksilevel` VALUES ('12', '2', '6');
INSERT INTO `kon_aksilevel` VALUES ('13', '3', '1');
INSERT INTO `kon_aksilevel` VALUES ('14', '3', '2');
INSERT INTO `kon_aksilevel` VALUES ('15', '3', '3');
INSERT INTO `kon_aksilevel` VALUES ('16', '3', '4');
INSERT INTO `kon_aksilevel` VALUES ('17', '3', '5');
