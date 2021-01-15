-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Sty 2021, 16:54
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `smartparking`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `clients`
--

CREATE TABLE `clients` (
  `ID_client` int(11) NOT NULL,
  `ID_parking` int(11) DEFAULT NULL,
  `ID_spot` int(11) DEFAULT NULL,
  `Name` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Surname` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Nick` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Password` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Email` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Phone` varchar(9) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `clients`
--

INSERT INTO `clients` (`ID_client`, `ID_parking`, `ID_spot`, `Name`, `Surname`, `Nick`, `Password`, `Email`, `Phone`) VALUES
(1, NULL, NULL, 'Tomek', 'Jeden', 'Tomek1', '$2y$10$V86w.ENVB2QzQrddY5.pj.yPNc4pfMy9GZiTYsVL9yMAc.42qsPwq', 'tomek1@gmail.com', '123456789');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `parking`
--

CREATE TABLE `parking` (
  `ID_data` int(11) NOT NULL,
  `ID_parking` int(11) NOT NULL,
  `Temperature` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  `Gas_level` varchar(3) COLLATE utf8_polish_ci NOT NULL,
  `Fire_hazard` tinyint(1) NOT NULL,
  `Reading_time` time NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `parking`
--

INSERT INTO `parking` (`ID_data`, `ID_parking`, `Temperature`, `Gas_level`, `Fire_hazard`, `Reading_time`) VALUES
(1, 1, '21.94', '0', 0, '16:28:56'),
(2, 1, '22.00', '0', 0, '16:28:57'),
(3, 1, '21.94', '0', 0, '16:28:58'),
(4, 1, '21.94', '0', 0, '16:29:00'),
(5, 1, '21.94', '0', 0, '16:29:01'),
(6, 1, '22.00', '0', 0, '16:29:05'),
(7, 1, '22.00', '0', 0, '16:29:05'),
(8, 1, '21.94', '0', 0, '16:29:05'),
(9, 1, '21.94', '0', 0, '16:29:06'),
(10, 1, '22.00', '0', 0, '16:29:08'),
(11, 1, '22.06', '0', 0, '16:29:09'),
(12, 1, '22.00', '0', 0, '16:29:10'),
(13, 1, '22.06', '0', 0, '16:29:12'),
(14, 1, '22.06', '0', 0, '16:29:13'),
(15, 1, '22.00', '0', 0, '16:29:14'),
(16, 1, '22.06', '0', 0, '16:29:16'),
(17, 1, '22.06', '0', 0, '16:29:17'),
(18, 1, '22.00', '0', 0, '16:29:18'),
(19, 1, '22.06', '0', 0, '16:29:19'),
(20, 1, '22.06', '0', 0, '16:29:21'),
(21, 1, '22.06', '0', 0, '16:29:22'),
(22, 1, '22.06', '0', 0, '16:29:24'),
(23, 1, '22.06', '0', 0, '16:29:25'),
(24, 1, '22.00', '0', 0, '16:29:26'),
(25, 1, '22.00', '0', 0, '16:34:33'),
(26, 1, '22.00', '0', 0, '16:34:33'),
(27, 1, '22.00', '0', 0, '16:34:33'),
(28, 1, '22.00', '0', 0, '16:34:34'),
(29, 1, '22.00', '0', 0, '16:34:36'),
(30, 1, '22.00', '0', 0, '16:34:37'),
(31, 1, '22.00', '0', 0, '16:34:38'),
(32, 1, '22.00', '0', 0, '16:34:39'),
(33, 1, '22.00', '0', 0, '16:34:41'),
(34, 1, '21.94', '0', 0, '16:34:42'),
(35, 1, '22.00', '0', 0, '16:34:43'),
(36, 1, '22.00', '0', 0, '16:34:45'),
(37, 1, '21.94', '0', 0, '16:34:46'),
(38, 1, '22.00', '0', 0, '16:34:47'),
(39, 1, '22.00', '0', 0, '16:34:48'),
(40, 1, '21.94', '0', 0, '16:34:50');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `parking_spots`
--

CREATE TABLE `parking_spots` (
  `ID_spot` int(11) NOT NULL,
  `ID_parking` int(11) NOT NULL,
  `State` enum('Free','Reserved','Occupied','') COLLATE utf8_polish_ci NOT NULL,
  `Reading_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `parking_spots`
--

INSERT INTO `parking_spots` (`ID_spot`, `ID_parking`, `State`, `Reading_time`) VALUES
(1, 1, 'Occupied', '2021-01-15 15:35:16'),
(2, 1, 'Reserved', '2021-01-15 15:35:16'),
(3, 1, 'Occupied', '2021-01-15 15:35:16'),
(4, 1, 'Occupied', '2021-01-15 15:35:16'),
(5, 1, 'Occupied', '2021-01-15 15:35:16');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rfid`
--

CREATE TABLE `rfid` (
  `ID_card` int(11) NOT NULL,
  `Tag` int(11) NOT NULL,
  `ID_Client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ID_client`);

--
-- Indeksy dla tabeli `parking`
--
ALTER TABLE `parking`
  ADD PRIMARY KEY (`ID_data`);

--
-- Indeksy dla tabeli `parking_spots`
--
ALTER TABLE `parking_spots`
  ADD PRIMARY KEY (`ID_spot`);

--
-- Indeksy dla tabeli `rfid`
--
ALTER TABLE `rfid`
  ADD PRIMARY KEY (`ID_card`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `clients`
--
ALTER TABLE `clients`
  MODIFY `ID_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `parking`
--
ALTER TABLE `parking`
  MODIFY `ID_data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
