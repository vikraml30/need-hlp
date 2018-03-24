<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Banner extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct() {
        parent::__construct();
        $this->load->model('banner_model');
        $this->isLoggedIn();   
		$this->global['pageTitle'] = 'Banner';
    }
    
    public function index() {
		$this->load->model('banner_model');
		$data['bannerRecords'] = $this->banner_model->bannerListing();
		$this->loadViews("banner", $this->global, $data, NULL);
    }
    
    function addNew() {
		$this->load->model('banner_model');
		$this->loadViews("addBanner", $this->global, NULL, NULL);
    }
	
	public function create_banner(){
		$imagename = time()."_".basename($_FILES['image']['name']);
		$tempImg = $_FILES['image']['tmp_name'];
		if(false == move_uploaded_file($tempImg, "uploads/".$imagename)) {
			$this->session->set_flashdata('error', 'Image upload failed');
			redirect('banner/index');
		}
		
		$name = ucwords(strtolower($this->input->post('name')));
		$imgUrl = '/uploads/'.$imagename;

		$categoryInfo = array('name'=>$name, 'image_url'=>$imgUrl);

		$this->load->model('banner_model');
		$result = $this->banner_model->addNewBanner($categoryInfo);

		if($result > 0) {
			$this->session->set_flashdata('success', 'New banner created successfully');
		} else {
			$this->session->set_flashdata('error', 'Banner creation failed');
		}
		
		redirect('banner/index');
	}
	
	public function editBannerOld($bannerId){
		if($bannerId == null) {
			redirect('banner/index');
		}
            
		$data['bannerData'] = $this->banner_model->editBanner($bannerId);
		
		$this->global['pageTitle'] = 'Edit Banner';
		
		$this->loadViews("editBanner", $this->global, $data, NULL);
	}
	
	public function editBanner() {

		$id = $this->input->post('id');
		$name = ucwords(strtolower($this->input->post('name')));
		
		if("" != $_FILES['image']['name']) {
			$imagename = time()."_".basename($_FILES['image']['name']);
			$tempImg = $_FILES['image']['tmp_name'];
			if(false == move_uploaded_file($tempImg, "uploads/".$imagename)) {
				$this->session->set_flashdata('error', 'Image upload failed');
				redirect('banner/index');
			}
			$imgUrl = '/uploads/'.$imagename;
			$bannerInfo = array('name'=>$name, 'image_url'=>$imgUrl);
		} else {
			$bannerInfo = array('name'=>$name);
		}
		
		$result = $this->banner_model->updateBanner($bannerInfo, $id);
		
		if($result == true) {
			$this->session->set_flashdata('success', 'Banner updated successfully');
		} else {
			$this->session->set_flashdata('error', 'Banner updation failed');
		}
		
		redirect('banner/index');
    }
	
	public function deleteBanner($id) {
		
		$bannerInfo = $this->banner_model->editBanner($id);
		$strUnlinkImage = str_replace('/', '\\', $bannerInfo[0]->image_url);
		//unlink(substr($strUnlinkImage, 1));
		
		$result = $this->banner_model->deleteBanner($id);

		if($result > 0) {
			$this->session->set_flashdata('success', 'Banner deleted successfully');
		} else {
			$this->session->set_flashdata('error', 'Banner deletion failed');
		}
		
		redirect('banner/index');
    }

}

?>