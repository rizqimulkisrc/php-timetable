-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Nov 2021 pada 07.36
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upwork`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `timetable`
--

CREATE TABLE `timetable` (
  `timetable_id` varchar(100) NOT NULL,
  `timesheet` text NOT NULL,
  `is_limitation_access` enum('n','y') NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `timetable`
--

INSERT INTO `timetable` (`timetable_id`, `timesheet`, `is_limitation_access`) VALUES
('A', '[]', 'n'),
('B', '[{\"dayname\":\"monday\",\"start_time\":\"08:00\",\"end_time\":\"18:00\"},{\"dayname\":\"tuesday\",\"start_time\":\"08:00\",\"end_time\":\"18:00\"},{\"dayname\":\"wednesday\",\"start_time\":\"08:00\",\"end_time\":\"18:00\"},{\"dayname\":\"thursday\",\"start_time\":\"08:00\",\"end_time\":\"18:00\"},{\"dayname\":\"friday\",\"start_time\":\"08:00\",\"end_time\":\"18:00\"}]', 'y');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `timetable`
--
ALTER TABLE `timetable`
  ADD UNIQUE KEY `timetable_id` (`timetable_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
