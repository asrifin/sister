/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-16 17:25:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_nominalanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_nominalanggaran`;
CREATE TABLE `keu_nominalanggaran` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(10) NOT NULL,
  `bulan` int(2) NOT NULL,
  `jml` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_nominalanggaran
-- ----------------------------
INSERT INTO `keu_nominalanggaran` VALUES ('279', '43', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('280', '43', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('281', '43', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('282', '43', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('283', '43', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('284', '43', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('285', '43', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('286', '43', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('287', '43', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('288', '43', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('289', '43', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('290', '43', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('291', '44', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('292', '44', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('293', '44', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('294', '44', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('295', '44', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('296', '44', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('297', '44', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('298', '44', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('299', '44', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('300', '44', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('301', '44', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('302', '44', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('327', '47', '1', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('328', '47', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('329', '47', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('330', '47', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('331', '47', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('332', '47', '6', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('333', '47', '7', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('334', '47', '8', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('335', '47', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('336', '47', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('337', '47', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('338', '47', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('351', '59', '7', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('352', '59', '8', '10');
INSERT INTO `keu_nominalanggaran` VALUES ('355', '61', '7', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('356', '61', '8', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('357', '61', '9', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('358', '61', '10', '15');
INSERT INTO `keu_nominalanggaran` VALUES ('359', '61', '11', '15');
INSERT INTO `keu_nominalanggaran` VALUES ('360', '61', '12', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('361', '61', '1', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('362', '61', '2', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('363', '61', '3', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('364', '61', '4', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('365', '61', '5', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('366', '61', '6', '20');
