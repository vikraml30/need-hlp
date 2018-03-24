<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Service_model extends CI_Model {

    public function serviceListing() {
        $this->db->select('*');
        $this->db->from('vehicle_mechanic');
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
    }
	
    public function getUnreadServiceBookings() {
        $this->db->select('sb.*, sb.id as sbid, u.id as userId, u.*');
        $this->db->from('vehicle_mechanic sb');
        $this->db->join('users u', 'u.mobile = sb.user_mobile');
        $this->db->where('sent', 0);
        $query = $this->db->get();

        $result = $query->result();
        return $result;
    }
    
    public function getReadServiceBookings() {
        $this->db->select('*');
        $this->db->from('vehicle_mechanic');
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
    
    public function updateServiceBooking($sbid) {
        $arrUpdate = array('sent'=>1);
        $this->db->where('id', $sbid);
        $this->db->update('vehicle_mechanic', $arrUpdate);
        return TRUE;
    }
	
}