<?php

// Database does not exist, create it and tables
$sql = "CREATE DATABASE IF NOT EXISTS $dbname";

if (!mysqli_query($conn, $sql)) {
    die("Sorry, database creation failed: " . mysqli_error($conn));
}

if (!mysqli_select_db($conn, $dbname)) {
    die("Sorry, could not select db: " . mysqli_error($conn));
}

$tables = [
    "CREATE TABLE IF NOT EXISTS `appointments` (
        `id` bigint(20) NOT NULL AUTO_INCREMENT,
        `creator_id` bigint(20) NOT NULL,
        `recipient_id` bigint(20) NOT NULL,
        `date_time` datetime NOT NULL,
        `message_text` longtext NOT NULL,
        `status` varchar(100) NOT NULL,
        PRIMARY KEY (`id`)
      );",
    "CREATE TABLE IF NOT EXISTS medical_providers (user_id bigint(20) NOT NULL, user_name varchar(100) NOT NULL, email varchar(100) NOT NULL, city varchar(100) NOT NULL, specialty varchar(100) NOT NULL, PRIMARY KEY (user_id));",
    "CREATE TABLE IF NOT EXISTS medical_suppliers (user_id bigint(20) NOT NULL, user_name varchar(100) NOT NULL, email varchar(100) NOT NULL, city varchar(100) NOT NULL, specialty varchar(100) NOT NULL, PRIMARY KEY (user_id));",
    "CREATE TABLE IF NOT EXISTS messages (message_id bigint(20) NOT NULL AUTO_INCREMENT, recipient_id bigint(20) NOT NULL, sender_id bigint(20) NOT NULL, date_time datetime NOT NULL, message_text longtext NOT NULL, `read_status` tinyint(1) NOT NULL DEFAULT 0, PRIMARY KEY (message_id));",
    "CREATE TABLE IF NOT EXISTS users (id bigint(20) NOT NULL AUTO_INCREMENT, user_id bigint(20) NOT NULL, user_name varchar(100) NOT NULL, password varchar(100) NOT NULL, date timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(), user_type varchar(100) NOT NULL, email varchar(100) NOT NULL, city varchar(100) NOT NULL, PRIMARY KEY (id), KEY user_id (user_id), KEY date (date), KEY user_name (user_name));"
];

foreach ($tables as $table_query) {
    if (!mysqli_query($conn, $table_query)) {
        die("Sorry, could not create table: " . mysqli_error($conn));
    }
}
