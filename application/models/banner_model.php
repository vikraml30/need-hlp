<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Banner_model extends CI_Model {

    public function bannerListing() {
        $this->db->select('*');
        $this->db->from('banner');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    
    public function addNewBanner($bannerInfo) {
        $this->db->trans_start();
        $this->db->insert('banner', $bannerInfo);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        return $insert_id;
    }
	
	public function editBanner($bannerId) {
        $this->db->select('*');
        $this->db->from('banner');
        $this->db->where('id', $bannerId);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
		
    }
	public function updateBanner($bannerInfo, $bannerId) {
        $this->db->where('id', $bannerId);
        $this->db->update('banner', $bannerInfo);
        return TRUE;
    }
	public function deleteBanner($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('banner');
        return TRUE;
    }
	
	public function getBanner() {
		$this->db->select('name');
        $this->db->from('banner');
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
	}
	
}