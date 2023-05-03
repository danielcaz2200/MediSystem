<?php
    session_start();
    include("../util/connection.php");
    include("../util/functions.php");
    
    // check if user is logged in
    $user_data = check_login($conn);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../styles.css?<?= time() ?>">
    <title>Dashboard</title>
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
    <h1 class="text-center">Welcome, <?= $user_data['user_name'] ?></h1>
    <section id="card-container">
        <div class="container-fluid d-flex justify-content-center">
            <div class="row">
                <div class="col">
                    <div class="card" style="width: 300px">
                        <div class="card-body text-center">
                            <i class="bi bi-calendar4-event"></i>
                            <h3 class="card-title">Scheduling</h3>
                            <p class="card-text"><strong>Your next appointment:</strong></p>
                            <p>None</p>
                            <a href="schedule.php">View your schedule</a>
                        </div> 
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: 300px">
                        <div class="card-body text-center">
                            <i class="bi bi-envelope"></i>
                            <h3 class="card-title">Messaging</h3>
                            <p class="card-text"><strong>Recent Messages:</strong></p>
                            <p>None</p>
                            <a href="dashboard.php">View your Inbox</a>
                        </div> 
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: 300px">
                        <div class="card-body text-center">
                            <i class="bi bi-search"></i>
                            <h3 class="card-title">Search</h3>
                            <p class="card-text"><strong>Recently viewed:</strong></p>
                            <p>None</p>
                            <a href="search.php">Search available clients</a>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>