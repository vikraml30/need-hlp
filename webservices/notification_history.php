<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

$mobile = $_REQUEST['mobile'];

$notification_history = $db->getNotificationHistory($mobile);

foreach( $notification_history as $nHistory ) {
    $arrHistory[] = $nHistory;
}

//echo "<pre>";var_dump($arrHistory);
echo json_encode($arrHistory);

?>
