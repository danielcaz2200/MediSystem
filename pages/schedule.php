<?php
session_start();
include("../util/connection.php");
include("../util/functions.php");

// check if user is logged in
$user_data = check_login($conn);

if (isset($_GET['recipient'])) {
    $recipient_name = $_GET['recipient'];

    // retrieves recipient id from users table
    try {
        $recipient_id = get_recipient_id($conn, $recipient_name);
    } catch (Exception $e) {
        // immediately stop the script if we could not retrieve recipient id
        die("Error: " . $e->getMessage());
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
    <title>Schedule</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <ul class="navbar-nav me-auto">
                <a class="navbar-brand" href="../index.php">MediSystem</a>
                <li class="nav-item">
                    <a class="nav-link" href="../index.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./dashboard.php">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./search.php">Search</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./logout.php">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <!-- begin form -->
        <div class="p-3 lead">Request an appointment with: <?= $recipient_name ?></div>
        <form method="post" id="message-form" class="form-floating mx-auto rounded">
            <div class="p-3">
                <label for="appointment-reason" class="form-label">Reason for appointment</label>
                <input type="text" class="form-control" placeholder="Reason..." id="appointment-reason">
            </div>

            <div class="p-3">
                <label for="appointment-time" class="form-label">Date and time</label>
                <input type="datetime-local" class="form-control" id="appointment-time">
            </div>

            <div class="p-3">
                <label for="message-text" class="form-label">Message note</label>
                <textarea class="form-control" placeholder="Add a note..." id="message-text" rows="4"></textarea>
            </div>

            <div class="p-3">
                <button class="btn btn-primary" type="submit" id="message-button">Send message</button>
            </div>
        </form>
        <!-- end form -->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>