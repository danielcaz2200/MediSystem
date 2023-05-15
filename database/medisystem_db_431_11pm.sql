-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2023 at 08:06 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medisystem_db_431`
--
CREATE DATABASE IF NOT EXISTS `medisystem_db_431` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `medisystem_db_431`;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE IF NOT EXISTS `appointments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) NOT NULL,
  `recipient_id` bigint(20) NOT NULL,
  `date_time` datetime NOT NULL,
  `message_text` longtext NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `creator_id`, `recipient_id`, `date_time`, `message_text`, `status`) VALUES
(1, 4824121930063470, 64955050043788, '2023-05-14 09:00:00', 'test', 'ACCEPTED');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recipient_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_time` datetime NOT NULL,
  `message_text` longtext NOT NULL,
  `read_status` varchar(100) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `recipient_id`, `sender_id`, `date_time`, `message_text`, `read_status`) VALUES
(1, 1611, 73779589, '2023-05-15 05:30:21', 'hello world', 'READ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_type` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `date` (`date`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `user_name`, `password`, `date`, `user_type`, `email`, `city`, `specialty`) VALUES
(3, 4824121930063470, 'test', '$2y$10$1FFUmtXaSv9DVSSpHPPwle2GzL/ynmJb79tTHHajx/Sx4ZmKdpwVO', '2023-05-15 05:41:13', 'medical provider', 'test@gmail.com', 'testcity', 'test'),
(4, 7537196179247, 'supplier1', '$2y$10$mytXivDbxkD.RdlMy8aEaO/UHtZnGq3.lWz8HhSGTixKv6SW5idIC', '2023-05-15 05:42:06', 'medical supplier', 'supplier1@gmail.com', 'supplier1', 'supplier1'),
(5, 64955050043788, 'supplier2@gmail.com', '$2y$10$3GSkYahiW1w1M0Aw7FphY.neVrIJDaeCaV8/VAxDaQ0zJZYxmN2h6', '2023-05-15 05:42:32', 'medical supplier', 'supplier2@gmail.com', 'supplier2@gmail.com', 'supplier2');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
