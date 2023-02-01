-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2022 at 08:52 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_meja`
--

CREATE TABLE `tb_meja` (
  `id_meja` int(5) NOT NULL,
  `no_meja` int(2) NOT NULL,
  `status` enum('Kosong','Reservasi') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `id_menu` int(5) NOT NULL,
  `jenis` enum('Makanan','Minuman') NOT NULL,
  `nama` varchar(20) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id_pesanan` int(5) NOT NULL,
  `tgl_pesanan` datetime NOT NULL,
  `jumlah` int(3) NOT NULL,
  `total` int(10) NOT NULL,
  `status` enum('Pesan','Proses','Selesai') NOT NULL,
  `id_menu` int(5) NOT NULL,
  `id_reservasi` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_reservasi`
--

CREATE TABLE `tb_reservasi` (
  `id_reservasi` int(5) NOT NULL,
  `id_user` int(5) NOT NULL,
  `jam` varchar(10) NOT NULL,
  `jumlah_orang` int(2) NOT NULL,
  `id_meja` int(5) NOT NULL,
  `catatan` text NOT NULL,
  `tgl_reservasi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(5) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telp` int(13) NOT NULL,
  `email` varchar(30) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_meja`
--
ALTER TABLE `tb_meja`
  ADD PRIMARY KEY (`id_meja`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_reservasi` (`id_reservasi`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `tb_reservasi`
--
ALTER TABLE `tb_reservasi`
  ADD PRIMARY KEY (`id_reservasi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_meja` (`id_meja`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD CONSTRAINT `tb_menu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `tb_pesanan` (`id_menu`);

--
-- Constraints for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD CONSTRAINT `tb_pesanan_ibfk_1` FOREIGN KEY (`id_reservasi`) REFERENCES `tb_reservasi` (`id_reservasi`);

--
-- Constraints for table `tb_reservasi`
--
ALTER TABLE `tb_reservasi`
  ADD CONSTRAINT `tb_reservasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`),
  ADD CONSTRAINT `tb_reservasi_ibfk_2` FOREIGN KEY (`id_meja`) REFERENCES `tb_meja` (`id_meja`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
