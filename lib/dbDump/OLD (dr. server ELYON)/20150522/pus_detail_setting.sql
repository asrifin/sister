/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-05-29 14:51:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pus_detail_setting
-- ----------------------------
DROP TABLE IF EXISTS `pus_detail_setting`;
CREATE TABLE `pus_detail_setting` (
  `replid` int(11) NOT NULL AUTO_INCREMENT,
  `kunci` int(11) NOT NULL DEFAULT '0',
  `nilai` varchar(200) NOT NULL,
  `nilai2` varchar(200) NOT NULL,
  `keterangan` text NOT NULL,
  `isEdit` int(1) NOT NULL DEFAULT '0',
  `isActive` int(1) NOT NULL DEFAULT '1',
  `urut` int(2) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pus_detail_setting
-- ----------------------------
INSERT INTO `pus_detail_setting` VALUES ('1', '1', 'nomorauto', '4', 'Nomor otomatis (incremental). Panjang digit maksimal 5 karakter dengan penambahan angka 0 di depan. Jika panjang digit tidak diberikan atau 0 maka panjang digit sesuai angka asli tanpa penambahan angka 0 di depan.\r\nContoh:\r\n[nomorauto.5] untuk nomor otomatis dengan panjang digit lima karakter.[nomorauto] untuk nomor otomatis dengan panjang digit sesuai angka asli.', '1', '1', '1');
INSERT INTO `pus_detail_setting` VALUES ('2', '1', 'sumber', '', 'Sumber itemSumber dari pembelian berkode B.\r\nSumber dari hibah/pemberian berkode H.', '0', '1', '2');
INSERT INTO `pus_detail_setting` VALUES ('3', '1', 'sistem', 'SISTER', 'Sumber itemSumber dari pembelian berkode B.\r\nSumber dari hibah/pemberian berkode H.', '1', '1', '3');
INSERT INTO `pus_detail_setting` VALUES ('4', '1', 'tahun', '', 'Tahun ketika buku diterima', '0', '1', '4');
INSERT INTO `pus_detail_setting` VALUES ('5', '1', 'tingkatbuku', '', 'Kode lokasi perpustakaan', '0', '1', '5');
INSERT INTO `pus_detail_setting` VALUES ('6', '2', 'lokasi', '', 'Kode lokasi.', '0', '1', '1');
INSERT INTO `pus_detail_setting` VALUES ('7', '2', 'tingkat', '', 'Kode tingkat koleksi.', '0', '1', '2');
INSERT INTO `pus_detail_setting` VALUES ('8', '2', 'tahun', '', 'Tahun.', '0', '1', '3');
INSERT INTO `pus_detail_setting` VALUES ('9', '2', 'nomorauto', '5', 'Nomor otomatis (incremental). Panjang digit maksimal 5 karakter dengan penambahan angka 0 di depan. Jika panjang digit tidak diberikan atau 0 maka panjang digit sesuai angka asli tanpa penambahan angka 0 di depan.\r\nContoh:\r\n[nomorauto.5] untuk nomor otomatis dengan panjang digit lima karakter.\r\n[nomorauto] untuk nomor otomatis dengan panjang digit sesuai angka asli.', '1', '1', '4');
INSERT INTO `pus_detail_setting` VALUES ('10', '3', 'instansi', 'ELYON SCHOOL LIBRARY ', 'nama instansi', '1', '1', '1');
INSERT INTO `pus_detail_setting` VALUES ('11', '4', 'deskripsi', 'Jl. Sukomanunggal Jaya 189-191 Sby (031-59622690) 99', 'deskripsi instansi (lengkap)', '1', '1', '1');
