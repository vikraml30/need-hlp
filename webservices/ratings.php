<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

if ( ( isset($_REQUEST['resource_id']) && $_REQUEST['resource_id'] != '' ) && ( isset($_REQUEST['rating']) && $_REQUEST['rating'] != '' ) ) {
    $resource_id = $_REQUEST['resource_id'];
    $rating = $_REQUEST['rating'];

    $user = $db->insertRating($resource_id,$rating);

    if ($user == 0) {
        $response["message"] = "Resource rated successfully!";
    } else {
        $response["error"] = true;
        $response["message"] = "Sorry! Resource rating failed.";
    }
    
} else {
    $response["error"] = true;
    $response["message"] = "Sorry! resource and rating is missing.";
}

echo json_encode($response);
?>
