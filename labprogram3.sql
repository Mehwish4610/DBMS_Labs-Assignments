-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2024 at 08:13 AM
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
-- Database: `movies`
--
CREATE DATABASE IF NOT EXISTS `movies` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `movies`;

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
  `Act_id` int(11) NOT NULL,
  `Act_Name` varchar(25) NOT NULL,
  `Act_Gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`Act_id`, `Act_Name`, `Act_Gender`) VALUES
(201, 'Michelle Williams', 'F'),
(202, 'Paul Dano', 'M'),
(6301, 'Tom Hanks', 'M'),
(6302, 'Edward Burns', 'M'),
(7401, 'Gerald du Maurier', 'M'),
(7402, 'Gertrude Lawrence', 'F'),
(7403, 'Benita Hume', 'F'),
(7404, 'Karen Black', 'F'),
(7405, 'Bruce Dern', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE `director` (
  `Dir_id` int(11) NOT NULL,
  `Dir_Name` varchar(25) NOT NULL,
  `Dir_Phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`Dir_id`, `Dir_Name`, `Dir_Phone`) VALUES
(1, 'Alfred Hitchcock', '9874563219'),
(2, 'Steven Spielberg', '9685741239');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `Mov_id` int(11) NOT NULL,
  `Mov_Title` varchar(50) NOT NULL,
  `Mov_Year` year(4) NOT NULL,
  `Mov_Lang` varchar(15) NOT NULL,
  `Dir_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`Mov_id`, `Mov_Title`, `Mov_Year`, `Mov_Lang`, `Dir_id`) VALUES
(1, 'Family Plot', '1976', 'English', 1),
(2, 'Lord Cambers Ladies', '1932', 'English', 1),
(3, 'Saving Private Ryan', '1998', 'English', 2),
(4, 'The Fabelmans', '2022', 'English', 2);

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
CREATE TABLE `movie_cast` (
  `Act_id` int(11) NOT NULL,
  `Mov_id` int(11) NOT NULL,
  `Role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`Act_id`, `Mov_id`, `Role`) VALUES
(201, 3, 'Mother'),
(201, 4, 'Father'),
(202, 4, 'Mother'),
(6301, 3, 'Captain sufferi'),
(6302, 3, 'Soldier'),
(7401, 2, 'Doctor'),
(7402, 2, 'Lady Camber'),
(7403, 2, 'Janet King'),
(7404, 1, 'Fran'),
(7405, 1, 'George Lumley');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `Mov_id` int(11) DEFAULT NULL,
  `Rev_Stars` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`Mov_id`, `Rev_Stars`) VALUES
(1, 3),
(2, 4),
(3, 5),
(4, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`Act_id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`Dir_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Mov_id`),
  ADD KEY `Dir_id` (`Dir_id`);

--
-- Indexes for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`Act_id`,`Mov_id`),
  ADD KEY `Mov_id` (`Mov_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD KEY `Mov_id` (`Mov_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`Dir_id`) REFERENCES `director` (`Dir_id`);

--
-- Constraints for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`Act_id`) REFERENCES `actor` (`Act_id`),
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`Mov_id`) REFERENCES `movies` (`Mov_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`Mov_id`) REFERENCES `movies` (`Mov_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
