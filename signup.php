<?php
session_start();
include("connection.php");
include("functions.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // something was posted to the server
    $user_name = $_POST['username'];
    $password = $_POST['password'];

    // we do not want a number as a username
    if (!empty($username) && !empty($password) && !is_numeric($username)) {
        $user_id = random_num(20);
        $query = "insert into users (user_id, user_name, password) values ('$user_id', '$user_name', '$password')";

        mysqli_query($conn, $query);

        header("Location: login.php");
        die;
    } else {
        echo "Please enter some valid information<br>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <title>Sign up</title>
</head>
<body>
    <div id="box"> 
    <!-- overall container -->
        <div id="form-container">
        <div>Sign up</div>
        <form method="post" id="login-form">
            <div>
                <input type="text" id="username" name="username">
            </div>

            <div>
                <input type="text" id="password" name="password">
            </div>

            <div>
                <input type="submit" id="submit-button" value="Sign up">
            </div>

            <div>
                <a href="login.php">Click to login</a>
            </div>
        </form>
        </div>
    </div>
</body>
</html>