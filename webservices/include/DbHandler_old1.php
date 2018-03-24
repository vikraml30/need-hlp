<?php

/**
 * Class to handle all db operations
 * This class will have CRUD methods for database tables
 *
 * @author Ravi Tamada
 * @link URL Tutorial link
 */
class DbHandler {

    private $conn;

    function __construct() {
        require_once dirname(__FILE__) . '/DbConnect.php';
        // opening db connection
        $db = new DbConnect();
        $this->conn = $db->connect();
    }

    /* ------------- `users` table method ------------------ */

    /**
     * Creating new user
     * @param String $name User full name
     * @param String $password User login password
     * @param String $mobile User mobile number
     * @param String $otp user verificaiton code
     */
    public function createUser($name, $email, $mobile, $otp) {
        $response = array();

        // First check if user already existed in db
        if (!$this->isUserExists($mobile)) {

            // Generating API key
            $api_key = $this->generateApiKey();

            // insert query
            $stmt = $this->conn->prepare("INSERT INTO users(name, email, mobile, apikey, status) values(?, ?, ?, ?, 0)");
            $stmt->bind_param("ssss", $name, $email, $mobile, $api_key);

            $result = $stmt->execute();

            $new_user_id = $stmt->insert_id;

            $stmt->close();

            // Check for successful insertion
            if ($result) {

                $otp_result = $this->createOtp($new_user_id, $otp);

                // User successfully inserted
                return USER_CREATED_SUCCESSFULLY;
            } else {
                // Failed to create user
                return USER_CREATE_FAILED;
            }
        } else {
            return USER_ALREADY_EXISTED;
        }

        return $response;
    }

    public function createOtp($user_id, $otp) {

        // delete the old otp if exists
        $stmt = $this->conn->prepare("DELETE FROM sms_codes where user_id = ?");
        $stmt->bind_param("i", $user_id);
        $stmt->execute();

        $stmt = $this->conn->prepare("INSERT INTO sms_codes(user_id, code, status) values(?, ?, 0)");
        $stmt->bind_param("is", $user_id, $otp);

        $result = $stmt->execute();
        $stmt->close();

        return $result;
    }
    
    /**
     * Checking for duplicate user by mobile number
     * @param String $mobile mobile to check in db
     * @return boolean
     */
    public function isUserExists($mobile) {
        $stmt = $this->conn->prepare("SELECT id from users WHERE mobile = ? and status = 1");
        $stmt->bind_param("s", $mobile);
        $stmt->execute();
        $stmt->store_result();
        
        $num_rows = $stmt->num_rows;
        $stmt->close();
        return $num_rows > 0;
    }
    
    public function getUserId($mobile) {
        $stmt = $this->conn->prepare("SELECT id from users WHERE mobile = ? and status = 1");
        $stmt->bind_param("s", $mobile);
        $stmt->execute();
        
        $res = $stmt->get_result();
        $arrUserId = $res->fetch_assoc();
        return $arrUserId['id'];
    }

    public function activateUser($otp) {
        $stmt = $this->conn->prepare("SELECT u.id, u.name, u.mobile, u.apikey, u.status, u.created_at FROM users u, sms_codes WHERE sms_codes.code = ? AND sms_codes.user_id = u.id");
        $stmt->bind_param("s", $otp);

        if ($stmt->execute()) {
            // $user = $stmt->get_result()->fetch_assoc();
            $stmt->bind_result($id, $name, $mobile, $apikey, $status, $created_at);
            
            $stmt->store_result();

            if ($stmt->num_rows > 0) {
                
                $stmt->fetch();
                
                // activate the user
                $this->activateUserStatus($id);
                
                $user = array();
                $user["name"] = $name;
                $user["mobile"] = $mobile;
                $user["apikey"] = $apikey;
                $user["status"] = $status;
                $user["created_at"] = $created_at;
                
                $stmt->close();
                
                return $user;

            } else {
                return NULL;
            }
        } else {
            return NULL;
        }

        return $result;
    }
    
    public function activateSmsCode( $user_id ) {
        $stmt = $this->conn->prepare("UPDATE sms_codes set status = 1 where user_id = ?");
        $stmt->bind_param("i", $user_id);
        
        $stmt->execute();
    } 
    
    public function activateUserStatus($user_id){
        $stmt = $this->conn->prepare("UPDATE users set status = 1 where id = ?");
        $stmt->bind_param("i", $user_id);
        
        $stmt->execute();
        
        $stmt = $this->conn->prepare("UPDATE sms_codes set status = 1 where user_id = ?");
        $stmt->bind_param("i", $user_id);
        
        $stmt->execute();
    }

    /**
     * Generating random Unique MD5 String for user Api key
     */
    private function generateApiKey() {
        return md5(uniqid(rand(), true));
    }
    
    public function validUser($username, $password) {
        $stmt = $this->conn->prepare("SELECT id from users WHERE name = ? and password = ?");
        $stmt->bind_param("ss", $username,$password);
        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows;
        $stmt->close();
        return $num_rows;
    }
	
	public function createBooking($requirement,$mobile, $dateofvisit, $timeofvisit, $noofperson, $serviceaddress) {
        $response = array();

		$dateofvisit = date("Y-m-d", strtotime($dateofvisit));

		$timeofvisit = date("H:i", strtotime($timeofvisit));
		// insert query
		$stmt = $this->conn->prepare("INSERT INTO booking(user_mobile, requirement, dateofvisit, timeofvisit, noofperson, serviceaddress) values(?, ?, ?, ?, ?, ?)");
		$stmt->bind_param("ssssss", $mobile, $requirement, $dateofvisit, $timeofvisit, $noofperson, $serviceaddress);

		$result = $stmt->execute();

		$new_booking_id = $stmt->insert_id;

		$stmt->close();

		// Check for successful insertion
		if ($result) {
			// User successfully inserted
			return USER_CREATED_SUCCESSFULLY;
		} else {
			// Failed to create user
			return USER_CREATE_FAILED;
		}
        return $response;
    }

    public function createCarBooking($mobile,$destination,$from_date,$to_date,$time,$noofperson,$car_type,$created_date) {
        $response = array();
        $startDate = date("Y-m-d", strtotime($from_date));
        $toDate = date("Y-m-d", strtotime($to_date));
        $time = date("H:i", strtotime($time));
        // insert query
        $stmt = $this->conn->prepare("INSERT INTO car_booking(user_mobile, destination,from_date,to_date,time,noofperson,car_type,created_date) values(?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssssss", $mobile,$destination,$startDate,$toDate,$time,$noofperson,$car_type,$created_date);

        $result = $stmt->execute();
        $new_carbooking_id = $stmt->insert_id;

        $stmt->close();

        // Check for successful insertion
        if ($result) {
            // User successfully inserted
            return USER_CREATED_SUCCESSFULLY;
        } else {
            // Failed to create user
            return USER_CREATE_FAILED;
        }
        return $response;
    }
	
	public function createFoodBooking($mobile,$category,$item,$quantity,$created_date) {
        $response = array();
		
        // insert query
        $stmt = $this->conn->prepare("INSERT INTO food_booking(category,item,quantity,user_mobile,created_date) values(?, ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $mobile,$category,$item,$quantity,$created_date);

        $result = $stmt->execute();

        $stmt->close();

        // Check for successful insertion
        if ($result) {
            // User successfully inserted
            return USER_CREATED_SUCCESSFULLY;
        } else {
            // Failed to create user
            return USER_CREATE_FAILED;
        }
        return $response;
    }
	
	public function createMechanicService($mobile, $requirement, $service_date, $service_time, $service_address, $created_date) {
        $response = array();

		$dateofvisit = date("Y-m-d", strtotime($service_date));

		$timeofvisit = date("H:i", strtotime($service_time));
		// insert query
		$stmt = $this->conn->prepare("INSERT INTO booking(user_mobile, requirement, service_date, service_time, service_address, created_date) values(?, ?, ?, ?, ?, ?)");
		$stmt->bind_param("ssssss", $mobile, $requirement, $service_date, $service_time, $service_address, $created_date);

		$result = $stmt->execute();

		$new_booking_id = $stmt->insert_id;

		$stmt->close();

		// Check for successful insertion
		if ($result) {
			// User successfully inserted
			return USER_CREATED_SUCCESSFULLY;
		} else {
			// Failed to create user
			return USER_CREATE_FAILED;
		}
        return $response;
    }
	
	public function isUserNameValid($user) {
        $stmt = $this->conn->prepare("SELECT id from users WHERE name = ? and status = 1");
        $stmt->bind_param("s", $user);
        $stmt->execute();
        $stmt->store_result();
        $num_rows = $stmt->num_rows;
        $stmt->close();
        return $num_rows > 0;
    }
	
	public function updatePassword($username, $password) {
		$stmt = $this->conn->prepare("UPDATE users set password = ? where name = ?");
        $stmt->bind_param("ss", md5($password), $username);
        
        return $stmt->execute();
        
	}
	
	public function getAllCategory() {
		$result = array();
		$stmt = $this->conn->prepare("SELECT * from category");
        $stmt->execute();
		$res = $stmt->get_result();
		while($row = $res->fetch_assoc()) {
		   $result[] = $row;
		}
		return $result;
	}
	
	public function getResources($category) {
		$result = array();
		$stmt = $this->conn->prepare("SELECT  AVG(ratings.ratings) as rating, resources.* FROM resources LEFT OUTER JOIN ratings ON ratings.resource_id = resources.id WHERE resources.service_type like ? GROUP BY resources.id");
		//SELECT  AVG(ratings.ratings) as rating, resources.* FROM resources JOIN ratings ON ratings.resource_id = resources.id WHERE resources.service_type like 'Electrician'
		$stmt->bind_param("s",$category);
        $stmt->execute();
		$res = $stmt->get_result();

		while($row = $res->fetch_assoc()) {
		   $result[] = $row;
		}
		return $result;
	}
	
	public function insertRating($resource_id,$rating) {
	    	$stmt = $this->conn->prepare("INSERT INTO ratings(resource_id,ratings) values(?, ?)");
    		$stmt->bind_param("ii", $resource_id,$rating);

    		$result = $stmt->execute();
    		$rating_id = $stmt->insert_id;
    
    		$stmt->close();
    
    		// Check for successful insertion
    		if ($result) {
    			// User successfully inserted
    			return USER_CREATED_SUCCESSFULLY;
    		} else {
    			// Failed to create user
    			return USER_CREATE_FAILED;
    		}
	    
	}
	
    public function sendSms($mobile, $message) {
    
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
            echo 'error:' . curl_error($ch);
        }
    
        curl_close($ch);
    }

	public function getFoodMenu() {
		$result = array();
		$stmt = $this->conn->prepare("SELECT * from foods");
        $stmt->execute();
		$res = $stmt->get_result();
		while($row = $res->fetch_assoc()) {
		   $result[] = $row;
		}
		return $result;
	}
}
?>
