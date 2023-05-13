<?php
session_start();
include("../util/connection.php");
include("../util/functions.php");

// this script deletes a particular appointment 
// request and is tied to the deny button on schedule.php
if (isset($_POST['request_id'])) {
    $request_id = $_POST['request_id'];
    $query = "select * from appointment_requests where id='$request_id' limit 1";

    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $appointment_request = mysqli_fetch_assoc($result);

        $creator_id = $appointment_request['creator_id'];
        $recipient_id = $appointment_request['recipient_id'];
        $date_time = $appointment_request['date_time'];
        $message_text = $appointment_request['message_text'];

        $query = "insert into appointments (creator_id, recipient_id, date_time, message_text) values ('$creator_id', '$recipient_id', '$date_time', '$message_text')";

        if (!mysqli_query($conn, $query)) {
            die("Failed to insert appointment into appointments table");
        }

        $query = "delete from appointment_requests where id='$request_id'";

        if (mysqli_query($conn, $query) && mysqli_affected_rows($conn) > 0) {
            header("Location: schedule.php");
            die();
        }
    }

    die("Failed to update appointments");
}
