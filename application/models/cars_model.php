<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Cars_model extends CI_Model {

    public function carsListing($searchText = '', $page, $segment, $userId = '') {
        $this->db->select('*');
        $this->db->from('cars');
		$this->db->where('user_id', $userId);
        //$this->db->limit($page, $segment);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
    }
    
    public function getUnreadCarBookings() {
        $this->db->select('cb.*,cb.created_date as carB_created_date, u.*');
        $this->db->from('car_booking cb');
        $this->db->join('users u', 'u.mobile = cb.user_mobile');
        $this->db->where('sent', 0);
        $query = $this->db->get();
        
        $result = $query->result();        
        //var_dump($result);exit;
        return $result;
    }
    
    public function getReadCarBookings() {
        $this->db->select('*');
        $this->db->from('car_booking');
        $this->db->where('sent', 1);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
    }
	
	public function addNewCars($CarsInfo) {
        $this->db->trans_start();
        $this->db->insert('cars', $CarsInfo);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        return $insert_id;
    }
    
    public function addNotificationRecord($notificationInfo) {
        $this->db->trans_start();
        $this->db->insert('notification_to_user', $notificationInfo);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        return $insert_id;
    }

	public function editCars($carId) {
        $this->db->select('*');
        $this->db->from('cars');
        $this->db->where('id', $carId);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
		
    }
	public function updateCars($carInfo, $carId) {
        $this->db->where('id', $carId);
        $this->db->update('cars', $carInfo);
        return TRUE;
    }
    
    public function updateCarBooking($mobile) {
        $arrUpdate = array('sent'=>1);
        $this->db->where('user_mobile', $mobile);
        $this->db->update('car_booking', $arrUpdate);
        //var_dump($this->db);exit;
        return TRUE;
    }
    
	public function deleteCars($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('cars');
        return TRUE;
    }
	
	public function getCars($userId) {
		$this->db->select('name');
        $this->db->from('cars');
		$this->db->where('user_id', $userId);
        //$this->db->limit($page, $segment);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
	}
	
}