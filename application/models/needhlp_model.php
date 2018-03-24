<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Needhlp_model extends CI_Model {

    public function getLogin($username, $password) {
        $this->db->select('*');
        $this->db->from('tbl_users');
		$this->db->where("email", $username);   
        $this->db->where('password',password_hash($password));
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
    }
	
}