<?php
$hostname = "localhost";
$username = "root";
$password = "";
$dbname = "medisystem_db_431";

// create db connection
if (!$conn = mysqli_connect($hostname, $username, $password, $dbname)) {
    die("Failed to connect to server.\n");
}
