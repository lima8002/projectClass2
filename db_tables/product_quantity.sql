-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 23, 2019 at 10:22 PM
-- Server version: 5.7.25-0ubuntu0.16.04.2
-- PHP Version: 7.2.15-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_quantity`
--

CREATE TABLE `product_quantity` (
  `product_quantity_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_quantity`
--

INSERT INTO `product_quantity` (`product_quantity_id`, `product_id`, `quantity`, `updated`) VALUES
(1, 2, 9, '2019-02-17 12:32:06'),
(3, 40, 9, '2019-02-17 12:35:08'),
(4, 57, 24, '2019-02-17 12:35:16'),
(5, 1, 19, '2019-02-17 12:35:28'),
(6, 12, 21, '2019-02-17 12:35:33'),
(7, 67, 13, '2019-02-17 12:35:35'),
(8, 32, 11, '2019-02-17 12:35:35'),
(9, 60, 9, '2019-02-17 12:35:36'),
(11, 41, 14, '2019-02-17 12:35:39'),
(12, 37, 22, '2019-02-17 12:35:41'),
(13, 47, 8, '2019-02-17 12:35:41'),
(14, 26, 18, '2019-02-17 12:35:42'),
(15, 20, 29, '2019-02-17 12:35:42'),
(17, 80, 25, '2019-02-17 12:35:45'),
(18, 15, 9, '2019-02-17 12:35:45'),
(19, 4, 24, '2019-02-17 12:35:46'),
(20, 71, 28, '2019-02-17 12:35:47'),
(21, 70, 14, '2019-02-17 12:35:47'),
(22, 73, 10, '2019-02-17 12:35:48'),
(23, 28, 12, '2019-02-17 12:35:48'),
(24, 58, 7, '2019-02-17 12:35:49'),
(25, 36, 6, '2019-02-17 12:35:50'),
(27, 21, 17, '2019-02-17 12:35:51'),
(28, 45, 20, '2019-02-17 12:35:52'),
(29, 53, 6, '2019-02-17 12:35:53'),
(30, 42, 13, '2019-02-17 12:35:54'),
(31, 64, 15, '2019-02-17 12:35:54'),
(33, 72, 10, '2019-02-17 12:35:55'),
(34, 52, 30, '2019-02-17 12:35:56'),
(39, 30, 8, '2019-02-17 12:35:59'),
(40, 16, 12, '2019-02-17 12:36:00'),
(42, 56, 20, '2019-02-17 12:36:01'),
(43, 11, 0, '2019-02-17 12:36:02'),
(46, 59, 1, '2019-02-17 12:36:04'),
(47, 22, 18, '2019-02-17 12:36:04'),
(48, 17, 9, '2019-02-17 12:36:21'),
(49, 76, 13, '2019-02-17 12:36:28'),
(50, 46, 10, '2019-02-17 12:36:29'),
(51, 38, 24, '2019-02-17 12:36:30'),
(57, 55, 27, '2019-02-17 12:36:35'),
(64, 13, 24, '2019-02-17 12:36:39'),
(67, 51, 28, '2019-02-17 12:36:41'),
(68, 19, 10, '2019-02-17 12:36:42'),
(69, 24, 1, '2019-02-17 12:36:42'),
(74, 50, 24, '2019-02-17 12:36:47'),
(77, 49, 1, '2019-02-17 12:36:49'),
(79, 23, 22, '2019-02-17 12:36:50'),
(83, 7, 3, '2019-02-17 12:36:53'),
(92, 54, 28, '2019-02-17 12:36:58'),
(98, 61, 7, '2019-02-17 12:37:01'),
(99, 3, 13, '2019-02-17 12:37:02'),
(107, 18, 0, '2019-02-17 12:37:06'),
(109, 39, 8, '2019-02-17 12:37:08'),
(111, 34, 25, '2019-02-17 12:37:10'),
(113, 29, 18, '2019-02-17 12:37:11'),
(115, 27, 6, '2019-02-17 12:37:13'),
(116, 77, 5, '2019-02-17 12:37:13'),
(119, 79, 17, '2019-02-17 12:37:16'),
(124, 44, 15, '2019-02-17 12:37:19'),
(129, 63, 22, '2019-02-17 12:37:51'),
(132, 66, 29, '2019-02-17 12:37:58'),
(133, 75, 18, '2019-02-17 12:38:01'),
(134, 25, 24, '2019-02-17 12:38:06'),
(135, 65, 14, '2019-02-17 12:38:06'),
(137, 6, 0, '2019-02-17 12:38:08'),
(140, 10, 15, '2019-02-17 12:38:12'),
(141, 81, 27, '2019-02-17 12:38:13'),
(143, 8, 3, '2019-02-17 12:38:14'),
(144, 9, 14, '2019-02-17 12:38:15'),
(147, 68, 30, '2019-02-17 12:38:17'),
(158, 14, 30, '2019-02-17 12:38:23'),
(171, 62, 17, '2019-02-17 12:38:32'),
(172, 78, 1, '2019-02-17 12:38:33'),
(178, 5, 15, '2019-02-17 12:38:37'),
(187, 33, 24, '2019-02-17 12:38:45'),
(188, 35, 11, '2019-02-17 12:38:46'),
(189, 31, 23, '2019-02-17 12:39:43'),
(190, 43, 18, '2019-02-17 12:40:24'),
(191, 48, 12, '2019-02-17 12:41:26'),
(192, 69, 18, '2019-02-17 12:41:56'),
(193, 74, 21, '2019-02-17 12:42:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_quantity`
--
ALTER TABLE `product_quantity`
  ADD PRIMARY KEY (`product_quantity_id`),
  ADD UNIQUE KEY `product_id_2` (`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_quantity`
--
ALTER TABLE `product_quantity`
  MODIFY `product_quantity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_quantity`
--
ALTER TABLE `product_quantity`
  ADD CONSTRAINT `product_quantity_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;