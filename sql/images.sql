-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: db.3wa.io
-- Generation Time: Feb 09, 2024 at 06:40 AM
-- Server version: 5.7.33-0ubuntu0.18.04.1-log
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maridoucet_bre01_eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `alt` varchar(511) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `url`, `alt`) VALUES
(1, 'dreamcatcher', 'https://picsum.photos/id/104/800/600', 'A feather and leather dreamcatcher with red wooden pearls'),
(2, 'vintage car', 'https://picsum.photos/id/111/800/600', 'A black car from the 1950\'s with plates that say FARMER BOY'),
(3, 'tricycle', 'https://picsum.photos/id/146/800/600', 'A red child tricycle'),
(4, 'vintage clock', 'https://picsum.photos/id/175/800/600', 'A vintage clock'),
(5, 'vw van', 'https://picsum.photos/id/183/800/600', 'A used blue volkswagen van from the 1970\'s'),
(6, 'highland cow', 'https://picsum.photos/id/200/800/600', 'a brown highland cow'),
(7, 'teapot', 'https://picsum.photos/id/225/800/600', 'A glass teapot'),
(8, 'vintage camera', 'https://picsum.photos/id/250/800/600', 'Vintage Ikon camera with Zeiss optic'),
(9, 'fresh produce', 'https://picsum.photos/id/292/800/600', 'Fresh produce including pepper berries and red onions'),
(10, 'honey', 'https://picsum.photos/id/312/800/600', 'Dark honey');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
