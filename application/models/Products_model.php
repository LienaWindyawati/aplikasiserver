<?php
//Subscribe Youtube Channel Peternak Kode on https://youtube.com/c/peternakkode
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Products_model extends CI_Model {

    public $table = 'products';
    public $id    = 'id';
    public $order = 'DESC';

    function __construct() {
        parent::__construct();
    }

    public function getFields() {
        return [
            'id',
            'jenis',
            'nama',
            'keterangan',
            'harga',
            'status',
            'stok',

        ];
    }

}