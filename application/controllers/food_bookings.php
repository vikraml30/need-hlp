<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Food_bookings extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct() {
        parent::__construct();
        $this->load->model('foods_model');
        $this->isLoggedIn();   
		$this->global['pageTitle'] = 'Food bookings';
    }
    
    public function index() {
        $this->load->model('foods_model');
        $userId = $this->session->userdata['userId'];
        $data['unreadFoodBookingRecords'] = $this->foods_model->getUnreadFoodBookings();
        $data['readFoodBookingRecords'] = $this->foods_model->getReadFoodBookings();
        $this->loadViews("food_bookings", $this->global, $data, NULL);
    }
    
    public function respondFoodBooking(){
        $data['fbid'] = $_REQUEST['fbid'];
        $data['mobile'] = $_REQUEST['mobile'];
        $data['device_id'] = $_REQUEST['device_id'];
	$this->loadViews("respond_food_booking", $this->global, $data, NULL);
    }
    
    public function send_notification(){
        $API_ACCESS_KEY = "AAAAxHAYm9k:APA91bG3e6-ADxfJS_MgU9imBqF-2AV9PctgZSpxgyrDK8aIEooDeEqAeqQ_9QsjlYYZMnarmP8eYU-Pzrxzp6LsS6Xth70iab2cYWtYr-bfHKO0cgBwwb2N9B6EtWmeC6YNLFeH4psm";
        $title = $_POST['title'];
        $description = $_POST['description'];
        //$registrationIds = array($_POST['device_id']);
        $message = array('message' => json_encode(array('title' => $title, 'message' => $description)));
        //$registatoin_ids = array($registrationIds);

        $notificationInfo = array('mobile'=>$_POST['mobile'], 'title'=>$title, 'description'=>$description, 'created_date'=>date('Y-m-d H:i:s'));

		$this->load->model('foods_model');
		$result = $this->foods_model->addNotificationRecord($notificationInfo);


        $url = 'https://fcm.googleapis.com/fcm/send';

        $headers = array(
        	'Authorization: key='.$API_ACCESS_KEY,
        	'Content-Type: application/json'
        );
        
        
        $fields = ["registration_ids"=>[$_POST['device_id']],
           "notification"=>[  
                    "title"=>$title,
                    "text"=>$description
            ]
        ];
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        $errorMsg = "";
        $result = curl_exec($ch);

        if ($result === FALSE) {
        	$errorMsg = curl_error($ch);
        }else{
        	$result = json_decode($result);

        	if($result->success>0){
                    $this->foods_model->updateFoodBooking($_POST['fbid']);
                    redirect('food_bookings/index');
        	}
        	if($result->failure>0){
        		$errorMsg = " Failure for ".$result->failure." users.";
        	}
        }
        curl_close($ch);
    }

}

?>