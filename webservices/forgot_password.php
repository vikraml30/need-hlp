<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

if ( ( isset( $_REQUEST['username'] ) && $_REQUEST['username'] != '' ) ) {
    $username = $_REQUEST['username'];

    $user = $db->isUserNameValid( $username );

    if (true == $user) {
        $response["message"] = "Username is valid!";
    } else {
        $response["error"] = true;
        $response["message"] = "Sorry! Username is invalid!";
    }
} else {

    $response["error"] = true;
    $response["message"] = "Sorry! username is missing.";
}

echo json_encode($response);
?>
