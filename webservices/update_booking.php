<?php

include './include/DbHandler.php';
$db = new DbHandler();

$updated = false;

$booking_category = $_REQUEST['booking_category'];
$id = $_REQUEST['id'];
$status = $_REQUEST['status'];
$mobile = $_REQUEST['mobile'];


switch($booking_category){
    case 'resourceBooking':
        $updated = $db->updateResourceBooking($id, $status);
        break;
        
    case 'carBooking':
        $updated = $db->updateCarBooking($id, $status);
        break;
        
    case 'foodBooking':
        $updated = $db->updateFoodBooking($id, $status);
        break;
        
    case 'vehicleMechanicBooking':
        $updated = $db->updateVehicleMechanicBooking($id, $status);
        break;
}

if(true == $update){
    if(true == isset($_REQUEST['redeem_points'])) {
        $redeem_points = $_REQUEST['redeem_points'];
        $db->updatePoints($mobile, $redeem_points);
    }
}
//echo "<pre>";var_dump($arrHistory);
echo "Booking updated";

?>
