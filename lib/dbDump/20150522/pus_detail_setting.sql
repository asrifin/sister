/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-28 16:27:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pus_detail_setting
-- ----------------------------
DROP TABLE IF EXISTS `pus_detail_setting`;
CREATE TABLE `pus_detail_setting` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kunci` int(11) NOT NULL DEFAULT '0',
  `nilai` varchar(200) NOT NULL,
  `keterangan` text NOT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1',
  `urut` int(2) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pus_detail_setting
-- ----------------------------
INSERT INTO `pus_detail_setting` VALUES ('1', '1', 'nomorauto.5', '', '1', '1');
INSERT INTO `pus_detail_setting` VALUES ('2', '1', 'sumber', '', '1', '2');
INSERT INTO `pus_detail_setting` VALUES ('3', '1', 'sistem', 'SISTER', '1', '3');
INSERT INTO `pus_detail_setting` VALUES ('4', '1', 'tahun', '', '1', '4');
INSERT INTO `pus_detail_setting` VALUES ('5', '1', 'tingkatbuku', '', '1', '5');
INSERT INTO `pus_detail_setting` VALUES ('6', '2', 'nomorauto.5', '', '1', '0');
INSERT INTO `pus_detail_setting` VALUES ('7', '2', 'sumber', '', '1', '0');
INSERT INTO `pus_detail_setting` VALUES ('8', '2', 'sistem', '', '1', '0');
INSERT INTO `pus_detail_setting` VALUES ('9', '2', 'tahun', '', '1', '0');
INSERT INTO `pus_detail_setting` VALUES ('10', '2', 'tingkatbuku', '', '1', '0');
