/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-18 17:44:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pos_alur_stok
-- ----------------------------
DROP TABLE IF EXISTS `pos_alur_stok`;
CREATE TABLE `pos_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_alur_stok
-- ----------------------------
INSERT INTO `pos_alur_stok` VALUES ('88', '2015-07-02', 'stok awal', '-', '001', '60');
INSERT INTO `pos_alur_stok` VALUES ('89', '2015-07-02', 'stok awal', '-', '002', '77');
INSERT INTO `pos_alur_stok` VALUES ('90', '2015-07-02', 'stok awal', '-', '003', '44');
INSERT INTO `pos_alur_stok` VALUES ('91', '2015-07-02', 'stok awal', '-', '004', '77');
INSERT INTO `pos_alur_stok` VALUES ('92', '2015-07-02', 'stok awal', '-', '005', '40');
INSERT INTO `pos_alur_stok` VALUES ('93', '2015-07-02', 'stok awal', '-', '006', '60');
INSERT INTO `pos_alur_stok` VALUES ('94', '2015-07-02', 'stok awal', '-', '007', '33');
INSERT INTO `pos_alur_stok` VALUES ('95', '2015-07-02', 'stok awal', '-', '008', '5');
INSERT INTO `pos_alur_stok` VALUES ('98', '2015-07-02', 'stok awal', '-', 'BK001', '55');
INSERT INTO `pos_alur_stok` VALUES ('100', '2015-07-02', 'Penjualan', 'FAK0207150001', '008', '2');
INSERT INTO `pos_alur_stok` VALUES ('101', '2015-07-02', 'Penjualan', 'FAK0207150002', 'BK001', '1');
INSERT INTO `pos_alur_stok` VALUES ('102', '2015-07-07', 'Stok Awal', '-', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '98');
INSERT INTO `pos_alur_stok` VALUES ('103', '2015-07-07', 'Pembelian', 'INV0707150002', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '8');
INSERT INTO `pos_alur_stok` VALUES ('104', '2015-07-07', 'stok awal', '-', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '98');
INSERT INTO `pos_alur_stok` VALUES ('105', '2015-07-07', 'stok awal', '-', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '98');
INSERT INTO `pos_alur_stok` VALUES ('106', '2015-07-07', 'Stok Awal', '-', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '98');

-- ----------------------------
-- Table structure for pos_biayabulanan
-- ----------------------------
DROP TABLE IF EXISTS `pos_biayabulanan`;
CREATE TABLE `pos_biayabulanan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_biayabulanan
-- ----------------------------
INSERT INTO `pos_biayabulanan` VALUES ('1', '2015-07-01', 'LISTRIK', '500000');
INSERT INTO `pos_biayabulanan` VALUES ('2', '2015-07-01', 'AIR', '50000');

-- ----------------------------
-- Table structure for pos_bulan
-- ----------------------------
DROP TABLE IF EXISTS `pos_bulan`;
CREATE TABLE `pos_bulan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_bulan
-- ----------------------------
INSERT INTO `pos_bulan` VALUES ('1', 'Januari', '01');
INSERT INTO `pos_bulan` VALUES ('2', 'Februari', '02');
INSERT INTO `pos_bulan` VALUES ('3', 'Maret', '03');
INSERT INTO `pos_bulan` VALUES ('4', 'April', '04');
INSERT INTO `pos_bulan` VALUES ('5', 'Mei', '05');
INSERT INTO `pos_bulan` VALUES ('6', 'Juni', '06');
INSERT INTO `pos_bulan` VALUES ('7', 'Juli', '07');
INSERT INTO `pos_bulan` VALUES ('8', 'Agustus', '08');
INSERT INTO `pos_bulan` VALUES ('9', 'September', '09');
INSERT INTO `pos_bulan` VALUES ('10', 'Oktober', '10');
INSERT INTO `pos_bulan` VALUES ('11', 'Nopember', '11');
INSERT INTO `pos_bulan` VALUES ('12', 'Desember', '12');

-- ----------------------------
-- Table structure for pos_customer
-- ----------------------------
DROP TABLE IF EXISTS `pos_customer`;
CREATE TABLE `pos_customer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_customer
-- ----------------------------

-- ----------------------------
-- Table structure for pos_jenisjasa
-- ----------------------------
DROP TABLE IF EXISTS `pos_jenisjasa`;
CREATE TABLE `pos_jenisjasa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_jenisjasa
-- ----------------------------

-- ----------------------------
-- Table structure for pos_jenisproduk
-- ----------------------------
DROP TABLE IF EXISTS `pos_jenisproduk`;
CREATE TABLE `pos_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `jenis` enum('BARANG','JASA') NOT NULL DEFAULT 'BARANG',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_jenisproduk
-- ----------------------------
INSERT INTO `pos_jenisproduk` VALUES ('1', 'SERAGAM', 'BARANG');
INSERT INTO `pos_jenisproduk` VALUES ('3', 'BUKU', 'BARANG');
INSERT INTO `pos_jenisproduk` VALUES ('7', 'FORMULIR PSIKOTEST', 'BARANG');
INSERT INTO `pos_jenisproduk` VALUES ('9', 'FOOD BEVERAGES', 'BARANG');
INSERT INTO `pos_jenisproduk` VALUES ('10', 'EKSTRAKURIKULER', 'JASA');

-- ----------------------------
-- Table structure for pos_jenjang
-- ----------------------------
DROP TABLE IF EXISTS `pos_jenjang`;
CREATE TABLE `pos_jenjang` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_jenjang
-- ----------------------------
INSERT INTO `pos_jenjang` VALUES ('1', 'Play Group A');
INSERT INTO `pos_jenjang` VALUES ('5', 'Tidak Ada');
INSERT INTO `pos_jenjang` VALUES ('6', 'Primary 1');
INSERT INTO `pos_jenjang` VALUES ('7', 'Primary 2');
INSERT INTO `pos_jenjang` VALUES ('8', 'Primary 3');
INSERT INTO `pos_jenjang` VALUES ('9', 'Primary 4');
INSERT INTO `pos_jenjang` VALUES ('10', 'Primary 5');
INSERT INTO `pos_jenjang` VALUES ('11', 'Primary 6');
INSERT INTO `pos_jenjang` VALUES ('12', 'Secondary 1');
INSERT INTO `pos_jenjang` VALUES ('13', 'Secondary 2');
INSERT INTO `pos_jenjang` VALUES ('14', 'Secondary 3');
INSERT INTO `pos_jenjang` VALUES ('15', 'Secondary 4');
INSERT INTO `pos_jenjang` VALUES ('16', 'High School 11');
INSERT INTO `pos_jenjang` VALUES ('17', 'High School 12');
INSERT INTO `pos_jenjang` VALUES ('18', 'Play Group B');
INSERT INTO `pos_jenjang` VALUES ('19', 'Kindergarten A');
INSERT INTO `pos_jenjang` VALUES ('20', 'Kindergarten B');

-- ----------------------------
-- Table structure for pos_kelas
-- ----------------------------
DROP TABLE IF EXISTS `pos_kelas`;
CREATE TABLE `pos_kelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_kelas
-- ----------------------------
INSERT INTO `pos_kelas` VALUES ('1', 'A', '3');
INSERT INTO `pos_kelas` VALUES ('2', 'B', '2');

-- ----------------------------
-- Table structure for pos_pembelian
-- ----------------------------
DROP TABLE IF EXISTS `pos_pembelian`;
CREATE TABLE `pos_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL,
  `hutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` varchar(50) NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_pembelian
-- ----------------------------
INSERT INTO `pos_pembelian` VALUES ('1', 'INV0207150001', 'PO0207150001', '2015-07-02', 'SUP0019', 'Hutang', '635000', '0', '635000', '635000', '0', '30', '2015-08-1', 'admin');
INSERT INTO `pos_pembelian` VALUES ('2', 'INV0707150002', 'PO0707150004', '2015-07-07', 'SUP0019', 'Hutang', '159120', '0', '159120', '0', '159120', '', '1970-01-1', 'admin');

-- ----------------------------
-- Table structure for pos_pembeliandetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_pembeliandetail`;
CREATE TABLE `pos_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_pembeliandetail
-- ----------------------------
INSERT INTO `pos_pembeliandetail` VALUES ('1', 'INV0207150001', 'PO0207150001', '002', '5', '127000', '0', '635000');
INSERT INTO `pos_pembeliandetail` VALUES ('2', 'INV0707150002', 'PO0707150004', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '8', '22100', '10', '159120');

-- ----------------------------
-- Table structure for pos_pembelianretur
-- ----------------------------
DROP TABLE IF EXISTS `pos_pembelianretur`;
CREATE TABLE `pos_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_pembelianretur
-- ----------------------------

-- ----------------------------
-- Table structure for pos_pembelianreturdetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_pembelianreturdetail`;
CREATE TABLE `pos_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_pembelianreturdetail
-- ----------------------------

-- ----------------------------
-- Table structure for pos_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualan`;
CREATE TABLE `pos_penjualan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang','Pemesanan') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `piutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualan
-- ----------------------------
INSERT INTO `pos_penjualan` VALUES ('1', 'FAK0207150001', 'POF0207150001', '2015-07-02', '1005', 'Tunai', '110000', '0', '110000', '110000', '0', '0', '2015-07-2', 'admin');
INSERT INTO `pos_penjualan` VALUES ('2', 'FAK0207150002', 'POF0207150002', '2015-07-02', '1005', 'Tunai', '30000', '0', '30000', '30000', '0', '0', '2015-07-2', 'admin');

-- ----------------------------
-- Table structure for pos_penjualanbiaya
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualanbiaya`;
CREATE TABLE `pos_penjualanbiaya` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualanbiaya
-- ----------------------------
INSERT INTO `pos_penjualanbiaya` VALUES ('1', 'FKB0207150001', '2015-07-02', 'Tunai', '1000', '0', '1000', '1000', 'admin');
INSERT INTO `pos_penjualanbiaya` VALUES ('2', 'FKB0207150002', '2015-07-02', 'Tunai', '7000', '0', '7000', '7000', 'admin');

-- ----------------------------
-- Table structure for pos_penjualanbiayadetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualanbiayadetail`;
CREATE TABLE `pos_penjualanbiayadetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodebiaya` varchar(50) NOT NULL,
  `jenis` int(2) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualanbiayadetail
-- ----------------------------
INSERT INTO `pos_penjualanbiayadetail` VALUES ('1', 'FKB0207150001', 'BTRP01', '3', '1', '1000', '0', '0', '1000');
INSERT INTO `pos_penjualanbiayadetail` VALUES ('2', 'FKB0207150002', 'GURU PRAMUKA', '6', '1', '7000', '0', '0', '7000');

-- ----------------------------
-- Table structure for pos_penjualandetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualandetail`;
CREATE TABLE `pos_penjualandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `jenis` varchar(5) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualandetail
-- ----------------------------
INSERT INTO `pos_penjualandetail` VALUES ('1', 'FAK0207150001', 'POF0207150001', '1', '008', '2', '55000', '50000', '0', '110000');
INSERT INTO `pos_penjualandetail` VALUES ('2', 'FAK0207150002', 'POF0207150002', '3', 'BK001', '1', '30000', '25000', '0', '30000');

-- ----------------------------
-- Table structure for pos_penjualanjasa
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualanjasa`;
CREATE TABLE `pos_penjualanjasa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `piutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualanjasa
-- ----------------------------
INSERT INTO `pos_penjualanjasa` VALUES ('1', 'FKJ0207150001', '2015-07-02', '599', 'Tunai', '60000', '0', '60000', '60000', '0', '0', '', 'admin');

-- ----------------------------
-- Table structure for pos_penjualanjasadetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualanjasadetail`;
CREATE TABLE `pos_penjualanjasadetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodejasa` varchar(50) NOT NULL,
  `jenis` int(4) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualanjasadetail
-- ----------------------------
INSERT INTO `pos_penjualanjasadetail` VALUES ('1', 'FKJ0207150001', '10', '6', '4', '10000', '0', '0', '40000');
INSERT INTO `pos_penjualanjasadetail` VALUES ('2', 'FKJ0207150001', '2', '6', '4', '5000', '0', '0', '20000');

-- ----------------------------
-- Table structure for pos_penjualanretur
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualanretur`;
CREATE TABLE `pos_penjualanretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualanretur
-- ----------------------------

-- ----------------------------
-- Table structure for pos_penjualanreturdetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_penjualanreturdetail`;
CREATE TABLE `pos_penjualanreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_penjualanreturdetail
-- ----------------------------

-- ----------------------------
-- Table structure for pos_po
-- ----------------------------
DROP TABLE IF EXISTS `pos_po`;
CREATE TABLE `pos_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_po
-- ----------------------------
INSERT INTO `pos_po` VALUES ('1', 'PO0207150001', '2015-07-02', 'SUP0019', 'Hutang', '635000', '0', '0', '30', 'admin');
INSERT INTO `pos_po` VALUES ('2', 'PO0707150002', '2015-07-07', 'SUP111', 'Tunai', '2165800', '0', '0', '0', 'admin');
INSERT INTO `pos_po` VALUES ('3', 'PO0707150003', '2015-07-07', 'SUP0019', 'Hutang', '20995', '0', '0', '30', 'admin');
INSERT INTO `pos_po` VALUES ('4', 'PO0707150004', '2015-07-07', 'SUP0019', 'Hutang', '198900', '0', '0', '30', 'admin');

-- ----------------------------
-- Table structure for pos_podetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_podetail`;
CREATE TABLE `pos_podetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_podetail
-- ----------------------------
INSERT INTO `pos_podetail` VALUES ('1', 'PO0207150001', '002', '5', '127000', '0', '635000');
INSERT INTO `pos_podetail` VALUES ('2', 'PO0707150002', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '98', '22100', '0', '2165800');
INSERT INTO `pos_podetail` VALUES ('3', 'PO0707150003', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '1', '22100', '5', '20995');
INSERT INTO `pos_podetail` VALUES ('4', 'PO0707150004', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '10', '22100', '10', '198900');

-- ----------------------------
-- Table structure for pos_popenjualan
-- ----------------------------
DROP TABLE IF EXISTS `pos_popenjualan`;
CREATE TABLE `pos_popenjualan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_popenjualan
-- ----------------------------
INSERT INTO `pos_popenjualan` VALUES ('1', 'POF0207150001', '2015-07-02', '1005', 'Pemesanan', '110000', '0', '110000', '0', 'admin');
INSERT INTO `pos_popenjualan` VALUES ('2', 'POF0207150002', '2015-07-02', '1005', 'Pemesanan', '30000', '0', '30000', '0', 'admin');

-- ----------------------------
-- Table structure for pos_popenjualandetail
-- ----------------------------
DROP TABLE IF EXISTS `pos_popenjualandetail`;
CREATE TABLE `pos_popenjualandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_popenjualandetail
-- ----------------------------
INSERT INTO `pos_popenjualandetail` VALUES ('1', 'POF0207150001', '008', '2', '55000', '50000', '0', '110000');
INSERT INTO `pos_popenjualandetail` VALUES ('2', 'POF0207150002', 'BK001', '1', '30000', '25000', '0', '30000');

-- ----------------------------
-- Table structure for pos_produk
-- ----------------------------
DROP TABLE IF EXISTS `pos_produk`;
CREATE TABLE `pos_produk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_produk
-- ----------------------------
INSERT INTO `pos_produk` VALUES ('24', '3', '6', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD PURNAMA RAYA', 'Gemar Berbahasa Indonesia 1A', '98', '22100', '28900');

-- ----------------------------
-- Table structure for pos_produkbiaya
-- ----------------------------
DROP TABLE IF EXISTS `pos_produkbiaya`;
CREATE TABLE `pos_produkbiaya` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_produkbiaya
-- ----------------------------
INSERT INTO `pos_produkbiaya` VALUES ('2', '6', '5', 'GURU PRAMUKA', 'GURU PRAMUKA', '100000');
INSERT INTO `pos_produkbiaya` VALUES ('3', '3', '5', 'BTRP01', 'BIAYA TRANSPORTASI BUKU', '1000');

-- ----------------------------
-- Table structure for pos_produkjasa
-- ----------------------------
DROP TABLE IF EXISTS `pos_produkjasa`;
CREATE TABLE `pos_produkjasa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_produkjasa
-- ----------------------------
INSERT INTO `pos_produkjasa` VALUES ('11', '10', '11', '11', 'PIANO', '400000');

-- ----------------------------
-- Table structure for pos_situs
-- ----------------------------
DROP TABLE IF EXISTS `pos_situs`;
CREATE TABLE `pos_situs` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `email_master` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `judul_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `url_situs` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `slogan` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `description` text COLLATE latin1_general_ci NOT NULL,
  `keywords` text COLLATE latin1_general_ci NOT NULL,
  `maxkonten` int(2) NOT NULL DEFAULT '5',
  `maxadmindata` int(2) NOT NULL DEFAULT '5',
  `maxdata` int(2) NOT NULL DEFAULT '5',
  `maxgalleri` int(2) NOT NULL DEFAULT '4',
  `widgetshare` int(2) NOT NULL DEFAULT '0',
  `theme` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'tcms',
  `author` text COLLATE latin1_general_ci NOT NULL,
  `alamatkantor` text COLLATE latin1_general_ci NOT NULL,
  `publishwebsite` int(1) NOT NULL DEFAULT '1',
  `publishnews` int(2) NOT NULL,
  `maxgalleridata` int(11) NOT NULL,
  `widgetkomentar` int(2) NOT NULL DEFAULT '1',
  `widgetpenulis` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of pos_situs
-- ----------------------------
INSERT INTO `pos_situs` VALUES ('1', 'rekysda@gmail.com', 'Student Service', 'http://localhost/sister/student/', 'Student Service', 'WebDesign dengan sistem Responsive', 'student service,surabaya,indonesia', '5', '50', '5', '4', '3', 'pos', 'Elyon Christian School', 'Surabaya', '1', '1', '12', '1', '2');

-- ----------------------------
-- Table structure for pos_supplier
-- ----------------------------
DROP TABLE IF EXISTS `pos_supplier`;
CREATE TABLE `pos_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_supplier
-- ----------------------------
INSERT INTO `pos_supplier` VALUES ('4', '01', 'PD. PURNAMA RAYA', 'CITRALAND SURABAYA', '0317344875, 0317344492, FAX 0317385162', 'Hutang', '14 HARI');
INSERT INTO `pos_supplier` VALUES ('5', '02', 'NASYWAH.COM', 'JL. GUBENG KERTAJAYA 7 F / 10 SURABAYA', '03177751622, 081703708991', 'Hutang', '14 HARI');
INSERT INTO `pos_supplier` VALUES ('6', '03', 'MENTARI BOOKS', 'JL. DARMO PERMAI SELATAN SURABAYA', '02158900818', 'Hutang', '14 HARI');
INSERT INTO `pos_supplier` VALUES ('7', '04', 'PENERBIT ERLANGGA', 'JL. BERBEK INDUSTRI VII / 15 SURABAYA', '0318687910-12 FAX 0318687913', 'Hutang', '90 HARI');

-- ----------------------------
-- Table structure for pos_useraura
-- ----------------------------
DROP TABLE IF EXISTS `pos_useraura`;
CREATE TABLE `pos_useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','Penjualan','Kasir','Gudang','Accounting') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pos_useraura
-- ----------------------------
INSERT INTO `pos_useraura` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@elyon.sch.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', '0', '2015-08-10 14:24:28', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>');
INSERT INTO `pos_useraura` VALUES ('28', 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'rekysda@gmail.com', '', 'Administrator', 'aktif', '1', '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
INSERT INTO `pos_useraura` VALUES ('29', 'penjualan', '13bf2c8effae21d17a277520aa9b9277', 'penjualan@penjualan.com', '', 'Penjualan', 'aktif', '0', '2015-06-01 09:03:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
INSERT INTO `pos_useraura` VALUES ('30', 'kasir', 'c7911af3adbd12a035b289556d96470a', 'kasir@kasir.com', '', 'Kasir', 'aktif', '0', '2015-07-07 14:56:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
INSERT INTO `pos_useraura` VALUES ('31', 'gudang', '202446dd1d6028084426867365b0c7a1', 'gudang@gudang.com', '', 'Gudang', 'aktif', '0', '2015-07-02 12:52:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
INSERT INTO `pos_useraura` VALUES ('32', 'accounting', 'd4c143f004d88b7286e6f999dea9d0d7', 'accounting@accounting.com', '', 'Accounting', 'aktif', '0', '2015-07-07 15:13:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');
