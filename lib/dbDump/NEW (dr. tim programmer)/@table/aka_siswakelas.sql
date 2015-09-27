/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sistermetta

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-09-27 10:52:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_siswakelas
-- ----------------------------
DROP TABLE IF EXISTS `aka_siswakelas`;
CREATE TABLE `aka_siswakelas` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `siswa` int(11) NOT NULL,
  `detailkelas` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `siswa` (`siswa`) USING BTREE,
  KEY `detailkelas` (`detailkelas`) USING BTREE,
  CONSTRAINT `detailkelas` FOREIGN KEY (`detailkelas`) REFERENCES `aka_detailkelas` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siswa` FOREIGN KEY (`siswa`) REFERENCES `psb_siswa` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of aka_siswakelas
-- ----------------------------
INSERT INTO `aka_siswakelas` VALUES ('48', '148', '2');
INSERT INTO `aka_siswakelas` VALUES ('49', '157', '2');
INSERT INTO `aka_siswakelas` VALUES ('50', '158', '2');
INSERT INTO `aka_siswakelas` VALUES ('51', '160', '2');
INSERT INTO `aka_siswakelas` VALUES ('52', '161', '2');
INSERT INTO `aka_siswakelas` VALUES ('53', '162', '2');
INSERT INTO `aka_siswakelas` VALUES ('54', '165', '2');
INSERT INTO `aka_siswakelas` VALUES ('55', '166', '2');
