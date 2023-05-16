-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2023 at 09:09 PM
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

CREATE TABLE `appointments` (
  `id` bigint(20) NOT NULL,
  `creator_id` bigint(20) NOT NULL,
  `recipient_id` bigint(20) NOT NULL,
  `date_time` datetime NOT NULL,
  `message_text` longtext NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `creator_id`, `recipient_id`, `date_time`, `message_text`, `status`) VALUES
(5, 65247, 3650429641, '2023-05-12 10:00:00', 'talk :)', 'DENIED');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_requests`
--

CREATE TABLE `appointment_requests` (
  `id` bigint(20) NOT NULL,
  `creator_id` bigint(20) NOT NULL,
  `recipient_id` bigint(20) NOT NULL,
  `date_time` datetime NOT NULL,
  `message_text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_providers`
--

CREATE TABLE `medical_providers` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `specialty` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_providers`
--

INSERT INTO `medical_providers` (`user_id`, `user_name`, `email`, `city`, `specialty`) VALUES
(65247, 'danielc', 'danielc888@gmail.com', 'Cypress', 'Cardiovascular');

-- --------------------------------------------------------

--
-- Table structure for table `medical_suppliers`
--

CREATE TABLE `medical_suppliers` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `specialty` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_suppliers`
--

INSERT INTO `medical_suppliers` (`user_id`, `user_name`, `email`, `city`, `specialty`) VALUES
(3650429641, 'testuser', 'test@gmail.com', 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `recipient_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_time` datetime NOT NULL,
  `message_text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`recipient_id`, `sender_id`, `date_time`, `message_text`) VALUES
(65247, 3650429641, '2023-05-10 08:52:36', 'hello!'),
(3650429641, 65247, '2023-05-10 08:53:24', 'hey!'),
(3650429641, 65247, '2023-05-11 00:54:10', 'hi!'),
(3650429641, 65247, '2023-05-11 02:05:43', 'this is a test msg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_type` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `user_name`, `password`, `date`, `user_type`, `email`, `city`) VALUES
(22, 65247, 'danielc', '$2y$10$zBtl/D9C0OD54dH4JKoFXe7qiT4A8usGxHAf14EHqUDObiRS2rVga', '2023-05-09 23:50:43', 'medical provider', 'danielc888@gmail.com', 'Cypress'),
(23, 3650429641, 'testuser', '$2y$10$9PBc9GFQ9hQQz3ZbK6PV2OIRjqArN7LIDdcDOaHz/QO4R/IGmk7vO', '2023-05-09 23:53:36', 'medical supplier', 'test@gmail.com', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment_requests`
--
ALTER TABLE `appointment_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_providers`
--
ALTER TABLE `medical_providers`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `medical_suppliers`
--
ALTER TABLE `medical_suppliers`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `date` (`date`),
  ADD KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `appointment_requests`
--
ALTER TABLE `appointment_requests`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
