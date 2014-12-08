/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sisterdb

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-11-27 21:00:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for modul
-- ----------------------------
DROP TABLE IF EXISTS `modul`;
CREATE TABLE `modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `modul` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modul
-- ----------------------------
INSERT INTO `modul` VALUES ('1', 'aka', 'akademik', '');
INSERT INTO `modul` VALUES ('2', 'psb', 'penerimaan siswa baru', '');
INSERT INTO `modul` VALUES ('3', 'perpus', 'perpustakaan', '');
INSERT INTO `modul` VALUES ('4', 'sarpras', 'sarana dan prasarana', '');
INSERT INTO `modul` VALUES ('5', 'hrd', 'kepegawaian', '');
INSERT INTO `modul` VALUES ('6', 'keu', 'keuangan', '');
INSERT INTO `modul` VALUES ('7', 'repo', 'repository', '');
INSERT INTO `modul` VALUES ('8', 'man', 'manajemen', '');
