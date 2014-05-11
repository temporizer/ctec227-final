-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: May 11, 2014 at 08:04 AM
-- Server version: 5.5.34
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ctec227_final`
--
CREATE DATABASE IF NOT EXISTS `ctec227_final` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ctec227_final`;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `date_time` int(11) NOT NULL,
  `active` enum('0','1') NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `active` enum('0','1') NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
CREATE TABLE IF NOT EXISTS `rank` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(255) NOT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`rank_id`, `rank_name`) VALUES
(1, 'Admin'),
(2, 'Project Manager'),
(3, 'Task Worker');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_title` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_title`) VALUES
(1, 'Open'),
(2, 'Completed'),
(3, 'Completed - Pending'),
(4, 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `project_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task_user`
--

DROP TABLE IF EXISTS `task_user`;
CREATE TABLE IF NOT EXISTS `task_user` (
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `active` enum('0','1') NOT NULL,
  `username` varchar(255) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `rank_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `active`, `username`, `pass`, `rank_id`) VALUES
(1, 'Madonna', 'Taylor', 'm.taylor@greenwell.com', '1', 'm.taylor', 'TLE35YMQ6VF', 1),
(2, 'August', 'Vaughan', 'a.vaughan@greenwell.com', '1', 'a.vaughan', 'JEZ85UOM7UC', 2),
(3, 'Demetria', 'Thompson', 'd.thompson@greenwell.com', '1', 'd.thompson', 'GDZ24JHJ2QM', 1),
(4, 'Caleb', 'Bridges', 'c.bridges@greenwell.com', '0', 'c.bridges', 'UMS55YMO1ET', 3),
(5, 'Chandler', 'Woodard', 'c.woodard@greenwell.com', '0', 'c.woodard', 'ZCA67PEU5QO', 2),
(6, 'Wang', 'Pierce', 'w.pierce@greenwell.com', '1', 'w.pierce', 'MSC52FFQ3TP', 3),
(7, 'Dominic', 'Boyd', 'd.boyd@greenwell.com', '0', 'd.boyd', 'VKQ25CXZ3EG', 1),
(8, 'Aaron', 'Hale', 'a.hale@greenwell.com', '1', 'a.hale', 'IWD93OHJ9BR', 3),
(9, 'Oliver', 'Campbell', 'o.campbell@greenwell.com', '0', 'o.campbell', 'NOX07OLC5YE', 2),
(10, 'Herrod', 'Blake', 'h.blake@greenwell.com', '1', 'h.blake', 'ABD45VKX4EA', 1),
(11, 'Coby', 'Whitehead', 'c.whitehead@greenwell.com', '0', 'c.whitehead', 'HQO53PKQ2MY', 1),
(12, 'Dorian', 'Kemp', 'd.kemp@greenwell.com', '0', 'd.kemp', 'EEH18EMI9IE', 1),
(13, 'Griffith', 'Tyson', 'g.tyson@greenwell.com', '0', 'g.tyson', 'CGP53WQL1QN', 2),
(14, 'Kylan', 'Montoya', 'k.montoya@greenwell.com', '1', 'k.montoya', 'BLC53PAA0VW', 1),
(15, 'Macey', 'Britt', 'm.britt@greenwell.com', '0', 'm.britt', 'YGI96HJB1CO', 2),
(16, 'Dean', 'Ortiz', 'd.ortiz@greenwell.com', '1', 'd.ortiz', 'MLL19QUO4PZ', 3),
(17, 'Tatum', 'Harris', 't.harris@greenwell.com', '1', 't.harris', 'LBV73AOQ7LF', 2),
(18, 'Brent', 'Holman', 'b.holman@greenwell.com', '0', 'b.holman', 'IDI09TYC7EE', 3),
(19, 'Abraham', 'Guy', 'a.guy@greenwell.com', '1', 'a.guy', 'IBU85YEW7RD', 1),
(20, 'Chandler', 'Estes', 'c.estes@greenwell.com', '1', 'c.estes', 'MIQ81MVW4CO', 2),
(21, 'Latifah', 'Rose', 'l.rose@greenwell.com', '1', 'l.rose', 'SLO80NBD1JW', 3),
(22, 'Wang', 'Daniels', 'w.daniels@greenwell.com', '0', 'w.daniels', 'QBC76JVH2YO', 2),
(23, 'Hedley', 'Fuller', 'h.fuller@greenwell.com', '0', 'h.fuller', 'RBH24JRO6IN', 2),
(24, 'Logan', 'Bass', 'l.bass@greenwell.com', '0', 'l.bass', 'VLN19UDC6QJ', 1),
(25, 'Alfonso', 'King', 'a.king@greenwell.com', '0', 'a.king', 'RHF54JEA0YA', 1),
(26, 'Silas', 'Cline', 's.cline@greenwell.com', '0', 's.cline', 'CEI71IUD3FV', 3),
(27, 'Ashely', 'Mcdonald', 'a.mcdonald@greenwell.com', '1', 'a.mcdonald', 'EXY69KHJ4QW', 1),
(28, 'Rae', 'Hall', 'r.hall@greenwell.com', '1', 'r.hall', 'HMH11TKT0RA', 3),
(29, 'Ulric', 'Woodard', 'u.woodard@greenwell.com', '0', 'u.woodard', 'HGB96ZNI8CA', 1),
(30, 'Holmes', 'Wilkins', 'h.wilkins@greenwell.com', '1', 'h.wilkins', 'YMK04MJB3EV', 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
