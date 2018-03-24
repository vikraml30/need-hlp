<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

$requirement = $_REQUEST['requirement'];
$dateofvisit = $_REQUEST['dateofvisit'];
$timeofvisit = $_REQUEST['timeofvisit'];
$noofperson = $_REQUEST['noofperson'];
$serviceaddress = $_REQUEST['serviceaddress'];
$category = $_REQUEST['category'];
$mobile = $_REQUEST['mobile'];

$booking = $db->createBooking($requirement, $mobile, $dateofvisit, $timeofvisit, $noofperson, $serviceaddress);

if ($booking == 0) {
    
    if ( true == isset( $category ) && $category != '' ) {
		$res = $db->getResources( $category );
		if( 0 == count($res) ) {
			$response["error"] = true;
			$response["message"] = "Sorry! booking failed!";
			echo json_encode($response);
		} else {
		    $message .= $mobile . " has created a booking. \n";
		    $message .= "Requirement : ".$requirement . "\n";
		    if($noofperson == 1) {
		        $message .= "On : ".$dateofvisit . $timeofvisit . "for " . $noofperson . " person \n";
		    } else {
		        $message .= "On : ".$dateofvisit . " at " . $timeofvisit . " for " .$noofperson . " people \n";
		    }
		    
		    $message .= "Address : ".$serviceaddress . "\n";
		    
		    $db->sendSms("8600616748", $message);
		    $response["message"] = "Booking created successfully!";
		    $response["resources"] = $res;
			echo json_encode($response);
		}
	} else {
		$response["error"] = true;
		$response["message"] = "Sorry! Category is missing.";
		echo json_encode($response);
	}

} else {
	$response["error"] = true;
	$response["message"] = "Sorry! Failed to create booking.";
}

?>
