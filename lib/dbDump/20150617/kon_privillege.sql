/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-17 00:01:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kon_privillege
-- ----------------------------
DROP TABLE IF EXISTS `kon_privillege`;
CREATE TABLE `kon_privillege` (
  `id_privillege` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_privillege`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_privillege
-- ----------------------------
INSERT INTO `kon_privillege` VALUES ('1', '1', '12');
INSERT INTO `kon_privillege` VALUES ('2', '1', '13');
INSERT INTO `kon_privillege` VALUES ('4', '1', '15');
INSERT INTO `kon_privillege` VALUES ('5', '1', '16');
INSERT INTO `kon_privillege` VALUES ('7', '2', '18');
INSERT INTO `kon_privillege` VALUES ('8', '1', '8');
INSERT INTO `kon_privillege` VALUES ('9', '1', '9');
INSERT INTO `kon_privillege` VALUES ('10', '1', '10');
INSERT INTO `kon_privillege` VALUES ('11', '2', '11');
INSERT INTO `kon_privillege` VALUES ('12', '1', '20');
INSERT INTO `kon_privillege` VALUES ('13', '1', '21');
INSERT INTO `kon_privillege` VALUES ('14', '1', '19');
INSERT INTO `kon_privillege` VALUES ('15', '1', '22');
INSERT INTO `kon_privillege` VALUES ('17', '1', '11');
INSERT INTO `kon_privillege` VALUES ('18', '1', '18');
INSERT INTO `kon_privillege` VALUES ('19', '1', '23');
INSERT INTO `kon_privillege` VALUES ('20', '1', '24');
