<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Categories extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct() {
        parent::__construct();
        $this->load->model('category_model');
        $this->isLoggedIn();   
		$this->global['pageTitle'] = 'Category';
    }
    
    public function index() {
		$this->load->model('category_model');
		//$this->load->library('pagination');
		$userId = $this->session->userdata['userId'];
		$data['CategoryRecords'] = $this->category_model->categoryListing('', '', '',$userId);
		$this->loadViews("category", $this->global, $data, NULL);
    }
    
    function addNew() {
		$this->load->model('category_model');
		$data['userId'] = $this->session->userdata['userId'];
		$this->loadViews("addCategory", $this->global, $data, NULL);
    }
	
	public function create_category(){
		$imagename = time()."_".basename($_FILES['image']['name']);
		$tempImg = $_FILES['image']['tmp_name'];
		if(false == move_uploaded_file($tempImg, "uploads/".$imagename)) {
			$this->session->set_flashdata('error', 'Image upload failed');
			redirect('categories/index');
		}
		
		$name = ucwords(strtolower($this->input->post('name')));
		$description = $this->input->post('description');
		$user_id = $this->input->post('user_id');
		$imgUrl = '/uploads/'.$imagename;

		$categoryInfo = array('name'=>$name, 'description'=>$description,'user_id'=>$user_id, 'image_url'=>$imgUrl);

		$this->load->model('category_model');
		$result = $this->category_model->addNewCategory($categoryInfo);

		if($result > 0) {
			$this->session->set_flashdata('success', 'New category created successfully');
		} else {
			$this->session->set_flashdata('error', 'Category creation failed');
		}
		
		redirect('categories/index');
	}
	
	public function editCategoryOld($categoryId){
		if($categoryId == null) {
			redirect('categories/index');
		}
            
		$data['categoryData'] = $this->category_model->editCategory($categoryId);
		
		$this->global['pageTitle'] = 'Edit Category';
		
		$this->loadViews("editCategory", $this->global, $data, NULL);
	}
	
	public function editCategory() {

		$imagename = time()."_".basename($_FILES['image']['name']);
		$tempImg = $_FILES['image']['tmp_name'];
		if(false == move_uploaded_file($tempImg, "uploads/".$imagename)) {
			$this->session->set_flashdata('error', 'Image upload failed');
			redirect('categories/index');
		}
		$id = $this->input->post('id');
		$name = ucwords(strtolower($this->input->post('name')));
		$description = $this->input->post('description');
		$imgUrl = '/uploads/'.$imagename;
		
		$categoryInfo = array('name'=>$name,'description'=>$description, 'image_url'=>$imgUrl);

		$result = $this->category_model->updateCategory($categoryInfo, $id);
		
		if($result == true) {
			$this->session->set_flashdata('success', 'Category updated successfully');
		} else {
			$this->session->set_flashdata('error', 'Category updation failed');
		}
		
		redirect('categories/index');
    }
	
	public function deleteCategory($id) {
		
		$categoryInfo = $this->category_model->editCategory($id);
		$strUnlinkImage = str_replace('/', '\\', $categoryInfo[0]->image_url);
		//unlink(substr($strUnlinkImage, 1));
		
		$result = $this->category_model->deleteCategory($id);

		if($result > 0) {
			$this->session->set_flashdata('success', 'Category deleted successfully');
		} else {
			$this->session->set_flashdata('error', 'Category deletion failed');
		}
		
		redirect('categories/index');
    }

}

?>