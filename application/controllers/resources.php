<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Resources extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct() {
        parent::__construct();
        $this->load->model('resources_model');
        $this->isLoggedIn();   
		$this->global['pageTitle'] = 'Resource';
    }
    
    public function index() {
		$this->load->model('resources_model');
		$userId = $this->session->userdata['userId'];
//		$this->load->library('pagination');
		$data['resourceRecords'] = $this->resources_model->resourceListing('', '', '',$userId);
		
		$this->loadViews("resources", $this->global, $data, NULL);
    }
    
    function addNew() {
		$this->load->model('resources_model');
		$this->load->model('category_model');
		$userId = $this->session->userdata['userId'];
		$data['categories'] = $this->category_model->getCategories($userId);
		$data['userId'] = $userId;
		$this->loadViews("addResources", $this->global, $data, NULL);
    }
	
	public function create_resource(){
	    $imgUrl = NULL;
	    //var_dump($_FILES['image']['name']);exit;
	    if($_FILES['image']['name']){
    		$imagename = time()."_".basename($_FILES['image']['name']);
    		$tempImg = $_FILES['image']['tmp_name'];
    		if(false == move_uploaded_file($tempImg, "uploads/".$imagename)) {
    			$this->session->set_flashdata('error', 'Image upload failed');
    			redirect('resources/addNew');
    		}
    		$imgUrl = '/uploads/'.$imagename;
	    }
		$first_name = ucwords(strtolower($this->input->post('rfname')));
		$last_name = ucwords(strtolower($this->input->post('rlname')));
		$email = $this->input->post('remail');
		$address = $this->input->post('raddress');
		$serviceType = $this->input->post('serviceType');
		$rmobile = $this->input->post('rmobile');
		$rcity = $this->input->post('rcity');
		$rstate = $this->input->post('rstate');
		$userId = $this->input->post('user_id');

		$resourceInfo = array('first_name'=>$first_name, 'last_name'=>$last_name, 'address'=>$address, 'service_type'=> $serviceType,'email'=>$email, 'city'=>$rcity, 'state'=>$rstate,'mobile'=>$rmobile,'user_id'=>$userId, 'image_url'=>$imgUrl);

		$this->load->model('resources_model');
		$result = $this->resources_model->addNewResource($resourceInfo);
		
		if($result > 0) {
			$this->session->set_flashdata('success', 'New resource created successfully');
		} else {
			$this->session->set_flashdata('error', 'Resource creation failed');
		}
		
		redirect('resources/index');
	}
	
	public function editResourceOld($resourceId){
		if($resourceId == null) {
			redirect('resources/index');
		}
            
		//$data['categories'] = $this->category_model->getCategories();
		//$userId = $this->session->userdata['userId'];
		$data['resourceData'] = $this->resources_model->editResource($resourceId);
		
		$this->global['pageTitle'] = 'Edit Resource';
		
		$this->loadViews("editResource", $this->global, $data, NULL);
	}
	
	public function editResource() {

        $imgUrl = "";
        if($_FILES['image']['name']){
    		$imagename = time()."_".basename($_FILES['image']['name']);
    		$tempImg = $_FILES['image']['tmp_name'];
    		if(false == move_uploaded_file($tempImg, "uploads/".$imagename)) {
    			$this->session->set_flashdata('error', 'Image upload failed');
    			redirect('resources/index');
    		}
    		$imgUrl = '/uploads/'.$imagename;
        }
		$id = $this->input->post('id');
		$first_name = ucwords(strtolower($this->input->post('first_name')));
		$last_name = ucwords(strtolower($this->input->post('last_name')));
		$email = $this->input->post('email');
		$mobile = $this->input->post('mobile');
		
		$address = $this->input->post('address');
		//$serviceType = $this->input->post('serviceType');
		$city = $this->input->post('city');
		$state = $this->input->post('state');
		
		if( '' != $imgUrl ){
		    $resourceInfo = array('first_name'=>$first_name,'last_name'=>$last_name,'email'=>$email, 'mobile'=>$mobile, 'address'=>$address, 'city'=>$city, 'state'=>$state, 'image_url'=>$imgUrl);
		}else{
		    $resourceInfo = array('first_name'=>$first_name,'last_name'=>$last_name,'email'=>$email, 'mobile'=>$mobile, 'address'=>$address, 'city'=>$city, 'state'=>$state);
		}

		$result = $this->resources_model->updateResource($resourceInfo, $id);
		
		if($result == true) {
			$this->session->set_flashdata('success', 'Resource updated successfully');
		} else {
			$this->session->set_flashdata('error', 'Resource updation failed');
		}
		
		redirect('resources/index');
    }
	
	public function deleteResource($id) {
		$resourceInfo = $this->resources_model->editResource($id);
		$strUnlinkImage = str_replace('/', '\\', $resourceInfo[0]->image_url);
		//unlink(substr($strUnlinkImage, 1));
		$result = $this->resources_model->deleteResource($id);

		if($result > 0) {
			
			$this->session->set_flashdata('success', 'Resource deleted successfully');
		} else {
			$this->session->set_flashdata('error', 'Resource deletion failed');
		}
		
		redirect('resources/index');
    }

}

?>