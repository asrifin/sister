/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-03-30 15:40:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for warna
-- ----------------------------
DROP TABLE IF EXISTS `warna`;
CREATE TABLE `warna` (
  `id_warna` int(11) NOT NULL AUTO_INCREMENT,
  `warna` varchar(25) NOT NULL,
  PRIMARY KEY (`id_warna`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of warna
-- ----------------------------
INSERT INTO `warna` VALUES ('1', 'black');
INSERT INTO `warna` VALUES ('2', 'white');
INSERT INTO `warna` VALUES ('3', 'lime');
INSERT INTO `warna` VALUES ('4', 'green');
INSERT INTO `warna` VALUES ('5', 'emerald');
INSERT INTO `warna` VALUES ('6', 'teal');
INSERT INTO `warna` VALUES ('7', 'cyan');
INSERT INTO `warna` VALUES ('8', 'cobalt');
INSERT INTO `warna` VALUES ('9', 'indigo');
INSERT INTO `warna` VALUES ('10', 'violet');
INSERT INTO `warna` VALUES ('11', 'pink');
INSERT INTO `warna` VALUES ('12', 'magenta');
INSERT INTO `warna` VALUES ('13', 'crimson');
INSERT INTO `warna` VALUES ('14', 'red');
INSERT INTO `warna` VALUES ('15', 'orange');
INSERT INTO `warna` VALUES ('16', 'amber');
INSERT INTO `warna` VALUES ('17', 'yellow');
INSERT INTO `warna` VALUES ('18', 'brown');
INSERT INTO `warna` VALUES ('19', 'olive');
INSERT INTO `warna` VALUES ('20', 'steel');
INSERT INTO `warna` VALUES ('21', 'mauve');
INSERT INTO `warna` VALUES ('22', 'taupe');
INSERT INTO `warna` VALUES ('23', 'gray');
INSERT INTO `warna` VALUES ('24', 'dark');
INSERT INTO `warna` VALUES ('25', 'darker');
INSERT INTO `warna` VALUES ('26', 'transparent');
INSERT INTO `warna` VALUES ('27', 'darkBrown');
INSERT INTO `warna` VALUES ('28', 'darkCrimson');
INSERT INTO `warna` VALUES ('29', 'darkMagenta');
INSERT INTO `warna` VALUES ('30', 'darkIndigo');
INSERT INTO `warna` VALUES ('31', 'darkCyan');
INSERT INTO `warna` VALUES ('32', 'darkCobalt');
INSERT INTO `warna` VALUES ('33', 'darkTeal');
INSERT INTO `warna` VALUES ('34', 'darkEmerald');
INSERT INTO `warna` VALUES ('35', 'darkGreen');
INSERT INTO `warna` VALUES ('36', 'darkOrange');
INSERT INTO `warna` VALUES ('37', 'darkRed');
INSERT INTO `warna` VALUES ('38', 'darkPink');
INSERT INTO `warna` VALUES ('39', 'darkViolet');
INSERT INTO `warna` VALUES ('40', 'darkBlue');
INSERT INTO `warna` VALUES ('41', 'lightBlue');
INSERT INTO `warna` VALUES ('42', 'lightTeal');
INSERT INTO `warna` VALUES ('43', 'lightOlive');
INSERT INTO `warna` VALUES ('44', 'lightOrange');
INSERT INTO `warna` VALUES ('45', 'lightPink');
INSERT INTO `warna` VALUES ('46', 'lightRed');
INSERT INTO `warna` VALUES ('47', 'lightGreen');
