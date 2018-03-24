<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

if (isset($_REQUEST['otp']) && $_REQUEST['otp'] != '') {
    $otp = $_REQUEST['otp'];

    if( true == isset( $_REQUEST['login'] ) ) {
        $user = $db->activateUser($otp,$_REQUEST['login']);
    } else {
        $user = $db->activateUser($otp);
    }

    if ($user != NULL) {
        $response["message"] = "User created / loggedin successfully!";
        $response["profile"] = $user;
    } else {
        $response["error"] = true;
        $response["message"] = "Sorry! Failed to create / access your account.";
    }
    
} else {
    $response["error"] = true;
    $response["message"] = "Sorry! OTP is missing.";
}

echo json_encode($response);
?>
