<?php

$hostname = "localhost";
$username = "root";
$password = "";
$dbname = "medical_system_db";

if (!$conn = mysqli_connect($hostname, $username, $password, $dbname)) {
    die("Failed to connect to db.\n");
}