-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Nov 2019 pada 12.30
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sewa_kost`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamarkost`
--

CREATE TABLE `kamarkost` (
  `kode_kamar` varchar(5) NOT NULL,
  `lantai_ke` int(5) DEFAULT NULL,
  `harga` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kamarkost`
--

INSERT INTO `kamarkost` (`kode_kamar`, `lantai_ke`, `harga`) VALUES
('101', 2, '375000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemilik`
--

CREATE TABLE `pemilik` (
  `id_pemilik` varchar(5) NOT NULL,
  `nama_pemilik` varchar(30) DEFAULT NULL,
  `jk` varchar(10) DEFAULT NULL,
  `no_hp` varchar(12) DEFAULT NULL,
  `alamat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewa`
--

CREATE TABLE `penyewa` (
  `id_penyewa` varchar(5) NOT NULL,
  `nama_penyewa` varchar(30) DEFAULT NULL,
  `jk` varchar(10) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `pekerjaan` varchar(20) DEFAULT NULL,
  `umur` varchar(10) DEFAULT NULL,
  `no_hp` char(15) DEFAULT NULL,
  `alamat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `nama_penyewa`, `jk`, `status`, `pekerjaan`, `umur`, `no_hp`, `alamat`) VALUES
('1', '1', '1', '1', '1', '1', '1', '1'),
('5', 'wiwik', 'pr', 'mahasiswa', 'pelajar', '19', '182345', 'malang'),
('null', 'null', 'null', 'null', 'null', 'null', 'null', 'null');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `kode_transaksi` varchar(5) NOT NULL,
  `tgl_sewa` varchar(15) DEFAULT NULL,
  `tgl_bayar` varchar(15) DEFAULT NULL,
  `harga` varchar(20) DEFAULT NULL,
  `id_pemilik` varchar(5) DEFAULT NULL,
  `id_penyewa` varchar(5) DEFAULT NULL,
  `kode_kamar` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kamarkost`
--
ALTER TABLE `kamarkost`
  ADD PRIMARY KEY (`kode_kamar`);

--
-- Indeks untuk tabel `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`id_pemilik`);

--
-- Indeks untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id_penyewa`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `id_pemilik` (`id_pemilik`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `kode_kamar` (`kode_kamar`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pemilik`) REFERENCES `pemilik` (`id_pemilik`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewa` (`id_penyewa`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`kode_kamar`) REFERENCES `kamarkost` (`kode_kamar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
