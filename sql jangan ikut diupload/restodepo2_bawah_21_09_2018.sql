-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2018 at 09:00 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restodepo2`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat_pembeli`
--

DROP TABLE IF EXISTS `alamat_pembeli`;
CREATE TABLE `alamat_pembeli` (
  `id` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `label_alamat` varchar(100) NOT NULL,
  `nama_penerima` varchar(128) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `alamat` text NOT NULL,
  `id_kota` int(11) NOT NULL,
  `kodepos` varchar(8) NOT NULL,
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_utama` int(11) NOT NULL DEFAULT '0' COMMENT '1 : alamat pengiriman utama, 0 : tidak diutamakan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `alamat_pembeli`
--

TRUNCATE TABLE `alamat_pembeli`;
--
-- Dumping data for table `alamat_pembeli`
--

INSERT INTO `alamat_pembeli` (`id`, `id_pembeli`, `label_alamat`, `nama_penerima`, `phone`, `alamat`, `id_kota`, `kodepos`, `posting_date`, `is_utama`) VALUES
(15, 4, 'Rumah', 'Maghfira Rizki', '85702062141', 'Wangen RT.02/RW.01, Wangen, Polanharjo, Klaten', 197, '57474', '2018-07-06 10:01:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `area_tugas`
--

DROP TABLE IF EXISTS `area_tugas`;
CREATE TABLE `area_tugas` (
  `id` int(11) NOT NULL,
  `kode` varchar(64) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `keterangan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `area_tugas`
--

TRUNCATE TABLE `area_tugas`;
--
-- Dumping data for table `area_tugas`
--

INSERT INTO `area_tugas` (`id`, `kode`, `nama`, `keterangan`) VALUES
(1, 'PENGGUNA', 'Manajemen Pengguna', ''),
(2, 'JABATAN', 'Manajemen Jabatan', ''),
(3, 'AREA_TUGAS', 'Area Tugas', ''),
(7, 'DEPARTEMEN', 'Departemen', ''),
(13, 'AUDIT_TRAIL', 'AUDIT TRAIL', ''),
(14, 'MAINTENANCE', 'Maintenance', 'Maintenance');

-- --------------------------------------------------------

--
-- Table structure for table `def_privilege`
--

DROP TABLE IF EXISTS `def_privilege`;
CREATE TABLE `def_privilege` (
  `id` int(11) NOT NULL,
  `idjabatan` int(11) NOT NULL,
  `idarea` int(11) NOT NULL,
  `lihat` tinyint(4) NOT NULL,
  `tambah` tinyint(4) NOT NULL,
  `ubah` tinyint(4) NOT NULL,
  `hapus` tinyint(4) NOT NULL,
  `isprovide` tinyint(4) NOT NULL,
  `isapprove` tinyint(4) NOT NULL,
  `isrelease` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `def_privilege`
--

TRUNCATE TABLE `def_privilege`;
--
-- Dumping data for table `def_privilege`
--

INSERT INTO `def_privilege` (`id`, `idjabatan`, `idarea`, `lihat`, `tambah`, `ubah`, `hapus`, `isprovide`, `isapprove`, `isrelease`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1, 1, 1, 1, 1),
(3, 1, 3, 1, 1, 1, 1, 1, 1, 1),
(10, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(12, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(13, 4, 1, 0, 0, 0, 0, 0, 0, 0),
(21, 1, 7, 1, 1, 1, 1, 1, 1, 1),
(22, 4, 7, 0, 0, 0, 0, 0, 0, 0),
(107, 1, 13, 1, 1, 1, 1, 0, 0, 0),
(128, 4, 13, 0, 0, 0, 0, 0, 0, 0),
(129, 1, 14, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `departemen`
--

TRUNCATE TABLE `departemen`;
--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`id`, `nama`) VALUES
(1, 'Internal'),
(2, 'Eksternal');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `jabatan`
--

TRUNCATE TABLE `jabatan`;
--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama`) VALUES
(1, 'Super Admin'),
(4, 'Staff Internal');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `ismaintenance` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `maintenance`
--

TRUNCATE TABLE `maintenance`;
--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id`, `ismaintenance`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_wilayah`
--

DROP TABLE IF EXISTS `master_wilayah`;
CREATE TABLE `master_wilayah` (
  `id` int(11) NOT NULL,
  `kodeprov` varchar(8) NOT NULL,
  `namaprov` varchar(128) NOT NULL,
  `kodekab` varchar(8) NOT NULL,
  `namakab` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `master_wilayah`
--

TRUNCATE TABLE `master_wilayah`;
--
-- Dumping data for table `master_wilayah`
--

INSERT INTO `master_wilayah` (`id`, `kodeprov`, `namaprov`, `kodekab`, `namakab`) VALUES
(0, '0', 'kosong', '0.0', 'Kosong'),
(1, '11', 'aceh', '11.01', 'aceh selatan'),
(2, '11', 'aceh', '11.02', 'aceh tenggara'),
(3, '11', 'aceh', '11.03', 'aceh timur'),
(4, '11', 'aceh', '11.04', 'aceh tengah'),
(5, '11', 'aceh', '11.05', 'aceh barat'),
(6, '11', 'aceh', '11.06', 'aceh besar'),
(7, '11', 'aceh', '11.07', 'pidie'),
(8, '11', 'aceh', '11.08', ' aceh utara'),
(9, '11', 'aceh', '11.09', 'simeulue'),
(10, '11', 'aceh', '11.1', 'aceh singkil'),
(11, '11', 'aceh', '11.11', 'bireuen'),
(12, '11', 'aceh', '11.12', 'aceh barat daya'),
(13, '11', 'aceh', '11.13', 'gayo lues'),
(14, '11', 'aceh', '11.14', 'aceh jaya'),
(15, '11', 'aceh', '11.15', 'nagan raya'),
(16, '11', 'aceh', '11.16', 'aceh tamiang'),
(17, '11', 'aceh', '11.17', 'bener meriah'),
(18, '11', 'aceh', '11.18', 'pidie jaya'),
(19, '11', 'aceh', '11.71', 'banda aceh'),
(20, '11', 'aceh', '11.72', 'sabang'),
(21, '11', 'aceh', '11.73', 'lhokseumawe'),
(22, '11', 'aceh', '11.74', 'langsa'),
(23, '11', 'aceh', '11.75', 'subulussalam'),
(24, '12', 'sumatera utara', '12.01', 'tapanuli tengah'),
(25, '12', 'sumatera utara', '12.02', 'tapanuli utara'),
(26, '12', 'sumatera utara', '12.03', 'tapanuli selatan'),
(27, '12', 'sumatera utara', '12.04', 'nias'),
(28, '12', 'sumatera utara', '12.05', 'langkat'),
(29, '12', 'sumatera utara', '12.06', 'karo'),
(30, '12', 'sumatera utara', '12.07', 'deli serdang'),
(31, '12', 'sumatera utara', '12.08', 'simalungun'),
(32, '12', 'sumatera utara', '12.09', 'asahan'),
(33, '12', 'sumatera utara', '12.1', 'labuhanbatu'),
(34, '12', 'sumatera utara', '12.11', 'dairi'),
(35, '12', 'sumatera utara', '12.12', 'toba samosir'),
(36, '12', 'sumatera utara', '12.13', 'mandailing natal'),
(37, '12', 'sumatera utara', '12.14', 'nias selatan'),
(38, '12', 'sumatera utara', '12.15', 'pakpak bharat'),
(39, '12', 'sumatera utara', '12.16', 'humbang hasundutan'),
(40, '12', 'sumatera utara', '12.17', 'samosir'),
(41, '12', 'sumatera utara', '12.18', 'serdang bedagai'),
(42, '12', 'sumatera utara', '12.19', 'batu bara'),
(43, '12', 'sumatera utara', '12.2', 'padang lawas utara'),
(44, '12', 'sumatera utara', '12.21', 'padang lawas'),
(45, '12', 'sumatera utara', '12.22', 'labuhanbatu selatan'),
(46, '12', 'sumatera utara', '12.23', 'labuhanbatu utara'),
(47, '12', 'sumatera utara', '12.24', 'nias utara'),
(48, '12', 'sumatera utara', '12.25', 'nias barat'),
(49, '12', 'sumatera utara', '12.71', 'medan'),
(50, '12', 'sumatera utara', '12.72', 'pematang siantar'),
(51, '12', 'sumatera utara', '12.73', 'sibolga'),
(52, '12', 'sumatera utara', '12.74', 'tanjung balai'),
(53, '12', 'sumatera utara', '12.75', 'binjai'),
(54, '12', 'sumatera utara', '12.76', 'tebing tinggi'),
(55, '12', 'sumatera utara', '12.77', 'padang sidempuan'),
(56, '12', 'sumatera utara', '12.78', 'gunung sitoli'),
(57, '13', 'sumatera barat', '13.01', 'pesisir selatan'),
(58, '13', 'sumatera barat', '13.02', 'solok kabupaten'),
(59, '13', 'sumatera barat', '13.03', 'sijunjung'),
(60, '13', 'sumatera barat', '13.04', 'tanah datar'),
(61, '13', 'sumatera barat', '13.05', 'padang pariaman'),
(62, '13', 'sumatera barat', '13.06', 'agam'),
(63, '13', 'sumatera barat', '13.07', 'lima puluh kota'),
(64, '13', 'sumatera barat', '13.08', 'pasaman'),
(65, '13', 'sumatera barat', '13.09', 'kepulauan mentawai'),
(66, '13', 'sumatera barat', '13.1', 'dharmasraya'),
(67, '13', 'sumatera barat', '13.11', 'solok selatan'),
(68, '13', 'sumatera barat', '13.12', 'pasaman barat'),
(69, '13', 'sumatera barat', '13.71', 'padang'),
(70, '13', 'sumatera barat', '13.72', 'solok kota '),
(71, '13', 'sumatera barat', '13.73', 'sawah lunto'),
(72, '13', 'sumatera barat', '13.74', 'padang panjang'),
(73, '13', 'sumatera barat', '13.75', 'bukittinggi'),
(74, '13', 'sumatera barat', '13.76', 'payakumbuh'),
(75, '13', 'sumatera barat', '13.77', 'pariaman'),
(76, '14', 'riau', '14.01', 'kampar'),
(77, '14', 'riau', '14.02', 'indragiri hulu'),
(78, '14', 'riau', '14.03', 'bengkalis'),
(79, '14', 'riau', '14.04', 'indragiri hilir'),
(80, '14', 'riau', '14.05', 'pelalawan'),
(81, '14', 'riau', '14.06', 'rokan hulu'),
(82, '14', 'riau', '14.07', 'rokan hilir'),
(83, '14', 'riau', '14.08', 'siak'),
(84, '14', 'riau', '14.09', 'kuantan singingi'),
(85, '14', 'riau', '14.1', 'kepulauan meranti'),
(86, '14', 'riau', '14.71', 'pekanbaru'),
(87, '14', 'riau', '14.72', 'duma'),
(88, '15', 'jambi', '15.01', 'kerinci'),
(89, '15', 'jambi', '15.02', 'merangin'),
(90, '15', 'jambi', '15.03', 'sarolangun'),
(91, '15', 'jambi', '15.04', 'batanghari'),
(92, '15', 'jambi', '15.05', 'muaro jambi'),
(93, '15', 'jambi', '15.06', 'tanjung jabung barat'),
(94, '15', 'jambi', '15.07', 'tanjung jabung timur'),
(95, '15', 'jambi', '15.08', 'bungo'),
(96, '15', 'jambi', '15.09', 'tebo'),
(97, '15', 'jambi', '15.71', 'jambi'),
(98, '15', 'jambi', '15.72', 'sungai penuh'),
(99, '16', 'sumatera selatan', '16.01', 'ogan komering ulu'),
(100, '16', 'sumatera selatan', '16.02', 'ogan komering ilir'),
(101, '16', 'sumatera selatan', '16.03', 'muara enim'),
(102, '16', 'sumatera selatan', '16.04', 'lahat'),
(103, '16', 'sumatera selatan', '16.05', 'musi rawas'),
(104, '16', 'sumatera selatan', '16.06', 'musi banyuasin'),
(105, '16', 'sumatera selatan', '16.07', 'banyuasin'),
(106, '16', 'sumatera selatan', '16.08', 'ogan komering ulu timur'),
(107, '16', 'sumatera selatan', '16.09', 'ogan komering ulu selatan'),
(108, '16', 'sumatera selatan', '16.1', 'ogan ilir'),
(109, '16', 'sumatera selatan', '16.11', 'empat lawang'),
(110, '16', 'sumatera selatan', '16.12', 'penukal abab lematang ilir'),
(111, '16', 'sumatera selatan', '16.13', 'musi rawas utara'),
(112, '16', 'sumatera selatan', '16.71', 'palembang'),
(113, '16', 'sumatera selatan', '16.72', 'pagar alam'),
(114, '16', 'sumatera selatan', '16.73', 'lubuk linggau'),
(115, '16', 'sumatera selatan', '16.74', 'prabumulih'),
(116, '17', 'bengkulu', '17.01', 'bengkulu selatan'),
(117, '17', 'bengkulu', '17.02', 'rejang lebong'),
(118, '17', 'bengkulu', '17.03', 'bengkulu utara'),
(119, '17', 'bengkulu', '17.04', 'kaur'),
(120, '17', 'bengkulu', '17.05', 'seluma'),
(121, '17', 'bengkulu', '17.06', 'muko muko'),
(122, '17', 'bengkulu', '17.07', 'lebong'),
(123, '17', 'bengkulu', '17.08', 'kepahiang'),
(124, '17', 'bengkulu', '17.09', 'bengkulu tengah'),
(125, '17', 'bengkulu', '17.71', 'bengkulu'),
(126, '18', 'lampung', '18.01', 'lampung selatan'),
(127, '18', 'lampung', '18.02', 'lampung tengah'),
(128, '18', 'lampung', '18.03', 'lampung utara'),
(129, '18', 'lampung', '18.04', 'lampung barat'),
(130, '18', 'lampung', '18.05', 'tulang bawang'),
(131, '18', 'lampung', '18.06', 'tanggamus'),
(132, '18', 'lampung', '18.07', 'lampung timur'),
(133, '18', 'lampung', '18.08', 'way kanan'),
(134, '18', 'lampung', '18.09', 'pesawaran'),
(135, '18', 'lampung', '18.1', 'pringsewu'),
(136, '18', 'lampung', '18.11', 'mesuji'),
(137, '18', 'lampung', '18.12', 'tulang bawang barat'),
(138, '18', 'lampung', '18.13', 'pesisir barat'),
(139, '18', 'lampung', '18.71', 'bandar lampung'),
(140, '18', 'lampung', '18.72', 'metro'),
(141, '19', 'kepulauan bangka belitung', '19.01', 'bangka'),
(142, '19', 'kepulauan bangka belitung', '19.02', 'belitung'),
(143, '19', 'kepulauan bangka belitung', '19.03', 'bangka selatan'),
(144, '19', 'kepulauan bangka belitung', '19.04', 'bangka tengah'),
(145, '19', 'kepulauan bangka belitung', '19.05', 'bangka barat'),
(146, '19', 'kepulauan bangka belitung', '19.06', 'belitung timur'),
(147, '19', 'kepulauan bangka belitung', '19.71', 'pangkal pinang'),
(148, '21', 'kepulauan riau', '21.01', 'bintan'),
(149, '21', 'kepulauan riau', '21.02', 'karimun'),
(150, '21', 'kepulauan riau', '21.03', 'natuna'),
(151, '21', 'kepulauan riau', '21.04', 'lingga'),
(152, '21', 'kepulauan riau', '21.05', 'kepulauan anambas'),
(153, '21', 'kepulauan riau', '21.71', 'batam'),
(154, '21', 'kepulauan riau', '21.72', 'tanjung pinang'),
(155, '31', 'dki jakarta', '31.01', 'kep. seribu'),
(156, '31', 'dki jakarta', '31.71', 'jakarta pusat'),
(157, '31', 'dki jakarta', '31.72', 'jakarta utara'),
(158, '31', 'dki jakarta', '31.73', 'jakarta barat'),
(159, '31', 'dki jakarta', '31.74', 'jakarta selatan'),
(160, '31', 'dki jakarta', '31.75', 'jakarta timur'),
(161, '32', 'jawa barat', '32.01', 'bogor kabupaten'),
(162, '32', 'jawa barat', '32.02', 'sukabumi kabupaten'),
(163, '32', 'jawa barat', '32.03', 'cianjur'),
(164, '32', 'jawa barat', '32.04', 'bandung kabupaten'),
(165, '32', 'jawa barat', '32.05', 'garut'),
(166, '32', 'jawa barat', '32.06', 'tasikmalaya kabupaten'),
(167, '32', 'jawa barat', '32.07', 'ciamis'),
(168, '32', 'jawa barat', '32.08', 'kuningan'),
(169, '32', 'jawa barat', '32.09', 'cirebon kabupaten'),
(170, '32', 'jawa barat', '32.1', 'majalengka'),
(171, '32', 'jawa barat', '32.11', 'sumedang'),
(172, '32', 'jawa barat', '32.12', 'indramayu'),
(173, '32', 'jawa barat', '32.13', 'subang'),
(174, '32', 'jawa barat', '32.14', 'purwakarta'),
(175, '32', 'jawa barat', '32.15', 'karawang'),
(176, '32', 'jawa barat', '32.16', 'bekasi'),
(177, '32', 'jawa barat', '32.17', 'bandung barat'),
(178, '32', 'jawa barat', '32.18', 'pangandaran'),
(179, '32', 'jawa barat', '32.71', 'bogor kota'),
(180, '32', 'jawa barat', '32.72', 'sukabumi kota'),
(181, '32', 'jawa barat', '32.73', 'bandung kota'),
(182, '32', 'jawa barat', '32.74', 'cirebon kota'),
(183, '32', 'jawa barat', '32.75', 'bekasi'),
(184, '32', 'jawa barat', '32.76', 'depok'),
(185, '32', 'jawa barat', '32.77', 'cimahi'),
(186, '32', 'jawa barat', '32.78', 'tasikmalaya kota'),
(187, '32', 'jawa barat', '32.79', 'banjar jabar'),
(188, '33', 'jawa tengah', '33.01', 'cilacap'),
(189, '33', 'jawa tengah', '33.02', 'banyumas'),
(190, '33', 'jawa tengah', '33.03', 'purbalingga'),
(191, '33', 'jawa tengah', '33.04', 'banjarnegara'),
(192, '33', 'jawa tengah', '33.05', 'kebumen'),
(193, '33', 'jawa tengah', '33.06', 'purworejo'),
(194, '33', 'jawa tengah', '33.07', 'wonosobo'),
(195, '33', 'jawa tengah', '33.08', 'magelang kabupaten'),
(196, '33', 'jawa tengah', '33.09', 'boyolali'),
(197, '33', 'jawa tengah', '33.1', 'klaten'),
(198, '33', 'jawa tengah', '33.11', 'sukoharjo'),
(199, '33', 'jawa tengah', '33.12', 'wonogiri'),
(200, '33', 'jawa tengah', '33.13', 'karanganyar'),
(201, '33', 'jawa tengah', '33.14', 'sragen'),
(202, '33', 'jawa tengah', '33.15', 'grobogan'),
(203, '33', 'jawa tengah', '33.16', 'blora'),
(204, '33', 'jawa tengah', '33.17', 'rembang'),
(205, '33', 'jawa tengah', '33.18', 'pati'),
(206, '33', 'jawa tengah', '33.19', 'kudus'),
(207, '33', 'jawa tengah', '33.2', 'jepara'),
(208, '33', 'jawa tengah', '33.21', 'demak'),
(209, '33', 'jawa tengah', '33.22', 'semarang kabupaten'),
(210, '33', 'jawa tengah', '33.23', 'temanggung'),
(211, '33', 'jawa tengah', '33.24', 'kendal'),
(212, '33', 'jawa tengah', '33.25', 'batang'),
(213, '33', 'jawa tengah', '33.26', 'pekalongan kabupaten'),
(214, '33', 'jawa tengah', '33.27', 'pemalang'),
(215, '33', 'jawa tengah', '33.28', 'tegal kabupaten'),
(216, '33', 'jawa tengah', '33.29', 'brebes'),
(217, '33', 'jawa tengah', '33.71', 'magelang kota'),
(218, '33', 'jawa tengah', '33.72', 'surakarta (solo)'),
(219, '33', 'jawa tengah', '33.73', 'salatiga'),
(220, '33', 'jawa tengah', '33.74', 'semarang kota'),
(221, '33', 'jawa tengah', '33.75', 'pekalongan kota'),
(222, '33', 'jawa tengah', '33.76', 'tegal kota'),
(223, '36', 'banten', '36.01', 'pandeglang'),
(224, '36', 'banten', '36.02', 'lebak'),
(225, '36', 'banten', '36.03', 'tangerang kabupaten'),
(226, '36', 'banten', '36.04', 'serang kabupaten'),
(227, '36', 'banten', '36.71', 'tangerang kota'),
(228, '36', 'banten', '36.72', 'cilegon'),
(229, '36', 'banten', '36.73', 'serang kota'),
(230, '36', 'banten', '36.74', 'tangerang selatan'),
(231, '35', 'jawa timur', '35.01', 'pacitan'),
(232, '35', 'jawa timur', '35.02', 'ponorogo'),
(233, '35', 'jawa timur', '35.03', 'trenggalek'),
(234, '35', 'jawa timur', '35.04', 'tulungagung'),
(235, '35', 'jawa timur', '35.05', 'blitar kabupaten'),
(236, '35', 'jawa timur', '35.06', 'kediri kabupaten'),
(237, '35', 'jawa timur', '35.07', 'malang kabupaten'),
(238, '35', 'jawa timur', '35.08', 'lumajang'),
(239, '35', 'jawa timur', '35.09', 'jember'),
(240, '35', 'jawa timur', '35.1', 'banyuwangi'),
(241, '35', 'jawa timur', '35.11', 'bondowoso'),
(242, '35', 'jawa timur', '35.12', 'situbondo'),
(243, '35', 'jawa timur', '35.13', 'probolinggo kabupaten'),
(244, '35', 'jawa timur', '35.14', 'pasuruan kabupaten'),
(245, '35', 'jawa timur', '35.15', 'sidoarjo'),
(246, '35', 'jawa timur', '35.16', 'mojokerto kabupaten'),
(247, '35', 'jawa timur', '35.17', 'jombang'),
(248, '35', 'jawa timur', '35.18', 'nganjuk'),
(249, '35', 'jawa timur', '35.19', 'madiun kabupaten'),
(250, '35', 'jawa timur', '35.2', 'magetan'),
(251, '35', 'jawa timur', '35.21', 'ngawi'),
(252, '35', 'jawa timur', '35.22', 'bojonegoro'),
(253, '35', 'jawa timur', '35.23', 'tuban'),
(254, '35', 'jawa timur', '35.24', 'lamongan'),
(255, '35', 'jawa timur', '35.25', 'gresik'),
(256, '35', 'jawa timur', '35.26', 'bangkalan'),
(257, '35', 'jawa timur', '35.27', 'sampang'),
(258, '35', 'jawa timur', '35.28', 'pamekasan'),
(259, '35', 'jawa timur', '35.29', 'sumenep'),
(260, '35', 'jawa timur', '35.71', 'kediri kota'),
(261, '35', 'jawa timur', '35.72', 'blitar kota'),
(262, '35', 'jawa timur', '35.73', 'malang kota'),
(263, '35', 'jawa timur', '35.74', 'probolinggo kota'),
(264, '35', 'jawa timur', '35.75', 'pasuruan kota'),
(265, '35', 'jawa timur', '35.76', 'mojokerto kota'),
(266, '35', 'jawa timur', '35.77', 'madiun kota'),
(267, '35', 'jawa timur', '35.78', 'surabaya'),
(268, '35', 'jawa timur', '35.79', 'batu'),
(269, '34', 'daerah istimewa yogyakarta', '34.01', 'kulon progo'),
(270, '34', 'daerah istimewa yogyakarta', '34.02', 'bantul'),
(271, '34', 'daerah istimewa yogyakarta', '34.03', 'gunungkidul'),
(272, '34', 'daerah istimewa yogyakarta', '34.04', 'sleman'),
(273, '34', 'daerah istimewa yogyakarta', '34.71', 'yogyakarta'),
(274, '51', 'bali', '51.01', 'jembrana'),
(275, '51', 'bali', '51.02', 'tabanan'),
(276, '51', 'bali', '51.03', 'badung'),
(277, '51', 'bali', '51.04', 'gianyar'),
(278, '51', 'bali', '51.05', 'klungkung'),
(279, '51', 'bali', '51.06', 'bangli'),
(280, '51', 'bali', '51.07', 'karangasem'),
(281, '51', 'bali', '51.08', 'buleleng'),
(282, '51', 'bali', '51.71', 'denpasar'),
(283, '52', 'nusa tenggara barat', '52.01', 'lombok barat'),
(284, '52', 'nusa tenggara barat', '52.02', 'lombok tengah'),
(285, '52', 'nusa tenggara barat', '52.03', 'lombok timur'),
(286, '52', 'nusa tenggara barat', '52.04', 'sumbawa'),
(287, '52', 'nusa tenggara barat', '52.05', 'dompu'),
(288, '52', 'nusa tenggara barat', '52.06', 'bima kabupaten'),
(289, '52', 'nusa tenggara barat', '52.07', 'sumbawa barat'),
(290, '52', 'nusa tenggara barat', '52.08', 'lombok utara'),
(291, '52', 'nusa tenggara barat', '52.71', 'mataram'),
(292, '52', 'nusa tenggara barat', '52.72', 'bima kota'),
(293, '53', 'nusa tenggara timur', '53.01', 'kupang kabupaten'),
(294, '53', 'nusa tenggara timur', '53.02', 'timor tengah selatan'),
(295, '53', 'nusa tenggara timur', '53.03', 'timor tengah utara'),
(296, '53', 'nusa tenggara timur', '53.04', 'belu'),
(297, '53', 'nusa tenggara timur', '53.05', 'alor'),
(298, '53', 'nusa tenggara timur', '53.06', 'flores timur'),
(299, '53', 'nusa tenggara timur', '53.07', 'sikka'),
(300, '53', 'nusa tenggara timur', '53.08', 'ende'),
(301, '53', 'nusa tenggara timur', '53.09', 'ngada'),
(302, '53', 'nusa tenggara timur', '53.1', 'manggarai'),
(303, '53', 'nusa tenggara timur', '53.11', 'sumba timur'),
(304, '53', 'nusa tenggara timur', '53.12', 'sumba barat'),
(305, '53', 'nusa tenggara timur', '53.13', 'lembata'),
(306, '53', 'nusa tenggara timur', '53.14', 'rote ndao'),
(307, '53', 'nusa tenggara timur', '53.15', 'manggarai barat'),
(308, '53', 'nusa tenggara timur', '53.16', 'nagekeo'),
(309, '53', 'nusa tenggara timur', '53.17', 'sumba tengah'),
(310, '53', 'nusa tenggara timur', '53.18', 'sumba barat daya'),
(311, '53', 'nusa tenggara timur', '53.19', 'manggarai timur'),
(312, '53', 'nusa tenggara timur', '53.2', 'sabu raijua'),
(313, '53', 'nusa tenggara timur', '53.21', 'malaka'),
(314, '53', 'nusa tenggara timur', '53.71', 'kupang kota'),
(315, '61', 'kalimantan barat', '61.01', 'sambas'),
(316, '61', 'kalimantan barat', '61.02', 'mempawah'),
(317, '61', 'kalimantan barat', '61.03', 'sanggau'),
(318, '61', 'kalimantan barat', '61.04', 'ketapang'),
(319, '61', 'kalimantan barat', '61.05', 'sintang'),
(320, '61', 'kalimantan barat', '61.06', 'kapuas hulu'),
(321, '61', 'kalimantan barat', '61.07', 'bengkayang'),
(322, '61', 'kalimantan barat', '61.08', 'landak'),
(323, '61', 'kalimantan barat', '61.09', 'sekadau'),
(324, '61', 'kalimantan barat', '61.1', 'melawi'),
(325, '61', 'kalimantan barat', '61.11', 'kayong utara'),
(326, '61', 'kalimantan barat', '61.12', 'kubu raya'),
(327, '61', 'kalimantan barat', '61.71', 'pontianak'),
(328, '61', 'kalimantan barat', '61.72', 'singkawang'),
(329, '62', 'kalimantan tengah', '62.01', 'kotawaringin barat'),
(330, '62', 'kalimantan tengah', '62.02', 'kotawaringin timur'),
(331, '62', 'kalimantan tengah', '62.03', 'kapuas'),
(332, '62', 'kalimantan tengah', '62.04', 'barito selatan'),
(333, '62', 'kalimantan tengah', '62.05', 'barito utara'),
(334, '62', 'kalimantan tengah', '62.06', 'katingan'),
(335, '62', 'kalimantan tengah', '62.07', 'seruyan'),
(336, '62', 'kalimantan tengah', '62.08', 'sukamara'),
(337, '62', 'kalimantan tengah', '62.09', 'lamandau'),
(338, '62', 'kalimantan tengah', '62.1', 'gunung mas'),
(339, '62', 'kalimantan tengah', '62.11', 'pulang pisau'),
(340, '62', 'kalimantan tengah', '62.12', 'murung raya'),
(341, '62', 'kalimantan tengah', '62.13', 'barito timur'),
(342, '62', 'kalimantan tengah', '62.71', 'palangkaraya'),
(343, '63', 'kalimantan selatan', '63.01', 'tanah laut'),
(344, '63', 'kalimantan selatan', '63.02', 'kotabaru'),
(345, '63', 'kalimantan selatan', '63.03', 'banjar kalsel'),
(346, '63', 'kalimantan selatan', '63.04', 'barito kuala'),
(347, '63', 'kalimantan selatan', '63.05', 'tapin'),
(348, '63', 'kalimantan selatan', '63.06', 'hulu sungai selatan'),
(349, '63', 'kalimantan selatan', '63.07', 'hulu sungai tengah'),
(350, '63', 'kalimantan selatan', '63.08', 'hulu sungai utara'),
(351, '63', 'kalimantan selatan', '63.09', 'tabalong'),
(352, '63', 'kalimantan selatan', '63.1', 'tanah bumbu'),
(353, '63', 'kalimantan selatan', '63.11', 'balangan'),
(354, '63', 'kalimantan selatan', '63.71', 'banjarmasin'),
(355, '63', 'kalimantan selatan', '63.72', 'banjarbaru'),
(356, '64', 'kalimantan timur', '64.01', 'paser'),
(357, '64', 'kalimantan timur', '64.02', 'kutai kartanegara'),
(358, '64', 'kalimantan timur', '64.03', 'berau'),
(359, '64', 'kalimantan timur', '64.07', 'kutai barat'),
(360, '64', 'kalimantan timur', '64.08', 'kutai timur'),
(361, '64', 'kalimantan timur', '64.09', 'penajam paser utara'),
(362, '64', 'kalimantan timur', '64.11', 'mahakam ulu'),
(363, '64', 'kalimantan timur', '64.71', 'balikpapan'),
(364, '64', 'kalimantan timur', '64.72', 'samarinda'),
(365, '64', 'kalimantan timur', '64.74', 'bontang'),
(366, '65', 'kalimantan utara', '65.01', 'bulungan'),
(367, '65', 'kalimantan utara', '65.02', 'malinau'),
(368, '65', 'kalimantan utara', '65.03', 'nunukan'),
(369, '65', 'kalimantan utara', '65.04', 'tana tidung'),
(370, '65', 'kalimantan utara', '65.71', 'tarakan'),
(371, '71', 'sulawesi utara', '71.01', 'bolaang mongondow'),
(372, '71', 'sulawesi utara', '71.02', 'minahasa'),
(373, '71', 'sulawesi utara', '71.03', 'kepulauan sangihe'),
(374, '71', 'sulawesi utara', '71.04', 'kepulauan talaud'),
(375, '71', 'sulawesi utara', '71.05', 'minahasa selatan'),
(376, '71', 'sulawesi utara', '71.06', 'minahasa utara'),
(377, '71', 'sulawesi utara', '71.07', 'minahasa tenggara'),
(378, '71', 'sulawesi utara', '71.08', 'bolaang mongondow utara'),
(379, '71', 'sulawesi utara', '71.09', 'kepsiau tagulandang biaro'),
(380, '71', 'sulawesi utara', '71.1', 'bolaang mongondow timur'),
(381, '71', 'sulawesi utara', '71.11', 'bolaang mongondow selatan'),
(382, '71', 'sulawesi utara', '71.71', 'manado'),
(383, '71', 'sulawesi utara', '71.72', 'bitung'),
(384, '71', 'sulawesi utara', '71.73', 'tomohon'),
(385, '71', 'sulawesi utara', '71.74', 'kotamobagu'),
(386, '72', 'sulawesi tengah', '72.01', 'banggai'),
(387, '72', 'sulawesi tengah', '72.02', 'poso'),
(388, '72', 'sulawesi tengah', '72.03', 'donggala'),
(389, '72', 'sulawesi tengah', '72.04', 'toli toli'),
(390, '72', 'sulawesi tengah', '72.05', 'buol'),
(391, '72', 'sulawesi tengah', '72.06', 'morowali'),
(392, '72', 'sulawesi tengah', '72.07', 'banggai kepulauan'),
(393, '72', 'sulawesi tengah', '72.08', 'parigi moutong'),
(394, '72', 'sulawesi tengah', '72.09', 'tojo una una'),
(395, '72', 'sulawesi tengah', '72.1', 'sigi'),
(396, '72', 'sulawesi tengah', '72.11', 'banggai laut'),
(397, '72', 'sulawesi tengah', '72.12', 'morowali utara'),
(398, '72', 'sulawesi tengah', '72.71', 'palu'),
(399, '73', 'sulawesi selatan', '73.01', 'kepulauan selayar'),
(400, '73', 'sulawesi selatan', '73.02', 'bulukumba'),
(401, '73', 'sulawesi selatan', '73.03', 'bantaeng'),
(402, '73', 'sulawesi selatan', '73.04', 'jeneponto'),
(403, '73', 'sulawesi selatan', '73.05', 'takalar'),
(404, '73', 'sulawesi selatan', '73.06', 'gowa'),
(405, '73', 'sulawesi selatan', '73.07', 'sinjai'),
(406, '73', 'sulawesi selatan', '73.08', 'bone'),
(407, '73', 'sulawesi selatan', '73.09', 'maros'),
(408, '73', 'sulawesi selatan', '73.1', 'pangkajene kepulauan'),
(409, '73', 'sulawesi selatan', '73.11', 'barru'),
(410, '73', 'sulawesi selatan', '73.12', 'soppeng'),
(411, '73', 'sulawesi selatan', '73.13', 'wajo'),
(412, '73', 'sulawesi selatan', '73.14', 'sidenreng rappang'),
(413, '73', 'sulawesi selatan', '73.15', 'pinrang'),
(414, '73', 'sulawesi selatan', '73.16', 'enrekang'),
(415, '73', 'sulawesi selatan', '73.17', 'luwu'),
(416, '73', 'sulawesi selatan', '73.18', 'tana toraja'),
(417, '73', 'sulawesi selatan', '73.22', 'luwu utara'),
(418, '73', 'sulawesi selatan', '73.24', 'luwu timur'),
(419, '73', 'sulawesi selatan', '73.26', 'toraja utara'),
(420, '73', 'sulawesi selatan', '73.71', 'makassar'),
(421, '73', 'sulawesi selatan', '73.72', 'pare pare'),
(422, '73', 'sulawesi selatan', '73.73', 'palopo'),
(423, '74', 'sulawesi tenggara', '74.01', 'kolaka'),
(424, '74', 'sulawesi tenggara', '74.02', 'konawe'),
(425, '74', 'sulawesi tenggara', '74.03', 'muna'),
(426, '74', 'sulawesi tenggara', '74.04', 'buton'),
(427, '74', 'sulawesi tenggara', '74.05', 'konawe selatan'),
(428, '74', 'sulawesi tenggara', '74.06', 'bombana'),
(429, '74', 'sulawesi tenggara', '74.07', 'wakatobi'),
(430, '74', 'sulawesi tenggara', '74.08', 'kolaka utara'),
(431, '74', 'sulawesi tenggara', '74.09', 'konawe utara'),
(432, '74', 'sulawesi tenggara', '74.1', 'buton utara'),
(433, '74', 'sulawesi tenggara', '74.11', 'kolaka timur'),
(434, '74', 'sulawesi tenggara', '74.12', 'konawe kepulauan'),
(435, '74', 'sulawesi tenggara', '74.13', 'muna barat'),
(436, '74', 'sulawesi tenggara', '74.14', 'buton tengah'),
(437, '74', 'sulawesi tenggara', '74.15', 'buton selatan'),
(438, '74', 'sulawesi tenggara', '74.71', 'kendari'),
(439, '74', 'sulawesi tenggara', '74.72', 'bau bau'),
(440, '75', 'gorontalo', '75.01', 'gorontalo kabupaten'),
(441, '75', 'gorontalo', '75.02', 'boalemo'),
(442, '75', 'gorontalo', '75.03', 'bone bolango'),
(443, '75', 'gorontalo', '75.04', 'pahuwato'),
(444, '75', 'gorontalo', '75.05', 'gorontalo utara'),
(445, '75', 'gorontalo', '75.71', 'gorontalo kota'),
(446, '76', 'sulawesi barat', '76.01', 'mamuju utara'),
(447, '76', 'sulawesi barat', '76.02', 'mamuju'),
(448, '76', 'sulawesi barat', '76.03', 'mamasa'),
(449, '76', 'sulawesi barat', '76.04', 'polewali mandar'),
(450, '76', 'sulawesi barat', '76.05', 'majene'),
(451, '76', 'sulawesi barat', '76.06', 'mamuju tengah'),
(452, '81', 'maluku', '81.01', 'maluku tengah'),
(453, '81', 'maluku', '81.02', 'maluku tenggara'),
(454, '81', 'maluku', '81.03', 'maluku tenggara barat'),
(455, '81', 'maluku', '81.04', 'buru'),
(456, '81', 'maluku', '81.05', 'seram bagian timur'),
(457, '81', 'maluku', '81.06', 'seram bagian barat'),
(458, '81', 'maluku', '81.07', 'kepulauan aru'),
(459, '81', 'maluku', '81.08', 'maluku barat daya'),
(460, '81', 'maluku', '81.09', 'buru selatan'),
(461, '81', 'maluku', '81.71', 'ambon'),
(462, '81', 'maluku', '81.72', 'tual'),
(463, '82', 'maluku utara', '82.01', 'halmahera barat'),
(464, '82', 'maluku utara', '82.02', 'halmahera tengah'),
(465, '82', 'maluku utara', '82.03', 'halmahera utara'),
(466, '82', 'maluku utara', '82.04', 'halmahera selatan'),
(467, '82', 'maluku utara', '82.05', 'kepulauan sula'),
(468, '82', 'maluku utara', '82.06', 'halmahera timur'),
(469, '82', 'maluku utara', '82.07', 'pulau morotai'),
(470, '82', 'maluku utara', '82.08', 'pulau taliabu'),
(471, '82', 'maluku utara', '82.71', 'ternate'),
(472, '82', 'maluku utara', '82.72', 'tidore kepulauan'),
(473, '91', 'p a p u a', '91.01', 'merauke'),
(474, '91', 'p a p u a', '91.02', 'jayawijaya'),
(475, '91', 'p a p u a', '91.03', 'jayapura kabupaten'),
(476, '91', 'p a p u a', '91.04', 'nabire'),
(477, '91', 'p a p u a', '91.05', 'kepulauan yapen'),
(478, '91', 'p a p u a', '91.06', 'biak numfor'),
(479, '91', 'p a p u a', '91.07', 'puncak jaya'),
(480, '91', 'p a p u a', '91.08', 'pania'),
(481, '91', 'p a p u a', '91.09', 'mimika'),
(482, '91', 'p a p u a', '91.1', 'sarmi'),
(483, '91', 'p a p u a', '91.11', 'keerom'),
(484, '91', 'p a p u a', '91.12', 'pegunungan bintang'),
(485, '91', 'p a p u a', '91.13', 'yahukimo'),
(486, '91', 'p a p u a', '91.14', 'tolikara'),
(487, '91', 'p a p u a', '91.15', 'waropen'),
(488, '91', 'p a p u a', '91.16', 'boven digoel'),
(489, '91', 'p a p u a', '91.17', 'mappi'),
(490, '91', 'p a p u a', '91.18', 'asmat'),
(491, '91', 'p a p u a', '91.19', 'supior'),
(492, '91', 'p a p u a', '91.2', 'mamberamo raya'),
(493, '91', 'p a p u a', '91.21', 'mamberamo tengah'),
(494, '91', 'p a p u a', '91.22', 'yalimo'),
(495, '91', 'p a p u a', '91.23', 'lanny jaya'),
(496, '91', 'p a p u a', '91.24', 'nduga'),
(497, '91', 'p a p u a', '91.25', 'puncak'),
(498, '91', 'p a p u a', '91.26', 'dogiyai'),
(499, '91', 'p a p u a', '91.27', 'intan jaya'),
(500, '91', 'p a p u a', '91.28', 'deiyai'),
(501, '91', 'p a p u a', '91.71', 'jayapura kota'),
(502, '92', 'papua barat', '92.01', 'sorong kabupaten'),
(503, '92', 'papua barat', '92.02', 'manokwari'),
(504, '92', 'papua barat', '92.03', 'fak fak'),
(505, '92', 'papua barat', '92.04', 'sorong selatan'),
(506, '92', 'papua barat', '92.05', 'raja ampat'),
(507, '92', 'papua barat', '92.06', 'teluk bintuni'),
(508, '92', 'papua barat', '92.07', 'teluk wondama'),
(509, '92', 'papua barat', '92.08', 'kaimana'),
(510, '92', 'papua barat', '92.09', 'tambrauw'),
(511, '92', 'papua barat', '92.1', 'maybrat'),
(512, '92', 'papua barat', '92.11', 'manokwari selatan'),
(513, '92', 'papua barat', '92.12', 'pegunungan arfak'),
(514, '92', 'papua barat', '92.71', 'sorong kota');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

DROP TABLE IF EXISTS `pembeli`;
CREATE TABLE `pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 baru, 1 aktif, 2 suspend,3 delete',
  `phone` varchar(32) NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(32) NOT NULL,
  `pembeli_key` varchar(32) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `pembeli`
--

TRUNCATE TABLE `pembeli`;
--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `username`, `password`, `nama`, `status`, `phone`, `join_date`, `avatar`, `pembeli_key`, `last_login`) VALUES
(1, 'sumardi@sumardi.com', '82ea6d007f087efa9d52840eed117c3a', 'Sumardi', 0, '0812345', '2018-06-04 13:55:30', '20180604085524_8576_small.jpg', '', NULL),
(2, 'sumardo@sumardi.com', '82ea6d007f087efa9d52840eed117c3a', 'Sumardi', 0, '0812345', '2018-06-04 13:55:55', '20180604085524_8576_small.jpg', '', NULL),
(3, 'sujono@gmail.com', '760e6672851d43508ebc714590f20d07', 'Sujono', 1, '08166778899', '2018-06-04 13:57:13', '20180604092050_8256_small.jpg', '', NULL),
(4, 'maghfiramaulani95@gmail.com', '6e072feb0e61306c45e42760d0f5d355', 'Maghfira Rizki', 1, '085702062141', '2018-06-28 09:07:31', '20180629035130_9443_small.jpg', 'nGQM30P4NO4xLDns', NULL),
(5, 'cmsdesa1@gmail.com', 'a3040f90cc20fa672fe31efcae41d2db', 'coba', 1, '', '2018-07-10 05:05:43', '', '2o8XburZ0HXUxhTy', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL,
  `departemen` int(11) NOT NULL,
  `jabatan` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `email` varchar(254) NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `islogin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `pengguna`
--

TRUNCATE TABLE `pengguna`;
--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `password`, `departemen`, `jabatan`, `nama`, `email`, `isactive`, `islogin`) VALUES
(1, 'superadmin', '17c4520f6cfd1ab53d8745e84681eb49', 1, 1, 'Super Admin', 'agung@agung.com', 1, 0),
(8, 'ekopurnomo', '285c701ec6c7ccce009424717c34da67', 1, 4, 'Eko Purnomo', 'eko@purnomo.com', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `trail`
--

DROP TABLE IF EXISTS `trail`;
CREATE TABLE `trail` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `postingdate` datetime NOT NULL,
  `keterangan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `trail`
--

TRUNCATE TABLE `trail`;
--
-- Dumping data for table `trail`
--

INSERT INTO `trail` (`id`, `userid`, `username`, `postingdate`, `keterangan`) VALUES
(1, 1, 'superadmin', '2017-09-28 11:24:10', 'Login ke dashboard'),
(2, 1, 'superadmin', '2017-09-28 13:57:40', 'Logout dari dashboard'),
(3, 1, 'superadmin', '2017-09-28 13:57:56', 'Login ke dashboard'),
(4, 1, 'superadmin', '2017-09-29 08:04:42', 'Login ke dashboard'),
(5, 8, 'ekopurnomo', '2017-09-29 10:05:13', 'Login ke dashboard'),
(6, 1, 'superadmin', '2017-09-29 10:07:07', 'Login ke dashboard'),
(7, 8, 'ekopurnomo', '2017-09-29 13:16:45', 'Login ke dashboard'),
(8, 1, 'superadmin', '2017-09-29 14:42:26', 'Logout dari dashboard'),
(9, 1, 'superadmin', '2018-01-18 08:13:13', 'Login ke dashboard'),
(10, 1, 'superadmin', '2018-09-20 08:53:35', 'Login ke dashboard'),
(11, 1, 'superadmin', '2018-09-20 15:36:54', 'Login ke dashboard'),
(12, 1, 'superadmin', '2018-09-21 08:30:51', 'Login ke dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `user_privilege`
--

DROP TABLE IF EXISTS `user_privilege`;
CREATE TABLE `user_privilege` (
  `id` int(11) NOT NULL,
  `idpengguna` int(11) NOT NULL,
  `idarea` int(11) NOT NULL,
  `lihat` tinyint(4) NOT NULL,
  `tambah` tinyint(4) NOT NULL,
  `ubah` tinyint(4) NOT NULL,
  `hapus` tinyint(4) NOT NULL,
  `isprovide` tinyint(4) NOT NULL,
  `isapprove` tinyint(4) NOT NULL,
  `isrelease` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `user_privilege`
--

TRUNCATE TABLE `user_privilege`;
--
-- Dumping data for table `user_privilege`
--

INSERT INTO `user_privilege` (`id`, `idpengguna`, `idarea`, `lihat`, `tambah`, `ubah`, `hapus`, `isprovide`, `isapprove`, `isrelease`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1, 1, 1, 1, 1),
(3, 1, 3, 1, 1, 1, 1, 1, 1, 1),
(5, 1, 7, 1, 1, 1, 1, 1, 1, 1),
(18, 8, 1, 0, 0, 0, 0, 0, 0, 0),
(19, 8, 2, 0, 0, 0, 0, 0, 0, 0),
(20, 8, 3, 0, 0, 0, 0, 0, 0, 0),
(22, 8, 7, 0, 0, 0, 0, 0, 0, 0),
(66, 1, 13, 1, 1, 1, 1, 1, 1, 1),
(84, 8, 13, 0, 0, 0, 0, 0, 0, 0),
(85, 1, 14, 1, 1, 1, 1, 1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat_pembeli`
--
ALTER TABLE `alamat_pembeli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area_tugas`
--
ALTER TABLE `area_tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `def_privilege`
--
ALTER TABLE `def_privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_wilayah`
--
ALTER TABLE `master_wilayah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`) USING BTREE;

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trail`
--
ALTER TABLE `trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_privilege`
--
ALTER TABLE `user_privilege`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idpengguna` (`idpengguna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat_pembeli`
--
ALTER TABLE `alamat_pembeli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `area_tugas`
--
ALTER TABLE `area_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `def_privilege`
--
ALTER TABLE `def_privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_wilayah`
--
ALTER TABLE `master_wilayah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=515;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `trail`
--
ALTER TABLE `trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_privilege`
--
ALTER TABLE `user_privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
