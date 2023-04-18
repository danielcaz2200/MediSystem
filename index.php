<?php
session_start();
include("connection.php");
include("functions.php");

// check if user is logged in
$user_data = check_login($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MedSystem</title>
</head>
<body>
    <a href="logout.php">Logout</a>
    <h1>This is the index page (home)<h1>
    <p>Hello <?= $user_data['user_name'] ?></p>
</body>
</html>