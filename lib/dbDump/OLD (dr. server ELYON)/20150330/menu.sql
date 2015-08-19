/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-03-30 15:37:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmenu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '1', 'Pendataan Siswa', 'pendataan-siswa', 'double', '');
INSERT INTO `menu` VALUES ('2', '1', 'Presensi Siswa', 'presensi-siswa', 'double', '');
INSERT INTO `menu` VALUES ('3', '1', 'Rapor Siswa', 'rapor-siswa', 'double', '');
INSERT INTO `menu` VALUES ('4', '1', 'Pendataan Alumni', 'pendataan-alumni', 'double', '');
INSERT INTO `menu` VALUES ('5', '1', 'Pelajaran', 'pelajaran', 'double', '');
INSERT INTO `menu` VALUES ('6', '1', 'Guru', 'guru', 'double', '');
INSERT INTO `menu` VALUES ('7', '1', 'Jadwal Pelajaran', 'jadwal-pelajaran', 'double', '');
INSERT INTO `menu` VALUES ('8', '5', 'Transaksi', 'transaksi', 'double', '');
