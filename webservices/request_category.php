<?php

include './include/DbHandler.php';
$db = new DbHandler();


	$response = array();

    $res = $db->getAllCategory();
	if( 0 == count($res) ) {
		$response["error"] = true;
        $response["message"] = "Sorry! No category found!";
		echo json_encode($response);
	} else {
	    $response["error"] = false;
        $response["categories"] = $res;
		echo json_encode($response);
	}

?>