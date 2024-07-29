<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Inventory extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('AuthModel');
        $this->load->model('AdminModel');
        $this->AuthModel->cekLoginInventory();
    }

    public function index()
    {
        $this->template->load('layout/main', 'inventory/dashboard');
    }

    public function Departement()
    {
        $this->template->load('layout/main', 'inventory/departement');
    }

    public function Supplier()
    {
        $this->template->load('layout/main', 'inventory/supplier');
    }

    public function Kategori()
    {
        $this->template->load('layout/main', 'inventory/kategori');
    }

    public function Barang()
    {
        $this->template->load('layout/main', 'inventory/barang');
    }

    public function Detail_Barang($id)
    {
        $data['id'] = $id;
        $this->template->load('layout/main', 'inventory/barang_detail', $data);
    }

    public function User()
    {
        $this->template->load('layout/main', 'inventory/user');
    }

    public function Detail_User($id)
    {
        $data['id'] = $id;
        $this->template->load('layout/main', 'inventory/user_detail', $data);
    }

    public function Data_Barang_Masuk()
    {
        $this->template->load('layout/main', 'inventory/barang_masuk');
    }

    public function Tambah_Data_Barang_Masuk()
    {
        $this->template->load('layout/main', 'inventory/barang_masuk_tambah');
    }

    public function Detail_Barang_Masuk($id)
    {
        $data['id'] = $id;
        $this->template->load('layout/main', 'inventory/barang_masuk_detail', $data);
    }

    public function Request_Permintaan_Barang()
    {
        $this->template->load('layout/main', 'inventory/request_permintaan_barang');
    }

    public function Tambah_Request_Permintaan_Barang()
    {
        $this->template->load('layout/main', 'inventory/request_permintaan_barang_tambah');
    }

    public function Detail_Request_Permintaan_Barang($id)
    {
        $data['id'] = $id;
        $this->template->load('layout/main', 'inventory/request_permintaan_barang_detail', $data);
    }

    public function Edit_Request_Permintaan_Barang($id)
    {
        $data['id'] = $id;
        $this->template->load('layout/main', 'inventory/request_permintaan_barang_edit', $data);
    }

    public function Data_Permintaan_Barang()
    {
        $this->template->load('layout/main', 'inventory/permintaan_barang');
    }

    public function Proses_Permintaan_Barang($id)
    {
        $data['id'] = $id;
        $this->template->load('layout/main', 'inventory/permintaan_barang_proses', $data);
    }

    public function Detail_Permintaan_Barang($id)
    {
        $data['id'] = $id;
        $this->template->load('layout/main', 'inventory/permintaan_barang_detail', $data);
    }

    public function Data_Barang_Keluar()
    {
        $this->template->load('layout/main', 'inventory/barang_keluar');
    }

    public function Detail_Barang_Keluar($id)
    {
        $data['id'] = $id;
        $this->template->load('layout/main', 'inventory/barang_keluar_detail', $data);
    }

    public function PO()
    {
        $this->template->load('layout/main', 'inventory/po');
    }

    public function Tambah_PO()
    {
        $this->template->load('layout/main', 'inventory/po_tambah');
    }

    public function Detail_PO($id)
    {
        $data['id'] = $id;
        $this->template->load('layout/main', 'inventory/po_detail', $data);
    }

    public function Print_PO($id)
    {
        $where['id_po'] = $id;
        $join = 'user.id_user=purchase_order.id_user';
        $data['po'] = $this->AdminModel->join_Where('purchase_order', 'user', $join, $where)->row_array();
        $where_detail['id_po'] = $data['po']['id_detail_po'];
        // var_dump($where_detail['id_po']);
        // die;
        $join2 = 'barang.id_barang=detail_po.id_barang';
        $sum = 'SUM(qty_po) AS Total';
        $data['detail_po'] = $this->AdminModel->join_Where('detail_po', 'barang', $join2, $where_detail)->result();
        $data['total'] = $this->AdminModel->count_where('detail_po', $sum, $where_detail)->row_array();
        $this->load->view('inventory/po_print', $data);
    }

    public function Data_Stok_Barang()
    {
        $this->template->load('layout/main', 'inventory/stok_barang');
    }

    public function Laporan_Barang_Masuk()
    {
        $this->template->load('layout/main', 'inventory/laporan_barang_masuk');
    }

    public function Laporan_Barang_Keluar()
    {
        $this->template->load('layout/main', 'inventory/laporan_barang_keluar');
    }

    public function Laporan_Permintaan_Barang()
    {
        $this->template->load('layout/main', 'inventory/laporan_permintaan_barang');
    }

    public function Laporan_PO()
    {
        $this->template->load('layout/main', 'inventory/laporan_po');
    }

    public function Laporan_Stok_Barang()
    {
        $this->template->load('layout/main', 'inventory/laporan_stok_barang');
    }

    public function Profile()
    {
        $this->template->load('layout/main', 'inventory/profile');
    }
}
