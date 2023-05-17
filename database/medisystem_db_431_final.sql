-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2023 at 08:29 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
  `food_preference` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `creator_id`, `recipient_id`, `date_time`, `message_text`, `status`, `food_preference`, `location`) VALUES
(1, 123456, 654321, '2023-05-15 12:00:00', 'test', 'DENIED', 'test', 'Los Angeles'),
(2, 654321, 123456, '2023-10-10 12:00:00', 'test1', 'ACCEPTED', 'test1', 'New York City'),
(3, 123456, 654321, '2023-05-17 08:00:00', 'appointment test', 'DENIED', 'food', 'Los Angeles'),
(4, 654321, 123456, '2024-05-17 09:00:00', 'test_supplier test', 'ACCEPTED', 'food', 'New York City'),
(5, 123456, 654321, '2023-07-02 10:00:00', 'testappt', 'DENIED', 'testfood', 'Los Angeles'),
(6, 123456, 654321, '2023-05-17 21:00:00', 'testappointmentpls', 'ACCEPTED', 'food', 'Los Angeles');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `recipient_id`, `sender_id`, `date_time`, `message_text`, `read_status`) VALUES
(1, 123456, 654321, '2023-05-15 23:54:27', 'hey, this is a test', 'READ'),
(2, 654321, 123456, '2023-05-16 00:03:33', 'hey test_supplier, this is test_provider', 'READ'),
(3, 654321, 123456, '2023-05-16 00:04:14', 'hey, this is a reply to test_supplier', 'READ'),
(4, 123456, 654321, '2023-05-16 00:06:23', 'another test message :)', 'READ'),
(5, 123456, 654321, '2023-05-16 00:06:41', 'whats up.', 'READ'),
(6, 654321, 123456, '2023-05-16 00:07:30', 'not much, what about you?', 'READ'),
(7, 123456, 654321, '2023-05-16 01:46:15', 'hey test_provider', 'READ'),
(8, 654321, 123456, '2023-05-16 15:08:49', 'hey, please dont crash', 'UNREAD');

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
(1, 123456, 'test_provider', '$2y$10$CYJp5w5Yt3ZDebcj05mXBO9l06qxGC15OZAVrlKdnUAL.DNozDTPq', '2023-05-16 06:52:55', 'medical provider', 'testprovider@example.com', 'Los Angeles', 'Cardiovascular'),
(2, 654321, 'test_supplier', '$2y$10$CYJp5w5Yt3ZDebcj05mXBO9l06qxGC15OZAVrlKdnUAL.DNozDTPq', '2023-05-16 06:52:55', 'medical supplier', 'testsupplier@example.com', 'New York City', 'Surgical masks');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
