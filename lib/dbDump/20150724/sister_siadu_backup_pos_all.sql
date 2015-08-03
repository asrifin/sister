-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24 Jul 2015 pada 08.18
-- Versi Server: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sister_siadu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_alur_stok`
--

DROP TABLE IF EXISTS `pos_alur_stok`;
CREATE TABLE IF NOT EXISTS `pos_alur_stok` (
`id` int(4) NOT NULL,
  `tgl` date NOT NULL,
  `transaksi` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

--
-- Dumping data untuk tabel `pos_alur_stok`
--

INSERT INTO `pos_alur_stok` (`id`, `tgl`, `transaksi`, `kode`, `kodebarang`, `jumlah`) VALUES
(88, '2015-07-02', 'stok awal', '-', '001', '60'),
(89, '2015-07-02', 'stok awal', '-', '002', '77'),
(90, '2015-07-02', 'stok awal', '-', '003', '44'),
(91, '2015-07-02', 'stok awal', '-', '004', '77'),
(92, '2015-07-02', 'stok awal', '-', '005', '40'),
(93, '2015-07-02', 'stok awal', '-', '006', '60'),
(94, '2015-07-02', 'stok awal', '-', '007', '33'),
(95, '2015-07-02', 'stok awal', '-', '008', '5'),
(98, '2015-07-02', 'stok awal', '-', 'BK001', '55'),
(100, '2015-07-02', 'Penjualan', 'FAK0207150001', '008', '2'),
(101, '2015-07-02', 'Penjualan', 'FAK0207150002', 'BK001', '1'),
(102, '2015-07-07', 'Stok Awal', '-', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '98'),
(103, '2015-07-07', 'Pembelian', 'INV0707150002', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '8'),
(104, '2015-07-07', 'stok awal', '-', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '98'),
(105, '2015-07-07', 'stok awal', '-', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '98'),
(106, '2015-07-07', 'Stok Awal', '-', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '98');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_biayabulanan`
--

DROP TABLE IF EXISTS `pos_biayabulanan`;
CREATE TABLE IF NOT EXISTS `pos_biayabulanan` (
`id` int(10) NOT NULL,
  `tgl` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_biayabulanan`
--

INSERT INTO `pos_biayabulanan` (`id`, `tgl`, `nama`, `subtotal`) VALUES
(1, '2015-07-01', 'LISTRIK', '500000'),
(2, '2015-07-01', 'AIR', '50000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_bulan`
--

DROP TABLE IF EXISTS `pos_bulan`;
CREATE TABLE IF NOT EXISTS `pos_bulan` (
`id` int(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL
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
`id` int(5) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_jenisjasa`
--

DROP TABLE IF EXISTS `pos_jenisjasa`;
CREATE TABLE IF NOT EXISTS `pos_jenisjasa` (
`id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_jenisproduk`
--

DROP TABLE IF EXISTS `pos_jenisproduk`;
CREATE TABLE IF NOT EXISTS `pos_jenisproduk` (
`id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis` enum('BARANG','JASA') NOT NULL DEFAULT 'BARANG'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data untuk tabel `pos_jenisproduk`
--

INSERT INTO `pos_jenisproduk` (`id`, `nama`, `jenis`) VALUES
(1, 'SERAGAM', 'BARANG'),
(3, 'BUKU', 'BARANG'),
(7, 'FORMULIR PSIKOTEST', 'BARANG'),
(9, 'FOOD BEVERAGES', 'BARANG'),
(10, 'EKSTRAKURIKULER', 'JASA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_jenjang`
--

DROP TABLE IF EXISTS `pos_jenjang`;
CREATE TABLE IF NOT EXISTS `pos_jenjang` (
`id` int(5) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data untuk tabel `pos_jenjang`
--

INSERT INTO `pos_jenjang` (`id`, `nama`) VALUES
(1, 'Play Group A'),
(5, 'Tidak Ada'),
(6, 'Primary 1'),
(7, 'Primary 2'),
(8, 'Primary 3'),
(9, 'Primary 4'),
(10, 'Primary 5'),
(11, 'Primary 6'),
(12, 'Secondary 1'),
(13, 'Secondary 2'),
(14, 'Secondary 3'),
(15, 'Secondary 4'),
(16, 'High School 11'),
(17, 'High School 12'),
(18, 'Play Group B'),
(19, 'Kindergarten A'),
(20, 'Kindergarten B');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_kelas`
--

DROP TABLE IF EXISTS `pos_kelas`;
CREATE TABLE IF NOT EXISTS `pos_kelas` (
`id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenjang` varchar(50) NOT NULL
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
`id` int(11) NOT NULL,
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
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_pembelian`
--

INSERT INTO `pos_pembelian` (`id`, `noinvoice`, `nopo`, `tgl`, `kodesupplier`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `hutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'INV0207150001', 'PO0207150001', '2015-07-02', 'SUP0019', 'Hutang', '635000', '0', '635000', '635000', '0', '30', '2015-08-1', 'admin'),
(2, 'INV0707150002', 'PO0707150004', '2015-07-07', 'SUP0019', 'Hutang', '159120', '0', '159120', '0', '159120', '', '1970-01-1', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_pembeliandetail`
--

DROP TABLE IF EXISTS `pos_pembeliandetail`;
CREATE TABLE IF NOT EXISTS `pos_pembeliandetail` (
`id` int(10) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_pembeliandetail`
--

INSERT INTO `pos_pembeliandetail` (`id`, `noinvoice`, `nopo`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'INV0207150001', 'PO0207150001', '002', '5', '127000', '0', '635000'),
(2, 'INV0707150002', 'PO0707150004', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '8', '22100', '10', '159120');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_pembelianretur`
--

DROP TABLE IF EXISTS `pos_pembelianretur`;
CREATE TABLE IF NOT EXISTS `pos_pembelianretur` (
`id` int(11) NOT NULL,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_pembelianreturdetail`
--

DROP TABLE IF EXISTS `pos_pembelianreturdetail`;
CREATE TABLE IF NOT EXISTS `pos_pembelianreturdetail` (
`id` int(10) NOT NULL,
  `noretur` varchar(50) NOT NULL,
  `noinvoice` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualan`
--

DROP TABLE IF EXISTS `pos_penjualan`;
CREATE TABLE IF NOT EXISTS `pos_penjualan` (
`id` int(11) NOT NULL,
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
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_penjualan`
--

INSERT INTO `pos_penjualan` (`id`, `nofaktur`, `nopo`, `tgl`, `kodecustomer`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `piutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'FAK0207150001', 'POF0207150001', '2015-07-02', '1005', 'Tunai', '110000', '0', '110000', '110000', '0', '0', '2015-07-2', 'admin'),
(2, 'FAK0207150002', 'POF0207150002', '2015-07-02', '1005', 'Tunai', '30000', '0', '30000', '30000', '0', '0', '2015-07-2', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanbiaya`
--

DROP TABLE IF EXISTS `pos_penjualanbiaya`;
CREATE TABLE IF NOT EXISTS `pos_penjualanbiaya` (
`id` int(11) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `carabayar` enum('Tunai','Debet Card','Piutang') NOT NULL DEFAULT 'Tunai',
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `bayar` varchar(50) NOT NULL DEFAULT '0',
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_penjualanbiaya`
--

INSERT INTO `pos_penjualanbiaya` (`id`, `nofaktur`, `tgl`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `user`) VALUES
(1, 'FKB0207150001', '2015-07-02', 'Tunai', '1000', '0', '1000', '1000', 'admin'),
(2, 'FKB0207150002', '2015-07-02', 'Tunai', '7000', '0', '7000', '7000', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanbiayadetail`
--

DROP TABLE IF EXISTS `pos_penjualanbiayadetail`;
CREATE TABLE IF NOT EXISTS `pos_penjualanbiayadetail` (
`id` int(10) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `kodebiaya` varchar(50) NOT NULL,
  `jenis` int(2) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_penjualanbiayadetail`
--

INSERT INTO `pos_penjualanbiayadetail` (`id`, `nofaktur`, `kodebiaya`, `jenis`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FKB0207150001', 'BTRP01', 3, '1', '1000', '0', '0', '1000'),
(2, 'FKB0207150002', 'GURU PRAMUKA', 6, '1', '7000', '0', '0', '7000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualandetail`
--

DROP TABLE IF EXISTS `pos_penjualandetail`;
CREATE TABLE IF NOT EXISTS `pos_penjualandetail` (
`id` int(10) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `jenis` varchar(5) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_penjualandetail`
--

INSERT INTO `pos_penjualandetail` (`id`, `nofaktur`, `nopo`, `jenis`, `kodebarang`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FAK0207150001', 'POF0207150001', '1', '008', '2', '55000', '50000', '0', '110000'),
(2, 'FAK0207150002', 'POF0207150002', '3', 'BK001', '1', '30000', '25000', '0', '30000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanjasa`
--

DROP TABLE IF EXISTS `pos_penjualanjasa`;
CREATE TABLE IF NOT EXISTS `pos_penjualanjasa` (
`id` int(11) NOT NULL,
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
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `pos_penjualanjasa`
--

INSERT INTO `pos_penjualanjasa` (`id`, `nofaktur`, `tgl`, `kodecustomer`, `carabayar`, `total`, `discount`, `netto`, `bayar`, `piutang`, `termin`, `tgltermin`, `user`) VALUES
(1, 'FKJ0207150001', '2015-07-02', '599', 'Tunai', '60000', '0', '60000', '60000', '0', '0', '', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanjasadetail`
--

DROP TABLE IF EXISTS `pos_penjualanjasadetail`;
CREATE TABLE IF NOT EXISTS `pos_penjualanjasadetail` (
`id` int(10) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `kodejasa` varchar(50) NOT NULL,
  `jenis` int(4) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL DEFAULT '0',
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_penjualanjasadetail`
--

INSERT INTO `pos_penjualanjasadetail` (`id`, `nofaktur`, `kodejasa`, `jenis`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'FKJ0207150001', '10', 6, '4', '10000', '0', '0', '40000'),
(2, 'FKJ0207150001', '2', 6, '4', '5000', '0', '0', '20000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanretur`
--

DROP TABLE IF EXISTS `pos_penjualanretur`;
CREATE TABLE IF NOT EXISTS `pos_penjualanretur` (
`id` int(11) NOT NULL,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_penjualanreturdetail`
--

DROP TABLE IF EXISTS `pos_penjualanreturdetail`;
CREATE TABLE IF NOT EXISTS `pos_penjualanreturdetail` (
`id` int(10) NOT NULL,
  `noretur` varchar(50) NOT NULL,
  `nofaktur` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_po`
--

DROP TABLE IF EXISTS `pos_po`;
CREATE TABLE IF NOT EXISTS `pos_po` (
`id` int(11) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodesupplier` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `pos_po`
--

INSERT INTO `pos_po` (`id`, `nopo`, `tgl`, `kodesupplier`, `carabayar`, `total`, `discount`, `netto`, `termin`, `user`) VALUES
(1, 'PO0207150001', '2015-07-02', 'SUP0019', 'Hutang', '635000', '0', '0', '30', 'admin'),
(2, 'PO0707150002', '2015-07-07', 'SUP111', 'Tunai', '2165800', '0', '0', '0', 'admin'),
(3, 'PO0707150003', '2015-07-07', 'SUP0019', 'Hutang', '20995', '0', '0', '30', 'admin'),
(4, 'PO0707150004', '2015-07-07', 'SUP0019', 'Hutang', '198900', '0', '0', '30', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_podetail`
--

DROP TABLE IF EXISTS `pos_podetail`;
CREATE TABLE IF NOT EXISTS `pos_podetail` (
`id` int(10) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `pos_podetail`
--

INSERT INTO `pos_podetail` (`id`, `nopo`, `kodebarang`, `jumlah`, `harga`, `subdiscount`, `subtotal`) VALUES
(1, 'PO0207150001', '002', '5', '127000', '0', '635000'),
(2, 'PO0707150002', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '98', '22100', '0', '2165800'),
(3, 'PO0707150003', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '1', '22100', '5', '20995'),
(4, 'PO0707150004', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD P', '10', '22100', '10', '198900');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_popenjualan`
--

DROP TABLE IF EXISTS `pos_popenjualan`;
CREATE TABLE IF NOT EXISTS `pos_popenjualan` (
`id` int(11) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `tgl` varchar(10) NOT NULL,
  `kodecustomer` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `netto` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_popenjualan`
--

INSERT INTO `pos_popenjualan` (`id`, `nopo`, `tgl`, `kodecustomer`, `carabayar`, `total`, `discount`, `netto`, `termin`, `user`) VALUES
(1, 'POF0207150001', '2015-07-02', '1005', 'Pemesanan', '110000', '0', '110000', '0', 'admin'),
(2, 'POF0207150002', '2015-07-02', '1005', 'Pemesanan', '30000', '0', '30000', '0', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_popenjualandetail`
--

DROP TABLE IF EXISTS `pos_popenjualandetail`;
CREATE TABLE IF NOT EXISTS `pos_popenjualandetail` (
`id` int(10) NOT NULL,
  `nopo` varchar(50) NOT NULL,
  `kodebarang` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `subdiscount` varchar(50) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `pos_popenjualandetail`
--

INSERT INTO `pos_popenjualandetail` (`id`, `nopo`, `kodebarang`, `jumlah`, `harga`, `hargabeli`, `subdiscount`, `subtotal`) VALUES
(1, 'POF0207150001', '008', '2', '55000', '50000', '0', '110000'),
(2, 'POF0207150002', 'BK001', '1', '30000', '25000', '0', '30000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_produk`
--

DROP TABLE IF EXISTS `pos_produk`;
CREATE TABLE IF NOT EXISTS `pos_produk` (
`id` int(5) NOT NULL,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `hargabeli` varchar(50) NOT NULL,
  `hargajual` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data untuk tabel `pos_produk`
--

INSERT INTO `pos_produk` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `jumlah`, `hargabeli`, `hargajual`) VALUES
(24, 3, '6', 'P 1 BI Gemar Berbahasa Indonesia 1A  ERLANGGA PD PURNAMA RAYA', 'Gemar Berbahasa Indonesia 1A', '98', '22100', '28900');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_produkbiaya`
--

DROP TABLE IF EXISTS `pos_produkbiaya`;
CREATE TABLE IF NOT EXISTS `pos_produkbiaya` (
`id` int(5) NOT NULL,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `pos_produkbiaya`
--

INSERT INTO `pos_produkbiaya` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `hargajual`) VALUES
(2, 6, '5', 'GURU PRAMUKA', 'GURU PRAMUKA', '100000'),
(3, 3, '5', 'BTRP01', 'BIAYA TRANSPORTASI BUKU', '1000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_produkjasa`
--

DROP TABLE IF EXISTS `pos_produkjasa`;
CREATE TABLE IF NOT EXISTS `pos_produkjasa` (
`id` int(5) NOT NULL,
  `jenis` int(5) NOT NULL,
  `jenjang` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `hargajual` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data untuk tabel `pos_produkjasa`
--

INSERT INTO `pos_produkjasa` (`id`, `jenis`, `jenjang`, `kode`, `nama`, `hargajual`) VALUES
(11, 10, '11', '11', 'PIANO', '400000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_supplier`
--

DROP TABLE IF EXISTS `pos_supplier`;
CREATE TABLE IF NOT EXISTS `pos_supplier` (
`id` int(5) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(50) NOT NULL,
  `carabayar` varchar(50) NOT NULL,
  `termin` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data untuk tabel `pos_supplier`
--

INSERT INTO `pos_supplier` (`id`, `kode`, `nama`, `alamat`, `telepon`, `carabayar`, `termin`) VALUES
(4, '01', 'PD. PURNAMA RAYA', 'CITRALAND SURABAYA', '0317344875, 0317344492, FAX 0317385162', 'Hutang', '14 HARI'),
(5, '02', 'NASYWAH.COM', 'JL. GUBENG KERTAJAYA 7 F / 10 SURABAYA', '03177751622, 081703708991', 'Hutang', '14 HARI'),
(6, '03', 'MENTARI BOOKS', 'JL. DARMO PERMAI SELATAN SURABAYA', '02158900818', 'Hutang', '14 HARI'),
(7, '04', 'PENERBIT ERLANGGA', 'JL. BERBEK INDUSTRI VII / 15 SURABAYA', '0318687910-12 FAX 0318687913', 'Hutang', '90 HARI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_useraura`
--

DROP TABLE IF EXISTS `pos_useraura`;
CREATE TABLE IF NOT EXISTS `pos_useraura` (
`UserId` int(15) NOT NULL,
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
  `biodata` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data untuk tabel `pos_useraura`
--

INSERT INTO `pos_useraura` (`UserId`, `user`, `password`, `email`, `avatar`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `biodata`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@elyon.sch.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 0, '2015-07-10 08:09:42', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'rekysda@gmail.com', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(29, 'penjualan', '13bf2c8effae21d17a277520aa9b9277', 'penjualan@penjualan.com', '', 'Penjualan', 'aktif', 0, '2015-06-01 09:03:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(30, 'kasir', 'c7911af3adbd12a035b289556d96470a', 'kasir@kasir.com', '', 'Kasir', 'aktif', 0, '2015-07-07 14:56:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(31, 'gudang', '202446dd1d6028084426867365b0c7a1', 'gudang@gudang.com', '', 'Gudang', 'aktif', 0, '2015-07-02 12:52:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(32, 'accounting', 'd4c143f004d88b7286e6f999dea9d0d7', 'accounting@accounting.com', '', 'Accounting', 'aktif', 0, '2015-07-07 15:13:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pos_alur_stok`
--
ALTER TABLE `pos_alur_stok`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_biayabulanan`
--
ALTER TABLE `pos_biayabulanan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_bulan`
--
ALTER TABLE `pos_bulan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_customer`
--
ALTER TABLE `pos_customer`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `pos_jenisjasa`
--
ALTER TABLE `pos_jenisjasa`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_jenisproduk`
--
ALTER TABLE `pos_jenisproduk`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_jenjang`
--
ALTER TABLE `pos_jenjang`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_kelas`
--
ALTER TABLE `pos_kelas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_pembelian`
--
ALTER TABLE `pos_pembelian`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_pembeliandetail`
--
ALTER TABLE `pos_pembeliandetail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_pembelianretur`
--
ALTER TABLE `pos_pembelianretur`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_pembelianreturdetail`
--
ALTER TABLE `pos_pembelianreturdetail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_penjualan`
--
ALTER TABLE `pos_penjualan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_penjualanbiaya`
--
ALTER TABLE `pos_penjualanbiaya`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_penjualanbiayadetail`
--
ALTER TABLE `pos_penjualanbiayadetail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_penjualandetail`
--
ALTER TABLE `pos_penjualandetail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_penjualanjasa`
--
ALTER TABLE `pos_penjualanjasa`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_penjualanjasadetail`
--
ALTER TABLE `pos_penjualanjasadetail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_penjualanretur`
--
ALTER TABLE `pos_penjualanretur`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_penjualanreturdetail`
--
ALTER TABLE `pos_penjualanreturdetail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_po`
--
ALTER TABLE `pos_po`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_podetail`
--
ALTER TABLE `pos_podetail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_popenjualan`
--
ALTER TABLE `pos_popenjualan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_popenjualandetail`
--
ALTER TABLE `pos_popenjualandetail`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_produk`
--
ALTER TABLE `pos_produk`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `kode` (`kode`), ADD UNIQUE KEY `kode_2` (`kode`);

--
-- Indexes for table `pos_produkbiaya`
--
ALTER TABLE `pos_produkbiaya`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `kode` (`kode`), ADD UNIQUE KEY `kode_2` (`kode`);

--
-- Indexes for table `pos_produkjasa`
--
ALTER TABLE `pos_produkjasa`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_supplier`
--
ALTER TABLE `pos_supplier`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_useraura`
--
ALTER TABLE `pos_useraura`
 ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pos_alur_stok`
--
ALTER TABLE `pos_alur_stok`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `pos_biayabulanan`
--
ALTER TABLE `pos_biayabulanan`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_bulan`
--
ALTER TABLE `pos_bulan`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `pos_customer`
--
ALTER TABLE `pos_customer`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_jenisjasa`
--
ALTER TABLE `pos_jenisjasa`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_jenisproduk`
--
ALTER TABLE `pos_jenisproduk`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `pos_jenjang`
--
ALTER TABLE `pos_jenjang`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `pos_kelas`
--
ALTER TABLE `pos_kelas`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_pembelian`
--
ALTER TABLE `pos_pembelian`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_pembeliandetail`
--
ALTER TABLE `pos_pembeliandetail`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_pembelianretur`
--
ALTER TABLE `pos_pembelianretur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_pembelianreturdetail`
--
ALTER TABLE `pos_pembelianreturdetail`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_penjualan`
--
ALTER TABLE `pos_penjualan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_penjualanbiaya`
--
ALTER TABLE `pos_penjualanbiaya`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_penjualanbiayadetail`
--
ALTER TABLE `pos_penjualanbiayadetail`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_penjualandetail`
--
ALTER TABLE `pos_penjualandetail`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_penjualanjasa`
--
ALTER TABLE `pos_penjualanjasa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pos_penjualanjasadetail`
--
ALTER TABLE `pos_penjualanjasadetail`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_penjualanretur`
--
ALTER TABLE `pos_penjualanretur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_penjualanreturdetail`
--
ALTER TABLE `pos_penjualanreturdetail`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pos_po`
--
ALTER TABLE `pos_po`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pos_podetail`
--
ALTER TABLE `pos_podetail`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pos_popenjualan`
--
ALTER TABLE `pos_popenjualan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_popenjualandetail`
--
ALTER TABLE `pos_popenjualandetail`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pos_produk`
--
ALTER TABLE `pos_produk`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `pos_produkbiaya`
--
ALTER TABLE `pos_produkbiaya`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pos_produkjasa`
--
ALTER TABLE `pos_produkjasa`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pos_supplier`
--
ALTER TABLE `pos_supplier`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pos_useraura`
--
ALTER TABLE `pos_useraura`
MODIFY `UserId` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
