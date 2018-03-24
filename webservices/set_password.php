<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

if ( ( true == isset( $_REQUEST['password'] ) && $_REQUEST['password'] != '' ) && ( true == isset( $_REQUEST['username'] ) && $_REQUEST['username'] != '' ) ) {
	
	$username = $_REQUEST['username'];
    $password = $_REQUEST['password'];

    $update = $db->updatePassword( $username, $password );

    if (true == $update) {
        $response["message"] = "Password updated successfully!";
    } else {
        $response["error"] = true;
        $response["message"] = "Sorry! Password updation failed!";
    }
} else {

    $response["error"] = true;
    $response["message"] = "Sorry! Password is missing.";
}

echo json_encode($response);
?>
