/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-18 17:47:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for useraura
-- ----------------------------
DROP TABLE IF EXISTS `useraura`;
CREATE TABLE `useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','Payroll','HRD') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of useraura
-- ----------------------------
INSERT INTO `useraura` VALUES ('1', 'admin', '33c056145e9afecdab5706fe910a3ef9', 'reky@teamworks.co.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', '1', '2015-08-18 16:32:10', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>');
INSERT INTO `useraura` VALUES ('29', 'payroll', '4565d1e2d1d77302ef28fc09dfb0645c', 'payroll@payroll.com', '', 'Payroll', 'aktif', '1', '2015-08-07 13:48:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
INSERT INTO `useraura` VALUES ('27', 'hrd', 'b7223c17ba4885539b55f32e23757050', 'hrd@hrd.com', '', 'HRD', 'aktif', '0', '2015-07-28 08:04:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
INSERT INTO `useraura` VALUES ('28', 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'reky@teamworks.co.id', '', 'Administrator', 'aktif', '0', '2015-07-07 16:09:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
