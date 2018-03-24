<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class NeedHlp extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct() {
        parent::__construct();
        $this->isLoggedIn();
    }
    
	public function loginService() {
		$this->load->model('needhlp_model');
		$userName = $this->input->post('username');
		$password = $this->input->post('password');
		
		$authenticate = $this->needhlp_model->getLogin($userName, $password);
	}
	
	public function registerUser() {
		$userName	= $this->input->post('username');
		$password	= $this->input->post('password');
		$mobile		= $this->input->post('mobile');
		$apiKey		= $this->input->post('apikey');
	}
    
}

?>