/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sisterdb

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-11-27 21:01:27
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
  `id_modul` int(11) NOT NULL,
  PRIMARY KEY (`id_privillege`),
  KEY `id_modul` (`id_modul`),
  KEY `id_departemen` (`id_departemen`),
  KEY `id_login` (`id_login`),
  KEY `id_login_2` (`id_login`),
  CONSTRAINT `privillege_ibfk_3` FOREIGN KEY (`id_modul`) REFERENCES `modul` (`id_modul`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `privillege_ibfk_4` FOREIGN KEY (`id_login`) REFERENCES `login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `privillege_ibfk_5` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of privillege
-- ----------------------------
INSERT INTO `privillege` VALUES ('1', '1', '1', '1');
INSERT INTO `privillege` VALUES ('2', '1', '1', '2');
INSERT INTO `privillege` VALUES ('3', '1', '1', '3');
