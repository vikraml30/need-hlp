<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Resources_model extends CI_Model {

    public function resourceListing($searchText = '', $page, $segment,$userId) {
        $this->db->select('*');
        $this->db->from('resources');
		$this->db->where('user_id', $userId);
        //$this->db->limit($page, $segment);
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
	
	public function addNewResource($ResourceInfo) {
        $this->db->trans_start();
        $this->db->insert('resources', $ResourceInfo);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        return $insert_id;
    }
	
	public function editResource($resourceId) {
        $this->db->select('*');
        $this->db->from('resources');
        $this->db->where('id', $resourceId);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
		
    }
	public function updateResource($resourceInfo, $resourceId) {
        $this->db->where('id', $resourceId);
        $this->db->update('resources', $resourceInfo);
        return TRUE;
    }
	public function deleteResource($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('resources');
        return TRUE;
    }
	
}

  