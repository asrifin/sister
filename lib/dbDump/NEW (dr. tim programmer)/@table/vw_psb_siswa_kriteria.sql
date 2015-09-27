-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2015 at 06:10 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

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
-- Structure for view `vw_psb_siswa_kriteria`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_psb_siswa_kriteria` AS select `siswa`.`replid` AS `idsiswa`,`siswa`.`nis` AS `nis`,`siswa`.`nisn` AS `nisn`,`siswa`.`nopendaftaran` AS `nopendaftaran`,`siswa`.`namasiswa` AS `namasiswa`,`siswa`.`status` AS `status`,`tingkat`.`replid` AS `idtingkat`,`tingkat`.`tingkat` AS `tingkat`,`subtingkat`.`replid` AS `idsubtingkat`,`subtingkat`.`subtingkat` AS `subtingkat`,`detailgelombang`.`replid` AS `iddetailgelombang` from ((((((((((`psb_siswa` `siswa` join `psb_siswabiaya` `siswabiaya` on((`siswabiaya`.`siswa` = `siswa`.`replid`))) join `psb_detailbiaya` `detailbiaya` on((`detailbiaya`.`replid` = `siswabiaya`.`detailbiaya`))) join `psb_biaya` `biaya` on((`biaya`.`replid` = `detailbiaya`.`biaya`))) join `aka_subtingkat` `subtingkat` on((`subtingkat`.`replid` = `detailbiaya`.`subtingkat`))) join `aka_tingkat` `tingkat` on((`tingkat`.`replid` = `subtingkat`.`tingkat`))) join `psb_detailgelombang` `detailgelombang` on((`detailgelombang`.`replid` = `detailbiaya`.`detailgelombang`))) join `psb_gelombang` `gelombang` on((`gelombang`.`replid` = `detailgelombang`.`gelombang`))) join `aka_tahunajaran` `tahunajaran` on((`tahunajaran`.`replid` = `detailgelombang`.`tahunajaran`))) join `psb_golongan` `golongan` on((`golongan`.`replid` = `detailbiaya`.`golongan`))) join `departemen` on((`departemen`.`replid` = `detailgelombang`.`departemen`))) group by `siswa`.`replid`;

--
-- VIEW  `vw_psb_siswa_kriteria`
-- Data: None
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
