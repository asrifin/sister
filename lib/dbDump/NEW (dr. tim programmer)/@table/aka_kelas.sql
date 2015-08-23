/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-23 14:36:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aka_kelas
-- ----------------------------
DROP TABLE IF EXISTS `aka_kelas`;
CREATE TABLE `aka_kelas` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departemen` int(11) NOT NULL,
  `kelas` varchar(100) NOT NULL,
  `subtingkat` int(10) NOT NULL,
  `kapasitas` int(10) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(255) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`),
  KEY `IX_kelas_ts` (`ts`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aka_kelas
-- ----------------------------
INSERT INTO `aka_kelas` VALUES ('6', '1', 'A', '4', '20', '-', '2015-08-19 17:37:04');
INSERT INTO `aka_kelas` VALUES ('7', '1', 'B', '4', '20', '-', '2015-08-19 17:45:58');
INSERT INTO `aka_kelas` VALUES ('8', '1', '1', '5', '20', '-\r\n', '2015-08-19 17:46:22');
INSERT INTO `aka_kelas` VALUES ('9', '1', '2', '5', '20', '-', '2015-08-19 17:46:42');
INSERT INTO `aka_kelas` VALUES ('10', '1', '1', '6', '20', '-', '2015-08-19 17:47:42');
INSERT INTO `aka_kelas` VALUES ('11', '1', '2', '6', '20', '-', '2015-08-19 17:47:58');
INSERT INTO `aka_kelas` VALUES ('12', '1', '1', '7', '20', '-', '2015-08-19 17:48:12');
INSERT INTO `aka_kelas` VALUES ('13', '1', '2', '7', '20', '-', '2015-08-19 17:48:27');
INSERT INTO `aka_kelas` VALUES ('14', '1', '1', '8', '20', '-', '2015-08-19 17:48:48');
INSERT INTO `aka_kelas` VALUES ('15', '1', '2', '8', '20', '-', '2015-08-19 17:49:03');
INSERT INTO `aka_kelas` VALUES ('16', '1', 'A', '9', '20', '', '2015-08-19 17:49:20');
INSERT INTO `aka_kelas` VALUES ('17', '1', 'B', '9', '20', '', '2015-08-19 17:49:35');
INSERT INTO `aka_kelas` VALUES ('18', '1', 'C', '9', '20', '', '2015-08-19 17:50:02');
INSERT INTO `aka_kelas` VALUES ('19', '1', 'A', '10', '20', '', '2015-08-19 17:50:16');
INSERT INTO `aka_kelas` VALUES ('20', '1', 'B', '10', '20', '', '2015-08-19 17:50:27');
INSERT INTO `aka_kelas` VALUES ('21', '1', 'C', '10', '20', '', '2015-08-19 17:50:58');
INSERT INTO `aka_kelas` VALUES ('22', '1', 'A', '11', '20', '', '2015-08-19 17:51:14');
INSERT INTO `aka_kelas` VALUES ('23', '1', 'B', '11', '20', '', '2015-08-19 17:51:27');
INSERT INTO `aka_kelas` VALUES ('24', '1', 'C', '11', '20', '', '2015-08-19 17:51:39');
INSERT INTO `aka_kelas` VALUES ('25', '1', 'A', '12', '20', '', '2015-08-19 17:52:01');
INSERT INTO `aka_kelas` VALUES ('26', '1', 'B', '12', '20', '', '2015-08-19 17:52:15');
INSERT INTO `aka_kelas` VALUES ('27', '1', 'C', '12', '20', '', '2015-08-19 17:52:30');
INSERT INTO `aka_kelas` VALUES ('28', '1', 'A', '13', '20', '', '2015-08-19 17:52:47');
INSERT INTO `aka_kelas` VALUES ('29', '1', 'B', '13', '20', '', '2015-08-19 17:52:59');
INSERT INTO `aka_kelas` VALUES ('30', '1', 'C', '13', '20', '', '2015-08-19 17:53:10');
INSERT INTO `aka_kelas` VALUES ('31', '1', 'A', '14', '20', '', '2015-08-19 17:53:28');
INSERT INTO `aka_kelas` VALUES ('32', '1', 'B', '14', '20', '', '2015-08-19 17:53:41');
INSERT INTO `aka_kelas` VALUES ('33', '1', 'C', '14', '20', '', '2015-08-19 17:53:55');
INSERT INTO `aka_kelas` VALUES ('34', '1', 'A', '15', '20', '', '2015-08-19 17:54:07');
INSERT INTO `aka_kelas` VALUES ('35', '1', 'B', '15', '20', '', '2015-08-19 17:55:27');
INSERT INTO `aka_kelas` VALUES ('36', '1', 'C', '15', '20', '', '2015-08-19 18:01:27');
INSERT INTO `aka_kelas` VALUES ('37', '1', 'A', '16', '20', '', '2015-08-19 18:02:14');
INSERT INTO `aka_kelas` VALUES ('38', '1', '3', '16', '20', '', '2015-08-19 18:02:44');
INSERT INTO `aka_kelas` VALUES ('39', '1', 'C', '16', '20', '', '2015-08-19 18:03:07');
INSERT INTO `aka_kelas` VALUES ('40', '1', 'A', '17', '20', '', '2015-08-19 18:03:45');
INSERT INTO `aka_kelas` VALUES ('41', '1', 'B', '17', '20', '', '2015-08-19 18:05:12');
INSERT INTO `aka_kelas` VALUES ('42', '1', 'C', '17', '20', '', '2015-08-19 18:05:26');
INSERT INTO `aka_kelas` VALUES ('43', '1', 'A', '18', '20', '', '2015-08-19 18:05:38');
INSERT INTO `aka_kelas` VALUES ('44', '1', 'B', '18', '20', '', '2015-08-19 18:05:56');
INSERT INTO `aka_kelas` VALUES ('45', '1', 'C', '18', '20', '', '2015-08-19 18:07:24');
INSERT INTO `aka_kelas` VALUES ('46', '1', 'A', '19', '20', '', '2015-08-19 18:07:39');
INSERT INTO `aka_kelas` VALUES ('47', '1', 'B', '19', '20', '', '2015-08-19 18:07:49');
INSERT INTO `aka_kelas` VALUES ('48', '1', 'C', '19', '20', '', '2015-08-19 18:08:12');
INSERT INTO `aka_kelas` VALUES ('49', '1', 'A', '20', '20', '', '2015-08-19 18:08:27');
INSERT INTO `aka_kelas` VALUES ('50', '1', 'B', '20', '20', '', '2015-08-19 18:08:36');
INSERT INTO `aka_kelas` VALUES ('51', '1', 'C', '20', '20', '', '2015-08-19 18:08:45');
INSERT INTO `aka_kelas` VALUES ('52', '2', 'A', '9', '20', '', '2015-08-23 13:24:06');
INSERT INTO `aka_kelas` VALUES ('53', '2', 'B', '9', '20', '', '2015-08-23 13:24:20');
INSERT INTO `aka_kelas` VALUES ('54', '2', 'A', '10', '20', '', '2015-08-23 13:24:34');
INSERT INTO `aka_kelas` VALUES ('55', '2', 'B', '10', '20', '', '2015-08-23 13:24:52');
INSERT INTO `aka_kelas` VALUES ('56', '2', 'A', '11', '20', '', '2015-08-23 13:25:07');
INSERT INTO `aka_kelas` VALUES ('57', '2', 'B', '11', '20', '', '2015-08-23 13:25:22');
INSERT INTO `aka_kelas` VALUES ('58', '2', 'A', '12', '20', '', '2015-08-23 14:17:55');
INSERT INTO `aka_kelas` VALUES ('59', '2', 'B', '12', '20', '', '2015-08-23 14:18:08');
INSERT INTO `aka_kelas` VALUES ('60', '2', 'A', '13', '20', '', '2015-08-23 14:18:21');
INSERT INTO `aka_kelas` VALUES ('61', '2', 'B', '13', '20', '', '2015-08-23 14:18:32');
INSERT INTO `aka_kelas` VALUES ('62', '2', 'A', '14', '20', '', '2015-08-23 14:18:46');
INSERT INTO `aka_kelas` VALUES ('63', '2', 'B', '14', '20', '', '2015-08-23 14:19:03');
INSERT INTO `aka_kelas` VALUES ('64', '2', 'A', '15', '20', '', '2015-08-23 14:19:28');
INSERT INTO `aka_kelas` VALUES ('65', '2', 'B', '15', '20', '', '2015-08-23 14:19:40');
INSERT INTO `aka_kelas` VALUES ('66', '2', 'A', '16', '20', '', '2015-08-23 14:21:23');
INSERT INTO `aka_kelas` VALUES ('67', '2', 'B', '16', '20', '', '2015-08-23 14:21:38');
INSERT INTO `aka_kelas` VALUES ('68', '2', 'A', '17', '20', '', '2015-08-23 14:21:49');
INSERT INTO `aka_kelas` VALUES ('69', '2', 'C', '17', '20', '', '2015-08-23 14:21:59');
INSERT INTO `aka_kelas` VALUES ('70', '2', 'A', '18', '20', '', '2015-08-23 14:22:09');
INSERT INTO `aka_kelas` VALUES ('71', '2', 'B', '18', '20', '', '2015-08-23 14:22:20');
INSERT INTO `aka_kelas` VALUES ('72', '3', 'A', '4', '20', '', '2015-08-23 14:24:20');
INSERT INTO `aka_kelas` VALUES ('73', '3', 'B', '4', '20', '', '2015-08-23 14:24:29');
INSERT INTO `aka_kelas` VALUES ('74', '3', '1', '5', '20', '', '2015-08-23 14:24:44');
INSERT INTO `aka_kelas` VALUES ('75', '3', '2', '5', '20', '', '2015-08-23 14:24:55');
INSERT INTO `aka_kelas` VALUES ('76', '3', '1', '6', '20', '', '2015-08-23 14:25:10');
INSERT INTO `aka_kelas` VALUES ('77', '3', '2', '6', '20', '', '2015-08-23 14:25:22');
