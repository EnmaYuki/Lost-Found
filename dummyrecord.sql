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
  `VIP` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--
/*
INSERT INTO `user` (`id`, `userid`, `role`, `password`) VALUES
(1, 'ADMIN', 'a', 'administrator'),
*/

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `assessment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `found` int(1) NOT NULL,
  `location` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment`
--
/*
INSERT INTO `assessment` (`id`, `courseid`, `aid`, `weighting`, `total_score`) VALUES
(1, 'BA202', 'a1', 10, 25),
(2, 'BA202', 'a2', 15, 50),
(3, 'BA202', 'exam', 75, 100),
(4, 'CE103', 'exam', 50, 100),
(5, 'CE301', 'a1', 20, 100),
(6, 'EG105', 'a1', 35, 100),
(7, 'CE103', 'a1', 25, 50),
(8, 'CE301', 'a2', 20, 100),
(9, 'EG105', 'a2', 35, 100),
(10, 'CE103', 'a2', 25, 50),
(11, 'CE301', 'exam', 60, 100),
(12, 'EG105', 'exam', 30, 100);
*/
-- --------------------------------------------------------

--
-- Table structure for table `assessment_record`
--

DROP TABLE IF EXISTS `assessment_record`;
CREATE TABLE IF NOT EXISTS `assessment_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aid` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment_record`
--
/*
INSERT INTO `assessment_record` (`id`, `student_id`, `course_id`, `aid`, `score`) VALUES
(1, '11223654', 'BA202', 'a1', 21),
(2, '11223654', 'BA202', 'a2', 25),
(3, '11223654', 'BA202', 'exam', 60),
(4, '12353265', 'CE301', 'a1', 23.5),
(5, '12353265', 'CE301', 'a2', 23.5),
(6, '12353265', 'CE301', 'exam', 55),
(7, '14223652', 'EG105', 'a1', 40),
(8, '14223652', 'EG105', 'a2', 30),
(9, '14223652', 'EG105', 'exam', 60),
(10, '14223652', 'CE103', 'a1', 46),
(11, '14223652', 'CE103', 'a2', 40),
(12, '14223652', 'CE103', 'exam', 50);
*/

-- --------------------------------------------------------

--
-- Table structure for table `course`
--
/*

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `courseid` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` int(2) NOT NULL,
  PRIMARY KEY (`courseid`),
  UNIQUE KEY `course_id` (`courseid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course`
--
INSERT INTO `course` (`courseid`, `title`, `credit`) VALUES
('BA202', 'Business Administration', 5),
('CE103', 'Java Foundation', 3),
('CE301', 'Computer Software', 6),
('EG105', 'Engineering', 10);
*/

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

/*
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sname` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student`
--
INSERT INTO `student` (`id`, `studentid`, `sname`, `courseid`) VALUES
(1, '11223654', 'Apple', 'BA202'),
(2, '12353265', 'Chan', 'CE301'),
(8, '12354364', 'Tester', 'BA202'),
(9, '12354964', 'Tes', 'CE103');
*/

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

/*
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `teacherid` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courseid` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher`
--
INSERT INTO `teacher` (`id`, `teacherid`, `name`, `mobile`, `courseid`) VALUES
(1, '38459313', 'Amy', '64562765', 'BA202'),
(2, '38459341', 'Hash', '65437643', 'CE103'),
(3, '38459341', 'Hash', '65437643', 'CE301'),
(4, '38459888', 'Rick', '96543455', 'EG105'),
(5, '56989346', 'Tim', '90785634', NULL);
*/

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
