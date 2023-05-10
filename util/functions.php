<?php
// checks if a user is logged in and returns user data if so
function check_login($conn)
{
    if (isset($_SESSION['user_id'])) {
        $id = $_SESSION['user_id'];
        $query = "select * from users where user_id = '$id' limit 1";

        // retrieve result
        $result = mysqli_query($conn, $query);

        // check if records returned
        if ($result && mysqli_num_rows($result) > 0) {
            $user_data = mysqli_fetch_assoc($result);
            return $user_data;
        }
    }

    // redirect to login
    header("Location: ./pages/login.php");
    die();
}

function random_num($length)
{
    $text = "";
    if ($length < 5) {
        $length = 5;
    }

    $len = rand(4, $length);

    for ($i = 0; $i < $len; $i++) {
        $text .= rand(0, 9);
    }

    return $text;
}

// this builds the sql queries for the filtering mechanism
function build_query($conn, $search_table)
{
    $query = "select * from $search_table";

    // our array to hold the conditions
    $where = array();

    // check if these keys are set and they contain actual strings
    if (isset($_GET['username']) && !empty($_GET['username'])) {
        $user_name = $_GET['username'];
        $where[] = "user_name='$user_name'";
    }
    if (isset($_GET['city']) && !empty($_GET['city'])) {
        $city = $_GET['city'];
        $where[] = "city='$city'";
    }
    if (isset($_GET['specialty']) && !empty($_GET['specialty'])) {
        $specialty = $_GET['specialty'];
        $where[] = "specialty='$specialty'";
    }

    // create the query using implode
    if (count($where) > 0) {
        $query .= " WHERE " . implode(' AND ', $where);
    }

    $result = mysqli_query($conn, $query);

    return $result;
}


// show all messages belonging to a user
function get_user_messages($conn, $user_id)
{
    $query = "select * from messages where recipient_id = '$user_id'";

    $result = mysqli_query($conn, $query);

    return $result;
}

// convert user id to a username
function user_id_to_username($conn, $user_id)
{
    $query = "select user_name from users where user_id = '$user_id' limit 1";

    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $user_name = $row['user_name'];
        return $user_name;
    }

    die("Failed to get user_name, does not exist within users table");
}

function get_appointment_requests($conn, $user_id)
{
    $query = "select * from appointment_requests where recipient_id = '$user_id' limit 1";

    $result = mysqli_query($conn, $query);

    return $result;
}
