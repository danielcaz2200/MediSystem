<?php
session_start();
include("../util/connection.php");
include("../util/functions.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // something was posted to the server
    $user_name = $_POST['username'];
    $password = $_POST['password'];
    $user_type = $_POST['role'];

    // we do not want a number as a username
    if (!empty($username) && !empty($password) && !is_numeric($username) && !empty($user_type)) {
        $user_id = random_num(20);
        $query = "insert into users (user_id, user_name, password, user_type) values ('$user_id', '$user_name', '$password', '$user_type')";

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../styles.css?<?= time() ?>">
    <title>Sign up</title>
</head>

<body>
    <!-- overall container -->
    <div class="container">
        <!-- begin form -->
        <div class="p-3 text-center">Sign up</div>
        <form method="post" id="signup-form" class="form-floating mx-auto rounded">
            <div class="p-3">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Username">
            </div>

            <div class="p-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
            </div>

            <div class="p-3">
                <label for="role-select">Role</label>
                <select class="form-select" name="role" id="role-select" required>
                    <option value="" selected disabled>Select a role</option>
                    <option value="medical provider">Medical provider</option>
                    <option value="medical supplier">Medical supplier</option>
                </select>
            </div>

            <div class="p-3">
                <button class="btn btn-primary" type="submit" id="submit-button">Sign up</button>
            </div>

            <div class="link-primary p-3">
                <a href="login.php">Click to login</a>
            </div>

            <div class="m-3" id="error-message">
                <!-- Where error message goes -->
            </div>
        </form>
        <!-- end form -->
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>