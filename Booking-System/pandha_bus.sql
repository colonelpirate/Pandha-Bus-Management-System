-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 04, 2019 at 06:47 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(3) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Daily Buses'),
(2, 'Night Buses');

-- --------------------------------------------------------

--
-- Table structure for table `cost`
--

DROP TABLE IF EXISTS `cost`;
CREATE TABLE IF NOT EXISTS `cost` (
  `start` varchar(255) NOT NULL,
  `stopage` varchar(255) NOT NULL,
  `category` int(3) NOT NULL,
  `cost` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cost`
--

INSERT INTO `cost` (`start`, `stopage`, `category`, `cost`) VALUES
('Buea', 'Bamenda', 2, 6000),
('Buea', 'Yaounde', 1, 5000),
('Buea', 'Kumba', 2, 2000),
('Buea', 'Douala', 1, 2000),
('Limbe', 'Douala', 1, 2500),
('Limbe', 'Yaounde', 1, 5000),
('Limbe', 'Bamenda', 2, 6000),
('Bamenda', 'Yaounde', 2, 6000),
('Bamenda', 'Buea', 2, 6000),
('Bamenda', 'Kumba', 1, 5000),
('Douala', 'Yaounde', 2, 4000),
('Ngoundere', 'Edea', 1, 9000),
('Mamfe', 'Kumba', 1, 5000),
('Bamenda', 'Mamfe', 1, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(3) NOT NULL AUTO_INCREMENT,
  `bus_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_age` int(3) NOT NULL,
  `source` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `cost` int(4) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `bus_id`, `user_id`, `user_name`, `user_age`, `source`, `destination`, `date`, `cost`) VALUES
(22, 2, 5, 'Tyron Mbiachare', 21, 'Buea', 'Yaounde', '2019-02-03', 5000),
(23, 7, 5, 'Kodang Bryan', 12, 'Bamenda', 'Mamfe', '2019-02-03', 3000),
(24, 7, 5, 'Kodang Bryan', 12, 'Bamenda', 'Mamfe', '2019-02-03', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(3) NOT NULL AUTO_INCREMENT,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_source` varchar(255) NOT NULL,
  `post_destination` varchar(255) NOT NULL,
  `post_query_count` int(3) NOT NULL,
  `max_seats` int(3) NOT NULL,
  `available_seats` int(3) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_source`, `post_destination`, `post_query_count`, `max_seats`, `available_seats`) VALUES
(2, 1, 'Buea to Yaounde', 'Tyron', '2019-02-06', 'bus1.jpg', 'Runs daily except Tuesday\r\nA/C Bus', 'Buea', 'Yaounde', 3, 50, 41),
(3, 1, 'Bamenda to Kumba', 'Tyron', '2019-02-06', 'bus2.jpg', 'Runs daily \r\nLowest fare among all', 'Bamenda', 'Kumba', 1, 50, 47),
(4, 1, 'Limbe to Douala', 'Tyron', '2019-02-16', 'bus3.jpg', 'Runs Daily', 'Limbe', 'Douala', 6, 70, 50),
(5, 2, 'Buea to Yaounde', 'Tyron', '2019-02-25', 'bus4.jpg', 'Runs only at night', 'Buea', 'Yaounde', 0, 70, 70),
(6, 1, 'Ngoundere to Edea', 'Tyron', '2019-02-28', 'bus5.jpg', 'This is a daily bus', 'Ngoundere', 'Edea', 0, 50, 50),
(7, 1, 'Bamenda to Mamfe', 'Tyron', '2019-03-29', 'bus7.jpg', 'Runs Daily', 'Bamenda', 'Mamfe', 0, 40, 43),
(8, 1, 'Mamfe to Kumba', 'Tyron', '2019-04-30', 'bus9.jpg', 'Runs daily except Tuesday\r\nA/C Bus', 'Mamfe', 'Kumba', 0, 50, 40),
(9, 2, 'Buea to Bamenda', 'Tyron', '2019-02-02', 'bus_notused.jpg', 'Runs daily except Tuesday\r\nA/C Bus', 'Buea', 'Bamenda', 0, 50, 41),
(10, 1, 'Buea to Douala', 'Tyron', '2019-02-12', 'bus_regis.png', 'Runs daily \r\nLowest fare among all', 'Buea', 'Douala', 0, 50, 47),
(11, 2, 'Buea to Kumba', 'Tyron', '2019-02-16', 'bus1.jpg', 'Runs at night', 'Buea', 'Kumba', 0, 70, 50),
(12, 1, 'Limbe to Yaounde', 'Tyron', '2019-02-25', 'bus2.jpg', 'Runs daily', 'Limbe', 'Yaounde', 0, 70, 70),
(13, 2, 'Limbe to Bamenda', 'Tyron', '2019-02-28', 'bus3.jpg', 'Nights only', 'Limbe', 'Bamenda', 0, 50, 50),
(14, 2, 'Bamenda to Yaounde', 'Tyron', '2019-02-29', 'bus4.jpg', 'Runs only night shifts', 'Bamenda', 'Yaounde', 0, 40, 43),
(15, 2, 'Bamenda to Buea', 'Tyron', '2019-04-30', 'bus5.jpg', 'Runs nights except Tuesday\r\nA/C Bus', 'Bamenda', 'Buea', 0, 50, 40),
(16, 2, 'Douala to Yaounde', 'Tyron', '2019-03-30', 'bus6.jpg', 'Nights only\r\nA/C Bus', 'Douala', 'Yaounde', 0, 70, 60);

-- --------------------------------------------------------

--
-- Table structure for table `query`
--

DROP TABLE IF EXISTS `query`;
CREATE TABLE IF NOT EXISTS `query` (
  `query_id` int(3) NOT NULL AUTO_INCREMENT,
  `query_bus_id` int(3) NOT NULL,
  `query_user` varchar(255) NOT NULL,
  `query_email` varchar(255) NOT NULL,
  `query_date` date NOT NULL,
  `query_content` text NOT NULL,
  `query_replied` varchar(255) NOT NULL,
  PRIMARY KEY (`query_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `query`
--

INSERT INTO `query` (`query_id`, `query_bus_id`, `query_user`, `query_email`, `query_date`, `query_content`, `query_replied`) VALUES
(14, 2, 'Tyron', '', '2019-02-02', 'This services are great', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
CREATE TABLE IF NOT EXISTS `seats` (
  `bus_id` int(3) NOT NULL,
  `max_seats` int(3) NOT NULL,
  `available_seats` int(3) NOT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_phoneno` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_phoneno`, `user_image`, `user_role`) VALUES
(5, 'tyron', 'colonel1998', 'Tyron', 'Mbiachare', 'mbiacharetyron@gmail.com', '683185006', 'IMG_2017-08-05 07-14-43.jpg', 'admin'),
(31, 'colonelpirate', 'colonel1998', 'Tyron', 'Mbiachare', 'mbiacharetyron@gmail.com', '7683185006', '20171030_094632(0).jpg', 'subscriber'),
(32, 'kodang', 'njiboy', 'Kodang ', 'Bryan', 'kodangbryan16@gmail.com', '9677784046', 'user_default.jpg', 'subscriber'),
(33, 'durran', 'durran', 'Teke', 'Durran', 'mylestande@yahoo.fr', '9683185006', '20170830_134639.jpg', 'subscriber');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
