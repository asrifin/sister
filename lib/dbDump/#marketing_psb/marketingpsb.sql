-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 08 Jun 2015 pada 14.11
-- Versi Server: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `psbcalon`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `psbcalon_bulan`
--

DROP TABLE IF EXISTS `psbcalon_bulan`;
CREATE TABLE IF NOT EXISTS `psbcalon_bulan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data untuk tabel `psbcalon_bulan`
--

INSERT INTO `psbcalon_bulan` (`id`, `nama`, `bulan`) VALUES
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
-- Struktur dari tabel `psbcalon_level`
--

DROP TABLE IF EXISTS `psbcalon_level`;
CREATE TABLE IF NOT EXISTS `psbcalon_level` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `level` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `psbcalon_level`
--

INSERT INTO `psbcalon_level` (`id`, `level`, `nama`) VALUES
(1, 'PGA', 'PLAYGROUP A'),
(2, 'PGB', 'PLAYGROUP B'),
(3, 'P1', 'PRIMARY 1'),
(4, 'KG1', 'KINDERGARDEN 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `psbcalon_lokasi`
--

DROP TABLE IF EXISTS `psbcalon_lokasi`;
CREATE TABLE IF NOT EXISTS `psbcalon_lokasi` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `lokasi` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `psbcalon_lokasi`
--

INSERT INTO `psbcalon_lokasi` (`id`, `lokasi`, `nama`) VALUES
(1, 'SUKO', 'ELYON SUKOMANUNGGAL'),
(2, 'RKT', 'ELYON RUNGKUT'),
(3, 'KTJ', 'ELYON KERTAJAYA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `psbcalon_siswa`
--

DROP TABLE IF EXISTS `psbcalon_siswa`;
CREATE TABLE IF NOT EXISTS `psbcalon_siswa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `tgllahir` varchar(50) NOT NULL,
  `namaortu` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `telp` varchar(50) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `ket` varchar(512) NOT NULL,
  `asalsekolah` varchar(50) NOT NULL,
  `info` varchar(50) NOT NULL,
  `kelamin` varchar(50) NOT NULL,
  `gelombang` varchar(5) NOT NULL,
  `ket2` varchar(512) NOT NULL,
  `followup` varchar(10) NOT NULL,
  `freetrial` varchar(10) NOT NULL,
  `beliform` varchar(10) NOT NULL,
  `psikotest` varchar(10) NOT NULL,
  `testmandarin` varchar(10) NOT NULL,
  `testenglish` varchar(10) NOT NULL,
  `testmath` varchar(10) NOT NULL,
  `wawancaraortu` varchar(10) NOT NULL,
  `diterima` varchar(10) NOT NULL,
  `joiningfee` varchar(50) NOT NULL,
  `dpp` varchar(50) NOT NULL,
  `uangseragam` varchar(50) NOT NULL,
  `uangbuku` varchar(50) NOT NULL,
  `uangmaterial` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `psbcalon_siswa`
--

INSERT INTO `psbcalon_siswa` (`id`, `kode`, `nama`, `level`, `lokasi`, `tgllahir`, `namaortu`, `alamat`, `kota`, `telp`, `hp`, `ket`, `asalsekolah`, `info`, `kelamin`, `gelombang`, `ket2`, `followup`, `freetrial`, `beliform`, `psikotest`, `testmandarin`, `testenglish`, `testmath`, `wawancaraortu`, `diterima`, `joiningfee`, `dpp`, `uangseragam`, `uangbuku`, `uangmaterial`) VALUES
(1, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', 'z1', 'z2', 'z3', 'z4', 'z5', 'z6', 'z7', 'z8', 'z9', 'z10', 't1', 't1', 't1', 't1', 't1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `psbcalon_situs`
--

DROP TABLE IF EXISTS `psbcalon_situs`;
CREATE TABLE IF NOT EXISTS `psbcalon_situs` (
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
-- Dumping data untuk tabel `psbcalon_situs`
--

INSERT INTO `psbcalon_situs` (`id`, `email_master`, `judul_situs`, `url_situs`, `slogan`, `description`, `keywords`, `maxkonten`, `maxadmindata`, `maxdata`, `maxgalleri`, `widgetshare`, `theme`, `author`, `alamatkantor`, `publishwebsite`, `publishnews`, `maxgalleridata`, `widgetkomentar`, `widgetpenulis`) VALUES
(1, 'rekysda@gmail.com', 'Penerimaan Peserta Didik Baru', 'http://localhost/psbcalon/', 'SISTER - PPDB', 'WebDesign dengan sistem Responsive', 'ppdb,surabaya,indonesia', 5, 50, 5, 4, 3, 'pos', 'Elyon Christian School', 'Surabaya', 1, 1, 12, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `psbcalon_useraura`
--

DROP TABLE IF EXISTS `psbcalon_useraura`;
CREATE TABLE IF NOT EXISTS `psbcalon_useraura` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `user` varchar(250) NOT NULL DEFAULT '',
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL DEFAULT '',
  `avatar` varchar(250) NOT NULL DEFAULT '',
  `level` enum('Administrator','User') NOT NULL DEFAULT 'Administrator',
  `tipe` varchar(250) NOT NULL DEFAULT '',
  `is_online` int(5) NOT NULL DEFAULT '0',
  `last_ping` text NOT NULL,
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `exp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `biodata` text NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data untuk tabel `psbcalon_useraura`
--

INSERT INTO `psbcalon_useraura` (`UserId`, `user`, `password`, `email`, `avatar`, `level`, `tipe`, `is_online`, `last_ping`, `start`, `exp`, `biodata`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@elyon.sch.id', 'af0675a9e843c6c8f78163a9118efc78.jpg', 'Administrator', 'aktif', 1, '2015-05-12 09:15:46', '2010-08-27 00:00:00', '2034-08-27 00:00:00', '<p><b>none</b></p>'),
(28, 'superadmin', 'b11d5ece6353d17f85c5ad30e0a02360', 'rekysda@gmail.com', '', 'Administrator', 'aktif', 1, '2015-03-21 23:05:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(29, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@user.com', '', 'User', 'aktif', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
