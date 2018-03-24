<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

$mobile = $_REQUEST['user_mobile'];
$destination = $_REQUEST['destination'];
$from_address = $_REQUEST['from_address'];
$from_date = $_REQUEST['from_date'];
$to_date = $_REQUEST['to_date'];
$time = $_REQUEST['time'];
$noofperson = $_REQUEST['noofperson'];
$car_type = $_REQUEST['car_type'];
$created_date = date("Y-m-d h:i");

$booking = $db->createCarBooking($mobile,$destination,$from_address, $from_date,$to_date,$time,$noofperson,$car_type,$created_date);

if ($booking == 0) {
    $message .= $mobile . " has booked a " . $car_type . " car. \n";
    $message .= "Destination is : ".$destination . "\n";
    if($noofperson == 1) {
        $message .= "On : ".$from_date . $time . "for " . $noofperson . " person \n";
    } else {
        $message .= "On : ".$from_date . " at " . $time . " for " .$noofperson . " people \n";
    }
    
    $db->sendSms("8600616748", $message);
    $response["message"] = "Car booking created successfully!";
} else {
	$response["error"] = true;
	$response["message"] = "Sorry! Failed to create booking.";
}
echo json_encode($response);

?>
