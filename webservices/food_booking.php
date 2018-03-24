<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

$mobile = $_REQUEST['user_mobile'];
$category = $_REQUEST['category'];
$item = $_REQUEST['item'];
$quantity = $_REQUEST['quantity'];

$price = $_REQUEST['price'];
$total_price = $_REQUEST['total_price'];
$repeate_order = $_REQUEST['repeat_order'];

$created_date = date("Y-m-d h:i:sa");

$booking = $db->createFoodBooking($mobile,$category,$item,$quantity,$price,$total_price,$repeate_order,$created_date);

if ($booking == 0) {
    $message .= $mobile . " has booked a food service for " . $item . "\n";
    $message .= "Quantity is : ".$quantity . "\n";
    
    $db->sendSms("8600616748", $message);
    $response["message"] = "Food booking created successfully!";
} else {
	$response["error"] = true;
	$response["message"] = "Sorry! Failed to create booking.";
}
echo json_encode($response);
?>
