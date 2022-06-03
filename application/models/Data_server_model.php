<?php
//Subscribe Youtube Channel Peternak Kode on https://youtube.com/c/peternakkode
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Data_server_model extends CI_Model {

    public $table = 'data_server';
    public $id    = 'id_server';
    public $order = 'DESC';

    function __construct() {
        parent::__construct();
    }

    public function getFields() {
        return [
            'id_server',
            'id_vm',
            'IPserver',
            'nama',
            'seri',
            'tahun_beli',
            'pembeli',
            'histori',

        ];
    }

}