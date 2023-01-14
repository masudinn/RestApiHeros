<?php

defined('BASEPATH') or exit('No direct script access allowed');

require_once APPPATH . 'controllers/BaseController.php';

class Heros extends BaseController
{
    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->database();
    }

    function index_get()
    {
        $data = $this->db->get('heros')->result_array();
        $this->responseSuccess('list data heros', $data);
    }
}
