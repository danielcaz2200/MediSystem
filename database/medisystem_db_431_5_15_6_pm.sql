-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 03:42 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `creator_id`, `recipient_id`, `date_time`, `message_text`, `status`) VALUES
(1, 654321, 123456, '2023-05-15 10:00:00', 'testing', 'ACCEPTED'),
(2, 123456, 654321, '2023-05-15 17:00:00', 'bbq', 'ACCEPTED'),
(3, 123456, 654321, '2023-05-01 22:00:00', 'test util', 'ACCEPTED');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `recipient_id`, `sender_id`, `date_time`, `message_text`, `read_status`) VALUES
(1, 654321, 123456, '2023-05-14 23:29:14', 'This is a test', 'UNREAD'),
(2, 123456, 654321, '2023-05-14 23:29:42', 'hey', 'UNREAD');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `user_name`, `password`, `date`, `user_type`, `email`, `city`, `specialty`) VALUES
(1, 123456, 'test_provider', '$2y$10$GoJZ4AMcfJSRAbVjoaZ5o.ReYiuwan58pNvAVgi/YVRdsShnYetTG', '2023-05-15 06:24:56', 'medical provider', 'testprovider@example.com', 'Los Angeles', 'Cardiovascular'),
(2, 654321, 'test_supplier', '$2y$10$GoJZ4AMcfJSRAbVjoaZ5o.ReYiuwan58pNvAVgi/YVRdsShnYetTG', '2023-05-15 06:24:56', 'medical supplier', 'testsupplier@example.com', 'New York City', 'Surgical masks');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
