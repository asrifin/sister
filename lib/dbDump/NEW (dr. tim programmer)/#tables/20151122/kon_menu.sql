/*
Navicat MySQL Data Transfer

Source Server         : locale
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2015-11-22 21:44:18
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kon_menu
-- ----------------------------
INSERT INTO `kon_menu` VALUES ('1', '4', 'Siswa', 'siswa', 'double', '7', '9', '');
INSERT INTO `kon_menu` VALUES ('2', '1', 'Presensi Siswa', 'presensi-siswa', 'double', '44', '10', '');
INSERT INTO `kon_menu` VALUES ('3', '1', 'Rapor Siswa', 'rapor-siswa', 'double', '3', '11', '');
INSERT INTO `kon_menu` VALUES ('4', '1', 'Pendataan Alumni', 'pendataan-alumni', 'double', '4', '12', '');
INSERT INTO `kon_menu` VALUES ('8', '5', 'Transaksi', 'transaksi', 'double', '8', '16', '');
INSERT INTO `kon_menu` VALUES ('10', '40', 'Penerimaan Siswa', 'penerimaan-siswa', 'double', '10', '18', '');
INSERT INTO `kon_menu` VALUES ('13', '6', 'Saldo Rekening', 'saldo-rekening', '', '13', '13', '');
INSERT INTO `kon_menu` VALUES ('14', '6', 'Kategori Rekening', 'kategori-rekening', '', '14', '14', '');
INSERT INTO `kon_menu` VALUES ('15', '6', 'Detil Rekening', 'detil-rekening', '', '15', '10', '');
INSERT INTO `kon_menu` VALUES ('16', '5', 'Anggaran Tahunan', 'anggaran-tahunan', 'double', '16', '16', '');
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
INSERT INTO `kon_menu` VALUES ('40', '1', 'Siswa Kelas', 'siswa-kelas', 'double', '13', '15', '');
INSERT INTO `kon_menu` VALUES ('41', '41', 'Biaya', 'biaya', '', '14', '15', '');
INSERT INTO `kon_menu` VALUES ('42', '9', 'Diskon', 'diskon', '', '14', '15', '');
INSERT INTO `kon_menu` VALUES ('43', '41', 'Angsuran', 'angsuran', '', '17', '13', '');
INSERT INTO `kon_menu` VALUES ('44', '9', 'golongan', 'golongan', '', '13', '16', '');
INSERT INTO `kon_menu` VALUES ('45', '7', 'menu', 'menu', '', '14', '16', '');
INSERT INTO `kon_menu` VALUES ('46', '7', 'Grup Modul', 'grup-modul', '', '13', '12', '');
INSERT INTO `kon_menu` VALUES ('47', '7', 'Modul', 'modul', '', '12', '11', '');
INSERT INTO `kon_menu` VALUES ('48', '7', 'Grup Menu', 'grup-menu', '', '16', '13', '');
INSERT INTO `kon_menu` VALUES ('52', '9', 'Gelombang', 'gelombang', '', '16', '10', 'kelompok pendaftaran  (gelombang)');
INSERT INTO `kon_menu` VALUES ('54', '14', 'Perangkat', 'perangkat', '', '45', '10', 'ok');
INSERT INTO `kon_menu` VALUES ('55', '14', 'Lokasi', 'lokasi', '', '47', '10', '');
INSERT INTO `kon_menu` VALUES ('56', '14', 'Jenis Buku', 'jenisbuku', '', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('57', '14', 'Tingkat Buku', 'tingkatbuku', '', '13', '10', '');
INSERT INTO `kon_menu` VALUES ('58', '14', 'Klasifikasi', 'klasifikasi', '', '41', '10', '');
INSERT INTO `kon_menu` VALUES ('60', '14', 'Daftar Penerbit', 'penerbit', '', '10', '10', '');
INSERT INTO `kon_menu` VALUES ('61', '14', 'Daftar Bahasa', 'bahasa', '', '24', '10', '');
INSERT INTO `kon_menu` VALUES ('62', '14', 'Satuan Mata Uang', 'satuan', '', '8', '10', '\r\n');
INSERT INTO `kon_menu` VALUES ('63', '15', 'Katalog', 'katalog', 'double', '4', '10', '');
INSERT INTO `kon_menu` VALUES ('65', '15', 'Data Anggota', 'data-anggota', 'double', '13', '10', '');
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
INSERT INTO `kon_menu` VALUES ('155', '40', 'Detail Biaya', 'detail-biaya', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('156', '4', 'reminder ultah', 'reminder-ultah', '', '18', '14', '');
INSERT INTO `kon_menu` VALUES ('157', '4', 'Rekapitulasi Siswa', 'rekapitulasi-siswa', '', '10', '18', '');
INSERT INTO `kon_menu` VALUES ('158', '6', 'Kategori Anggaran', 'kategori-anggaran', '', '18', '11', '');
INSERT INTO `kon_menu` VALUES ('159', '6', 'Detil Anggaran', 'detil-anggaran', '', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('160', '40', 'Rekapitulasi Penerimaan Siswa', 'rekapitulasi-penerimaan-siswa', 'double', '8', '10', '');
INSERT INTO `kon_menu` VALUES ('161', '40', 'Pemutihan Penerimaan Siswa', 'pemutihan-penerimaan-siswa', 'double', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('162', '41', 'Via Bayar', 'via-bayar', '', '16', '10', '');
INSERT INTO `kon_menu` VALUES ('163', '40', 'Rekening Biaya', 'rekening-biaya', 'double', '31', '11', '');
INSERT INTO `kon_menu` VALUES ('164', '15', 'Peminjaman', 'peminjaman', 'double', '16', '20', '');
INSERT INTO `kon_menu` VALUES ('165', '15', 'Daftar Koleksi', 'koleksi', 'double', '7', '20', '');
INSERT INTO `kon_menu` VALUES ('166', '0', '', '', '', '0', '0', '');
