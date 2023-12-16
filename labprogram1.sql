-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2023 at 10:58 AM
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
-- Database: `library`
--
CREATE DATABASE IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `library`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `BOOK_ID` int(11) NOT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `PUBLISHER_NAME` varchar(20) DEFAULT NULL,
  `PUB_YEAR` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BOOK_ID`, `TITLE`, `PUBLISHER_NAME`, `PUB_YEAR`) VALUES
(1, 'DBMS', 'MC GRAW HILL', '2012-05-01'),
(2, 'ADBMS', 'PEARSON', '2015-03-09'),
(3, 'CN', 'RANDOM HOUSE', '2016-01-05');

-- --------------------------------------------------------

--
-- Stand-in structure for view `books_avail`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `books_avail`;
CREATE TABLE `books_avail` (
`BOOK_ID` int(11)
,`TITLE` varchar(50)
,`NO_OF_COPIES` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

DROP TABLE IF EXISTS `book_authors`;
CREATE TABLE `book_authors` (
  `BOOK_ID` int(11) NOT NULL,
  `AUTHOR_NAME` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`BOOK_ID`, `AUTHOR_NAME`) VALUES
(1, 'NAVATHE'),
(2, 'JHON');

-- --------------------------------------------------------

--
-- Table structure for table `book_copies`
--

DROP TABLE IF EXISTS `book_copies`;
CREATE TABLE `book_copies` (
  `BOOK_ID` int(11) NOT NULL,
  `PROGRAMME_ID` int(11) NOT NULL,
  `NO_OF_COPIES` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_copies`
--

INSERT INTO `book_copies` (`BOOK_ID`, `PROGRAMME_ID`, `NO_OF_COPIES`) VALUES
(1, 10, 50),
(2, 11, 20);

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

DROP TABLE IF EXISTS `book_lending`;
CREATE TABLE `book_lending` (
  `BOOK_ID` int(11) NOT NULL,
  `PROGRAMME_ID` int(11) NOT NULL,
  `CARD_NO` int(11) NOT NULL,
  `DATE_OUT` date DEFAULT NULL,
  `DUE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`BOOK_ID`, `PROGRAMME_ID`, `CARD_NO`, `DATE_OUT`, `DUE_DATE`) VALUES
(1, 10, 110, '2017-01-01', '2017-01-15'),
(1, 12, 123, '2017-09-15', '2017-10-25'),
(1, 12, 124, '2017-02-01', '2017-02-10'),
(2, 11, 122, '2017-05-01', '2017-05-15'),
(2, 11, 124, '2017-02-15', '2017-03-25'),
(3, 11, 124, '2017-02-15', '2017-03-05'),
(3, 12, 124, '2017-02-01', '2017-02-10');

-- --------------------------------------------------------

--
-- Table structure for table `library_programme`
--

DROP TABLE IF EXISTS `library_programme`;
CREATE TABLE `library_programme` (
  `PROGRAMME_ID` int(11) NOT NULL,
  `PROGRAMME_NAME` varchar(40) DEFAULT NULL,
  `ADDRESS` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_programme`
--

INSERT INTO `library_programme` (`PROGRAMME_ID`, `PROGRAMME_NAME`, `ADDRESS`) VALUES
(10, 'CSE', 'MYSORE'),
(11, 'ISE', 'MYSORE'),
(12, 'ECE', 'MYSORE');

-- --------------------------------------------------------

--
-- Stand-in structure for view `p1`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `p1`;
CREATE TABLE `p1` (
`BOOK_ID` int(11)
,`TITLE` varchar(50)
,`PUBLISHER_NAME` varchar(20)
,`PUB_YEAR` date
);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE `publisher` (
  `NAME` varchar(40) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`NAME`, `Address`, `Phone`) VALUES
('MC GRAW HILL', 'BANGLORE', '9874125632'),
('PEARSON', 'MYSORE', '1245789632'),
('RANDOM HOUSE', 'MYSORE', '9988774455');

-- --------------------------------------------------------

--
-- Structure for view `books_avail`
--
DROP TABLE IF EXISTS `books_avail`;

DROP VIEW IF EXISTS `books_avail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `books_avail`  AS SELECT `b`.`BOOK_ID` AS `BOOK_ID`, `b`.`TITLE` AS `TITLE`, `c`.`NO_OF_COPIES` AS `NO_OF_COPIES` FROM (`book` `b` join `book_copies` `c`) WHERE `b`.`BOOK_ID` = `c`.`BOOK_ID` ;

-- --------------------------------------------------------

--
-- Structure for view `p1`
--
DROP TABLE IF EXISTS `p1`;

DROP VIEW IF EXISTS `p1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `p1`  AS SELECT `book`.`BOOK_ID` AS `BOOK_ID`, `book`.`TITLE` AS `TITLE`, `book`.`PUBLISHER_NAME` AS `PUBLISHER_NAME`, `book`.`PUB_YEAR` AS `PUB_YEAR` FROM `book` WHERE `book`.`PUB_YEAR` between '2014' and '2018' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BOOK_ID`),
  ADD KEY `PUBLISHER_NAME` (`PUBLISHER_NAME`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`BOOK_ID`);

--
-- Indexes for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD PRIMARY KEY (`BOOK_ID`,`PROGRAMME_ID`),
  ADD KEY `PROGRAMME_ID` (`PROGRAMME_ID`);

--
-- Indexes for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`BOOK_ID`,`PROGRAMME_ID`,`CARD_NO`),
  ADD KEY `PROGRAMME_ID` (`PROGRAMME_ID`);

--
-- Indexes for table `library_programme`
--
ALTER TABLE `library_programme`
  ADD PRIMARY KEY (`PROGRAMME_ID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`NAME`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`PUBLISHER_NAME`) REFERENCES `publisher` (`NAME`);

--
-- Constraints for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`BOOK_ID`) ON DELETE CASCADE;

--
-- Constraints for table `book_copies`
--
ALTER TABLE `book_copies`
  ADD CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`BOOK_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_copies_ibfk_2` FOREIGN KEY (`PROGRAMME_ID`) REFERENCES `library_programme` (`PROGRAMME_ID`) ON DELETE CASCADE;

--
-- Constraints for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD CONSTRAINT `book_lending_ibfk_2` FOREIGN KEY (`PROGRAMME_ID`) REFERENCES `library_programme` (`PROGRAMME_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_lending_ibfk_3` FOREIGN KEY (`BOOK_ID`) REFERENCES `book` (`BOOK_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
