/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-09-17 00:39:18
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_grupmenu
-- ----------------------------
INSERT INTO `kon_grupmenu` VALUES ('1', '2', '1', 'Menu Kesiswaan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('2', '2', '1', 'Menu Belajar - Mengajar', 'four');
INSERT INTO `kon_grupmenu` VALUES ('3', '1', '1', 'Menu Master', 'four');
INSERT INTO `kon_grupmenu` VALUES ('4', '2', '2', 'Menu Transaksi', 'four');
INSERT INTO `kon_grupmenu` VALUES ('5', '2', '6', 'Menu Transaksi ', 'double');
INSERT INTO `kon_grupmenu` VALUES ('6', '1', '6', 'Menu Master', 'double');
INSERT INTO `kon_grupmenu` VALUES ('7', '1', '9', 'Menu Sistem', 'double');
INSERT INTO `kon_grupmenu` VALUES ('8', '2', '9', 'Menu User', 'double');
INSERT INTO `kon_grupmenu` VALUES ('9', '1', '2', 'Menu Master', 'four');
INSERT INTO `kon_grupmenu` VALUES ('14', '1', '3', 'Menu Master ', 'double double-vertic');
INSERT INTO `kon_grupmenu` VALUES ('15', '2', '3', 'Menu Transaksi', 'double double-vertic');
INSERT INTO `kon_grupmenu` VALUES ('16', '1', '5', 'Master HRD', 'four');
INSERT INTO `kon_grupmenu` VALUES ('17', '2', '5', 'Transaksi HRD', 'four');
INSERT INTO `kon_grupmenu` VALUES ('18', '2', '5', 'Penggajian', 'four');
INSERT INTO `kon_grupmenu` VALUES ('19', '1', '7', 'Master Student Service', 'four');
INSERT INTO `kon_grupmenu` VALUES ('20', '2', '7', 'Pembelian', 'four');
INSERT INTO `kon_grupmenu` VALUES ('21', '2', '7', 'Penjualan', '');
INSERT INTO `kon_grupmenu` VALUES ('24', '2', '7', 'Jasa', 'four');
INSERT INTO `kon_grupmenu` VALUES ('25', '2', '7', 'Hutang / Piutang', 'four');
INSERT INTO `kon_grupmenu` VALUES ('26', '2', '7', 'biaya', 'four');
INSERT INTO `kon_grupmenu` VALUES ('27', '2', '7', 'Laporan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('28', '2', '7', 'Setting', '');
INSERT INTO `kon_grupmenu` VALUES ('29', '1', '13', 'Master PO', 'four');
INSERT INTO `kon_grupmenu` VALUES ('30', '2', '13', 'Permintaan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('31', '1', '13', 'Penawaran', 'four');
INSERT INTO `kon_grupmenu` VALUES ('32', '2', '13', 'Pemesanan', 'four');
INSERT INTO `kon_grupmenu` VALUES ('33', '2', '13', 'Pembelian', 'four');
INSERT INTO `kon_grupmenu` VALUES ('34', '2', '13', 'setting', '');
INSERT INTO `kon_grupmenu` VALUES ('35', '1', '4', 'Transaksi Sarpras', 'four');
INSERT INTO `kon_grupmenu` VALUES ('37', '1', '4', 'Master Sarpras', 'four');
INSERT INTO `kon_grupmenu` VALUES ('38', '1', '14', 'setting', 'four');
INSERT INTO `kon_grupmenu` VALUES ('39', '2', '14', 'transaksi', 'four');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_login
-- ----------------------------
INSERT INTO `kon_login` VALUES ('2', 'superadmin', 'superadmin', 'MTdjNDUyMGY2Y2ZkMWFiNTNkODc0NWU4NDY4MWViNDk=', '17', '0', '1', '', '0000-00-00 00:00:00');
INSERT INTO `kon_login` VALUES ('5', 'Mr. Boss', 'admin', 'MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=', '17', '0', '1', '', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_logindepartemen
-- ----------------------------
INSERT INTO `kon_logindepartemen` VALUES ('1', '2', '1');
INSERT INTO `kon_logindepartemen` VALUES ('2', '2', '2');
INSERT INTO `kon_logindepartemen` VALUES ('3', '2', '3');
INSERT INTO `kon_logindepartemen` VALUES ('10', '5', '1');
INSERT INTO `kon_logindepartemen` VALUES ('11', '5', '2');
INSERT INTO `kon_logindepartemen` VALUES ('12', '5', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_loginhistory
-- ----------------------------
INSERT INTO `kon_loginhistory` VALUES ('5', '2', '2015-09-11 22:34:05');
INSERT INTO `kon_loginhistory` VALUES ('6', '2', '2015-09-11 22:34:05');
INSERT INTO `kon_loginhistory` VALUES ('47', '5', '2015-09-16 20:42:27');
INSERT INTO `kon_loginhistory` VALUES ('48', '5', '2015-09-16 20:42:27');
INSERT INTO `kon_loginhistory` VALUES ('49', '5', '2015-09-16 20:57:19');
INSERT INTO `kon_loginhistory` VALUES ('50', '5', '2015-09-16 20:57:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_menu
-- ----------------------------
INSERT INTO `kon_menu` VALUES ('1', '4', 'Siswa', 'siswa', 'double', '7', '9', '');
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
INSERT INTO `kon_menu` VALUES ('28', '3', 'Tingkat', 'tingkat', '', '12', '18', '');
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
INSERT INTO `kon_menu` VALUES ('41', '9', 'Biaya', 'biaya', '', '14', '15', '');
INSERT INTO `kon_menu` VALUES ('42', '9', 'Diskon', 'diskon', '', '14', '15', '');
INSERT INTO `kon_menu` VALUES ('43', '9', 'Angsuran', 'angsuran', '', '17', '13', '');
INSERT INTO `kon_menu` VALUES ('44', '9', 'golongan', 'golongan', '', '13', '16', '');
INSERT INTO `kon_menu` VALUES ('45', '7', 'menu', 'menu', '', '14', '16', '');
INSERT INTO `kon_menu` VALUES ('46', '7', 'Grup Modul', 'grup-modul', '', '13', '12', '');
INSERT INTO `kon_menu` VALUES ('47', '7', 'Modul', 'modul', '', '12', '11', '');
INSERT INTO `kon_menu` VALUES ('48', '7', 'Grup Menu', 'grup-menu', '', '16', '13', '');
INSERT INTO `kon_menu` VALUES ('52', '9', 'Gelombang', 'gelombang', '', '16', '10', 'kelompok pendaftaran  (gelombang)');
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
INSERT INTO `kon_menu` VALUES ('69', '16', 'Agama', 'agama', '', '16', '10', 'setting data master agama');
INSERT INTO `kon_menu` VALUES ('70', '16', 'Pendidikan', 'pendidikan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('71', '16', 'Departemen', 'departemen', '', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('72', '16', 'Jabatan', 'jabatan', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('73', '16', 'Status Karyawan', 'status-karyawan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('74', '16', 'Golongan', 'golongan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('75', '17', 'Berkas', 'berkas', 'double', '34', '10', '');
INSERT INTO `kon_menu` VALUES ('76', '17', 'Absensi', 'absensi', 'double', '16', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('77', '17', 'Cuti', 'cuti', 'double', '7', '10', '');
INSERT INTO `kon_menu` VALUES ('78', '17', 'Pinjaman', 'pinjaman', 'double', '17', '10', '');
INSERT INTO `kon_menu` VALUES ('79', '17', 'Karyawan', 'karyawan', 'double', '27', '12', '');
INSERT INTO `kon_menu` VALUES ('80', '18', 'Penggajian', 'penggajian', 'double', '8', '10', '');
INSERT INTO `kon_menu` VALUES ('81', '18', 'Laporan', 'laporan', '', '10', '12', '');
INSERT INTO `kon_menu` VALUES ('82', '18', 'Setting BPJS', 'setting-bpjs', 'double', '5', '17', '');
INSERT INTO `kon_menu` VALUES ('83', '18', 'Golongan', 'golongan ', 'double', '22', '11', '');
INSERT INTO `kon_menu` VALUES ('84', '18', 'struktural', 'struktural', '', '41', '17', '');
INSERT INTO `kon_menu` VALUES ('85', '18', 'Fungsional', 'Fungsional', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('86', '18', 'Pengabdian', 'Pengabdian', '', '24', '17', '');
INSERT INTO `kon_menu` VALUES ('87', '18', 'istri anak', 'istri-anak', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('88', '18', 'uang transport', 'uang-transport', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('89', '18', 'beban tugas', 'beban-tugas', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('90', '18', 'wali kelas', 'wali-kelas', 'double', '13', '11', '');
INSERT INTO `kon_menu` VALUES ('91', '19', 'Jenjang', 'jenjang', 'double', '8', '10', '');
INSERT INTO `kon_menu` VALUES ('92', '19', 'Kategori', 'kategori', 'double', '8', '1', '');
INSERT INTO `kon_menu` VALUES ('93', '19', 'produk', 'produk', 'double', '8', '10', '');
INSERT INTO `kon_menu` VALUES ('94', '19', 'produk jasa', 'produk-jasa', 'double', '1', '11', '');
INSERT INTO `kon_menu` VALUES ('95', '19', 'beban biaya', 'beban-biaya', 'double', '8', '10', '');
INSERT INTO `kon_menu` VALUES ('96', '19', 'supplier', 'supplier', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('97', '19', 'customer', 'customer', 'double', '8', '11', '');
INSERT INTO `kon_menu` VALUES ('98', '20', 'PO Pembelian', 'PO-Pembelian', 'double', '16', '14', '');
INSERT INTO `kon_menu` VALUES ('99', '20', 'Pembelian', 'Pembelian', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('100', '20', 'laporan pembelian', 'laporan-pembelian', 'double', '1', '12', '');
INSERT INTO `kon_menu` VALUES ('101', '20', 'retur pembelian', 'retur-pembelian', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('102', '20', 'laporan retur pembelian', 'laporan-retur-pembelian', 'double', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('103', '21', 'PO Penjualan', 'PO-Penjualan', 'double', '27', '17', '');
INSERT INTO `kon_menu` VALUES ('104', '21', 'Penjualan', 'Penjualan', 'double', '20', '1', '');
INSERT INTO `kon_menu` VALUES ('105', '21', 'Retur Penjualaan', 'Retur-Penjualaan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('106', '21', 'Laporan Penjualan', 'Laporan-Penjualan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('107', '21', 'Laporan Retur Penjualan', 'Laporan-Retur-Penjualan', 'double', '18', '1', '');
INSERT INTO `kon_menu` VALUES ('108', '24', 'Penjualaan Jasa', 'Penjualaan-Jasa', 'double', '16', '1', '\r\n');
INSERT INTO `kon_menu` VALUES ('109', '24', 'Laporan Penjualaan Jasa', 'Laporan-Penjualaan-Jasa', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('110', '25', 'Hutang', 'hutang', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('111', '25', 'pembayaran', 'pembayaran', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('112', '25', 'laporan hutang', 'laporan-hutang', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('113', '25', 'laporan pembayaran', 'laporan-pembayaran', 'double', '16', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('114', '26', 'Transaksi Biaya', 'Transaksi-Biaya', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('115', '26', 'Laporan Biaya', 'Laporan-Biaya', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('116', '27', 'Laporan Stok', 'Laporan-Stok', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('117', '27', 'Laporan Laba/Rugi', 'Laporan-Laba/Rugi', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('119', '27', 'Laporan Pembelian', 'Laporan-Pembelian', 'double', '7', '10', '');
INSERT INTO `kon_menu` VALUES ('120', '27', 'Laporan Retur Pembelian', 'Laporan-Retur-Pembelian', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('121', '27', 'Laporan Retur Penjualan', 'Laporan-Retur-Penjualan', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('122', '27', 'Laporan Penjualan', 'Laporan-Penjualan', 'double', '16', '17', '');
INSERT INTO `kon_menu` VALUES ('123', '28', 'User', 'user', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('124', '28', 'password', 'password', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('125', '29', 'supplier', 'supplier', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('126', '30', 'Purchase Requisition', 'Purchase-Requisition', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('127', '30', 'Laporan Permintaan', 'Laporan-Perrmintaan', 'double', '18', '10', '');
INSERT INTO `kon_menu` VALUES ('128', '30', 'Batal Purchase Requisition', 'Batal-Purchase-Requisition', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('129', '31', 'Penawaran', 'Penawaran', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('130', '31', 'Laporan Penawaran', 'Laporan-Penawaran', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('131', '31', 'Formulir Fisik Penawaran ', 'Formulir-Fisik-Penawaran ', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('132', '32', 'Purchase Order', 'Purchase-Order', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('133', '32', 'Laporan Pemesanan', 'Laporan-Pemesanan', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('134', '32', 'Batal Purchase Order', 'Batal \\-Purchase-Order', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('135', '33', 'Pembelian', 'Pembelian', 'double', '1', '10', '');
INSERT INTO `kon_menu` VALUES ('136', '33', 'Laporan Pembelian', 'Laporan-Pembelian', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('137', '33', 'Retur Pembelian', 'Retur-Pembelian', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('138', '33', 'Laporan Retur PEmbelian', 'Laporan-Retur-PEmbelian', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('139', '34', 'User', 'User', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('140', '34', 'password', 'password', 'double', '16', '1', '');
INSERT INTO `kon_menu` VALUES ('141', '37', 'Lokasi', 'lokasi', 'double', '1', '10', '');
INSERT INTO `kon_menu` VALUES ('142', '37', 'Tempat', 'tempat', 'double', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('143', '37', 'Tempat', 'tempat', 'double', '20', '12', '');
INSERT INTO `kon_menu` VALUES ('144', '35', 'Inventaris', 'inventaris', 'double', '8', '15', '');
INSERT INTO `kon_menu` VALUES ('145', '35', 'Peminjaman', 'peminjaman', 'double', '18', '17', '');
INSERT INTO `kon_menu` VALUES ('146', '35', 'aktivitas', 'aktivitas', 'double', '7', '12', '');
INSERT INTO `kon_menu` VALUES ('147', '38', 'user', 'user', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('148', '39', 'tahap2', 'tahap2', 'double', '16', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('149', '38', 'password', 'password', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('150', '39', 'tahap1', 'tahap1', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('151', '39', 'tahap3', 'tahap3', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('152', '4', 'Detail Diskon', 'detail-diskon', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('153', '4', 'Detail Gelombang', 'detail-gelombang', 'double', '8', '11', '');
INSERT INTO `kon_menu` VALUES ('154', '9', 'dokumen', 'dokumen', '', '8', '10', '');
INSERT INTO `kon_menu` VALUES ('155', '4', 'Detail Biaya', 'detail-biaya', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('156', '4', 'reminder ultah', 'reminder-ultah', '', '18', '14', '');
INSERT INTO `kon_menu` VALUES ('157', '4', 'Rekapitulasi Siswa', 'rekapitulasi-siswa', '', '10', '18', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

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
INSERT INTO `kon_modul` VALUES ('14', '3', 'marketingpsb', 'marketingpsb', '16', '10', 'double', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=2565 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_privillege
-- ----------------------------
INSERT INTO `kon_privillege` VALUES ('1987', '2', '1', '1');
INSERT INTO `kon_privillege` VALUES ('1988', '2', '2', '1');
INSERT INTO `kon_privillege` VALUES ('1989', '2', '3', '1');
INSERT INTO `kon_privillege` VALUES ('1990', '2', '4', '1');
INSERT INTO `kon_privillege` VALUES ('1991', '2', '8', '1');
INSERT INTO `kon_privillege` VALUES ('1992', '2', '9', '1');
INSERT INTO `kon_privillege` VALUES ('1993', '2', '10', '1');
INSERT INTO `kon_privillege` VALUES ('1994', '2', '12', '1');
INSERT INTO `kon_privillege` VALUES ('1995', '2', '13', '1');
INSERT INTO `kon_privillege` VALUES ('1996', '2', '14', '1');
INSERT INTO `kon_privillege` VALUES ('1997', '2', '15', '1');
INSERT INTO `kon_privillege` VALUES ('1998', '2', '16', '1');
INSERT INTO `kon_privillege` VALUES ('1999', '2', '19', '1');
INSERT INTO `kon_privillege` VALUES ('2000', '2', '20', '1');
INSERT INTO `kon_privillege` VALUES ('2001', '2', '21', '1');
INSERT INTO `kon_privillege` VALUES ('2002', '2', '22', '1');
INSERT INTO `kon_privillege` VALUES ('2003', '2', '24', '1');
INSERT INTO `kon_privillege` VALUES ('2004', '2', '25', '1');
INSERT INTO `kon_privillege` VALUES ('2005', '2', '26', '1');
INSERT INTO `kon_privillege` VALUES ('2006', '2', '27', '1');
INSERT INTO `kon_privillege` VALUES ('2007', '2', '28', '1');
INSERT INTO `kon_privillege` VALUES ('2008', '2', '29', '1');
INSERT INTO `kon_privillege` VALUES ('2009', '2', '30', '1');
INSERT INTO `kon_privillege` VALUES ('2010', '2', '31', '1');
INSERT INTO `kon_privillege` VALUES ('2011', '2', '32', '1');
INSERT INTO `kon_privillege` VALUES ('2012', '2', '33', '1');
INSERT INTO `kon_privillege` VALUES ('2013', '2', '34', '1');
INSERT INTO `kon_privillege` VALUES ('2014', '2', '35', '1');
INSERT INTO `kon_privillege` VALUES ('2015', '2', '36', '1');
INSERT INTO `kon_privillege` VALUES ('2016', '2', '37', '1');
INSERT INTO `kon_privillege` VALUES ('2017', '2', '38', '1');
INSERT INTO `kon_privillege` VALUES ('2018', '2', '39', '1');
INSERT INTO `kon_privillege` VALUES ('2019', '2', '40', '1');
INSERT INTO `kon_privillege` VALUES ('2020', '2', '41', '1');
INSERT INTO `kon_privillege` VALUES ('2021', '2', '42', '1');
INSERT INTO `kon_privillege` VALUES ('2022', '2', '43', '1');
INSERT INTO `kon_privillege` VALUES ('2023', '2', '44', '1');
INSERT INTO `kon_privillege` VALUES ('2024', '2', '45', '1');
INSERT INTO `kon_privillege` VALUES ('2025', '2', '46', '1');
INSERT INTO `kon_privillege` VALUES ('2026', '2', '47', '1');
INSERT INTO `kon_privillege` VALUES ('2027', '2', '48', '1');
INSERT INTO `kon_privillege` VALUES ('2028', '2', '52', '1');
INSERT INTO `kon_privillege` VALUES ('2029', '2', '54', '1');
INSERT INTO `kon_privillege` VALUES ('2030', '2', '55', '1');
INSERT INTO `kon_privillege` VALUES ('2031', '2', '56', '1');
INSERT INTO `kon_privillege` VALUES ('2032', '2', '57', '1');
INSERT INTO `kon_privillege` VALUES ('2033', '2', '58', '1');
INSERT INTO `kon_privillege` VALUES ('2034', '2', '59', '1');
INSERT INTO `kon_privillege` VALUES ('2035', '2', '60', '1');
INSERT INTO `kon_privillege` VALUES ('2036', '2', '61', '1');
INSERT INTO `kon_privillege` VALUES ('2037', '2', '62', '1');
INSERT INTO `kon_privillege` VALUES ('2038', '2', '63', '1');
INSERT INTO `kon_privillege` VALUES ('2039', '2', '64', '1');
INSERT INTO `kon_privillege` VALUES ('2040', '2', '65', '1');
INSERT INTO `kon_privillege` VALUES ('2041', '2', '66', '1');
INSERT INTO `kon_privillege` VALUES ('2042', '2', '67', '1');
INSERT INTO `kon_privillege` VALUES ('2043', '2', '68', '1');
INSERT INTO `kon_privillege` VALUES ('2044', '2', '69', '1');
INSERT INTO `kon_privillege` VALUES ('2045', '2', '70', '1');
INSERT INTO `kon_privillege` VALUES ('2046', '2', '71', '1');
INSERT INTO `kon_privillege` VALUES ('2047', '2', '72', '1');
INSERT INTO `kon_privillege` VALUES ('2048', '2', '73', '1');
INSERT INTO `kon_privillege` VALUES ('2049', '2', '74', '1');
INSERT INTO `kon_privillege` VALUES ('2050', '2', '75', '1');
INSERT INTO `kon_privillege` VALUES ('2051', '2', '76', '1');
INSERT INTO `kon_privillege` VALUES ('2052', '2', '77', '1');
INSERT INTO `kon_privillege` VALUES ('2053', '2', '78', '1');
INSERT INTO `kon_privillege` VALUES ('2054', '2', '79', '1');
INSERT INTO `kon_privillege` VALUES ('2055', '2', '80', '1');
INSERT INTO `kon_privillege` VALUES ('2056', '2', '81', '1');
INSERT INTO `kon_privillege` VALUES ('2057', '2', '82', '1');
INSERT INTO `kon_privillege` VALUES ('2058', '2', '83', '1');
INSERT INTO `kon_privillege` VALUES ('2059', '2', '84', '1');
INSERT INTO `kon_privillege` VALUES ('2060', '2', '85', '1');
INSERT INTO `kon_privillege` VALUES ('2061', '2', '86', '1');
INSERT INTO `kon_privillege` VALUES ('2062', '2', '87', '1');
INSERT INTO `kon_privillege` VALUES ('2063', '2', '88', '1');
INSERT INTO `kon_privillege` VALUES ('2064', '2', '89', '1');
INSERT INTO `kon_privillege` VALUES ('2065', '2', '90', '1');
INSERT INTO `kon_privillege` VALUES ('2066', '2', '91', '1');
INSERT INTO `kon_privillege` VALUES ('2067', '2', '92', '1');
INSERT INTO `kon_privillege` VALUES ('2068', '2', '93', '1');
INSERT INTO `kon_privillege` VALUES ('2069', '2', '94', '1');
INSERT INTO `kon_privillege` VALUES ('2070', '2', '95', '1');
INSERT INTO `kon_privillege` VALUES ('2071', '2', '96', '1');
INSERT INTO `kon_privillege` VALUES ('2072', '2', '97', '1');
INSERT INTO `kon_privillege` VALUES ('2073', '2', '98', '1');
INSERT INTO `kon_privillege` VALUES ('2074', '2', '99', '1');
INSERT INTO `kon_privillege` VALUES ('2075', '2', '100', '1');
INSERT INTO `kon_privillege` VALUES ('2076', '2', '101', '1');
INSERT INTO `kon_privillege` VALUES ('2077', '2', '102', '1');
INSERT INTO `kon_privillege` VALUES ('2078', '2', '103', '1');
INSERT INTO `kon_privillege` VALUES ('2079', '2', '104', '1');
INSERT INTO `kon_privillege` VALUES ('2080', '2', '105', '1');
INSERT INTO `kon_privillege` VALUES ('2081', '2', '106', '1');
INSERT INTO `kon_privillege` VALUES ('2082', '2', '107', '1');
INSERT INTO `kon_privillege` VALUES ('2083', '2', '108', '1');
INSERT INTO `kon_privillege` VALUES ('2084', '2', '109', '1');
INSERT INTO `kon_privillege` VALUES ('2085', '2', '110', '1');
INSERT INTO `kon_privillege` VALUES ('2086', '2', '111', '1');
INSERT INTO `kon_privillege` VALUES ('2087', '2', '112', '1');
INSERT INTO `kon_privillege` VALUES ('2088', '2', '113', '1');
INSERT INTO `kon_privillege` VALUES ('2089', '2', '114', '1');
INSERT INTO `kon_privillege` VALUES ('2090', '2', '115', '1');
INSERT INTO `kon_privillege` VALUES ('2091', '2', '116', '1');
INSERT INTO `kon_privillege` VALUES ('2092', '2', '117', '1');
INSERT INTO `kon_privillege` VALUES ('2093', '2', '119', '1');
INSERT INTO `kon_privillege` VALUES ('2094', '2', '120', '1');
INSERT INTO `kon_privillege` VALUES ('2095', '2', '121', '1');
INSERT INTO `kon_privillege` VALUES ('2096', '2', '122', '1');
INSERT INTO `kon_privillege` VALUES ('2097', '2', '123', '1');
INSERT INTO `kon_privillege` VALUES ('2098', '2', '124', '1');
INSERT INTO `kon_privillege` VALUES ('2099', '2', '125', '1');
INSERT INTO `kon_privillege` VALUES ('2100', '2', '126', '1');
INSERT INTO `kon_privillege` VALUES ('2101', '2', '127', '1');
INSERT INTO `kon_privillege` VALUES ('2102', '2', '128', '1');
INSERT INTO `kon_privillege` VALUES ('2103', '2', '129', '1');
INSERT INTO `kon_privillege` VALUES ('2104', '2', '130', '1');
INSERT INTO `kon_privillege` VALUES ('2105', '2', '131', '1');
INSERT INTO `kon_privillege` VALUES ('2106', '2', '132', '1');
INSERT INTO `kon_privillege` VALUES ('2107', '2', '133', '1');
INSERT INTO `kon_privillege` VALUES ('2108', '2', '134', '1');
INSERT INTO `kon_privillege` VALUES ('2109', '2', '135', '1');
INSERT INTO `kon_privillege` VALUES ('2110', '2', '136', '1');
INSERT INTO `kon_privillege` VALUES ('2111', '2', '137', '1');
INSERT INTO `kon_privillege` VALUES ('2112', '2', '138', '1');
INSERT INTO `kon_privillege` VALUES ('2113', '2', '139', '1');
INSERT INTO `kon_privillege` VALUES ('2114', '2', '140', '1');
INSERT INTO `kon_privillege` VALUES ('2115', '2', '141', '1');
INSERT INTO `kon_privillege` VALUES ('2116', '2', '142', '1');
INSERT INTO `kon_privillege` VALUES ('2117', '2', '143', '1');
INSERT INTO `kon_privillege` VALUES ('2118', '2', '144', '1');
INSERT INTO `kon_privillege` VALUES ('2119', '2', '145', '1');
INSERT INTO `kon_privillege` VALUES ('2120', '2', '146', '1');
INSERT INTO `kon_privillege` VALUES ('2121', '2', '147', '1');
INSERT INTO `kon_privillege` VALUES ('2122', '2', '148', '1');
INSERT INTO `kon_privillege` VALUES ('2123', '2', '149', '1');
INSERT INTO `kon_privillege` VALUES ('2124', '2', '150', '1');
INSERT INTO `kon_privillege` VALUES ('2125', '2', '151', '1');
INSERT INTO `kon_privillege` VALUES ('2126', '2', '152', '1');
INSERT INTO `kon_privillege` VALUES ('2127', '2', '153', '1');
INSERT INTO `kon_privillege` VALUES ('2128', '2', '154', '1');
INSERT INTO `kon_privillege` VALUES ('2129', '2', '155', '1');
INSERT INTO `kon_privillege` VALUES ('2130', '2', '156', '1');
INSERT INTO `kon_privillege` VALUES ('2420', '5', '1', '1');
INSERT INTO `kon_privillege` VALUES ('2421', '5', '2', '1');
INSERT INTO `kon_privillege` VALUES ('2422', '5', '3', '1');
INSERT INTO `kon_privillege` VALUES ('2423', '5', '4', '1');
INSERT INTO `kon_privillege` VALUES ('2424', '5', '8', '1');
INSERT INTO `kon_privillege` VALUES ('2425', '5', '9', '1');
INSERT INTO `kon_privillege` VALUES ('2426', '5', '10', '1');
INSERT INTO `kon_privillege` VALUES ('2427', '5', '12', '1');
INSERT INTO `kon_privillege` VALUES ('2428', '5', '13', '1');
INSERT INTO `kon_privillege` VALUES ('2429', '5', '14', '1');
INSERT INTO `kon_privillege` VALUES ('2430', '5', '15', '1');
INSERT INTO `kon_privillege` VALUES ('2431', '5', '16', '1');
INSERT INTO `kon_privillege` VALUES ('2432', '5', '19', '1');
INSERT INTO `kon_privillege` VALUES ('2433', '5', '20', '1');
INSERT INTO `kon_privillege` VALUES ('2434', '5', '21', '1');
INSERT INTO `kon_privillege` VALUES ('2435', '5', '22', '1');
INSERT INTO `kon_privillege` VALUES ('2436', '5', '24', '1');
INSERT INTO `kon_privillege` VALUES ('2437', '5', '25', '1');
INSERT INTO `kon_privillege` VALUES ('2438', '5', '26', '1');
INSERT INTO `kon_privillege` VALUES ('2439', '5', '27', '1');
INSERT INTO `kon_privillege` VALUES ('2440', '5', '28', '1');
INSERT INTO `kon_privillege` VALUES ('2441', '5', '29', '1');
INSERT INTO `kon_privillege` VALUES ('2442', '5', '30', '1');
INSERT INTO `kon_privillege` VALUES ('2443', '5', '31', '1');
INSERT INTO `kon_privillege` VALUES ('2444', '5', '32', '1');
INSERT INTO `kon_privillege` VALUES ('2445', '5', '33', '1');
INSERT INTO `kon_privillege` VALUES ('2446', '5', '34', '1');
INSERT INTO `kon_privillege` VALUES ('2447', '5', '35', '1');
INSERT INTO `kon_privillege` VALUES ('2448', '5', '36', '1');
INSERT INTO `kon_privillege` VALUES ('2449', '5', '37', '1');
INSERT INTO `kon_privillege` VALUES ('2450', '5', '38', '1');
INSERT INTO `kon_privillege` VALUES ('2451', '5', '39', '1');
INSERT INTO `kon_privillege` VALUES ('2452', '5', '40', '1');
INSERT INTO `kon_privillege` VALUES ('2453', '5', '41', '1');
INSERT INTO `kon_privillege` VALUES ('2454', '5', '42', '1');
INSERT INTO `kon_privillege` VALUES ('2455', '5', '43', '1');
INSERT INTO `kon_privillege` VALUES ('2456', '5', '44', '1');
INSERT INTO `kon_privillege` VALUES ('2457', '5', '45', '1');
INSERT INTO `kon_privillege` VALUES ('2458', '5', '46', '1');
INSERT INTO `kon_privillege` VALUES ('2459', '5', '47', '1');
INSERT INTO `kon_privillege` VALUES ('2460', '5', '48', '1');
INSERT INTO `kon_privillege` VALUES ('2461', '5', '52', '1');
INSERT INTO `kon_privillege` VALUES ('2462', '5', '54', '1');
INSERT INTO `kon_privillege` VALUES ('2463', '5', '55', '1');
INSERT INTO `kon_privillege` VALUES ('2464', '5', '56', '1');
INSERT INTO `kon_privillege` VALUES ('2465', '5', '57', '1');
INSERT INTO `kon_privillege` VALUES ('2466', '5', '58', '1');
INSERT INTO `kon_privillege` VALUES ('2467', '5', '59', '1');
INSERT INTO `kon_privillege` VALUES ('2468', '5', '60', '1');
INSERT INTO `kon_privillege` VALUES ('2469', '5', '61', '1');
INSERT INTO `kon_privillege` VALUES ('2470', '5', '62', '1');
INSERT INTO `kon_privillege` VALUES ('2471', '5', '63', '1');
INSERT INTO `kon_privillege` VALUES ('2472', '5', '64', '1');
INSERT INTO `kon_privillege` VALUES ('2473', '5', '65', '1');
INSERT INTO `kon_privillege` VALUES ('2474', '5', '66', '1');
INSERT INTO `kon_privillege` VALUES ('2475', '5', '67', '1');
INSERT INTO `kon_privillege` VALUES ('2476', '5', '68', '1');
INSERT INTO `kon_privillege` VALUES ('2477', '5', '69', '1');
INSERT INTO `kon_privillege` VALUES ('2478', '5', '70', '1');
INSERT INTO `kon_privillege` VALUES ('2479', '5', '71', '1');
INSERT INTO `kon_privillege` VALUES ('2480', '5', '72', '1');
INSERT INTO `kon_privillege` VALUES ('2481', '5', '73', '1');
INSERT INTO `kon_privillege` VALUES ('2482', '5', '74', '1');
INSERT INTO `kon_privillege` VALUES ('2483', '5', '75', '1');
INSERT INTO `kon_privillege` VALUES ('2484', '5', '76', '1');
INSERT INTO `kon_privillege` VALUES ('2485', '5', '77', '1');
INSERT INTO `kon_privillege` VALUES ('2486', '5', '78', '1');
INSERT INTO `kon_privillege` VALUES ('2487', '5', '79', '1');
INSERT INTO `kon_privillege` VALUES ('2488', '5', '80', '1');
INSERT INTO `kon_privillege` VALUES ('2489', '5', '81', '1');
INSERT INTO `kon_privillege` VALUES ('2490', '5', '82', '1');
INSERT INTO `kon_privillege` VALUES ('2491', '5', '83', '1');
INSERT INTO `kon_privillege` VALUES ('2492', '5', '84', '1');
INSERT INTO `kon_privillege` VALUES ('2493', '5', '85', '1');
INSERT INTO `kon_privillege` VALUES ('2494', '5', '86', '1');
INSERT INTO `kon_privillege` VALUES ('2495', '5', '87', '1');
INSERT INTO `kon_privillege` VALUES ('2496', '5', '88', '1');
INSERT INTO `kon_privillege` VALUES ('2497', '5', '89', '1');
INSERT INTO `kon_privillege` VALUES ('2498', '5', '90', '1');
INSERT INTO `kon_privillege` VALUES ('2499', '5', '91', '1');
INSERT INTO `kon_privillege` VALUES ('2500', '5', '92', '1');
INSERT INTO `kon_privillege` VALUES ('2501', '5', '93', '1');
INSERT INTO `kon_privillege` VALUES ('2502', '5', '94', '1');
INSERT INTO `kon_privillege` VALUES ('2503', '5', '95', '1');
INSERT INTO `kon_privillege` VALUES ('2504', '5', '96', '1');
INSERT INTO `kon_privillege` VALUES ('2505', '5', '97', '1');
INSERT INTO `kon_privillege` VALUES ('2506', '5', '98', '1');
INSERT INTO `kon_privillege` VALUES ('2507', '5', '99', '1');
INSERT INTO `kon_privillege` VALUES ('2508', '5', '100', '1');
INSERT INTO `kon_privillege` VALUES ('2509', '5', '101', '1');
INSERT INTO `kon_privillege` VALUES ('2510', '5', '102', '1');
INSERT INTO `kon_privillege` VALUES ('2511', '5', '103', '1');
INSERT INTO `kon_privillege` VALUES ('2512', '5', '104', '1');
INSERT INTO `kon_privillege` VALUES ('2513', '5', '105', '1');
INSERT INTO `kon_privillege` VALUES ('2514', '5', '106', '1');
INSERT INTO `kon_privillege` VALUES ('2515', '5', '107', '1');
INSERT INTO `kon_privillege` VALUES ('2516', '5', '108', '1');
INSERT INTO `kon_privillege` VALUES ('2517', '5', '109', '1');
INSERT INTO `kon_privillege` VALUES ('2518', '5', '110', '1');
INSERT INTO `kon_privillege` VALUES ('2519', '5', '111', '1');
INSERT INTO `kon_privillege` VALUES ('2520', '5', '112', '1');
INSERT INTO `kon_privillege` VALUES ('2521', '5', '113', '1');
INSERT INTO `kon_privillege` VALUES ('2522', '5', '114', '1');
INSERT INTO `kon_privillege` VALUES ('2523', '5', '115', '1');
INSERT INTO `kon_privillege` VALUES ('2524', '5', '116', '1');
INSERT INTO `kon_privillege` VALUES ('2525', '5', '117', '1');
INSERT INTO `kon_privillege` VALUES ('2526', '5', '119', '1');
INSERT INTO `kon_privillege` VALUES ('2527', '5', '120', '1');
INSERT INTO `kon_privillege` VALUES ('2528', '5', '121', '1');
INSERT INTO `kon_privillege` VALUES ('2529', '5', '122', '1');
INSERT INTO `kon_privillege` VALUES ('2530', '5', '123', '1');
INSERT INTO `kon_privillege` VALUES ('2531', '5', '124', '1');
INSERT INTO `kon_privillege` VALUES ('2532', '5', '125', '1');
INSERT INTO `kon_privillege` VALUES ('2533', '5', '126', '1');
INSERT INTO `kon_privillege` VALUES ('2534', '5', '127', '1');
INSERT INTO `kon_privillege` VALUES ('2535', '5', '128', '1');
INSERT INTO `kon_privillege` VALUES ('2536', '5', '129', '1');
INSERT INTO `kon_privillege` VALUES ('2537', '5', '130', '1');
INSERT INTO `kon_privillege` VALUES ('2538', '5', '131', '1');
INSERT INTO `kon_privillege` VALUES ('2539', '5', '132', '1');
INSERT INTO `kon_privillege` VALUES ('2540', '5', '133', '1');
INSERT INTO `kon_privillege` VALUES ('2541', '5', '134', '1');
INSERT INTO `kon_privillege` VALUES ('2542', '5', '135', '1');
INSERT INTO `kon_privillege` VALUES ('2543', '5', '136', '1');
INSERT INTO `kon_privillege` VALUES ('2544', '5', '137', '1');
INSERT INTO `kon_privillege` VALUES ('2545', '5', '138', '1');
INSERT INTO `kon_privillege` VALUES ('2546', '5', '139', '1');
INSERT INTO `kon_privillege` VALUES ('2547', '5', '140', '1');
INSERT INTO `kon_privillege` VALUES ('2548', '5', '141', '1');
INSERT INTO `kon_privillege` VALUES ('2549', '5', '142', '1');
INSERT INTO `kon_privillege` VALUES ('2550', '5', '143', '1');
INSERT INTO `kon_privillege` VALUES ('2551', '5', '144', '1');
INSERT INTO `kon_privillege` VALUES ('2552', '5', '145', '1');
INSERT INTO `kon_privillege` VALUES ('2553', '5', '146', '1');
INSERT INTO `kon_privillege` VALUES ('2554', '5', '147', '1');
INSERT INTO `kon_privillege` VALUES ('2555', '5', '148', '1');
INSERT INTO `kon_privillege` VALUES ('2556', '5', '149', '1');
INSERT INTO `kon_privillege` VALUES ('2557', '5', '150', '1');
INSERT INTO `kon_privillege` VALUES ('2558', '5', '151', '1');
INSERT INTO `kon_privillege` VALUES ('2559', '5', '152', '1');
INSERT INTO `kon_privillege` VALUES ('2560', '5', '153', '1');
INSERT INTO `kon_privillege` VALUES ('2561', '5', '154', '1');
INSERT INTO `kon_privillege` VALUES ('2562', '5', '155', '1');
INSERT INTO `kon_privillege` VALUES ('2563', '5', '156', '1');
INSERT INTO `kon_privillege` VALUES ('2564', '5', '157', '1');

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
