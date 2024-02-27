-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 03:07 AM
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
-- Database: `prg6`
--

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ROL_NO` int(11) NOT NULL,
  `NAME` varchar(25) NOT NULL,
  `AGE` int(11) NOT NULL,
  `PHONE` varchar(10) DEFAULT NULL,
  `ADDRESS` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ROL_NO`, `NAME`, `AGE`, `PHONE`, `ADDRESS`) VALUES
(1, 'HARSH', 18, '985647135', 'DELHI'),
(2, 'PRATIK', 19, '965412359', 'BIHAR'),
(3, 'RIHANA', 20, '9874568236', 'SILGURI'),
(4, 'DEEP', 18, '9875641236', 'RAMNAGAR'),
(5, 'SAPTARHI', 19, '8745632158', 'KOLKATA');

-- --------------------------------------------------------

--
-- Table structure for table `student_course`
--

CREATE TABLE `student_course` (
  `COURSE_ID` int(11) NOT NULL,
  `ROL_NO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_course`
--

INSERT INTO `student_course` (`COURSE_ID`, `ROL_NO`) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ROL_NO`);

--
-- Indexes for table `student_course`
--
ALTER TABLE `student_course`
  ADD KEY `ROL_NO` (`ROL_NO`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_course`
--
ALTER TABLE `student_course`
  ADD CONSTRAINT `student_course_ibfk_1` FOREIGN KEY (`ROL_NO`) REFERENCES `student` (`ROL_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
