-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Des 2022 pada 09.18
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cut_street`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_brg`
--

CREATE TABLE `tb_brg` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(5) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_brg`
--

INSERT INTO `tb_brg` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'Hoodie CS', 'jaket hoodie Original Cut Street', 'OUTERS', 1200000, 48, 'hoodie1.png'),
(3, 'Kaos Panjang CS', 'XL, Putih', 'TOPS', 540000, 199, 'kaos2.png'),
(4, 'Polo Pendek CS', 'XL', 'TOPS', 480000, 199, 'kaos3.png'),
(6, 'Hoodie CS White', 'Jaket Hoodie Original Cut STreet', 'OUTERS', 1200000, 200, 'hoodie21.png'),
(7, 'Celana CS Training Hitam', 'Celana training OR', 'BUTTOMS', 840000, 198, 'ct11.png'),
(9, 'Celena Pendek CS', 'Celana Ukuran 1/4 Warna Coklat', 'BUTTOMS', 300000, 199, 'cp11.png'),
(10, 'Kaos Pendek CS', 'XL, hitam', 'OUTERS', 480000, 200, 'kaos1hitam1.png'),
(11, 'Celana CS Training Cream', '', 'OUTERS', 0, 0, 'ct21.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(3, 'muhammad nur alfat', 'jonggol', '2022-12-19 04:21:30', '2022-12-20 04:21:30'),
(5, 'muhammad nur alfat', 'jambi, jateng', '2022-12-19 13:07:27', '2022-12-20 13:07:27'),
(6, 'Alfat', 'jambi, jateng', '2022-12-19 13:14:20', '2022-12-20 13:14:20'),
(7, 'Alfat', 'jambi, jateng', '2022-12-19 13:15:45', '2022-12-20 13:15:45'),
(8, 'Alfat', 'jambi, jateng', '2022-12-19 13:16:21', '2022-12-20 13:16:21'),
(9, 'alfat', 'jambi, jateng', '2022-12-19 14:47:11', '2022-12-20 14:47:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 2, 1, 'Hoodie CS', 2, 150000, ''),
(2, 3, 1, 'Hoodie CS', 1, 150000, ''),
(3, 3, 3, 'Kaos Panjang CS', 1, 45000, ''),
(4, 3, 4, 'Polo Pendek CS', 1, 40000, ''),
(5, 3, 6, 'Hoodie CS White', 1, 150000, ''),
(6, 4, 7, 'Celana CS Training Hitam', 1, 120000, ''),
(7, 5, 7, 'Celana CS Training Hitam', 1, 840000, ''),
(8, 5, 9, 'Celena Pendek CS', 1, 300000, ''),
(9, 6, 1, 'Hoodie CS', 1, 1200000, ''),
(10, 9, 1, 'Hoodie CS', 1, 1200000, ''),
(11, 9, 3, 'Kaos Panjang CS', 1, 540000, ''),
(12, 9, 4, 'Polo Pendek CS', 1, 480000, '');

--
-- Trigger `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` BEFORE INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_brg SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(8) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', '12345678', 1),
(2, 'muhammad nur alfat', 'alfat', '1234', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_brg`
--
ALTER TABLE `tb_brg`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_brg`
--
ALTER TABLE `tb_brg`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
