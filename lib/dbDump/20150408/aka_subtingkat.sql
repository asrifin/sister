-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2015 at 11:40 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `aka_subtingkat`
--

CREATE TABLE IF NOT EXISTS `aka_subtingkat` (
  `replid` int(10) NOT NULL AUTO_INCREMENT,
  `subtingkat` varchar(100) NOT NULL,
  `tingkat` int(10) NOT NULL,
  PRIMARY KEY (`replid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `aka_subtingkat`
--

INSERT INTO `aka_subtingkat` (`replid`, `subtingkat`, `tingkat`) VALUES
(1, 'kelas 1', 6),
(2, 'KELAS 2', 6),
(3, 'kelas 3', 6),
(4, 'kelas 4', 6),
(5, 'kelas 5', 6),
(6, 'kelas 6', 6),
(7, 'playgroup', 4),
(8, 'TK A', 5),
(9, 'TK B', 5),
(10, 'KELAS 7', 7),
(11, 'KELAS 8', 7),
(12, 'KELAS 9', 7),
(13, 'KELAS 10', 8),
(14, 'KELAS 11', 8),
(15, 'KELAS 12', 8),
(16, 'KELAS 10', 13),
(17, 'KELAS 11', 13),
(18, 'KELAS 12', 13),
(19, 'PLAYGROUP', 11),
(20, 'TK A', 12),
(21, 'TK B', 12),
(22, 'KELAS 1', 9),
(23, 'KELAS 2', 9),
(24, 'KELAS 3', 9),
(25, 'KELAS 4', 9),
(26, 'KELAS 5', 9),
(27, 'KELAS 6', 9),
(28, 'KELAS 7', 10),
(29, 'KELAS 8', 10),
(30, 'KELAS 9', 10);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
