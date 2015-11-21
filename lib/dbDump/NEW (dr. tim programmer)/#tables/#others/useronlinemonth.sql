/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-18 17:47:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for useronlinemonth
-- ----------------------------
DROP TABLE IF EXISTS `useronlinemonth`;
CREATE TABLE `useronlinemonth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipproxy` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `ipanda` varchar(100) DEFAULT NULL,
  `proxyserver` varchar(100) DEFAULT NULL,
  `timevisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ipanda` (`ipanda`),
  KEY `timevisit` (`timevisit`),
  KEY `ipproxy` (`ipproxy`)
) ENGINE=MyISAM AUTO_INCREMENT=3906 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of useronlinemonth
-- ----------------------------
INSERT INTO `useronlinemonth` VALUES ('3904', '36.79.235.175', '36.79.235.175', '36.79.235.175', '', '1438932633');
INSERT INTO `useronlinemonth` VALUES ('3903', '192.168.10.97', 'PERSONAL-PC', '192.168.10.97', '', '1438743472');
INSERT INTO `useronlinemonth` VALUES ('3901', '192.168.10.12', 'HRD-PC', '192.168.10.12', '', '1438045451');
INSERT INTO `useronlinemonth` VALUES ('3902', '114.4.75.96', '114.4.75.96', '114.4.75.96', '', '1438604726');
INSERT INTO `useronlinemonth` VALUES ('3905', '127.0.0.1', 'EICS-PC', '127.0.0.1', '', '1439889358');
INSERT INTO `useronlinemonth` VALUES ('3896', '192.168.10.254', '192.168.10.254', '192.168.10.254', '', '1438754698');
