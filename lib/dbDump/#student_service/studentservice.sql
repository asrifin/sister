-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2015 pada 09.57
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `pointofsales`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_alur_stok`
--

DROP TABLE IF EXISTS `pos_alur_stok`;
CREATE TABLE IF NOT EXISTS `pos_alur_stok` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data untuk tabel `pos_alur_stok`
--

INSERT INTO `pos_alur_stok` (`id`, `tgl`, `transaksi`, `kode`, `kodebarang`, `jumlah`) VALUES
(2, '2015-05-01', 'Saldo Awal', '-', '008', '100'),
(3, '2015-05-01', 'Saldo Awal', '-', 'BK001', '63'),
(4, '2015-05-01', 'Saldo Awal', '-', '002', '49'),
(5, '2015-05-01', 'Saldo Awal', '-', '003', '47'),
(6, '2015-05-01', 'Saldo Awal', '-', '004', '50'),
(7, '2015-05-02', 'Penjualan', 'FAK2405150001', '004', '1'),
(8, '2015-05-01', 'saldo awal', '-', '005', '82'),
(9, '2015-05-01', 'saldo awal', '-', '006', '66'),
(10, '2015-05-01', 'saldo awal', '-', '007', '47'),
(11, '2015-06-01', 'Pembelian', 'INV0106150001', '008', '2'),
(12, '2015-06-01', 'Pembelian', 'INV0106150001', '001', '1'),
(13, '2015-06-01', 'Retur Pembelian', 'RTB0106150001', '008', '2'),
(14, '2015-06-01', 'Retur Pembelian', 'RTB0106150001', '001', '1'),
(15, '2015-06-01', 'Penjualan', 'FAK0106150002', '008', '5'),
(16, '2015-06-01', 'Penjualan', 'FAK0106150002', '003', '3'),
(17, '2015-06-01', 'Penjualan', 'FAK0106150003', '008', '2'),
(18, '2015-06-01', 'Penjualan', 'FAK0106150003', '001', '1'),
(19, '2015-06-06', 'Pembelian', 'INV0606150002', '001', '1'),
(20, '2015-06-06', 'Pembelian', 'INV0606150002', '008', '1'),
(21, '2015-06-06', 'Pembelian', 'INV0606150003', 'BK001', '1'),
(22, '2015-06-06', 'Penjualan', 'FAK0606150004', 'BK001', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_biayabulanan`
--

DROP TABLE IF EXISTS `pos_biayabulanan`;
CREATE TABLE IF NOT EXISTS `pos_biayabulanan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_biayabulanan`
--

INSERT INTO `pos_biayabulanan` (`id`, `tgl`, `nama`, `subtotal`) VALUES
(1, '2015-05-30', 'LISTRIK', '500000'),
(2, '2015-06-06', 'AIR', '50000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_bulan`
--

DROP TABLE IF EXISTS `pos_bulan`;
CREATE TABLE IF NOT EXISTS `pos_bulan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data untuk tabel `pos_bulan`
--

INSERT INTO `pos_bulan` (`id`, `nama`, `bulan`) VALUES
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
-- Struktur dari tabel `pos_customer`
--

DROP TABLE IF EXISTS `pos_customer`;
CREATE TABLE IF NOT EXISTS `pos_customer` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_customer`
--

INSERT INTO `pos_customer` (`id`, `kode`, `nama`) VALUES
(2, '234', 'SEKOLAH');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_jenisjasa`
--

DROP TABLE IF EXISTS `pos_jenisjasa`;
CREATE TABLE IF NOT EXISTS `pos_jenisjasa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_jenisproduk`
--

DROP TABLE IF EXISTS `pos_jenisproduk`;
CREATE TABLE IF NOT EXISTS `pos_jenisproduk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data untuk tabel `pos_jenisproduk`
--

INSERT INTO `pos_jenisproduk` (`id`, `nama`) VALUES
(1, 'SERAGAM'),
(3, 'BUKU'),
(4, 'FOTOKOPI'),
(5, 'ATK'),
(6, 'FORM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_jenjang`
--

DROP TABLE IF EXISTS `pos_jenjang`;
CREATE TABLE IF NOT EXISTS `pos_jenjang` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `pos_jenjang`
--

INSERT INTO `pos_jenjang` (`id`, `nama`) VALUES
(1, 'Playgroup'),
(2, 'Kindegarden'),
(3, 'Elementary'),
(4, 'Primary'),
(5, 'Tidak Ada');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_kelas`
--

DROP TABLE IF EXISTS `pos_kelas`;
CREATE TABLE IF NOT EXISTS `pos_kelas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_kelas`
--

INSERT INTO `pos_kelas` (`id`, `nama`, `jenjang`) VALUES
(1, 'A', '3'),
(2, 'B', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_pembelian`
--

DROP TABLE IF EXISTS `pos_pembelian`;
CREATE TABLE IF NOT EXISTS `pos_pembelian` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `pos_pembelian`
--

INSERT INTO `pos_pembelian` (`id`, `noinvoice`, `nopo`, `tgl`, `kodesupplier`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `hutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'INV0106150001', '', '2015-06-01', 'SUP111', 'Tunai', '225000', '0', '225000', '225000', '0', '0', '', 'admin'),
(2, 'INV0606150002', '', '2015-06-06', 'SUP111', 'Tunai', '150000', '0', '150000', '150000', '0', '0', '', 'admin'),
(3, 'INV0606150003', '', '2015-06-06', 'SUP111', 'Tunai', '25000', '0', '25000', '25000', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_pembeliandetail`
--

DROP TABLE IF EXISTS `pos_pembeliandetail`;
CREATE TABLE IF NOT EXISTS `pos_pembeliandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jenis` int(3) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `pos_pembeliandetail`
--

INSERT INTO `pos_pembeliandetail` (`id`, `noinvoice`, `kodebarang`, `jenis`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'INV0106150001', '008', 1, '2', '55000', '0', '110000'),
(2, 'INV0106150001', '001', 1, '1', '115000', '0', '115000'),
(3, 'INV0606150002', '001', 1, '1', '100000', '0', '100000'),
(4, 'INV0606150002', '008', 1, '1', '50000', '0', '50000'),
(5, 'INV0606150003', 'BK001', 3, '1', '25000', '0', '25000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_pembelianretur`
--

DROP TABLE IF EXISTS `pos_pembelianretur`;
CREATE TABLE IF NOT EXISTS `pos_pembelianretur` (
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
-- Dumping data untuk tabel `pos_pembelianretur`
--

INSERT INTO `pos_pembelianretur` (`id`, `noretur`, `noinvoice`, `tgl`, `kodesupplier`, `carabayar`, `total`, `user`) VALUES
(1, 'RTB0106150001', 'INV0106150001', '2015-06-01', 'SUP111', 'Tunai', '225000', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_pembelianreturdetail`
--

DROP TABLE IF EXISTS `pos_pembelianreturdetail`;
CREATE TABLE IF NOT EXISTS `pos_pembelianreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_pembelianreturdetail`
--

INSERT INTO `pos_pembelianreturdetail` (`id`, `noretur`, `noinvoice`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'RTB0106150001', 'INV0106150001', '008', '2', '55000', '0', '110000'),
(2, 'RTB0106150001', 'INV0106150001', '001', '1', '115000', '0', '115000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualan`
--

DROP TABLE IF EXISTS `pos_penjualan`;
CREATE TABLE IF NOT EXISTS `pos_penjualan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `pos_penjualan`
--

INSERT INTO `pos_penjualan` (`id`, `nofaktur`, `tgl`, `kodecustomer`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `piutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'FAK2405150001', '2015-05-02', '599', 'Pemesanan', '125000', '0', '125000', '0', '125000', '0', '2015-05-2', 'penjualan'),
(2, 'FAK0106150002', '2015-06-01', '633', 'Tunai', '635000', '0', '635000', '635000', '0', '0', '', 'admin'),
(3, 'FAK0106150003', '2015-06-01', '1005', 'Tunai', '225000', '0', '225000', '225000', '0', '0', '2015-06-1', 'penjualan'),
(4, 'FAK0606150004', '2015-06-06', '1004', 'Tunai', '30000', '0', '30000', '30000', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanbiaya`
--

DROP TABLE IF EXISTS `pos_penjualanbiaya`;
CREATE TABLE IF NOT EXISTS `pos_penjualanbiaya` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_penjualanbiaya`
--

INSERT INTO `pos_penjualanbiaya` (`id`, `nofaktur`, `tgl`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `user`) VALUES
(1, 'FKB3005150001', '2015-05-30', 'Tunai', '500000', '0', '500000', '500000', 'admin'),
(2, 'FKB0106150002', '2015-06-01', 'Tunai', '550000', '0', '550000', '550000', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanbiayadetail`
--

DROP TABLE IF EXISTS `pos_penjualanbiayadetail`;
CREATE TABLE IF NOT EXISTS `pos_penjualanbiayadetail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_penjualanbiayadetail`
--

INSERT INTO `pos_penjualanbiayadetail` (`id`, `nofaktur`, `kodebiaya`, `jenis`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FKB3005150001', 'GURU PRAMUKA', 6, '1', '500000', '0', '0', '500000'),
(2, 'FKB0106150002', 'GURU PRAMUKA', 6, '1', '550000', '0', '0', '550000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualandetail`
--

DROP TABLE IF EXISTS `pos_penjualandetail`;
CREATE TABLE IF NOT EXISTS `pos_penjualandetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nofaktur` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jenis` int(4) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data untuk tabel `pos_penjualandetail`
--

INSERT INTO `pos_penjualandetail` (`id`, `nofaktur`, `kodebarang`, `jenis`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FAK2405150001', '004', 1, '1', '125000', '120000', '0', '125000'),
(2, 'FAK0106150002', '008', 1, '5', '55000', '50000', '0', '275000'),
(3, 'FAK0106150002', '003', 1, '3', '120000', '115000', '0', '360000'),
(4, 'FAK0106150003', '008', 1, '2', '55000', '50000', '0', '110000'),
(5, 'FAK0106150003', '001', 1, '1', '115000', '100000', '0', '115000'),
(6, 'FAK0606150004', 'BK001', 3, '1', '30000', '25000', '0', '30000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanjasa`
--

DROP TABLE IF EXISTS `pos_penjualanjasa`;
CREATE TABLE IF NOT EXISTS `pos_penjualanjasa` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `pos_penjualanjasa`
--

INSERT INTO `pos_penjualanjasa` (`id`, `nofaktur`, `tgl`, `kodecustomer`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `piutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'FKJ0106150001', '2015-06-01', '234', 'Tunai', '10000', '0', '10000', '10000', '0', '0', '', 'admin'),
(2, 'FKJ0606150002', '2015-06-06', '1005', 'Tunai', '10000', '0', '10000', '10000', '0', '0', '', 'admin'),
(3, 'FKJ0606150003', '2015-06-06', '633', 'Tunai', '10000', '0', '10000', '10000', '0', '0', '', 'admin'),
(4, 'FKJ0606150004', '2015-06-06', '1004', 'Tunai', '10000', '0', '10000', '10000', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanjasadetail`
--

DROP TABLE IF EXISTS `pos_penjualanjasadetail`;
CREATE TABLE IF NOT EXISTS `pos_penjualanjasadetail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `pos_penjualanjasadetail`
--

INSERT INTO `pos_penjualanjasadetail` (`id`, `nofaktur`, `kodejasa`, `jenis`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FKJ0106150001', 'PRAMUKA', 6, '1', '10000', '0', '0', '10000'),
(2, 'FKJ0606150002', 'BL01', 6, '1', '10000', '0', '0', '10000'),
(3, 'FKJ0606150003', 'BL01', 6, '1', '10000', '0', '0', '10000'),
(4, 'FKJ0606150004', 'BL01', 6, '1', '10000', '0', '0', '10000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanretur`
--

DROP TABLE IF EXISTS `pos_penjualanretur`;
CREATE TABLE IF NOT EXISTS `pos_penjualanretur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanreturdetail`
--

DROP TABLE IF EXISTS `pos_penjualanreturdetail`;
CREATE TABLE IF NOT EXISTS `pos_penjualanreturdetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_po`
--

DROP TABLE IF EXISTS `pos_po`;
CREATE TABLE IF NOT EXISTS `pos_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_podetail`
--

DROP TABLE IF EXISTS `pos_podetail`;
CREATE TABLE IF NOT EXISTS `pos_podetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_produk`
--

DROP TABLE IF EXISTS `pos_produk`;
CREATE TABLE IF NOT EXISTS `pos_produk` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data untuk tabel `pos_produk`
--

INSERT INTO `pos_produk` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `jumlah`, `hargabeli`, `hargajual`) VALUES
(15, 1, '2', '001', 'BLOUSE PUTRI ', '50', '100000', '115000'),
(16, 1, '2', '002', 'JUMPER PUTRI', '49', '127000', '130000'),
(17, 1, '2', '003', 'KEMEJA PUTRA', '44', '115000', '120000'),
(18, 1, '2', '004', 'CELANA PUTRA', '49', '120000', '125000'),
(19, 1, '2', '005', 'DASI', '82', '48000', '50000'),
(20, 1, '2', '006', 'KAOS OLAH RAGA', '66', '72000', '75000'),
(21, 1, '2', '007', 'CELANA OLAH RAGA', '47', '72000', '75000'),
(22, 1, '2', '008', 'TOPI', '94', '50000', '55000'),
(23, 3, '3', 'BK001', 'BUKU LKS ENGLISH', '63', '25000', '30000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_produkbiaya`
--

DROP TABLE IF EXISTS `pos_produkbiaya`;
CREATE TABLE IF NOT EXISTS `pos_produkbiaya` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_produkbiaya`
--

INSERT INTO `pos_produkbiaya` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `hargajual`) VALUES
(2, 6, '5', 'GURU PRAMUKA', 'GURU PRAMUKA', '500000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_produkjasa`
--

DROP TABLE IF EXISTS `pos_produkjasa`;
CREATE TABLE IF NOT EXISTS `pos_produkjasa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  UNIQUE KEY `kode_2` (`kode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data untuk tabel `pos_produkjasa`
--

INSERT INTO `pos_produkjasa` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `hargajual`) VALUES
(6, 4, '5', 'FOTOKOPI', 'FOTOKOPI', '100000'),
(7, 6, '5', 'PRAMUKA', 'PRAMUKA', '10000'),
(8, 6, '4', 'BL01', 'BALET 01', '10000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_situs`
--

DROP TABLE IF EXISTS `pos_situs`;
CREATE TABLE IF NOT EXISTS `pos_situs` (
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
-- Dumping data untuk tabel `pos_situs`
--

INSERT INTO `pos_situs` (`id`, `email_master`, `judul_situs`, `url_situs`, `slogan`, `description`, `keywords`, `maxkonten`, `maxadmindata`, `maxdata`, `maxgalleri`, `widgetshare`, `theme`, `author`, `alamatkantor`, `publishwebsite`, `publishnews`, `maxgalleridata`, `widgetkomentar`, `widgetpenulis`) VALUES
(1, 'rekysda@gmail.com', 'Student Service', 'http://localhost/sister/studentservice/', 'Student Service', 'WebDesign dengan sistem Responsive', 'student service,surabaya,indonesia', 5, 50, 5, 4, 3, 'pos', 'Elyon Christian School', 'Surabaya', 1, 1, 12, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_supplier`
--

DROP TABLE IF EXISTS `pos_supplier`;
CREATE TABLE IF NOT EXISTS `pos_supplier` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `pos_supplier`
--

INSERT INTO `pos_supplier` (`id`, `kode`, `nama`, `alamat`, `telepon`) VALUES
(1, 'SUP0019', 'CV. MAJU BERKAH', 'JAKARTA', '0215469856'),
(2, 'SUP111', 'CV. ADIPERKASA', 'SIDOARJO', '0312568899'),
(3, '111', 'PT. ADI JAYA', 'SURABAYA', '0315689523');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_useraura`
--

DROP TABLE IF EXISTS `pos_useraura`;
CREATE TABLE IF NOT EXISTS `pos_useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','Penjualan','Kasir') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data untuk tabel `pos_useraura`
--

INSERT INTO `pos_useraura` (`UserId`, `user`, `password`, `email`, `avatar`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `biodata`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@elyon.sch.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 1, '2015-06-05 10:52:16', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'rekysda@gmail.com', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(29, 'penjualan', '13bf2c8effae21d17a277520aa9b9277', 'penjualan@penjualan.com', '', 'Penjualan', 'aktif', 0, '2015-06-01 09:03:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(30, 'kasir', 'c7911af3adbd12a035b289556d96470a', 'kasir@kasir.com', '', 'Kasir', 'aktif', 0, '2015-05-30 07:49:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
