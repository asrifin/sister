/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-03-30 15:38:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for privillege
-- ----------------------------
DROP TABLE IF EXISTS `privillege`;
CREATE TABLE `privillege` (
  `id_privillege` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_privillege`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of privillege
-- ----------------------------
INSERT INTO `privillege` VALUES ('1', '1', '1', '1');
INSERT INTO `privillege` VALUES ('2', '1', '1', '2');
INSERT INTO `privillege` VALUES ('3', '1', '1', '3');
INSERT INTO `privillege` VALUES ('4', '1', '1', '4');
INSERT INTO `privillege` VALUES ('5', '1', '1', '8');
