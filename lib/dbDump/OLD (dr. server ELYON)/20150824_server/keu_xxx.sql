/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-24 03:05:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_anggarantahunan
-- ----------------------------
DROP TABLE IF EXISTS `keu_anggarantahunan`;
CREATE TABLE `keu_anggarantahunan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `detilanggaran` int(11) NOT NULL,
  `nominal` decimal(11,0) NOT NULL DEFAULT '0',
  `tahunbuku` int(11) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `detilanggaran` (`detilanggaran`) USING BTREE,
  CONSTRAINT `keu_anggarantahunan_ibfk_1` FOREIGN KEY (`detilanggaran`) REFERENCES `keu_detilanggaran` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_anggarantahunan
-- ----------------------------

-- ----------------------------
-- Table structure for keu_brg
-- ----------------------------
DROP TABLE IF EXISTS `keu_brg`;
CREATE TABLE `keu_brg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kelompokbrg` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `satuan` varchar(10) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_brg
-- ----------------------------
INSERT INTO `keu_brg` VALUES ('1', '1', 'ELKO001', 'Macbook pro 15 inch', '14', 'unit', '2014-01-11', '');
INSERT INTO `keu_brg` VALUES ('2', '4', 'KEMTR0001', 'Supra X 125', '3', '', '2014-01-11', '');

-- ----------------------------
-- Table structure for keu_budget
-- ----------------------------
DROP TABLE IF EXISTS `keu_budget`;
CREATE TABLE `keu_budget` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` int(10) unsigned NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  `departemen` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_budget
-- ----------------------------
INSERT INTO `keu_budget` VALUES ('1', '1', 'Alat Penganggaran', '10000000', '', '1');
INSERT INTO `keu_budget` VALUES ('2', '1', 'anggaran', '2000000', '', '1');
INSERT INTO `keu_budget` VALUES ('3', '1', 'Angaran Lagi', '100000', '', '1');

-- ----------------------------
-- Table structure for keu_detilanggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilanggaran`;
CREATE TABLE `keu_detilanggaran` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `kategorianggaran` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `hargasatuan` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`),
  KEY `kategorianggaran` (`kategorianggaran`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilanggaran
-- ----------------------------
INSERT INTO `keu_detilanggaran` VALUES ('62', '16', 'kertas HVS A4 9', 'printer 9', '10000');
INSERT INTO `keu_detilanggaran` VALUES ('63', '16', 'sip', 'woke', '130000');
INSERT INTO `keu_detilanggaran` VALUES ('64', '26', 'pebaikan mobil dinas', 'perawatan rutin', '1000000');
INSERT INTO `keu_detilanggaran` VALUES ('65', '16', 'ok', '', '350000');

-- ----------------------------
-- Table structure for keu_detilrekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilrekening`;
CREATE TABLE `keu_detilrekening` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategorirekening` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=343 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detilrekening
-- ----------------------------
INSERT INTO `keu_detilrekening` VALUES ('1', '1', '111101', 'KAS KECIL ', '');
INSERT INTO `keu_detilrekening` VALUES ('2', '1', '111102', 'KAS SATELIT', '');
INSERT INTO `keu_detilrekening` VALUES ('3', '1', '111103', 'KAS KERTAJAYA', 'ok');
INSERT INTO `keu_detilrekening` VALUES ('4', '1', '111104', 'KAS RUNGKUT', '');
INSERT INTO `keu_detilrekening` VALUES ('5', '1', '111199', 'KAS DALAM PERJALANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('6', '2', '111201', 'BCA AC NO. 5560060001', '');
INSERT INTO `keu_detilrekening` VALUES ('7', '2', '111202', 'BANK EKONOMI AC NO. 3031861275', '');
INSERT INTO `keu_detilrekening` VALUES ('8', '2', '111203', 'BCA AC NO. 4683800000', '');
INSERT INTO `keu_detilrekening` VALUES ('9', '2', '111204', 'DEPOSITO EKONOMI', '');
INSERT INTO `keu_detilrekening` VALUES ('10', '2', '111205', 'BANK MAYAPADA AC NO.201.300.17.000', '');
INSERT INTO `keu_detilrekening` VALUES ('11', '2', '111206', 'CIMB-NIAGA AC NO.216.01.00543.00.5 (dh.LIPPOBANK)', '');
INSERT INTO `keu_detilrekening` VALUES ('12', '2', '111207', 'DEPOSITO MAYAPADA/PANIN/CIMB', '');
INSERT INTO `keu_detilrekening` VALUES ('13', '2', '111208', 'DEPOSITO PANINBANK', '');
INSERT INTO `keu_detilrekening` VALUES ('14', '2', '111209', 'PANINBANK AC NO.448.50.8888.7', '');
INSERT INTO `keu_detilrekening` VALUES ('15', '2', '111210', 'MANDARI AC NO. 1420088800098', '');
INSERT INTO `keu_detilrekening` VALUES ('16', '2', '111211', 'BANK BCA 8290960101', '');
INSERT INTO `keu_detilrekening` VALUES ('17', '2', '111299', 'BANK DALAM PERJALANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('18', '3', '111900', 'AYAT SILANG KAS DAN BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('19', '3', '112100', 'TABUNGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('20', '3', '112200', 'DEPOSITO BERJANGKA', '');
INSERT INTO `keu_detilrekening` VALUES ('21', '3', '112300', 'SURAT-SURAT BERHARGA', '');
INSERT INTO `keu_detilrekening` VALUES ('22', '3', '113100', 'PIUTANG USAHA', '');
INSERT INTO `keu_detilrekening` VALUES ('23', '3', '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('24', '3', '113300', 'PIUTANG CEK/GIRO MUNDUR', '');
INSERT INTO `keu_detilrekening` VALUES ('25', '3', '113400', 'CADANGAN PIUTANG RAGU-RAGU', '');
INSERT INTO `keu_detilrekening` VALUES ('26', '3', '113500', 'PIUTANG DIREKSI', '');
INSERT INTO `keu_detilrekening` VALUES ('27', '3', '113600', 'PIUTANG KARYAWAN', '');
INSERT INTO `keu_detilrekening` VALUES ('28', '3', '113700', 'PIUTANG PIHAK III', '');
INSERT INTO `keu_detilrekening` VALUES ('29', '3', '113999', 'PIUTANG LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('30', '3', '114100', 'UANG MUKA PEMBELIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('31', '3', '114901', 'TANAH', '');
INSERT INTO `keu_detilrekening` VALUES ('32', '3', '114902', 'KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('33', '3', '114903', 'MESIN DAN PERALATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('34', '3', '114904', 'BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('35', '3', '114905', 'INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('36', '3', '114906', 'UANG MUKA PERJALANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('37', '3', '114999', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('38', '3', '116121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('39', '3', '116122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('40', '3', '116123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('41', '3', '116125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening` VALUES ('42', '3', '116126', 'PPH PASAL 26', '');
INSERT INTO `keu_detilrekening` VALUES ('43', '3', '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('44', '3', '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('45', '3', '116201', 'ASURANSI', '');
INSERT INTO `keu_detilrekening` VALUES ('46', '3', '116202', 'SEWA', '');
INSERT INTO `keu_detilrekening` VALUES ('47', '3', '116203', 'BUNGA LEASING', '');
INSERT INTO `keu_detilrekening` VALUES ('48', '3', '116204', 'ONGKOS ANGKUT', '');
INSERT INTO `keu_detilrekening` VALUES ('49', '3', '116299', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('50', '3', '121000', 'PENYERTAAN DALAM SURAT BERHARGA', '');
INSERT INTO `keu_detilrekening` VALUES ('51', '3', '122000', 'PENYERTAAN DALAM AKTIVA TETAP', '');
INSERT INTO `keu_detilrekening` VALUES ('52', '3', '123000', 'PENYERTAAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('53', '3', '141100', 'TANAH KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('54', '3', '141251', 'PRASARANA JALAN', '');
INSERT INTO `keu_detilrekening` VALUES ('55', '3', '141252', 'PRASARANA SALURAN AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('56', '3', '141253', 'PRASARANA TAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('57', '3', '141301', 'INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('58', '3', '141302', 'INSTALASI AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('59', '3', '141303', 'INSTALASI TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('60', '3', '141401', 'MESIN-MESIN', '');
INSERT INTO `keu_detilrekening` VALUES ('61', '3', '141451', 'MESIN-MESIN LEASING', '');
INSERT INTO `keu_detilrekening` VALUES ('62', '3', '141501', 'KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('63', '3', '141551', 'KENDARAAN LEASING KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('64', '3', '141601', 'INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('65', '3', '145201', 'AKUM. PENY. BANGUNAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('66', '3', '145202', 'AKUM. PENY. BANGUNAN KANTIN', '');
INSERT INTO `keu_detilrekening` VALUES ('67', '3', '145203', 'AKUM. PENY. BANGUNAN MESS', '');
INSERT INTO `keu_detilrekening` VALUES ('68', '3', '145251', 'AKUM. PENY. PRASARANA JALAN', '');
INSERT INTO `keu_detilrekening` VALUES ('69', '3', '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('70', '3', '145253', 'AKUM. PENY. PRASARANA TAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('71', '3', '145301', 'AKUM. PENY. INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('72', '3', '145302', 'AKUM. PENY. INSTALASI AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('73', '3', '145303', 'AKUM. PENY. INSTALASI TELPON', '');
INSERT INTO `keu_detilrekening` VALUES ('74', '3', '145401', 'AKUM. PENY. KENDARAAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('75', '3', '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('76', '3', '145501', 'AKUM. PENY. INVENTARIS KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('77', '3', '145502', 'AKUM. PENY. INVENTARIS KANTIN', '');
INSERT INTO `keu_detilrekening` VALUES ('78', '3', '151000', 'GOODWILL', '');
INSERT INTO `keu_detilrekening` VALUES ('79', '3', '152000', 'HAK PATEN', '');
INSERT INTO `keu_detilrekening` VALUES ('80', '3', '153000', 'LISENSI', '');
INSERT INTO `keu_detilrekening` VALUES ('81', '3', '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('82', '3', '161101', 'BIAYA PENDIRIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('83', '3', '161102', 'GAJI, TUNJANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('84', '3', '161103', 'BIAYA PERJALANAN DINAS', '');
INSERT INTO `keu_detilrekening` VALUES ('85', '3', '161104', 'ALAT TULIS & KEPERLUAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('86', '3', '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', '');
INSERT INTO `keu_detilrekening` VALUES ('87', '3', '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('88', '3', '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', '');
INSERT INTO `keu_detilrekening` VALUES ('89', '3', '161108', 'BENSIN, PARKIR, TOL', '');
INSERT INTO `keu_detilrekening` VALUES ('90', '3', '161109', 'BIAYA ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('91', '3', '161110', 'BAHAN PENOLONG', '');
INSERT INTO `keu_detilrekening` VALUES ('92', '3', '161111', 'BIAYA IKLAN', '');
INSERT INTO `keu_detilrekening` VALUES ('93', '3', '161112', 'PAJAK-PAJAK', '');
INSERT INTO `keu_detilrekening` VALUES ('94', '3', '161113', 'REKENING LISTRIK, AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('95', '3', '161114', 'BIAYA STNK, BBN, DLL', '');
INSERT INTO `keu_detilrekening` VALUES ('96', '3', '161115', 'BUNGA, FEE, PROVISI BANK, DLL', '');
INSERT INTO `keu_detilrekening` VALUES ('97', '3', '161116', 'BIAYA PERESMIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('98', '3', '161117', 'BIAYA BAHAN BAKAR', '');
INSERT INTO `keu_detilrekening` VALUES ('99', '3', '161118', 'REPARASI & PEMELIHARAAN KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('100', '3', '161119', 'TRAINING, SEMINAR, TEST, DLL', '');
INSERT INTO `keu_detilrekening` VALUES ('101', '3', '161120', 'BIAYA MAKAN DAN MINUM', '');
INSERT INTO `keu_detilrekening` VALUES ('102', '3', '161121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('103', '3', '161122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('104', '3', '161123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('105', '3', '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('106', '3', '161125', 'REPARASI & PEMELIHARAAN MESS', '');
INSERT INTO `keu_detilrekening` VALUES ('107', '3', '161126', 'REPARASI & PEMELIHARAAN TANKI', '');
INSERT INTO `keu_detilrekening` VALUES ('108', '3', '161127', 'BIAYA PENGURUSAN LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('109', '3', '161128', 'REPARASI & PEMELIHARAAN BOTOL', '');
INSERT INTO `keu_detilrekening` VALUES ('110', '3', '161129', 'BIAYA SEWA GEDUNG', '');
INSERT INTO `keu_detilrekening` VALUES ('111', '3', '161130', 'BIAYA BUNGA LEASING', '');
INSERT INTO `keu_detilrekening` VALUES ('112', '3', '161143', 'SELISIH KURS', '');
INSERT INTO `keu_detilrekening` VALUES ('113', '3', '161144', 'BIAYA BUNGA PINJAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('114', '3', '161145', 'IURAN DAN ASURANSI', '');
INSERT INTO `keu_detilrekening` VALUES ('115', '3', '161146', 'BIAYA KEAMANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('116', '3', '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('117', '3', '161151', 'PENDAPATAN JASA GIRO', '');
INSERT INTO `keu_detilrekening` VALUES ('118', '3', '161152', 'PENDAPATAN BUNGA DEPOSITO', '');
INSERT INTO `keu_detilrekening` VALUES ('119', '3', '161153', 'PENDAPATAN BUNGA BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('120', '3', '161154', 'PENDAPATAN BUNGA PIHAK III', '');
INSERT INTO `keu_detilrekening` VALUES ('121', '3', '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('122', '3', '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', '');
INSERT INTO `keu_detilrekening` VALUES ('123', '3', '162100', 'UANG JAMINAN LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('124', '3', '162200', 'UANG JAMINAN TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('125', '3', '163000', 'BIAYA YANG DITANGGUHKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('126', '3', '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', '');
INSERT INTO `keu_detilrekening` VALUES ('127', '3', '165201', 'BANGUNAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('128', '3', '165301', 'INSTALASI LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('129', '3', '165302', 'INSTALASI AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('130', '3', '165303', 'INSTALASI TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('131', '3', '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('132', '3', '169000', 'AKTIVA LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('133', '4', '211101', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('134', '4', '211201', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('135', '4', '211501', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('136', '4', '211601', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('137', '4', '212100', 'HUTANG USAHA', '');
INSERT INTO `keu_detilrekening` VALUES ('138', '4', '212200', 'HUTANG YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('139', '4', '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', '');
INSERT INTO `keu_detilrekening` VALUES ('140', '4', '212901', 'HUTANG PIHAK KETIGA', '');
INSERT INTO `keu_detilrekening` VALUES ('141', '4', '212902', 'HUTANG PERSEDIAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('142', '4', '212903', 'HUTANG KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('143', '4', '212904', 'HUTANG BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('144', '4', '212905', 'HUTANG INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('145', '4', '212906', 'HUTANG VOUCHER', '');
INSERT INTO `keu_detilrekening` VALUES ('146', '4', '212907', 'HUTANG KPD GKA ELYON', '');
INSERT INTO `keu_detilrekening` VALUES ('147', '4', '212999', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('148', '4', '213100', 'UANG MUKA PENJUALAN', '');
INSERT INTO `keu_detilrekening` VALUES ('149', '4', '213900', 'UANG MUKA LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('150', '4', '214104', 'PPH PASAL 4 AYAT 2', '');
INSERT INTO `keu_detilrekening` VALUES ('151', '4', '214121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('152', '4', '214122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('153', '4', '214123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('154', '4', '214125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening` VALUES ('155', '4', '214126', 'PPH PASAL 26', '');
INSERT INTO `keu_detilrekening` VALUES ('156', '4', '214129', 'PPH PASAL 29', '');
INSERT INTO `keu_detilrekening` VALUES ('157', '4', '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('158', '4', '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('159', '4', '214201', 'BUNGA', '');
INSERT INTO `keu_detilrekening` VALUES ('160', '4', '214202', 'SEWA', '');
INSERT INTO `keu_detilrekening` VALUES ('161', '4', '214203', 'GAJI DAN HONOR', '');
INSERT INTO `keu_detilrekening` VALUES ('162', '4', '214204', 'MAKAN DAN LEMBUR', '');
INSERT INTO `keu_detilrekening` VALUES ('163', '4', '214205', 'LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('164', '4', '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', '');
INSERT INTO `keu_detilrekening` VALUES ('165', '4', '214207', 'TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('166', '4', '214208', 'SURAT KABAR/MAJALAH', '');
INSERT INTO `keu_detilrekening` VALUES ('167', '4', '214209', 'KOMISI', '');
INSERT INTO `keu_detilrekening` VALUES ('168', '4', '214210', 'BIAYA ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('169', '4', '214211', 'PAJAK WAPU/WAJIB PUNGUT', '');
INSERT INTO `keu_detilrekening` VALUES ('170', '4', '214212', 'JAMSOSTEK', '');
INSERT INTO `keu_detilrekening` VALUES ('171', '4', '214213', 'PREMI DISTRIBUSI', '');
INSERT INTO `keu_detilrekening` VALUES ('172', '4', '214214', 'ONGKOS ANGKUT', '');
INSERT INTO `keu_detilrekening` VALUES ('173', '4', '214299', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('174', '4', '215121', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('175', '4', '215122', 'PPH PASAL 22', '');
INSERT INTO `keu_detilrekening` VALUES ('176', '4', '215123', 'PPH PASAL 23', '');
INSERT INTO `keu_detilrekening` VALUES ('177', '4', '215125', 'PPH PASAL 25', '');
INSERT INTO `keu_detilrekening` VALUES ('178', '4', '215201', 'PPN KELUARAN', '');
INSERT INTO `keu_detilrekening` VALUES ('179', '4', '215202', 'PPN EKS KEPPRES', '');
INSERT INTO `keu_detilrekening` VALUES ('180', '4', '216101', 'HUTANG LEASING KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('181', '4', '219101', 'HUTANG DEVIDEN', '');
INSERT INTO `keu_detilrekening` VALUES ('182', '4', '219199', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('183', '4', '221101', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('184', '4', '221201', 'BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('185', '4', '22210', 'HUTANG LEASING KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('186', '4', '223000', 'HUTANG PADA PEMEGANG SAHAM', '');
INSERT INTO `keu_detilrekening` VALUES ('187', '4', '230000', 'HUTANG LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('188', '4', '240000', 'HUTANG YG. DISUBORDINASI', '');
INSERT INTO `keu_detilrekening` VALUES ('189', '4', '250000', 'KEWAJIBAN BERSYARAT', '');
INSERT INTO `keu_detilrekening` VALUES ('190', '5', '311101', 'TIDAK TERIKAT', '');
INSERT INTO `keu_detilrekening` VALUES ('191', '5', '312101', 'TEMPORER...........', '');
INSERT INTO `keu_detilrekening` VALUES ('192', '5', '312201', 'PERMANEN......', '');
INSERT INTO `keu_detilrekening` VALUES ('193', '6', '411101', 'DANA DARI DONATUR', '');
INSERT INTO `keu_detilrekening` VALUES ('194', '6', '411102', 'DPP (DANA PEMBANGUNAN & PENGEMBANGAN)', '');
INSERT INTO `keu_detilrekening` VALUES ('195', '6', '411103', 'DANA JOINING', '');
INSERT INTO `keu_detilrekening` VALUES ('196', '6', '411104', 'DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)', '');
INSERT INTO `keu_detilrekening` VALUES ('197', '6', '411105', 'DANA STUDENT EXCHANGE', '');
INSERT INTO `keu_detilrekening` VALUES ('198', '6', '411201', 'SUMBANGAN TERIKAT TEMPORER', '');
INSERT INTO `keu_detilrekening` VALUES ('199', '6', '411202', 'SUMBANGAN TERIKAT PERMANEN', '');
INSERT INTO `keu_detilrekening` VALUES ('200', '6', '412101', 'PENJUALAN FORMULIR + PSIKOTES', '');
INSERT INTO `keu_detilrekening` VALUES ('201', '6', '412102', 'UANG KEG. EKSTRAKURIKULER', '');
INSERT INTO `keu_detilrekening` VALUES ('202', '6', '412103', 'UANG PENDAFTARAN ULANG', '');
INSERT INTO `keu_detilrekening` VALUES ('203', '6', '412104', 'UANG SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('204', '6', '412105', 'PENDAPATAN PENJUALAN SERAGAM', '');
INSERT INTO `keu_detilrekening` VALUES ('205', '6', '412106', 'PENDAPATAN PENJUALAN BUKU', '');
INSERT INTO `keu_detilrekening` VALUES ('206', '6', '412107', 'PENDAPATAN PENJUALAN CD/VCD/DVD', '');
INSERT INTO `keu_detilrekening` VALUES ('207', '6', '412108', 'PENDAPATAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('208', '6', '412109', 'PENDAPATAN LUNCH', '');
INSERT INTO `keu_detilrekening` VALUES ('209', '6', '412110', 'PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE', '');
INSERT INTO `keu_detilrekening` VALUES ('210', '6', '412111', 'DENDA KETERLAMBATAN BAYAR UANG SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('211', '6', '412112', 'PENDAPATAN CHECK POINT', '');
INSERT INTO `keu_detilrekening` VALUES ('212', '6', '412113', 'PENDAPATAN UJIAN HSK', '');
INSERT INTO `keu_detilrekening` VALUES ('213', '6', '412114', 'PENDAPATAN DAY CARE', '');
INSERT INTO `keu_detilrekening` VALUES ('214', '6', '421101', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG', '');
INSERT INTO `keu_detilrekening` VALUES ('215', '6', '421102', 'PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('216', '6', '421103', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ', '');
INSERT INTO `keu_detilrekening` VALUES ('217', '6', '421201', 'PENGHASILAN INVESTASI TERIKAT TEMPORER', '');
INSERT INTO `keu_detilrekening` VALUES ('218', '6', '421202', 'PENGHASILAN INVESTASI TERIKAT PERMANEN', '');
INSERT INTO `keu_detilrekening` VALUES ('219', '7', '511101', 'GAJI', '');
INSERT INTO `keu_detilrekening` VALUES ('220', '7', '511102', 'HONOR', '');
INSERT INTO `keu_detilrekening` VALUES ('221', '7', '511103', 'LEMBUR', '');
INSERT INTO `keu_detilrekening` VALUES ('222', '7', '511104', 'PESANGON', '');
INSERT INTO `keu_detilrekening` VALUES ('223', '7', '511105', 'UANG MAKAN', '');
INSERT INTO `keu_detilrekening` VALUES ('224', '7', '511106', 'BONUS', '');
INSERT INTO `keu_detilrekening` VALUES ('225', '7', '511107', 'TUNJANGAN HARI RAYA', '');
INSERT INTO `keu_detilrekening` VALUES ('226', '7', '511108', 'PPH PASAL 21', '');
INSERT INTO `keu_detilrekening` VALUES ('227', '7', '511109', 'KESEJAHTERAAN KARYAWAN', '');
INSERT INTO `keu_detilrekening` VALUES ('228', '7', '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', '');
INSERT INTO `keu_detilrekening` VALUES ('229', '7', '511111', 'JAMINAN KEMATIAN ( JKM )', '');
INSERT INTO `keu_detilrekening` VALUES ('230', '7', '511112', 'JAMINAN HARI TUA ( JHT )', '');
INSERT INTO `keu_detilrekening` VALUES ('231', '7', '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', '');
INSERT INTO `keu_detilrekening` VALUES ('232', '7', '511114', 'TUNJANGAN DANA PENSIUN', '');
INSERT INTO `keu_detilrekening` VALUES ('233', '7', '511115', 'TUNJANGAN KESEHATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('234', '7', '511116', 'TUNJANGAN TRANSPORT', '');
INSERT INTO `keu_detilrekening` VALUES ('235', '7', '511117', 'JAMSOSTEK', '');
INSERT INTO `keu_detilrekening` VALUES ('236', '7', '511119', 'PREMI ', '');
INSERT INTO `keu_detilrekening` VALUES ('237', '7', '511199', 'TUNJANGAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('238', '7', '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', '');
INSERT INTO `keu_detilrekening` VALUES ('239', '7', '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', '');
INSERT INTO `keu_detilrekening` VALUES ('240', '7', '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('241', '7', '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('242', '7', '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', '');
INSERT INTO `keu_detilrekening` VALUES ('243', '7', '512202', 'PENYUSUTAN KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('244', '7', '512203', 'PENYUSUTAN INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('245', '7', '512204', 'PENYUSUTAN INSTALASI', '');
INSERT INTO `keu_detilrekening` VALUES ('246', '7', '512301', 'TRANSPORTASI ( BENSIN, TIKET )', '');
INSERT INTO `keu_detilrekening` VALUES ('247', '7', '512302', 'MAKANAN & MINUMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('248', '7', '512303', 'PENGINAPAN', '');
INSERT INTO `keu_detilrekening` VALUES ('249', '7', '512304', 'UANG SAKU', '');
INSERT INTO `keu_detilrekening` VALUES ('250', '7', '512399', 'LAIN-LAIN ( PARKIR, TOL )', '');
INSERT INTO `keu_detilrekening` VALUES ('251', '7', '512401', 'SEWA BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('252', '7', '512402', 'SEWA KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('253', '7', '512403', 'SEWA INVENTARIS KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('254', '7', '512451', 'ASURANSI BANGUNAN', '');
INSERT INTO `keu_detilrekening` VALUES ('255', '7', '512452', 'ASURANSI KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('256', '7', '512453', 'ASURANSI INVENTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('257', '7', '512501', 'TELEPON', '');
INSERT INTO `keu_detilrekening` VALUES ('258', '7', '512502', 'TELEX', '');
INSERT INTO `keu_detilrekening` VALUES ('259', '7', '512503', 'TELEGRAM', '');
INSERT INTO `keu_detilrekening` VALUES ('260', '7', '512504', 'INTERLOKAL NON TELEPON INTERN', '');
INSERT INTO `keu_detilrekening` VALUES ('261', '7', '512505', 'FACSIMILE', '');
INSERT INTO `keu_detilrekening` VALUES ('262', '7', '512599', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('263', '7', '512601', 'AIR', '');
INSERT INTO `keu_detilrekening` VALUES ('264', '7', '512602', 'LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('265', '7', '512603', 'ALAT-ALAT LISTRIK', '');
INSERT INTO `keu_detilrekening` VALUES ('266', '7', '512701', 'AKUNTAN', '');
INSERT INTO `keu_detilrekening` VALUES ('267', '7', '512702', 'NOTARIS', '');
INSERT INTO `keu_detilrekening` VALUES ('268', '7', '512703', 'KONSULTAN', '');
INSERT INTO `keu_detilrekening` VALUES ('269', '7', '512704', 'MANAGEMENT FEE', '');
INSERT INTO `keu_detilrekening` VALUES ('270', '7', '512801', 'ADMINISTRASI BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('271', '7', '512802', 'BUKU CEK / BG', '');
INSERT INTO `keu_detilrekening` VALUES ('272', '7', '512803', 'TRANSFER, KIRIM UANG , INKASO', '');
INSERT INTO `keu_detilrekening` VALUES ('273', '7', '512804', 'PAJAK BUNGA BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('274', '7', '512901', 'BIAYA ADMINISTRASI KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('275', '7', '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('276', '7', '512903', 'BIAYA BUNGA KREDIT BANK', '');
INSERT INTO `keu_detilrekening` VALUES ('277', '7', '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', '');
INSERT INTO `keu_detilrekening` VALUES ('278', '7', '513102', 'PERANGKO, MATERAI, KIRIM SURAT', '');
INSERT INTO `keu_detilrekening` VALUES ('279', '7', '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', '');
INSERT INTO `keu_detilrekening` VALUES ('280', '7', '513104', 'ALAT - ALAT PENGAJARAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('281', '7', '513105', 'PERLENGKAPAN KELAS', '');
INSERT INTO `keu_detilrekening` VALUES ('282', '7', '513106', 'JASA PEMBELAJARAN', '');
INSERT INTO `keu_detilrekening` VALUES ('283', '7', '513201', 'PERIJINAN', '');
INSERT INTO `keu_detilrekening` VALUES ('284', '7', '513202', 'PAJAK - PAJAK DAERAH,PBB', '');
INSERT INTO `keu_detilrekening` VALUES ('285', '7', '513203', 'STNK', '');
INSERT INTO `keu_detilrekening` VALUES ('286', '7', '513211', 'RETRIBUSI SAMPAH', '');
INSERT INTO `keu_detilrekening` VALUES ('287', '7', '513301', 'SUMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('288', '7', '513302', 'ENTERTAINMENT', '');
INSERT INTO `keu_detilrekening` VALUES ('289', '7', '513303', 'JAMUAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('290', '7', '513401', 'KEAMANAN', '');
INSERT INTO `keu_detilrekening` VALUES ('291', '7', '513501', 'PENDAFTARAN', '');
INSERT INTO `keu_detilrekening` VALUES ('292', '7', '513502', 'IURAN', '');
INSERT INTO `keu_detilrekening` VALUES ('293', '7', '513601', 'BIAYA PENGOBATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('294', '7', '513701', 'MAKANAN DAN MINUMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('295', '7', '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', '');
INSERT INTO `keu_detilrekening` VALUES ('296', '7', '513703', 'SERAGAM ', '');
INSERT INTO `keu_detilrekening` VALUES ('297', '7', '513704', 'SEWA DISPENSER', '');
INSERT INTO `keu_detilrekening` VALUES ('298', '7', '513705', 'OLAH RAGA DAN KESENIAN', '');
INSERT INTO `keu_detilrekening` VALUES ('299', '7', '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', '');
INSERT INTO `keu_detilrekening` VALUES ('300', '7', '513707', 'BUKU, VCD', '');
INSERT INTO `keu_detilrekening` VALUES ('301', '7', '513708', 'ATRIBUT SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('302', '7', '513709', 'BIAYA PSIKOTES', '');
INSERT INTO `keu_detilrekening` VALUES ('303', '7', '513710', 'BIAYA ADVERTENSI ( IKLAN )', '');
INSERT INTO `keu_detilrekening` VALUES ('304', '7', '513711', 'BIAYA STUDY TOUR', '');
INSERT INTO `keu_detilrekening` VALUES ('305', '7', '513712', 'BIAYA PERLOMBAAN & PERAYAAN', '');
INSERT INTO `keu_detilrekening` VALUES ('306', '7', '513713', 'STIKER U/ MURID', '');
INSERT INTO `keu_detilrekening` VALUES ('307', '7', '513714', 'BIAYA TES KESEHATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('308', '7', '513715', 'BIAYA KOMISI PENGEMBANGAN', '');
INSERT INTO `keu_detilrekening` VALUES ('309', '7', '513716', 'BIAYA PAMERAN', '');
INSERT INTO `keu_detilrekening` VALUES ('310', '7', '513799', 'LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('311', '7', '513801', 'KANTIN', '');
INSERT INTO `keu_detilrekening` VALUES ('312', '7', '513802', 'DAPUR', '');
INSERT INTO `keu_detilrekening` VALUES ('313', '7', '513803', 'BIAYA KEBERSIHAN', '');
INSERT INTO `keu_detilrekening` VALUES ('314', '7', '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', '');
INSERT INTO `keu_detilrekening` VALUES ('315', '7', '513805', 'JASA CLEANING SERVICE', '');
INSERT INTO `keu_detilrekening` VALUES ('316', '7', '513806', '', '');
INSERT INTO `keu_detilrekening` VALUES ('317', '7', '513807', 'BIAYA MESS', '');
INSERT INTO `keu_detilrekening` VALUES ('318', '7', '513901', 'SELAMATAN', '');
INSERT INTO `keu_detilrekening` VALUES ('319', '7', '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('320', '7', '513903', 'DENDA PAJAK', '');
INSERT INTO `keu_detilrekening` VALUES ('321', '7', '513904', 'KOREKSI TAHUN LALU', '');
INSERT INTO `keu_detilrekening` VALUES ('322', '7', '513998', 'LAIN - LAIN (SELISIH KURS)', '');
INSERT INTO `keu_detilrekening` VALUES ('323', '7', '513999', 'LAIN - LAIN (SELISIH KAS)', '');
INSERT INTO `keu_detilrekening` VALUES ('324', '7', '514001', 'TRANSPORT', '');
INSERT INTO `keu_detilrekening` VALUES ('325', '7', '514002', 'MAKAN & MINUM (RAPAT)', '');
INSERT INTO `keu_detilrekening` VALUES ('326', '7', '514099', 'LAIN-LAIN', '');
INSERT INTO `keu_detilrekening` VALUES ('327', '7', '514101', 'BUKU', '');
INSERT INTO `keu_detilrekening` VALUES ('328', '7', '514102', 'VCD', '');
INSERT INTO `keu_detilrekening` VALUES ('329', '7', '514103', 'SERAGAM ', '');
INSERT INTO `keu_detilrekening` VALUES ('330', '7', '514104', 'ATRIBUT SEKOLAH', '');
INSERT INTO `keu_detilrekening` VALUES ('331', '7', '514105', 'BIAYA PSIKOTES', '');
INSERT INTO `keu_detilrekening` VALUES ('332', '7', '514106', 'BIAYA STUDY TOUR/FIELD TRIP', '');
INSERT INTO `keu_detilrekening` VALUES ('333', '7', '514107', 'BIAYA PERLOMBAAN ', '');
INSERT INTO `keu_detilrekening` VALUES ('334', '7', '514108', 'EKSTRAKURIKULER', '');
INSERT INTO `keu_detilrekening` VALUES ('335', '7', '514109', 'BIAYA STUDENT EXCHANGE', '');
INSERT INTO `keu_detilrekening` VALUES ('336', '7', '514110', 'BIAYA CHECK POINT', '');
INSERT INTO `keu_detilrekening` VALUES ('337', '7', '514199', 'LAIN - LAIN', '');

-- ----------------------------
-- Table structure for keu_detjenistrans
-- ----------------------------
DROP TABLE IF EXISTS `keu_detjenistrans`;
CREATE TABLE `keu_detjenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenistrans` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `bukti` char(3) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detjenistrans
-- ----------------------------
INSERT INTO `keu_detjenistrans` VALUES ('1', '2', 'SPP', 'in_siswa', 'BKM');
INSERT INTO `keu_detjenistrans` VALUES ('2', '2', 'DPP', 'in_calonsiswa', 'BBM');
INSERT INTO `keu_detjenistrans` VALUES ('3', '2', 'pemasukan bank', 'in_bank', 'BBM');
INSERT INTO `keu_detjenistrans` VALUES ('4', '2', 'pemasukan kas', 'in_come', 'BKM');
INSERT INTO `keu_detjenistrans` VALUES ('5', '3', 'pengeluaran barang', 'out_barang', 'BKK');
INSERT INTO `keu_detjenistrans` VALUES ('6', '3', 'pengeluaran bank', 'out_bank', 'BBK');
INSERT INTO `keu_detjenistrans` VALUES ('7', '3', 'pengeluaran kas', 'out_come', 'BKK');
INSERT INTO `keu_detjenistrans` VALUES ('8', '1', 'junal umum', 'ju', 'MMJ');

-- ----------------------------
-- Table structure for keu_detjenistransnew
-- ----------------------------
DROP TABLE IF EXISTS `keu_detjenistransnew`;
CREATE TABLE `keu_detjenistransnew` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenistrans` int(11) NOT NULL,
  `kategori` enum('o','n','') DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `bukti` char(3) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_detjenistransnew
-- ----------------------------
INSERT INTO `keu_detjenistransnew` VALUES ('1', '1', '', 'SPP', 'in_siswa', 'BKM');
INSERT INTO `keu_detjenistransnew` VALUES ('2', '2', 'o', 'DPP', 'in_calonsiswa', 'BBM');
INSERT INTO `keu_detjenistransnew` VALUES ('3', '2', 'n', 'pemasukan bank', 'in_bank', 'BBM');
INSERT INTO `keu_detjenistransnew` VALUES ('4', '3', 'o', 'pemasukan kas', 'in_come', 'BKM');
INSERT INTO `keu_detjenistransnew` VALUES ('5', '3', 'n', 'pengeluaran barang', 'out_barang', 'BKK');

-- ----------------------------
-- Table structure for keu_grupbrg
-- ----------------------------
DROP TABLE IF EXISTS `keu_grupbrg`;
CREATE TABLE `keu_grupbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_grupbrg
-- ----------------------------
INSERT INTO `keu_grupbrg` VALUES ('1', 'Elektronika', '');
INSERT INTO `keu_grupbrg` VALUES ('2', 'Kendaraan', '');
INSERT INTO `keu_grupbrg` VALUES ('3', 'Alat Tulis', '');

-- ----------------------------
-- Table structure for keu_jenislaporan
-- ----------------------------
DROP TABLE IF EXISTS `keu_jenislaporan`;
CREATE TABLE `keu_jenislaporan` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` enum('in','out') NOT NULL DEFAULT 'in',
  `kategori` enum('o','n') NOT NULL DEFAULT 'o',
  `rekening` int(11) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jenislaporan
-- ----------------------------
INSERT INTO `keu_jenislaporan` VALUES ('7', 'in', 'o', '203');
INSERT INTO `keu_jenislaporan` VALUES ('8', 'in', 'o', '195');
INSERT INTO `keu_jenislaporan` VALUES ('9', 'in', 'o', '210');
INSERT INTO `keu_jenislaporan` VALUES ('10', 'in', 'o', '119');
INSERT INTO `keu_jenislaporan` VALUES ('11', 'in', 'n', '194');
INSERT INTO `keu_jenislaporan` VALUES ('12', 'out', 'o', '219');
INSERT INTO `keu_jenislaporan` VALUES ('13', 'out', 'o', '30');
INSERT INTO `keu_jenislaporan` VALUES ('14', 'out', 'o', '54');

-- ----------------------------
-- Table structure for keu_jenistrans
-- ----------------------------
DROP TABLE IF EXISTS `keu_jenistrans`;
CREATE TABLE `keu_jenistrans` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `kode` varchar(5) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jenistrans
-- ----------------------------
INSERT INTO `keu_jenistrans` VALUES ('1', 'jurnal umum', 'ju');
INSERT INTO `keu_jenistrans` VALUES ('2', 'pemasukan', 'in');
INSERT INTO `keu_jenistrans` VALUES ('3', 'pengeluaran', 'out');

-- ----------------------------
-- Table structure for keu_jurnal
-- ----------------------------
DROP TABLE IF EXISTS `keu_jurnal`;
CREATE TABLE `keu_jurnal` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaksi` int(10) unsigned NOT NULL,
  `rek` int(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `jenis` char(1) NOT NULL,
  `debet` double(14,0) NOT NULL DEFAULT '0',
  `kredit` double(14,0) NOT NULL DEFAULT '0',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=1235 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_jurnal
-- ----------------------------
INSERT INTO `keu_jurnal` VALUES ('1176', '3', '6', '35000', 'k', '0', '0', '2015-05-25 15:56:14');
INSERT INTO `keu_jurnal` VALUES ('1175', '3', '222', '35000', 'd', '0', '0', '2015-05-25 15:56:14');
INSERT INTO `keu_jurnal` VALUES ('1172', '1', '1', '80000', 'd', '0', '0', '2015-05-25 15:47:11');
INSERT INTO `keu_jurnal` VALUES ('1171', '1', '83', '80000', 'k', '0', '0', '2015-05-25 15:47:11');
INSERT INTO `keu_jurnal` VALUES ('1174', '2', '1', '15000', 'k', '0', '0', '2015-05-25 15:47:58');
INSERT INTO `keu_jurnal` VALUES ('1173', '2', '83', '15000', 'd', '0', '0', '2015-05-25 15:47:58');
INSERT INTO `keu_jurnal` VALUES ('1178', '4', '1', '120000', 'd', '0', '0', '2015-05-25 16:00:10');
INSERT INTO `keu_jurnal` VALUES ('1177', '4', '203', '120000', 'k', '0', '0', '2015-05-25 16:00:10');
INSERT INTO `keu_jurnal` VALUES ('1180', '5', '22', '50000', 'k', '0', '0', '2015-05-26 06:08:09');
INSERT INTO `keu_jurnal` VALUES ('1179', '5', '1', '50000', 'd', '0', '0', '2015-05-26 06:08:09');
INSERT INTO `keu_jurnal` VALUES ('1181', '5', '25', '5000', 'k', '0', '0', '2015-05-26 06:08:59');
INSERT INTO `keu_jurnal` VALUES ('1182', '5', '3', '5000', 'd', '0', '0', '2015-05-26 06:09:00');
INSERT INTO `keu_jurnal` VALUES ('1183', '6', '1', '300000', 'd', '0', '0', '2015-05-27 06:22:17');
INSERT INTO `keu_jurnal` VALUES ('1184', '6', '200', '300000', 'k', '0', '0', '2015-05-27 06:22:17');
INSERT INTO `keu_jurnal` VALUES ('1185', '7', '1', '500000', 'd', '0', '0', '2015-05-27 06:30:51');
INSERT INTO `keu_jurnal` VALUES ('1186', '7', '195', '500000', 'k', '0', '0', '2015-05-27 06:30:51');
INSERT INTO `keu_jurnal` VALUES ('1187', '8', '1', '14000000', 'd', '0', '0', '2015-05-30 14:21:25');
INSERT INTO `keu_jurnal` VALUES ('1188', '8', '194', '14000000', 'k', '0', '0', '2015-05-30 14:21:25');
INSERT INTO `keu_jurnal` VALUES ('1189', '9', '1', '4545000', 'd', '0', '0', '2015-06-05 06:47:06');
INSERT INTO `keu_jurnal` VALUES ('1190', '9', '194', '4545000', 'k', '0', '0', '2015-06-05 06:47:06');
INSERT INTO `keu_jurnal` VALUES ('1191', '10', '1', '300000', 'd', '0', '0', '2015-06-05 06:48:44');
INSERT INTO `keu_jurnal` VALUES ('1192', '10', '200', '300000', 'k', '0', '0', '2015-06-05 06:48:44');
INSERT INTO `keu_jurnal` VALUES ('1193', '11', '1', '4522000', 'd', '0', '0', '2015-06-08 19:52:16');
INSERT INTO `keu_jurnal` VALUES ('1194', '11', '194', '4522000', 'k', '0', '0', '2015-06-08 19:52:16');
INSERT INTO `keu_jurnal` VALUES ('1195', '12', '1', '2261000', 'd', '0', '0', '2015-06-08 19:52:24');
INSERT INTO `keu_jurnal` VALUES ('1196', '12', '194', '2261000', 'k', '0', '0', '2015-06-08 19:52:24');
INSERT INTO `keu_jurnal` VALUES ('1197', '13', '1', '4522000', 'd', '0', '0', '2015-06-08 19:52:35');
INSERT INTO `keu_jurnal` VALUES ('1198', '13', '194', '4522000', 'k', '0', '0', '2015-06-08 19:52:35');
INSERT INTO `keu_jurnal` VALUES ('1199', '14', '1', '100000', 'd', '0', '0', '2015-06-08 21:16:48');
INSERT INTO `keu_jurnal` VALUES ('1200', '14', '195', '100000', 'k', '0', '0', '2015-06-08 21:16:48');
INSERT INTO `keu_jurnal` VALUES ('1201', '15', '1', '50000', 'd', '0', '0', '2015-06-08 21:16:56');
INSERT INTO `keu_jurnal` VALUES ('1202', '15', '195', '50000', 'k', '0', '0', '2015-06-08 21:16:56');
INSERT INTO `keu_jurnal` VALUES ('1203', '16', '1', '150000', 'd', '0', '0', '2015-06-08 21:17:27');
INSERT INTO `keu_jurnal` VALUES ('1204', '16', '195', '150000', 'k', '0', '0', '2015-06-08 21:17:27');
INSERT INTO `keu_jurnal` VALUES ('1205', '17', '1', '1515000', 'd', '0', '0', '2015-06-08 22:29:44');
INSERT INTO `keu_jurnal` VALUES ('1206', '17', '194', '1515000', 'k', '0', '0', '2015-06-08 22:29:44');
INSERT INTO `keu_jurnal` VALUES ('1207', '18', '1', '3030000', 'd', '0', '0', '2015-06-08 22:29:57');
INSERT INTO `keu_jurnal` VALUES ('1208', '18', '194', '3030000', 'k', '0', '0', '2015-06-08 22:29:57');
INSERT INTO `keu_jurnal` VALUES ('1216', '22', '3', '5000', 'k', '0', '0', '2015-06-12 14:09:54');
INSERT INTO `keu_jurnal` VALUES ('1215', '22', '277', '5000', 'd', '0', '0', '2015-06-12 14:09:54');
INSERT INTO `keu_jurnal` VALUES ('1214', '21', '3', '50000', 'k', '0', '0', '2015-06-12 14:01:25');
INSERT INTO `keu_jurnal` VALUES ('1213', '21', '277', '50000', 'd', '0', '0', '2015-06-12 14:01:25');
INSERT INTO `keu_jurnal` VALUES ('1217', '23', '277', '20000', 'd', '0', '0', '2015-06-13 05:40:29');
INSERT INTO `keu_jurnal` VALUES ('1218', '23', '1', '20000', 'k', '0', '0', '2015-06-13 05:40:29');
INSERT INTO `keu_jurnal` VALUES ('1219', '24', '277', '90000', 'd', '0', '0', '2015-06-13 05:40:29');
INSERT INTO `keu_jurnal` VALUES ('1220', '24', '1', '90000', 'k', '0', '0', '2015-06-13 05:40:29');
INSERT INTO `keu_jurnal` VALUES ('1221', '25', '277', '80000', 'd', '0', '0', '2015-06-13 08:11:17');
INSERT INTO `keu_jurnal` VALUES ('1222', '25', '2', '80000', 'k', '0', '0', '2015-06-13 08:11:17');
INSERT INTO `keu_jurnal` VALUES ('1223', '26', '277', '80000', 'd', '0', '0', '2015-06-13 11:16:44');
INSERT INTO `keu_jurnal` VALUES ('1224', '26', '16', '80000', 'k', '0', '0', '2015-06-13 11:16:44');
INSERT INTO `keu_jurnal` VALUES ('1225', '27', '1', '75', 'd', '0', '0', '2015-06-14 03:36:03');
INSERT INTO `keu_jurnal` VALUES ('1226', '27', '195', '75', 'k', '0', '0', '2015-06-14 03:36:03');
INSERT INTO `keu_jurnal` VALUES ('1227', '28', '1', '65000', 'd', '0', '0', '2015-06-14 03:37:12');
INSERT INTO `keu_jurnal` VALUES ('1228', '28', '195', '65000', 'k', '0', '0', '2015-06-14 03:37:12');
INSERT INTO `keu_jurnal` VALUES ('1229', '29', '4', '900', 'd', '0', '0', '2015-06-18 13:39:26');
INSERT INTO `keu_jurnal` VALUES ('1230', '29', '5', '900', 'k', '0', '0', '2015-06-18 13:39:26');
INSERT INTO `keu_jurnal` VALUES ('1231', '30', '1', '-2695000', 'd', '0', '0', '2015-07-14 11:30:11');
INSERT INTO `keu_jurnal` VALUES ('1232', '30', '194', '-2695000', 'k', '0', '0', '2015-07-14 11:30:11');
INSERT INTO `keu_jurnal` VALUES ('1233', '31', '1', '-1142857', 'd', '0', '0', '2015-07-14 12:44:44');
INSERT INTO `keu_jurnal` VALUES ('1234', '31', '194', '-1142857', 'k', '0', '0', '2015-07-14 12:44:44');

-- ----------------------------
-- Table structure for keu_kategorianggaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorianggaran`;
CREATE TABLE `keu_kategorianggaran` (
  `replid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tingkat` int(11) NOT NULL,
  `rekening` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorianggaran
-- ----------------------------
INSERT INTO `keu_kategorianggaran` VALUES ('16', '8', '277', 'ATK', 'alat tulis kantor');
INSERT INTO `keu_kategorianggaran` VALUES ('17', '8', '247', 'logistik', 'bahan bahan logistik bahan pangan ');
INSERT INTO `keu_kategorianggaran` VALUES ('18', '8', '293', 'obat obatan', 'biaya untuk pengobatan seluruh warga sekolah ');
INSERT INTO `keu_kategorianggaran` VALUES ('20', '8', '238', 'bangunan', 'ok');
INSERT INTO `keu_kategorianggaran` VALUES ('23', '8', '301', 'Perlengkapan Siswa', 'perlengkapan sekolah bagi siswa');
INSERT INTO `keu_kategorianggaran` VALUES ('24', '10', '85', 'ATK primary x', 'ATK x');
INSERT INTO `keu_kategorianggaran` VALUES ('25', '5', '277', 'ATK KG', 'ATK KG bos');
INSERT INTO `keu_kategorianggaran` VALUES ('26', '8', '68', 'service sarana - prasarana', 'ok');

-- ----------------------------
-- Table structure for keu_kategorirek
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorirek`;
CREATE TABLE `keu_kategorirek` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorirek
-- ----------------------------
INSERT INTO `keu_kategorirek` VALUES ('1', '1', 'KAS');
INSERT INTO `keu_kategorirek` VALUES ('2', '1', 'BANK');
INSERT INTO `keu_kategorirek` VALUES ('3', '1', 'AKTIVA');
INSERT INTO `keu_kategorirek` VALUES ('4', '2', 'KEWAJIBAN');
INSERT INTO `keu_kategorirek` VALUES ('5', '3', 'MODAL');
INSERT INTO `keu_kategorirek` VALUES ('6', '4', 'PENDAPATAN');
INSERT INTO `keu_kategorirek` VALUES ('7', '5', 'BIAYA');

-- ----------------------------
-- Table structure for keu_kategorirekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_kategorirekening`;
CREATE TABLE `keu_kategorirekening` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `kode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(20) NOT NULL,
  `jenis` enum('d','k') NOT NULL,
  `jenistambah` enum('d','k') NOT NULL,
  `jeniskurang` enum('d','k') NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kategorirekening
-- ----------------------------
INSERT INTO `keu_kategorirekening` VALUES ('1', '1', 'KAS', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('2', '1', 'BANK', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('3', '1', 'AKTIVA', 'd', 'd', 'k');
INSERT INTO `keu_kategorirekening` VALUES ('4', '2', 'KEWAJIBAN', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('5', '3', 'MODAL', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('6', '4', 'PENDAPATAN', 'k', 'k', 'd');
INSERT INTO `keu_kategorirekening` VALUES ('7', '5', 'BIAYA', 'd', 'd', 'k');

-- ----------------------------
-- Table structure for keu_katmodulpembayaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_katmodulpembayaran`;
CREATE TABLE `keu_katmodulpembayaran` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `siswa` enum('aktif','calon') DEFAULT NULL,
  `sifat` enum('wajib','sukarela') DEFAULT NULL,
  `keterangan` text NOT NULL,
  `detjenistrans` int(20) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_katmodulpembayaran
-- ----------------------------
INSERT INTO `keu_katmodulpembayaran` VALUES ('1', 'SPP', 'aktif', 'wajib', 'sumbangan wajib tiap semester', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('2', 'DPP', 'aktif', 'wajib', 'uang gedung ', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('3', 'Formulir ', 'calon', 'wajib', 'biaya formulir untuk pendaftaran siswa baru ', '1');
INSERT INTO `keu_katmodulpembayaran` VALUES ('4', 'Joining Fee', 'aktif', 'wajib', 'biaya Joining Fee untuk Pendaftaran Siswa Baru , dibayar di awal masuk\r\n', '1');

-- ----------------------------
-- Table structure for keu_kelompokbrg
-- ----------------------------
DROP TABLE IF EXISTS `keu_kelompokbrg`;
CREATE TABLE `keu_kelompokbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grupbrg` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_kelompokbrg
-- ----------------------------
INSERT INTO `keu_kelompokbrg` VALUES ('1', '1', 'Komputer');
INSERT INTO `keu_kelompokbrg` VALUES ('2', '1', 'Proyektor');
INSERT INTO `keu_kelompokbrg` VALUES ('3', '2', 'Mobil');
INSERT INTO `keu_kelompokbrg` VALUES ('4', '2', 'Motor');
INSERT INTO `keu_kelompokbrg` VALUES ('5', '2', 'Sepeda');
INSERT INTO `keu_kelompokbrg` VALUES ('6', '3', 'bulpoin');

-- ----------------------------
-- Table structure for keu_modul
-- ----------------------------
DROP TABLE IF EXISTS `keu_modul`;
CREATE TABLE `keu_modul` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_modul
-- ----------------------------
INSERT INTO `keu_modul` VALUES ('2', '3', '2', '2', 'Pendaftaran Tahun Ajaran 2014-2015', '14', '0', '0', '0', '0', '');
INSERT INTO `keu_modul` VALUES ('3', '3', '2', '2', 'Pendaftaran Tahun Ajaran 2014-2015', '6', '194', '0', '0', '0', 'Kaitlynn Tiffany');
INSERT INTO `keu_modul` VALUES ('4', '1', '3', '3', 'Uang pangkal angkatan 2013', '6', '194', '29', '0', '0', 'DPP');
INSERT INTO `keu_modul` VALUES ('5', '1', '1', '1', 'Uang sekolah tahun ajaran 2014-2015 (Aktif)', '1', '203', '29', '0', '0', '');
INSERT INTO `keu_modul` VALUES ('6', '1', '3', '8', 'Uang pangkal angkatan 2016', '3', '4', '3', '0', '0', '');
INSERT INTO `keu_modul` VALUES ('7', '1', '3', '2', 'Uang pangkal angkatan 2014', '1', '1', '1', '0', '0', 'ok');

-- ----------------------------
-- Table structure for keu_modulpembayaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_modulpembayaran`;
CREATE TABLE `keu_modulpembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `katmodulpembayaran` int(11) NOT NULL DEFAULT '0',
  `angkatan` int(10) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  `rek1` int(10) unsigned NOT NULL,
  `rek2` int(10) unsigned NOT NULL,
  `rek3` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `diskon` decimal(10,0) NOT NULL DEFAULT '0',
  `biayaadmin` decimal(10,0) NOT NULL DEFAULT '0',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_modulpembayaran
-- ----------------------------
INSERT INTO `keu_modulpembayaran` VALUES ('31', '2', '4', 'DPP Angkatan 2014', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('27', '2', '1', 'DPP Angkatan 2013', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('39', '4', '2', 'Joining Fee Tahun  Angkatan 2014', '1', '195', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('4', '2', '3', 'DPP angkatan 2013', '6', '194', '29', '0', '0', '0', '0', 'DPP');
INSERT INTO `keu_modulpembayaran` VALUES ('7', '1', '4', 'Uang sekolah tahun ajaran 2013-2014', '4', '8', '8', '0', '0', '0', '0', 'ok');
INSERT INTO `keu_modulpembayaran` VALUES ('32', '3', '4', 'Pendaftaran Tahun Ajaran 2014 - 2015', '4', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('21', '3', '1', 'Pendaftaran Tahun Ajaran 2013 - 2014', '1', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('30', '1', '2', 'SPP Tahun ajaran 2014 - 2015', '1', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('24', '2', '7', 'DPP Angkatan 2015', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('29', '3', '2', 'Pendaftaran Tahun Ajaran 2014 - 2015', '1', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('16', '3', '3', 'Pendaftaran Tahun Ajaran 2014 - 2015 ', '2', '200', '0', '800000', '0', '0', '0', 'uang formulir = 300000\r\nuang joining fee = 500000');
INSERT INTO `keu_modulpembayaran` VALUES ('17', '1', '3', 'SPP Tahun Ajaran 2014 - 2015', '2', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('19', '1', '1', 'SPP Tahun Ajaran 2013 - 2014 ', '2', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('25', '3', '7', 'Pendaftaran Tahun Ajaran 2015 - 2016', '1', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('26', '1', '7', 'SPP Tahun Ajaran 2015 - 2016', '1', '203', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('28', '2', '2', 'DPP Angkatan 2014', '1', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('33', '2', '12', 'DPP Angkatan 2015', '4', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('34', '3', '12', 'Pendaftaran Tahun Ajaran 2015 -2016', '4', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('35', '1', '12', 'SPP Tahun Ajaran 2015 - 2016', '4', '203', '23', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('36', '2', '11', 'DPP Angkatan 2015', '2', '194', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('37', '3', '11', 'Pendaftaran  Tahun Ajaran 2015 - 2016', '3', '200', '0', '0', '0', '0', '0', '');
INSERT INTO `keu_modulpembayaran` VALUES ('38', '1', '11', 'SPP Tahun Ajaran 2015 -2016', '4', '203', '0', '0', '0', '0', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_nominalanggaran
-- ----------------------------
INSERT INTO `keu_nominalanggaran` VALUES ('367', '62', '7', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('368', '62', '8', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('369', '62', '9', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('370', '62', '10', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('371', '62', '11', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('372', '62', '12', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('373', '62', '1', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('374', '62', '2', '40');
INSERT INTO `keu_nominalanggaran` VALUES ('375', '62', '3', '4');
INSERT INTO `keu_nominalanggaran` VALUES ('376', '62', '4', '8');
INSERT INTO `keu_nominalanggaran` VALUES ('377', '62', '5', '8');
INSERT INTO `keu_nominalanggaran` VALUES ('378', '62', '6', '80');
INSERT INTO `keu_nominalanggaran` VALUES ('379', '63', '7', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('380', '63', '8', '20');
INSERT INTO `keu_nominalanggaran` VALUES ('381', '63', '9', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('382', '63', '10', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('383', '63', '11', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('384', '63', '12', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('385', '63', '1', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('386', '63', '2', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('387', '63', '3', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('388', '63', '4', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('389', '63', '5', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('390', '63', '6', '1');
INSERT INTO `keu_nominalanggaran` VALUES ('391', '64', '7', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('392', '64', '8', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('393', '64', '9', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('394', '64', '10', '3');
INSERT INTO `keu_nominalanggaran` VALUES ('395', '64', '11', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('396', '64', '12', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('397', '64', '1', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('398', '64', '2', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('399', '64', '3', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('400', '64', '4', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('401', '64', '5', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('402', '64', '6', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('403', '65', '7', '2');
INSERT INTO `keu_nominalanggaran` VALUES ('404', '65', '8', '3');
INSERT INTO `keu_nominalanggaran` VALUES ('405', '65', '9', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('406', '65', '10', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('407', '65', '11', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('408', '65', '12', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('409', '65', '1', '5');
INSERT INTO `keu_nominalanggaran` VALUES ('410', '65', '2', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('411', '65', '3', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('412', '65', '4', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('413', '65', '5', '0');
INSERT INTO `keu_nominalanggaran` VALUES ('414', '65', '6', '0');

-- ----------------------------
-- Table structure for keu_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `keu_pembayaran`;
CREATE TABLE `keu_pembayaran` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modul` int(10) unsigned NOT NULL,
  `siswa` int(10) unsigned NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  `cicilan` decimal(10,0) NOT NULL DEFAULT '0',
  `lunas` enum('0','1') NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=3670 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_pembayaran
-- ----------------------------
INSERT INTO `keu_pembayaran` VALUES ('3653', '29', '7', '0', '300000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3654', '39', '7', '0', '500000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3655', '28', '6', '0', '14000000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3656', '28', '7', '0', '4545000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3657', '29', '6', '0', '300000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3658', '28', '8', '0', '4522000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3659', '28', '8', '0', '2261000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3660', '28', '8', '0', '4522000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3661', '39', '8', '0', '100000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3662', '39', '8', '0', '50000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3663', '39', '8', '0', '150000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3664', '28', '7', '0', '1515000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3665', '28', '7', '0', '3030000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3666', '39', '8', '0', '75', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3667', '39', '8', '0', '65000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3668', '28', '8', '0', '-2695000', '0', '0000-00-00', '');
INSERT INTO `keu_pembayaran` VALUES ('3669', '28', '1016', '0', '-1142857', '0', '0000-00-00', '');

-- ----------------------------
-- Table structure for keu_penerimaan
-- ----------------------------
DROP TABLE IF EXISTS `keu_penerimaan`;
CREATE TABLE `keu_penerimaan` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reftipe` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_penerimaan
-- ----------------------------

-- ----------------------------
-- Table structure for keu_penerimaanbrg
-- ----------------------------
DROP TABLE IF EXISTS `keu_penerimaanbrg`;
CREATE TABLE `keu_penerimaanbrg` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomerbukti` varchar(100) NOT NULL,
  `kodebrg` varchar(50) NOT NULL,
  `namabrg` varchar(100) NOT NULL,
  `unit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `satuan` varchar(10) NOT NULL,
  `nominal` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_penerimaanbrg
-- ----------------------------
INSERT INTO `keu_penerimaanbrg` VALUES ('1', 'AAA', 'ELKO001', '', '2', 'unit', '0');
INSERT INTO `keu_penerimaanbrg` VALUES ('2', 'BBB', '101', '', '1', 'unit', '20000');
INSERT INTO `keu_penerimaanbrg` VALUES ('3', 'AA001', 'ELKO001', 'Macbook pro 15 inch', '2', 'unit', '12000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('4', 'BB101', 'KEMTR0001', 'Supra X 125', '1', 'unit', '15000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('5', 'AS989', 'ELKO001', 'Macbook pro 15 inch', '1', 'unit', '12000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('6', 'ASD123', 'KEMTR0001', 'Supra X 125', '1', 'unit', '18000000');
INSERT INTO `keu_penerimaanbrg` VALUES ('7', 'ASDW123', 'ELKO001', 'Macbook pro 15 inch', '1', 'unit', '12000000');

-- ----------------------------
-- Table structure for keu_rekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_rekening`;
CREATE TABLE `keu_rekening` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategorirek` int(10) unsigned NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_rekening
-- ----------------------------
INSERT INTO `keu_rekening` VALUES ('1', '1', '111101', 'KAS KECIL ', null, '');
INSERT INTO `keu_rekening` VALUES ('2', '1', '111102', 'KAS SATELIT', null, '');
INSERT INTO `keu_rekening` VALUES ('3', '1', '111103', 'KAS KERTAJAYA', null, '');
INSERT INTO `keu_rekening` VALUES ('4', '1', '111104', 'KAS RUNGKUT', null, '');
INSERT INTO `keu_rekening` VALUES ('5', '1', '111199', 'KAS DALAM PERJALANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('6', '2', '111201', 'BCA AC NO. 5560060001', null, '');
INSERT INTO `keu_rekening` VALUES ('7', '2', '111202', 'BANK EKONOMI AC NO. 3031861275', null, '');
INSERT INTO `keu_rekening` VALUES ('8', '2', '111203', 'BCA AC NO. 4683800000', null, '');
INSERT INTO `keu_rekening` VALUES ('9', '2', '111204', 'DEPOSITO EKONOMI', null, '');
INSERT INTO `keu_rekening` VALUES ('10', '2', '111205', 'BANK MAYAPADA AC NO.201.300.17.000', null, '');
INSERT INTO `keu_rekening` VALUES ('11', '2', '111206', 'CIMB-NIAGA AC NO.216.01.00543.00.5 (dh.LIPPOBANK)', null, '');
INSERT INTO `keu_rekening` VALUES ('12', '2', '111207', 'DEPOSITO MAYAPADA/PANIN/CIMB', null, '');
INSERT INTO `keu_rekening` VALUES ('13', '2', '111208', 'DEPOSITO PANINBANK', null, '');
INSERT INTO `keu_rekening` VALUES ('14', '2', '111209', 'PANINBANK AC NO.448.50.8888.7', null, '');
INSERT INTO `keu_rekening` VALUES ('15', '2', '111210', 'MANDARI AC NO. 1420088800098', null, '');
INSERT INTO `keu_rekening` VALUES ('16', '2', '111211', 'BANK BCA 8290960101', null, '');
INSERT INTO `keu_rekening` VALUES ('17', '2', '111299', 'BANK DALAM PERJALANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('18', '3', '111900', 'AYAT SILANG KAS DAN BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('19', '3', '112100', 'TABUNGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('20', '3', '112200', 'DEPOSITO BERJANGKA', null, '');
INSERT INTO `keu_rekening` VALUES ('21', '3', '112300', 'SURAT-SURAT BERHARGA', null, '');
INSERT INTO `keu_rekening` VALUES ('22', '3', '113100', 'PIUTANG USAHA', null, '');
INSERT INTO `keu_rekening` VALUES ('23', '3', '113200', 'PIUTANG YANG BELUM DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('24', '3', '113300', 'PIUTANG CEK/GIRO MUNDUR', null, '');
INSERT INTO `keu_rekening` VALUES ('25', '3', '113400', 'CADANGAN PIUTANG RAGU-RAGU', null, '');
INSERT INTO `keu_rekening` VALUES ('26', '3', '113500', 'PIUTANG DIREKSI', null, '');
INSERT INTO `keu_rekening` VALUES ('27', '3', '113600', 'PIUTANG KARYAWAN', null, '');
INSERT INTO `keu_rekening` VALUES ('28', '3', '113700', 'PIUTANG PIHAK III', null, '');
INSERT INTO `keu_rekening` VALUES ('29', '3', '113999', 'PIUTANG LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('30', '3', '114100', 'UANG MUKA PEMBELIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('31', '3', '114901', 'TANAH', null, '');
INSERT INTO `keu_rekening` VALUES ('32', '3', '114902', 'KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('33', '3', '114903', 'MESIN DAN PERALATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('34', '3', '114904', 'BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('35', '3', '114905', 'INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('36', '3', '114906', 'UANG MUKA PERJALANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('37', '3', '114999', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('38', '3', '116121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('39', '3', '116122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('40', '3', '116123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('41', '3', '116125', 'PPH PASAL 25', null, '');
INSERT INTO `keu_rekening` VALUES ('42', '3', '116126', 'PPH PASAL 26', null, '');
INSERT INTO `keu_rekening` VALUES ('43', '3', '116151', 'PPN MASUKAN YANG SUDAH DIKREDITKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('44', '3', '116152', 'PPN MASUKAN YANG BELUM DIKREDITKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('45', '3', '116201', 'ASURANSI', null, '');
INSERT INTO `keu_rekening` VALUES ('46', '3', '116202', 'SEWA', null, '');
INSERT INTO `keu_rekening` VALUES ('47', '3', '116203', 'BUNGA LEASING', null, '');
INSERT INTO `keu_rekening` VALUES ('48', '3', '116204', 'ONGKOS ANGKUT', null, '');
INSERT INTO `keu_rekening` VALUES ('49', '3', '116299', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('50', '3', '121000', 'PENYERTAAN DALAM SURAT BERHARGA', null, '');
INSERT INTO `keu_rekening` VALUES ('51', '3', '122000', 'PENYERTAAN DALAM AKTIVA TETAP', null, '');
INSERT INTO `keu_rekening` VALUES ('52', '3', '123000', 'PENYERTAAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('53', '3', '141100', 'TANAH KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('54', '3', '141251', 'PRASARANA JALAN', null, '');
INSERT INTO `keu_rekening` VALUES ('55', '3', '141252', 'PRASARANA SALURAN AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('56', '3', '141253', 'PRASARANA TAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('57', '3', '141301', 'INSTALASI LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('58', '3', '141302', 'INSTALASI AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('59', '3', '141303', 'INSTALASI TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('60', '3', '141401', 'MESIN-MESIN', null, '');
INSERT INTO `keu_rekening` VALUES ('61', '3', '141451', 'MESIN-MESIN LEASING', null, '');
INSERT INTO `keu_rekening` VALUES ('62', '3', '141501', 'KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('63', '3', '141551', 'KENDARAAN LEASING KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('64', '3', '141601', 'INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('65', '3', '145201', 'AKUM. PENY. BANGUNAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('66', '3', '145202', 'AKUM. PENY. BANGUNAN KANTIN', null, '');
INSERT INTO `keu_rekening` VALUES ('67', '3', '145203', 'AKUM. PENY. BANGUNAN MESS', null, '');
INSERT INTO `keu_rekening` VALUES ('68', '3', '145251', 'AKUM. PENY. PRASARANA JALAN', null, '');
INSERT INTO `keu_rekening` VALUES ('69', '3', '145252', 'AKUM. PENY. PRASARANA SALURAN AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('70', '3', '145253', 'AKUM. PENY. PRASARANA TAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('71', '3', '145301', 'AKUM. PENY. INSTALASI LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('72', '3', '145302', 'AKUM. PENY. INSTALASI AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('73', '3', '145303', 'AKUM. PENY. INSTALASI TELPON', null, '');
INSERT INTO `keu_rekening` VALUES ('74', '3', '145401', 'AKUM. PENY. KENDARAAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('75', '3', '145451', 'AKUM. PENY. KENDARAAN LEASING KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('76', '3', '145501', 'AKUM. PENY. INVENTARIS KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('77', '3', '145502', 'AKUM. PENY. INVENTARIS KANTIN', null, '');
INSERT INTO `keu_rekening` VALUES ('78', '3', '151000', 'GOODWILL', null, '');
INSERT INTO `keu_rekening` VALUES ('79', '3', '152000', 'HAK PATEN', null, '');
INSERT INTO `keu_rekening` VALUES ('80', '3', '153000', 'LISENSI', null, '');
INSERT INTO `keu_rekening` VALUES ('81', '3', '154000', 'AKTIVA TIDAK BERWUJUD LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('82', '3', '161101', 'BIAYA PENDIRIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('83', '3', '161102', 'GAJI, TUNJANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('84', '3', '161103', 'BIAYA PERJALANAN DINAS', null, '');
INSERT INTO `keu_rekening` VALUES ('85', '3', '161104', 'ALAT TULIS & KEPERLUAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('86', '3', '161105', 'IJIN, LEGAL DAN PROFESIONAL FEE', null, '');
INSERT INTO `keu_rekening` VALUES ('87', '3', '161106', 'ENTERTAINMENT,REPRESEN,SUMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('88', '3', '161107', 'TELEPON, FAX, TELEGRAM, KIRIM SURAT', null, '');
INSERT INTO `keu_rekening` VALUES ('89', '3', '161108', 'BENSIN, PARKIR, TOL', null, '');
INSERT INTO `keu_rekening` VALUES ('90', '3', '161109', 'BIAYA ADMINISTRASI BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('91', '3', '161110', 'BAHAN PENOLONG', null, '');
INSERT INTO `keu_rekening` VALUES ('92', '3', '161111', 'BIAYA IKLAN', null, '');
INSERT INTO `keu_rekening` VALUES ('93', '3', '161112', 'PAJAK-PAJAK', null, '');
INSERT INTO `keu_rekening` VALUES ('94', '3', '161113', 'REKENING LISTRIK, AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('95', '3', '161114', 'BIAYA STNK, BBN, DLL', null, '');
INSERT INTO `keu_rekening` VALUES ('96', '3', '161115', 'BUNGA, FEE, PROVISI BANK, DLL', null, '');
INSERT INTO `keu_rekening` VALUES ('97', '3', '161116', 'BIAYA PERESMIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('98', '3', '161117', 'BIAYA BAHAN BAKAR', null, '');
INSERT INTO `keu_rekening` VALUES ('99', '3', '161118', 'REPARASI & PEMELIHARAAN KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('100', '3', '161119', 'TRAINING, SEMINAR, TEST, DLL', null, '');
INSERT INTO `keu_rekening` VALUES ('101', '3', '161120', 'BIAYA MAKAN DAN MINUM', null, '');
INSERT INTO `keu_rekening` VALUES ('102', '3', '161121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('103', '3', '161122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('104', '3', '161123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('105', '3', '161124', 'REPARASI & PEMELIHARAAN KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('106', '3', '161125', 'REPARASI & PEMELIHARAAN MESS', null, '');
INSERT INTO `keu_rekening` VALUES ('107', '3', '161126', 'REPARASI & PEMELIHARAAN TANKI', null, '');
INSERT INTO `keu_rekening` VALUES ('108', '3', '161127', 'BIAYA PENGURUSAN LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('109', '3', '161128', 'REPARASI & PEMELIHARAAN BOTOL', null, '');
INSERT INTO `keu_rekening` VALUES ('110', '3', '161129', 'BIAYA SEWA GEDUNG', null, '');
INSERT INTO `keu_rekening` VALUES ('111', '3', '161130', 'BIAYA BUNGA LEASING', null, '');
INSERT INTO `keu_rekening` VALUES ('112', '3', '161143', 'SELISIH KURS', null, '');
INSERT INTO `keu_rekening` VALUES ('113', '3', '161144', 'BIAYA BUNGA PINJAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('114', '3', '161145', 'IURAN DAN ASURANSI', null, '');
INSERT INTO `keu_rekening` VALUES ('115', '3', '161146', 'BIAYA KEAMANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('116', '3', '161148', 'BIAYA PRA-OPERASI LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('117', '3', '161151', 'PENDAPATAN JASA GIRO', null, '');
INSERT INTO `keu_rekening` VALUES ('118', '3', '161152', 'PENDAPATAN BUNGA DEPOSITO', null, '');
INSERT INTO `keu_rekening` VALUES ('119', '3', '161153', 'PENDAPATAN BUNGA BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('120', '3', '161154', 'PENDAPATAN BUNGA PIHAK III', null, '');
INSERT INTO `keu_rekening` VALUES ('121', '3', '161199', 'PENDAPATAN PRA-OPERASI LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('122', '3', '161500', 'AKUM.AMORTISASI BIAYA PRA-OPERASI', null, '');
INSERT INTO `keu_rekening` VALUES ('123', '3', '162100', 'UANG JAMINAN LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('124', '3', '162200', 'UANG JAMINAN TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('125', '3', '163000', 'BIAYA YANG DITANGGUHKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('126', '3', '164000', 'BUNGA DALAM MASA KONSTRUKSI (IDC)', null, '');
INSERT INTO `keu_rekening` VALUES ('127', '3', '165201', 'BANGUNAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('128', '3', '165301', 'INSTALASI LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('129', '3', '165302', 'INSTALASI AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('130', '3', '165303', 'INSTALASI TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('131', '3', '166000', 'BIAYA PENELITIAN DAN PENGEMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('132', '3', '169000', 'AKTIVA LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('133', '4', '211101', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('134', '4', '211201', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('135', '4', '211501', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('136', '4', '211601', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('137', '4', '212100', 'HUTANG USAHA', null, '');
INSERT INTO `keu_rekening` VALUES ('138', '4', '212200', 'HUTANG YANG BELUM DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('139', '4', '212300', 'HUTANG CEK/BILYET GIRO MUNDUR', null, '');
INSERT INTO `keu_rekening` VALUES ('140', '4', '212901', 'HUTANG PIHAK KETIGA', null, '');
INSERT INTO `keu_rekening` VALUES ('141', '4', '212902', 'HUTANG PERSEDIAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('142', '4', '212903', 'HUTANG KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('143', '4', '212904', 'HUTANG BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('144', '4', '212905', 'HUTANG INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('145', '4', '212906', 'HUTANG VOUCHER', null, '');
INSERT INTO `keu_rekening` VALUES ('146', '4', '212907', 'HUTANG KPD GKA ELYON', null, '');
INSERT INTO `keu_rekening` VALUES ('147', '4', '212999', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('148', '4', '213100', 'UANG MUKA PENJUALAN', null, '');
INSERT INTO `keu_rekening` VALUES ('149', '4', '213900', 'UANG MUKA LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('150', '4', '214104', 'PPH PASAL 4 AYAT 2', null, '');
INSERT INTO `keu_rekening` VALUES ('151', '4', '214121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('152', '4', '214122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('153', '4', '214123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('154', '4', '214125', 'PPH PASAL 25', null, '');
INSERT INTO `keu_rekening` VALUES ('155', '4', '214126', 'PPH PASAL 26', null, '');
INSERT INTO `keu_rekening` VALUES ('156', '4', '214129', 'PPH PASAL 29', null, '');
INSERT INTO `keu_rekening` VALUES ('157', '4', '214151', 'PPN KELUARAN YANG SUDAH DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('158', '4', '214152', 'PPN KELUARAN YANG BELUM DIFAKTURKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('159', '4', '214201', 'BUNGA', null, '');
INSERT INTO `keu_rekening` VALUES ('160', '4', '214202', 'SEWA', null, '');
INSERT INTO `keu_rekening` VALUES ('161', '4', '214203', 'GAJI DAN HONOR', null, '');
INSERT INTO `keu_rekening` VALUES ('162', '4', '214204', 'MAKAN DAN LEMBUR', null, '');
INSERT INTO `keu_rekening` VALUES ('163', '4', '214205', 'LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('164', '4', '214206', 'TUNJANGAN TRANSPORT-MAINTENANCE', null, '');
INSERT INTO `keu_rekening` VALUES ('165', '4', '214207', 'TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('166', '4', '214208', 'SURAT KABAR/MAJALAH', null, '');
INSERT INTO `keu_rekening` VALUES ('167', '4', '214209', 'KOMISI', null, '');
INSERT INTO `keu_rekening` VALUES ('168', '4', '214210', 'BIAYA ADMINISTRASI BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('169', '4', '214211', 'PAJAK WAPU/WAJIB PUNGUT', null, '');
INSERT INTO `keu_rekening` VALUES ('170', '4', '214212', 'JAMSOSTEK', null, '');
INSERT INTO `keu_rekening` VALUES ('171', '4', '214213', 'PREMI DISTRIBUSI', null, '');
INSERT INTO `keu_rekening` VALUES ('172', '4', '214214', 'ONGKOS ANGKUT', null, '');
INSERT INTO `keu_rekening` VALUES ('173', '4', '214299', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('174', '4', '215121', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('175', '4', '215122', 'PPH PASAL 22', null, '');
INSERT INTO `keu_rekening` VALUES ('176', '4', '215123', 'PPH PASAL 23', null, '');
INSERT INTO `keu_rekening` VALUES ('177', '4', '215125', 'PPH PASAL 25', null, '');
INSERT INTO `keu_rekening` VALUES ('178', '4', '215201', 'PPN KELUARAN', null, '');
INSERT INTO `keu_rekening` VALUES ('179', '4', '215202', 'PPN EKS KEPPRES', null, '');
INSERT INTO `keu_rekening` VALUES ('180', '4', '216101', 'HUTANG LEASING KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('181', '4', '219101', 'HUTANG DEVIDEN', null, '');
INSERT INTO `keu_rekening` VALUES ('182', '4', '219199', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('183', '4', '221101', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('184', '4', '221201', 'BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('185', '4', '22210', 'HUTANG LEASING KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('186', '4', '223000', 'HUTANG PADA PEMEGANG SAHAM', null, '');
INSERT INTO `keu_rekening` VALUES ('187', '4', '230000', 'HUTANG LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('188', '4', '240000', 'HUTANG YG. DISUBORDINASI', null, '');
INSERT INTO `keu_rekening` VALUES ('189', '4', '250000', 'KEWAJIBAN BERSYARAT', null, '');
INSERT INTO `keu_rekening` VALUES ('190', '5', '311101', 'TIDAK TERIKAT', null, '');
INSERT INTO `keu_rekening` VALUES ('191', '5', '312101', 'TEMPORER...........', null, '');
INSERT INTO `keu_rekening` VALUES ('192', '5', '312201', 'PERMANEN......', null, '');
INSERT INTO `keu_rekening` VALUES ('193', '6', '411101', 'DANA DARI DONATUR', null, '');
INSERT INTO `keu_rekening` VALUES ('194', '6', '411102', 'DPP (DANA PEMBANGUNAN & PENGEMBANGAN)', null, '');
INSERT INTO `keu_rekening` VALUES ('195', '6', '411103', 'DANA JOINING', null, '');
INSERT INTO `keu_rekening` VALUES ('196', '6', '411104', 'DPP SUKARELA (DANA PEMBANGUNAN & PENGEMBANGAN)', null, '');
INSERT INTO `keu_rekening` VALUES ('197', '6', '411105', 'DANA STUDENT EXCHANGE', null, '');
INSERT INTO `keu_rekening` VALUES ('198', '6', '411201', 'SUMBANGAN TERIKAT TEMPORER', null, '');
INSERT INTO `keu_rekening` VALUES ('199', '6', '411202', 'SUMBANGAN TERIKAT PERMANEN', null, '');
INSERT INTO `keu_rekening` VALUES ('200', '6', '412101', 'PENJUALAN FORMULIR + PSIKOTES', null, '');
INSERT INTO `keu_rekening` VALUES ('201', '6', '412102', 'UANG KEG. EKSTRAKURIKULER', null, '');
INSERT INTO `keu_rekening` VALUES ('202', '6', '412103', 'UANG PENDAFTARAN ULANG', null, '');
INSERT INTO `keu_rekening` VALUES ('203', '6', '412104', 'UANG SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('204', '6', '412105', 'PENDAPATAN PENJUALAN SERAGAM', null, '');
INSERT INTO `keu_rekening` VALUES ('205', '6', '412106', 'PENDAPATAN PENJUALAN BUKU', null, '');
INSERT INTO `keu_rekening` VALUES ('206', '6', '412107', 'PENDAPATAN PENJUALAN CD/VCD/DVD', null, '');
INSERT INTO `keu_rekening` VALUES ('207', '6', '412108', 'PENDAPATAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('208', '6', '412109', 'PENDAPATAN LUNCH', null, '');
INSERT INTO `keu_rekening` VALUES ('209', '6', '412110', 'PENDAPATAN STATIONERY DAN HANDOUT, MATERIAL FEE', null, '');
INSERT INTO `keu_rekening` VALUES ('210', '6', '412111', 'DENDA KETERLAMBATAN BAYAR UANG SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('211', '6', '412112', 'PENDAPATAN CHECK POINT', null, '');
INSERT INTO `keu_rekening` VALUES ('212', '6', '412113', 'PENDAPATAN UJIAN HSK', null, '');
INSERT INTO `keu_rekening` VALUES ('213', '6', '412114', 'PENDAPATAN DAY CARE', null, '');
INSERT INTO `keu_rekening` VALUES ('214', '6', '421101', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG', null, '');
INSERT INTO `keu_rekening` VALUES ('215', '6', '421102', 'PENGHASILAN INVESTASI TIDAK TERIKAT LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('216', '6', '421103', 'PENGHASILAN INVESTASI TIDAK TERIKAT JANGKA PANJANG ', null, '');
INSERT INTO `keu_rekening` VALUES ('217', '6', '421201', 'PENGHASILAN INVESTASI TERIKAT TEMPORER', null, '');
INSERT INTO `keu_rekening` VALUES ('218', '6', '421202', 'PENGHASILAN INVESTASI TERIKAT PERMANEN', null, '');
INSERT INTO `keu_rekening` VALUES ('219', '7', '511101', 'GAJI', null, '');
INSERT INTO `keu_rekening` VALUES ('220', '7', '511102', 'HONOR', null, '');
INSERT INTO `keu_rekening` VALUES ('221', '7', '511103', 'LEMBUR', null, '');
INSERT INTO `keu_rekening` VALUES ('222', '7', '511104', 'PESANGON', null, '');
INSERT INTO `keu_rekening` VALUES ('223', '7', '511105', 'UANG MAKAN', null, '');
INSERT INTO `keu_rekening` VALUES ('224', '7', '511106', 'BONUS', null, '');
INSERT INTO `keu_rekening` VALUES ('225', '7', '511107', 'TUNJANGAN HARI RAYA', null, '');
INSERT INTO `keu_rekening` VALUES ('226', '7', '511108', 'PPH PASAL 21', null, '');
INSERT INTO `keu_rekening` VALUES ('227', '7', '511109', 'KESEJAHTERAAN KARYAWAN', null, '');
INSERT INTO `keu_rekening` VALUES ('228', '7', '511110', 'JAMINAN KECELAKAAN KERJA ( JKK )', null, '');
INSERT INTO `keu_rekening` VALUES ('229', '7', '511111', 'JAMINAN KEMATIAN ( JKM )', null, '');
INSERT INTO `keu_rekening` VALUES ('230', '7', '511112', 'JAMINAN HARI TUA ( JHT )', null, '');
INSERT INTO `keu_rekening` VALUES ('231', '7', '511113', 'JAMINAN PEMELIHARAAN KESEHATAN (JPK)', null, '');
INSERT INTO `keu_rekening` VALUES ('232', '7', '511114', 'TUNJANGAN DANA PENSIUN', null, '');
INSERT INTO `keu_rekening` VALUES ('233', '7', '511115', 'TUNJANGAN KESEHATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('234', '7', '511116', 'TUNJANGAN TRANSPORT', null, '');
INSERT INTO `keu_rekening` VALUES ('235', '7', '511117', 'JAMSOSTEK', null, '');
INSERT INTO `keu_rekening` VALUES ('236', '7', '511119', 'PREMI ', null, '');
INSERT INTO `keu_rekening` VALUES ('237', '7', '511199', 'TUNJANGAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('238', '7', '512101', 'BI.BAHAN PERB. & PEMELIHARAAN BANGUNAN & PRASARANA', null, '');
INSERT INTO `keu_rekening` VALUES ('239', '7', '512102', 'BI.BAHAN PERB. & PEMELIHARAAN KEND.', null, '');
INSERT INTO `keu_rekening` VALUES ('240', '7', '512103', 'BI.BAHAN PERB. & PEMELIHARAAN INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('241', '7', '512199', 'BI.BAHAN PERB. & PEMELIHARAAN LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('242', '7', '512201', 'PENYUSUTAN BANGUNAN & PRASARANA', null, '');
INSERT INTO `keu_rekening` VALUES ('243', '7', '512202', 'PENYUSUTAN KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('244', '7', '512203', 'PENYUSUTAN INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('245', '7', '512204', 'PENYUSUTAN INSTALASI', null, '');
INSERT INTO `keu_rekening` VALUES ('246', '7', '512301', 'TRANSPORTASI ( BENSIN, TIKET )', null, '');
INSERT INTO `keu_rekening` VALUES ('247', '7', '512302', 'MAKANAN & MINUMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('248', '7', '512303', 'PENGINAPAN', null, '');
INSERT INTO `keu_rekening` VALUES ('249', '7', '512304', 'UANG SAKU', null, '');
INSERT INTO `keu_rekening` VALUES ('250', '7', '512399', 'LAIN-LAIN ( PARKIR, TOL )', null, '');
INSERT INTO `keu_rekening` VALUES ('251', '7', '512401', 'SEWA BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('252', '7', '512402', 'SEWA KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('253', '7', '512403', 'SEWA INVENTARIS KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('254', '7', '512451', 'ASURANSI BANGUNAN', null, '');
INSERT INTO `keu_rekening` VALUES ('255', '7', '512452', 'ASURANSI KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('256', '7', '512453', 'ASURANSI INVENTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('257', '7', '512501', 'TELEPON', null, '');
INSERT INTO `keu_rekening` VALUES ('258', '7', '512502', 'TELEX', null, '');
INSERT INTO `keu_rekening` VALUES ('259', '7', '512503', 'TELEGRAM', null, '');
INSERT INTO `keu_rekening` VALUES ('260', '7', '512504', 'INTERLOKAL NON TELEPON INTERN', null, '');
INSERT INTO `keu_rekening` VALUES ('261', '7', '512505', 'FACSIMILE', null, '');
INSERT INTO `keu_rekening` VALUES ('262', '7', '512599', 'LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('263', '7', '512601', 'AIR', null, '');
INSERT INTO `keu_rekening` VALUES ('264', '7', '512602', 'LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('265', '7', '512603', 'ALAT-ALAT LISTRIK', null, '');
INSERT INTO `keu_rekening` VALUES ('266', '7', '512701', 'AKUNTAN', null, '');
INSERT INTO `keu_rekening` VALUES ('267', '7', '512702', 'NOTARIS', null, '');
INSERT INTO `keu_rekening` VALUES ('268', '7', '512703', 'KONSULTAN', null, '');
INSERT INTO `keu_rekening` VALUES ('269', '7', '512704', 'MANAGEMENT FEE', null, '');
INSERT INTO `keu_rekening` VALUES ('270', '7', '512801', 'ADMINISTRASI BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('271', '7', '512802', 'BUKU CEK / BG', null, '');
INSERT INTO `keu_rekening` VALUES ('272', '7', '512803', 'TRANSFER, KIRIM UANG , INKASO', null, '');
INSERT INTO `keu_rekening` VALUES ('273', '7', '512804', 'PAJAK BUNGA BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('274', '7', '512901', 'BIAYA ADMINISTRASI KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('275', '7', '512902', 'BIAYA BUNGA ANGSURAN KENDARAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('276', '7', '512903', 'BIAYA BUNGA KREDIT BANK', null, '');
INSERT INTO `keu_rekening` VALUES ('277', '7', '513101', 'ALAT - ALAT TULIS, PERCETAKAN & ALAT KANTOR', null, '');
INSERT INTO `keu_rekening` VALUES ('278', '7', '513102', 'PERANGKO, MATERAI, KIRIM SURAT', null, '');
INSERT INTO `keu_rekening` VALUES ('279', '7', '513103', 'FOTOCOPY/LAMINATING/CETAK FOTO', null, '');
INSERT INTO `keu_rekening` VALUES ('280', '7', '513104', 'ALAT - ALAT PENGAJARAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('281', '7', '513105', 'PERLENGKAPAN KELAS', null, '');
INSERT INTO `keu_rekening` VALUES ('282', '7', '513106', 'JASA PEMBELAJARAN', null, '');
INSERT INTO `keu_rekening` VALUES ('283', '7', '513201', 'PERIJINAN', null, '');
INSERT INTO `keu_rekening` VALUES ('284', '7', '513202', 'PAJAK - PAJAK DAERAH,PBB', null, '');
INSERT INTO `keu_rekening` VALUES ('285', '7', '513203', 'STNK', null, '');
INSERT INTO `keu_rekening` VALUES ('286', '7', '513211', 'RETRIBUSI SAMPAH', null, '');
INSERT INTO `keu_rekening` VALUES ('287', '7', '513301', 'SUMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('288', '7', '513302', 'ENTERTAINMENT', null, '');
INSERT INTO `keu_rekening` VALUES ('289', '7', '513303', 'JAMUAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('290', '7', '513401', 'KEAMANAN', null, '');
INSERT INTO `keu_rekening` VALUES ('291', '7', '513501', 'PENDAFTARAN', null, '');
INSERT INTO `keu_rekening` VALUES ('292', '7', '513502', 'IURAN', null, '');
INSERT INTO `keu_rekening` VALUES ('293', '7', '513601', 'BIAYA PENGOBATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('294', '7', '513701', 'MAKANAN DAN MINUMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('295', '7', '513702', 'BAHAN BAKAR DAN PARKIR/TRANSPORT', null, '');
INSERT INTO `keu_rekening` VALUES ('296', '7', '513703', 'SERAGAM ', null, '');
INSERT INTO `keu_rekening` VALUES ('297', '7', '513704', 'SEWA DISPENSER', null, '');
INSERT INTO `keu_rekening` VALUES ('298', '7', '513705', 'OLAH RAGA DAN KESENIAN', null, '');
INSERT INTO `keu_rekening` VALUES ('299', '7', '513706', 'BIAYA TRAINING, SEMINAR DAN STUDI BANDING', null, '');
INSERT INTO `keu_rekening` VALUES ('300', '7', '513707', 'BUKU, VCD', null, '');
INSERT INTO `keu_rekening` VALUES ('301', '7', '513708', 'ATRIBUT SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('302', '7', '513709', 'BIAYA PSIKOTES', null, '');
INSERT INTO `keu_rekening` VALUES ('303', '7', '513710', 'BIAYA ADVERTENSI ( IKLAN )', null, '');
INSERT INTO `keu_rekening` VALUES ('304', '7', '513711', 'BIAYA STUDY TOUR', null, '');
INSERT INTO `keu_rekening` VALUES ('305', '7', '513712', 'BIAYA PERLOMBAAN & PERAYAAN', null, '');
INSERT INTO `keu_rekening` VALUES ('306', '7', '513713', 'STIKER U/ MURID', null, '');
INSERT INTO `keu_rekening` VALUES ('307', '7', '513714', 'BIAYA TES KESEHATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('308', '7', '513715', 'BIAYA KOMISI PENGEMBANGAN', null, '');
INSERT INTO `keu_rekening` VALUES ('309', '7', '513716', 'BIAYA PAMERAN', null, '');
INSERT INTO `keu_rekening` VALUES ('310', '7', '513799', 'LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('311', '7', '513801', 'KANTIN', null, '');
INSERT INTO `keu_rekening` VALUES ('312', '7', '513802', 'DAPUR', null, '');
INSERT INTO `keu_rekening` VALUES ('313', '7', '513803', 'BIAYA KEBERSIHAN', null, '');
INSERT INTO `keu_rekening` VALUES ('314', '7', '513804', 'BIAYA KEPERLUAN KEBUN/TAMAN', null, '');
INSERT INTO `keu_rekening` VALUES ('315', '7', '513805', 'JASA CLEANING SERVICE', null, '');
INSERT INTO `keu_rekening` VALUES ('316', '7', '513806', '', null, '');
INSERT INTO `keu_rekening` VALUES ('317', '7', '513807', 'BIAYA MESS', null, '');
INSERT INTO `keu_rekening` VALUES ('318', '7', '513901', 'SELAMATAN', null, '');
INSERT INTO `keu_rekening` VALUES ('319', '7', '513902', 'BIAYA PENGURUSAN SURAT LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('320', '7', '513903', 'DENDA PAJAK', null, '');
INSERT INTO `keu_rekening` VALUES ('321', '7', '513904', 'KOREKSI TAHUN LALU', null, '');
INSERT INTO `keu_rekening` VALUES ('322', '7', '513998', 'LAIN - LAIN (SELISIH KURS)', null, '');
INSERT INTO `keu_rekening` VALUES ('323', '7', '513999', 'LAIN - LAIN (SELISIH KAS)', null, '');
INSERT INTO `keu_rekening` VALUES ('324', '7', '514001', 'TRANSPORT', null, '');
INSERT INTO `keu_rekening` VALUES ('325', '7', '514002', 'MAKAN & MINUM (RAPAT)', null, '');
INSERT INTO `keu_rekening` VALUES ('326', '7', '514099', 'LAIN-LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('327', '7', '514101', 'BUKU', null, '');
INSERT INTO `keu_rekening` VALUES ('328', '7', '514102', 'VCD', null, '');
INSERT INTO `keu_rekening` VALUES ('329', '7', '514103', 'SERAGAM ', null, '');
INSERT INTO `keu_rekening` VALUES ('330', '7', '514104', 'ATRIBUT SEKOLAH', null, '');
INSERT INTO `keu_rekening` VALUES ('331', '7', '514105', 'BIAYA PSIKOTES', null, '');
INSERT INTO `keu_rekening` VALUES ('332', '7', '514106', 'BIAYA STUDY TOUR/FIELD TRIP', null, '');
INSERT INTO `keu_rekening` VALUES ('333', '7', '514107', 'BIAYA PERLOMBAAN ', null, '');
INSERT INTO `keu_rekening` VALUES ('334', '7', '514108', 'EKSTRAKURIKULER', null, '');
INSERT INTO `keu_rekening` VALUES ('335', '7', '514109', 'BIAYA STUDENT EXCHANGE', null, '');
INSERT INTO `keu_rekening` VALUES ('336', '7', '514110', 'BIAYA CHECK POINT', null, '');
INSERT INTO `keu_rekening` VALUES ('337', '7', '514199', 'LAIN - LAIN', null, '');
INSERT INTO `keu_rekening` VALUES ('340', '1', '111109', 'test rekening dua x', '5500000', 'keterangan tes dua');

-- ----------------------------
-- Table structure for keu_saldorekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_saldorekening`;
CREATE TABLE `keu_saldorekening` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `rekening` int(10) NOT NULL,
  `tahunbuku` int(10) NOT NULL,
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  `nominal2` double(14,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_saldorekening
-- ----------------------------
INSERT INTO `keu_saldorekening` VALUES ('155', '1', '1', '100000', '32247218');
INSERT INTO `keu_saldorekening` VALUES ('156', '2', '1', '100000', '20000');
INSERT INTO `keu_saldorekening` VALUES ('157', '3', '1', '100000', '50000');
INSERT INTO `keu_saldorekening` VALUES ('158', '4', '1', '100000', '100900');
INSERT INTO `keu_saldorekening` VALUES ('159', '5', '1', '100000', '99100');
INSERT INTO `keu_saldorekening` VALUES ('160', '6', '1', '100000', '65000');
INSERT INTO `keu_saldorekening` VALUES ('161', '7', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('162', '8', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('163', '9', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('164', '10', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('165', '11', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('166', '12', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('167', '13', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('168', '14', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('169', '15', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('170', '16', '1', '100000', '20000');
INSERT INTO `keu_saldorekening` VALUES ('171', '17', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('172', '18', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('173', '19', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('174', '20', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('175', '21', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('176', '22', '1', '100000', '50000');
INSERT INTO `keu_saldorekening` VALUES ('177', '23', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('178', '24', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('179', '25', '1', '100000', '95000');
INSERT INTO `keu_saldorekening` VALUES ('180', '26', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('181', '27', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('182', '28', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('183', '29', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('184', '30', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('185', '31', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('186', '32', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('187', '33', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('188', '34', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('189', '35', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('190', '36', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('191', '37', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('192', '38', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('193', '39', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('194', '40', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('195', '41', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('196', '42', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('197', '43', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('198', '44', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('199', '45', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('200', '46', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('201', '47', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('202', '48', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('203', '49', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('204', '50', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('205', '61', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('206', '62', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('207', '63', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('208', '64', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('209', '65', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('210', '66', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('211', '67', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('212', '68', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('213', '69', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('214', '70', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('215', '71', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('216', '72', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('217', '73', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('218', '74', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('219', '75', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('220', '76', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('221', '77', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('222', '78', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('223', '79', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('224', '80', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('225', '331', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('226', '332', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('227', '333', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('228', '334', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('229', '335', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('230', '336', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('231', '337', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('232', '340', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('233', '53', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('234', '54', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('235', '55', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('236', '56', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('237', '57', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('238', '58', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('239', '59', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('240', '60', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('241', '81', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('242', '82', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('243', '323', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('244', '324', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('245', '325', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('246', '326', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('247', '327', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('248', '328', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('249', '329', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('250', '330', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('251', '315', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('252', '316', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('253', '317', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('254', '318', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('255', '319', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('256', '320', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('257', '321', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('258', '322', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('259', '307', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('260', '308', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('261', '309', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('262', '310', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('263', '311', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('264', '312', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('265', '313', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('266', '314', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('267', '299', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('268', '300', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('269', '301', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('270', '302', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('271', '303', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('272', '304', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('273', '305', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('274', '306', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('275', '291', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('276', '292', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('277', '293', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('278', '294', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('279', '295', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('280', '296', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('281', '297', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('282', '298', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('283', '283', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('284', '284', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('285', '285', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('286', '286', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('287', '287', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('288', '288', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('289', '289', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('290', '290', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('291', '275', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('292', '276', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('293', '277', '1', '100000', '425000');
INSERT INTO `keu_saldorekening` VALUES ('294', '278', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('295', '279', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('296', '280', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('297', '281', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('298', '282', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('299', '267', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('300', '268', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('301', '269', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('302', '270', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('303', '271', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('304', '272', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('305', '273', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('306', '274', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('307', '259', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('308', '260', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('309', '261', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('310', '262', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('311', '263', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('312', '264', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('313', '265', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('314', '266', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('315', '251', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('316', '252', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('317', '253', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('318', '254', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('319', '255', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('320', '256', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('321', '257', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('322', '258', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('323', '243', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('324', '244', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('325', '245', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('326', '246', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('327', '247', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('328', '248', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('329', '249', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('330', '250', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('331', '235', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('332', '236', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('333', '237', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('334', '238', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('335', '239', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('336', '240', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('337', '241', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('338', '242', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('339', '227', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('340', '228', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('341', '229', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('342', '230', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('343', '231', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('344', '232', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('345', '233', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('346', '234', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('347', '219', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('348', '220', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('349', '221', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('350', '222', '1', '100000', '135000');
INSERT INTO `keu_saldorekening` VALUES ('351', '223', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('352', '224', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('353', '225', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('354', '226', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('355', '211', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('356', '212', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('357', '213', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('358', '214', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('359', '215', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('360', '216', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('361', '217', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('362', '218', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('363', '203', '1', '100000', '-20000');
INSERT INTO `keu_saldorekening` VALUES ('364', '204', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('365', '205', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('366', '206', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('367', '207', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('368', '208', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('369', '209', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('370', '210', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('371', '195', '1', '100000', '-765075');
INSERT INTO `keu_saldorekening` VALUES ('372', '196', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('373', '197', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('374', '198', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('375', '199', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('376', '200', '1', '100000', '-500000');
INSERT INTO `keu_saldorekening` VALUES ('377', '201', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('378', '202', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('379', '187', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('380', '188', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('381', '189', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('382', '190', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('383', '191', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('384', '192', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('385', '193', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('386', '194', '1', '100000', '-30457143');
INSERT INTO `keu_saldorekening` VALUES ('387', '179', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('388', '180', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('389', '181', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('390', '182', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('391', '183', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('392', '184', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('393', '185', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('394', '186', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('395', '171', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('396', '172', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('397', '173', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('398', '174', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('399', '175', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('400', '176', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('401', '177', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('402', '178', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('403', '163', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('404', '164', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('405', '165', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('406', '166', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('407', '167', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('408', '168', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('409', '169', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('410', '170', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('411', '155', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('412', '156', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('413', '157', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('414', '158', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('415', '159', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('416', '160', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('417', '161', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('418', '162', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('419', '147', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('420', '148', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('421', '149', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('422', '150', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('423', '151', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('424', '152', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('425', '153', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('426', '154', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('427', '139', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('428', '140', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('429', '141', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('430', '142', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('431', '143', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('432', '144', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('433', '145', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('434', '146', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('435', '131', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('436', '132', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('437', '133', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('438', '134', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('439', '135', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('440', '136', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('441', '137', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('442', '138', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('443', '123', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('444', '124', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('445', '125', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('446', '126', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('447', '127', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('448', '128', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('449', '129', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('450', '130', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('451', '115', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('452', '116', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('453', '117', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('454', '118', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('455', '119', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('456', '120', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('457', '121', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('458', '122', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('459', '107', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('460', '108', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('461', '109', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('462', '110', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('463', '111', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('464', '112', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('465', '113', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('466', '114', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('467', '99', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('468', '100', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('469', '101', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('470', '102', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('471', '103', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('472', '104', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('473', '105', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('474', '106', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('475', '91', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('476', '92', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('477', '93', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('478', '94', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('479', '95', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('480', '96', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('481', '97', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('482', '98', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('483', '83', '1', '100000', '35000');
INSERT INTO `keu_saldorekening` VALUES ('484', '84', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('485', '85', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('486', '86', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('487', '87', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('488', '88', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('489', '89', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('490', '90', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('491', '51', '1', '100000', '100000');
INSERT INTO `keu_saldorekening` VALUES ('492', '52', '1', '100000', '100000');

-- ----------------------------
-- Table structure for keu_tahunbuku
-- ----------------------------
DROP TABLE IF EXISTS `keu_tahunbuku`;
CREATE TABLE `keu_tahunbuku` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `tanggal1` date NOT NULL DEFAULT '0000-00-00',
  `tanggal2` date NOT NULL DEFAULT '0000-00-00',
  `kode` varchar(20) NOT NULL,
  `saldoawal` decimal(10,0) NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_tahunbuku
-- ----------------------------
INSERT INTO `keu_tahunbuku` VALUES ('1', '2014', '2015-01-01', '0000-00-00', '', '649100', '1', 'Kas Satelit');
INSERT INTO `keu_tahunbuku` VALUES ('5', '2015', '2014-10-23', '0000-00-00', '', '0', '0', 'tes');

-- ----------------------------
-- Table structure for keu_transaksi
-- ----------------------------
DROP TABLE IF EXISTS `keu_transaksi`;
CREATE TABLE `keu_transaksi` (
  `replid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahunbuku` int(10) unsigned NOT NULL DEFAULT '0',
  `nomer` varchar(50) NOT NULL,
  `nobukti` varchar(50) NOT NULL,
  `tanggal` date NOT NULL DEFAULT '0000-00-00',
  `rekkas` int(10) unsigned NOT NULL DEFAULT '0',
  `rekitem` int(10) unsigned NOT NULL DEFAULT '0',
  `nominal` double(14,0) NOT NULL DEFAULT '0',
  `uraian` varchar(250) NOT NULL,
  `modul` int(10) unsigned NOT NULL DEFAULT '0',
  `kategori` int(10) unsigned NOT NULL DEFAULT '0',
  `pembayaran` int(10) unsigned NOT NULL DEFAULT '0',
  `penerimaanbrg` int(10) unsigned NOT NULL DEFAULT '0',
  `jenis` tinyint(4) NOT NULL DEFAULT '0',
  `budget` int(10) unsigned NOT NULL DEFAULT '0',
  `ct` int(10) unsigned NOT NULL DEFAULT '0',
  `detjenistrans` int(10) NOT NULL,
  `detilanggaran` int(10) NOT NULL,
  `isPO` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of keu_transaksi
-- ----------------------------
INSERT INTO `keu_transaksi` VALUES ('1', '1', 'BKM-0001/05/2015', 'o', '2015-05-25', '1', '83', '80000', '8', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('2', '1', 'BKK-0002/05/2015', 'd', '2015-05-25', '1', '83', '15000', 'gaji xx', '0', '0', '0', '0', '0', '0', '0', '7', '39', '0');
INSERT INTO `keu_transaksi` VALUES ('3', '1', 'BKK-0003/05/2015', '', '2015-05-25', '6', '222', '35000', 'pesangon', '0', '0', '0', '0', '0', '0', '0', '7', '39', '0');
INSERT INTO `keu_transaksi` VALUES ('4', '1', 'BKM-0006/05/2015', '', '2015-05-25', '1', '203', '120000', 'donasi uang sekolah dari para wali murid', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('5', '1', 'MMJ-0005/05/2015', 'ju 2', '2015-05-26', '0', '0', '5500', 'uraian ju 2 ', '0', '0', '0', '0', '0', '0', '0', '7', '20', '0');
INSERT INTO `keu_transaksi` VALUES ('6', '1', 'BKM-0006/05/2015', '', '2015-05-27', '1', '200', '300000', 'Pembayaran Pendaftaran Tahun Ajaran 2014 - 2015. \r\nCalon Siswa : Trevor Yongnardi \r\nNo. Pendaftaran : PMB2014140007', '0', '0', '3653', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('7', '1', 'BKM-0007/05/2015', '', '2015-05-27', '1', '195', '500000', 'Pembayaran Joining Fee Tahun  Angkatan 2014. \r\nCalon Siswa : Trevor Yongnardi \r\nNo. Pendaftaran : PMB2014140007', '0', '0', '3654', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('8', '1', 'BKM-0008/05/2015', '', '2015-05-30', '1', '194', '14000000', 'Pembayaran DPP Angkatan 2014. \r\nSiswa : Kaitlynn Tiffany L. \r\nNIS : ', '0', '0', '3655', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('9', '1', 'BKM-0009/06/2015', '', '2015-06-05', '1', '194', '4545000', 'Pembayaran DPP Angkatan 2014. \r\nSiswa : Trevor Yongnardi \r\nNIS : ', '0', '0', '3656', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('10', '1', 'BKM-0010/06/2015', '', '2015-06-05', '1', '200', '300000', 'Pembayaran Pendaftaran Tahun Ajaran 2014 - 2015. \r\nCalon Siswa : Kaitlynn Tiffany L. \r\nNo. Pendaftaran : PMB2014140001', '0', '0', '3657', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('11', '1', 'BKM-0011/06/2015', '', '2015-06-08', '1', '194', '4522000', 'Pembayaran DPP Angkatan 2014. \r\nSiswa : Sean Kennard Sebastian Ho \r\nNIS : ', '0', '0', '3658', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('12', '1', 'BKM-0012/06/2015', '', '2015-06-08', '1', '194', '2261000', 'Pembayaran DPP Angkatan 2014. \r\nSiswa : Sean Kennard Sebastian Ho \r\nNIS : ', '0', '0', '3659', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('13', '1', 'BKM-0013/06/2015', '', '2015-06-08', '1', '194', '4522000', 'Pembayaran DPP Angkatan 2014. \r\nSiswa : Sean Kennard Sebastian Ho \r\nNIS : ', '0', '0', '3660', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('14', '1', 'BKM-0014/06/2015', '', '2015-06-08', '1', '195', '100000', 'Pembayaran Joining Fee Tahun  Angkatan 2014. \r\nCalon Siswa : Sean Kennard Sebastian Ho \r\nNo. Pendaftaran : PMB2014140008', '0', '0', '3661', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('15', '1', 'BKM-0015/06/2015', '', '2015-06-08', '1', '195', '50000', 'Pembayaran Joining Fee Tahun  Angkatan 2014. \r\nCalon Siswa : Sean Kennard Sebastian Ho \r\nNo. Pendaftaran : PMB2014140008', '0', '0', '3662', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('16', '1', 'BKM-0016/06/2015', '', '2015-06-08', '1', '195', '150000', 'Pembayaran Joining Fee Tahun  Angkatan 2014. \r\nCalon Siswa : Sean Kennard Sebastian Ho \r\nNo. Pendaftaran : PMB2014140008', '0', '0', '3663', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('17', '1', 'BKM-0017/06/2015', '', '2015-06-08', '1', '194', '1515000', 'Pembayaran DPP Angkatan 2014. \r\nSiswa : Trevor Yongnardi \r\nNIS : ', '0', '0', '3664', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('18', '1', 'BKM-0018/06/2015', '', '2015-06-08', '1', '194', '3030000', 'Pembayaran DPP Angkatan 2014. \r\nSiswa : Trevor Yongnardi \r\nNIS : ', '0', '0', '3665', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('21', '1', 'BKK-0019/06/2015', 'INV1805150002', '2015-06-12', '3', '277', '50000', 'papan tulis', '0', '0', '0', '0', '0', '0', '0', '7', '37', '0');
INSERT INTO `keu_transaksi` VALUES ('22', '1', 'BKK-0022/06/2015', 'INV0106150004', '2015-06-12', '3', '277', '5000', 'ok bos', '0', '0', '0', '0', '0', '0', '0', '7', '37', '0');
INSERT INTO `keu_transaksi` VALUES ('23', '1', 'BKK-0023/06/2015', 'INV1805150001', '2015-06-13', '1', '277', '20000', 'urai', '0', '0', '0', '0', '0', '0', '0', '7', '40', '0');
INSERT INTO `keu_transaksi` VALUES ('24', '1', 'BKK-0024/06/2015', 'INV1805150001', '2015-06-13', '1', '277', '90000', 'tes', '0', '0', '0', '0', '0', '0', '0', '7', '37', '0');
INSERT INTO `keu_transaksi` VALUES ('25', '1', 'BKK-0025/06/2015', 'INV1805150001', '2015-06-13', '2', '277', '80000', 'alat tulis keryawan', '0', '0', '0', '0', '0', '0', '0', '7', '37', '1');
INSERT INTO `keu_transaksi` VALUES ('26', '1', 'BKK-0026/06/2015', 'INV1805150001', '2015-06-13', '16', '277', '80000', 'buka giro ', '0', '0', '0', '0', '0', '0', '0', '7', '39', '1');
INSERT INTO `keu_transaksi` VALUES ('27', '1', 'BKM-0027/06/2015', '', '2015-06-13', '1', '195', '75', 'Pembayaran Joining Fee Tahun  Angkatan 2014. \r\nCalon Siswa : Sean Kennard Sebastian Ho \r\nNo. Pendaftaran : PMB2014140008', '0', '0', '3666', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('28', '1', 'BKM-0028/06/2015', '', '2015-06-13', '1', '195', '65000', 'Pembayaran Joining Fee Tahun  Angkatan 2014. \r\nCalon Siswa : Sean Kennard Sebastian Ho \r\nNo. Pendaftaran : PMB2014140008', '0', '0', '3667', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('29', '1', 'MMJ-0029/06/2015', '', '2015-06-18', '0', '0', '900', 'tos', '0', '0', '0', '0', '0', '0', '0', '8', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('30', '1', 'BKM-0030/07/2015', '', '2015-07-14', '1', '194', '-2695000', 'Pembayaran DPP Angkatan 2014. \r\nSiswa : Sean Kennard Sebastian Ho \r\nNIS : 333', '0', '0', '3668', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `keu_transaksi` VALUES ('31', '1', 'BKM-0031/07/2015', '', '2015-07-14', '1', '194', '-1142857', 'Pembayaran DPP Angkatan 2014. \r\nSiswa : maryeta p \r\nNIS : 1234', '0', '0', '3669', '0', '0', '0', '0', '1', '0', '0');
