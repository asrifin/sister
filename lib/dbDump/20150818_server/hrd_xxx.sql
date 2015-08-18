/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-18 14:38:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hrd_absensi
-- ----------------------------
DROP TABLE IF EXISTS `hrd_absensi`;
CREATE TABLE `hrd_absensi` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `karyawan` int(4) NOT NULL,
  `masuk` int(3) NOT NULL DEFAULT '0',
  `lembur` int(3) NOT NULL DEFAULT '0',
  `sakit` int(3) NOT NULL DEFAULT '0',
  `alpha` int(3) NOT NULL DEFAULT '0',
  `telat` int(3) NOT NULL DEFAULT '0',
  `bulan` int(2) NOT NULL,
  `tahun` varchar(4) NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_absensi
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_agama
-- ----------------------------
DROP TABLE IF EXISTS `hrd_agama`;
CREATE TABLE `hrd_agama` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_agama
-- ----------------------------
INSERT INTO `hrd_agama` VALUES ('1', 'Islam', '0');
INSERT INTO `hrd_agama` VALUES ('2', 'Kristen', '0');
INSERT INTO `hrd_agama` VALUES ('3', 'Katolik', '0');

-- ----------------------------
-- Table structure for hrd_bayar
-- ----------------------------
DROP TABLE IF EXISTS `hrd_bayar`;
CREATE TABLE `hrd_bayar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `bayar` varchar(255) NOT NULL,
  `karyawan` int(4) NOT NULL DEFAULT '0',
  `pid` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_bayar
-- ----------------------------
INSERT INTO `hrd_bayar` VALUES ('1', '2014-06-30', '120000', '35', '1');
INSERT INTO `hrd_bayar` VALUES ('3', '2014-06-30', '80000', '35', '1');
INSERT INTO `hrd_bayar` VALUES ('5', '2014-06-30', '100000', '35', '7');
INSERT INTO `hrd_bayar` VALUES ('6', '2014-07-02', '250000', '34', '12');
INSERT INTO `hrd_bayar` VALUES ('14', '2014-07-15', '250000', '36', '14');
INSERT INTO `hrd_bayar` VALUES ('15', '2014-11-07', '750000', '34', '12');

-- ----------------------------
-- Table structure for hrd_bebantugas
-- ----------------------------
DROP TABLE IF EXISTS `hrd_bebantugas`;
CREATE TABLE `hrd_bebantugas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_bebantugas
-- ----------------------------
INSERT INTO `hrd_bebantugas` VALUES ('1', 'Tidak Ada', '0', '0');
INSERT INTO `hrd_bebantugas` VALUES ('2', 'SD_1,2,3', '10', '0');
INSERT INTO `hrd_bebantugas` VALUES ('3', 'SD_4-6', '15', '0');
INSERT INTO `hrd_bebantugas` VALUES ('4', 'G-7', '25', '0');

-- ----------------------------
-- Table structure for hrd_berkas
-- ----------------------------
DROP TABLE IF EXISTS `hrd_berkas`;
CREATE TABLE `hrd_berkas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_berkas
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_bulan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_bulan`;
CREATE TABLE `hrd_bulan` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `bulan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_bulan
-- ----------------------------
INSERT INTO `hrd_bulan` VALUES ('1', 'Januari');
INSERT INTO `hrd_bulan` VALUES ('2', 'Februari');
INSERT INTO `hrd_bulan` VALUES ('3', 'Maret');
INSERT INTO `hrd_bulan` VALUES ('4', 'April');
INSERT INTO `hrd_bulan` VALUES ('5', 'Mei');
INSERT INTO `hrd_bulan` VALUES ('6', 'Juni');
INSERT INTO `hrd_bulan` VALUES ('7', 'Juli');
INSERT INTO `hrd_bulan` VALUES ('8', 'Agustus');
INSERT INTO `hrd_bulan` VALUES ('9', 'September');
INSERT INTO `hrd_bulan` VALUES ('10', 'Oktober');
INSERT INTO `hrd_bulan` VALUES ('11', 'Nopember');
INSERT INTO `hrd_bulan` VALUES ('12', 'Desember');

-- ----------------------------
-- Table structure for hrd_cuti
-- ----------------------------
DROP TABLE IF EXISTS `hrd_cuti`;
CREATE TABLE `hrd_cuti` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `karyawan` int(4) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tgl` date NOT NULL,
  `cuti` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_cuti
-- ----------------------------
INSERT INTO `hrd_cuti` VALUES ('1', '36', '2014', '2014-06-26', 'asdsad');
INSERT INTO `hrd_cuti` VALUES ('3', '36', '2014', '2014-07-01', 'Ke Luar Negeri');

-- ----------------------------
-- Table structure for hrd_departemen
-- ----------------------------
DROP TABLE IF EXISTS `hrd_departemen`;
CREATE TABLE `hrd_departemen` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  `masterdepartemen` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_departemen
-- ----------------------------
INSERT INTO `hrd_departemen` VALUES ('9', 'PG KG Suko', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('10', 'PG KG KIT', '0', '3');
INSERT INTO `hrd_departemen` VALUES ('11', 'Primary Suko', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('12', 'Primary Rungkut', '0', '2');
INSERT INTO `hrd_departemen` VALUES ('13', 'Secondary Suko', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('14', 'Secondary Rungkut', '0', '2');
INSERT INTO `hrd_departemen` VALUES ('15', 'High School Suko', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('16', 'High School Rungkut', '0', '2');
INSERT INTO `hrd_departemen` VALUES ('17', 'Keuangan', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('18', 'HRD', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('19', 'Litbang', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('20', 'Operasional', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('21', 'Kerohanian', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('23', 'General Affair', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('24', 'Sarana Prasarana', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('31', 'PPKE', '0', '1');
INSERT INTO `hrd_departemen` VALUES ('32', 'Elyon Rungkut', '0', '2');
INSERT INTO `hrd_departemen` VALUES ('33', 'Marketing', '0', '1');

-- ----------------------------
-- Table structure for hrd_fungsional
-- ----------------------------
DROP TABLE IF EXISTS `hrd_fungsional`;
CREATE TABLE `hrd_fungsional` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_fungsional
-- ----------------------------
INSERT INTO `hrd_fungsional` VALUES ('1', 'Tidak Ada', '0', '0');
INSERT INTO `hrd_fungsional` VALUES ('2', '3A', '20', '0');
INSERT INTO `hrd_fungsional` VALUES ('3', '3B', '25', '0');
INSERT INTO `hrd_fungsional` VALUES ('4', '3C', '30', '0');

-- ----------------------------
-- Table structure for hrd_golongan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_golongan`;
CREATE TABLE `hrd_golongan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `gajipokok` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_golongan
-- ----------------------------
INSERT INTO `hrd_golongan` VALUES ('2', '2A0', '1115370');
INSERT INTO `hrd_golongan` VALUES ('3', '2B0', '1239300');
INSERT INTO `hrd_golongan` VALUES ('4', '2C0', '1377000');
INSERT INTO `hrd_golongan` VALUES ('5', '2D0', '1530000');
INSERT INTO `hrd_golongan` VALUES ('6', '3A0', '1700000');
INSERT INTO `hrd_golongan` VALUES ('7', '3B0', '1870000');
INSERT INTO `hrd_golongan` VALUES ('8', '3C0', '2057000');
INSERT INTO `hrd_golongan` VALUES ('9', '3D0', '2262700');
INSERT INTO `hrd_golongan` VALUES ('10', '4A0', '2488970');
INSERT INTO `hrd_golongan` VALUES ('11', '4B0', '2737867');
INSERT INTO `hrd_golongan` VALUES ('12', '4C0', '3011654');
INSERT INTO `hrd_golongan` VALUES ('13', '4D0', '3312819');
INSERT INTO `hrd_golongan` VALUES ('15', '2A1', '1171139');
INSERT INTO `hrd_golongan` VALUES ('16', '2B1', '1301265');
INSERT INTO `hrd_golongan` VALUES ('17', '2C1', '1445850');
INSERT INTO `hrd_golongan` VALUES ('18', '2D1', '1606500');
INSERT INTO `hrd_golongan` VALUES ('19', '3A1', '1785000');
INSERT INTO `hrd_golongan` VALUES ('20', '3B1', '1963500');
INSERT INTO `hrd_golongan` VALUES ('21', '3C1', '2159850');
INSERT INTO `hrd_golongan` VALUES ('22', '3D1', '2375835');
INSERT INTO `hrd_golongan` VALUES ('23', '4A1', '2613419');
INSERT INTO `hrd_golongan` VALUES ('24', '4B1', '2874760');
INSERT INTO `hrd_golongan` VALUES ('25', '4C1', '3162236');
INSERT INTO `hrd_golongan` VALUES ('26', '4D1', '3478460');
INSERT INTO `hrd_golongan` VALUES ('27', '2A2', '1229695');
INSERT INTO `hrd_golongan` VALUES ('28', '2B2', '1366328');
INSERT INTO `hrd_golongan` VALUES ('29', '2C2', '1518143');
INSERT INTO `hrd_golongan` VALUES ('30', '2D2', '1686825');
INSERT INTO `hrd_golongan` VALUES ('31', '3A2', '1874250');
INSERT INTO `hrd_golongan` VALUES ('32', '3B2', '2061675');
INSERT INTO `hrd_golongan` VALUES ('33', '3C2', '2267843');
INSERT INTO `hrd_golongan` VALUES ('34', '3D2', '2494627');
INSERT INTO `hrd_golongan` VALUES ('35', '4A2', '2744089');
INSERT INTO `hrd_golongan` VALUES ('36', '4B2', '3018498');
INSERT INTO `hrd_golongan` VALUES ('37', '4C2', '3320348');
INSERT INTO `hrd_golongan` VALUES ('38', '4D2', '3652383');
INSERT INTO `hrd_golongan` VALUES ('39', '2A3', '1291180');
INSERT INTO `hrd_golongan` VALUES ('40', '2B3', '1434645');
INSERT INTO `hrd_golongan` VALUES ('41', '2C3', '1594050');
INSERT INTO `hrd_golongan` VALUES ('42', '2D3', '1771166');
INSERT INTO `hrd_golongan` VALUES ('43', '3A3', '1967963');
INSERT INTO `hrd_golongan` VALUES ('44', '3B3', '2164759');
INSERT INTO `hrd_golongan` VALUES ('45', '3C3', '2381235');
INSERT INTO `hrd_golongan` VALUES ('46', '3D3', '2619358');
INSERT INTO `hrd_golongan` VALUES ('47', '4A3', '2881294');
INSERT INTO `hrd_golongan` VALUES ('48', '4B3', '3169423');
INSERT INTO `hrd_golongan` VALUES ('49', '4C3', '3486366');
INSERT INTO `hrd_golongan` VALUES ('50', '4D3', '3835002');
INSERT INTO `hrd_golongan` VALUES ('51', '2A4', '1355739');
INSERT INTO `hrd_golongan` VALUES ('52', '2B4', '1506377');
INSERT INTO `hrd_golongan` VALUES ('53', '2C4', '1673752');
INSERT INTO `hrd_golongan` VALUES ('54', '2D4', '1859725');
INSERT INTO `hrd_golongan` VALUES ('55', '3A4', '2066361');
INSERT INTO `hrd_golongan` VALUES ('56', '3B4', '2272997');
INSERT INTO `hrd_golongan` VALUES ('57', '3C4', '2500296');
INSERT INTO `hrd_golongan` VALUES ('58', '3D4', '2750326');
INSERT INTO `hrd_golongan` VALUES ('59', '4A4', '3025359');
INSERT INTO `hrd_golongan` VALUES ('60', '4B4', '3327894');
INSERT INTO `hrd_golongan` VALUES ('61', '4C4', '3660684');
INSERT INTO `hrd_golongan` VALUES ('62', '4D4', '4026752');
INSERT INTO `hrd_golongan` VALUES ('63', '2A5', '1423526');
INSERT INTO `hrd_golongan` VALUES ('64', '2B5', '1581696');
INSERT INTO `hrd_golongan` VALUES ('65', '2C5', '1757440');
INSERT INTO `hrd_golongan` VALUES ('66', '2D5', '1952711');
INSERT INTO `hrd_golongan` VALUES ('67', '3A5', '2169679');
INSERT INTO `hrd_golongan` VALUES ('68', '3B5', '2386647');
INSERT INTO `hrd_golongan` VALUES ('69', '3C5', '2625311');
INSERT INTO `hrd_golongan` VALUES ('70', '3D5', '2887842');
INSERT INTO `hrd_golongan` VALUES ('71', '4A5', '3176627');
INSERT INTO `hrd_golongan` VALUES ('72', '4B5', '3494289');
INSERT INTO `hrd_golongan` VALUES ('73', '4C5', '3843718');
INSERT INTO `hrd_golongan` VALUES ('74', '4D5', '4228090');
INSERT INTO `hrd_golongan` VALUES ('75', '2A6', '1494702');
INSERT INTO `hrd_golongan` VALUES ('76', '2B6', '1660781');
INSERT INTO `hrd_golongan` VALUES ('77', '2C6', '1845312');
INSERT INTO `hrd_golongan` VALUES ('78', '2D6', '2050346');
INSERT INTO `hrd_golongan` VALUES ('79', '3A6', '2278163');
INSERT INTO `hrd_golongan` VALUES ('80', '3B6', '2505979');
INSERT INTO `hrd_golongan` VALUES ('81', '3C6', '2756577');
INSERT INTO `hrd_golongan` VALUES ('82', '3D6', '3032234');
INSERT INTO `hrd_golongan` VALUES ('83', '4A6', '3335458');
INSERT INTO `hrd_golongan` VALUES ('84', '4B6', '3669004');
INSERT INTO `hrd_golongan` VALUES ('85', '4C6', '4035904');
INSERT INTO `hrd_golongan` VALUES ('86', '4D6', '4439494');
INSERT INTO `hrd_golongan` VALUES ('87', '2A7', '1569438');
INSERT INTO `hrd_golongan` VALUES ('88', '2B7', '1743820');
INSERT INTO `hrd_golongan` VALUES ('89', '2C7', '1937577');
INSERT INTO `hrd_golongan` VALUES ('90', '2D7', '2152864');
INSERT INTO `hrd_golongan` VALUES ('91', '3A7', '2392071');
INSERT INTO `hrd_golongan` VALUES ('92', '3B7', '2631278');
INSERT INTO `hrd_golongan` VALUES ('93', '3C7', '2894406');
INSERT INTO `hrd_golongan` VALUES ('94', '3D7', '3183846');
INSERT INTO `hrd_golongan` VALUES ('95', '4A7', '3502231');
INSERT INTO `hrd_golongan` VALUES ('96', '4B7', '3852454');
INSERT INTO `hrd_golongan` VALUES ('97', '4C7', '4237699');
INSERT INTO `hrd_golongan` VALUES ('98', '4D7', '4661469');
INSERT INTO `hrd_golongan` VALUES ('99', '2A8', '1647909');
INSERT INTO `hrd_golongan` VALUES ('100', '2B8', '1831011');
INSERT INTO `hrd_golongan` VALUES ('101', '2C8', '2034456');
INSERT INTO `hrd_golongan` VALUES ('102', '2D8', '2260507');
INSERT INTO `hrd_golongan` VALUES ('103', '3A8', '2511674');
INSERT INTO `hrd_golongan` VALUES ('104', '3B8', '2762842');
INSERT INTO `hrd_golongan` VALUES ('105', '3C8', '3039126');
INSERT INTO `hrd_golongan` VALUES ('106', '3D8', '3343038');
INSERT INTO `hrd_golongan` VALUES ('107', '4A8', '3677342');
INSERT INTO `hrd_golongan` VALUES ('108', '4B8', '4045077');
INSERT INTO `hrd_golongan` VALUES ('109', '4C8', '4449584');
INSERT INTO `hrd_golongan` VALUES ('110', '4D8', '4894543');
INSERT INTO `hrd_golongan` VALUES ('111', '2A9', '1730305');
INSERT INTO `hrd_golongan` VALUES ('112', '2B9', '1922561');
INSERT INTO `hrd_golongan` VALUES ('113', '2C9', '2136179');
INSERT INTO `hrd_golongan` VALUES ('114', '2D9', '2373532');
INSERT INTO `hrd_golongan` VALUES ('115', '3A9', '2637258');
INSERT INTO `hrd_golongan` VALUES ('116', '3B9', '2900984');
INSERT INTO `hrd_golongan` VALUES ('117', '3C9', '3191082');
INSERT INTO `hrd_golongan` VALUES ('118', '3D9', '3510190');
INSERT INTO `hrd_golongan` VALUES ('119', '4A9', '3861209');
INSERT INTO `hrd_golongan` VALUES ('120', '4B9', '4247330');
INSERT INTO `hrd_golongan` VALUES ('121', '4C9', '4672063');
INSERT INTO `hrd_golongan` VALUES ('122', '4D9', '5139270');
INSERT INTO `hrd_golongan` VALUES ('123', '2A10', '1816820');
INSERT INTO `hrd_golongan` VALUES ('124', '2B10', '2018689');
INSERT INTO `hrd_golongan` VALUES ('125', '2C10', '2242988');
INSERT INTO `hrd_golongan` VALUES ('126', '2D10', '2492209');
INSERT INTO `hrd_golongan` VALUES ('127', '3A10', '2769121');
INSERT INTO `hrd_golongan` VALUES ('128', '3B10', '3046033');
INSERT INTO `hrd_golongan` VALUES ('129', '3C10', '3350636');
INSERT INTO `hrd_golongan` VALUES ('130', '3D10', '3685700');
INSERT INTO `hrd_golongan` VALUES ('131', '4A10', '4054270');
INSERT INTO `hrd_golongan` VALUES ('132', '4B10', '4459697');
INSERT INTO `hrd_golongan` VALUES ('133', '4C10', '4905667');
INSERT INTO `hrd_golongan` VALUES ('134', '4D10', '5396233');
INSERT INTO `hrd_golongan` VALUES ('135', '2A11', '1907661');
INSERT INTO `hrd_golongan` VALUES ('136', '2B11', '2119624');
INSERT INTO `hrd_golongan` VALUES ('137', '2C11', '2355137');
INSERT INTO `hrd_golongan` VALUES ('138', '2D11', '2616819');
INSERT INTO `hrd_golongan` VALUES ('139', '3A11', '2907577');
INSERT INTO `hrd_golongan` VALUES ('140', '3B11', '3198335');
INSERT INTO `hrd_golongan` VALUES ('141', '3C11', '3518168');
INSERT INTO `hrd_golongan` VALUES ('142', '3D11', '3869985');
INSERT INTO `hrd_golongan` VALUES ('143', '4A11', '4256983');
INSERT INTO `hrd_golongan` VALUES ('144', '4B11', '4682682');
INSERT INTO `hrd_golongan` VALUES ('145', '4C11', '5150950');
INSERT INTO `hrd_golongan` VALUES ('146', '4D11', '5666045');
INSERT INTO `hrd_golongan` VALUES ('147', '2A12', '2003044');
INSERT INTO `hrd_golongan` VALUES ('148', '2B12', '2225605');
INSERT INTO `hrd_golongan` VALUES ('149', '2C12', '2472894');
INSERT INTO `hrd_golongan` VALUES ('150', '2D12', '2747660');
INSERT INTO `hrd_golongan` VALUES ('151', '3A12', '3052956');
INSERT INTO `hrd_golongan` VALUES ('152', '3B12', '3358251');
INSERT INTO `hrd_golongan` VALUES ('153', '3C12', '3694076');
INSERT INTO `hrd_golongan` VALUES ('154', '3D12', '4063484');
INSERT INTO `hrd_golongan` VALUES ('155', '4A12', '4469833');
INSERT INTO `hrd_golongan` VALUES ('156', '4B12', '4916816');
INSERT INTO `hrd_golongan` VALUES ('157', '4C12', '5408497');
INSERT INTO `hrd_golongan` VALUES ('158', '4D12', '5949347');
INSERT INTO `hrd_golongan` VALUES ('159', '2A13', '2103196');
INSERT INTO `hrd_golongan` VALUES ('160', '2B13', '2336885');
INSERT INTO `hrd_golongan` VALUES ('161', '2C13', '2596539');
INSERT INTO `hrd_golongan` VALUES ('162', '2D13', '2885043');
INSERT INTO `hrd_golongan` VALUES ('163', '3A13', '3205604');
INSERT INTO `hrd_golongan` VALUES ('164', '3B13', '3526164');
INSERT INTO `hrd_golongan` VALUES ('165', '3C13', '3878780');
INSERT INTO `hrd_golongan` VALUES ('166', '3D13', '4266658');
INSERT INTO `hrd_golongan` VALUES ('167', '4A13', '4693324');
INSERT INTO `hrd_golongan` VALUES ('168', '4B13', '5162657');
INSERT INTO `hrd_golongan` VALUES ('169', '4C13', '5678922');
INSERT INTO `hrd_golongan` VALUES ('170', '4D13', '6246814');
INSERT INTO `hrd_golongan` VALUES ('171', '2A14', '2208356');
INSERT INTO `hrd_golongan` VALUES ('172', '2B14', '2453729');
INSERT INTO `hrd_golongan` VALUES ('173', '2C14', '2726366');
INSERT INTO `hrd_golongan` VALUES ('174', '2D14', '3029295');
INSERT INTO `hrd_golongan` VALUES ('175', '3A14', '3365884');
INSERT INTO `hrd_golongan` VALUES ('176', '3B14', '3702472');
INSERT INTO `hrd_golongan` VALUES ('177', '3C14', '4072719');
INSERT INTO `hrd_golongan` VALUES ('178', '3D14', '4479991');
INSERT INTO `hrd_golongan` VALUES ('179', '4A14', '4927990');
INSERT INTO `hrd_golongan` VALUES ('180', '4B14', '5420789');
INSERT INTO `hrd_golongan` VALUES ('181', '4C14', '5962868');
INSERT INTO `hrd_golongan` VALUES ('182', '4D14', '6559155');
INSERT INTO `hrd_golongan` VALUES ('183', '2A15', '2318774');
INSERT INTO `hrd_golongan` VALUES ('184', '2B15', '2576416');
INSERT INTO `hrd_golongan` VALUES ('185', '2C15', '2862684');
INSERT INTO `hrd_golongan` VALUES ('186', '2D15', '3180760');
INSERT INTO `hrd_golongan` VALUES ('187', '3A15', '3534178');
INSERT INTO `hrd_golongan` VALUES ('188', '3B15', '3887596');
INSERT INTO `hrd_golongan` VALUES ('189', '3C15', '4276355');
INSERT INTO `hrd_golongan` VALUES ('190', '3D15', '4703991');
INSERT INTO `hrd_golongan` VALUES ('191', '4A15', '5174390');
INSERT INTO `hrd_golongan` VALUES ('192', '4B15', '5691829');
INSERT INTO `hrd_golongan` VALUES ('193', '4C15', '6261012');
INSERT INTO `hrd_golongan` VALUES ('194', '4D15', '6887113');
INSERT INTO `hrd_golongan` VALUES ('195', '2A16', '2434713');
INSERT INTO `hrd_golongan` VALUES ('196', '2B16', '2705236');
INSERT INTO `hrd_golongan` VALUES ('197', '2C16', '3005818');
INSERT INTO `hrd_golongan` VALUES ('198', '2D16', '3339798');
INSERT INTO `hrd_golongan` VALUES ('199', '3A16', '3710887');
INSERT INTO `hrd_golongan` VALUES ('200', '3B16', '4081975');
INSERT INTO `hrd_golongan` VALUES ('201', '3C16', '4490173');
INSERT INTO `hrd_golongan` VALUES ('202', '3D16', '4939190');
INSERT INTO `hrd_golongan` VALUES ('203', '4A16', '5433109');
INSERT INTO `hrd_golongan` VALUES ('204', '4B16', '5976420');
INSERT INTO `hrd_golongan` VALUES ('205', '4C16', '6574062');
INSERT INTO `hrd_golongan` VALUES ('206', '4D16', '7231469');
INSERT INTO `hrd_golongan` VALUES ('207', '2A17', '2556448');
INSERT INTO `hrd_golongan` VALUES ('208', '2B17', '2840498');
INSERT INTO `hrd_golongan` VALUES ('209', '2C17', '3156109');
INSERT INTO `hrd_golongan` VALUES ('210', '2D17', '3506788');
INSERT INTO `hrd_golongan` VALUES ('211', '3A17', '3896431');
INSERT INTO `hrd_golongan` VALUES ('212', '3B17', '4286074');
INSERT INTO `hrd_golongan` VALUES ('213', '3C17', '4714682');
INSERT INTO `hrd_golongan` VALUES ('214', '3D17', '5186150');
INSERT INTO `hrd_golongan` VALUES ('215', '4A17', '5704765');
INSERT INTO `hrd_golongan` VALUES ('216', '4B17', '6275241');
INSERT INTO `hrd_golongan` VALUES ('217', '4C17', '6902765');
INSERT INTO `hrd_golongan` VALUES ('218', '4D17', '7593042');
INSERT INTO `hrd_golongan` VALUES ('219', '2A18', '2684271');
INSERT INTO `hrd_golongan` VALUES ('220', '2B18', '2982523');
INSERT INTO `hrd_golongan` VALUES ('221', '2C18', '3313915');
INSERT INTO `hrd_golongan` VALUES ('222', '2D18', '3682127');
INSERT INTO `hrd_golongan` VALUES ('223', '3A18', '4091253');
INSERT INTO `hrd_golongan` VALUES ('224', '3B18', '4500378');
INSERT INTO `hrd_golongan` VALUES ('225', '3C18', '4950416');
INSERT INTO `hrd_golongan` VALUES ('226', '3D18', '5445457');
INSERT INTO `hrd_golongan` VALUES ('227', '4A18', '5990003');
INSERT INTO `hrd_golongan` VALUES ('228', '4B18', '6589003');
INSERT INTO `hrd_golongan` VALUES ('229', '4C18', '7247904');
INSERT INTO `hrd_golongan` VALUES ('230', '4D18', '7972694');
INSERT INTO `hrd_golongan` VALUES ('231', '2A19', '2818484');
INSERT INTO `hrd_golongan` VALUES ('232', '2B19', '3131649');
INSERT INTO `hrd_golongan` VALUES ('233', '2C19', '3479610');
INSERT INTO `hrd_golongan` VALUES ('234', '2D19', '3866234');
INSERT INTO `hrd_golongan` VALUES ('235', '3A19', '4295815');
INSERT INTO `hrd_golongan` VALUES ('236', '3B19', '4725397');
INSERT INTO `hrd_golongan` VALUES ('237', '3C19', '5197937');
INSERT INTO `hrd_golongan` VALUES ('238', '3D19', '5717730');
INSERT INTO `hrd_golongan` VALUES ('239', '4A19', '6289503');
INSERT INTO `hrd_golongan` VALUES ('240', '4B19', '6918454');
INSERT INTO `hrd_golongan` VALUES ('241', '4C19', '7610299');
INSERT INTO `hrd_golongan` VALUES ('242', '4D19', '8371329');
INSERT INTO `hrd_golongan` VALUES ('243', '2A20', '2959409');
INSERT INTO `hrd_golongan` VALUES ('244', '2B20', '3288232');
INSERT INTO `hrd_golongan` VALUES ('245', '2C20', '3653591');
INSERT INTO `hrd_golongan` VALUES ('246', '2D20', '4059545');
INSERT INTO `hrd_golongan` VALUES ('247', '3A20', '4510606');
INSERT INTO `hrd_golongan` VALUES ('248', '3B20', '4961667');
INSERT INTO `hrd_golongan` VALUES ('249', '3C20', '5457833');
INSERT INTO `hrd_golongan` VALUES ('250', '3D20', '6003617');
INSERT INTO `hrd_golongan` VALUES ('251', '4A20', '6603978');
INSERT INTO `hrd_golongan` VALUES ('252', '4B20', '7264376');
INSERT INTO `hrd_golongan` VALUES ('253', '4C20', '7990814');
INSERT INTO `hrd_golongan` VALUES ('254', '4D20', '8789895');

-- ----------------------------
-- Table structure for hrd_history
-- ----------------------------
DROP TABLE IF EXISTS `hrd_history`;
CREATE TABLE `hrd_history` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `history` varchar(255) NOT NULL,
  `gambar` varchar(200) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_history
-- ----------------------------

-- ----------------------------
-- Table structure for hrd_istrianak
-- ----------------------------
DROP TABLE IF EXISTS `hrd_istrianak`;
CREATE TABLE `hrd_istrianak` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_istrianak
-- ----------------------------
INSERT INTO `hrd_istrianak` VALUES ('1', 'Tidak Ada', '0', '0');
INSERT INTO `hrd_istrianak` VALUES ('2', 'Istri Anak', '10', '0');

-- ----------------------------
-- Table structure for hrd_jabatan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_jabatan`;
CREATE TABLE `hrd_jabatan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_jabatan
-- ----------------------------
INSERT INTO `hrd_jabatan` VALUES ('11', 'Guru', '0');
INSERT INTO `hrd_jabatan` VALUES ('13', 'Kepala Sekolah', '0');
INSERT INTO `hrd_jabatan` VALUES ('14', 'Wakil Kepala Sekolah', '0');
INSERT INTO `hrd_jabatan` VALUES ('15', 'Koordinator HOD', '0');
INSERT INTO `hrd_jabatan` VALUES ('16', 'Kepala Litbang', '0');
INSERT INTO `hrd_jabatan` VALUES ('17', 'Manajer Operasional', '0');
INSERT INTO `hrd_jabatan` VALUES ('18', 'Humas', '0');
INSERT INTO `hrd_jabatan` VALUES ('19', 'Tata Usaha', '0');
INSERT INTO `hrd_jabatan` VALUES ('20', 'Chaplain', '0');
INSERT INTO `hrd_jabatan` VALUES ('21', 'Sekretaris Perhimpunan', '0');
INSERT INTO `hrd_jabatan` VALUES ('23', 'Supir', '0');
INSERT INTO `hrd_jabatan` VALUES ('24', 'Pustakawan', '0');
INSERT INTO `hrd_jabatan` VALUES ('25', 'Staf Keuangan', '0');
INSERT INTO `hrd_jabatan` VALUES ('26', 'Staf HRD', '0');
INSERT INTO `hrd_jabatan` VALUES ('27', 'Nanny', '0');
INSERT INTO `hrd_jabatan` VALUES ('28', 'Suster', '0');
INSERT INTO `hrd_jabatan` VALUES ('29', 'Staf GA', '0');
INSERT INTO `hrd_jabatan` VALUES ('30', 'Staf Gudang', '0');
INSERT INTO `hrd_jabatan` VALUES ('31', 'Staf Purchasing & Student Service', '0');
INSERT INTO `hrd_jabatan` VALUES ('32', 'Staf Marketing', '0');
INSERT INTO `hrd_jabatan` VALUES ('33', 'Resepsionis', '0');
INSERT INTO `hrd_jabatan` VALUES ('34', 'Staf', '0');
INSERT INTO `hrd_jabatan` VALUES ('35', 'Staf Foto Copy', '0');
INSERT INTO `hrd_jabatan` VALUES ('36', 'Koordinator GAC (DOS)', '0');
INSERT INTO `hrd_jabatan` VALUES ('37', 'Koordinator GA', '0');
INSERT INTO `hrd_jabatan` VALUES ('38', 'Koordinator Sarpras', '0');
INSERT INTO `hrd_jabatan` VALUES ('39', 'Spv. Accounting ', '0');
INSERT INTO `hrd_jabatan` VALUES ('40', 'Koordinator Training', '0');
INSERT INTO `hrd_jabatan` VALUES ('41', 'Staf Maintenance', '0');
INSERT INTO `hrd_jabatan` VALUES ('42', 'Spv. Marketing', '0');

-- ----------------------------
-- Table structure for hrd_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_karyawan`;
CREATE TABLE `hrd_karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(15) NOT NULL DEFAULT '',
  `nuptk` varchar(512) NOT NULL,
  `nama` varchar(100) NOT NULL DEFAULT '',
  `kotalahir` varchar(255) NOT NULL,
  `tgllahir` date NOT NULL,
  `kelamin` varchar(15) NOT NULL DEFAULT '',
  `agama` varchar(20) NOT NULL DEFAULT '',
  `menikah` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL DEFAULT '',
  `kota` varchar(100) NOT NULL DEFAULT '',
  `kodepos` varchar(255) NOT NULL,
  `propinsi` varchar(100) NOT NULL DEFAULT '',
  `negara` varchar(100) NOT NULL DEFAULT '',
  `telepon` varchar(15) NOT NULL DEFAULT '-',
  `handphone` varchar(15) NOT NULL DEFAULT '-',
  `foto` text NOT NULL,
  `departemen` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `jabatanlain` varchar(512) NOT NULL,
  `status` varchar(255) NOT NULL,
  `pendidikan_terakhir` varchar(255) NOT NULL,
  `tglditerima` date NOT NULL,
  `tglpercobaan` date NOT NULL,
  `tglkontrak` date NOT NULL,
  `jatahcuti` int(2) NOT NULL DEFAULT '0',
  `norek` varchar(50) NOT NULL,
  `namarek` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `tipe` enum('0','1','2') NOT NULL DEFAULT '1',
  `tglresign` date NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `lampiran` varchar(255) NOT NULL,
  `tglmelamar` date NOT NULL,
  `golongan` varchar(5) NOT NULL DEFAULT '1',
  `struktural` varchar(5) NOT NULL DEFAULT '1',
  `fungsional` varchar(5) NOT NULL DEFAULT '1',
  `pengabdian` varchar(5) NOT NULL DEFAULT '1',
  `istrianak` varchar(5) NOT NULL DEFAULT '1',
  `uangmakan` varchar(5) NOT NULL DEFAULT '1',
  `uangtransport` varchar(5) NOT NULL DEFAULT '1',
  `bebantugas` varchar(5) NOT NULL DEFAULT '1',
  `walikelas` varchar(5) NOT NULL DEFAULT '1',
  `tglnaikgolongan` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_karyawan
-- ----------------------------
INSERT INTO `hrd_karyawan` VALUES ('46', '040.06.08', '', 'Claudia Natalia', 'Medan', '1983-03-29', '2', '2', '1', 'Jalan Panduk 29', 'Surabaya', '', 'Jawa Timur', 'Indonesia', '03181368806', '08552200185', '', '10', '11', '', '3', '3', '2008-11-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('47', '002.01.02', '', 'Coni Chandra', 'Malang', '1941-08-19', '2', '2', '1', 'Manyar Tirtoyoso (Raya) 77', 'Surabaya', '', 'Jawa Timur', 'Indonesia', '0315911517', '', '', '10', '13', '', '3', '-', '2002-06-03', '0000-00-00', '0000-00-00', '0', 'asd norek', 'asd namarek', 'NPWP', '1', '0000-00-00', '', '', '0000-00-00', '13', '2', '2', '2', '2', '1', '1', '2', '2', '2015-04-29');
INSERT INTO `hrd_karyawan` VALUES ('48', '099.06.11', '', 'Jenny Hartono, S.E', 'Surabaya', '1974-01-12', '2', '2', '1', 'Wonorejo Permai Utara BB.515/VII-28', 'Surabaya', '', 'Jawa Timur', 'Indonesia', '0318781745', '08123040478', '', '10', '11', '', '3', '4', '2011-10-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('49', '140.02.13', '', 'Eunike Laura', 'Surabaya', '1990-03-02', '2', '2', '2', 'Sulung Tengah 34', 'Surabaya', '', 'Jawa Timur', 'Indonesia', '08983790391', '', '', '10', '18', '', '9', '4', '2013-02-25', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('50', '037.06.06', '', 'Maria Karunia Agasta, S.Hum', 'Surabaya', '1985-08-06', '2', '2', '1', 'Mulyorejo Tengah 52-54', 'Surabaya', '', '', '', '', '', '', '10', '11', '', '3', '4', '2006-09-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('51', '011.06.05', '', 'Maya Lusita Suriyandari, S.E.', 'Sidoarjo', '1977-05-28', '2', '2', '1', 'Siwalankerto PJKA No. 9', 'Surabaya', '', '', '', '', '085648177240', '', '10', '11', '', '3', '4', '2005-03-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('52', '075.06.10', '', 'Novita Sari Sutanto', 'Surabaya', '1988-11-20', '2', '2', '2', 'Pandegiling 42', 'Surabaya', '', '', '', '', '08165409809', '', '10', '14', '', '3', '4', '2010-05-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('53', '131.01.13', '', 'Shanti Mahardikani', 'Surabaya', '1976-05-07', '2', '2', '2', 'Perum. Surya Regency Blok D.6 No.25', 'Surabaya', '', '', '', '', '087853451327', '', '10', '11', '', '9', '3', '2013-07-08', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('54', '076.06.10', '', 'Stephanie Hartanto, S.Psi', 'Surabaya', '1987-09-30', '2', '2', '-', 'Tenggilis Mejoyo AM 4A', '', '', '', '', '', '', '', '10', '11', '', '3', '4', '2010-02-15', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('55', '032.01.13', '', 'Stefany Angelina Trijojo', 'Surabaya', '1988-04-19', '2', '2', '-', 'Manggis No. 12', 'Surabaya', '', '', '', '', '082168808055', '', '10', '11', '', '9', '8', '2013-07-08', '0000-00-00', '2015-06-20', '0', '', '', '', '2', '2014-06-20', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('56', '141.02.13', '', 'Lini Wijaya Sinarli, S.E.', 'Makassar', '1991-07-18', '2', '2', '2', 'Lebak Indah Mas I/23', 'Surabaya', '', '', '', '', '082132427788', '', '10', '11', '', '9', '4', '2013-07-07', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('57', '100.02.12', '', 'Musa Mohamad K', 'Gresik', '1983-10-10', '2', '2', '1', '', '', '', '', '', '', '085732708367', '', '10', '34', '', '3', '3', '2015-01-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('58', '109.01.12', '', 'Selli Nur Susanti, S.E.', 'Surabaya', '1981-02-28', '2', '2', '2', '', '', '', '', '', '', '085733362280', '', '10', '11', '', '9', '4', '2011-07-11', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('59', '112.02.12', '', 'Reni', 'Kediri', '1981-06-10', '2', '2', '1', 'Kertajaya Indah Timur 17', '', '', '', '', '', '082140212131', '', '10', '34', '', '3', '3', '2015-01-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('60', '080.07.11', '', 'Yossy Ana Susilo, S.E.', 'Surabaya', '1982-08-08', '2', '2', '1', 'Wedoro Regency 19, Waru', 'Sidoarjo', '', '', '', '', '0878530033919', '', '10', '19', '', '3', '4', '2011-04-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('61', '134.01.13', '', 'Chandra Maruli Manullang, S.Pd.', 'Surabaya', '1989-11-18', '1', '2', '1', 'Manukan Lor 7D/7', 'Surabaya', '', '', '', '', '081703348600', '', '12', '11', '', '9', '4', '2013-07-22', '0000-00-00', '2015-06-20', '0', '', '', '', '2', '2015-02-11', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('62', '019.03.05', '', 'Christine Oscar, S.S., M.M.', 'Surabaya', '1982-03-19', '2', '2', '2', 'Kutisari Indah Barat I/96', 'Surabaya', '', '', '', '', '0811376978', '', '12', '14', '', '3', '5', '2005-11-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('63', '173.01.14', '', 'Eben Ezer Tarihoran, S.Th., MACE', 'Tapanuli Utara', '1973-02-19', '1', '2', '1', 'Griyo Wage Asri I Blok J/17, Taman Wage', 'Sidoarjo', '', '', '', '03171340921', '085850363345', '', '14', '11', '', '9', '5', '2014-07-07', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('64', '184.01.14', '', 'Fongling Natalia Budisungkono', 'Surabaya', '1992-07-01', '2', '2', '2', 'Bendul Merisi Selatan III/37', 'Surabaya', '', '', '', '', '085749405144', '', '12', '11', '', '3', '4', '2014-08-25', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('65', '077.06.10', '', 'Helen Wijaya, S.T.', 'Surabaya', '1982-12-04', '2', '2', '1', 'Jemursari Regency B38; Manyar Rejo IX/56', 'Surabaya', '', '', '', '', '0818513443', '', '12', '11', '', '3', '4', '2010-10-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('66', '027.06.07', '', 'Jiely Angela, S.S.', 'Balikpapan', '1974-03-30', '2', '2', '2', '', '', '', '', '', '', '', '', '12', '11', '', '3', '4', '2005-07-25', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('67', '082.08.08', '', 'Hanis Sri Utami', 'Surabaya', '1973-09-13', '2', '-', '1', '', '', '', '', '', '', '', '', '11', '27', '', '3', '3', '2008-10-06', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('68', '022.06.06', '', 'Imanda Wijaya, S.Psi.', 'Kediri', '1976-02-03', '2', '2', '1', 'Siwalankerto IIB/7', 'Surabaya', '', '', '', '', '08155021530', '', '12', '11', '', '3', '4', '2006-03-20', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('69', '191.01.12', '', 'Landero Cecille', 'Filipina', '1987-09-12', '2', '2', '2', '', '', '', '', '', '', '', '', '12', '11', '', '9', '4', '2012-06-14', '0000-00-00', '0000-00-00', '0', '', '', '', '2', '2015-06-20', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('70', '192.01.13', '', 'Kimberly Ceniza Allego, BSEd.', 'Filipina', '1987-10-05', '2', '2', '2', '', '', '', '', '', '', '', '', '12', '11', '', '9', '4', '2013-07-22', '0000-00-00', '2015-06-20', '0', '', '', '', '2', '2015-06-20', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('71', '193.01.14', '', 'Leah Garcia Candilosas, B.S.Ch.E.', 'Filipina', '1987-08-21', '2', '2', '2', '', '', '', '', '', '', '', '', '12', '11', '', '9', '4', '2014-03-10', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('72', '116.02.12', '', 'Lilies Winda Arditya, S.E.', 'Surabaya', '1988-11-02', '2', '2', '1', 'Raganata No.10A', 'Sidoarjo', '', '', '', '', '085733112602', '', '12', '19', '', '3', '4', '2012-07-09', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('73', '185.01.14', '', 'Liza Rosana, S.Pd.', 'Surabaya', '1979-04-03', '2', '2', '2', 'Griya Suci Permai E6/17A', 'Gresik', '', '', '', '', '085649493387', '3d0a8ca33ebd08de88e5b8dcc7fcb2b8.jpg', '12', '11', '', '9', '4', '2014-08-29', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('74', '121.01.12', '', 'Maria Elvi Priantini, S.E.', 'Surabaya', '1975-05-20', '2', '2', '1', '', '', '', '', '', '', '', '', '12', '11', '', '3', '4', '2012-10-15', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('75', '024.06.06', '', 'Martha Engeline M., S.IP., M.M.', 'Surabaya', '1974-05-17', '2', '2', '1', 'Candi Lontar Kulon 44Q-4', 'Surabaya', '', '', '', '', '081331184946', '', '11', '14', '', '3', '5', '2006-07-10', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('76', '020.06.06', '', 'M.I. Judi Kristiani', 'Kediri', '1972-08-11', '2', '2', '1', 'Komplek TNI AL, Jl. Badik No.2 Seruni Tebel', 'Sidoarjo', '', '', '', '', '081331834159', '', '12', '11', '', '3', '-', '2005-10-17', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('77', '126.01.13', '', 'Putri Iin Alimsijah, B.Sc.', 'Surabaya', '1985-11-19', '2', '2', '2', 'Kertajaya Indah VII/47', 'Surabaya', '', '', '', '', '08983958276', '', '12', '11', '', '9', '4', '2013-03-04', '0000-00-00', '0000-00-00', '0', '', '', '', '2', '2015-06-20', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('78', '094.06.09', '', 'Robby Sutaryo', 'Makassar', '1955-05-27', '1', '2', '1', 'Petemon Kali 46A, 31', 'Surabaya', '', '', '', '', '081330900939', '', '14', '11', '', '3', '9', '2009-10-05', '0000-00-00', '0000-00-00', '0', '', '', '', '2', '2015-06-30', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('79', '056.08.07', '', 'Sahat Mauli Simorangkir', 'Sidoarjo', '1980-07-09', '1', '2', '1', '', '', '', '', '', '', '', '', '32', '29', '', '3', '3', '2007-10-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('80', '135.01.03', '', 'Sony Kurniawan, S.Pd.', 'Blitar', '1981-09-29', '1', '2', '1', '', '', '', '', '', '', '', '', '14', '14', '', '3', '4', '2013-07-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('81', '153.01.14', '', 'Tan Hwa San, S.E., M.M., M.Div., MACE', 'Surabaya', '1972-06-18', '1', '2', '2', 'Pondok Tjandra Indah, Jl. Duku VII/CB 44 ', 'Surabaya', '', '', '', '', '', '', '12', '20', '', '3', '5', '2015-01-23', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('82', '071.06.10', '', 'Yunus Denny S.', 'Jember', '1975-07-14', '1', '2', '1', 'Siwalankerto Timur I/60', 'Surabaya', '', '', '', '', '081914736956', '', '12', '11', '', '3', '-', '2010-07-05', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('83', '096.06.11', '', 'Caroline Florentine, S.Psi.', '', '1988-05-01', '2', '2', '2', 'Wisata Bukit Mas 2 F4 No 17-18', 'Surabaya', '', '', '', '', '', '7d8ac6284839960e4cab65de86c8f94b.jpg', '9', '11', '', '3', '4', '2012-01-23', '0000-00-00', '0000-00-00', '0', '', '', '', '2', '2015-02-20', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('84', '015.06.05', '', 'Deasy Arieyanthi, S.Psi.', 'Surabaya', '1976-12-18', '2', '2', '2', 'Tengger III buntu 23', 'Surabaya', '', '', '', '', '', '6d887ee44c3c0cafc14dc12232efd2a9.jpg', '9', '11', '', '3', '4', '2005-05-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('85', '009.06.04', '', 'Debbie Tresiani Kwapela, S.Pd.', '', '1974-03-23', '2', '2', '2', 'Manukan Yoso IV/7D-3', 'Surabaya', '', '', '', '', '', '24bd2d213d31fa0bd5cf1c2031a4a435.jpg', '9', '11', '', '3', '4', '2004-07-19', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('86', '031.06.08', '', 'Eliana Lieman', 'Tulungagung', '1979-09-15', '2', '2', '1', 'Tanjung Sari Baru 5/64', 'Surabaya', '', '', '', '', '0816558720', '22e6f0d5ea46eb650d833fe2d3225197.jpg', '9', '11', '', '3', '4', '2008-08-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('87', '127.01.13', '', 'Elizabeth Sunjoto, S.Sn.', 'Surabaya', '1989-01-20', '2', '2', '2', 'Darmo Hill O-40', 'Surabaya', '', '', '', '', '08123153899', 'cd6bc004656f2333f7573f86c1216b35.jpg', '9', '11', '', '3', '4', '2013-05-27', '0000-00-00', '0000-00-00', '0', '', '', '', '2', '2015-06-20', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('88', '016.06.05', '', 'Elly Mayasari, S.Pd.', 'Surabaya', '1983-08-03', '2', '2', '1', 'Griya Babatan Mukti K-3, Wiyung', 'Surabaya', '', '', '', '', '085646363080', '84e4774f56f6d2e1552eda8499d37011.jpg', '9', '11', '', '3', '4', '2005-05-09', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('89', '010.06.05', '', 'Erika Magdalena, S.Pd.', 'Surabaya', '1982-11-06', '2', '2', '1', 'Perum Menteng Regency C-2', 'Gresik', '', '', '', '', '085648280222', '0b7d71fad7fd4b1d0de29ac305fa5d97.jpg', '9', '11', '', '3', '4', '2004-10-18', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('90', '014.06.05', '', 'Evy Lindayana, S.Si., Apt.', 'Dobo', '1975-03-31', '2', '2', '1', 'Jajar Tunggal Utara C-19', 'Surabaya', '', '', '', '', '08123008784', '62e3968497115f34b177c13752b5fa47.jpg', '9', '14', '', '3', '4', '2005-05-23', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('91', '102.01.12', '', 'Helen, S.E.', 'Malang', '1981-08-26', '2', '2', '1', '', '', '', '', '', '', '08123303289', '50569f7579cf55d697fa4a5be234456d.jpg', '9', '11', '', '3', '4', '2012-08-20', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('92', '028.06.07', '', 'Ika Sari, S.Psi', 'Surabaya', '1977-09-11', '2', '2', '2', 'Sidotopo Wetan 131', 'Surabaya', '', '', '', '', '085648777947', '2bdae99f8ac25463e1fa870317fa8369.jpg', '9', '11', '', '3', '4', '2007-08-20', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('93', '095.06.11', '', 'Irene Vanessa, S.S.', 'Surabaya', '1986-09-14', '2', '2', '1', 'Raya Karah Indah N-45', 'Surabaya', '', '', '', '', '08123101240', '1e9b1f3c14f83a48f991ce12b38e1334.jpg', '9', '11', '', '3', '4', '2011-08-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('94', '119.01.12', '', 'Julini Liunardi, S.E.', 'Surabaya', '1990-12-23', '2', '2', '2', '', '', '', '', '', '', '', '08c455826ae5f230804c27b347c37179.jpg', '9', '11', '', '9', '4', '2012-09-03', '0000-00-00', '2015-08-31', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('95', '033.06.07', '', 'Lia Debora', 'Surabaya', '1985-03-13', '2', '2', '1', 'Jagalan 7/10', 'Surabaya', '', '', '', '', '081333099811', '542dbd24d5c90715921dfe38c1b01c6b.jpg', '9', '11', '', '3', '3', '2013-07-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('96', '045.06.08', '', 'Maria Putri Ardianasari, S.Pd.', '', '1984-03-27', '2', '2', '1', 'Mliwis 35', 'Surabaya', '', '', '', '', '081235055010', '59cbf3a9ff9d2753d1785094c626ffda.jpg', '9', '11', '', '3', '4', '2008-09-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('97', '039.06.09', '', 'Maureen Octavia, S.E', 'Surabaya', '1986-10-14', '2', '2', '1', 'Sambi Kerep N-14 Perum Perhutani', 'Surabaya', '', '', '', '', '08563038589', '2015a56a1f7683c7e11a03ecfda0a412.jpg', '9', '11', '', '3', '4', '2009-02-23', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('98', '004.03.03', '', 'Olivia Tiono Gunawan, S.S., M.M.', 'Surabaya', '1979-06-15', '2', '2', '1', 'Permata Safira Regency F4/27', 'Surabaya', '', '', '', '', '081553205179', '', '9', '13', '', '3', '5', '2003-07-07', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('99', '021.06.06', '', 'Olivia Weol, S.S.', 'Surabaya', '1983-10-25', '2', '2', '1', 'Darmo Permai Utara XI/18', 'Surabaya', '', '', '', '', '08123120689', '95944a8578112448a8d3da40b41fae2b.jpg', '9', '11', '', '3', '4', '2006-03-27', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('100', '088.06.12', '', 'One Remmayanti, S.S.', 'Surabaya', '1971-08-08', '2', '2', '1', 'Jl Tanjung Pura No.24', 'Surabaya', '', '', '', '', '', 'b01530ec6e022c9a17fd4c6b9749ae5b.jpg', '9', '11', '', '3', '4', '2011-02-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('101', '073.06.09', '', 'Retina Mastiur Naibaho, S.Pd.', 'Surabaya', '1983-10-10', '2', '2', '1', 'Jugruk Rejosari I / I', 'Surabaya', '', '', '', '', '081330321440', '46e776e7e386dfd804c1ee2e70037ca4.jpg', '9', '11', '', '3', '4', '2009-07-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('102', '030.01.08', '', 'Heidi Donesha, M.Div.', 'Texas, USA', '1978-07-08', '2', '2', '2', '', '', '', '', '', '', '', '', '9', '11', '', '9', '5', '2008-07-14', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('103', '092.07.10', '', 'Marseila Krisyane, S.Pd.', 'Surabaya', '1983-06-30', '2', '2', '1', 'Manukan Krajan IV/34', 'Surabaya', '', '', '', '', '', '1009e070f846fb48713152620ad956ec.jpg', '9', '11', '', '3', '4', '2010-06-21', '0000-00-00', '0000-00-00', '0', '', '', '', '2', '2015-06-20', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('104', '007.06.04', '', 'Shierly Lionita, S.E.', 'Surabaya', '1976-04-27', '2', '2', '1', 'Jl Kupang Indah 7 / 22', 'Surabaya', '', '', '', '', '03170951173', 'b5dedd622f45171188e76251bd5221f3.jpg', '9', '11', '', '3', '4', '2004-06-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('105', '178.02.14', '', 'Wanda Krisma Nathania, S.Pd.', 'Bojonegoro', '1989-03-04', '2', '2', '1', 'Komplek TNI AL, Rumdis Ampel 1/58 Semampir', 'Surabaya', '', '', '', '', '081235959399', '', '9', '11', '', '9', '4', '2014-07-21', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('108', '035.06.07', '', 'Daniel Krisna S., S.Si., M.M.', 'Surabaya', '1982-12-23', '1', '2', '2', 'Bibis Tama I 4/6', 'Surabaya', '', '', '', '', '085 648 475 656', '', '11', '11', '', '3', '5', '2007-06-25', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('109', '106.01.12', '', 'Daniel O&#039;Hara, S.Th.', 'Blitar', '1984-11-02', '1', '2', '2', 'Simohilir Barat XI/7', 'Surabaya', '', '', '', '', '083 830 246 257', '3f349ffe7a6188488f5ecff319e9eebe.jpg', '11', '11', '', '3', '4', '2012-07-16', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('110', '013.06.05', '', 'David Hendra G., S.E.', 'Surabaya', '1983-06-24', '1', '2', '1', 'Taman Siwalan Indah Blok P-33 Kepatihan', 'Gresik', '', '', '', '', '088 804 892 340', '', '11', '14', '', '3', '4', '2005-05-09', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('111', '137.01.13', '', 'Debora Terang Miniang, S.Pd.', 'Mojokerto', '1969-08-20', '2', '2', '1', 'Kedurus IVB/65', 'Surabaya', '', '', '', '', '081 357 626 302', 'f2d1e3f6eae4d9df5e95710a51101a16.jpg', '11', '11', '', '3', '4', '2013-07-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('112', '091.06.12', '', 'Denny Susanto, S.E., BBA', 'Surabaya', '1984-10-19', '1', '2', '2', 'Dukuh Kupang Timur XI/26', 'Surabaya', '', '', '', '', '089 999 986 79', '4100e0a447f2740f413ee25099301d0b.jpg', '11', '11', '', '3', '4', '2011-10-24', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('113', '055.06.09', '', 'Dewi Kartika, S.Pd.', 'Surabaya', '1977-03-25', '2', '2', '1', 'Darmo Indah Barat F-6', '', '', '', '', '', '087 854 343 737', '74919ce84c61068b74700323d6499e47.jpg', '11', '11', '', '3', '4', '2009-08-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('114', '151.01.14', '', 'Fritzie Wibisono, S.S.', 'Surabaya', '1979-11-09', '2', '2', '1', 'Taman Pondok Indah PX-20 Wiyung', 'Surabaya', '', '', '', '', '081 515 999 388', '084de96a3c2db87fe232b6b7299af327.jpg', '11', '11', '', '9', '4', '2014-03-17', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('115', '090.06.12', '', 'Iis Santi Melani S., S.T.', 'Surabaya', '1982-07-10', '2', '2', '1', 'Wisma Tengger V/16', '', '', '', '', '', '081 216 654 73', 'c692434465bc5412d76a84521644c055.jpg', '11', '11', '', '3', '4', '2011-06-20', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('116', '194.01.13', '', 'Laarni D. Umoc', 'Filipina', '1970-02-15', '2', '2', '2', '', '', '', '', '', '', '089 628 935 977', '', '11', '11', '', '9', '4', '2013-02-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('117', '065.06.10', '', 'Lenny Diana K. Kwan, S.S.', 'Surabaya', '1983-08-10', '2', '2', '1', 'Tanjung Sari Baru 3/27', 'Surabaya', '', '', '', '', '081 230 986 70', '', '11', '11', '', '3', '4', '2010-02-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('118', '025.06.06', '', 'Maria Magdalena, S.Ipd.K', 'Pasuruan', '1982-06-05', '2', '2', '1', 'Pucang Jajar Utara 26', '', '', '', '', '', '085 730 072 246', '34b0d332e3b5ef1ac408761e28f0d30b.jpg', '11', '11', '', '3', '4', '2006-09-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('119', '103.01.12', '', 'Oei Bing Bing, M.Pd.', 'Surabaya', '1985-03-25', '2', '2', '1', '', '', '', '', '', '', '081 293 987 377', '', '11', '11', '', '3', '5', '2012-07-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('120', '041.06.08', '', 'Rahayu Febiana, S.Psi., M.M.', 'Pasuruan', '1979-02-25', '2', '2', '1', 'Perum Larangan Mega Asri B/38 Candi', 'Sidoarjo', '', '', '', '', '081 231 153 842', '58303325396c535039fbeedeb8632fef.jpg', '11', '11', '', '3', '5', '2006-06-26', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('121', '093.01.11', '', 'Ramilo Nenita C., B.Sc.', 'Filipina', '1958-05-23', '2', '2', '1', '', '', '', '', '', '', '081 216 075 663', '', '11', '11', '', '9', '4', '2011-07-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('122', '008.03.04', '', 'Ratna Bayu A., M.Pd.', 'Pandaan', '1970-04-07', '2', '2', '1', '', '', '', '', '', '', '083 856 542 777', '', '11', '13', '', '3', '5', '2004-01-05', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('123', '130.01.13', '', 'Ros Indah Simatupang, S.S.', 'Lobugala, Tapanuli', '1989-03-18', '2', '2', '2', 'Raya Batu Mulia 15A Driyorejo', 'Surabaya', '', '', '', '', '081 370 892 566', 'cf2b581776c6b312bef05f922cbbc413.jpg', '11', '11', '', '3', '4', '2013-06-17', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('124', '082.05.10', '', 'Sandradevi Tedjokusumo, S.T.', 'Surabaya', '1978-10-18', '2', '2', '1', 'Simo Rukun 7/7', 'Surabaya', '', '', '', '', '031 910 007 75', '8762b483c3b66e383a3c318e5439157e.jpg', '11', '11', '', '3', '4', '2015-01-26', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('125', '104.01.12', '', 'Stella Ivonne P.S., MPA', 'Yogyakarta', '1982-03-20', '2', '2', '1', '', '', '', '', '', '', '081 228 899 973', '15f1bb3cfaec64648e2541b70fdd54c1.jpg', '11', '11', '', '3', '5', '2011-11-07', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('126', '190.01.14', '', 'Theresia Ayu Kusdwiharini, M.Pd.', 'Sidoarjo', '1984-07-07', '2', '2', '1', 'Jenggolo 2/E-51', 'Sidoarjo', '', '', '', '', '087 855 247 844', '', '11', '11', '', '9', '5', '2015-08-14', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('127', '067.06.09', '', 'Trofiansi Roliand Dalero, S.Th.', 'Rainis', '1981-04-06', '2', '2', '1', 'Tubanan Baru C25', 'Surabaya', '', '', '', '', '082 400 292 20', 'a46f74b92e04e2a0e4fbe711cfc38a8d.jpg', '11', '20', '', '3', '4', '2009-08-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('128', '026.06.07', '', 'Ully D. Ria Ambarita, S.Psi.', 'Surabaya', '1980-06-10', '2', '2', '1', 'Silindri G-3/12 HN2 Driyorejo Kota Baru', 'Gresik', '', '', '', '', '081 331 581 477', '9444903dee71b6d73add417fd083b201.jpg', '11', '11', '', '3', '4', '2007-06-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('129', '047.06.08', '', 'Utin, S.Th.', 'Pontianak', '1974-07-21', '1', '2', '1', 'Pakis Gunung II/16B', 'Surabaya', '', '', '', '', '081 332 195 047', 'd749f109f1bfc50d769c4b1961b38320.jpg', '11', '11', '', '3', '4', '2008-01-09', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('130', '052.07.09', '', 'Yobel Edi Waluyo, S.Th.', 'Kediri', '1987-05-04', '1', '2', '1', 'Donowati 2/16', 'Surabaya', '', '', '', '', '085 733 247 111', '3b5bd37c90f6838c1dfbbdaac555e392.jpg', '11', '11', '', '3', '4', '2009-04-13', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('131', '133.01.13', '', 'Agustinus, S.Th.', 'Tuban', '1983-10-27', '1', '2', '1', 'Tubanan Baru C25', 'Surabaya', '', '', '', '', '', '7f5e35871204e695b278e26012602aed.jpg', '13', '11', '', '3', '4', '2013-07-01', '0000-00-00', '0000-00-00', '0', '', '', '', '2', '2015-06-20', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('132', '182.01.14', '', 'Anastasia Ratna Handayani, S.Pd.', 'Malang', '1975-05-13', '2', '2', '1', 'Simorejo 26', 'Surabaya', '', '', '', '', '0856 4630 0513', '', '13', '11', '', '9', '4', '2014-08-11', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('133', '201.01.14', '', 'Benny Edward Goodman, B.A.', 'Amerika', '1967-08-17', '1', '2', '1', 'Peneleh 3/54', 'Surabaya', '', '', '', '', '', 'f7031bcb28e95a47edad69b83fc83d4f.jpg', '13', '11', '', '9', '4', '2014-10-21', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('134', '202.01.15', '', 'Cherry Lou P. Cunanan, B.Sc.', 'Filipina', '1975-05-15', '2', '2', '2', '', '', '', '', '', '', '', '3679043986ac4b982e469e9e9ad8381c.jpg', '13', '11', '', '9', '4', '2015-01-15', '0000-00-00', '2016-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('135', '068.06.08', '', 'Danang Panca, S.T.', 'Sidoarjo', '1976-09-06', '1', '2', '1', 'Jl. Suningrat 39 Ketegan', 'Sidoarjo', '', '', '', '', '085 648 053 910', '5a5aa342315b71893814a4a22073f168.jpg', '13', '11', '', '3', '4', '2006-01-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('136', '006.06.04', '', 'Desy Yovitaningsih, S.T.', 'Surabaya', '1978-12-22', '2', '2', '1', 'Ketintang Timur PTT 2/24', 'Surabaya', '', '', '', '', '081 332 532 848', 'cc5160c7e5646035a0ef1925b010af89.jpg', '13', '14', '', '3', '4', '2004-05-24', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('137', '200.01.14', '', 'Elena Ose Dionisio, B.SEd', 'Filipina', '1975-06-09', '2', '2', '2', '', '', '', '', '', '', '085 852 409 608', 'f85d1e1c0116c9b21332cf2024134d01.jpg', '13', '11', '', '9', '4', '2014-07-07', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('138', '174.01.14', '', 'Erafid Moardhika, S.Pd.', 'Surabaya', '1986-05-15', '1', '2', '1', 'Perum Taman Sejahtera, Jl. Karang Klumprik Utara C-7 Wiyung', 'Surabaya', '', '', '', '', '088 135 213 69', '', '13', '11', '', '9', '4', '2014-07-07', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('139', '198.01.14', '', 'Herman Sionosa, B.Sc.', 'Filipina', '1973-12-28', '1', '2', '1', '', '', '', '', '', '', '082 233 989 138', '', '13', '11', '', '9', '4', '2014-01-07', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('140', '043.06.09', '', 'Kartika, S.Th., M.M.', 'Surabaya', '1987-09-05', '2', '2', '1', 'Wonorejo Permai Selatan 4/CC-277', 'Surabaya', '', '', '', '', '081 938 082 081', '', '13', '15', '', '3', '5', '2009-06-15', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('141', '195.01.13', '', 'Larmy Judan, B.SEd.', 'Filipina', '1976-11-04', '2', '2', '1', '', '', '', '', '', '', '081 803 128 634', '', '13', '11', '', '9', '4', '2013-06-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('142', '199.01.14', '', 'Liberty Sionosa, B.SEd.', 'Filipina', '1972-06-12', '2', '2', '1', '', '', '', '', '', '', '082 233 989 168', '', '19', '16', '', '9', '4', '2014-01-07', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('143', '139.01.13', '', 'Massa Simon Wachju Noegroho, S.Pd.', 'Surabaya', '1970-07-17', '1', '3', '1', 'Griya Kebraon Utara AG/28', 'Surabaya', '', '', '', '', '081 216 337 336', '1d0c69cd24d4bb631c58247ab70f1891.jpg', '13', '11', '', '3', '4', '2013-07-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('144', '164.03.14', '', 'Merlin Tristano, B.S.', 'Surabaya', '1981-05-03', '2', '2', '2', 'Raya Darmo Permai 3/12', 'Surabaya', '', '', '', '', '089 839 915 43', '', '13', '11', '', '9', '4', '2014-04-01', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('145', '036.06.07', '', 'Naomi Setianingtyas, S.Th.', 'Kediri', '1981-12-01', '2', '2', '1', 'Manukan Tirto IV Blok 22 J/13', 'Surabaya', '', '', '', '', '081 252 763 131', '5caef460dc9799b843d59a5c84e3f749.jpg', '13', '11', '', '3', '4', '2007-09-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('146', '196.01.13', '', 'Reynaldo C Masanguid, B,SEd.', 'Filipina', '1976-10-20', '1', '2', '1', '', '', '', '', '', '', '087 751 081 924', '', '13', '11', '', '9', '4', '2013-06-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('147', '138.01.13', '', 'Richard Aprianus Manullang, S.E.', 'Surabaya', '1988-04-04', '1', '2', '2', 'Candi Lontar Lor 44-S/36', 'Surabaya', '', '', '', '', '082 141 133 400', '8e62036ed1cfef737e46d85599eb916d.jpg', '13', '14', '', '3', '4', '2013-07-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('148', '023.06.06', '', 'Sri Mulyati Widiyani, S.S., M.M.', 'Jombang', '1978-08-09', '2', '2', '2', 'Pakis Tirtosari 3/4', 'Surabaya', '', '', '', '', '081 252 220 91', '', '13', '13', '', '3', '5', '2005-07-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('149', '187.01.14', '', 'Stephen Piere Evan, S.Pd.', 'Sidoarjo', '1991-05-22', '1', '3', '2', 'Durian III/E.490 Pondok Tjandra Indah', '', '', '', '', '', '089 676 438 421', '487272295b42d8cc9fc919cd44506069.jpg', '13', '11', '', '9', '4', '2014-10-14', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('150', '098.01.11', '', 'Tang Chu Kean, B.A.', 'Kedah, Malaysia', '1978-03-12', '1', '2', '1', 'Regency 21, Blok D-15, Arif Rahman Hakim 138 - 142', 'Surabaya', '', '', '', '', '087 852 801 595', '', '13', '36', '', '9', '4', '2011-07-11', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('151', '197.01.13', '', 'Yong Boon Kok, B.Sc. MTM', '', '1968-02-16', '1', '-', '1', 'Manyar Kertoadi 99', 'Surabaya', '', '', '', '', '081 852 9390', '', '13', '11', '', '9', '5', '2013-12-02', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('152', '107.02.14', '', 'Albertus Dicky Sudarmadji, S.Sn.', 'Surabaya', '1988-07-15', '1', '2', '2', 'Praban Wetan V/1', 'Surabaya', '', '', '', '', '0853 5368 6808', '', '31', '21', '', '3', '4', '2011-01-05', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('153', '145.02.13', '', 'Anastasia Marieta Angela', 'Surabaya', '1988-03-02', '2', '3', '1', 'Pakis Gunung IA/03', 'Surabaya', '', '', '', '', '081 232 248 819', 'b7fbe60bf426727e309a70fe536d6c32.jpg', '9', '19', '', '3', '3', '2013-07-22', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('154', '181.02.14', '', 'Betti Kristina Kwalrakun, S.H.', 'Surabaya', '1986-05-18', '2', '2', '1', 'Manukan Wasono VI/6', 'Surabaya', '', '', '', '', '082 233 344 992', '', '13', '19', '', '9', '4', '2014-08-06', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('155', '108.02.12', '', 'Christine Fany T., S.E.', 'Surabaya', '1991-06-22', '2', '2', '2', 'Dukuh Pakis III Taman Makam Pahlawan/56', 'Surabaya', '', '', '', '', '085 732 103 940', 'ccb8fdd848003e015c068fec848cb44e.jpg', '17', '25', '', '3', '4', '2011-01-17', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('156', '123.02.12', '', 'Christine Hartanti', 'Surabaya', '1989-05-03', '2', '2', '2', 'Larangan Mega Asri IX/C-75', 'Sidoarjo', '', '', '', '', '', '', '18', '26', '', '3', '3', '2012-05-28', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('157', '188.02.14', '', 'Christine Irawan, S.E.', 'Surabaya', '1991-04-01', '2', '2', '2', 'Simpang Darmo Permai Selatan V/18', 'Surabaya', '', '', '', '', '081 703 001 350', '24e0fa6e7df45699723e8f111154529b.jpg', '17', '25', '', '9', '4', '2014-12-01', '0000-00-00', '2015-11-30', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('158', '113.02.12', '', 'Danang Tri Saputro', 'Surabaya', '1982-04-23', '2', '2', '2', 'Dukuh Kupang Barat XXXI/17B', 'Surabaya', '', '', '', '', '081 330 007 090', '', '20', '35', '', '3', '3', '2012-06-18', '0000-00-00', '0000-00-00', '5', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('159', '168.02.14', '', 'Desi Nawangwulan, A.Md.', 'Surabaya', '1973-12-12', '2', '2', '1', 'Simo Kwagean 44', 'Surabaya', '', '', '', '', '088 837 746 01', '', '17', '25', '', '9', '9', '2014-07-07', '0000-00-00', '2015-06-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('160', '085.07.10', '', 'Erik Indra Arlianto', 'Surabaya', '1983-04-30', '1', '2', '1', 'Pradah Permai 2/6', 'Surabaya', '', '', '', '', '081 330 119 813', '', '17', '25', '', '3', '3', '2010-09-20', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('161', '114.02.12', '', 'Firmansyah Novianus', 'Surabaya', '1980-11-14', '1', '2', '1', 'Kedung Anyar 2 No. 52', 'Surabaya', '', '', '', '', '', '', '20', '23', '', '9', '3', '2012-06-18', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('162', '118.02.12', '', 'Johannes Ferry, A.Md.', 'Surabaya', '1977-09-03', '1', '2', '1', 'Siwalankerto Selatan II/31', 'Surabaya', '', '', '', '', '', '', '20', '38', '', '3', '9', '2012-08-06', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('163', '176.02.14', '', 'Ketut Tanto Dharma Putra Sandjaja, S.E.', 'Surabaya', '1983-06-29', '1', '2', '1', 'Darmo Indah Selatan Blok WW No. 29', 'Surabaya', '', '', '', '', '', '', '17', '25', '', '9', '4', '2014-07-16', '0000-00-00', '2015-07-17', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('164', '189.02.14', '', 'Liliswati, S.E.', 'Surabaya', '1978-09-27', '2', '2', '2', 'Menganti Babatan V no. 18', 'Surabaya', '', '', '', '', '081 331 015 654', '6bf90d1fb7dabbbe075800e54fa0b33c.jpg', '17', '25', '', '9', '4', '2014-12-01', '0000-00-00', '2015-11-30', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('165', '050.07.08', '', 'Lucia Wiwik', 'Surabaya', '1970-10-18', '2', '2', '1', 'Jagir Sidomukti 3/49', 'Surabaya', '', '', '', '', '', '', '11', '19', '', '3', '3', '2008-11-19', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('166', '122.02.12', '', 'Maryeta Pramesti Purbarini, S.Ak.', 'Kediri', '1985-04-03', '2', '2', '2', '', '', '', '', '', '', '', '', '17', '39', '', '3', '4', '2012-12-03', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('167', '058.07.09', '', 'Melfa Sinaga, A.Md.', 'Sibaganding', '1987-05-24', '2', '2', '2', 'Gubeng Kertajaya IV A/38', 'Surabaya', '', '', '', '', '', '', '11', '24', '', '3', '9', '2009-07-06', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('168', '142.02.13', '', 'Neria Indah Wiliyanti, S.Psi', 'Kediri', '1981-05-23', '2', '2', '2', 'Petemon IIA No. 29 B', 'Surabaya', '', '', '', '', '08563320447', '6284c8140f1b0cc57a30b4ba3a1c3517.jpg', '18', '26', '', '3', '4', '2013-07-01', '0000-00-00', '0000-00-00', '5', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('169', '051.07.09', '', 'Nicky Melissa Olivia, Sm. Th.', 'Rumbai, Pekanbaru', '1983-05-19', '2', '2', '1', '', '', '', '', '', '', '', '', '13', '19', '', '3', '8', '2009-01-05', '0000-00-00', '0000-00-00', '0', '', '', '', '2', '2015-07-03', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('170', '117.02.12', '', 'Nursuwenik', 'Surabaya', '1965-12-12', '2', '2', '1', 'Dukuh Setro 3/67', 'Surabaya', '', '', '', '', '', 'c4a3bd9c76a43973293a20482cc029c5.jpg', '20', '27', '', '3', '-', '2012-07-02', '0000-00-00', '0000-00-00', '0', '', '', '', '2', '2015-05-29', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('171', '149.02.14', '', 'Pujiati', 'Nagnjuk', '1974-08-15', '2', '2', '1', 'Darmo Indah Barat 3/B-23', 'Surabaya', '', '', '', '', '081 217 645 577', '67cb4b75701745c9d324f3a933e88f25.jpg', '20', '17', '', '3', '7', '2014-01-06', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('172', '186.02.14', '', 'Reski Trya Putri, A.Md.', 'Malang', '1991-12-15', '2', '2', '2', 'Dusun Kopral, Desa Sukowilangun RT 45 RW 07, Kecamatan Kalipare, Kabupaten Malang', '', '', '', '', '', '085 755 237 073', '', '20', '33', '', '9', '9', '2014-09-01', '0000-00-00', '2015-11-30', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('173', '143.02.13', '', 'Sarita Antonia Goenawan', 'Surabaya', '1991-04-08', '2', '2', '2', 'Graha Family R-39', 'Surabaya', '', '', '', '', '081 133 426 89', '', '19', '40', '', '9', '4', '2014-08-11', '0000-00-00', '0000-00-00', '0', '', '', '', '2', '2015-06-20', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('174', '124.02.13', '', 'Sucipto', 'Kediri', '1985-12-20', '1', '2', '1', 'Sangihe No. 2B, Desa Gedangsewu, Pare-Kediri', '', '', '', '', '', '', '9594e17bf07633d0a649e5ab69a0fb3f.jpg', '20', '41', '', '9', '3', '2013-01-07', '0000-00-00', '2015-05-07', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('175', '177.02.14', '', 'Soemiati', 'Surabaya', '1962-04-25', '2', '1', '1', 'Krukah Utara 9-B/3', 'Surabaya', '', '', '', '', '', '', '20', '28', '', '-', '-', '2015-01-27', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('176', '101.02.12', '', 'Sumining', 'Nagnjuk', '1974-01-13', '2', '1', '1', 'Kalibokor II/31D', '', '', '', '', '', '', '', '20', '28', '', '3', '-', '2015-01-27', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('177', '087.09.10', '', 'Suprapto', 'Tuban', '1972-08-13', '1', '1', '1', '', '', '', '', '', '', '', '', '20', '23', '', '3', '-', '2010-10-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('178', '125.02.13', '', 'Susilo', 'Tuban', '1988-12-02', '1', '1', '2', '', '', '', '', '', '', '', '', '20', '23', '', '9', '3', '2013-02-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('179', '005.07.04', '', 'Suyati', 'Madiun', '1985-08-01', '2', '1', '1', 'Donowati Gg. II No. 65', 'Surabaya', '', '', '', '', '', 'd7d01fc0a51e50116f19d20994197577.jpg', '20', '27', '', '3', '3', '2015-01-27', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('180', '084.04.11', '', 'Theresia Indrawati, S.Pd.', 'Surabaya', '1977-03-27', '2', '2', '1', 'Lebak Permai 1/5', 'Surabaya', '', '', '', '', '', '', '-', '32', '', '3', '4', '2011-04-04', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('181', '152.02.14', '', 'Trinining Sulistyowati', 'Surabaya', '1975-12-01', '2', '2', '1', 'Palem Pertiwi Regency JD 12A, Menganti', 'Gresik', '', '', '', '', '', '', '20', '31', '', '9', '3', '2014-03-10', '0000-00-00', '2015-07-20', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('182', '150.02.14', '', 'Wanda Lesar', 'Manado', '1973-08-30', '2', '2', '1', 'Wiguna Selatan II/23', 'Surabaya', '', '', '', '', '085 855 181 814', '', '20', '37', '', '3', '3', '2014-02-10', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('183', '110.02.12', '', 'Yohana Titis Wahyu Andayani, S.Kom.', 'Surabaya', '1979-07-02', '2', '2', '1', 'Gayungsari Barat 12 GA-02', 'Surabaya', '', '', '', '', '', '', '33', '42', '', '3', '4', '2011-08-01', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('184', '179.02.14', '', 'Yoppie Azhi Asmara', 'Surabaya', '1987-05-13', '1', '2', '2', 'Jalan Sedati Agung I No. 80 RT 04/ RW 02, Ds. Sedati Agung Kec. Sedati-Kab. Sidoarjo', '', '', '', '', '', '', '', '20', '30', '', '9', '3', '2014-07-21', '0000-00-00', '0000-00-00', '0', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');
INSERT INTO `hrd_karyawan` VALUES ('185', '038.07.07', '', 'Yudha Anggara Putra Perdana', 'Kediri', '1986-06-14', '1', '2', '1', 'Sepawon RT 002 RW 003 Ds. Sepawon Kediri', '', '', '', '', '', '', '4cc9b2a8d5824895b9bd503e2f283c94.jpg', '20', '41', '', '3', '3', '2007-07-10', '0000-00-00', '0000-00-00', '6', '', '', '', '1', '0000-00-00', '', '', '0000-00-00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00');

-- ----------------------------
-- Table structure for hrd_kelamin
-- ----------------------------
DROP TABLE IF EXISTS `hrd_kelamin`;
CREATE TABLE `hrd_kelamin` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `kelamin` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_kelamin
-- ----------------------------
INSERT INTO `hrd_kelamin` VALUES ('1', 'Laki-laki');
INSERT INTO `hrd_kelamin` VALUES ('2', 'Perempuan');

-- ----------------------------
-- Table structure for hrd_m_agama
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_agama`;
CREATE TABLE `hrd_m_agama` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agama` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_agama
-- ----------------------------
INSERT INTO `hrd_m_agama` VALUES ('1', 'Islam', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('2', 'Kristen', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('3', 'Nasrani', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('4', 'Hindu', '0', '');
INSERT INTO `hrd_m_agama` VALUES ('5', 'Budha', '0', '');

-- ----------------------------
-- Table structure for hrd_m_bagian
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_bagian`;
CREATE TABLE `hrd_m_bagian` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bagian` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_bagian
-- ----------------------------
INSERT INTO `hrd_m_bagian` VALUES ('1', 'Akademik', '0', 'Guru, mentor, dan staff pegajar');
INSERT INTO `hrd_m_bagian` VALUES ('2', 'Non Akademik', '0', 'Staff umum, dan bagian lain');

-- ----------------------------
-- Table structure for hrd_m_dokumen
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_dokumen`;
CREATE TABLE `hrd_m_dokumen` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dokumen` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `reminder` int(11) NOT NULL DEFAULT '30',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_dokumen
-- ----------------------------
INSERT INTO `hrd_m_dokumen` VALUES ('1', 'VISA', '0', '30', '');

-- ----------------------------
-- Table structure for hrd_m_jenistraining
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_jenistraining`;
CREATE TABLE `hrd_m_jenistraining` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenistraining` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_jenistraining
-- ----------------------------
INSERT INTO `hrd_m_jenistraining` VALUES ('1', 'Inhouse', '0', '');
INSERT INTO `hrd_m_jenistraining` VALUES ('2', 'Outsource', '0', '');

-- ----------------------------
-- Table structure for hrd_m_kelompok
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_kelompok`;
CREATE TABLE `hrd_m_kelompok` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_kelompok
-- ----------------------------
INSERT INTO `hrd_m_kelompok` VALUES ('1', 'Lokal', '0', '');
INSERT INTO `hrd_m_kelompok` VALUES ('2', 'Ekspatriat', '0', '');

-- ----------------------------
-- Table structure for hrd_m_keluarga
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_keluarga`;
CREATE TABLE `hrd_m_keluarga` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keluarga` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_keluarga
-- ----------------------------
INSERT INTO `hrd_m_keluarga` VALUES ('1', 'Ayah', '0', '');
INSERT INTO `hrd_m_keluarga` VALUES ('2', 'Ibu', '0', '');
INSERT INTO `hrd_m_keluarga` VALUES ('3', 'Suami', '0', '');
INSERT INTO `hrd_m_keluarga` VALUES ('4', 'Istri', '0', '');
INSERT INTO `hrd_m_keluarga` VALUES ('5', 'Anak', '0', '');

-- ----------------------------
-- Table structure for hrd_m_marital
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_marital`;
CREATE TABLE `hrd_m_marital` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marital` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_marital
-- ----------------------------
INSERT INTO `hrd_m_marital` VALUES ('1', 'Belum menikah', '0', '');
INSERT INTO `hrd_m_marital` VALUES ('2', 'Menikah', '0', '');
INSERT INTO `hrd_m_marital` VALUES ('3', 'Duda / Janda', '0', '');

-- ----------------------------
-- Table structure for hrd_m_posisi
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_posisi`;
CREATE TABLE `hrd_m_posisi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `posisi` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_posisi
-- ----------------------------
INSERT INTO `hrd_m_posisi` VALUES ('1', 'HRD', '0', '');
INSERT INTO `hrd_m_posisi` VALUES ('2', 'General Staff', '0', '');
INSERT INTO `hrd_m_posisi` VALUES ('3', 'Humas', '0', '');

-- ----------------------------
-- Table structure for hrd_m_status
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_status`;
CREATE TABLE `hrd_m_status` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `reminder` int(11) NOT NULL DEFAULT '30',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_status
-- ----------------------------
INSERT INTO `hrd_m_status` VALUES ('1', 'Tetap', '0', '30', '');
INSERT INTO `hrd_m_status` VALUES ('2', 'Kontrak', '0', '30', '');

-- ----------------------------
-- Table structure for hrd_m_tingkat
-- ----------------------------
DROP TABLE IF EXISTS `hrd_m_tingkat`;
CREATE TABLE `hrd_m_tingkat` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` varchar(50) NOT NULL,
  `urut` tinyint(4) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_m_tingkat
-- ----------------------------
INSERT INTO `hrd_m_tingkat` VALUES ('1', 'General staff', '0', '');
INSERT INTO `hrd_m_tingkat` VALUES ('2', 'Manager', '0', '');
INSERT INTO `hrd_m_tingkat` VALUES ('3', 'Staff', '0', '');

-- ----------------------------
-- Table structure for hrd_menikah
-- ----------------------------
DROP TABLE IF EXISTS `hrd_menikah`;
CREATE TABLE `hrd_menikah` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_menikah
-- ----------------------------
INSERT INTO `hrd_menikah` VALUES ('1', 'Menikah', '0');
INSERT INTO `hrd_menikah` VALUES ('2', 'Belum Menikah', '0');

-- ----------------------------
-- Table structure for hrd_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `hrd_pegawai`;
CREATE TABLE `hrd_pegawai` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `noidentitas` varchar(30) NOT NULL,
  `kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `pinbb` varchar(20) NOT NULL,
  `tmplahir` varchar(20) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `marital` int(10) unsigned NOT NULL DEFAULT '0',
  `agama` int(10) unsigned NOT NULL DEFAULT '0',
  `bagian` int(10) unsigned NOT NULL DEFAULT '0',
  `kelompok` int(10) unsigned NOT NULL DEFAULT '0',
  `posisi` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `tingkat` int(10) unsigned NOT NULL DEFAULT '0',
  `kesehatan` varchar(500) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `darah` varchar(2) NOT NULL DEFAULT '-',
  `berat` decimal(4,1) NOT NULL DEFAULT '0.0',
  `tinggi` decimal(4,1) NOT NULL DEFAULT '0.0',
  `photo` blob NOT NULL,
  `tglkerja` date NOT NULL DEFAULT '0000-00-00',
  `golakhir` varchar(100) NOT NULL,
  `akhirkontrak` date NOT NULL DEFAULT '0000-00-00',
  `akhirgol` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_pegawai
-- ----------------------------
INSERT INTO `hrd_pegawai` VALUES ('1', 'Claudia Nathalia', '201309001', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('2', 'Coni Chandra', '201309002', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('3', 'Helen Wijaya', '201309003', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('4', 'Jenny Hartono', '201309004', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('5', 'Louise Melani Gunawan', '201309005', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('6', 'Maria Karunia', '201309006', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('7', 'Maya Lusita', '201309007', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('8', 'Shanti Mahardikani', '201309008', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('9', 'Stephanie Hartanto', '201309009', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('10', 'stefany angelina trijono', '201309010', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('11', 'Amelia Sinarta', '201309011', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('12', 'Musa Mohamad K.', '201309012', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('13', 'Ngatini', '201309013', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('14', 'Selli Nur Susanti', '201309014', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('15', 'Reni Setyaningsih', '201309015', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('16', 'Yohana Titis W.', '201309016', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('17', 'Yossy Ana Susilo', '201309017', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('18', 'Agustinus', '201309018', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('19', 'Chandra Maruli Manulang', '201309019', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('20', 'Christine Oscar', '201309020', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('21', 'Imanda Wijaya', '201309021', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('22', 'Jiely Angela', '201309022', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('23', 'Kartika', '201309023', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('24', 'Maria Elvi Priantini', '201309024', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('25', 'M I Judi Kristianti', '201309025', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('26', 'Novita Sari Sutanto', '201309026', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('27', 'Putri Iin Alimsijah', '201309027', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('28', 'Robby Sutaryo', '201309028', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('29', 'Sony Kurniawan', '201309029', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('30', 'Yunus Denny Sudibyo', '201309030', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('31', 'Hanis Sri Utami', '201309031', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('32', 'Lilies Winda Arditya', '201309032', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('33', 'Lini', '201309033', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('34', 'Sahat', '201309034', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('35', 'Albertus Dicky S.', '201309035', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('36', 'Christine Fanny T.', '201309036', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('37', 'Christine Hartanti', '201309037', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('38', 'Eko Pranoto', '201309038', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('39', 'Eunike Laura', '201309039', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('40', 'Ivan Satria Wijaya', '201309040', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('41', 'Jesica Silvia', '201309041', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('42', 'John Ferry', '201309042', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('43', 'Maryeta Pramesti P.', '201309043', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('44', 'Sucipto', '201309044', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('45', 'Sumitro', '201309045', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('46', 'Erwin Gunawan W.', '201309046', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('47', 'Juliana Pandji', '201309047', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('48', 'Minarto Ganda', '201309048', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('49', 'Singgih Widodo L.', '201309049', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('50', 'Tan Hwa San', '201309050', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('51', 'Elisa', '201309051', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('52', 'Trofiansi Roliand Dalero', '201309052', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('53', 'Caroline Florentine', '201309053', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('54', 'Conny Erawati', '201309054', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('55', 'Deasy Arieyanthi', '201309055', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('56', 'Debbie Tresiani', '201309056', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('57', 'Dhesi Indrawati', '201309057', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('58', 'Eliana Lieman', '201309058', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('59', 'Elizabeth Sunjoto', '201309059', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('60', 'Elly Mayasari', '201309060', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('61', 'Erika Magdalena', '201309061', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('62', 'Evy Lindayana', '201309062', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('63', 'Helen', '201309063', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('64', 'Ika Sari', '201309064', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('65', 'Irene Vanessa', '201309065', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('66', 'Julini Liunardi', '201309066', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('67', 'Lia Debora', '201309067', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('68', 'Maria Putri Ardianasari', '201309068', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('69', 'Maureen Octavia Naibaho', '201309069', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('70', 'Olivia Tiono', '201309070', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('71', 'Olivia Weol', '201309071', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('72', 'One Remmayanti', '201309072', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('73', 'Retina Mastiur', '201309073', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('74', 'Shierly Lionita', '201309074', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('75', 'Danang Panca', '201309075', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('76', 'Daniel Krisna', '201309076', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('77', 'David Hendra', '201309077', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('78', 'Debora Terang Miniang', '201309078', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('79', 'Denny Susanto', '201309079', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('80', 'Dewi Kartika', '201309080', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('81', 'Iis Santi Melani S.', '201309081', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('82', 'Irene Irawati', '201309082', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('83', 'Kezia maria Harijono', '201309083', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('84', 'Lenny Diana Kurniawan', '201309084', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('85', 'Lingga Amoef Halim', '201309085', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('86', 'Maria Magdalena', '201309086', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('87', 'Martha Engeline', '201309087', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('88', 'Naomi Setia', '201309088', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('89', 'Oei Bing Bing', '201309089', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('90', 'Rahayu Febiana', '201309090', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('91', 'Ratna Bayu Anggraeni', '201309091', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('92', 'Ros Indah Simatupang', '201309092', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('93', 'Sandradevi Tedjokusumo', '201309093', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('94', 'Stella Ivonne Siswanto', '201309094', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('95', 'Syenti Dewi', '201309095', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('96', 'Ully Dame', '201309096', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('97', 'Daniel O\'Hara', '201309097', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('98', 'Desy Yovitaningsih', '201309098', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('99', 'Purnama Nugraha', '201309099', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('100', 'Richard Aprianus Manullang', '201309100', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('101', 'Ritoh Pardomuan', '201309101', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('102', 'Simon Wachju Noegroho', '201309102', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('103', 'Sri Mulyati', '201309103', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('104', 'Utin', '201309104', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('105', 'Andreas Warta Diyanto', '201309105', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('106', 'Anastasia Marieta Angela', '201309106', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('107', 'Danang Tri Saputro', '201309107', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('108', 'Dewi Komalasari', '201309108', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('109', 'Eny Widayati', '201309109', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('110', 'Erik Indra Arlianto', '201309110', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('111', 'Hot Karolina Sihombing', '201309111', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('112', 'Ike Remi Martando', '201309112', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('113', 'Luchia Kumala', '201309113', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('114', 'Lucia Wiwik', '201309114', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('115', 'Maria theresia Ega yanto', '201309115', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('116', 'Marseila Krisyane', '201309116', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('117', 'Melfa Sinaga', '201309117', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('118', 'Neria Indah Wiliyanti', '201309118', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('119', 'Nicky Melisa Olivia', '201309119', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('120', 'Nursuwenik', '201309120', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('121', 'Ratna Puspa Sari', '201309121', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('122', 'Rita Sari', '201309122', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('123', 'Stevanus Jordan Eko Prasetyo', '201309123', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('124', 'Sugeng Widiarso', '201309124', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '2', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('125', 'Sumining', '201309125', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('126', 'Sumiyati', '201309126', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('127', 'Suyati', '201309127', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('128', 'Theresia Indrawati', '201309128', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('129', 'Vebe Karuna', '201309129', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('130', 'Yobel Edi Waluyo', '201309130', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');
INSERT INTO `hrd_pegawai` VALUES ('131', 'Yudha Anggara', '201309131', '', 'L', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0', '0', '1', '0', '', '', '-', '0.0', '0.0', '', '0000-00-00', '', '0000-00-00', '0000-00-00');

-- ----------------------------
-- Table structure for hrd_pendidikan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_pendidikan`;
CREATE TABLE `hrd_pendidikan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_pendidikan
-- ----------------------------
INSERT INTO `hrd_pendidikan` VALUES ('3', 'SMA', '0');
INSERT INTO `hrd_pendidikan` VALUES ('4', 'S1', '0');
INSERT INTO `hrd_pendidikan` VALUES ('5', 'S2', '0');
INSERT INTO `hrd_pendidikan` VALUES ('6', 'S3', '0');
INSERT INTO `hrd_pendidikan` VALUES ('7', 'D1', '0');
INSERT INTO `hrd_pendidikan` VALUES ('8', 'D2', '0');
INSERT INTO `hrd_pendidikan` VALUES ('9', 'D3', '0');
INSERT INTO `hrd_pendidikan` VALUES ('10', 'D4', '0');

-- ----------------------------
-- Table structure for hrd_pengabdian
-- ----------------------------
DROP TABLE IF EXISTS `hrd_pengabdian`;
CREATE TABLE `hrd_pengabdian` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_pengabdian
-- ----------------------------
INSERT INTO `hrd_pengabdian` VALUES ('1', 'Tidak Ada', '0', '0');
INSERT INTO `hrd_pengabdian` VALUES ('2', 'Pengabdian', '20', '0');

-- ----------------------------
-- Table structure for hrd_penggajian
-- ----------------------------
DROP TABLE IF EXISTS `hrd_penggajian`;
CREATE TABLE `hrd_penggajian` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `karyawan` int(4) NOT NULL,
  `bulan` int(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tkt` varchar(50) NOT NULL,
  `gajipokok` varchar(50) NOT NULL DEFAULT '0',
  `tstruktural` varchar(50) NOT NULL DEFAULT '0',
  `tfungsional` varchar(50) NOT NULL DEFAULT '0',
  `tpengabdian` varchar(50) NOT NULL DEFAULT '0',
  `tistrianak` varchar(50) NOT NULL DEFAULT '0',
  `tuangtransport` varchar(50) NOT NULL DEFAULT '0',
  `tbebantugas` varchar(50) NOT NULL DEFAULT '0',
  `twalikelas` varchar(50) NOT NULL DEFAULT '0',
  `tkhusus` varchar(50) NOT NULL DEFAULT '0',
  `gajibruto` varchar(50) NOT NULL DEFAULT '0',
  `tlain` varchar(50) NOT NULL DEFAULT '0',
  `totalgaji` varchar(50) NOT NULL DEFAULT '0',
  `ppinjaman` varchar(50) NOT NULL DEFAULT '0',
  `jamsostek` varchar(50) NOT NULL DEFAULT '0',
  `pph21` varchar(50) NOT NULL DEFAULT '0',
  `gajibersih` varchar(50) NOT NULL DEFAULT '0',
  `idbayar` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_penggajian
-- ----------------------------
INSERT INTO `hrd_penggajian` VALUES ('7', '47', '2', '2015', 'TKT', '3312819', '993845', '662563', '662563', '331281', '165640', '331281', '496922', '0', '6956914', '0', '6956914', '0', '112635', '0', '6844279', '');

-- ----------------------------
-- Table structure for hrd_pinjaman
-- ----------------------------
DROP TABLE IF EXISTS `hrd_pinjaman`;
CREATE TABLE `hrd_pinjaman` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `pinjaman` varchar(255) NOT NULL,
  `karyawan` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_pinjaman
-- ----------------------------
INSERT INTO `hrd_pinjaman` VALUES ('1', '2014-06-02', '200000', '35');
INSERT INTO `hrd_pinjaman` VALUES ('7', '2014-06-30', '100000', '35');
INSERT INTO `hrd_pinjaman` VALUES ('12', '2014-07-01', '1000000', '34');
INSERT INTO `hrd_pinjaman` VALUES ('14', '2014-02-04', '500000', '36');

-- ----------------------------
-- Table structure for hrd_setting
-- ----------------------------
DROP TABLE IF EXISTS `hrd_setting`;
CREATE TABLE `hrd_setting` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `thr` varchar(5) NOT NULL,
  `reward` varchar(50) NOT NULL DEFAULT '0',
  `terlambat` varchar(50) NOT NULL DEFAULT '0',
  `pph21` varchar(50) NOT NULL DEFAULT '0',
  `jamsostek` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_setting
-- ----------------------------
INSERT INTO `hrd_setting` VALUES ('1', '30', '0', '0', '1', '2');

-- ----------------------------
-- Table structure for hrd_statuskaryawan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_statuskaryawan`;
CREATE TABLE `hrd_statuskaryawan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `tunjangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_statuskaryawan
-- ----------------------------
INSERT INTO `hrd_statuskaryawan` VALUES ('3', 'Tetap', '0');
INSERT INTO `hrd_statuskaryawan` VALUES ('8', 'Part Time', '0');
INSERT INTO `hrd_statuskaryawan` VALUES ('9', 'Kontrak', '0');

-- ----------------------------
-- Table structure for hrd_struktural
-- ----------------------------
DROP TABLE IF EXISTS `hrd_struktural`;
CREATE TABLE `hrd_struktural` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_struktural
-- ----------------------------
INSERT INTO `hrd_struktural` VALUES ('1', 'Tidak Ada', '0', '0');
INSERT INTO `hrd_struktural` VALUES ('2', 'Struktural', '30', '0');

-- ----------------------------
-- Table structure for hrd_tipe
-- ----------------------------
DROP TABLE IF EXISTS `hrd_tipe`;
CREATE TABLE `hrd_tipe` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_tipe
-- ----------------------------
INSERT INTO `hrd_tipe` VALUES ('1', 'Aktif');
INSERT INTO `hrd_tipe` VALUES ('2', 'Resign');
INSERT INTO `hrd_tipe` VALUES ('3', 'Calon');

-- ----------------------------
-- Table structure for hrd_training
-- ----------------------------
DROP TABLE IF EXISTS `hrd_training`;
CREATE TABLE `hrd_training` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jenistraining` tinyint(4) NOT NULL DEFAULT '0',
  `penyelenggara` varchar(100) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `pembicara` varchar(100) NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `tgl1` date NOT NULL DEFAULT '0000-00-00',
  `tgl2` date NOT NULL DEFAULT '0000-00-00',
  `peserta` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_training
-- ----------------------------
INSERT INTO `hrd_training` VALUES ('1', '2', 'asd', 'asd', 'Jhonny', '123', '2014-02-01', '2014-02-16', 'Pegawai IT');

-- ----------------------------
-- Table structure for hrd_uangmakan
-- ----------------------------
DROP TABLE IF EXISTS `hrd_uangmakan`;
CREATE TABLE `hrd_uangmakan` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_uangmakan
-- ----------------------------
INSERT INTO `hrd_uangmakan` VALUES ('1', 'Tidak Ada', '5', '0');

-- ----------------------------
-- Table structure for hrd_uangtransport
-- ----------------------------
DROP TABLE IF EXISTS `hrd_uangtransport`;
CREATE TABLE `hrd_uangtransport` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_uangtransport
-- ----------------------------
INSERT INTO `hrd_uangtransport` VALUES ('1', 'Uang Transport', '5', '0');

-- ----------------------------
-- Table structure for hrd_walikelas
-- ----------------------------
DROP TABLE IF EXISTS `hrd_walikelas`;
CREATE TABLE `hrd_walikelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `persen` varchar(50) NOT NULL DEFAULT '0',
  `nominal` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hrd_walikelas
-- ----------------------------
INSERT INTO `hrd_walikelas` VALUES ('1', 'Tidak Ada', '0', '0');
INSERT INTO `hrd_walikelas` VALUES ('2', 'Wali Kelas', '15', '0');
