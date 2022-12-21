<?php

class model_kategori extends CI_Model{
    public function data_tops(){
        return $this->db->get_where('tb_brg',array('kategori' => 'tops'));
    }

    public function data_outers(){
        return $this->db->get_where('tb_brg',array('kategori' => 'outers'));
    }

    public function data_buttoms(){
        return $this->db->get_where('tb_brg',array('kategori' => 'buttoms'));
    }
   
}