/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-18 17:51:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for menu_users
-- ----------------------------
DROP TABLE IF EXISTS `menu_users`;
CREATE TABLE `menu_users` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(2) NOT NULL,
  `parent` int(4) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu_users
-- ----------------------------
INSERT INTO `menu_users` VALUES ('2', 'Change Password', 'admin.php?pilih=user&mod=yes&aksi=change', '1', '8', '');
INSERT INTO `menu_users` VALUES ('7', 'Profile', '?pilih=profile&mod=yes', '2', '8', '');
INSERT INTO `menu_users` VALUES ('8', 'Account', '#', '1', '0', 'settings.png');
INSERT INTO `menu_users` VALUES ('12', 'Blogs', '?pilih=news&mod=yes', '3', '8', '');
