<?php
session_start();
include("../util/connection.php");
include("../util/functions.php");

if (isset($_POST['request_id'])) {
    $request_id = $_POST['request_id'];
    $query = "delete from appointment_requests where id='$request_id'";

    if (mysqli_query($conn, $query) && mysqli_affected_rows($conn) > 0) {
        header("Location: schedule.php");
        die();
    }

    die("Failed to delete appointment request");
}
