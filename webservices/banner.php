<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

$banner = $db->getBanner();
echo json_encode($banner);

?>
