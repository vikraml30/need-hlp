<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

$mobile = $_REQUEST['mobile'];
$requirement = $_REQUEST['requirement'];
$service_date = $_REQUEST['service_date'];
$service_time = $_REQUEST['service_time'];
$service_address = $_REQUEST['service_address'];
$created_date = date("Y-m-d h:i:sa");

$booking = $db->createMechanicService($mobile, $requirement, $service_date, $service_time, $service_address, $created_date);

if ($booking == 0) {
		$message .= $mobile . " has created a booking for mechanic. \n";
		$message .= "Requirement : ".$requirement . "\n";
		$message .= "On : ".$dateofvisit . " " . $timeofvisit . "\n";
		$message .= "Address : ".$serviceaddress . "\n";
		
		$db->sendSms("8600616748", $message);
		$response["message"] = "Booking created successfully!";
		$response["resources"] = $res;
		echo json_encode($response);
} else {
	$response["error"] = true;
	$response["message"] = "Sorry! Failed to create booking.";
}

?>
