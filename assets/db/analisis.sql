-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2022 at 04:29 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `analisis`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `id_user` char(10) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_aplikasi`
--

CREATE TABLE `data_aplikasi` (
  `id_aplikasi` int(50) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `pemilik` varchar(30) DEFAULT NULL,
  `tahun_buat` date DEFAULT NULL,
  `deskripsi` varchar(100) DEFAULT NULL,
  `intergrasi` varchar(100) DEFAULT NULL,
  `status_optimal` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_server`
--

CREATE TABLE `data_server` (
  `id_server` int(50) NOT NULL,
  `id_vm` int(50) NOT NULL,
  `IPserver` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `seri` varchar(100) DEFAULT NULL,
  `tahun_beli` date DEFAULT NULL,
  `pembeli` varchar(100) DEFAULT NULL,
  `histori` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_vm`
--

CREATE TABLE `data_vm` (
  `id_vm` int(50) NOT NULL,
  `id_aplikasi` int(50) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `aplikasi` varchar(100) DEFAULT NULL,
  `os` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_vm`
--

INSERT INTO `data_vm` (`id_vm`, `id_aplikasi`, `nama`, `aplikasi`, `os`) VALUES
(1, NULL, 'vms', 'database', 'windows');

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE `instansi` (
  `id_instansi` int(11) NOT NULL,
  `kode_instansi` varchar(250) DEFAULT NULL,
  `nama_instansi` varchar(250) DEFAULT NULL,
  `kepala_instansi` varchar(250) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(250) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id_instansi`, `kode_instansi`, `nama_instansi`, `kepala_instansi`, `alamat`, `no_telp`, `created_by`, `update_by`, `created_at`, `update_at`, `isactive`) VALUES
(365, '48', 'SMK NEGERI 5 KENDAL', 'AGUS BASUKI', 'Jalan Raya Bogosari, Tambahrejo, Pageruyung, Bogosari, Tambahrejo, Kabupaten Kendal, Jawa Tengah 51361', '(0294) 451581', 1, 1, '2018-08-20 08:55:48', '2018-08-20 08:55:48', 1),
(366, '49', 'AL FATH MUSLIM LIFESTYLE', 'John Doe', 'Ruko Mall Ciputra no. C 26 dan 27 Simpang Lima Semarang', '(024) 8440812', 1, 1, '2018-08-20 09:05:07', '2018-08-20 09:05:07', 1),
(367, '50', 'INSTITUT TRANSPORTASI DAN LOGISTIK TRISAKTI', 'Dr. Ir Tjuk Sukardiman, M.Si', 'Jl. IPN Kebon Nanas No.2, RT.9/RW.6, Cipinang Besar Sel., Jatinegara, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13410', '(021) 8516050', 1, 1, '2018-08-21 14:35:03', '2018-08-21 14:35:03', 1),
(368, '51', 'DINAS KOMUNIKASI DAN INFORMATIKA KABUPATEN CILACAP', 'Drs. M. Wijaya, MM', 'Jl. Sindoro No.36, Cilacap, Sidanegara, Cilacap Tengah, Kabupaten Cilacap, Jawa Tengah 53212', '(0282) 5563111', 1, 1, '2018-08-27 11:32:38', '2018-08-27 11:32:38', 1),
(369, '52', 'KEMENTERIAN DALAM NEGERI REPUBLIK INDONESIA', 'Tjahjo Kumolo', 'Jalan Medan Merdeka Utara No. 7 Jakarta Pusat 10110 DKI Jakarta', '(021) 3450038', 1, 1, '2018-08-28 13:52:07', '2018-08-28 13:52:07', 1),
(370, '53', 'PEMBERDAYAAN DAN KESEJAHTERAAN KELUARGA (PKK) KAB TEMANGGUNG', 'Dra. Ny. Hj. SRI KUSDIYANTI SUDARYANTO, MM', 'Jl. Jend. A. Yani No. 32 Temanggung', '(0293) 491004', 1, 1, '2018-08-30 08:16:54', '2018-08-30 08:16:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kat` int(11) NOT NULL,
  `cat_name` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `for_modul` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kat`, `cat_name`, `note`, `for_modul`) VALUES
(9, 'ISLAM', NULL, 'AGAMA'),
(10, 'KRISTEN', '', 'AGAMA'),
(11, 'HINDU', NULL, 'AGAMA'),
(12, 'A', NULL, 'GOLDAR'),
(13, 'B', NULL, 'GOLDAR'),
(14, 'AB', NULL, 'GOLDAR'),
(15, 'O', NULL, 'GOLDAR');

-- --------------------------------------------------------

--
-- Table structure for table `konsultasi`
--

CREATE TABLE `konsultasi` (
  `id` int(11) NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nomor_telepon` varchar(14) DEFAULT NULL,
  `skpd` int(3) DEFAULT NULL,
  `permasalahan` int(3) DEFAULT NULL,
  `uraian_permasalahan` varchar(500) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `master_access`
--

CREATE TABLE `master_access` (
  `id` int(11) NOT NULL,
  `nm_access` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `master_access`
--

INSERT INTO `master_access` (`id`, `nm_access`, `note`, `created_at`, `created_by`) VALUES
(1, 'M_USERS', 'MENU USER', '0000-00-00 00:00:00', 0),
(4, 'M_LAPORAN', 'MENU LAPORAN', NULL, NULL),
(5, 'M_SY_CONFIG', 'MENU SISTEM', '0000-00-00 00:00:00', 0),
(16, 'M_SY_CONFIG', '', '2019-06-12 07:48:03', 1),
(102, 'M_MUTASI_D', '', '2020-03-04 06:02:56', 1),
(103, 'M_BERANDA', '', '2021-05-07 09:50:48', 1),
(104, 'M_KONSULTASI', '', '2021-05-07 09:51:08', 1),
(105, 'M_BERTEMU', '', '2021-05-07 09:51:14', 1),
(106, 'M_DITANYAKAN', '', '2021-05-07 09:51:20', 1),
(107, 'M_PERMASALAHAN', '', '2021-05-07 14:34:40', 1),
(108, 'C_PERMASALAHAN', '', '2021-05-07 14:34:45', 1),
(109, 'R_PERMASALAHAN', '', '2021-05-07 14:34:50', 1),
(110, 'U_PERMASALAHAN', '', '2021-05-07 14:34:56', 1),
(111, 'D_PERMASALAHAN', '', '2021-05-07 14:35:02', 1),
(112, 'M_DATA_SERVER', '-', '2022-05-31 14:43:43', 1),
(115, 'M_DATA_APLIKASI', '.', '2022-06-03 09:16:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permasalahan`
--

CREATE TABLE `permasalahan` (
  `id` int(11) NOT NULL,
  `permasalahan` varchar(255) DEFAULT NULL,
  `type` int(3) DEFAULT NULL COMMENT 'jika masalah akan dikategorikan',
  `note` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permasalahan`
--

INSERT INTO `permasalahan` (`id`, `permasalahan`, `type`, `note`, `created_at`, `created_by`, `updated_at`, `updated_by`, `isactive`) VALUES
(1, 'TEMPAT PARKIR TIDAK MEMADAHI', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'ASN DATANG TERLAMBAT', 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sy_config`
--

CREATE TABLE `sy_config` (
  `id` int(11) NOT NULL,
  `conf_name` varchar(50) NOT NULL,
  `conf_val` text NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sy_config`
--

INSERT INTO `sy_config` (`id`, `conf_name`, `conf_val`, `note`) VALUES
(3, 'APP_NAME', 'APLIKASI ANALISIS SERVER', ''),
(8, 'OPD_NAME', 'Liena', ''),
(9, 'LEFT_FOOTER', '<strong>Copyright</strong> <a href=\"https://www.instagram.com/lienalieando/\" target=\"_blank\">Liena Windyawati</a>  © 2022', ''),
(10, 'RIGHT_FOOTER', 'UNIVERSITAS AHMAD DAHLAN', ''),
(11, 'APP_DESC', 'Codeigniter 3 + AngularJs', '-'),
(12, 'OPD_ADDR', 'Peternak Kode', ''),
(13, 'VISI_MISI', 'Lets show what code can do', ''),
(14, 'APP_TELP', '089636xxx456', ''),
(15, 'APP_EMAIL', ' fahrudinyewe@gmail.com', ''),
(16, 'APP_FB', 'https://www.facebook.com', ''),
(17, 'APP_TWITTER', 'https://twitter.com', ''),
(18, 'APP_IG', 'https://instagram.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `fullname` varchar(250) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL COMMENT 'fk dari tabel user_group',
  `foto` varchar(250) DEFAULT NULL,
  `telp` varchar(250) DEFAULT NULL,
  `note` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note_1` text DEFAULT NULL,
  `ip` varchar(15) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `fullname`, `username`, `password`, `email`, `id_group`, `foto`, `telp`, `note`, `created_by`, `updated_by`, `created_at`, `updated_at`, `note_1`, `ip`, `last_login`) VALUES
(1, 'Developer', 'dev', '227edf7c86c02a44d17eec9aa5b30cd1', 'dev@email.com', 1, 'a4.jpg', '085643242654', 'full akses', 1, 1, '2018-03-13 03:06:55', '2020-04-03 09:50:11', '', '', '2019-08-27 20:12:45'),
(2, 'Administrator', 'sekretaris', '6ad14ba9986e3615423dfca256d04e3f', 'fahrudinyewe@gmail.com', 2, 'a4.jpg', '085643242656', 'Verifikasi', 1, 1, '2018-03-13 03:06:55', '2019-08-18 14:25:27', '', '', '2019-08-27 20:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_access`
--

CREATE TABLE `user_access` (
  `id` int(11) NOT NULL,
  `id_group` int(11) DEFAULT NULL,
  `kd_access` varchar(12) DEFAULT NULL,
  `nm_access` varbinary(100) DEFAULT NULL,
  `is_allow` int(1) DEFAULT NULL COMMENT '0=false,1=true',
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_access`
--

INSERT INTO `user_access` (`id`, `id_group`, `kd_access`, `nm_access`, `is_allow`, `note`) VALUES
(5, 2, '1', NULL, 1, NULL),
(8, 1, '1', NULL, 1, NULL),
(9, 3, '5', NULL, 0, NULL),
(10, 3, '1', NULL, 0, NULL),
(11, 3, '3', NULL, 1, NULL),
(12, 4, '4', NULL, 1, NULL),
(13, 1, '2', NULL, 1, NULL),
(14, 1, '3', NULL, 1, NULL),
(15, 1, '4', NULL, 1, NULL),
(16, 1, '5', NULL, 1, NULL),
(17, 1, '6', NULL, 0, NULL),
(18, 3, '4', NULL, 1, NULL),
(19, 2, '5', NULL, 0, NULL),
(20, 4, '5', NULL, 0, NULL),
(21, 4, '6', NULL, 0, NULL),
(22, 3, '2', NULL, 1, NULL),
(23, 4, '2', NULL, 1, NULL),
(24, 1, '7', NULL, 1, NULL),
(25, 1, '8', NULL, 1, NULL),
(26, 1, '9', NULL, 1, NULL),
(27, 1, '10', NULL, 0, NULL),
(28, 5, '10', NULL, 0, NULL),
(29, 5, '9', NULL, 1, NULL),
(30, 2, '2', NULL, 1, NULL),
(31, 2, '3', NULL, 1, NULL),
(32, 1, '14', NULL, 1, NULL),
(33, 2, '14', NULL, 1, NULL),
(34, 1, '12', NULL, 1, NULL),
(35, 2, '12', NULL, 0, NULL),
(36, 1, '13', NULL, 1, NULL),
(37, 1, '11', NULL, 1, NULL),
(38, 5, '3', NULL, 1, NULL),
(39, 5, '2', NULL, 1, NULL),
(40, 2, '8', NULL, 1, NULL),
(41, 2, '9', NULL, 1, NULL),
(42, 3, '6', NULL, 1, NULL),
(43, 3, '7', NULL, 1, NULL),
(44, 3, '8', NULL, 1, NULL),
(45, 3, '9', NULL, 1, NULL),
(46, 3, '10', NULL, 1, NULL),
(47, 3, '11', NULL, 1, NULL),
(48, 3, '12', NULL, 1, NULL),
(49, 3, '13', NULL, 1, NULL),
(50, 4, '3', NULL, 1, NULL),
(51, 4, '8', NULL, 1, NULL),
(52, 4, '9', NULL, 1, NULL),
(53, 5, '15', NULL, 1, NULL),
(54, 1, '15', NULL, 1, NULL),
(55, 1, '16', NULL, 1, NULL),
(56, 6, '2', NULL, 1, NULL),
(57, 6, '3', NULL, 1, NULL),
(58, 6, '4', NULL, 1, NULL),
(59, 6, '8', NULL, 1, NULL),
(60, 6, '9', NULL, 1, NULL),
(61, 6, '14', NULL, 1, NULL),
(62, 6, '15', NULL, 1, NULL),
(63, 5, '16', NULL, 1, NULL),
(64, 5, '17', NULL, 1, NULL),
(65, 5, '18', NULL, 1, NULL),
(66, 5, '19', NULL, 1, NULL),
(67, 5, '21', NULL, 1, NULL),
(68, 6, '18', NULL, 1, NULL),
(69, 1, '17', NULL, 1, NULL),
(70, 1, '18', NULL, 1, NULL),
(71, 1, '19', NULL, 1, NULL),
(72, 1, '21', NULL, 1, NULL),
(73, 1, '22', NULL, 1, NULL),
(74, 2, '22', NULL, 1, NULL),
(75, 6, '22', NULL, 1, NULL),
(76, 5, '4', NULL, 1, NULL),
(77, 5, '8', NULL, 1, NULL),
(78, 5, '22', NULL, 1, NULL),
(79, 2, '4', NULL, 1, NULL),
(80, 1, '23', NULL, 1, NULL),
(81, 1, '24', NULL, 1, NULL),
(82, 1, '25', NULL, 1, NULL),
(83, 1, '26', NULL, 1, NULL),
(84, 1, '27', NULL, 1, NULL),
(85, 1, '28', NULL, 1, NULL),
(86, 1, '29', NULL, 1, NULL),
(87, 1, '30', NULL, 1, NULL),
(88, 1, '31', NULL, 1, NULL),
(89, 1, '32', NULL, 1, NULL),
(90, 1, '33', NULL, 1, NULL),
(91, 1, '34', NULL, 1, NULL),
(92, 1, '35', NULL, 1, NULL),
(93, 2, '24', NULL, 0, NULL),
(94, 1, '36', NULL, 1, NULL),
(95, 1, '37', NULL, 1, NULL),
(96, 1, '38', NULL, 1, NULL),
(97, 1, '39', NULL, 1, NULL),
(98, 1, '40', NULL, 1, NULL),
(99, 1, '41', NULL, 1, NULL),
(100, 1, '42', NULL, 1, NULL),
(101, 1, '43', NULL, 1, NULL),
(102, 1, '44', NULL, 1, NULL),
(103, 1, '45', NULL, 1, NULL),
(104, 1, '46', NULL, 1, NULL),
(105, 1, '50', NULL, 1, NULL),
(106, 1, '49', NULL, 1, NULL),
(107, 1, '48', NULL, 1, NULL),
(108, 1, '47', NULL, 1, NULL),
(109, 1, '51', NULL, 1, NULL),
(110, 1, '52', NULL, 1, NULL),
(111, 1, '53', NULL, 1, NULL),
(112, 1, '54', NULL, 1, NULL),
(113, 1, '55', NULL, 1, NULL),
(114, 2, '56', NULL, 1, NULL),
(115, 2, '57', NULL, 1, NULL),
(116, 2, '58', NULL, 1, NULL),
(117, 2, '59', NULL, 1, NULL),
(118, 2, '60', NULL, 1, NULL),
(119, 1, '56', NULL, 1, NULL),
(120, 1, '57', NULL, 1, NULL),
(121, 1, '58', NULL, 1, NULL),
(122, 1, '59', NULL, 1, NULL),
(123, 1, '60', NULL, 1, NULL),
(124, 2, '61', NULL, 1, NULL),
(125, 2, '62', NULL, 1, NULL),
(126, 2, '63', NULL, 1, NULL),
(127, 2, '64', NULL, 1, NULL),
(128, 2, '65', NULL, 1, NULL),
(129, 1, '61', NULL, 1, NULL),
(130, 1, '62', NULL, 1, NULL),
(131, 1, '63', NULL, 1, NULL),
(132, 1, '64', NULL, 1, NULL),
(133, 1, '65', NULL, 1, NULL),
(134, 1, '66', NULL, 1, NULL),
(135, 1, '67', NULL, 1, NULL),
(136, 1, '68', NULL, 1, NULL),
(137, 1, '69', NULL, 1, NULL),
(138, 1, '70', NULL, 1, NULL),
(139, 1, '71', NULL, 1, NULL),
(140, 1, '72', NULL, 1, NULL),
(141, 1, '73', NULL, 1, NULL),
(142, 1, '74', NULL, 1, NULL),
(143, 1, '75', NULL, 1, NULL),
(144, 1, '76', NULL, 1, NULL),
(145, 1, '77', NULL, 1, NULL),
(146, 1, '78', NULL, 1, NULL),
(147, 1, '79', NULL, 1, NULL),
(148, 1, '80', NULL, 1, NULL),
(149, 1, '81', NULL, 1, NULL),
(150, 1, '82', NULL, 1, NULL),
(151, 1, '83', NULL, 1, NULL),
(152, 1, '84', NULL, 1, NULL),
(153, 1, '85', NULL, 1, NULL),
(154, 1, '86', NULL, 1, NULL),
(155, 1, '87', NULL, 1, NULL),
(156, 1, '88', NULL, 1, NULL),
(157, 1, '89', NULL, 1, NULL),
(158, 1, '90', NULL, 1, NULL),
(159, 1, '91', NULL, 1, NULL),
(160, 1, '92', NULL, 1, NULL),
(161, 1, '93', NULL, 1, NULL),
(162, 1, '94', NULL, 1, NULL),
(163, 3, '95', NULL, 1, NULL),
(164, 4, '96', NULL, 1, NULL),
(165, 5, '98', NULL, 1, NULL),
(166, 6, '99', NULL, 1, NULL),
(167, 7, '100', NULL, 1, NULL),
(168, 1, '95', NULL, 1, NULL),
(169, 1, '96', NULL, 1, NULL),
(170, 1, '97', NULL, 1, NULL),
(171, 1, '98', NULL, 1, NULL),
(172, 1, '99', NULL, 1, NULL),
(173, 1, '100', NULL, 1, NULL),
(174, 1, '101', NULL, 1, NULL),
(175, 1, '102', NULL, 1, NULL),
(176, 5, '97', NULL, 1, NULL),
(177, 2, '46', NULL, 1, NULL),
(178, 2, '85', NULL, 1, NULL),
(179, 1, '106', NULL, 0, NULL),
(180, 1, '105', NULL, 0, NULL),
(181, 1, '104', NULL, 0, NULL),
(182, 1, '103', NULL, 0, NULL),
(183, 1, '107', NULL, 1, NULL),
(184, 1, '108', NULL, 1, NULL),
(185, 1, '109', NULL, 1, NULL),
(186, 1, '110', NULL, 1, NULL),
(187, 1, '111', NULL, 1, NULL),
(188, 1, '112', NULL, 1, NULL),
(189, 1, '113', NULL, 1, NULL),
(190, 1, '114', NULL, 1, NULL),
(191, 1, '115', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `group_name`, `note`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Developer', '-', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00'),
(2, 'Administrator', '-', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `data_aplikasi`
--
ALTER TABLE `data_aplikasi`
  ADD PRIMARY KEY (`id_aplikasi`);

--
-- Indexes for table `data_server`
--
ALTER TABLE `data_server`
  ADD PRIMARY KEY (`id_server`),
  ADD KEY `id_vm` (`id_vm`);

--
-- Indexes for table `data_vm`
--
ALTER TABLE `data_vm`
  ADD PRIMARY KEY (`id_vm`),
  ADD KEY `id_aplikasi` (`id_aplikasi`);

--
-- Indexes for table `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id_instansi`) USING BTREE;

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kat`) USING BTREE;

--
-- Indexes for table `konsultasi`
--
ALTER TABLE `konsultasi`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `master_access`
--
ALTER TABLE `master_access`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `permasalahan`
--
ALTER TABLE `permasalahan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sy_config`
--
ALTER TABLE `sy_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`) USING BTREE;

--
-- Indexes for table `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_aplikasi`
--
ALTER TABLE `data_aplikasi`
  MODIFY `id_aplikasi` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_server`
--
ALTER TABLE `data_server`
  MODIFY `id_server` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_vm`
--
ALTER TABLE `data_vm`
  MODIFY `id_vm` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id_instansi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=390;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `konsultasi`
--
ALTER TABLE `konsultasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_access`
--
ALTER TABLE `master_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `permasalahan`
--
ALTER TABLE `permasalahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sy_config`
--
ALTER TABLE `sy_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_access`
--
ALTER TABLE `user_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
