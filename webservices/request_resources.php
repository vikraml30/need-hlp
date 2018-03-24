<?php

include './include/DbHandler.php';
$db = new DbHandler();

	$response = array();
	$response["error"] = false;

	if ( true == isset( $_REQUEST['category'] ) && $_REQUEST['category'] != '' ) {
		$res = $db->getResources($_REQUEST['category']);
		if( 0 == count($res) ) {
			$response["error"] = true;
			$response["message"] = "Sorry! No resources found!";
			echo json_encode($response);
		} else {
			echo json_encode($res);
		}
	} else {
		$response["error"] = true;
		$response["message"] = "Sorry! Category is missing.";
		echo json_encode($res);
	}

?>