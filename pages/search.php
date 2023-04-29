<?php
session_start();
include("../util/connection.php");
include("../util/functions.php");

// check if user is logged in
$user_data = check_login($conn);

$user_type = $user_data['user_type'];

// defines search type string and the table string that will be used in sql queries
$search_type = ($user_type === 'medical provider') ? 'medical suppliers' : 'medical providers';
$search_table = ($user_type === 'medical provider') ? 'medical_suppliers' : 'medical_providers';

// initial result == all rows
$result = build_query($conn, $search_table);

// runs whenever a GET request is made
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $result = build_query($conn, $search_table);
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
    <title>Search</title>
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
    <div class="container p-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card p-3">
                    <div class="card-title">Filter <?= $search_type ?></div>
                    <div class="card-body">
                        <form method="GET">
                            <div class="input-group mb-3">
                                <input type="text" name="username" class="form-control" placeholder="Username">
                            </div>

                            <div class="input-group mb-3">
                                <input type="text" name="city" class="form-control" placeholder="City">
                            </div>

                            <div class="input-group mb-3">
                                <input type="text" name="specialty" class="form-control" placeholder="Specialty">
                            </div>

                            <div>
                                <button type="submit" class="btn btn-primary">Filter results</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-12">
                <div class="card p-3">
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">User id</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">City</th>
                                    <th scope="col">Specialty</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- embedded php to display results of query -->
                                <?php foreach ($result as $row) : ?>
                                    <tr>
                                        <td><?= $row['user_id'] ?></td>
                                        <td><?= $row['user_name'] ?></td>
                                        <td><?= $row['email'] ?></td>
                                        <td><?= $row['city'] ?></td>
                                        <td><?= $row['specialty'] ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>