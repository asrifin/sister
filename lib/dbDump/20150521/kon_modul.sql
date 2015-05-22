/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-22 07:43:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kon_modul
-- ----------------------------
DROP TABLE IF EXISTS `kon_modul`;
CREATE TABLE `kon_modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmodul` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_modul
-- ----------------------------
INSERT INTO `kon_modul` VALUES ('1', '1', 'akademik', 'akademik', '13', '1', 'double', 'data akademik siswa');
INSERT INTO `kon_modul` VALUES ('2', '1', 'psb', 'penerimaan siswa baru', '14', '2', 'double', 'data penerimaan siswa');
INSERT INTO `kon_modul` VALUES ('3', '1', 'perpus', 'perpustakaan', '3', '3', 'double double-vertical', 'data koleksi dan sirkulasi buku di perpustakaan');
INSERT INTO `kon_modul` VALUES ('4', '1', 'sarpras', 'sarana dan prasarana', '4', '4', 'double double-vertical', 'data sirkulasi peminjaman barang / inventaris');
INSERT INTO `kon_modul` VALUES ('5', '2', 'hrd', 'kepegawaian', '5', '5', 'double double-vertical', 'data sirkulasi peminjaman barang / inventaris');
INSERT INTO `kon_modul` VALUES ('6', '2', 'keuangan', 'keuangan', '6', '6', 'double double-vertical', 'data sirkulasi peminjaman barang / inventaris');
INSERT INTO `kon_modul` VALUES ('7', '2', 'student', 'student services', '7', '7', 'double', 'data sirkulasi peminjaman barang / inventaris');
INSERT INTO `kon_modul` VALUES ('8', '2', 'man', 'manajemen', '8', '8', 'double', 'data sirkulasi peminjaman barang / inventaris');
INSERT INTO `kon_modul` VALUES ('9', '3', 'guru', 'guru', '9', '9', 'double', 'data guru dan proses belajar mengajar');
INSERT INTO `kon_modul` VALUES ('10', '3', 'konfigurasi', 'konfigurasi', '12', '8', '', 'konfigurasi sistem');
