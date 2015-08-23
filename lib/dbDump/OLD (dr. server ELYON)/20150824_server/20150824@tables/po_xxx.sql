#
# Structure for table "po_alur_stok"
#

DROP TABLE IF EXISTS `po_alur_stok`;
CREATE TABLE `po_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

#
# Data for table "po_alur_stok"
#

INSERT INTO `po_alur_stok` VALUES (29,'2015-06-16','Pembelian','INV1606150009','123','1'),(30,'2015-06-16','Pembelian','INV1606150009','123','1'),(31,'2015-06-16','Pembelian','INV1606150010','123','1'),(32,'2015-06-16','Pembelian','INV1606150011','9','1'),(33,'2015-06-16','Pembelian','INV1606150011','18','1'),(34,'2015-06-16','Pembelian','INV1606150012','123','1'),(35,'2015-06-16','Pembelian','INV1606150012','LO','1'),(36,'2015-06-16','Pembelian','INV1606150013','123','1'),(37,'2015-06-16','Pembelian','INV1606150013','LO','1'),(38,'2015-06-16','Pembelian','INV1606150001','1','7'),(39,'2015-06-16','Pembelian','INV1606150002','1','0'),(40,'2015-06-16','Pembelian','INV1606150002','2','2');

#
# Structure for table "po_bulan"
#

DROP TABLE IF EXISTS `po_bulan`;
CREATE TABLE `po_bulan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

#
# Data for table "po_bulan"
#

INSERT INTO `po_bulan` VALUES (1,'Januari','01'),(2,'Februari','02'),(3,'Maret','03'),(4,'April','04'),(5,'Mei','05'),(6,'Juni','06'),(7,'Juli','07'),(8,'Agustus','08'),(9,'September','09'),(10,'Oktober','10'),(11,'Nopember','11'),(12,'Desember','12');

#
# Structure for table "po_jenisproduk"
#

DROP TABLE IF EXISTS `po_jenisproduk`;
CREATE TABLE `po_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "po_jenisproduk"
#

INSERT INTO `po_jenisproduk` VALUES (4,'ALAT SEKOLAH');

#
# Structure for table "po_pembelian"
#

DROP TABLE IF EXISTS `po_pembelian`;
CREATE TABLE `po_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `notasupplier` varchar(100) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Hutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL,
  `hutang` varchar(50) NOT NULL DEFAULT '0',
  `termin` enum('0','14','21','30','60','90','120') NOT NULL DEFAULT '0',
  `tgltermin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

#
# Data for table "po_pembelian"
#

INSERT INTO `po_pembelian` VALUES (14,'INV1606150001','PO1606150001','2015-06-16','SUP01','','Tunai','3500000','0','3500000','3500000','0','0','','admin'),(15,'INV1606150002','PO1606150001','2015-06-16','SUP01','','Tunai','4700000','0','4700000','4700000','0','0','','admin');

#
# Structure for table "po_pembeliandetail"
#

DROP TABLE IF EXISTS `po_pembeliandetail`;
CREATE TABLE `po_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jenis` int(3) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

#
# Data for table "po_pembeliandetail"
#

INSERT INTO `po_pembeliandetail` VALUES (23,'INV1606150001','PO1606150001','1',0,'7','500000','0','3500000'),(24,'INV1606150002','PO1606150001','1',0,'0','500000','0','3500000'),(25,'INV1606150002','PO1606150001','2',0,'2','600000','0','1200000');

#
# Structure for table "po_pembelianretur"
#

DROP TABLE IF EXISTS `po_pembelianretur`;
CREATE TABLE `po_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "po_pembelianretur"
#

INSERT INTO `po_pembelianretur` VALUES (1,'RTB1905150001','INV1805150001','2015-05-19','SUP01','Tunai','250000','superadmin'),(2,'RTB0106150002','INV0106150004','2015-06-01','SUP01','Tunai','100000','admin'),(3,'RTB1206150003','INV1206150007','2015-06-12','SUP01','Tunai','20500000','admin'),(4,'RTB1206150004','INV1206150007','2015-06-12','SUP01','Tunai','20500000','admin');

#
# Structure for table "po_pembelianreturdetail"
#

DROP TABLE IF EXISTS `po_pembelianreturdetail`;
CREATE TABLE `po_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "po_pembelianreturdetail"
#

INSERT INTO `po_pembelianreturdetail` VALUES (1,'RTB1905150001','INV1805150001','KD001','5','50000','0','250000'),(2,'RTB0106150002','INV0106150004','KD001','2','50000','0','100000'),(3,'RTB1206150003','INV1206150007','123','1','500000','0','500000'),(4,'RTB1206150003','INV1206150007','14','2','10000000','0','20000000'),(5,'RTB1206150004','INV1206150007','123','0','500000','0','500000'),(6,'RTB1206150004','INV1206150007','14','0','10000000','0','20000000');

#
# Structure for table "po_pn"
#

DROP TABLE IF EXISTS `po_pn`;
CREATE TABLE `po_pn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopn` varchar(50) NOT NULL,
  `nopr` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Data for table "po_pn"
#

INSERT INTO `po_pn` VALUES (4,'NPN1606150001','PR1606150001','2015-06-16','admin'),(5,'NPN1806150002','PR1806150002','2015-06-18','admin'),(6,'NPN1906150003','PR1906150003','2015-06-19','admin'),(7,'NPN1906150004','PR1906150004','2015-06-19','admin');

#
# Structure for table "po_pndetail"
#

DROP TABLE IF EXISTS `po_pndetail`;
CREATE TABLE `po_pndetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopn` varchar(50) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

#
# Data for table "po_pndetail"
#

INSERT INTO `po_pndetail` VALUES (11,'NPN1606150001','CV.AAA','1','500000'),(12,'NPN1606150001','CA.GGG','2','600000'),(13,'NPN1806150002','','9','3000000'),(14,'NPN1906150003','asd','1','100000'),(15,'NPN1906150003','dsa','47','150000'),(16,'NPN1906150004','sup A','1','1000'),(17,'NPN1906150004','sup A','3','600'),(18,'NPN1906150004','sup B','1','800'),(19,'NPN1906150004','sup B','3','500');

#
# Structure for table "po_po"
#

DROP TABLE IF EXISTS `po_po`;
CREATE TABLE `po_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `nopr` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

#
# Data for table "po_po"
#

INSERT INTO `po_po` VALUES (13,'PO1606150001','PR1606150001','2015-06-16','SUP01','Tunai','0','8300000','0','8300000','admin'),(14,'PO1906150002','PR1906150004','2015-06-19','supatk','Tunai','0','8000','0','8000','admin');

#
# Structure for table "po_podetail"
#

DROP TABLE IF EXISTS `po_podetail`;
CREATE TABLE `po_podetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

#
# Data for table "po_podetail"
#

INSERT INTO `po_podetail` VALUES (1,'PO1805150001','KD001','5','50000','0','250000'),(2,'PO1805150002','KD001','10','50000','0','500000'),(3,'PO1805150003','KD001','1','50000','0','50000'),(4,'PO1805150004','KD001','1','50000','0','50000'),(6,'PO2505150006','B01','5','60000','0','300000'),(7,'PO0106150007','KD001','3','50000','0','150000'),(8,'PO0106150007','B01','1','60000','0','60000'),(9,'PO0106150008','KD001','5','50000','0','250000'),(10,'PO0106150008','B01','4','60000','0','240000'),(11,'PO1106150009','LO','1','100000','0','100000'),(12,'PO1106150010','LO','1','600000','0','600000'),(13,'PO1206150011','123','1','500000','0','500000'),(14,'PO1206150012','123','1','500000','0','500000'),(15,'PO1906150002','1','1','3000','0','3000'),(16,'PO1906150002','3','1','5000','0','5000');

#
# Structure for table "po_pr"
#

DROP TABLE IF EXISTS `po_pr`;
CREATE TABLE `po_pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopr` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `namapr` varchar(512) NOT NULL,
  `departemenpr` varchar(512) NOT NULL,
  `tujuanpr` varchar(512) NOT NULL,
  `kategorianggaran` varchar(5) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

#
# Data for table "po_pr"
#

INSERT INTO `po_pr` VALUES (12,'PR1606150001','2015-06-16','andre','8','meja rusak','16','admin'),(13,'PR1806150002','2015-06-18','ari','8','PC','1','admin'),(14,'PR1906150003','2015-06-19','test pr','15','atk rusak','16','admin'),(15,'PR1906150004','2015-06-19','siska','15','atk rusak','16','admin');

#
# Structure for table "po_prdetail"
#

DROP TABLE IF EXISTS `po_prdetail`;
CREATE TABLE `po_prdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopr` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `spesifikasi` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

#
# Data for table "po_prdetail"
#

INSERT INTO `po_prdetail` VALUES (14,'PR1606150001','1','7',''),(15,'PR1606150001','2','8',''),(16,'PR1806150002','9','1',''),(17,'PR1906150003','1','1',''),(18,'PR1906150003','47','1',''),(19,'PR1906150004','1','1',''),(20,'PR1906150004','3','1','');

#
# Structure for table "po_produk"
#

DROP TABLE IF EXISTS `po_produk`;
CREATE TABLE `po_produk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "po_produk"
#

INSERT INTO `po_produk` VALUES (1,4,'KD001','KURSI 2','62','50000','0'),(2,4,'B01','BANGKU','62','60000','0');

#
# Structure for table "po_situs"
#

DROP TABLE IF EXISTS `po_situs`;
CREATE TABLE `po_situs` (
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

#
# Data for table "po_situs"
#

/*!40000 ALTER TABLE `po_situs` DISABLE KEYS */;
INSERT INTO `po_situs` VALUES (1,'rekysda@gmail.com','PO & Pembelian','http://192.168.10.166/sister/purchaseorder/','Purchase Order','WebDesign dengan sistem Responsive','po,surabaya,indonesia',5,50,5,4,3,'pos','Elyon Christian School','Surabaya',1,1,12,1,2);
/*!40000 ALTER TABLE `po_situs` ENABLE KEYS */;

#
# Structure for table "po_supplier"
#

DROP TABLE IF EXISTS `po_supplier`;
CREATE TABLE `po_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "po_supplier"
#

INSERT INTO `po_supplier` VALUES (1,'SUP01','CV. MEDIA MANDIRI2','SURABAYA','SURABAYA'),(2,'supatk','supplier atk','supplier atk','123456');

#
# Structure for table "po_useraura"
#

DROP TABLE IF EXISTS `po_useraura`;
CREATE TABLE `po_useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','Payroll','HRD') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

#
# Data for table "po_useraura"
#

/*!40000 ALTER TABLE `po_useraura` DISABLE KEYS */;
INSERT INTO `po_useraura` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','admin@elyon.sch.id','af0675a9e843c6c8f78163a9118efc78.jpg','Administrator','aktif',1,'2015-05-12 09:15:46','2010-08-27 00:00:00','2034-08-27 00:00:00','<p><b>none</b></p>'),(28,'superadmin','b11d5ece6353d17f85c5ad30e0a02360','rekysda@gmail.com','','Administrator','aktif',1,'2015-03-21 23:05:28','0000-00-00 00:00:00','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `po_useraura` ENABLE KEYS */;
