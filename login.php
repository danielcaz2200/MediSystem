<?php
session_start();
include("connection.php");
include("functions.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // something was posted to the server
    $user_name = $_POST['username'];
    $password = $_POST['password'];

    // we do not want a number as a username
    if (!empty($user_name) && !empty($password) && !is_numeric($user_name)) {
        $query = "select * from users where user_name = '$user_name' limit 1";

        $result = mysqli_query($conn, $query);

        if ($result && mysqli_num_rows($result) > 0) {
            $user_data = mysqli_fetch_assoc($result);
            
            if ($user_data['password'] === $password) {
                // set session id
                $_SESSION['user_id'] = $user_data['user_id'];
                
                // redirect to index
                header("Location: index.php");
                die();
            }
        } 
        echo "Wrong username or password<br>";
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
    <title>Login</title>
</head>
<body>
    <div id="box"> 
    <!-- overall container -->
        <div id="form-container">
        <div>Login</div>
        <form method="post" id="login-form">
            <div>
                <input type="text" id="username" name="username">
            </div>

            <div>
                <input type="text" id="password" name="password">
            </div>

            <div>
                <input type="submit" id="submit-button" value="Login">
            </div>

            <div>
                <a href="signup.php">Click to sign up</a>
            </div>
        </form>
        </div>
    </div>
</body>
</html>