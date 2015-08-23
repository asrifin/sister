/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-18 17:47:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for useronlineday
-- ----------------------------
DROP TABLE IF EXISTS `useronlineday`;
CREATE TABLE `useronlineday` (
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
) ENGINE=MyISAM AUTO_INCREMENT=5692 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of useronlineday
-- ----------------------------
INSERT INTO `useronlineday` VALUES ('5691', '127.0.0.1', 'EICS-PC', '127.0.0.1', '', '1439889358');
