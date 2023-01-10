-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jan 2023 pada 08.32
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisata`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `objek_wisata`
--

CREATE TABLE `objek_wisata` (
  `id_objek_wisata` char(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `deskripsi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `objek_wisata`
--

INSERT INTO `objek_wisata` (`id_objek_wisata`, `nama`, `alamat`, `deskripsi`) VALUES
('W1', 'Pasar Terapung Lok Baintan', 'Jalan Sungai Martapura Jl. Sungai Tandipah, Sungai Tandipah, Kec. Sungai Tabuk, Kabupaten Banjar, Kalimantan Selatan 70653', 'Pasar Terapung Lok Baintan atau Pasar Terapung Sungai Martapura adalah sebuah pasar terapung tradisional yang berlokasi di desa Sungai Pinang, kecamatan Sungai Tabuk, Banjar. Secara umum, Pasar Terapung Lok Baintan tak beda dengan Pasar Terapung di muara Sungai Kuin/Sungai Barito. Keduanya sama-sama pasar tradisional di atas perahu atau dalam bahasa Banjar disebut jukung yang menjual beragam dagangan, seperti hasil produksi pertanian/perkebunan dan berlangsung tidak terlalu lama, paling lama sekitar tiga hingga empat jam. Pasar terapung ini sudah ada sejak zaman Kesultanan Banjar. Di sepanjang pesisir aliran Sungai Martapura, terlihat konvoi perahu menuju lokasi pasar terapung. Perahu ini milik pedagang dan petani dari berbagai anak Sungai Martapura, seperti Sungai Lenge, Sungai Bakung, Sungai Paku Alam, Sungai Saka Bunut, Sungai Madang, Sungai Tanifah, dan Sungai Lok Baintan, dimana mereka akan memasarkan hasil kebun mereka di sana. Untuk menuju pasar terapung Lok Baintan dari pusat kota bisa ditempuh dengan dua cara. Carapertama menyusuri sungai Martapura dengan menggunakan kelotok, sejenis sampan bermesin.'),
('W2', 'Pantai Angsana', 'jalan sawit KM.8 Bunati, Angsana, Kabupaten Tanah Bumbu, Banjarmasin Kalimantan selatan', 'Pantai Angsana adalah kawasan pantai yang bisa dibilang kaya akan pemandangan. Berada di wilayah perkebunan kelapa sawit membuat pemandangan tidak hanya berupa pasir dan air laut saja. Melainkan, ada sekawanan hutan yang bisa dilihat dan dinikmati.'),
('W3', 'Bukit Matang Kalada', 'Desa Tiwingan Lama, Kecamatan Aranio, Kabupaten Banjar, Provinsi Kalimantan Selatan', 'Matang Kaladan merupakan sebuah gunung yang secara teritorial terletak di Desa Tiwingan Lama, Kecamatan Aranio, Kabupaten Banjar, Provinsi Kalimantan Selatan, yang mulai dikenal dan ramai dikunjungi para pelancong sejak tahun 2015 lalu, setelah foto pemandangan yang sekilas mirip Raja Ampat ini viral di media sosial.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` char(11) NOT NULL,
  `kategori` enum('DEWASA','ANAK ANAK') NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `kategori`, `harga`) VALUES
('T01', 'ANAK ANAK', 8000),
('T02', 'DEWASA', 15000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` char(11) NOT NULL,
  `id_objek_wisata` char(11) NOT NULL,
  `id_tiket` char(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_objek_wisata`, `id_tiket`, `jumlah`, `total_harga`) VALUES
('T1', 'W1', 'T01', 2, 16000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `objek_wisata`
--
ALTER TABLE `objek_wisata`
  ADD PRIMARY KEY (`id_objek_wisata`);

--
-- Indeks untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_tiket` (`id_tiket`),
  ADD KEY `id_objek_wisata` (`id_objek_wisata`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
