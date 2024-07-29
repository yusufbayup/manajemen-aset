-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Jul 2024 pada 06.42
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `berat_barang` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `id_kategori`, `id_supplier`, `nama_barang`, `satuan`, `berat_barang`, `keterangan`) VALUES
(1, 4, 1, 'Meja', 'Pcs', '3 Kg', 'Meja Kursi'),
(2, 4, 1, 'kursi', 'Pcs', '1 Kg', 'sadasd'),
(3, 3, 1, 'Laptop', 'Pcs', '2 Gr', 'test laptop'),
(4, 4, 1, 'buku', 'Pcs', '1 Gr', 'asik'),
(5, 3, 1, 'pulpen', 'Pcs', '1 Gr', 'siip'),
(6, 4, 2, 'kayu', 'Pcs', '2 Gr', 'keras');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang_keluar` int(11) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `id_permintaan` int(11) NOT NULL,
  `id_departement` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty_keluar` int(11) NOT NULL DEFAULT 0,
  `qty_diserahkan` int(11) NOT NULL,
  `batch_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barang_keluar`, `tgl_keluar`, `id_permintaan`, `id_departement`, `id_barang`, `qty_keluar`, `qty_diserahkan`, `batch_number`) VALUES
(1, '2024-06-18', 8, 12, 4, 0, 2, '004_001'),
(2, '2024-06-18', 8, 12, 4, 0, 1, '004_001'),
(3, '2024-06-24', 8, 12, 4, 0, 1, '004_001'),
(4, '2024-07-05', 9, 12, 1, 0, 1, '001_001'),
(5, '2024-07-05', 9, 12, 1, 0, 1, '001_001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` int(11) NOT NULL,
  `batch_number` varchar(255) NOT NULL,
  `tgl_datang` date NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `qty_masuk` int(11) NOT NULL,
  `exp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang_masuk`, `batch_number`, `tgl_datang`, `id_supplier`, `id_barang`, `satuan`, `qty_masuk`, `exp`) VALUES
(2, '002_001', '2024-05-15', 1, 2, 'Pcs', 4, '2022-08-30'),
(4, '002_002', '2024-06-03', 1, 2, 'Pcs', 1, '2024-05-07'),
(7, '003_002', '2024-06-13', 2, 3, 'Box', 2, '2024-06-30'),
(12, '004_001', '2024-06-24', 2, 4, 'Pcs', 1, '2024-06-24'),
(13, '001_001', '2024-07-05', 2, 1, 'Pcs', 1, '2024-07-31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `batch_number`
--

CREATE TABLE `batch_number` (
  `id_batch_number` int(11) NOT NULL,
  `batch_number` varchar(255) NOT NULL,
  `id_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `departement`
--

CREATE TABLE `departement` (
  `id_departement` int(11) NOT NULL,
  `nama_departement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `departement`
--

INSERT INTO `departement` (`id_departement`, `nama_departement`) VALUES
(12, 'Web Development'),
(13, 'Service Quality Assurance'),
(15, 'Service Assurance'),
(16, 'HRD');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_permintaan`
--

CREATE TABLE `detail_permintaan` (
  `id_detail_permintaan` int(11) NOT NULL,
  `id_permintaan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty_permintaan` int(11) NOT NULL,
  `qty_keluar_permintaan` int(11) NOT NULL,
  `ket_permintaan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `detail_permintaan`
--

INSERT INTO `detail_permintaan` (`id_detail_permintaan`, `id_permintaan`, `id_barang`, `qty_permintaan`, `qty_keluar_permintaan`, `ket_permintaan`) VALUES
(1, 1, 1, 1, 1, 'sadass'),
(2, 1, 2, 1, 1, 'asdsad'),
(3, 2, 1, 1, 1, 'asdsa'),
(4, 2, 2, 1, 1, 'asdsad'),
(5, 3, 3, 1, 1, ''),
(6, 4, 1, 1, 4, 'asd'),
(8, 6, 2, 2, 2, 'asd'),
(9, 7, 4, 2, 2, 'asd'),
(10, 8, 4, 3, 4, 'asd'),
(11, 9, 1, 1, 2, 'butuh');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_po`
--

CREATE TABLE `detail_po` (
  `id_detail_po` int(11) NOT NULL,
  `id_po` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty_po` int(11) NOT NULL,
  `ket_po` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `detail_po`
--

INSERT INTO `detail_po` (`id_detail_po`, `id_po`, `id_barang`, `qty_po`, `ket_po`) VALUES
(1, 1, 1, 1, 'asdasd'),
(2, 2, 2, 2, 'sadsad'),
(3, 3, 3, 3, 'sadsada'),
(4, 3, 2, 2, 'sadsadsa'),
(5, 4, 2, 4, 'asdsad'),
(6, 4, 1, 2, 'asdsada'),
(7, 5, 0, 0, ''),
(8, 9, 1, 1, 'asdsad'),
(9, 10, 1, 1, 'asdsad'),
(10, 10, 2, 2, 'asdsad'),
(11, 11, 1, 1, 'meja kerja');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_kategori`, `nama_kategori`) VALUES
(3, 'Besi'),
(4, 'Kayu'),
(5, 'Meja');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permintaan_barang`
--

CREATE TABLE `permintaan_barang` (
  `id_permintaan` int(11) NOT NULL,
  `id_departement` int(11) NOT NULL,
  `id_detail_permintaan` int(11) NOT NULL,
  `tgl_permintaan` date NOT NULL,
  `status_permintaan` varchar(255) NOT NULL DEFAULT 'Waiting',
  `view_permintaan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `permintaan_barang`
--

INSERT INTO `permintaan_barang` (`id_permintaan`, `id_departement`, `id_detail_permintaan`, `tgl_permintaan`, `status_permintaan`, `view_permintaan`) VALUES
(1, 12, 1, '2024-04-05', 'Selesai', 0),
(2, 12, 2, '2024-05-23', 'Selesai', 0),
(3, 12, 3, '2024-06-03', 'Selesai', 0),
(4, 12, 4, '2024-06-18', 'Selesai', 0),
(6, 12, 6, '2024-06-18', 'Selesai', 0),
(7, 12, 7, '2024-06-18', 'Selesai', 0),
(8, 12, 8, '2024-06-18', 'Selesai', 0),
(9, 12, 9, '2024-07-05', 'Proses', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id_po` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_po` date NOT NULL,
  `id_detail_po` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `purchase_order`
--

INSERT INTO `purchase_order` (`id_po`, `id_user`, `tgl_po`, `id_detail_po`) VALUES
(1, 1, '2024-06-01', 1),
(2, 1, '2024-06-12', 2),
(3, 1, '2024-06-13', 3),
(4, 1, '2024-06-28', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_barang`
--

CREATE TABLE `stok_barang` (
  `id_stok_barang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty_stok` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `stok_barang`
--

INSERT INTO `stok_barang` (`id_stok_barang`, `id_barang`, `qty_stok`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-07-14', '2024-07-05'),
(2, 2, 5, '2022-07-14', '2024-06-03'),
(3, 3, 2, '2022-07-15', '2024-06-13'),
(4, 5, 0, '2024-06-18', '2024-06-18'),
(5, 4, 1, '2024-06-18', '2024-06-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp_supplier` varchar(255) NOT NULL,
  `email_supplier` varchar(255) NOT NULL,
  `nama_pic_supplier` varchar(255) NOT NULL,
  `no_telp_pic_supplier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat`, `no_telp_supplier`, `email_supplier`, `nama_pic_supplier`, `no_telp_pic_supplier`) VALUES
(2, 'PT Sukamaju', 'Jl. Jawa. No. 16', '(+62) 8123-4567-890', 'sukamajuterus@gmail.com', 'budiman', '(+62) 8123-4567-890');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id_departement` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `jk` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `id_departement`, `nama_user`, `jk`, `no_telp`, `email`, `password`, `role`, `foto`, `is_active`) VALUES
(1, 12, 'admin', 'Pria', '(+62) 8123-4567-890', 'admin@gmail.com', '$2y$10$BsvefUJ4.8h4Qz.05q.rh.CuW65.lU8QekX4/jcerl6JoEDr.TAWG', 'Inventory', '1.png', 1),
(2, 12, 'Produksi', 'Pria', '(+62) 8123-4567-890', 'produksi@gmail.com', '$2y$10$7OePqDDftnjeiG926AW5vumzNRTv.6uFM7kvZYeHCzYuT0cOc1FBu', 'Produksi', 'icon_survey_(4).png', 1),
(4, 13, 'Manager', 'Pria', '(+62) 8123-4567-890', 'manager@gmail.com', '$2y$10$sNcPWyXM0jFSOgOvSqev3.lSfh2BrukMTcFBPTgCRNv5jTSeqaLg2', 'Manager', 'icon_survey_(3).png', 1),
(7, 16, 'test', 'Pria', '(+62) 8123-4567-890', 'test@gmail.com', '$2y$10$e12bAc5.F56.hph7RruPN.FaSDpAIxEEFuzct.Fjcp99OAF81NM8W', 'Inventory', 'default.png', 1),
(10, 15, 'qwerty', 'Pria', '(+62) 8123-4567-890', 'qwerty@gmail.com', '$2y$10$9a7b78YWmpUO1yS3Q2CeMOuWvemjp4Q13q52ykg5alI/f9NrICqB.', 'Inventory', 'default.png', 1),
(12, 16, 'riky', 'Pria', '(+62) 8123-4567-890', 'riky@gmail.com', '$2y$10$Vm5Y7K2fwi1a10jzSn1KB.NcUJxXcIMLCbvfpEjkzli2/5BsRO2v2', 'Manager', 'default.png', 1),
(17, 16, 'bayyy', 'Pria', '(+62) 8123-4567-890', 'bayyy@gmail.com', '$2y$10$6QbvEQ08K/b5xjkGnzQJ..QWwfLC.aV5KAB11bU1Sl/41haibLuau', 'Inventory', 'default.png', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`);

--
-- Indeks untuk tabel `batch_number`
--
ALTER TABLE `batch_number`
  ADD PRIMARY KEY (`id_batch_number`);

--
-- Indeks untuk tabel `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id_departement`);

--
-- Indeks untuk tabel `detail_permintaan`
--
ALTER TABLE `detail_permintaan`
  ADD PRIMARY KEY (`id_detail_permintaan`);

--
-- Indeks untuk tabel `detail_po`
--
ALTER TABLE `detail_po`
  ADD PRIMARY KEY (`id_detail_po`);

--
-- Indeks untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `permintaan_barang`
--
ALTER TABLE `permintaan_barang`
  ADD PRIMARY KEY (`id_permintaan`);

--
-- Indeks untuk tabel `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id_po`);

--
-- Indeks untuk tabel `stok_barang`
--
ALTER TABLE `stok_barang`
  ADD PRIMARY KEY (`id_stok_barang`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id_barang_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `batch_number`
--
ALTER TABLE `batch_number`
  MODIFY `id_batch_number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `departement`
--
ALTER TABLE `departement`
  MODIFY `id_departement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `detail_permintaan`
--
ALTER TABLE `detail_permintaan`
  MODIFY `id_detail_permintaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `detail_po`
--
ALTER TABLE `detail_po`
  MODIFY `id_detail_po` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `permintaan_barang`
--
ALTER TABLE `permintaan_barang`
  MODIFY `id_permintaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id_po` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `stok_barang`
--
ALTER TABLE `stok_barang`
  MODIFY `id_stok_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
