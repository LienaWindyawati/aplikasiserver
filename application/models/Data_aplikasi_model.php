<?php
//Subscribe Youtube Channel Peternak Kode on https://youtube.com/c/peternakkode
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Data_aplikasi_model extends CI_Model {

    public $table = 'data_aplikasi';
    public $id    = 'id_aplikasi';
    public $order = 'DESC';

    function __construct() {
        parent::__construct();
    }

    public function getFields() {
        return [
            'id_aplikasi',
            'nama',
            'url',
            'pemilik',
            'tahun_buat',
            'deskripsi',
            'intergrasi',
            'status_optimal',

        ];
    }

}