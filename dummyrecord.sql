-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 06, 2024 at 05:33 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lost&found_db`
--
CREATE DATABASE IF NOT EXISTS `lost&found_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lost&found_db`;

-- --------------------------------------------------------

--
-- Table structure for table `hk_districts`
--

DROP TABLE IF EXISTS `hk_districts`;
CREATE TABLE IF NOT EXISTS `hk_districts` (
  `district_id` int(2) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `district_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` int(1) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hk_districts`
--

INSERT INTO `hk_districts` (`district_id`, `district_name`, `region_id`) VALUES
(01, 'Islands', 1),
(02, 'Kwai Tsing', 1),
(03, 'North', 1),
(04, 'Sai Kung', 1),
(05, 'Sha Tin', 1),
(06, 'Tai Po', 1),
(07, 'Tsuen Wan', 1),
(08, 'Tuen Mun', 1),
(09, 'Yuen Long', 1),
(10, 'Kowloon City', 2),
(11, 'Kwun Tong', 2),
(12, 'Sham Shui Po', 2),
(13, 'Wong Tai Sin', 2),
(14, 'Yau Tsim Mong', 2),
(15, 'Central and Western', 3),
(16, 'Eastern', 3),
(17, 'Southern', 3),
(18, 'Wan Chai', 3);

-- --------------------------------------------------------

--
-- Table structure for table `hk_region`
--

DROP TABLE IF EXISTS `hk_region`;
CREATE TABLE IF NOT EXISTS `hk_region` (
  `region_id` int(1) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `region_id` (`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hk_region`
--

INSERT INTO `hk_region` (`region_id`, `name`) VALUES
(1, 'New Territories'),
(2, 'Kowloon'),
(3, 'Hong Kong Island');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `item_id` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `description` varchar(99) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` int(2) UNSIGNED ZEROFILL NOT NULL,
  `time` date NOT NULL,
  `found` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `target_user`
--

DROP TABLE IF EXISTS `target_user`;
CREATE TABLE IF NOT EXISTS `target_user` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VIP` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `target_user`
--

INSERT INTO `target_user` (`id`, `username`, `password`, `email`, `mobile`, `nickname`, `VIP`) VALUES
(00000001, 'user1', 'user001', 'user@mail.com', '32425834', 'user01', 0),
(00000002, 'user2', 'user002', 'user2@mail.com', '54128673', 'user2', 0);

--
-- Triggers `target_user`
--
DROP TRIGGER IF EXISTS `update_user`;
DELIMITER $$
CREATE TRIGGER `update_user` AFTER INSERT ON `target_user` FOR EACH ROW BEGIN
  INSERT INTO `user` (`uid`, `username`, `password`, `admin`)
  VALUES (NEW.id+1, NEW.username, NEW.password, 0);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_md5` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `username`, `password`, `password_md5`, `admin`) VALUES
(00000001, 'ADMIN', 'administration', 'e52e7ce4ac2458867d05eaad577560db', 1),
(00000002, 'user1', 'user001', '97f3c717da19b4697ae9884e67aabce6', 0),
(00000003, 'user2', 'user002', '8b63b2922634ffaeab2019e50f13dd20', 0);

--
-- Triggers `user`
--
DROP TRIGGER IF EXISTS `set_password_md5`;
DELIMITER $$
CREATE TRIGGER `set_password_md5` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
    SET NEW.password_md5 = MD5(NEW.password);
END
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
