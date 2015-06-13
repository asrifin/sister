/*
Navicat MySQL Data Transfer

Source Server         : lumba2
Source Server Version : 50616
Source Host           : 127.0.0.1:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2015-06-13 08:07:59
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

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
