/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu_epi

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-04-12 03:09:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for psb_calonsiswa_saudara
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_saudara`;
CREATE TABLE `psb_calonsiswa_saudara` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calonsiswa` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgllahir` date NOT NULL,
  `sekolah` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of psb_calonsiswa_saudara
-- ----------------------------
INSERT INTO `psb_calonsiswa_saudara` VALUES ('3', '49', 'Geoffrey Daniel Ong', '2006-05-13', 'Elyon International Christian School');
INSERT INTO `psb_calonsiswa_saudara` VALUES ('4', '41', 'Regina Soempiet', '2006-06-12', 'Elyon International Christian School');
INSERT INTO `psb_calonsiswa_saudara` VALUES ('5', '44', 'Davide William Susanto', '2006-12-01', 'Elyon International Christian School');
