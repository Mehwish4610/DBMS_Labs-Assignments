-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2024 at 09:04 AM
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
-- Database: `company`
--
CREATE DATABASE IF NOT EXISTS `company` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `company`;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DNo` int(11) NOT NULL,
  `DName` varchar(20) DEFAULT NULL,
  `MgrSSN` int(11) DEFAULT NULL,
  `MgrStartDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DNo`, `DName`, `MgrSSN`, `MgrStartDate`) VALUES
(1, 'ACCOUNTS', 101, '0000-00-00'),
(2, 'IT', 102, '0000-00-00'),
(3, 'ECE', 103, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `dlocation`
--

DROP TABLE IF EXISTS `dlocation`;
CREATE TABLE `dlocation` (
  `DNo` int(11) NOT NULL,
  `DLoc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dlocation`
--

INSERT INTO `dlocation` (`DNo`, `DLoc`) VALUES
(1, 'MYSORE'),
(2, 'BENGALURU'),
(3, 'MUMBAI');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `SSN` int(11) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Salary` double DEFAULT NULL,
  `SuperSSN` int(11) DEFAULT NULL,
  `DNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SSN`, `FName`, `LName`, `Address`, `Gender`, `Salary`, `SuperSSN`, `DNo`) VALUES
(101, 'Jhon', 'Scott', 'Mysore', 'M', 5000, 101, 1),
(102, 'MEHWISH', ' ', 'MYSORE', 'F', 250000, 101, 2),
(103, 'NABHA', 'NADIYA', 'KUSHALNAGAR', 'F', 150000, 103, 3),
(104, 'NOUMAN', 'SHARIFF', 'MYSORE', 'M', 250000, NULL, NULL),
(105, 'SUDIYA', 'SALAM', 'BENGLURU', 'F', 1000000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `PNo` int(11) NOT NULL,
  `PName` varchar(20) DEFAULT NULL,
  `PLocation` varchar(20) DEFAULT NULL,
  `DNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`PNo`, `PName`, `PLocation`, `DNo`) VALUES
(1, 'IoT', 'BLR', 2),
(2, 'MICROPROCESSORS AND ', 'MUMBAI', 3);

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
CREATE TABLE `works_on` (
  `SSN` int(11) NOT NULL,
  `PNo` int(11) NOT NULL,
  `Hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`SSN`, `PNo`, `Hours`) VALUES
(102, 1, 50),
(103, 1, 40),
(104, 2, 60),
(105, 2, 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DNo`),
  ADD KEY `MgrSSN` (`MgrSSN`);

--
-- Indexes for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD PRIMARY KEY (`DNo`,`DLoc`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `SuperSSN` (`SuperSSN`),
  ADD KEY `DNo` (`DNo`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`PNo`),
  ADD KEY `DNo` (`DNo`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`SSN`,`PNo`),
  ADD KEY `PNo` (`PNo`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MgrSSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD CONSTRAINT `dlocation_ibfk_1` FOREIGN KEY (`DNo`) REFERENCES `department` (`DNo`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SuperSSN`) REFERENCES `employee` (`SSN`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DNo`) REFERENCES `department` (`DNo`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`DNo`) REFERENCES `department` (`DNo`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`),
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`PNo`) REFERENCES `project` (`PNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
