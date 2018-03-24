<?php
error_reporting(-1);
ini_set('display_errors', 'On');

include './include/DbHandler.php';
$db = new DbHandler();


$response = array();

if (true == isset($_REQUEST['edit']) && isset($_REQUEST['mobile']) && $_REQUEST['mobile'] != '') {
    $mobile = $_REQUEST['mobile'];
    $response["userDetails"] = $db->getUser($mobile);
}

if (isset($_REQUEST['update']) && $_REQUEST['update'] != '') {
    if (isset($_REQUEST['mobile']) && $_REQUEST['mobile'] != '') {
        $mobile = $_REQUEST['mobile'];
        $name = $_REQUEST['name'];
        $email = $_REQUEST['email'];
        $address = $_REQUEST['address'];
    
        $res = $db->updateUser($name, $email, $mobile,$address);

        if ($res == 1) {
            $response["error"] = false;
            $response["message"] = "User updated successfully.";
        } else if ($res == 0) {
            $response["error"] = true;
            $response["message"] = "Sorry! Error occurred in updation.";
        }
    } else {
        $response["error"] = true;
        $response["message"] = "Sorry! mobile number is not valid or missing.";
    }
}

echo json_encode($response);
?>