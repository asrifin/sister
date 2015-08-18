/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-18 17:51:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mst_agama
-- ----------------------------
DROP TABLE IF EXISTS `mst_agama`;
CREATE TABLE `mst_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(20) NOT NULL,
  `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`agama`),
  UNIQUE KEY `UX_agama` (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mst_agama
-- ----------------------------
INSERT INTO `mst_agama` VALUES ('1', 'Budha', '5');
INSERT INTO `mst_agama` VALUES ('2', 'Hindu', '4');
INSERT INTO `mst_agama` VALUES ('3', 'Islam', '1');
INSERT INTO `mst_agama` VALUES ('4', 'Katolik', '2');
INSERT INTO `mst_agama` VALUES ('5', 'Protestan', '3');
