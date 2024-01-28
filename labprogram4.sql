-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2024 at 09:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--
CREATE DATABASE IF NOT EXISTS `college` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `college`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `4mh21cs050`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `4mh21cs050`;
CREATE TABLE `4mh21cs050` (
`SUBCODE` char(7)
,`TEST1` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `USN` char(10) NOT NULL,
  `SSID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`USN`, `SSID`) VALUES
('4MH21CS050', 101),
('4MH21CS055', 412),
('4MH21CS057', 415),
('4MH21CS030', 856),
('4MH21CS102', 985);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `Subcode` char(7) NOT NULL,
  `Title` varchar(20) DEFAULT NULL,
  `Sem` int(11) DEFAULT NULL,
  `CREDITS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Subcode`, `Title`, `Sem`, `CREDITS`) VALUES
('21CS41', 'M4', 4, 3),
('21CS51', 'ATC', 5, 3),
('21CS53', 'DBMS', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

DROP TABLE IF EXISTS `iamarks`;
CREATE TABLE `iamarks` (
  `USN` char(10) NOT NULL,
  `Subcode` char(7) NOT NULL,
  `SSID` int(11) NOT NULL,
  `Test1` int(11) NOT NULL,
  `Test2` int(11) NOT NULL,
  `Test3` int(11) NOT NULL,
  `FinalIA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`USN`, `Subcode`, `SSID`, `Test1`, `Test2`, `Test3`, `FinalIA`) VALUES
('4MH21CS050', '21CS51', 101, 30, 30, 30, 30),
('4MH21CS050', '21CS53', 101, 30, 30, 29, 30),
('4MH21CS055', '21CS41', 412, 30, 29, 27, 29.5),
('4MH21CS057', '21CS41', 415, 20, 21, 25, 23),
('4MH21CS102', '21CS51', 985, 28, 29, 27, 28.5),
('4MH21CS102', '21CS53', 985, 25, 26, 22, 25.5);

-- --------------------------------------------------------

--
-- Table structure for table `semsec`
--

DROP TABLE IF EXISTS `semsec`;
CREATE TABLE `semsec` (
  `SSID` int(11) NOT NULL,
  `Sem` int(11) NOT NULL,
  `Sec` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `semsec`
--

INSERT INTO `semsec` (`SSID`, `Sem`, `Sec`) VALUES
(101, 5, 'A'),
(412, 4, 'C'),
(415, 4, 'C'),
(856, 3, 'B'),
(985, 5, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `USN` char(10) NOT NULL,
  `SName` varchar(25) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`USN`, `SName`, `Address`, `Phone`, `Gender`) VALUES
('4MH21CS030', 'HAJIRA SUHANI', 'MYSORE', '9865741249', 'F'),
('4MH21CS050', 'MEHWISH', 'MYSORE', '9632104589', 'F'),
('4MH21CS055', 'NOUMAN', 'MYSOREE', '9874563219', 'M'),
('4MH21CS057', 'NABHA NADIYA', 'KUSHALNAGAR', '9632587419', 'F'),
('4MH21CS102', 'SUFIIYA SALAM', 'MYSORE', '9654781239', 'F');

-- --------------------------------------------------------

--
-- Structure for view `4mh21cs050`
--
DROP TABLE IF EXISTS `4mh21cs050`;

DROP VIEW IF EXISTS `4mh21cs050`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `4mh21cs050`  AS SELECT `iamarks`.`Subcode` AS `SUBCODE`, `iamarks`.`Test1` AS `TEST1` FROM `iamarks` WHERE `iamarks`.`USN` = '4MH21CS050' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`USN`),
  ADD KEY `SSID` (`SSID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Subcode`);

--
-- Indexes for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD PRIMARY KEY (`USN`,`Subcode`,`SSID`),
  ADD KEY `Subcode` (`Subcode`),
  ADD KEY `SSID` (`SSID`);

--
-- Indexes for table `semsec`
--
ALTER TABLE `semsec`
  ADD PRIMARY KEY (`SSID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`USN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`SSID`) REFERENCES `semsec` (`SSID`);

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `iamarks_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `student` (`USN`),
  ADD CONSTRAINT `iamarks_ibfk_2` FOREIGN KEY (`Subcode`) REFERENCES `course` (`Subcode`),
  ADD CONSTRAINT `iamarks_ibfk_3` FOREIGN KEY (`SSID`) REFERENCES `semsec` (`SSID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
