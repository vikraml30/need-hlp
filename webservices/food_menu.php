<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

$foodMenu = $db->getFoodMenu();
$arrFoodMenu = [];
foreach( $foodMenu as $category => $foodMenueach ){
    $arrFoodMenuFormat = [];
    $arrClone[$category] = [];
    foreach( $foodMenueach as $key => $value ){
        $arrFoodMenuFormat["name"] = $key;
        $arrFoodMenuFormat["price"] = $value;
        $arrClone[$category][] = $arrFoodMenuFormat;
    }
    array_push($arrFoodMenu, $arrClone);
}

echo json_encode($arrFoodMenu[count($arrFoodMenu)-1]);

?>
