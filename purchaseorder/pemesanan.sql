-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 21 Mei 2015 pada 12.55
-- Versi Server: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pemesanan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_alur_stok`
--

DROP TABLE IF EXISTS `po_alur_stok`;
CREATE TABLE IF NOT EXISTS `po_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data untuk tabel `po_alur_stok`
--

INSERT INTO `po_alur_stok` (`id`, `tgl`, `transaksi`, `kode`, `kodebarang`, `jumlah`) VALUES
(1, '2015-05-18', 'Saldo Awal', '-', 'KD001', '50'),
(2, '2015-05-18', 'Pembelian', 'INV1805150001', 'KD001', '5'),
(3, '2015-05-18', 'Pembelian', 'INV1805150001', 'KD001', '5'),
(4, '2015-05-18', 'Pembelian', 'INV1805150002', 'KD001', '1'),
(5, '2015-05-19', 'Retur Pembelian', 'RTB1905150001', 'KD001', '5'),
(6, '2015-05-19', 'Saldo Awal', '-', 'B01', '20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_bulan`
--

DROP TABLE IF EXISTS `po_bulan`;
CREATE TABLE IF NOT EXISTS `po_bulan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data untuk tabel `po_bulan`
--

INSERT INTO `po_bulan` (`id`, `nama`, `bulan`) VALUES
(1, 'Januari', '01'),
(2, 'Februari', '02'),
(3, 'Maret', '03'),
(4, 'April', '04'),
(5, 'Mei', '05'),
(6, 'Juni', '06'),
(7, 'Juli', '07'),
(8, 'Agustus', '08'),
(9, 'September', '09'),
(10, 'Oktober', '10'),
(11, 'Nopember', '11'),
(12, 'Desember', '12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_jenisproduk`
--

DROP TABLE IF EXISTS `po_jenisproduk`;
CREATE TABLE IF NOT EXISTS `po_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `po_jenisproduk`
--

INSERT INTO `po_jenisproduk` (`id`, `nama`) VALUES
(4, 'ALAT SEKOLAH');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_pembelian`
--

DROP TABLE IF EXISTS `po_pembelian`;
CREATE TABLE IF NOT EXISTS `po_pembelian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `po_pembelian`
--

INSERT INTO `po_pembelian` (`id`, `noinvoice`, `nopo`, `tgl`, `kodesupplier`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `hutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'INV1805150001', 'PO1805150001', '2015-05-18', 'SUP01', 'Tunai', '750000', '0', '750000', '750000', '0', '0', '', 'superadmin'),
(2, 'INV1805150002', 'PO1805150004', '2015-05-18', 'SUP01', 'Tunai', '50000', '0', '50000', '50000', '0', '0', '', 'superadmin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_pembeliandetail`
--

DROP TABLE IF EXISTS `po_pembeliandetail`;
CREATE TABLE IF NOT EXISTS `po_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jenis` int(3) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `po_pembeliandetail`
--

INSERT INTO `po_pembeliandetail` (`id`, `noinvoice`, `kodebarang`, `jenis`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'INV1805150001', 'KD001', 0, '5', '50000', '0', '250000'),
(2, 'INV1805150002', 'KD001', 0, '1', '50000', '0', '50000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_pembelianretur`
--

DROP TABLE IF EXISTS `po_pembelianretur`;
CREATE TABLE IF NOT EXISTS `po_pembelianretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `po_pembelianretur`
--

INSERT INTO `po_pembelianretur` (`id`, `noretur`, `noinvoice`, `tgl`, `kodesupplier`, `carabayar`, `total`, `user`) VALUES
(1, 'RTB1905150001', 'INV1805150001', '2015-05-19', 'SUP01', 'Tunai', '250000', 'superadmin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_pembelianreturdetail`
--

DROP TABLE IF EXISTS `po_pembelianreturdetail`;
CREATE TABLE IF NOT EXISTS `po_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `po_pembelianreturdetail`
--

INSERT INTO `po_pembelianreturdetail` (`id`, `noretur`, `noinvoice`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'RTB1905150001', 'INV1805150001', 'KD001', '5', '50000', '0', '250000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_po`
--

DROP TABLE IF EXISTS `po_po`;
CREATE TABLE IF NOT EXISTS `po_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `po_po`
--

INSERT INTO `po_po` (`id`, `nopo`, `tgl`, `kodesupplier`, `total`, `discount`, `netto`, `user`) VALUES
(1, 'PO1805150001', '2015-05-18', 'SUP01', '250000', '0', '250000', 'superadmin'),
(2, 'PO1805150002', '2015-05-18', 'SUP01', '500000', '0', '500000', 'superadmin'),
(3, 'PO1805150003', '2015-05-18', 'SUP01', '50000', '0', '50000', 'superadmin'),
(4, 'PO1805150004', '2015-05-18', 'SUP01', '50000', '0', '50000', 'superadmin'),
(5, 'PO1805150005', '2015-05-18', 'SUP01', '100000', '0', '100000', 'superadmin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_podetail`
--

DROP TABLE IF EXISTS `po_podetail`;
CREATE TABLE IF NOT EXISTS `po_podetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `po_podetail`
--

INSERT INTO `po_podetail` (`id`, `nopo`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'PO1805150001', 'KD001', '5', '50000', '0', '250000'),
(2, 'PO1805150002', 'KD001', '10', '50000', '0', '500000'),
(3, 'PO1805150003', 'KD001', '1', '50000', '0', '50000'),
(4, 'PO1805150004', 'KD001', '1', '50000', '0', '50000'),
(5, 'PO1805150005', 'KD001', '2', '50000', '0', '100000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_produk`
--

DROP TABLE IF EXISTS `po_produk`;
CREATE TABLE IF NOT EXISTS `po_produk` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `po_produk`
--

INSERT INTO `po_produk` (`id`, `jenis`, `kode`, `nama`, `jumlah`, `hargabeli`, `hargajual`) VALUES
(1, 4, 'KD001', 'KURSI 2', '56', '50000', '0'),
(2, 4, 'B01', 'BANGKU', '20', '60000', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_situs`
--

DROP TABLE IF EXISTS `po_situs`;
CREATE TABLE IF NOT EXISTS `po_situs` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `po_situs`
--

INSERT INTO `po_situs` (`id`, `email_master`, `judul_situs`, `url_situs`, `slogan`, `description`, `keywords`, `maxkonten`, `maxadmindata`, `maxdata`, `maxgalleri`, `widgetshare`, `theme`, `author`, `alamatkantor`, `publishwebsite`, `publishnews`, `maxgalleridata`, `widgetkomentar`, `widgetpenulis`) VALUES
(1, 'rekysda@gmail.com', 'PO & Pembelian', 'http://localhost/pemesanan/', 'Purchase Order', 'WebDesign dengan sistem Responsive', 'po,surabaya,indonesia', 5, 50, 5, 4, 3, 'pos', 'Elyon Christian School', 'Surabaya', 1, 1, 12, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_supplier`
--

DROP TABLE IF EXISTS `po_supplier`;
CREATE TABLE IF NOT EXISTS `po_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `po_supplier`
--

INSERT INTO `po_supplier` (`id`, `kode`, `nama`, `alamat`, `telepon`) VALUES
(1, 'SUP01', 'CV. MEDIA MANDIRI2', 'SURABAYA', 'SURABAYA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_useraura`
--

DROP TABLE IF EXISTS `po_useraura`;
CREATE TABLE IF NOT EXISTS `po_useraura` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data untuk tabel `po_useraura`
--

INSERT INTO `po_useraura` (`UserId`, `user`, `password`, `email`, `avatar`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `biodata`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@elyon.sch.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 1, '2015-05-12 09:15:46', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'rekysda@gmail.com', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
