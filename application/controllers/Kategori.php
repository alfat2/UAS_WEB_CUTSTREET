<?php

class Kategori extends CI_Controller{
    public function tops()
    {
        $data['tops'] = $this->model_kategori->data_tops()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('tops',$data);
        $this->load->view('templates/footer');
    }

    public function outers()
    {
        $data['outers'] = $this->model_kategori->data_outers()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('outers',$data);
        $this->load->view('templates/footer');
    }

    public function buttoms()
    {
        $data['buttoms'] = $this->model_kategori->data_buttoms()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('buttoms',$data);
        $this->load->view('templates/footer');
    }
}