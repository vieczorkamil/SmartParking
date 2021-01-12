-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Sty 2021, 19:20
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
  `ID_parking` int(11) NOT NULL,
  `ID_spot` int(11) NOT NULL,
  `Name` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Surname` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Nick` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Password` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Email` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `Phone` varchar(9) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

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
  `Time` time NOT NULL DEFAULT current_timestamp(),
  `Date` int(11) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `parking`
--

INSERT INTO `parking` (`ID_data`, `ID_parking`, `Temperature`, `Gas_level`, `Fire_hazard`, `Time`, `Date`) VALUES
(1, 1, '18.3', '180', 0, '12:00:00', 2147483647),
(2, 1, '18.1', '180', 0, '12:05:00', 2147483647),
(3, 1, '18.3', '180', 0, '12:10:00', 2147483647),
(4, 1, '18.2', '180', 0, '12:15:00', 2147483647),
(5, 1, '18.3', '180', 0, '12:20:00', 2147483647),
(6, 1, '18.5', '180', 0, '12:25:00', 2147483647),
(7, 1, '18.7', '180', 0, '12:30:00', 2147483647),
(8, 1, '18.7', '180', 0, '12:35:00', 2147483647),
(9, 1, '18.9', '180', 0, '12:40:00', 2147483647),
(10, 1, '18.8', '180', 0, '12:45:00', 2147483647),
(11, 1, '19.1', '180', 0, '12:50:00', 2147483647),
(12, 1, '19.2', '180', 0, '12:55:00', 2147483647),
(13, 1, '20.2', '180', 0, '13:00:00', 2147483647),
(14, 1, '22.1', '180', 0, '13:05:00', 2147483647);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `parking_spots`
--

CREATE TABLE `parking_spots` (
  `ID_spot` int(11) NOT NULL,
  `ID_parking` int(11) NOT NULL,
  `State` enum('Free','Reserved','Occupied','') COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `parking_spots`
--

INSERT INTO `parking_spots` (`ID_spot`, `ID_parking`, `State`) VALUES
(1, 1, 'Reserved'),
(2, 1, 'Occupied'),
(3, 1, 'Free'),
(4, 1, 'Free'),
(5, 1, 'Occupied');

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
  MODIFY `ID_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `parking`
--
ALTER TABLE `parking`
  MODIFY `ID_data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
