<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Cars extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct() {
        parent::__construct();
        $this->load->model('cars_model');
        $this->isLoggedIn();   
		$this->global['pageTitle'] = 'Cars';
    }
    
    public function index() {
		$this->load->model('cars_model');
		//$this->load->library('pagination');
		$userId = $this->session->userdata['userId'];
		$data['CarsRecords'] = $this->cars_model->carsListing('', '', '',$userId);
		$this->loadViews("cars", $this->global, $data, NULL);
    }
    
    function addNew() {
		$this->load->model('cars_model');
		$data['userId'] = $this->session->userdata['userId'];
		$this->loadViews("addCars", $this->global, $data, NULL);
    }
	
	public function create_cars(){
		$imagename = time()."_".basename($_FILES['image']['name']);
		$tempImg = $_FILES['image']['tmp_name'];
		if(false == move_uploaded_file($tempImg, "uploads/".$imagename)) {
			$this->session->set_flashdata('error', 'Image upload failed');
			redirect('cars/index');
		}
		
		$name = ucwords(strtolower($this->input->post('name')));
		$description = $this->input->post('description');
		$user_id = $this->input->post('user_id');
		$imgUrl = '/uploads/'.$imagename;

		$categoryInfo = array('name'=>$name, 'description'=>$description,'user_id'=>$user_id, 'image_url'=>$imgUrl);

		$this->load->model('cars_model');
		$result = $this->cars_model->addNewCars($categoryInfo);

		if($result > 0) {
			$this->session->set_flashdata('success', 'New car created successfully');
		} else {
			$this->session->set_flashdata('error', 'Car creation failed');
		}
		
		redirect('cars/index');
	}
	
	public function editCarsOld($carsId){
		if($carsId == null) {
			redirect('cars/index');
		}
            
		$data['carsData'] = $this->cars_model->editCars($carsId);
		
		$this->global['pageTitle'] = 'Edit Cars';
		
		$this->loadViews("editCars", $this->global, $data, NULL);
	}
	
	public function editCars() {

		$id = $this->input->post('id');
		$name = ucwords(strtolower($this->input->post('name')));
		$description = $this->input->post('description');
		
		if("" != $_FILES['image']['name']) {
			$imagename = time()."_".basename($_FILES['image']['name']);
			$tempImg = $_FILES['image']['tmp_name'];
			if(false == move_uploaded_file($tempImg, "uploads/".$imagename)) {
				$this->session->set_flashdata('error', 'Image upload failed');
				redirect('cars/index');
			}
			$imgUrl = '/uploads/'.$imagename;
			$carInfo = array('name'=>$name,'description'=>$description, 'image_url'=>$imgUrl);
		} else {
			$carInfo = array('name'=>$name,'description'=>$description);
		}
		
		$result = $this->cars_model->updateCars($carInfo, $id);
		
		if($result == true) {
			$this->session->set_flashdata('success', 'Car updated successfully');
		} else {
			$this->session->set_flashdata('error', 'Car updation failed');
		}
		
		redirect('cars/index');
    }
	
	public function deleteCars($id) {
		
		$carInfo = $this->cars_model->editCars($id);
		$strUnlinkImage = str_replace('/', '\\', $carInfo[0]->image_url);
		//unlink(substr($strUnlinkImage, 1));
		
		$result = $this->cars_model->deleteCars($id);

		if($result > 0) {
			$this->session->set_flashdata('success', 'Car deleted successfully');
		} else {
			$this->session->set_flashdata('error', 'Car deletion failed');
		}
		
		redirect('cars/index');
    }

}

?>