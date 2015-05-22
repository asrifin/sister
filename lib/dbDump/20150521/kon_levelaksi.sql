/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-22 07:43:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kon_levelaksi
-- ----------------------------
DROP TABLE IF EXISTS `kon_levelaksi`;
CREATE TABLE `kon_levelaksi` (
  `id_levelaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_levelkatgrupmenu` int(11) NOT NULL,
  `id_aksi` int(11) NOT NULL,
  PRIMARY KEY (`id_levelaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_levelaksi
-- ----------------------------
INSERT INTO `kon_levelaksi` VALUES ('1', '1', '1');
INSERT INTO `kon_levelaksi` VALUES ('2', '1', '2');
INSERT INTO `kon_levelaksi` VALUES ('3', '1', '3');
INSERT INTO `kon_levelaksi` VALUES ('4', '1', '4');
INSERT INTO `kon_levelaksi` VALUES ('5', '1', '5');
INSERT INTO `kon_levelaksi` VALUES ('6', '1', '6');
INSERT INTO `kon_levelaksi` VALUES ('7', '2', '1');
INSERT INTO `kon_levelaksi` VALUES ('8', '2', '2');
INSERT INTO `kon_levelaksi` VALUES ('9', '2', '3');
INSERT INTO `kon_levelaksi` VALUES ('10', '2', '4');
INSERT INTO `kon_levelaksi` VALUES ('11', '2', '5');
INSERT INTO `kon_levelaksi` VALUES ('12', '2', '6');
INSERT INTO `kon_levelaksi` VALUES ('13', '3', '1');
INSERT INTO `kon_levelaksi` VALUES ('14', '3', '2');
INSERT INTO `kon_levelaksi` VALUES ('15', '3', '3');
INSERT INTO `kon_levelaksi` VALUES ('16', '3', '4');
INSERT INTO `kon_levelaksi` VALUES ('17', '3', '5');
INSERT INTO `kon_levelaksi` VALUES ('18', '3', '6');
INSERT INTO `kon_levelaksi` VALUES ('19', '4', '1');
INSERT INTO `kon_levelaksi` VALUES ('20', '4', '2');
INSERT INTO `kon_levelaksi` VALUES ('21', '4', '3');
INSERT INTO `kon_levelaksi` VALUES ('22', '4', '4');
INSERT INTO `kon_levelaksi` VALUES ('23', '4', '5');
INSERT INTO `kon_levelaksi` VALUES ('24', '4', '6');
INSERT INTO `kon_levelaksi` VALUES ('25', '5', '1');
INSERT INTO `kon_levelaksi` VALUES ('26', '5', '2');
INSERT INTO `kon_levelaksi` VALUES ('27', '5', '3');
INSERT INTO `kon_levelaksi` VALUES ('28', '5', '4');
INSERT INTO `kon_levelaksi` VALUES ('29', '5', '5');
INSERT INTO `kon_levelaksi` VALUES ('30', '5', '6');
INSERT INTO `kon_levelaksi` VALUES ('31', '6', '1');
INSERT INTO `kon_levelaksi` VALUES ('32', '6', '5');
INSERT INTO `kon_levelaksi` VALUES ('33', '6', '6');
INSERT INTO `kon_levelaksi` VALUES ('34', '7', '1');
INSERT INTO `kon_levelaksi` VALUES ('35', '7', '5');
INSERT INTO `kon_levelaksi` VALUES ('36', '7', '6');
