-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 20, 2019 at 10:48 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `mes` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `mes`, `phone_num`, `date`) VALUES
(1, 'first post', 'abc@gmail.co', 'firstpost', '1234567890', '2019-02-17 23:25:10'),
(2, 'adnan', 'ads@gmail.com', 'dwd', 'adshe@gmail.com', '2019-02-17 23:56:26'),
(3, 'adnan', 'ads@gmail.com', 'hhhe', '9622840886', '2019-02-17 23:56:38'),
(4, 'adnan sheikh', 'sheikhadnan886@gmail.com', 'we have not good faculty', '9622840886', '2019-02-17 23:59:05'),
(5, 'altaf', 'altaf@gmail.com', 'u r not good', '9622840886', '2019-02-18 01:13:13'),
(6, 'altaf', 'altaf@gmail.com', 'u r not good', '9622840886', '2019-02-18 01:17:55'),
(7, 'ashraf', 'ashraf@gmail.com', 'u r so nice and humble', '1234567890', '2019-02-18 01:18:38'),
(8, 'adil', 'adil@gmail.com', 'hw r u \r\ni think u r in sgr', '9596467340', '2019-02-18 01:20:09'),
(9, 'adil', 'adil@gmail.com', 'hw r u \r\ni think u r in sgr', '9596467340', '2019-02-18 01:23:29'),
(10, 'assd', 'ashraf@gmail.com', 'hi hw r uuu', '9876543210', '2019-02-18 01:23:54'),
(11, 'ashraf', 'ashraf@gmail.com', 'hw r u blaaaaaaaaaaa', '9596467340', '2019-02-18 01:27:05'),
(12, 'adil', 'adil@gmail.com', 'hw r u r u fine\r\n', '233', '2019-02-18 01:31:36'),
(13, 'ad', '', '', '', '2019-02-18 01:33:47'),
(14, 'adil', 'altaf@gmail.com', 'hw r u ii', '22', '2019-02-18 01:34:15'),
(15, 'nan', 'ads@gmail.com', 'wwww', '23', '2019-02-18 01:39:57'),
(16, 'adil', 'ashraf@gmail.com', 'he  ww ww', '9596467340', '2019-02-18 01:50:45'),
(17, 'adnan sheikh', 'sheikhadnan886@gmail.com', 'hw r u iwas missing u', '979524249', '2019-02-19 00:07:52'),
(18, 'adnan sheikh', 'ads@gmail.com', 'hw r u i was miising u', '9596467340', '2019-02-19 00:11:01'),
(19, 'adnan', 'adshe886@gmail.com', 'hwww', '9622840886', '2019-02-19 00:15:13'),
(20, 'adnan sheikh', 'ashraf@gmail.com', 'hw r u jksjdkshds', '9876543210', '2019-02-19 00:17:03'),
(21, 'AA', 'ashraf@gmail.com', 'HH', '9622840886', '2019-02-19 00:22:15'),
(22, 'JJ', 'ads@gmail.com', 'HT ', '9622840886', '2019-02-19 00:28:17'),
(23, 'adnan', 'ads@gmail.com', 'hiiiiiiiiiiii', '9622840886', '2019-02-19 00:30:54'),
(24, 'adnan', 'ads@gmail.com', 'hiiiiiiiiiiii', '9622840886', '2019-02-19 00:31:23'),
(25, 'a', 'adil@gmail.com', 'cc', '9622840886', '2019-02-19 00:31:44'),
(26, 'adnan sheikh', 'ashraf@gmail.com', 'hw r u', '9622840886', '2019-02-19 00:33:55'),
(27, 'adnan sheikh', 'ads@gmail.com', 'hw r u', '9622840886', '2019-02-19 00:39:22'),
(28, 'adnan', 'ads@gmail.com', 'hiii', '9622840886', '2019-02-19 23:33:50'),
(29, 'adnan sheikh', 'adil@gmail.com', 'hyyy boy hr u', '9876543210', '2019-02-20 15:07:43'),
(30, 'adnan sheikh', 'sheikhadnan43@gmail.com', 'hugjj jyfyfuftyduy', '9622840886', '2019-02-20 15:09:22'),
(31, 'jjjj', 'ads@gmail.com', 'hiihh hiooooo', '99', '2019-02-20 15:11:39'),
(32, 'adil', 'sheikhadnan886@gmail.com', 'hw r uuu', '976', '2019-02-20 15:12:53'),
(33, 'adnan sheikh', 'altaf@gmail.com', 'hr u uuu', '9622840886', '2019-02-20 15:13:40'),
(34, 'ashraf', 'altaf@gmail.com', 'heyyyyyyyyyy', '979524249', '2019-02-20 15:14:57'),
(35, 'ashraf', 'altaf@gmail.com', 'heyyyyyyyyyy', '979524249', '2019-02-20 15:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'About Gsoc', 'first-post', 'The Google Summer of Code, often abbreviated to GSoC, is an international annual program, first held from May to August 2005,[1] in which Google awards stipends, which depends on the purchasing power parity of the country the student\'s university belongs to,[2] to all students who successfully complete a requested free and open-source software coding project during the summer. The program is open to university students aged 18 or over.\r\n\r\nThe idea for the Summer of Code came directly from Google\'s founders, Sergey Brin and Larry Page.[1] From 2007 until 2009 Leslie Hawthorn, who has been involved in the project since 2006, was the program manager.[3] From 2010 until 2015, Carol Smith was the program manager.[4] In 2016, Stephanie Taylor took over management of the program.\r\n', 'home-bg.jpg', '2019-02-19 23:45:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
