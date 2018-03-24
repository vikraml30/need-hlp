<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Category_model extends CI_Model {

    public function categoryListing($searchText = '', $page, $segment, $userId = '') {
        $this->db->select('*');
        $this->db->from('category');
		$this->db->where('user_id', $userId);
        //$this->db->limit($page, $segment);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
    }
	
	public function addNewCategory($CategoryInfo) {
        $this->db->trans_start();
        $this->db->insert('category', $CategoryInfo);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        return $insert_id;
    }
	
	public function editCategory($categoryId) {
        $this->db->select('*');
        $this->db->from('category');
        $this->db->where('id', $categoryId);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
		
    }
	public function updateCategory($categoryInfo, $categoryId) {
        $this->db->where('id', $categoryId);
        $this->db->update('category', $categoryInfo);
        return TRUE;
    }
	public function deleteCategory($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('category');
        return TRUE;
    }
	
	public function getCategories($userId) {
		$this->db->select('name');
        $this->db->from('category');
		$this->db->where('user_id', $userId);
        //$this->db->limit($page, $segment);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
	}
	
}