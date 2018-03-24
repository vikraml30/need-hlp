<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Foods extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct() {
        parent::__construct();
        $this->load->model('foods_model');
        $this->isLoggedIn();   
		$this->global['pageTitle'] = 'Foods';
    }
    
    public function index() {
		$this->load->model('foods_model');
		$data['foodsRecords'] = $this->foods_model->foodsListing();
		$this->loadViews("foods", $this->global, $data, NULL);
    }
    
    function addNew() {
		$this->load->model('foods_model');
		$this->loadViews("addFoods", $this->global, NULL);
    }
	
	public function create_food(){
		$category = $this->input->post('category');
		$item = $this->input->post('item');
		$price = $this->input->post('price');

		$foodsInfo = array('category'=>$category, 'item'=>$item, 'price'=>$price);

		$this->load->model('foods_model');
		$result = $this->foods_model->addNewFood($foodsInfo);

		if($result > 0) {
			$this->session->set_flashdata('success', 'New food menu created successfully');
		} else {
			$this->session->set_flashdata('error', 'Food menu creation failed');
		}
		
		redirect('foods/index');
	}
	
	public function editFoodOld($foodId){
		if($foodId == null) {
			redirect('foods/index');
		}
            
		$data['foodsData'] = $this->foods_model->editFood($foodId);
		
		$this->global['pageTitle'] = 'Edit Food Menu';
		
		$this->loadViews("editFood", $this->global, $data, NULL);
	}
	
	public function editFood() {

		$id = $this->input->post('id');
		$category = $this->input->post('category');
		$item = $this->input->post('item');
		$price = $this->input->post('price');
		
		$foodInfo = array('category'=>$category,'item'=>$item, 'price'=>$price);

		$result = $this->foods_model->updateFood($foodInfo, $id);
		
		if($result == true) {
			$this->session->set_flashdata('success', 'Food updated successfully');
		} else {
			$this->session->set_flashdata('error', 'Food updation failed');
		}
		
		redirect('foods/index');
    }
	
	public function deleteFood($id) {
		
		$carInfo = $this->foods_model->editFood($id);

		$result = $this->foods_model->deleteFood($id);

		if($result > 0) {
			$this->session->set_flashdata('success', 'Food deleted successfully');
		} else {
			$this->session->set_flashdata('error', 'Food deletion failed');
		}
		
		redirect('foods/index');
    }

}

?>