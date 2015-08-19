-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 16 Jun 2015 pada 19.00
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
-- Struktur dari tabel `psbcalon_siswa`
--

DROP TABLE IF EXISTS `psbcalon_siswa`;
CREATE TABLE IF NOT EXISTS `psbcalon_siswa` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelompok` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data untuk tabel `psbcalon_siswa`
--

INSERT INTO `psbcalon_siswa` (`id`, `kode`, `nama`, `kelompok`, `departemen`, `tgllahir`, `namaortu`, `alamat`, `kota`, `telp`, `hp`, `ket`, `asalsekolah`, `info`, `kelamin`, `gelombang`, `ket2`, `followup`, `freetrial`, `beliform`, `psikotest`, `testmandarin`, `testenglish`, `testmath`, `wawancaraortu`, `diterima`, `joiningfee`, `dpp`, `uangseragam`, `uangbuku`, `uangmaterial`) VALUES
(1, '1', '2', '3', '2', '2015-06-09', '6', '7', '8', '9', '0', '1', '2', '3', '2', '3', 'z1', '2015-06-15', '2015-06-10', '2015-06-17', '', '', '', '', '', '2015-06-30', '2015-06-15', '', '', '', '2015-06-30'),
(2, 'a', 'a', '19', '1', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', '1', '2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'm', 'mm', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'g', 'gg', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', 'u', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(7, 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'i', 'ii', 'i', 'i', 'i', 'i', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, 'c', 'c', '', '1', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', '1', '6', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', '', '', '', '', '', '', '', '', '', '', '', '', '2015-06-30', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
