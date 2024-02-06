-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 01, 2024 at 11:51 AM
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
CREATE DATABASE IF NOT EXISTS `lost&found_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `lost&found_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminID` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ADMIN',
  PRIMARY KEY (`id`),
  UNIQUE KEY `adminID` (`adminID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `adminID`) VALUES
(1, 'ADMIN');

-- --------------------------------------------------------


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VIP` tinyint(1) NOT NULL DEFAULT '0'
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--
/*
INSERT INTO `user` (`id`, `userid`, `username`, `password`, `email`, `mobile`, `nickname`, `VIP`) VALUES
(1, 'ADMIN', 'admin', 'administrator', 'admin@mail.com', '24761234', 'admin', 1);
*/

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` varchar(2) COLLATE utf8mb4_unicode_ci  NOT NULL,
  `found` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `itemid`, `uid`, `district_id`, `found`) VALUES
(1, 'TP202', '54389231', '06', 0),
(2, 'YL202', '12239222', '09', 0),
(3, 'NC202', '12223444', '11', 0),
(4, 'TM103', '12223333', '08', 0),
(5, 'MK354', '13332333', '14', 0),
(6, 'TST32', '12322443', '13', 0),
(7, 'TW342', '12323442', '15', 0),
(8, 'TP342', '12663474', '17', 1),
(9, 'TST45', '12454355', '01', 1),
(10, 'ST453', '12546533', '02', 1),
(11, 'TM453', '17653774', '05', 0),
(12, 'YL002', '13554464', '18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `HK_districts`
--

DROP TABLE IF EXISTS `HK_districts`;
CREATE TABLE IF NOT EXISTS `HK_districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` int(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `HK_districts`
--

INSERT INTO `HK_districts` (`id`,`district_id` , `district_name`, `region_id`) VALUES
(1,'01', 'Islands', 1),
(2,'02', 'Kwai Tsing', 1),
(3,'03', 'North', 1),
(4,'04', 'Sai Kung', 1),
(5,'05', 'Sha Tin', 1),
(6,'06', 'Tai Po', 1),
(7,'07', 'Tsuen Wan', 1),
(8,'08', 'Tuen Mun', 1),
(9,'09', 'Yuen Long', 1),
(10,'10', 'Kowloon City', 2),
(11,'11', 'Kwun Tong', 2),
(12,'12', 'Sham Shui Po', 2),
(13,'13', 'Wong Tai Sin', 2),
(14,'14', 'Yau Tsim Mong', 2),
(15,'15', 'Central and Western', 3),
(16,'16', 'Eastern', 3),
(17,'17', 'Southern', 3),
(18,'18', 'Wan Chai', 3);


-- --------------------------------------------------------

--
-- Table structure for table `HK_region`
--


DROP TABLE IF EXISTS `HK_region`;
CREATE TABLE IF NOT EXISTS `HK_region` (
  `region_id` int(1) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `r_id` (`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `HK_region`
--
INSERT INTO `HK_region` (`region_id`, `name`) VALUES
(1, 'New Territories'),
(2, 'Kowloon'),
(3, 'Hong Kong Island');


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
