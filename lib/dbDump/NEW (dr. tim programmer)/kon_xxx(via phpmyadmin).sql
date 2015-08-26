-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2015 at 01:14 AM
-- Server version: 5.6.25
-- PHP Version: 5.5.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sister_siadu`
--

-- --------------------------------------------------------

--
-- Table structure for table `kon_aksi`
--

CREATE TABLE IF NOT EXISTS `kon_aksi` (
  `id_aksi` int(11) NOT NULL,
  `aksi` char(1) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_aksi`
--

INSERT INTO `kon_aksi` (`id_aksi`, `aksi`, `keterangan`) VALUES
(1, 'r', 'read'),
(2, 'c', 'create'),
(3, 'u', 'update'),
(4, 'd', 'delete'),
(5, 'p', 'print/report');

-- --------------------------------------------------------

--
-- Table structure for table `kon_grupmenu`
--

CREATE TABLE IF NOT EXISTS `kon_grupmenu` (
  `id_grupmenu` int(11) NOT NULL,
  `id_katgrupmenu` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `grupmenu` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_grupmenu`
--

INSERT INTO `kon_grupmenu` (`id_grupmenu`, `id_katgrupmenu`, `id_modul`, `grupmenu`, `size`) VALUES
(1, 2, 1, 'Menu Kesiswaan', 'four'),
(2, 2, 1, 'Menu Belajar - Mengajar', 'four'),
(3, 1, 1, 'Menu Master', 'four'),
(4, 1, 2, 'Menu Transaksi', 'four'),
(5, 2, 6, 'Menu Transaksi ', 'double'),
(6, 1, 6, 'Menu Master', 'double'),
(7, 1, 9, 'Menu Sistem', 'double'),
(8, 2, 9, 'Menu User', 'double'),
(9, 1, 2, 'Menu Master', 'four'),
(14, 1, 3, 'Menu Master ', 'double double-vertic'),
(15, 2, 3, 'Menu Transaksi', 'double double-vertic'),
(16, 1, 5, 'Master HRD', 'four'),
(17, 2, 5, 'Transaksi HRD', 'four'),
(18, 2, 5, 'Penggajian', 'four'),
(19, 1, 7, 'Master Student Service', 'four'),
(20, 2, 7, 'Pembelian', 'four'),
(21, 2, 7, 'Penjualan', ''),
(24, 2, 7, 'Jasa', 'four'),
(25, 2, 7, 'Hutang / Piutang', 'four'),
(26, 2, 7, 'biaya', 'four'),
(27, 2, 7, 'Laporan', 'four'),
(28, 2, 7, 'Setting', ''),
(29, 1, 13, 'Master PO', 'four'),
(30, 2, 13, 'Permintaan', 'four'),
(31, 1, 13, 'Penawaran', 'four'),
(32, 2, 13, 'Pemesanan', 'four'),
(33, 2, 13, 'Pembelian', 'four'),
(34, 2, 13, 'setting', ''),
(35, 1, 4, 'Transaksi Sarpras', 'four'),
(37, 1, 4, 'Master Sarpras', 'four'),
(38, 1, 14, 'setting', 'four'),
(39, 2, 14, 'transaksi', 'four');

-- --------------------------------------------------------

--
-- Table structure for table `kon_grupmodul`
--

CREATE TABLE IF NOT EXISTS `kon_grupmodul` (
  `id_grupmodul` int(11) NOT NULL,
  `grupmodul` varchar(50) NOT NULL,
  `size` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_grupmodul`
--

INSERT INTO `kon_grupmodul` (`id_grupmodul`, `grupmodul`, `size`) VALUES
(1, 'satu', 'four'),
(2, 'dua', 'four'),
(3, 'tiga', 'four');

-- --------------------------------------------------------

--
-- Table structure for table `kon_icon`
--

CREATE TABLE IF NOT EXISTS `kon_icon` (
  `id_icon` int(11) NOT NULL,
  `icon` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_icon`
--

INSERT INTO `kon_icon` (`id_icon`, `icon`) VALUES
(1, 'akademik'),
(2, 'sarpras'),
(3, 'hrd'),
(4, 'psb'),
(5, 'keuangan'),
(6, 'student'),
(7, 'perpus'),
(8, 'manajemen'),
(9, 'pencil'),
(10, 'address-book'),
(11, 'book'),
(12, 'copy'),
(13, 'user-3'),
(14, 'user'),
(15, 'grid-view'),
(16, 'tab'),
(17, 'cog'),
(18, 'user-2'),
(20, 'loop');

-- --------------------------------------------------------

--
-- Table structure for table `kon_katgrupmenu`
--

CREATE TABLE IF NOT EXISTS `kon_katgrupmenu` (
  `id_katgrupmenu` int(11) NOT NULL,
  `katgrupmenu` char(1) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_katgrupmenu`
--

INSERT INTO `kon_katgrupmenu` (`id_katgrupmenu`, `katgrupmenu`, `keterangan`) VALUES
(1, 'M', 'Master'),
(2, 'T', 'Transaksi');

-- --------------------------------------------------------

--
-- Table structure for table `kon_level`
--

CREATE TABLE IF NOT EXISTS `kon_level` (
  `id_level` int(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  `urutan` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_level`
--

INSERT INTO `kon_level` (`id_level`, `level`, `urutan`, `keterangan`) VALUES
(17, 'SA', 1, 'Super Admin'),
(18, 'A+', 2, 'Admin Plus'),
(19, 'A', 3, 'Admin'),
(20, 'O', 4, 'Operator'),
(21, 'G', 5, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `kon_levelaksi`
--

CREATE TABLE IF NOT EXISTS `kon_levelaksi` (
  `id_levelaksi` int(11) NOT NULL,
  `id_levelkatgrupmenu` int(11) NOT NULL,
  `id_aksi` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_levelaksi`
--

INSERT INTO `kon_levelaksi` (`id_levelaksi`, `id_levelkatgrupmenu`, `id_aksi`) VALUES
(221, 53, 1),
(222, 54, 1),
(223, 53, 2),
(224, 54, 2),
(225, 53, 3),
(226, 54, 3),
(227, 53, 4),
(228, 54, 4),
(229, 53, 5),
(230, 54, 5),
(231, 55, 1),
(232, 56, 1),
(233, 55, 2),
(234, 56, 2),
(235, 55, 3),
(236, 56, 3),
(237, 55, 4),
(238, 56, 4),
(239, 55, 5),
(240, 56, 5),
(355, 57, 1),
(356, 58, 1),
(357, 57, 2),
(358, 57, 3),
(359, 57, 4),
(360, 57, 5),
(361, 58, 5),
(362, 59, 1),
(363, 60, 1),
(364, 59, 2),
(365, 59, 3),
(366, 59, 4),
(367, 59, 5),
(368, 60, 5),
(419, 61, 1),
(420, 61, 2),
(421, 61, 3),
(422, 61, 4),
(423, 61, 5),
(424, 63, 1),
(425, 63, 2),
(426, 63, 3),
(427, 63, 4),
(428, 63, 5),
(442, 67, 1),
(443, 67, 2),
(444, 67, 3),
(445, 67, 4),
(446, 67, 5),
(448, 71, 1),
(449, 71, 5);

-- --------------------------------------------------------

--
-- Table structure for table `kon_levelkatgrupmenu`
--

CREATE TABLE IF NOT EXISTS `kon_levelkatgrupmenu` (
  `id_levelkatgrupmenu` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `id_katgrupmenu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_levelkatgrupmenu`
--

INSERT INTO `kon_levelkatgrupmenu` (`id_levelkatgrupmenu`, `id_level`, `id_katgrupmenu`, `isDefault`) VALUES
(53, 17, 1, 1),
(54, 17, 1, 0),
(55, 17, 2, 1),
(56, 17, 2, 0),
(57, 18, 1, 1),
(58, 18, 1, 0),
(59, 18, 2, 1),
(60, 18, 2, 0),
(61, 19, 1, 1),
(62, 19, 1, 0),
(63, 19, 2, 1),
(64, 19, 2, 0),
(65, 20, 1, 1),
(66, 20, 1, 0),
(67, 20, 2, 1),
(68, 20, 2, 0),
(69, 21, 1, 1),
(70, 21, 1, 0),
(71, 21, 2, 1),
(72, 21, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kon_login`
--

CREATE TABLE IF NOT EXISTS `kon_login` (
  `id_login` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_level` int(11) NOT NULL,
  `pegawai` int(10) unsigned NOT NULL DEFAULT '0',
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `bahasa` varchar(2) NOT NULL DEFAULT '',
  `tlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_login`
--

INSERT INTO `kon_login` (`id_login`, `nama`, `username`, `password`, `id_level`, `pegawai`, `aktif`, `bahasa`, `tlogin`) VALUES
(42, 'a', 'a', 'MGNjMTc1YjljMGYxYjZhODMxYzM5OWUyNjk3NzI2NjE=', 19, 0, '', '', '0000-00-00 00:00:00'),
(44, 'g', 'g', 'YjJmNWZmNDc0MzY2NzFiNmU1MzNkOGRjMzYxNDg0NWQ=', 21, 0, '1', '', '0000-00-00 00:00:00'),
(45, 'adm+ akademik', 'aaka', 'Yzg5MWY0ZTgxYjdhZmM4NzQ1ZDEwODAwNmQ1NWY5ODU=', 18, 0, '', '', '0000-00-00 00:00:00'),
(46, 'new', 'new', 'MjJhZjY0NWQxODU5Y2I1Y2E2ZGEwYzQ4NGYxZjM3ZWE=', 18, 0, '', '', '0000-00-00 00:00:00'),
(52, 'a+', 'a+', 'Yzg5NDhjMjAwOTRmNjQyMDBjMmI4ZmJhMDQ3YmRiODM=', 18, 0, '1', '', '0000-00-00 00:00:00'),
(58, 'Mr. Boss', 'admin', 'MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM=', 17, 0, '1', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kon_logindepartemen`
--

CREATE TABLE IF NOT EXISTS `kon_logindepartemen` (
  `id_logindepartemen` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_logindepartemen`
--

INSERT INTO `kon_logindepartemen` (`id_logindepartemen`, `id_login`, `id_departemen`) VALUES
(9, 42, 1),
(11, 44, 1),
(12, 45, 1),
(13, 46, 1),
(27, 52, 1),
(43, 58, 1),
(44, 58, 2),
(45, 58, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kon_loginhistory`
--

CREATE TABLE IF NOT EXISTS `kon_loginhistory` (
  `id_loginhistory` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_loginhistory`
--

INSERT INTO `kon_loginhistory` (`id_loginhistory`, `id_login`, `date`) VALUES
(11, 42, '2015-08-18 03:41:27'),
(12, 42, '2015-08-18 03:41:27'),
(15, 45, '2015-08-18 03:46:13'),
(16, 45, '2015-08-18 03:46:13'),
(57, 52, '2015-08-19 19:46:41'),
(58, 52, '2015-08-19 19:46:41'),
(65, 52, '2015-08-20 00:27:59'),
(66, 52, '2015-08-20 00:27:59'),
(131, 58, '2015-08-24 04:53:56'),
(132, 58, '2015-08-24 04:53:56'),
(133, 58, '2015-08-24 11:44:30'),
(134, 58, '2015-08-24 11:44:30'),
(135, 58, '2015-08-24 19:28:23'),
(136, 58, '2015-08-24 19:28:23'),
(137, 58, '2015-08-25 08:40:48'),
(138, 58, '2015-08-25 08:40:48'),
(139, 58, '2015-08-25 10:05:02'),
(140, 58, '2015-08-25 10:05:02'),
(141, 58, '2015-08-25 14:56:20'),
(142, 58, '2015-08-25 14:56:20'),
(143, 58, '2015-08-25 17:34:28'),
(144, 58, '2015-08-25 17:34:28'),
(145, 58, '2015-08-25 19:00:34'),
(146, 58, '2015-08-25 19:00:34'),
(147, 58, '2015-08-25 23:32:58'),
(148, 58, '2015-08-25 23:32:58'),
(149, 58, '2015-08-26 14:04:02'),
(150, 58, '2015-08-26 14:04:02'),
(151, 58, '2015-08-26 14:04:57'),
(152, 58, '2015-08-26 14:04:57'),
(153, 58, '2015-08-26 21:02:49'),
(154, 58, '2015-08-26 21:02:49'),
(155, 58, '2015-08-27 03:48:44'),
(156, 58, '2015-08-27 03:48:44'),
(157, 58, '2015-08-27 04:11:59'),
(158, 58, '2015-08-27 04:11:59'),
(159, 58, '2015-08-27 06:05:29'),
(160, 58, '2015-08-27 06:05:28');

-- --------------------------------------------------------

--
-- Table structure for table `kon_menu`
--

CREATE TABLE IF NOT EXISTS `kon_menu` (
  `id_menu` int(11) NOT NULL,
  `id_grupmenu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_menu`
--

INSERT INTO `kon_menu` (`id_menu`, `id_grupmenu`, `menu`, `link`, `size`, `id_warna`, `id_icon`, `keterangan`) VALUES
(1, 4, 'Pendataan Siswa', 'pendataan-siswa', 'double', 7, 9, ''),
(2, 1, 'Presensi Siswa', 'presensi-siswa', 'double', 44, 10, ''),
(3, 1, 'Rapor Siswa', 'rapor-siswa', 'double', 3, 11, ''),
(4, 1, 'Pendataan Alumni', 'pendataan-alumni', 'double', 4, 12, ''),
(8, 5, 'Transaksi', 'transaksi', 'double', 8, 16, ''),
(9, 5, 'Modul Penerimaan Siswa', 'modul-penerimaan-siswa', 'double', 9, 17, ''),
(10, 5, 'Penerimaan Siswa', 'penerimaan-siswa', 'double', 10, 18, ''),
(12, 6, 'Tahun Buku', 'tahun-buku', '', 12, 20, ''),
(13, 6, 'Saldo Awal', 'saldo-rekening', '', 13, 13, ''),
(14, 6, 'Kategori COA', 'kategori-rekening', '', 14, 14, ''),
(15, 6, 'COA', 'detil-rekening', '', 15, 19, ''),
(16, 6, 'Anggaran', 'set-anggaran', '', 16, 16, ''),
(19, 7, 'Warna', 'warna', '', 4, 17, ''),
(20, 8, 'level', 'level', '', 5, 16, ''),
(21, 8, 'user', 'user', '', 7, 15, ''),
(22, 7, 'Icon', 'icon', '', 4, 13, ''),
(24, 2, 'Detail Kelas', 'detail-kelas', 'double', 11, 15, ''),
(25, 3, 'Departemen', 'departemen', '', 3, 11, ''),
(26, 3, 'Angkatan', 'angkatan', '', 11, 15, ''),
(27, 3, 'Tahun Ajaran', 'tahun-ajaran', '', 16, 17, ''),
(28, 3, 'Tingkat', 'tingkat', '', 12, 18, ''),
(29, 3, 'Sub Tingkat', 'subtingkat', '', 14, 14, ''),
(30, 3, 'Kelas', 'kelas', '', 15, 13, ''),
(31, 3, 'Semester', 'semester', '', 13, 12, ''),
(32, 3, 'Jenis Mutasi', 'jenis-mutasi', '', 11, 10, ''),
(33, 3, 'Guru', 'guru', '', 11, 14, ''),
(34, 3, 'Pelajaran', 'pelajaran', '', 12, 14, ''),
(35, 2, 'Jadwal Pelajaran', 'jadwal-pelajaran', 'double', 15, 15, ''),
(36, 2, 'Presensi Guru', 'presensi-guru', 'double', 18, 12, ''),
(37, 2, 'Kegiatan Akademik', 'kegiatan-akademik', 'double', 14, 14, ''),
(38, 1, 'Mutasi', 'mutasi', 'double', 6, 13, ''),
(39, 3, 'Detail Pelajaran', 'detail-pelajaran', '', 13, 15, ''),
(40, 1, 'Pendataan Siswa', 'pendataan-siswa', 'double', 13, 15, ''),
(41, 4, 'Biaya', 'biaya', 'double', 14, 15, ''),
(42, 9, 'Diskon Tunai', 'diskon-tunai', '', 14, 15, ''),
(43, 9, 'Angsuran', 'angsuran', '', 17, 13, ''),
(44, 9, 'golongan', 'golongan', '', 13, 16, ''),
(45, 7, 'menu', 'menu', '', 14, 16, ''),
(46, 7, 'Grup Modul', 'grup-modul', '', 13, 12, ''),
(47, 7, 'Modul', 'modul', '', 12, 11, ''),
(48, 7, 'Grup Menu', 'grup-menu', '', 16, 13, ''),
(52, 9, 'Gelombang', 'gelombang', '', 16, 10, 'kelompok pendaftaran  (gelombang)'),
(53, 4, 'Penerimaan Siswa Baru', 'penerimaan', 'double', 4, 10, 'penerimaan siswa (pendaftaran NIS dan NISN)'),
(54, 14, 'Perangkat', 'perangkat', '', 16, 10, 'ok'),
(55, 14, 'Lokasi', 'lokasi', '', 16, 10, ''),
(56, 14, 'Jenis Koleksi', 'jenis-koleksi', '', 16, 10, ''),
(57, 14, 'Tingkat Koleksi', 'tingkat-koleksi', '', 13, 10, ''),
(58, 14, 'Klasifikasi', 'klasifikasi', '', 41, 10, ''),
(59, 14, 'Daftar Pengunjung', 'daftar-pengunjung', '', 17, 10, '\r\n'),
(60, 14, 'Daftar Penerbit', 'daftar-penerbit', '', 10, 10, ''),
(61, 14, 'Daftar-Bahasa', 'daftar-bahasa', '', 24, 10, ''),
(62, 14, 'Satuan Mata Uang', 'stuan-mata-uang', '', 8, 10, '\r\n'),
(63, 15, 'Katalog', 'katalog', 'double', 7, 10, ''),
(64, 15, 'Daftar Koleksi', 'daftar-koleksi', 'double', 7, 20, ''),
(65, 15, 'Data Anggota', 'data-anggota', '', 13, 10, ''),
(66, 15, 'Sirkulasi', 'sirkulasi', 'double', 18, 10, ''),
(67, 15, 'Stock Opname', 'stock-opname', 'double', 47, 17, ''),
(68, 15, 'OPAC', 'opac', 'double', 19, 12, ''),
(69, 16, 'Agama', 'agama', '', 16, 10, 'setting data master agama'),
(70, 16, 'Pendidikan', 'pendidikan', 'double', 16, 10, ''),
(71, 16, 'Departemen', 'departemen', '', 13, 10, ''),
(72, 16, 'Jabatan', 'jabatan', 'double', 16, 1, ''),
(73, 16, 'Status Karyawan', 'status-karyawan', 'double', 16, 10, ''),
(74, 16, 'Golongan', 'golongan', 'double', 16, 10, ''),
(75, 17, 'Berkas', 'berkas', 'double', 34, 10, ''),
(76, 17, 'Absensi', 'absensi', 'double', 16, 10, '\r\n'),
(77, 17, 'Cuti', 'cuti', 'double', 7, 10, ''),
(78, 17, 'Pinjaman', 'pinjaman', 'double', 17, 10, ''),
(79, 17, 'Karyawan', 'karyawan', 'double', 27, 12, ''),
(80, 18, 'Penggajian', 'penggajian', 'double', 8, 10, ''),
(81, 18, 'Laporan', 'laporan', '', 10, 12, ''),
(82, 18, 'Setting BPJS', 'setting-bpjs', 'double', 5, 17, ''),
(83, 18, 'Golongan', 'golongan ', 'double', 22, 11, ''),
(84, 18, 'struktural', 'struktural', '', 41, 17, ''),
(85, 18, 'Fungsional', 'Fungsional', 'double', 16, 1, ''),
(86, 18, 'Pengabdian', 'Pengabdian', '', 24, 17, ''),
(87, 18, 'istri anak', 'istri-anak', 'double', 16, 10, ''),
(88, 18, 'uang transport', 'uang-transport', 'double', 16, 10, ''),
(89, 18, 'beban tugas', 'beban-tugas', 'double', 16, 10, ''),
(90, 18, 'wali kelas', 'wali-kelas', 'double', 13, 11, ''),
(91, 19, 'Jenjang', 'jenjang', 'double', 8, 10, ''),
(92, 19, 'Kategori', 'kategori', 'double', 8, 1, ''),
(93, 19, 'produk', 'produk', 'double', 8, 10, ''),
(94, 19, 'produk jasa', 'produk-jasa', 'double', 1, 11, ''),
(95, 19, 'beban biaya', 'beban-biaya', 'double', 8, 10, ''),
(96, 19, 'supplier', 'supplier', 'double', 16, 10, ''),
(97, 19, 'customer', 'customer', 'double', 8, 11, ''),
(98, 20, 'PO Pembelian', 'PO-Pembelian', 'double', 16, 14, ''),
(99, 20, 'Pembelian', 'Pembelian', 'double', 16, 1, ''),
(100, 20, 'laporan pembelian', 'laporan-pembelian', 'double', 1, 12, ''),
(101, 20, 'retur pembelian', 'retur-pembelian', 'double', 16, 1, ''),
(102, 20, 'laporan retur pembelian', 'laporan-retur-pembelian', 'double', 13, 10, ''),
(103, 21, 'PO Penjualan', 'PO-Penjualan', 'double', 27, 17, ''),
(104, 21, 'Penjualan', 'Penjualan', 'double', 20, 1, ''),
(105, 21, 'Retur Penjualaan', 'Retur-Penjualaan', 'double', 16, 10, ''),
(106, 21, 'Laporan Penjualan', 'Laporan-Penjualan', 'double', 16, 10, ''),
(107, 21, 'Laporan Retur Penjualan', 'Laporan-Retur-Penjualan', 'double', 18, 1, ''),
(108, 24, 'Penjualaan Jasa', 'Penjualaan-Jasa', 'double', 16, 1, '\r\n'),
(109, 24, 'Laporan Penjualaan Jasa', 'Laporan-Penjualaan-Jasa', 'double', 16, 10, ''),
(110, 25, 'Hutang', 'hutang', 'double', 16, 10, ''),
(111, 25, 'pembayaran', 'pembayaran', 'double', 16, 10, ''),
(112, 25, 'laporan hutang', 'laporan-hutang', 'double', 16, 10, ''),
(113, 25, 'laporan pembayaran', 'laporan-pembayaran', 'double', 16, 10, '\r\n'),
(114, 26, 'Transaksi Biaya', 'Transaksi-Biaya', 'double', 16, 10, ''),
(115, 26, 'Laporan Biaya', 'Laporan-Biaya', 'double', 16, 10, ''),
(116, 27, 'Laporan Stok', 'Laporan-Stok', 'double', 16, 10, ''),
(117, 27, 'Laporan Laba/Rugi', 'Laporan-Laba/Rugi', 'double', 16, 1, ''),
(119, 27, 'Laporan Pembelian', 'Laporan-Pembelian', 'double', 7, 10, ''),
(120, 27, 'Laporan Retur Pembelian', 'Laporan-Retur-Pembelian', 'double', 16, 10, ''),
(121, 27, 'Laporan Retur Penjualan', 'Laporan-Retur-Penjualan', 'double', 16, 1, ''),
(122, 27, 'Laporan Penjualan', 'Laporan-Penjualan', 'double', 16, 17, ''),
(123, 28, 'User', 'user', 'double', 16, 10, ''),
(124, 28, 'password', 'password', 'double', 16, 10, ''),
(125, 29, 'supplier', 'supplier', 'double', 16, 10, ''),
(126, 30, 'Purchase Requisition', 'Purchase-Requisition', 'double', 16, 1, ''),
(127, 30, 'Laporan Permintaan', 'Laporan-Perrmintaan', 'double', 18, 10, ''),
(128, 30, 'Batal Purchase Requisition', 'Batal-Purchase-Requisition', 'double', 16, 10, ''),
(129, 31, 'Penawaran', 'Penawaran', 'double', 16, 10, ''),
(130, 31, 'Laporan Penawaran', 'Laporan-Penawaran', 'double', 16, 10, ''),
(131, 31, 'Formulir Fisik Penawaran ', 'Formulir-Fisik-Penawaran ', 'double', 16, 10, ''),
(132, 32, 'Purchase Order', 'Purchase-Order', 'double', 16, 10, ''),
(133, 32, 'Laporan Pemesanan', 'Laporan-Pemesanan', 'double', 16, 10, ''),
(134, 32, 'Batal Purchase Order', 'Batal \\-Purchase-Order', 'double', 16, 10, ''),
(135, 33, 'Pembelian', 'Pembelian', 'double', 1, 10, ''),
(136, 33, 'Laporan Pembelian', 'Laporan-Pembelian', 'double', 16, 10, ''),
(137, 33, 'Retur Pembelian', 'Retur-Pembelian', 'double', 16, 10, ''),
(138, 33, 'Laporan Retur PEmbelian', 'Laporan-Retur-PEmbelian', 'double', 16, 1, ''),
(139, 34, 'User', 'User', 'double', 16, 1, ''),
(140, 34, 'password', 'password', 'double', 16, 1, ''),
(141, 37, 'Lokasi', 'lokasi', 'double', 1, 10, ''),
(142, 37, 'Tempat', 'tempat', 'double', 13, 10, ''),
(143, 37, 'Tempat', 'tempat', 'double', 20, 12, ''),
(144, 35, 'Inventaris', 'inventaris', 'double', 8, 15, ''),
(145, 35, 'Peminjaman', 'peminjaman', 'double', 18, 17, ''),
(146, 35, 'aktivitas', 'aktivitas', 'double', 7, 12, ''),
(147, 38, 'user', 'user', 'double', 16, 10, ''),
(148, 39, 'tahap2', 'tahap2', 'double', 16, 10, '\r\n'),
(149, 38, 'password', 'password', 'double', 16, 10, ''),
(150, 39, 'tahap1', 'tahap1', 'double', 16, 10, ''),
(151, 39, 'tahap3', 'tahap3', 'double', 16, 10, ''),
(152, 4, 'Detail Diskon Tunai', 'detail-diskon-tunai', 'double', 16, 10, ''),
(153, 4, 'Detail Gelombang', 'detail-gelombang', 'double', 8, 11, ''),
(154, 9, 'dokumen', 'dokumen', '', 8, 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `kon_modul`
--

CREATE TABLE IF NOT EXISTS `kon_modul` (
  `id_modul` int(11) NOT NULL,
  `id_grupmodul` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `modul` varchar(100) NOT NULL,
  `id_warna` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `size` enum('','double','double double-vertical') NOT NULL DEFAULT '',
  `keterangan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_modul`
--

INSERT INTO `kon_modul` (`id_modul`, `id_grupmodul`, `link`, `modul`, `id_warna`, `id_icon`, `size`, `keterangan`) VALUES
(1, 1, 'akademik', 'akademik', 13, 9, 'double', ''),
(2, 1, 'psb', 'penerimaan siswa baru', 14, 10, 'double', ''),
(3, 1, 'perpus', 'perpustakaan', 3, 11, 'double double-vertical', ''),
(4, 1, 'sarpras', 'sarana dan prasarana', 4, 12, 'double double-vertical', ''),
(5, 2, 'hrd', 'kepegawaian', 5, 13, 'double double-vertical', ''),
(6, 2, 'keuangan', 'keuangan', 6, 14, 'double double-vertical', ''),
(7, 2, 'student', 'student services', 7, 15, 'double', ''),
(9, 3, 'konfigurasi', 'konfigurasi', 13, 14, 'double', ''),
(13, 2, 'purchaseorder', 'purchase order', 32, 20, 'double', ''),
(14, 3, 'marketingpsb', 'marketingpsb', 16, 10, 'double', '');

-- --------------------------------------------------------

--
-- Table structure for table `kon_privillege`
--

CREATE TABLE IF NOT EXISTS `kon_privillege` (
  `id_privillege` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `isDefault` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=1553 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_privillege`
--

INSERT INTO `kon_privillege` (`id_privillege`, `id_login`, `id_menu`, `isDefault`) VALUES
(142, 42, 48, 1),
(143, 42, 46, 1),
(144, 42, 22, 1),
(145, 42, 45, 1),
(146, 42, 47, 1),
(147, 42, 19, 1),
(148, 42, 20, 1),
(149, 42, 21, 1),
(152, 44, 20, 1),
(153, 44, 21, 1),
(154, 45, 26, 0),
(155, 45, 25, 0),
(156, 45, 39, 0),
(157, 45, 33, 0),
(158, 45, 32, 0),
(159, 45, 30, 0),
(160, 45, 34, 0),
(161, 45, 31, 0),
(162, 45, 29, 0),
(163, 45, 28, 0),
(164, 45, 24, 0),
(165, 45, 35, 0),
(166, 45, 37, 0),
(167, 45, 38, 0),
(168, 45, 4, 0),
(169, 45, 40, 0),
(170, 45, 48, 0),
(171, 45, 46, 0),
(172, 45, 45, 0),
(173, 45, 47, 0),
(174, 45, 21, 0),
(175, 46, 26, 0),
(176, 46, 25, 0),
(177, 46, 39, 0),
(178, 46, 33, 0),
(179, 46, 32, 0),
(180, 46, 30, 0),
(181, 46, 34, 0),
(182, 46, 31, 0),
(183, 46, 29, 0),
(184, 46, 27, 0),
(185, 46, 28, 0),
(186, 46, 16, 0),
(187, 46, 15, 0),
(188, 46, 14, 0),
(189, 46, 13, 0),
(190, 46, 12, 0),
(691, 52, 24, 0),
(692, 52, 35, 0),
(693, 52, 37, 0),
(694, 52, 36, 0),
(695, 52, 38, 0),
(696, 52, 4, 0),
(697, 52, 40, 0),
(698, 52, 2, 0),
(699, 52, 3, 0),
(700, 52, 22, 0),
(701, 52, 45, 0),
(702, 52, 47, 0),
(703, 52, 19, 0),
(704, 52, 21, 0),
(1409, 58, 1, 1),
(1410, 58, 2, 1),
(1411, 58, 3, 1),
(1412, 58, 4, 1),
(1413, 58, 8, 1),
(1414, 58, 9, 1),
(1415, 58, 10, 1),
(1416, 58, 12, 1),
(1417, 58, 13, 1),
(1418, 58, 14, 1),
(1419, 58, 15, 1),
(1420, 58, 16, 1),
(1421, 58, 19, 1),
(1422, 58, 20, 1),
(1423, 58, 21, 1),
(1424, 58, 22, 1),
(1425, 58, 24, 1),
(1426, 58, 25, 1),
(1427, 58, 26, 1),
(1428, 58, 27, 1),
(1429, 58, 28, 1),
(1430, 58, 29, 1),
(1431, 58, 30, 1),
(1432, 58, 31, 1),
(1433, 58, 32, 1),
(1434, 58, 33, 1),
(1435, 58, 34, 1),
(1436, 58, 35, 1),
(1437, 58, 36, 1),
(1438, 58, 37, 1),
(1439, 58, 38, 1),
(1440, 58, 39, 1),
(1441, 58, 40, 1),
(1442, 58, 41, 1),
(1443, 58, 42, 1),
(1444, 58, 43, 1),
(1445, 58, 44, 1),
(1446, 58, 45, 1),
(1447, 58, 46, 1),
(1448, 58, 47, 1),
(1449, 58, 48, 1),
(1450, 58, 52, 1),
(1451, 58, 53, 1),
(1452, 58, 54, 1),
(1453, 58, 55, 1),
(1454, 58, 56, 1),
(1455, 58, 57, 1),
(1456, 58, 58, 1),
(1457, 58, 59, 1),
(1458, 58, 60, 1),
(1459, 58, 61, 1),
(1460, 58, 62, 1),
(1461, 58, 63, 1),
(1462, 58, 64, 1),
(1463, 58, 65, 1),
(1464, 58, 66, 1),
(1465, 58, 67, 1),
(1466, 58, 68, 1),
(1467, 58, 69, 1),
(1468, 58, 70, 1),
(1469, 58, 71, 1),
(1470, 58, 72, 1),
(1471, 58, 73, 1),
(1472, 58, 74, 1),
(1473, 58, 75, 1),
(1474, 58, 76, 1),
(1475, 58, 77, 1),
(1476, 58, 78, 1),
(1477, 58, 79, 1),
(1478, 58, 80, 1),
(1479, 58, 81, 1),
(1480, 58, 82, 1),
(1481, 58, 83, 1),
(1482, 58, 84, 1),
(1483, 58, 85, 1),
(1484, 58, 86, 1),
(1485, 58, 87, 1),
(1486, 58, 88, 1),
(1487, 58, 89, 1),
(1488, 58, 90, 1),
(1489, 58, 91, 1),
(1490, 58, 92, 1),
(1491, 58, 93, 1),
(1492, 58, 94, 1),
(1493, 58, 95, 1),
(1494, 58, 96, 1),
(1495, 58, 97, 1),
(1496, 58, 98, 1),
(1497, 58, 99, 1),
(1498, 58, 100, 1),
(1499, 58, 101, 1),
(1500, 58, 102, 1),
(1501, 58, 103, 1),
(1502, 58, 104, 1),
(1503, 58, 105, 1),
(1504, 58, 106, 1),
(1505, 58, 107, 1),
(1506, 58, 108, 1),
(1507, 58, 109, 1),
(1508, 58, 110, 1),
(1509, 58, 111, 1),
(1510, 58, 112, 1),
(1511, 58, 113, 1),
(1512, 58, 114, 1),
(1513, 58, 115, 1),
(1514, 58, 116, 1),
(1515, 58, 117, 1),
(1516, 58, 119, 1),
(1517, 58, 120, 1),
(1518, 58, 121, 1),
(1519, 58, 122, 1),
(1520, 58, 123, 1),
(1521, 58, 124, 1),
(1522, 58, 125, 1),
(1523, 58, 126, 1),
(1524, 58, 127, 1),
(1525, 58, 128, 1),
(1526, 58, 129, 1),
(1527, 58, 130, 1),
(1528, 58, 131, 1),
(1529, 58, 132, 1),
(1530, 58, 133, 1),
(1531, 58, 134, 1),
(1532, 58, 135, 1),
(1533, 58, 136, 1),
(1534, 58, 137, 1),
(1535, 58, 138, 1),
(1536, 58, 139, 1),
(1537, 58, 140, 1),
(1538, 58, 141, 1),
(1539, 58, 142, 1),
(1540, 58, 143, 1),
(1541, 58, 144, 1),
(1542, 58, 145, 1),
(1543, 58, 146, 1),
(1544, 58, 147, 1),
(1545, 58, 148, 1),
(1546, 58, 149, 1),
(1547, 58, 150, 1),
(1548, 58, 151, 1),
(1549, 58, 152, 1),
(1550, 58, 153, 1),
(1551, 58, 154, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kon_warna`
--

CREATE TABLE IF NOT EXISTS `kon_warna` (
  `id_warna` int(11) NOT NULL,
  `warna` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kon_warna`
--

INSERT INTO `kon_warna` (`id_warna`, `warna`) VALUES
(1, 'black'),
(2, 'white'),
(3, 'lime'),
(4, 'green'),
(5, 'emerald'),
(6, 'teal'),
(7, 'cyan'),
(8, 'cobalt'),
(9, 'indigo'),
(10, 'violet'),
(11, 'pink'),
(12, 'magenta'),
(13, 'crimson'),
(14, 'red'),
(15, 'orange'),
(16, 'amber'),
(17, 'yellow'),
(18, 'brown'),
(19, 'olive'),
(20, 'steel'),
(21, 'mauve'),
(22, 'taupe'),
(23, 'gray'),
(24, 'dark'),
(25, 'darker'),
(26, 'transparent'),
(27, 'darkBrown'),
(28, 'darkCrimson'),
(29, 'darkMagenta'),
(30, 'darkIndigo'),
(31, 'darkCyan'),
(32, 'darkCobalt'),
(33, 'darkTeal'),
(34, 'darkEmerald'),
(35, 'darkGreen'),
(36, 'darkOrange'),
(37, 'darkRed'),
(38, 'darkPink'),
(39, 'darkViolet'),
(40, 'darkBlue'),
(41, 'lightBlue'),
(42, 'lightTeal'),
(43, 'lightOlive'),
(44, 'lightOrange'),
(45, 'lightPink'),
(46, 'lightRed'),
(47, 'lightGreen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kon_aksi`
--
ALTER TABLE `kon_aksi`
  ADD PRIMARY KEY (`id_aksi`);

--
-- Indexes for table `kon_grupmenu`
--
ALTER TABLE `kon_grupmenu`
  ADD PRIMARY KEY (`id_grupmenu`);

--
-- Indexes for table `kon_grupmodul`
--
ALTER TABLE `kon_grupmodul`
  ADD PRIMARY KEY (`id_grupmodul`);

--
-- Indexes for table `kon_icon`
--
ALTER TABLE `kon_icon`
  ADD PRIMARY KEY (`id_icon`);

--
-- Indexes for table `kon_katgrupmenu`
--
ALTER TABLE `kon_katgrupmenu`
  ADD PRIMARY KEY (`id_katgrupmenu`);

--
-- Indexes for table `kon_level`
--
ALTER TABLE `kon_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `kon_levelaksi`
--
ALTER TABLE `kon_levelaksi`
  ADD PRIMARY KEY (`id_levelaksi`),
  ADD KEY `id_levelkatgrupmenu` (`id_levelkatgrupmenu`),
  ADD KEY `id_aksi` (`id_aksi`);

--
-- Indexes for table `kon_levelkatgrupmenu`
--
ALTER TABLE `kon_levelkatgrupmenu`
  ADD PRIMARY KEY (`id_levelkatgrupmenu`),
  ADD KEY `id_level` (`id_level`),
  ADD KEY `id_katgrupmenu` (`id_katgrupmenu`);

--
-- Indexes for table `kon_login`
--
ALTER TABLE `kon_login`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `kon_logindepartemen`
--
ALTER TABLE `kon_logindepartemen`
  ADD PRIMARY KEY (`id_logindepartemen`),
  ADD KEY `id_login` (`id_login`) USING BTREE,
  ADD KEY `id_departemen` (`id_departemen`) USING BTREE;

--
-- Indexes for table `kon_loginhistory`
--
ALTER TABLE `kon_loginhistory`
  ADD PRIMARY KEY (`id_loginhistory`),
  ADD KEY `id_login` (`id_login`) USING BTREE;

--
-- Indexes for table `kon_menu`
--
ALTER TABLE `kon_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `kon_modul`
--
ALTER TABLE `kon_modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `kon_privillege`
--
ALTER TABLE `kon_privillege`
  ADD PRIMARY KEY (`id_privillege`),
  ADD KEY `id_login` (`id_login`) USING BTREE,
  ADD KEY `id_menu` (`id_menu`) USING BTREE;

--
-- Indexes for table `kon_warna`
--
ALTER TABLE `kon_warna`
  ADD PRIMARY KEY (`id_warna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kon_aksi`
--
ALTER TABLE `kon_aksi`
  MODIFY `id_aksi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kon_grupmenu`
--
ALTER TABLE `kon_grupmenu`
  MODIFY `id_grupmenu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `kon_grupmodul`
--
ALTER TABLE `kon_grupmodul`
  MODIFY `id_grupmodul` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `kon_icon`
--
ALTER TABLE `kon_icon`
  MODIFY `id_icon` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `kon_katgrupmenu`
--
ALTER TABLE `kon_katgrupmenu`
  MODIFY `id_katgrupmenu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kon_level`
--
ALTER TABLE `kon_level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `kon_levelaksi`
--
ALTER TABLE `kon_levelaksi`
  MODIFY `id_levelaksi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=450;
--
-- AUTO_INCREMENT for table `kon_levelkatgrupmenu`
--
ALTER TABLE `kon_levelkatgrupmenu`
  MODIFY `id_levelkatgrupmenu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `kon_login`
--
ALTER TABLE `kon_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `kon_logindepartemen`
--
ALTER TABLE `kon_logindepartemen`
  MODIFY `id_logindepartemen` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `kon_loginhistory`
--
ALTER TABLE `kon_loginhistory`
  MODIFY `id_loginhistory` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT for table `kon_menu`
--
ALTER TABLE `kon_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=156;
--
-- AUTO_INCREMENT for table `kon_modul`
--
ALTER TABLE `kon_modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `kon_privillege`
--
ALTER TABLE `kon_privillege`
  MODIFY `id_privillege` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1553;
--
-- AUTO_INCREMENT for table `kon_warna`
--
ALTER TABLE `kon_warna`
  MODIFY `id_warna` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `kon_levelaksi`
--
ALTER TABLE `kon_levelaksi`
  ADD CONSTRAINT `kon_levelaksi_ibfk_1` FOREIGN KEY (`id_levelkatgrupmenu`) REFERENCES `kon_levelkatgrupmenu` (`id_levelkatgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kon_levelaksi_ibfk_2` FOREIGN KEY (`id_aksi`) REFERENCES `kon_aksi` (`id_aksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_levelkatgrupmenu`
--
ALTER TABLE `kon_levelkatgrupmenu`
  ADD CONSTRAINT `kon_levelkatgrupmenu_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kon_levelkatgrupmenu_ibfk_2` FOREIGN KEY (`id_katgrupmenu`) REFERENCES `kon_katgrupmenu` (`id_katgrupmenu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_login`
--
ALTER TABLE `kon_login`
  ADD CONSTRAINT `kon_login_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `kon_level` (`id_level`);

--
-- Constraints for table `kon_logindepartemen`
--
ALTER TABLE `kon_logindepartemen`
  ADD CONSTRAINT `id_login_FK2` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_loginhistory`
--
ALTER TABLE `kon_loginhistory`
  ADD CONSTRAINT `kon_loginhistory_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kon_privillege`
--
ALTER TABLE `kon_privillege`
  ADD CONSTRAINT `id_login_FK` FOREIGN KEY (`id_login`) REFERENCES `kon_login` (`id_login`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_menu_FK` FOREIGN KEY (`id_menu`) REFERENCES `kon_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
