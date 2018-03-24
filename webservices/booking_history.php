<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

$mobile = $_REQUEST['mobile'];

$resource_booking = $db->getResourceBooking($mobile);
$car_booking = $db->getCarBooking($mobile);
$food_booking = $db->getFoodBooking($mobile);
$vehicle_mechanic = $db->getVehicleMechanicBooking($mobile);

$arrHistory = [];
foreach( $resource_booking as $rBooking ) {
    $arrHistory['resourceBooking'][] = $rBooking;
}
foreach( $car_booking as $cBooking ) {
    $arrHistory['carBooking'][] = $cBooking;
}
foreach( $food_booking as $fBooking ) {
    $arrHistory['foodBooking'][] = $fBooking;
}
foreach( $vehicle_mechanic as $vmBooking ) {
    $arrHistory['vehicleMechanicBooking'][] = $vmBooking;
}
//echo "<pre>";var_dump($arrHistory);
echo json_encode($arrHistory);

?>
