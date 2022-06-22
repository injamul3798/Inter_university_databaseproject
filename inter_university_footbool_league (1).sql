-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2022 at 06:16 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inter_university_footbool_league`
--

-- --------------------------------------------------------

--
-- Table structure for table `extra_player`
--

CREATE TABLE `extra_player` (
  `EP_id` int(20) NOT NULL,
  `Ep_name` varchar(20) DEFAULT NULL,
  `dept` varchar(20) DEFAULT NULL,
  `P_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `extra_player`
--

INSERT INTO `extra_player` (`EP_id`, `Ep_name`, `dept`, `P_id`) VALUES
(100, 'Najmussssss', 'CSE', 37),
(101, 'Najmusssss', 'CS', 38),
(102, 'Najmusss', 'CuE', 39),
(103, 'Najmuszz', 'CSEu', 40),
(104, 'Najmusdd', 'CStgtE', 41);

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `Date_of_match` varchar(20) DEFAULT NULL,
  `score` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`Date_of_match`, `score`) VALUES
('2022', '2-2'),
('2000', '2-4'),
('2002', '3-2'),
('2004', '6-7'),
('2001', '3-6'),
('1999', '1-2'),
('1990', '4-2'),
('1988', '1-6');

-- --------------------------------------------------------

--
-- Table structure for table `injury_info`
--

CREATE TABLE `injury_info` (
  `P_name` varchar(20) DEFAULT NULL,
  `Problem` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `injury_info`
--

INSERT INTO `injury_info` (`P_name`, `Problem`) VALUES
('Injam', 'Probem '),
('Saiful', 'Fever');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `P_id` int(20) DEFAULT NULL,
  `P_name` varchar(20) DEFAULT NULL,
  `Captain` varchar(20) DEFAULT NULL,
  `skill` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`P_id`, `P_name`, `Captain`, `skill`) VALUES
(123, 'INJAM', 'Injamul', 'Striker'),
(124, 'INJAML', 'Injamul', 'non Striker'),
(125, 'INJAM HAQUE', 'Shakil', 'goal kepper'),
(126, 'NASJMUS', 'Injamul', 'Goal kepper'),
(127, 'INJAM', 'saiful', 'Striker');

-- --------------------------------------------------------

--
-- Table structure for table `refree_info`
--

CREATE TABLE `refree_info` (
  `ID` int(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Address` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `refree_info`
--

INSERT INTO `refree_info` (`ID`, `Name`, `Address`) VALUES
(37, 'injam', 'Ashuia'),
(374, 'Anam', 'Dattapara'),
(3798, 'Najmus', 'Ashuia'),
(37983, 'Najmus', 'Savar');

-- --------------------------------------------------------

--
-- Table structure for table `refree_table`
--

CREATE TABLE `refree_table` (
  `R_id` int(20) DEFAULT NULL,
  `R_name` varchar(20) DEFAULT NULL,
  `Salary` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `refree_table`
--

INSERT INTO `refree_table` (`R_id`, `R_name`, `Salary`) VALUES
(1001, 'Injamul', 1000),
(1002, 'Najmus', 1000),
(1003, 'Injamul', 2000),
(1004, 'Najmus', 1000),
(10155, 'Shakil', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `T_name` varchar(20) DEFAULT NULL,
  `Coach` varchar(20) DEFAULT NULL,
  `Captain` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`T_name`, `Coach`, `Captain`, `city`) VALUES
('Retro', 'Najm', 'Injamul', 'Kushtia'),
('Beliver', 'Najmu', 'Injam haque', 'Kushtia'),
('Unbeaten', 'Najmus', 'shakil', 'natore'),
('No beliver', 'Najm haque', 'saiful', 'Utara'),
('teamRetro', 'Najm islam', 'Riyad', 'Dhaka');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v2`
-- (See below for the actual view)
--
CREATE TABLE `v2` (
`P_id` int(20)
,`P_name` varchar(20)
,`Captain` varchar(20)
,`skill` varchar(20)
,`T_name` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
CREATE TABLE `view1` (
`P_name` varchar(20)
,`Captain` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `v2`
--
DROP TABLE IF EXISTS `v2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v2`  AS SELECT `player`.`P_id` AS `P_id`, `player`.`P_name` AS `P_name`, `player`.`Captain` AS `Captain`, `player`.`skill` AS `skill`, `team`.`T_name` AS `T_name` FROM (`player` join `team` on(`player`.`Captain` = `team`.`Captain`))  ;

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS SELECT `player`.`P_name` AS `P_name`, `player`.`Captain` AS `Captain` FROM `player` WHERE `player`.`Captain` = 'Injamul''Injamul'  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `extra_player`
--
ALTER TABLE `extra_player`
  ADD PRIMARY KEY (`EP_id`);

--
-- Indexes for table `refree_info`
--
ALTER TABLE `refree_info`
  ADD PRIMARY KEY (`ID`,`Name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
