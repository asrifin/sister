-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 02 Jul 2015 pada 17.08
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `sister_siadu`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=102 ;

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
(101, '2015-07-02', 'Penjualan', 'FAK0207150002', 'BK001', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
