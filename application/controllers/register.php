<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Register extends BaseController
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
    }
    
    /**
     * This function used to load the first screen of the user
     */
    public function index()
    {
        $this->global['pageTitle'] = 'Register';
        
        $this->load->view("register");
    }
    
    /**
     * This function is used to load the add new form
     */
    function addNew()
    {
		$this->load->model('user_model');
		
		$this->global['pageTitle'] = 'Add New User';

		$this->load->view("register");
    }

    /**
     * This function is used to check whether email already exist or not
     */
    function checkEmailExists()
    {
        $userId = $this->input->post("userId");
        $email = $this->input->post("email");

        if(empty($userId)){
            $result = $this->user_model->checkEmailExists($email);
        } else {
            $result = $this->user_model->checkEmailExists($email, $userId);
        }

        if(empty($result)){ echo("true"); }
        else { echo("false"); }
    }
    
    /**
     * This function is used to add new user to the system
     */
    function addNewUser() {
		$this->load->library('form_validation');
		
		$this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]|xss_clean');
		$this->form_validation->set_rules('email','Email','trim|required|valid_email|xss_clean|max_length[128]');
		$this->form_validation->set_rules('password','Password','required|max_length[20]');
		$this->form_validation->set_rules('cpassword','Confirm Password','trim|required|matches[password]|max_length[20]');
		$this->form_validation->set_rules('role','Role','trim|required|numeric');
		$this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]|xss_clean');
		
		$result = $this->user_model->checkEmailExists($this->input->post('email'));
		
		if(!empty($result)){ 
			$this->session->set_flashdata('error', 'Email id already exists!');
			redirect('register');
		} else { 
			if($this->form_validation->run() == FALSE) {
				if( $this->input->post('password') != $this->input->post('cpassword') ) {
					$this->session->set_flashdata('error', 'Password did not match!');
				} else {
					$this->session->set_flashdata('error', 'Enter all fields!');
				}
				
				redirect('register');
			} else {
				$name = ucwords(strtolower($this->input->post('fname')));
				$email = $this->input->post('email');
				$password = $this->input->post('password');
				$roleId = $this->input->post('role');
				$mobile = $this->input->post('mobile');
				
				$userInfo = array('email'=>$email, 'password'=>getHashedPassword($password), 'roleId'=>$roleId, 'name'=> $name,
									'mobile'=>$mobile, 'createdDtm'=>date('Y-m-d H:i:s'));
				
				$this->load->model('user_model');
				$result = $this->user_model->addNewUser($userInfo);
				
				if($result > 0)
				{
					$this->session->set_flashdata('success', 'New User created successfully. Login to access the admin panel.');
				}
				else
				{
					$this->session->set_flashdata('error', 'User creation failed');
				}
				
				redirect('login');
			}
		}
    }

}

?>