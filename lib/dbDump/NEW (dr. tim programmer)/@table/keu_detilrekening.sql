/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-09-29 08:55:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for keu_detilrekening
-- ----------------------------
DROP TABLE IF EXISTS `keu_detilrekening`;
CREATE TABLE `keu_detilrekening` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kategorirekening` int(11) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`replid`),
  KEY `kategorirekeningFK` (`kategorirekening`),
  CONSTRAINT `kategorirekeningFK` FOREIGN KEY (`kategorirekening`) REFERENCES `keu_kategorirekening` (`replid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=latin1;

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
INSERT INTO `keu_detilrekening` VALUES ('20', '3', '112200', 'DEPOSITO BERJANGKA', '-\r\n');
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
INSERT INTO `keu_detilrekening` VALUES ('343', '2', '9999', 'uuuu', 'jjj');
INSERT INTO `keu_detilrekening` VALUES ('344', '2', '9999', 'uuuu', 'jjj');
INSERT INTO `keu_detilrekening` VALUES ('345', '2', '9999', 'uuuu', 'jjj');
DROP TRIGGER IF EXISTS `ins_keu_detilrekening`;
DELIMITER ;;
CREATE TRIGGER `ins_keu_detilrekening` AFTER INSERT ON `keu_detilrekening` FOR EACH ROW BEGIN

/* tahun ajaran ---------------------------------------------------------------*/
BLOCK1: begin
		declare vTahunajaran int;
		declare rowsHabis1 INT DEFAULT 0;  
		declare cursor1 cursor for  
				SELECT replid FROM aka_tahunajaran ;
		declare continue handler for not found set rowsHabis1 =1;
		open cursor1;
		LOOP1: loop
						fetch cursor1
						into  vTahunajaran;
						if rowsHabis1 then  close cursor1; leave LOOP1;
						end if;
						/*insert saldo rekening ---------------------------------------------------------------*/
						INSERT INTO keu_saldorekening SET 
								detilrekening  = NEW.replid, 
								tahunajaran = vTahunajaran;
				end loop LOOP1;
		end BLOCK1;
END
;;
DELIMITER ;
