<?php

include './include/DbHandler.php';
$db = new DbHandler();

$response = array();
$response["error"] = false;

if ( ( isset( $_REQUEST['mobile'] ) && $_REQUEST['mobile'] != '' ) ) {
    
    $mobile = $_REQUEST['mobile'];

    $user = $db->isUserExists( $mobile );
	$username = $db->getUserName( $mobile );
    $userId = $db->getUserId( $mobile );
    if(true == isset($_REQUEST['device_registration_id'])){
        $device_registration_id = $_REQUEST['device_registration_id'];
        $userRegistrationId = $db->updateUserRegistrationId( $mobile, $device_registration_id );
    }
    
    if ($user > 0) {
        $otp = rand(100000, 999999);
        sendSms($mobile, $otp);
        $otp_result = $db->createOtp($userId, $otp);
        $smsCodeActivated = $db->activateSmsCode( $userId );
        $response["error"] = false;
		$response["username"] = $username;
		//$response["device_registration_id"] = $userRegistrationId;
        $response["message"] = "SMS request is initiated! You will be receiving it shortly.";
    } else {
        $response["error"] = true;
        $response["message"] = "Sorry! Failed to login. Please check mobile number you have entered!";
    }
} else {

    $response["error"] = true;
    $response["message"] = "Sorry! username and password is missing.";
}

echo json_encode($response);


function sendSms($mobile, $otp) {
    
    $otp_prefix = ':';

    //Your message to send, Add URL encoding here.
    $message = urlencode("Hello! Welcome to Need HLP. Your OTP is ".$otp_prefix ." ". $otp);

    $response_type = 'json';

    //Define route 
    $route = "4";
    
    //Prepare you post parameters
    $postData = array(
        'authkey' => MSG91_AUTH_KEY,
        'mobiles' => $mobile,
        'message' => $message,
        'sender' => MSG91_SENDER_ID,
        'route' => $route,
        'response' => $response_type
    );

//API URL
    $url = "https://control.msg91.com/sendhttp.php";

// init the resource
    $ch = curl_init();
    curl_setopt_array($ch, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => $postData
            //,CURLOPT_FOLLOWLOCATION => true
    ));


    //Ignore SSL certificate verification
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);


    //get response
    $output = curl_exec($ch);

    //Print error if any
    if (curl_errno($ch)) {
        return false;
        echo 'error:' . curl_error($ch);
    }

    curl_close($ch);
    
    return true;
}
?>
