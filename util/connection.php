<?php
$hostname = "localhost";
$username = "root";
$password = "";
$dbname = "medisystem_db_431";

if (!$conn = mysqli_connect($hostname, $username, $password)) {
    die("Failed to connect to server.\n");
}

// creates db and tables
include_once('create_db_and_tables.php');
