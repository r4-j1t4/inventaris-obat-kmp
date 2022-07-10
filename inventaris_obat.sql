-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2022 pada 13.32
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris_obat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `xx_kategori`
--

CREATE TABLE `xx_kategori` (
  `id_kategori` int(11) NOT NULL,
  `kode_kategori` varchar(50) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `xx_kategori`
--

INSERT INTO `xx_kategori` (`id_kategori`, `kode_kategori`, `nama_kategori`, `created_at`) VALUES
(5, 'Obat Resep', 'Kortikosteroid', '2022-07-10 01:07:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `xx_laporan`
--

CREATE TABLE `xx_laporan` (
  `id_laporan` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `no_invoice` varchar(50) NOT NULL,
  `operator` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `pendapatan` bigint(20) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1. keluar 2. masuk\r\n',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `xx_laporan`
--

INSERT INTO `xx_laporan` (`id_laporan`, `id_obat`, `no_invoice`, `operator`, `jumlah`, `pendapatan`, `status`, `created_at`) VALUES
(9, 5, '1Dex10tblt', 'Apoteker', 10, 25000, 2, '2022-07-10 01:07:30'),
(10, 5, '1Dex10tblt', 'Kasir', 5, 15000, 1, '2022-07-10 01:07:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `xx_obat`
--

CREATE TABLE `xx_obat` (
  `id_obat` int(11) NOT NULL,
  `kode_obat` varchar(50) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `harga_beli` bigint(20) NOT NULL,
  `harga_jual` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `xx_obat`
--

INSERT INTO `xx_obat` (`id_obat`, `kode_obat`, `id_satuan`, `id_kategori`, `nama_obat`, `stok`, `harga_beli`, `harga_jual`, `created_at`) VALUES
(5, 'Dex', 7, 5, 'Dexamethasone', 5, 2500, 3000, '2022-07-10 01:07:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `xx_satuan`
--

CREATE TABLE `xx_satuan` (
  `id_satuan` int(11) NOT NULL,
  `kode_satuan` varchar(50) NOT NULL,
  `nama_satuan` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `xx_satuan`
--

INSERT INTO `xx_satuan` (`id_satuan`, `kode_satuan`, `nama_satuan`, `created_at`) VALUES
(7, 'tblt', 'Tablet', '2022-07-10 01:07:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `xx_users`
--

CREATE TABLE `xx_users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1 COMMENT '1. active, 2. tidak aktif',
  `status` int(11) NOT NULL COMMENT '1. pegawai, 2. apoteker, 3.gudang',
  `created_by` varchar(50) NOT NULL DEFAULT 'master',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `xx_users`
--

INSERT INTO `xx_users` (`id_user`, `username`, `password`, `nama`, `is_active`, `status`, `created_by`, `created_at`) VALUES
(1, 'apoteker', '$2y$10$nrkBu349UQRD04U/iKYg..R4ct/y9BsRWGrSDto3WlPlzZwfhF8Pa', 'Apoteker', 1, 2, 'Apoteker', '2022-07-10 00:00:00'),
(5, 'kasir', '$2y$10$WDolm9GJyY1XkVkGQCCGIuQ7WIE7YLn4Qk0IsYZAXGp3FsSirFRm.', 'Kasir', 1, 1, 'Apoteker', '2022-07-10 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `xx_kategori`
--
ALTER TABLE `xx_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `xx_laporan`
--
ALTER TABLE `xx_laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indeks untuk tabel `xx_obat`
--
ALTER TABLE `xx_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `xx_satuan`
--
ALTER TABLE `xx_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indeks untuk tabel `xx_users`
--
ALTER TABLE `xx_users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `xx_kategori`
--
ALTER TABLE `xx_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `xx_laporan`
--
ALTER TABLE `xx_laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `xx_obat`
--
ALTER TABLE `xx_obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `xx_satuan`
--
ALTER TABLE `xx_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `xx_users`
--
ALTER TABLE `xx_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
