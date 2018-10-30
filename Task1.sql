-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 29, 2018 at 10:44 AM
-- Server version: 5.6.41
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nathanla_msg`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `cnt_id` int(11) NOT NULL,
  `cnt_code` varchar(45) DEFAULT NULL,
  `cnt_title` varchar(45) NOT NULL,
  `cnt_created` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`cnt_id`, `cnt_code`, `cnt_title`, `cnt_created`) VALUES
(1, '1', 'USA', '2018-01-01'),
(2, '972', 'Israel', '2017-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `numbers`
--

CREATE TABLE `numbers` (
  `num_id` int(11) NOT NULL,
  `cnt_id` int(11) NOT NULL,
  `num_number` varchar(45) NOT NULL,
  `num_created` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `numbers`
--

INSERT INTO `numbers` (`num_id`, `cnt_id`, `num_number`, `num_created`) VALUES
(1, 1, '1010233241', '2018-10-13'),
(2, 1, '101212241', '2017-07-02'),
(3, 2, '0525830119', '2018-10-10'),
(4, 2, '0522589769', '2018-02-11');

-- --------------------------------------------------------

--
-- Table structure for table `send_log`
--

CREATE TABLE `send_log` (
  `log_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `num_id` int(11) NOT NULL,
  `log_message` varchar(45) NOT NULL,
  `log_success` tinyint(4) NOT NULL,
  `log_created` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `send_log`
--

INSERT INTO `send_log` (`log_id`, `usr_id`, `num_id`, `log_message`, `log_success`, `log_created`) VALUES
(1, 1, 1, 'Success', 1, '2018-10-13'),
(2, 1, 3, 'Success', 1, '2017-07-12'),
(3, 1, 3, 'Disconnected', 0, '2018-10-10'),
(4, 2, 2, 'Unavailable number', 0, '2018-11-11'),
(5, 2, 4, 'Unavailable number', 0, '2018-11-10'),
(6, 3, 3, 'Success', 1, '2018-12-11'),
(7, 3, 2, 'Unavailable number', 0, '2018-11-02'),
(8, 4, 1, 'Unavailable number', 0, '2018-12-09'),
(9, 4, 1, 'Success', 1, '2018-12-23'),
(10, 5, 2, 'Disconnected', 0, '2018-12-21'),
(11, 6, 4, 'Disconnected', 0, '2018-11-29'),
(12, 6, 3, 'Success', 1, '2018-11-20'),
(13, 6, 3, 'Success', 1, '2018-11-19'),
(14, 6, 3, 'Success', 1, '2018-11-19'),
(15, 4, 3, 'Failed', 0, '2018-11-19'),
(16, 2, 3, 'Failed', 0, '2018-11-19'),
(17, 1, 1, 'Success', 1, '2018-12-12'),
(18, 1, 1, 'Success', 1, '2018-12-12'),
(19, 1, 1, 'Failed', 0, '2018-12-12'),
(20, 1, 1, 'Success', 1, '2018-12-12');

-- --------------------------------------------------------



--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usr_id` int(11) NOT NULL,
  `usr_name` varchar(45) NOT NULL,
  `usr_active` tinyint(4) NOT NULL,
  `usr_created` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usr_id`, `usr_name`, `usr_active`, `usr_created`) VALUES
(1, 'Yotam Achrak', 1, '2017-12-01'),
(2, 'Bo Marcos', 0, '2017-07-01'),
(3, 'Justin Crus', 1, '2017-07-12'),
(4, 'Jasicca Davis', 1, '2017-05-28'),
(5, 'Bruno\r\nJames', 1, '2018-11-01'),
(6, 'Dany Ainge', 0, '2017-07-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`cnt_id`);

--
-- Indexes for table `numbers`
--
ALTER TABLE `numbers`
  ADD PRIMARY KEY (`num_id`);

--
-- Indexes for table `send_log`
--
ALTER TABLE `send_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `send_log_aggregated`
--
ALTER TABLE `send_log_aggregated`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `cnt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `numbers`
--
ALTER TABLE `numbers`
  MODIFY `num_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `send_log`
--
ALTER TABLE `send_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `send_log_aggregated`
--
ALTER TABLE `send_log_aggregated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
