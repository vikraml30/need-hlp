<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Foods_model extends CI_Model {

    public function foodsListing() {
        $this->db->select('*');
        $this->db->from('foods');
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
    }
	
	public function addNewFood($foodsInfo) {
        $this->db->trans_start();
        $this->db->insert('foods', $foodsInfo);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        return $insert_id;
    }
	
	public function editFood($foodId) {
        $this->db->select('*');
        $this->db->from('foods');
        $this->db->where('id', $foodId);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
		
    }
	public function updateFood($foodInfo, $foodId) {
        $this->db->where('id', $foodId);
        $this->db->update('foods', $foodInfo);
        return TRUE;
    }
	public function deleteFood($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('foods');
        return TRUE;
    }
	
    public function getFoods() {
        $this->db->select('name');
        $this->db->from('foods');
        $query = $this->db->get();

        $result = $query->result();        
        return $result;
    }
    
    public function getUnreadFoodBookings() {
        $this->db->select('fb.*, fb.id as fbid, u.id as userId, fb.created_date as foodB_created_date, u.*');
        $this->db->from('food_booking fb');
        $this->db->join('users u', 'u.mobile = fb.user_mobile');
        $this->db->where('sent', 0);
        $query = $this->db->get();

        $result = $query->result();
        return $result;
    }
    
    public function getReadFoodBookings() {
        $this->db->select('*');
        $this->db->from('food_booking');
        $this->db->where('sent', 1);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
    }
    
    public function addNotificationRecord($notificationInfo) {
        $this->db->trans_start();
        $this->db->insert('notification_to_user', $notificationInfo);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        return $insert_id;
    }
    
    public function updateFoodBooking($fbid) {
        $arrUpdate = array('sent'=>1);
        $this->db->where('id', $fbid);
        $this->db->update('food_booking', $arrUpdate);
        return TRUE;
    }
	
}