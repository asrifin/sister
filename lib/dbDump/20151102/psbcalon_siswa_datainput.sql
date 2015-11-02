-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 02 Nov 2015 pada 16.51
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
  `lokasi` varchar(5) NOT NULL,
  `golongan` varchar(5) NOT NULL,
  `gelombang` varchar(5) NOT NULL,
  `tingkat` varchar(5) NOT NULL,
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
  `ket2` varchar(512) NOT NULL,
  `followup` varchar(10) NOT NULL,
  `freetrial` varchar(10) NOT NULL,
  `beliform` varchar(10) NOT NULL,
  `psikotest` varchar(10) NOT NULL,
  `testmandarin` varchar(10) NOT NULL,
  `testenglish` varchar(10) NOT NULL,
  `testmath` varchar(10) NOT NULL,
  `wawancaraortu` varchar(10) NOT NULL,
  `diterima` varchar(10) NOT NULL DEFAULT 'pending',
  `joiningfee` varchar(50) NOT NULL,
  `dpp` varchar(50) NOT NULL,
  `uangseragam` varchar(50) NOT NULL,
  `uangbuku` varchar(50) NOT NULL,
  `uangmaterial` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=171 ;

--
-- Dumping data untuk tabel `psbcalon_siswa`
--

INSERT INTO `psbcalon_siswa` (`id`, `kode`, `nama`, `lokasi`, `golongan`, `gelombang`, `tingkat`, `tgllahir`, `namaortu`, `alamat`, `kota`, `telp`, `hp`, `ket`, `asalsekolah`, `info`, `kelamin`, `ket2`, `followup`, `freetrial`, `beliform`, `psikotest`, `testmandarin`, `testenglish`, `testmath`, `wawancaraortu`, `diterima`, `joiningfee`, `dpp`, `uangseragam`, `uangbuku`, `uangmaterial`) VALUES
(13, 'TD01', 'Matthew Wilson', '1', '2', '42', '1', '2014-01-26', 'Diana', '', '', '', '0812.3378.0886', '', '', 'sebelum pameran', 'L', '', '', '2015-08-27', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(14, 'TD02', 'Nathan', '1', '2', '42', '1', '2013-11-02', 'Hestia', '', '', '', '081.731.9929', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '2015-08-27', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(15, 'TD03', 'Jacob', '1', '2', '42', '1', '2014-04-25', 'Stevanie', '', '', '', '0838.4947.7472 / 031-511.63137', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(16, 'TD04', 'Kingston', '1', '2', '42', '1', '', '', '', '', '', '', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(17, 'TD05', 'Ai Keiko Huang', '1', '2', '42', '1', '2014-02-10', 'Linda', '', '', '', '0822.3131.9049', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '2015-09-22', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(18, 'TD06', 'Kaylynn', '1', '2', '42', '1', '2014-04-08', 'Jeny', '', '', '', '081.703.997.887', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '2015-09-22', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(19, 'TD07', 'Selena', '1', '2', '42', '1', '2014-02-25', 'Meme', 'Darmo Baru I / 42 B', '', '', '081.9380.187.88', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '2015-09-22', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(20, 'TD08', 'Melvin', '1', '2', '42', '1', '2014-02-19', 'Feny', '', '', '', '081.2325.2797', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '2015-09-22', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(21, 'TD09', 'Neil', '1', '2', '42', '1', '', 'Ms. Jessica', '', '', '', '', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '2015-08-28', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(22, 'TD10', 'Tricia', '1', '2', '42', '1', '2014-01-14', 'Linda', 'HR Muhamad 35 B', '', '', '081.845.0818', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(23, 'TD11', '', '1', '2', '42', '1', '', 'Utomo', '', '', '', '081.650.5252', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(24, 'TD12', 'Shaelene', '1', '2', '42', '1', '2014-02-13', 'Sanders', '', '', '', '081.3333.9999.7', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(37, 'PGA01', 'Jonathan Salim', '1', '2', '42', '2', '2013-06-04', 'Jongky Salim', '', '', '', '081.2352.1122.23', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '2015-07-29', '2015-08-03', '-', '', '', '', '', 'terima', '2015-08-03', '2015-08-03', '2015-08-03', '2015-08-03', ''),
(38, 'PGA02', 'Max', '1', '2', '42', '2', '2013-10-04', 'Lusi', '', '', '', '031-787.9945', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(39, 'PGA03', 'Charlotte', '1', '2', '42', '2', '2013-02-27', 'Grace', 'Dian Istana D5', '', '', '081.3301.7777.9', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(40, 'PGA04', 'Adrian Wong', '1', '2', '42', '2', '2014-01-26', 'Ika', 'Vila Valencia PA VII/78 - Lontar', '', '', '081.3300.451.48', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(41, 'PGA05', 'Julian Sanjaya', '1', '2', '42', '2', '2013-09-14', 'Caroline Yulianto', '', '', '', '0811.330.633', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '2015-09-07', '2015-09-09', '-', '', '', '', '', 'terima', '2015-09-09', '2015-09-09', '2015-09-09', '2015-09-09', ''),
(42, 'PGA06', 'Edelweiss', '1', '2', '42', '2', '2013-02-27', 'Monica', '', '', '', '0812.883.512.35 / 031-731.5428', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '2015-09-09', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(43, 'PGA07', 'Nathan', '1', '2', '42', '2', '2013-11-02', 'Hestia', '', '', '', '081.731.9929 / 031-531.3299', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '2015-09-14', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(44, 'PGA08', 'Reynard', '1', '2', '42', '2', '2013-06-01', 'Helmina', 'Raya Darmo Permai I/79', '', '', '082.302.166.002', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(45, 'PGA09', 'Naca', '1', '2', '42', '2', '2013-01-02', 'Wiwin', 'Tanjungsari Baru', '', '', '081.33.000.7607', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(46, 'PGA10', 'Edelweiss', '1', '2', '42', '2', '2013-02-27', 'Monica', '', '', '', '031-731.5428 / 0812.8835.1235', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(47, 'PGA11', 'Naomi', '1', '2', '42', '2', '2013-02-21', 'Sofia', '', '', '', '081.3333.130.90', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(48, 'PGA12', 'Kimberly', '1', '2', '42', '2', '2013-12-16', 'Feny', 'Prada Permai II / 22-24, Darmo Baru Barat', '', '', '031-732.8603 / 0811.984.7255', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(49, 'PGA13', 'Dapanendra Alexsandre', '1', '2', '42', '2', '2013-02-18', 'Ms Stella Ivonne', '', '', '', '0857.9847.9777 / 081.22.88.999.72', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '2015-09-02', '-', '', '', '', '', 'terima', '2015-10-06', '', '2015-09-02', '2015-09-02', ''),
(50, 'PGA14', 'Marvella', '1', '2', '42', '2', '2014-02-17', 'Linda', '', '', '', '0896.759.07677', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(51, 'PGA15', 'Charissa', '1', '2', '42', '2', '2014-03-14', 'Martini', '', '', '', '081.232.138.67', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(52, 'PGA16', 'Jullian', '1', '2', '42', '2', '2014-01-05', 'Maria', '', '', '', '081.330.626.163', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(53, 'PGA17', 'Jayden', '1', '2', '42', '2', '2014-05-29', 'Firda', '', '', '', '081.216.28909', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(54, 'PGA18', 'Edrick', '1', '2', '42', '2', '2013-11-19', 'Vera', '', '', '', '081.25.9999.668', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(55, 'PGA19', 'Edgard', '1', '2', '42', '2', '2013-07-21', 'ev. Rocky /  Mega', '', '', '', '081.805.780.177 / 0897.7266.558', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(56, 'PGA20', 'Clairinelee', '1', '2', '42', '2', '2014-07-30', 'Elis', '', '', '', '089.518.2247.35', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(57, 'PGA21', 'Xie Qin', '1', '2', '42', '2', '', '', '', '', '', '', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '2015-06-23', '-', '', '', '', '', 'terima', '2015-06-23', '2015-06-23', '2015-06-23', '2015-06-23', ''),
(58, 'PGA22', 'Rayna', '1', '2', '42', '2', '2014-09-27', 'Deny', '', '', '', '085.100.109.151', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '2014-10-09', '', '', '', '', '', 'pending', '', '', '', '', ''),
(59, 'PGA23', 'Jaqueline', '1', '2', '42', '2', '2014-02-12', 'Lia', '', '', '', '0821.392.55.302', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(60, 'PGA24', 'Anabelle', '1', '2', '42', '2', '2014-06-19', 'Mega', '', '', '', '0821.4125.3877', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(61, 'PGB01', 'Quincy', '1', '2', '42', '2', '2012-03-09', 'Floren', 'Woodland WL 2 / 88 - Citraland', '', '', '081.5512.8883', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '2015-08-10', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(62, 'PGB02', 'Reagan', '1', '2', '42', '2', '2012-11-10', 'Johanes', 'Simpang Darmo Permai Utara no. 33', '', '', '0811.348.9773', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '2015-08-24', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(63, 'PGB03', 'Celline', '1', '2', '42', '2', '2012-12-07', 'Mely', 'Wisata Bukit Mas I B9/29', '', '', '0852.316.788.67', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '2015-08-10', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(64, 'PGB04', 'Reagan', '1', '2', '42', '2', '2012-11-10', 'Johanes', 'Simpang Darmo Utara 33', '', '', '081.134.89773', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(65, 'PGB05', 'Celline', '1', '2', '42', '2', '2012-12-07', 'Mely', 'Wisata Bukit Mas I B9/29', '', '', '0852.316.788.67', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(66, 'PGB06', 'Harlow', '1', '2', '42', '2', '2013-08-21', 'Davina', '', '', '', '0838.561.34520', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(67, 'PGB07', 'Kenneth', '1', '2', '42', '2', '2012-01-11', 'Gunther', 'Purwokerto', '', '', '0821.360.32127', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(68, 'PGB08', 'Kenzo', '1', '2', '42', '2', '2013-03-18', 'Meme', 'Darmo Baru I / 42B', '', '', '081.9380.18788', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(69, 'PGB09', 'Bianca', '1', '2', '42', '2', '2013-11-21', 'Dita', 'Darmo Harapan Utara V/ EW-25', '', '', '083.8888.6667', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(70, 'PGB10', 'Owner Vincent', '1', '2', '42', '2', '2013-03-07', 'Maria', '', '', '', '085.101.001.001', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(71, 'PGB11', 'Charistheo', '1', '2', '42', '2', '2012-11-15', 'Martini', 'lebak jaya III utara 38', '', '', '081.232.138.67', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(72, 'PGB12', 'George', '1', '2', '42', '2', '2013-09-09', 'Grace', '', '', '', '0812.3171.6264', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(73, 'PGB13', 'Naysa', '1', '2', '42', '2', '2013-06-28', 'Selvy', 'Manuka Peni A4/12', '', '', '081.134.4037', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(74, 'PGB14', 'Edward Johnson Gunawan', '1', '2', '42', '2', '2013-07-11', 'Linda', '', '', '', '081.357.087.835', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(75, 'PGB15', 'Neeyati Shani', '1', '2', '42', '2', '2013-08-26', 'Kripa Rana Shani', '', '', '', '0811.348.2668', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(76, 'PGB16', 'Veronica Grisella', '1', '2', '42', '2', '', 'Mr. Simon', '', '', '', '', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '-', '2015-05-08', '-', '', '', '', '', 'terima', '2015-05-08', 'Free', '2015-06-03', '2015-06-03', ''),
(77, 'PGB17', 'Starielle', '1', '2', '42', '2', '2013-10-02', 'Ivana', '', '', '', '081.7500.6500', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(78, 'PGB18', 'Josephine', '1', '2', '42', '2', '2013-02-27', 'Elvi', '', '', '', '0851. 000.96690', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(79, 'KGA01', 'Claris', '1', '2', '42', '3', '2012-03-28', 'Feny', '', '', '', '031-7311.608', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(80, 'KGA02', '', '1', '2', '42', '3', '', 'Angela', '', '', '', '081.1340.1617 / 031-752.5292', '', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(81, 'KGA03', 'Samuel', '1', '2', '42', '3', '', 'Sony', '', '', '', '0821.2101.0121', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(82, 'KGA04', 'Gracia', '1', '2', '42', '3', '2012-06-01', 'Veronica', '', '', '', '081.272.685.73', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(83, 'KGA05', 'Michelle', '1', '2', '42', '3', '2012-03-20', 'Linda', '', '', '', '0896.759.07677', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(84, 'KGA06', 'Rayner', '1', '2', '42', '3', '2013-04-24', 'Ernie', '', '', '', '081.3333.00.830', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(85, 'KGA07', 'Matvey', '1', '2', '42', '3', '2012-12-03', 'Yenny', '', '', '', '081.230.23705', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(86, 'KGA08', 'Jocelyn Jayadi', '1', '2', '42', '3', '', '', '', '', '', '', 'REGISTER', '', 'sebelum pameran', 'P', '', '', '', '2015-10-02', '', '', '', '', '', 'terima', '2015-10-02', '2015-10-02', '', '2015-10-02', ''),
(87, 'PR01', 'Marilyn', '1', '2', '42', '6', '2004-02-02', 'Irene', 'Kupang Indah 17 No. 35', '', '', '081.143.2688', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(88, 'PR02', 'Vaness', '1', '2', '42', '6', '2006-03-03', 'Clara', 'Vila Bukit Mas G 36', '', '', '0821.8888.1386', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(89, 'PR03', '', '1', '2', '42', '6', '', 'Chen chen', '', '', '', '0856.33818.33', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(90, 'PR04', 'Heidi', '1', '2', '42', '6', '', 'Davina', '', '', '', '0838.561.34520', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(91, 'PR05', 'Joseph', '1', '2', '42', '6', '', 'Yusakh', '', '', '', '081.131.1682', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(92, 'PR06', 'Alessandro', '1', '2', '42', '6', '2010-06-12', 'Maria', 'Royal Residence', '', '', '081.2177.98868', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(93, 'PR07', 'Felix', '1', '2', '42', '6', '2010-07-12', 'Lala', 'Taman Puspa Raya', '', '', '0838.5603.5678', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(94, 'PR08', 'Kaylee', '1', '2', '42', '6', '2009-12-23', 'Wish', 'Citraland', '', '', '081.330.198.989', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(95, 'PR09', 'Xavier', '1', '2', '42', '6', '2009-07-05', 'Gunther', 'Purwokerto', '', '', '0821.360.32127', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(96, 'PR10', 'Azelia', '1', '2', '42', '6', '2010-07-03', 'Yuli', '', '', '', '0855.373.9999', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(97, 'PR11', 'Floy', '1', '2', '42', '6', '2010-06-01', 'Steven', '', '', '', '0811.329.0145', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(98, 'PR12', 'Kenneth', '1', '2', '42', '6', '2010-07-28', 'Marina', 'Vila Taman Gapura G2 No.3, Citraland', '', '', '08121.6082.73', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '2009-09-03', '', '', '', '', '', 'pending', '', '', '', '', ''),
(99, 'PR13', '', '1', '2', '42', '6', '', 'Silvia', 'Bendul Merisi Utara XIV / 3', '', '', '031-843.2047', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(100, 'PR14', 'Joe Lukas Wili', '1', '2', '42', '6', '2010-02-05', 'Lina', 'Kencana Sari Barat KI/B', '', '', '081.5533.413.16', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '2015-10-09', '', '', '', '', '', 'pending', '', '', '', '', ''),
(101, 'PR15', '', '1', '2', '42', '6', '', 'Angela', '', '', '', '081.931.011.331', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(102, 'PR16', '', '1', '2', '42', '6', '', 'Sarai', '', '', '', '081.839.3825 / 0851.004.059.95', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(103, 'PR17', 'Revin Liem', '1', '2', '42', '6', '2009-12-15', 'San San', 'Suko Manunggal Jaya IX/9', '', '', '0856.338.1833', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '2015-10-09', '', '', '', '', '', 'pending', '', '', '', '', ''),
(104, 'PR18', '', '1', '2', '42', '6', '', 'Bene', '', '', '', '083.8888.6667', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(105, 'PR19', 'Brayden', '1', '2', '42', '6', '2009-03-28', 'Hany', 'Wisata Bukit Mas B2/16 - Venetian, Wiyung', '', '', '082.33.8888.126', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '2015-09-08', '2015-10-03', '', '', '', '', 'pending', '', '', '', '', ''),
(106, 'PR20', 'Robertus', '1', '2', '42', '6', '', 'Ika', 'Pradah Kali Kendal 38', '', '', '0857.6829.6829 / 0881.9021.491', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(107, 'PR21', '', '1', '2', '42', '6', '', 'Lusi', '', '', '', '0822.4436.3345', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(108, 'PR22', 'Keane Sujud', '1', '2', '42', '6', '2010-04-10', 'Angela', '', '', '', '081.9310.11331', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(109, 'PR23', '', '1', '2', '42', '6', '', 'Djoko Sukrisno', 'Malang', '', '', '0851.01.77.5151 / 081.2330.5151', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(110, 'PR24', 'Dayton', '1', '2', '42', '6', '2011-02-05', 'Winnie', '', '', '', '081.2145.678.25', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(111, 'PR25', 'Albert', '1', '2', '42', '6', '2010-01-29', 'Shierly', '', '', '', '081.133.24089', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(112, 'PR26', '', '1', '2', '42', '6', '', 'Feni', '', '', '', '086.1023.73288', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(113, 'PR27', 'Michael', '1', '2', '42', '6', '2010-10-26', 'Lilian', '', '', '', '081.615.429.288', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(114, 'PR28', 'Bela', '1', '2', '42', '6', '2010-11-24', 'Laurent', '', '', '', '081.2327.5915', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(115, 'PR29', 'Charissa Mary', '1', '2', '42', '6', '2010-02-02', 'Shierly', '', '', '', '0811.3050.850', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(116, 'PR30', 'Shane & Shawn', '1', '2', '42', '6', '2011-07-07', 'Claudine', '', '', '', '08121.767.1217', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(117, 'PR31', 'Natalie Michelle', '1', '2', '42', '6', '2011-06-28', 'Mona', '', '', '', '0812.3446.2200', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(118, 'PR32', 'E. Arwen Soenjoto', '1', '2', '42', '6', '2011-09-09', 'Indah', '', '', '', '089.731.75115', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(119, 'PR33', 'Mimi', '1', '2', '42', '6', '2010-01-16', 'Steven', '', '', '', '', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(120, 'PR34', 'Tiffany', '1', '2', '42', '6', '2008-09-19', 'Yuli', 'Tidar 28 No.3', '', '', '081.654.222.58', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(121, 'PR35', 'Regina', '1', '2', '42', '6', '2009-12-12', 'Ernie', '', '', '', '081.3333.00.830', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(122, 'PR36', 'Gisele Lovely', '1', '2', '42', '6', '2010-05-19', 'Veronica', 'Satelit Indah III CN-18', '', '', '081.330.311.321', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(123, 'PR37', '', '1', '2', '42', '6', '', 'Fery', '', '', '', '081.231.98707', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(124, 'PR38', 'Reyner', '1', '2', '42', '6', '2009-12-06', 'Dewi', '', '', '', '085.102.373.288', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(125, 'PR39', 'Kumiko', '1', '2', '42', '6', '2010-10-12', 'Dewi', '', '', '', '081.803.222.958', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(126, 'PR40', 'Gabriel', '1', '2', '42', '6', '', 'Yuliana', '', '', '', '085.381.383.806', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(127, 'PR41', 'Terrence', '1', '2', '42', '6', '2011-01-04', 'Heni', '', '', '', '081.515.631.615', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(128, 'PR42', 'Carsten', '1', '2', '42', '6', '2010-06-13', 'Rosita', '', '', '', '', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(129, 'PR43', 'Steli Angeline', '1', '2', '42', '6', '2010-07-08', 'Wenny', 'Tama Asri Selatan 58, Pondok Candra Indah', '', '', '081.222.300.800', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(130, 'PR44', 'Lionel', '1', '2', '42', '6', '2010-09-15', 'Henny', '', '', '', '081.331.287.887', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(131, 'PR45', 'Jhon Franklin', '1', '2', '42', '6', '2010-03-08', 'Villan', '', '', '', '081.216.41818 / 031-7522.435', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '2015-10-06', '', '', '', '', '', 'pending', '', '', '', '', ''),
(132, 'PR46', 'Henry Candra', '1', '2', '42', '6', '2010-09-17', 'Yang Yo Hui', '', '', '', '0812.1655.8776', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '2015-10-06', '', '', '', '', '', 'pending', '', '', '', '', ''),
(133, 'PR47', 'Calista', '1', '2', '42', '6', '2010-10-02', 'Sonya', '', '', '', '081.2300.10899', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(134, 'PR48', 'Jocelyn', '1', '2', '42', '6', '2010-06-11', 'Yuliana', '', '', '', '0821.323.47893', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(135, 'PR49', '', '1', '2', '42', '6', '', 'Dian', '', '', '', '081.3351.22.222', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(136, 'PR50', 'Hiro', '1', '2', '42', '6', '2010-05-01', 'Lani', '', '', '', '081.733.5288', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '2015-10-02', '', '', '', '', '', 'pending', '', '', '', '', ''),
(137, 'PR51', '', '1', '2', '42', '6', '', 'Mariani', '', '', '', '081.6523.828', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(138, 'PR52', '', '1', '2', '42', '6', '', 'Grace', '', '', '', '081.3301.7777.9', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(139, 'PR53', '', '1', '2', '42', '6', '', 'Gunawan', '', '', '', '081.2301.42968', 'SEBELUM PAMERAN', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(140, 'PR54', 'Cloe', '1', '2', '42', '6', '2010-04-29', 'Vivien', '', '', '', '081.2171.3338', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(141, 'PR55', 'Osten C. Harianto', '1', '2', '42', '6', '2010-01-26', 'Lesly', 'Ritz wood AE II / 31, Pakuwon', '', '', '081.837.2591', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '2015-10-06', '', '', '', '', '', 'pending', '', '', '2015-10-06', '', ''),
(142, 'PR56', 'Nathan Gunawan', '1', '2', '42', '6', '2010-09-21', 'Lucky', 'Bavarian I A/6, Raya Darmo Permai Utara III', '', '', '031-734.9308 / 081.751.86959', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'L', '', '', '', '2015-10-06', '', '', '', '', '', 'pending', '', '', '', '', ''),
(143, 'PR57', 'Stevanie Winata', '1', '2', '42', '6', '', 'Ramayanti', '', '', '', '081.134.09215', 'SEBELUM PAMERAN', '', 'sebelum pameran', 'P', '', '', '', '2015-07-28', '', '', '', '', '', 'pending', '', '', '', '', ''),
(144, 'SC01', 'Christopher', '1', '2', '42', '7', '2001-06-20', 'Susan', '', '', '', '081.837.9698', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(145, 'SC02', 'Vanessa', '1', '2', '42', '7', '', 'Inggrid', '', '', '', '081.230.12433', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(146, 'SC03', '', '1', '2', '42', '7', '', 'Ranto', '', '', '', '085.100.99.7538 / 0821.312.999.36', '', '', 'sebelum pameran', '', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(147, 'SC04', 'Theofilus Bryan', '1', '2', '42', '7', '2001-10-13', 'Budi', 'Taman Puspa Raya D4/11', '', '', '081.2326.1135', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(148, 'SC05', 'Bryan', '1', '2', '42', '7', '2004-10-01', 'Clara', '', '', '', '0821.8888.1386', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(149, 'SC06', 'Brandon', '1', '2', '42', '7', '2003-06-25', 'Desy', '', '', '', '081.232.789.578', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(150, 'SC07', 'Thimotius Owen Sugianto', '1', '2', '42', '7', '2004-10-15', 'Lina', 'Simpang Darmo Permai VII/3', '', '', '0838.566.82.999', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(151, 'SC08', 'Joseph', '1', '2', '42', '7', '', 'Yusakh', '', '', '', '081.131.1682', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(152, 'SC09', 'Dave', '1', '2', '42', '7', '2004-10-25', 'Ninik', 'Darmo Sentosa Raya H-24', '', '', '081.2164.88880', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(153, 'SC10', 'Bryan', '1', '2', '42', '7', '2004-04-20', 'Leny', '', '', '', '0858.525.4000.9', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(154, 'SC11', 'Felicia', '1', '2', '42', '7', '2004-11-04', 'Fang-Fang', '', '', '', '081.70.333.777.0', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(155, 'SC12', 'Catherine', '1', '2', '42', '7', '2004-04-30', 'Ana', '', '', '', '0811.333.718', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(156, 'SC13', 'Sharon', '1', '2', '42', '7', '2004-09-18', 'Firna', 'Darmo Indah Asri AD/25', '', '', '081.6152.88.999', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(157, 'SC14', 'Celine Nugroho', '1', '2', '42', '7', '2004-06-27', 'Linda', '', '', '', '081.7030.546.32', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(158, 'SC15', 'Caileen Samantha Juwono', '1', '2', '42', '7', '2004-04-04', 'Christine', '', '', '', '081.553.00.1634', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(159, 'SC16', 'Vittorio', '1', '2', '42', '7', '2004-03-02', 'Santoso', 'Raya Lontar 114', '', '', '081.65.333.21', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(160, 'SC17', 'Jonsen Imanuel', '1', '2', '42', '7', '2001-11-08', 'Agus', 'Magetan', '', '', '0856.551.235.07', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(161, 'SC18', 'Jennifer', '1', '2', '42', '7', '2001-02-10', 'Chandra', '', '', '', '081.232.00.55.77', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(162, 'SC19', 'Jeni', '1', '2', '42', '7', '', 'Ana', '', '', '', '081.249.741.008', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(163, 'SC20', 'Jenifer', '1', '2', '42', '7', '2001-08-04', 'Adrian Ellis', '', '', '', '0811.396.980', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(164, 'SC21', 'Eugene', '1', '2', '42', '7', '2000-12-15', 'Johan', '', '', '', '0812.352.1991', '', '', 'sebelum pameran', 'P', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(165, 'SC22', 'Zhou Yang En', '1', '2', '42', '7', '2003-12-18', 'Johan Par', '', '', '', '0812.303.60330', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(166, 'SC23', 'Yek Cun Cai', '1', '2', '42', '7', '', '', '', '', '', '0821.7588.91', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(167, 'SC24', 'Eawyn', '1', '2', '42', '7', '2004-12-24', 'Fany', '', '', '', '081.653.1165', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', ''),
(168, 'HS01', 'Patrick Austine', '1', '2', '42', '8', '', 'Caroline Stefanie', '', '', '', '085.2466.10739', '', '', 'sebelum pameran', 'L', '', '', '', '', '', '', '', '', '', 'pending', '', '', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
