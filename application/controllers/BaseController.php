<?php
defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class BaseController extends REST_Controller
{
    function responseSuccess($msg = "OK.", $result = [])
    {
        $body = [
            'message' => $msg,
            'error' => '',
            'data' => $result,
        ];

        $this->response($body, REST_Controller::HTTP_OK);
    }

    function responseFailed($msg = "Bad Request.", $error_type = "process", $result = [])
    {
        $body = [
            'message' => $msg,
            'error' => $error_type,
            'data' => $result,
        ];

        $this->response($body, REST_Controller::HTTP_NOT_FOUND);
    }
}
