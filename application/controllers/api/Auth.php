<?php

defined('BASEPATH') or exit('No direct script access allowed');

require_once APPPATH . 'controllers/BaseController.php';

class Auth extends BaseController
{
    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->library('form_validation');
        $this->load->database();
    }

    function login_post()
    {
        $this->form_validation->set_rules('username', 'Username', 'required', [
            'required' => '{field} tidak boleh kosong'
        ]);

        $this->form_validation->set_rules('password', 'Password', 'required', [
            'required' => '{field} tidak boleh kosong'
        ]);

        if ($this->form_validation->run() == false) {
            $this->responseFailed('Proses login gagal', 'errorValidation', $this->form_validation->error_array());
            return false;
        }

        try {
            $this->db->trans_begin();

            $username = $this->post('username');
            $password = $this->post('password');

            $account = $this->db->get_where('users', ['username' => $username])->row();

            if (!$account) {
                throw new \Exception("akun tidak ditemukan", 1);
            }

            if (!password_verify($password, $account->password)) {
                throw new \Exception("username/password salah!!", 1);
            }

            unset($account->password);
            $this->responseSuccess('Login berhasil', $account);

            $this->db->trans_commit();
        } catch (\Throwable $th) {
            $this->db->trans_rollback();
            $this->responseFailed('Proses login gagal', $th->getMessage());
        }
    }

    function registration_post()
    {
        $this->form_validation->set_rules('username', 'Username', 'required|is_unique[users.username]', [
            'required' => '{field} tidak boleh kosong',
            'is_unique' => '{field} telah digunakan'
        ]);

        $this->form_validation->set_rules('email', 'Email', 'required|valid_email', [
            'required' => '{field} tidak boleh kosong',
            'valid_email' => '{field} tidak valid'
        ]);

        $this->form_validation->set_rules('password', 'Password', 'required|min_length[5]', [
            'required' => '{field} tidak boleh kosong',
            'min_length' => '{field} minimal {param} karakter'
        ]);
        $this->form_validation->set_rules('password_confirmation', 'Konfirmasi Password', 'required|matches[password]', [
            'required' => '{field} tidak boleh kosong',
            'matches' => '{field} tidak sesuai'
        ]);

        if ($this->form_validation->run() == false) {
            $this->responseFailed('Proses login gagal', 'errorValidation', $this->form_validation->error_array());
            return false;
        }

        try {
            $this->db->trans_begin();

            $data = [
                'username' => $this->post('username'),
                'email' => $this->post('email'),
                'password' => password_hash(
                    $this->post('password'),
                    PASSWORD_DEFAULT
                ),
            ];

            $this->db->insert('users', $data);

            if ($this->db->affected_rows() <= 0) {
                throw new \Exception("Registrasi gagal", 1);
            }

            $this->responseSuccess('Selamat Registrasi berhasil');
            $this->db->trans_commit();
        } catch (\Throwable $th) {
            $this->db->trans_rollback();
            $this->responseFailed('Proses login gagal', $th->getMessage());
        }
    }
}
