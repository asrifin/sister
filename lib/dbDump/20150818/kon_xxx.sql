/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-18 14:23:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kon_aksi
-- ----------------------------
DROP TABLE IF EXISTS `kon_aksi`;
CREATE TABLE `kon_aksi` (
  `id_aksi` int(11) NOT NULL AUTO_INCREMENT,
  `aksi` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_aksi`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_aksi
-- ----------------------------
INSERT INTO `kon_aksi` VALUES ('1', 'r', 'read');
INSERT INTO `kon_aksi` VALUES ('2', 'c', 'create');
INSERT INTO `kon_aksi` VALUES ('3', 'u', 'update');
INSERT INTO `kon_aksi` VALUES ('4', 'd', 'delete');
INSERT INTO `kon_aksi` VALUES ('5', 'p', 'print/report');

-- ----------------------------
-- Table structure for kon_grupmenu
-- ----------------------------
DROP TABLE IF EXISTS `kon_grupmenu`;
CREATE TABLE `kon_grupmenu` (
  `id_grupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_katgrupmenu` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `grupmenu` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_grupmenu
-- ----------------------------
INSERT INTO `kon_grupmenu` VALUES ('1', '2', '1', 'Menu Kesiswaan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('2', '2', '1', 'Menu Belajar - Mengajar', 'four');
INSERT INTO `kon_grupmenu` VALUES ('3', '1', '1', 'Menu Master', 'four');
INSERT INTO `kon_grupmenu` VALUES ('4', '1', '2', 'Menu Transaksi', 'four');
INSERT INTO `kon_grupmenu` VALUES ('5', '2', '6', 'Menu Transaksi ', 'double');
INSERT INTO `kon_grupmenu` VALUES ('6', '1', '6', 'Menu Master', 'double');
INSERT INTO `kon_grupmenu` VALUES ('7', '1', '9', 'Menu Sistem', 'double');
INSERT INTO `kon_grupmenu` VALUES ('8', '2', '9', 'Menu User', 'double');
INSERT INTO `kon_grupmenu` VALUES ('9', '1', '2', 'Menu Master', 'four');
INSERT INTO `kon_grupmenu` VALUES ('14', '1', '3', 'Menu Master ', 'double double-vertic');
INSERT INTO `kon_grupmenu` VALUES ('15', '2', '3', 'Menu Transaksi', 'double double-vertic');

-- ----------------------------
-- Table structure for kon_grupmodul
-- ----------------------------
DROP TABLE IF EXISTS `kon_grupmodul`;
CREATE TABLE `kon_grupmodul` (
  `id_grupmodul` int(11) NOT NULL AUTO_INCREMENT,
  `grupmodul` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupmodul`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_grupmodul
-- ----------------------------
INSERT INTO `kon_grupmodul` VALUES ('1', 'satu', 'four');
INSERT INTO `kon_grupmodul` VALUES ('2', 'dua', 'four');
INSERT INTO `kon_grupmodul` VALUES ('3', 'tiga', 'four');

-- ----------------------------
-- Table structure for kon_icon
-- ----------------------------
DROP TABLE IF EXISTS `kon_icon`;
CREATE TABLE `kon_icon` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(25) NOT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_icon
-- ----------------------------
INSERT INTO `kon_icon` VALUES ('1', 'akademik');
INSERT INTO `kon_icon` VALUES ('2', 'sarpras');
INSERT INTO `kon_icon` VALUES ('3', 'hrd');
INSERT INTO `kon_icon` VALUES ('4', 'psb');
INSERT INTO `kon_icon` VALUES ('5', 'keuangan');
INSERT INTO `kon_icon` VALUES ('6', 'student');
INSERT INTO `kon_icon` VALUES ('7', 'perpus');
INSERT INTO `kon_icon` VALUES ('8', 'manajemen');
INSERT INTO `kon_icon` VALUES ('9', 'pencil');
INSERT INTO `kon_icon` VALUES ('10', 'address-book');
INSERT INTO `kon_icon` VALUES ('11', 'book');
INSERT INTO `kon_icon` VALUES ('12', 'copy');
INSERT INTO `kon_icon` VALUES ('13', 'user-3');
INSERT INTO `kon_icon` VALUES ('14', 'user');
INSERT INTO `kon_icon` VALUES ('15', 'grid-view');
INSERT INTO `kon_icon` VALUES ('16', 'tab');
INSERT INTO `kon_icon` VALUES ('17', 'cog');
INSERT INTO `kon_icon` VALUES ('18', 'user-2');
INSERT INTO `kon_icon` VALUES ('20', 'loop');

-- ----------------------------
-- Table structure for kon_katgrupmenu
-- ----------------------------
DROP TABLE IF EXISTS `kon_katgrupmenu`;
CREATE TABLE `kon_katgrupmenu` (
  `id_katgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `katgrupmenu` char(1) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_katgrupmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_katgrupmenu
-- ----------------------------
INSERT INTO `kon_katgrupmenu` VALUES ('1', 'M', 'Master');
INSERT INTO `kon_katgrupmenu` VALUES ('2', 'T', 'Transaksi');

-- ----------------------------
-- Table structure for kon_level
-- ----------------------------
DROP TABLE IF EXISTS `kon_level`;
CREATE TABLE `kon_level` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `urutan` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_level
-- ----------------------------
INSERT INTO `kon_level` VALUES ('17', 'SA', '1', 'Super Admin');
INSERT INTO `kon_level` VALUES ('18', 'A+', '2', 'Admin Plus');
INSERT INTO `kon_level` VALUES ('19', 'A', '3', 'Admin');
INSERT INTO `kon_level` VALUES ('20', 'O', '4', 'Operator');
INSERT INTO `kon_level` VALUES ('21', 'G', '5', 'Guest');

-- ----------------------------
-- Table structure for kon_levelaksi
-- ----------------------------
DROP TABLE IF EXISTS `kon_levelaksi`;
CREATE TABLE `kon_levelaksi` (
  `id_levelaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_levelkatgrupmenu` int(11) NOT NULL,
  `id_aksi` int(11) NOT NULL,
  PRIMARY KEY (`id_levelaksi`),
  KEY `id_levelkatgrupmenu` (`id_levelkatgrupmenu`),
  KEY `id_aksi` (`id_aksi`),
  CONSTRAINT `kon_levelaksi_ibfk_1` FOREIGN KEY (`id_levelkatgrupmenu`) REFERENCES `kon_levelkatgrupmenu` (`id_levelkatgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kon_levelaksi_ibfk_2` FOREIGN KEY (`id_aksi`) REFERENCES `kon_aksi` (`id_aksi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_levelaksi
-- ----------------------------
INSERT INTO `kon_levelaksi` VALUES ('221', '53', '1');
INSERT INTO `kon_levelaksi` VALUES ('222', '54', '1');
INSERT INTO `kon_levelaksi` VALUES ('223', '53', '2');
INSERT INTO `kon_levelaksi` VALUES ('224', '54', '2');
INSERT INTO `kon_levelaksi` VALUES ('225', '53', '3');
INSERT INTO `kon_levelaksi` VALUES ('226', '54', '3');
INSERT INTO `kon_levelaksi` VALUES ('227', '53', '4');
INSERT INTO `kon_levelaksi` VALUES ('228', '54', '4');
INSERT INTO `kon_levelaksi` VALUES ('229', '53', '5');
INSERT INTO `kon_levelaksi` VALUES ('230', '54', '5');
INSERT INTO `kon_levelaksi` VALUES ('231', '55', '1');
INSERT INTO `kon_levelaksi` VALUES ('232', '56', '1');
INSERT INTO `kon_levelaksi` VALUES ('233', '55', '2');
INSERT INTO `kon_levelaksi` VALUES ('234', '56', '2');
INSERT INTO `kon_levelaksi` VALUES ('235', '55', '3');
INSERT INTO `kon_levelaksi` VALUES ('236', '56', '3');
INSERT INTO `kon_levelaksi` VALUES ('237', '55', '4');
INSERT INTO `kon_levelaksi` VALUES ('238', '56', '4');
INSERT INTO `kon_levelaksi` VALUES ('239', '55', '5');
INSERT INTO `kon_levelaksi` VALUES ('240', '56', '5');
INSERT INTO `kon_levelaksi` VALUES ('355', '57', '1');
INSERT INTO `kon_levelaksi` VALUES ('356', '58', '1');
INSERT INTO `kon_levelaksi` VALUES ('357', '57', '2');
INSERT INTO `kon_levelaksi` VALUES ('358', '57', '3');
INSERT INTO `kon_levelaksi` VALUES ('359', '57', '4');
INSERT INTO `kon_levelaksi` VALUES ('360', '57', '5');
INSERT INTO `kon_levelaksi` VALUES ('361', '58', '5');
INSERT INTO `kon_levelaksi` VALUES ('362', '59', '1');
INSERT INTO `kon_levelaksi` VALUES ('363', '60', '1');
INSERT INTO `kon_levelaksi` VALUES ('364', '59', '2');
INSERT INTO `kon_levelaksi` VALUES ('365', '59', '3');
INSERT INTO `kon_levelaksi` VALUES ('366', '59', '4');
INSERT INTO `kon_levelaksi` VALUES ('367', '59', '5');
INSERT INTO `kon_levelaksi` VALUES ('368', '60', '5');
INSERT INTO `kon_levelaksi` VALUES ('419', '61', '1');
INSERT INTO `kon_levelaksi` VALUES ('420', '61', '2');
INSERT INTO `kon_levelaksi` VALUES ('421', '61', '3');
INSERT INTO `kon_levelaksi` VALUES ('422', '61', '4');
INSERT INTO `kon_levelaksi` VALUES ('423', '61', '5');
INSERT INTO `kon_levelaksi` VALUES ('424', '63', '1');
INSERT INTO `kon_levelaksi` VALUES ('425', '63', '2');
INSERT INTO `kon_levelaksi` VALUES ('426', '63', '3');
INSERT INTO `kon_levelaksi` VALUES ('427', '63', '4');
INSERT INTO `kon_levelaksi` VALUES ('428', '63', '5');
INSERT INTO `kon_levelaksi` VALUES ('442', '67', '1');
INSERT INTO `kon_levelaksi` VALUES ('443', '67', '2');
INSERT INTO `kon_levelaksi` VALUES ('444', '67', '3');
INSERT INTO `kon_levelaksi` VALUES ('445', '67', '4');
INSERT INTO `kon_levelaksi` VALUES ('446', '67', '5');
INSERT INTO `kon_levelaksi` VALUES ('448', '71', '1');
INSERT INTO `kon_levelaksi` VALUES ('449', '71', '5');

-- ----------------------------
-- Table structure for kon_levelkatgrupmenu
-- ----------------------------
DROP TABLE IF EXISTS `kon_levelkatgrupmenu`;
CREATE TABLE `kon_levelkatgrupmenu` (
  `id_levelkatgrupmenu` int(11) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NOT NULL,
  `id_katgrupmenu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_levelkatgrupmenu`),
  KEY `id_level` (`id_level`),
  KEY `id_katgrupmenu` (`id_katgrupmenu`),
  CONSTRAINT `kon_levelkatgrupmenu_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kon_levelkatgrupmenu_ibfk_2` FOREIGN KEY (`id_katgrupmenu`) REFERENCES `kon_katgrupmenu` (`id_katgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_levelkatgrupmenu
-- ----------------------------
INSERT INTO `kon_levelkatgrupmenu` VALUES ('53', '17', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('54', '17', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('55', '17', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('56', '17', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('57', '18', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('58', '18', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('59', '18', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('60', '18', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('61', '19', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('62', '19', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('63', '19', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('64', '19', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('65', '20', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('66', '20', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('67', '20', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('68', '20', '2', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('69', '21', '1', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('70', '21', '1', '0');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('71', '21', '2', '1');
INSERT INTO `kon_levelkatgrupmenu` VALUES ('72', '21', '2', '0');

-- ----------------------------
-- Table structure for kon_login
-- ----------------------------
DROP TABLE IF EXISTS `kon_login`;
CREATE TABLE `kon_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_level` int(11) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_login`),
  KEY `id_level` (`id_level`),
  CONSTRAINT `kon_login_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_login
-- ----------------------------
INSERT INTO `kon_login` VALUES ('34', 'Mr. ABC DEF', 'admin', 'MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=', '17', '0', '1', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('41', 'a+', 'a+', 'Yzg5NDhjMjAwOTRmNjQyMDBjMmI4ZmJhMDQ3YmRiODM=', '18', '0', '1', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('42', 'a', 'a', 'MGNjMTc1YjljMGYxYjZhODMxYzM5OWUyNjk3NzI2NjE=', '19', '0', '1', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('43', 'o', 'o', 'ZDk1Njc5NzUyMTM0YTJkOWViNjFkYmQ3YjkxYzRiY2M=', '20', '0', '1', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('44', 'g', 'g', 'YjJmNWZmNDc0MzY2NzFiNmU1MzNkOGRjMzYxNDg0NWQ=', '21', '0', '1', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('45', 'adm+ akademik', 'aaka', 'Yzg5MWY0ZTgxYjdhZmM4NzQ1ZDEwODAwNmQ1NWY5ODU=', '18', '0', '1', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('46', 'new', 'new', 'MjJhZjY0NWQxODU5Y2I1Y2E2ZGEwYzQ4NGYxZjM3ZWE=', '18', '0', '', '', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for kon_logindepartemen
-- ----------------------------
DROP TABLE IF EXISTS `kon_logindepartemen`;
CREATE TABLE `kon_logindepartemen` (
  `id_logindepartemen` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  PRIMARY KEY (`id_logindepartemen`),
  KEY `id_login` (`id_login`) USING BTREE,
  KEY `id_departemen` (`id_departemen`) USING BTREE,
  CONSTRAINT `id_login_FK2` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_logindepartemen
-- ----------------------------
INSERT INTO `kon_logindepartemen` VALUES ('1', '34', '1');
INSERT INTO `kon_logindepartemen` VALUES ('8', '41', '1');
INSERT INTO `kon_logindepartemen` VALUES ('9', '42', '1');
INSERT INTO `kon_logindepartemen` VALUES ('10', '43', '1');
INSERT INTO `kon_logindepartemen` VALUES ('11', '44', '1');
INSERT INTO `kon_logindepartemen` VALUES ('12', '45', '1');
INSERT INTO `kon_logindepartemen` VALUES ('13', '46', '1');

-- ----------------------------
-- Table structure for kon_loginhistory
-- ----------------------------
DROP TABLE IF EXISTS `kon_loginhistory`;
CREATE TABLE `kon_loginhistory` (
  `id_loginhistory` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_loginhistory`),
  KEY `id_login` (`id_login`) USING BTREE,
  CONSTRAINT `kon_loginhistory_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_loginhistory
-- ----------------------------
INSERT INTO `kon_loginhistory` VALUES ('1', '41', '2015-08-18 03:34:41');
INSERT INTO `kon_loginhistory` VALUES ('2', '41', '2015-08-18 03:34:41');
INSERT INTO `kon_loginhistory` VALUES ('3', '41', '2015-08-18 03:37:06');
INSERT INTO `kon_loginhistory` VALUES ('4', '41', '2015-08-18 03:37:57');
INSERT INTO `kon_loginhistory` VALUES ('5', '41', '2015-08-18 03:37:57');
INSERT INTO `kon_loginhistory` VALUES ('6', '41', '2015-08-18 03:38:21');
INSERT INTO `kon_loginhistory` VALUES ('7', '41', '2015-08-18 03:39:28');
INSERT INTO `kon_loginhistory` VALUES ('8', '41', '2015-08-18 03:39:28');
INSERT INTO `kon_loginhistory` VALUES ('9', '34', '2015-08-18 03:41:03');
INSERT INTO `kon_loginhistory` VALUES ('10', '34', '2015-08-18 03:41:03');
INSERT INTO `kon_loginhistory` VALUES ('11', '42', '2015-08-18 03:41:27');
INSERT INTO `kon_loginhistory` VALUES ('12', '42', '2015-08-18 03:41:27');
INSERT INTO `kon_loginhistory` VALUES ('13', '43', '2015-08-18 03:42:31');
INSERT INTO `kon_loginhistory` VALUES ('14', '43', '2015-08-18 03:42:31');
INSERT INTO `kon_loginhistory` VALUES ('15', '45', '2015-08-18 03:46:13');
INSERT INTO `kon_loginhistory` VALUES ('16', '45', '2015-08-18 03:46:13');
INSERT INTO `kon_loginhistory` VALUES ('17', '34', '2015-08-18 04:45:01');
INSERT INTO `kon_loginhistory` VALUES ('18', '34', '2015-08-18 04:45:01');
INSERT INTO `kon_loginhistory` VALUES ('19', '34', '2015-08-18 11:54:53');
INSERT INTO `kon_loginhistory` VALUES ('20', '34', '2015-08-18 11:54:53');
INSERT INTO `kon_loginhistory` VALUES ('21', '34', '2015-08-18 14:20:08');
INSERT INTO `kon_loginhistory` VALUES ('22', '34', '2015-08-18 14:20:08');
INSERT INTO `kon_loginhistory` VALUES ('23', '34', '2015-08-18 14:22:08');
INSERT INTO `kon_loginhistory` VALUES ('24', '34', '2015-08-18 14:22:08');

-- ----------------------------
-- Table structure for kon_menu
-- ----------------------------
DROP TABLE IF EXISTS `kon_menu`;
CREATE TABLE `kon_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupmenu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_menu
-- ----------------------------
INSERT INTO `kon_menu` VALUES ('1', '4', 'Pendataan Siswa', 'pendataan-siswa', 'double', '7', '9', '');
INSERT INTO `kon_menu` VALUES ('2', '1', 'Presensi Siswa', 'presensi-siswa', 'double', '44', '10', '');
INSERT INTO `kon_menu` VALUES ('3', '1', 'Rapor Siswa', 'rapor-siswa', 'double', '3', '11', '');
INSERT INTO `kon_menu` VALUES ('4', '1', 'Pendataan Alumni', 'pendataan-alumni', 'double', '4', '12', '');
INSERT INTO `kon_menu` VALUES ('8', '5', 'Transaksi', 'transaksi', 'double', '8', '16', '');
INSERT INTO `kon_menu` VALUES ('9', '5', 'Modul Penerimaan Siswa', 'modul-penerimaan-siswa', 'double', '9', '17', '');
INSERT INTO `kon_menu` VALUES ('10', '5', 'Penerimaan Siswa', 'penerimaan-siswa', 'double', '10', '18', '');
INSERT INTO `kon_menu` VALUES ('12', '6', 'Tahun Buku', 'tahun-buku', '', '12', '20', '');
INSERT INTO `kon_menu` VALUES ('13', '6', 'Saldo Awal', 'saldo-rekening', '', '13', '13', '');
INSERT INTO `kon_menu` VALUES ('14', '6', 'Kategori COA', 'kategori-rekening', '', '14', '14', '');
INSERT INTO `kon_menu` VALUES ('15', '6', 'COA', 'detil-rekening', '', '15', '19', '');
INSERT INTO `kon_menu` VALUES ('16', '6', 'Anggaran', 'set-anggaran', '', '16', '16', '');
INSERT INTO `kon_menu` VALUES ('19', '7', 'Warna', 'warna', '', '4', '17', '');
INSERT INTO `kon_menu` VALUES ('20', '8', 'level', 'level', '', '5', '16', '');
INSERT INTO `kon_menu` VALUES ('21', '8', 'user', 'user', '', '7', '15', '');
INSERT INTO `kon_menu` VALUES ('22', '7', 'Icon', 'icon', '', '4', '13', '');
INSERT INTO `kon_menu` VALUES ('24', '2', 'Detail Kelas', 'detail-kelas', 'double', '11', '15', '');
INSERT INTO `kon_menu` VALUES ('25', '3', 'Departemen', 'departemen', '', '3', '11', '');
INSERT INTO `kon_menu` VALUES ('26', '3', 'Angkatan', 'angkatan', '', '11', '15', '');
INSERT INTO `kon_menu` VALUES ('27', '3', 'Tahun Ajaran', 'tahun-ajaran', '', '16', '17', '');
INSERT INTO `kon_menu` VALUES ('28', '3', 'Tingkat', 'tingkat', '', '12', '19', '');
INSERT INTO `kon_menu` VALUES ('29', '3', 'Sub Tingkat', 'subtingkat', '', '14', '14', '');
INSERT INTO `kon_menu` VALUES ('30', '3', 'Kelas', 'kelas', '', '15', '13', '');
INSERT INTO `kon_menu` VALUES ('31', '3', 'Semester', 'semester', '', '13', '12', '');
INSERT INTO `kon_menu` VALUES ('32', '3', 'Jenis Mutasi', 'jenis-mutasi', '', '11', '10', '');
INSERT INTO `kon_menu` VALUES ('33', '3', 'Guru', 'guru', '', '11', '14', '');
INSERT INTO `kon_menu` VALUES ('34', '3', 'Pelajaran', 'pelajaran', '', '12', '14', '');
INSERT INTO `kon_menu` VALUES ('35', '2', 'Jadwal Pelajaran', 'jadwal-pelajaran', 'double', '15', '15', '');
INSERT INTO `kon_menu` VALUES ('36', '2', 'Presensi Guru', 'presensi-guru', 'double', '18', '12', '');
INSERT INTO `kon_menu` VALUES ('37', '2', 'Kegiatan Akademik', 'kegiatan-akademik', 'double', '14', '14', '');
INSERT INTO `kon_menu` VALUES ('38', '1', 'Mutasi', 'mutasi', 'double', '6', '13', '');
INSERT INTO `kon_menu` VALUES ('39', '3', 'Detail Pelajaran', 'detail-pelajaran', '', '13', '15', '');
INSERT INTO `kon_menu` VALUES ('40', '1', 'Pendataan Siswa', 'pendataan-siswa', 'double', '13', '15', '');
INSERT INTO `kon_menu` VALUES ('41', '9', 'Set Biaya Calon Siswa', 'set-biaya-calon-siswa', '', '14', '15', '');
INSERT INTO `kon_menu` VALUES ('42', '9', 'set Diskon', 'set-diskon', '', '14', '15', '');
INSERT INTO `kon_menu` VALUES ('43', '9', 'set Angsuran', 'set-angsuran', '', '17', '13', '');
INSERT INTO `kon_menu` VALUES ('44', '9', 'golongan Calon Siswa', 'golongan-calon-siswa', '', '13', '16', '');
INSERT INTO `kon_menu` VALUES ('45', '7', 'menu', 'menu', '', '14', '16', '');
INSERT INTO `kon_menu` VALUES ('46', '7', 'Grup Modul', 'grup-modul', '', '13', '12', '');
INSERT INTO `kon_menu` VALUES ('47', '7', 'Modul', 'modul', '', '12', '11', '');
INSERT INTO `kon_menu` VALUES ('48', '7', 'Grup Menu', 'grup-menu', '', '16', '13', '');
INSERT INTO `kon_menu` VALUES ('52', '4', 'Kelompok Pendaftaran', 'kelompok', 'double', '16', '10', 'kelompok pendaftaran  (gelombang)');
INSERT INTO `kon_menu` VALUES ('53', '4', 'Penerimaan Siswa Baru', 'penerimaan', 'double', '4', '10', 'penerimaan siswa (pendaftaran NIS dan NISN)');
INSERT INTO `kon_menu` VALUES ('54', '14', 'Perangkat', 'perangkat', '', '16', '10', 'ok');
INSERT INTO `kon_menu` VALUES ('55', '14', 'Lokasi', 'lokasi', '', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('56', '14', 'Jenis Koleksi', 'jenis-koleksi', '', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('57', '14', 'Tingkat Koleksi', 'tingkat-koleksi', '', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('58', '14', 'Klasifikasi', 'klasifikasi', '', '41', '10', '');
INSERT INTO `kon_menu` VALUES ('59', '14', 'Daftar Pengunjung', 'daftar-pengunjung', '', '17', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('60', '14', 'Daftar Penerbit', 'daftar-penerbit', '', '10', '10', '');
INSERT INTO `kon_menu` VALUES ('61', '14', 'Daftar-Bahasa', 'daftar-bahasa', '', '24', '10', '');
INSERT INTO `kon_menu` VALUES ('62', '14', 'Satuan Mata Uang', 'stuan-mata-uang', '', '8', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('63', '15', 'Katalog', 'katalog', 'double', '7', '10', '');
INSERT INTO `kon_menu` VALUES ('64', '15', 'Daftar Koleksi', 'daftar-koleksi', 'double', '7', '20', '');
INSERT INTO `kon_menu` VALUES ('65', '15', 'Data Anggota', 'data-anggota', '', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('66', '15', 'Sirkulasi', 'sirkulasi', 'double', '18', '10', '');
INSERT INTO `kon_menu` VALUES ('67', '15', 'Stock Opname', 'stock-opname', 'double', '47', '17', '');
INSERT INTO `kon_menu` VALUES ('68', '15', 'OPAC', 'opac', 'double', '19', '12', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_modul
-- ----------------------------
INSERT INTO `kon_modul` VALUES ('1', '1', 'akademik', 'akademik', '13', '9', 'double', '');
INSERT INTO `kon_modul` VALUES ('2', '1', 'psb', 'penerimaan siswa baru', '14', '10', 'double', '');
INSERT INTO `kon_modul` VALUES ('3', '1', 'perpus', 'perpustakaan', '3', '11', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('4', '1', 'sarpras', 'sarana dan prasarana', '4', '12', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('5', '2', 'hrd', 'kepegawaian', '5', '13', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('6', '2', 'keuangan', 'keuangan', '6', '14', 'double double-vertical', '');
INSERT INTO `kon_modul` VALUES ('7', '2', 'student', 'student services', '7', '15', 'double', '');
INSERT INTO `kon_modul` VALUES ('9', '3', 'konfigurasi', 'konfigurasi', '13', '14', 'double', '');
INSERT INTO `kon_modul` VALUES ('13', '2', 'purchaseorder', 'purchase order', '32', '20', 'double', '');

-- ----------------------------
-- Table structure for kon_privillege
-- ----------------------------
DROP TABLE IF EXISTS `kon_privillege`;
CREATE TABLE `kon_privillege` (
  `id_privillege` int(11) NOT NULL AUTO_INCREMENT,
  `id_login` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_privillege`),
  KEY `id_login` (`id_login`) USING BTREE,
  KEY `id_menu` (`id_menu`) USING BTREE,
  CONSTRAINT `id_login_FK` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_menu_FK` FOREIGN KEY (`id_menu`) REFERENCES `kon_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_privillege
-- ----------------------------
INSERT INTO `kon_privillege` VALUES ('1', '34', '1', '1');
INSERT INTO `kon_privillege` VALUES ('2', '34', '2', '1');
INSERT INTO `kon_privillege` VALUES ('3', '34', '3', '1');
INSERT INTO `kon_privillege` VALUES ('4', '34', '4', '1');
INSERT INTO `kon_privillege` VALUES ('5', '34', '8', '1');
INSERT INTO `kon_privillege` VALUES ('6', '34', '9', '1');
INSERT INTO `kon_privillege` VALUES ('7', '34', '10', '1');
INSERT INTO `kon_privillege` VALUES ('8', '34', '12', '1');
INSERT INTO `kon_privillege` VALUES ('9', '34', '13', '1');
INSERT INTO `kon_privillege` VALUES ('10', '34', '14', '1');
INSERT INTO `kon_privillege` VALUES ('11', '34', '15', '1');
INSERT INTO `kon_privillege` VALUES ('12', '34', '16', '1');
INSERT INTO `kon_privillege` VALUES ('13', '34', '19', '1');
INSERT INTO `kon_privillege` VALUES ('14', '34', '20', '1');
INSERT INTO `kon_privillege` VALUES ('15', '34', '21', '1');
INSERT INTO `kon_privillege` VALUES ('16', '34', '22', '1');
INSERT INTO `kon_privillege` VALUES ('17', '34', '24', '1');
INSERT INTO `kon_privillege` VALUES ('18', '34', '25', '1');
INSERT INTO `kon_privillege` VALUES ('19', '34', '26', '1');
INSERT INTO `kon_privillege` VALUES ('20', '34', '27', '1');
INSERT INTO `kon_privillege` VALUES ('21', '34', '28', '1');
INSERT INTO `kon_privillege` VALUES ('22', '34', '29', '1');
INSERT INTO `kon_privillege` VALUES ('23', '34', '30', '1');
INSERT INTO `kon_privillege` VALUES ('24', '34', '31', '1');
INSERT INTO `kon_privillege` VALUES ('25', '34', '32', '1');
INSERT INTO `kon_privillege` VALUES ('26', '34', '33', '1');
INSERT INTO `kon_privillege` VALUES ('27', '34', '34', '1');
INSERT INTO `kon_privillege` VALUES ('28', '34', '35', '1');
INSERT INTO `kon_privillege` VALUES ('29', '34', '36', '1');
INSERT INTO `kon_privillege` VALUES ('30', '34', '37', '1');
INSERT INTO `kon_privillege` VALUES ('31', '34', '38', '1');
INSERT INTO `kon_privillege` VALUES ('32', '34', '39', '1');
INSERT INTO `kon_privillege` VALUES ('33', '34', '40', '1');
INSERT INTO `kon_privillege` VALUES ('34', '34', '41', '1');
INSERT INTO `kon_privillege` VALUES ('35', '34', '42', '1');
INSERT INTO `kon_privillege` VALUES ('36', '34', '43', '1');
INSERT INTO `kon_privillege` VALUES ('37', '34', '44', '1');
INSERT INTO `kon_privillege` VALUES ('38', '34', '45', '1');
INSERT INTO `kon_privillege` VALUES ('39', '34', '46', '1');
INSERT INTO `kon_privillege` VALUES ('40', '34', '47', '1');
INSERT INTO `kon_privillege` VALUES ('41', '34', '48', '1');
INSERT INTO `kon_privillege` VALUES ('42', '34', '52', '1');
INSERT INTO `kon_privillege` VALUES ('43', '34', '53', '1');
INSERT INTO `kon_privillege` VALUES ('44', '34', '54', '1');
INSERT INTO `kon_privillege` VALUES ('45', '34', '55', '1');
INSERT INTO `kon_privillege` VALUES ('46', '34', '56', '1');
INSERT INTO `kon_privillege` VALUES ('47', '34', '57', '1');
INSERT INTO `kon_privillege` VALUES ('48', '34', '58', '1');
INSERT INTO `kon_privillege` VALUES ('49', '34', '59', '1');
INSERT INTO `kon_privillege` VALUES ('50', '34', '60', '1');
INSERT INTO `kon_privillege` VALUES ('51', '34', '61', '1');
INSERT INTO `kon_privillege` VALUES ('52', '34', '62', '1');
INSERT INTO `kon_privillege` VALUES ('53', '34', '63', '1');
INSERT INTO `kon_privillege` VALUES ('54', '34', '64', '1');
INSERT INTO `kon_privillege` VALUES ('55', '34', '65', '1');
INSERT INTO `kon_privillege` VALUES ('56', '34', '66', '1');
INSERT INTO `kon_privillege` VALUES ('57', '34', '67', '1');
INSERT INTO `kon_privillege` VALUES ('58', '34', '68', '1');
INSERT INTO `kon_privillege` VALUES ('120', '41', '26', '0');
INSERT INTO `kon_privillege` VALUES ('121', '41', '25', '0');
INSERT INTO `kon_privillege` VALUES ('122', '41', '39', '0');
INSERT INTO `kon_privillege` VALUES ('123', '41', '33', '0');
INSERT INTO `kon_privillege` VALUES ('124', '41', '32', '0');
INSERT INTO `kon_privillege` VALUES ('125', '41', '30', '0');
INSERT INTO `kon_privillege` VALUES ('126', '41', '34', '0');
INSERT INTO `kon_privillege` VALUES ('127', '41', '31', '0');
INSERT INTO `kon_privillege` VALUES ('128', '41', '29', '0');
INSERT INTO `kon_privillege` VALUES ('129', '41', '27', '0');
INSERT INTO `kon_privillege` VALUES ('130', '41', '28', '0');
INSERT INTO `kon_privillege` VALUES ('131', '41', '24', '0');
INSERT INTO `kon_privillege` VALUES ('132', '41', '35', '0');
INSERT INTO `kon_privillege` VALUES ('133', '41', '37', '0');
INSERT INTO `kon_privillege` VALUES ('134', '41', '48', '0');
INSERT INTO `kon_privillege` VALUES ('135', '41', '46', '0');
INSERT INTO `kon_privillege` VALUES ('136', '41', '22', '0');
INSERT INTO `kon_privillege` VALUES ('137', '41', '45', '0');
INSERT INTO `kon_privillege` VALUES ('138', '41', '47', '0');
INSERT INTO `kon_privillege` VALUES ('139', '41', '19', '0');
INSERT INTO `kon_privillege` VALUES ('140', '41', '20', '0');
INSERT INTO `kon_privillege` VALUES ('141', '41', '21', '0');
INSERT INTO `kon_privillege` VALUES ('142', '42', '48', '1');
INSERT INTO `kon_privillege` VALUES ('143', '42', '46', '1');
INSERT INTO `kon_privillege` VALUES ('144', '42', '22', '1');
INSERT INTO `kon_privillege` VALUES ('145', '42', '45', '1');
INSERT INTO `kon_privillege` VALUES ('146', '42', '47', '1');
INSERT INTO `kon_privillege` VALUES ('147', '42', '19', '1');
INSERT INTO `kon_privillege` VALUES ('148', '42', '20', '1');
INSERT INTO `kon_privillege` VALUES ('149', '42', '21', '1');
INSERT INTO `kon_privillege` VALUES ('150', '43', '20', '1');
INSERT INTO `kon_privillege` VALUES ('151', '43', '21', '1');
INSERT INTO `kon_privillege` VALUES ('152', '44', '20', '1');
INSERT INTO `kon_privillege` VALUES ('153', '44', '21', '1');
INSERT INTO `kon_privillege` VALUES ('154', '45', '26', '0');
INSERT INTO `kon_privillege` VALUES ('155', '45', '25', '0');
INSERT INTO `kon_privillege` VALUES ('156', '45', '39', '0');
INSERT INTO `kon_privillege` VALUES ('157', '45', '33', '0');
INSERT INTO `kon_privillege` VALUES ('158', '45', '32', '0');
INSERT INTO `kon_privillege` VALUES ('159', '45', '30', '0');
INSERT INTO `kon_privillege` VALUES ('160', '45', '34', '0');
INSERT INTO `kon_privillege` VALUES ('161', '45', '31', '0');
INSERT INTO `kon_privillege` VALUES ('162', '45', '29', '0');
INSERT INTO `kon_privillege` VALUES ('163', '45', '28', '0');
INSERT INTO `kon_privillege` VALUES ('164', '45', '24', '0');
INSERT INTO `kon_privillege` VALUES ('165', '45', '35', '0');
INSERT INTO `kon_privillege` VALUES ('166', '45', '37', '0');
INSERT INTO `kon_privillege` VALUES ('167', '45', '38', '0');
INSERT INTO `kon_privillege` VALUES ('168', '45', '4', '0');
INSERT INTO `kon_privillege` VALUES ('169', '45', '40', '0');
INSERT INTO `kon_privillege` VALUES ('170', '45', '48', '0');
INSERT INTO `kon_privillege` VALUES ('171', '45', '46', '0');
INSERT INTO `kon_privillege` VALUES ('172', '45', '45', '0');
INSERT INTO `kon_privillege` VALUES ('173', '45', '47', '0');
INSERT INTO `kon_privillege` VALUES ('174', '45', '21', '0');
INSERT INTO `kon_privillege` VALUES ('175', '46', '26', '0');
INSERT INTO `kon_privillege` VALUES ('176', '46', '25', '0');
INSERT INTO `kon_privillege` VALUES ('177', '46', '39', '0');
INSERT INTO `kon_privillege` VALUES ('178', '46', '33', '0');
INSERT INTO `kon_privillege` VALUES ('179', '46', '32', '0');
INSERT INTO `kon_privillege` VALUES ('180', '46', '30', '0');
INSERT INTO `kon_privillege` VALUES ('181', '46', '34', '0');
INSERT INTO `kon_privillege` VALUES ('182', '46', '31', '0');
INSERT INTO `kon_privillege` VALUES ('183', '46', '29', '0');
INSERT INTO `kon_privillege` VALUES ('184', '46', '27', '0');
INSERT INTO `kon_privillege` VALUES ('185', '46', '28', '0');
INSERT INTO `kon_privillege` VALUES ('186', '46', '16', '0');
INSERT INTO `kon_privillege` VALUES ('187', '46', '15', '0');
INSERT INTO `kon_privillege` VALUES ('188', '46', '14', '0');
INSERT INTO `kon_privillege` VALUES ('189', '46', '13', '0');
INSERT INTO `kon_privillege` VALUES ('190', '46', '12', '0');

-- ----------------------------
-- Table structure for kon_warna
-- ----------------------------
DROP TABLE IF EXISTS `kon_warna`;
CREATE TABLE `kon_warna` (
  `id_warna` int(11) NOT NULL AUTO_INCREMENT,
  `warna` varchar(25) NOT NULL,
  PRIMARY KEY (`id_warna`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_warna
-- ----------------------------
INSERT INTO `kon_warna` VALUES ('1', 'black');
INSERT INTO `kon_warna` VALUES ('2', 'white');
INSERT INTO `kon_warna` VALUES ('3', 'lime');
INSERT INTO `kon_warna` VALUES ('4', 'green');
INSERT INTO `kon_warna` VALUES ('5', 'emerald');
INSERT INTO `kon_warna` VALUES ('6', 'teal');
INSERT INTO `kon_warna` VALUES ('7', 'cyan');
INSERT INTO `kon_warna` VALUES ('8', 'cobalt');
INSERT INTO `kon_warna` VALUES ('9', 'indigo');
INSERT INTO `kon_warna` VALUES ('10', 'violet');
INSERT INTO `kon_warna` VALUES ('11', 'pink');
INSERT INTO `kon_warna` VALUES ('12', 'magenta');
INSERT INTO `kon_warna` VALUES ('13', 'crimson');
INSERT INTO `kon_warna` VALUES ('14', 'red');
INSERT INTO `kon_warna` VALUES ('15', 'orange');
INSERT INTO `kon_warna` VALUES ('16', 'amber');
INSERT INTO `kon_warna` VALUES ('17', 'yellow');
INSERT INTO `kon_warna` VALUES ('18', 'brown');
INSERT INTO `kon_warna` VALUES ('19', 'olive');
INSERT INTO `kon_warna` VALUES ('20', 'steel');
INSERT INTO `kon_warna` VALUES ('21', 'mauve');
INSERT INTO `kon_warna` VALUES ('22', 'taupe');
INSERT INTO `kon_warna` VALUES ('23', 'gray');
INSERT INTO `kon_warna` VALUES ('24', 'dark');
INSERT INTO `kon_warna` VALUES ('25', 'darker');
INSERT INTO `kon_warna` VALUES ('26', 'transparent');
INSERT INTO `kon_warna` VALUES ('27', 'darkBrown');
INSERT INTO `kon_warna` VALUES ('28', 'darkCrimson');
INSERT INTO `kon_warna` VALUES ('29', 'darkMagenta');
INSERT INTO `kon_warna` VALUES ('30', 'darkIndigo');
INSERT INTO `kon_warna` VALUES ('31', 'darkCyan');
INSERT INTO `kon_warna` VALUES ('32', 'darkCobalt');
INSERT INTO `kon_warna` VALUES ('33', 'darkTeal');
INSERT INTO `kon_warna` VALUES ('34', 'darkEmerald');
INSERT INTO `kon_warna` VALUES ('35', 'darkGreen');
INSERT INTO `kon_warna` VALUES ('36', 'darkOrange');
INSERT INTO `kon_warna` VALUES ('37', 'darkRed');
INSERT INTO `kon_warna` VALUES ('38', 'darkPink');
INSERT INTO `kon_warna` VALUES ('39', 'darkViolet');
INSERT INTO `kon_warna` VALUES ('40', 'darkBlue');
INSERT INTO `kon_warna` VALUES ('41', 'lightBlue');
INSERT INTO `kon_warna` VALUES ('42', 'lightTeal');
INSERT INTO `kon_warna` VALUES ('43', 'lightOlive');
INSERT INTO `kon_warna` VALUES ('44', 'lightOrange');
INSERT INTO `kon_warna` VALUES ('45', 'lightPink');
INSERT INTO `kon_warna` VALUES ('46', 'lightRed');
INSERT INTO `kon_warna` VALUES ('47', 'lightGreen');
