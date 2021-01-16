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
(1, 1, '21.94', '0', 0, '00:00:00'),
(2, 1, '21.94', '0', 0, '00:00:00'),
(3, 1, '21.94', '0', 0, '00:00:00'),
(4, 1, '21.94', '0', 0, '00:00:00'),
(5, 1, '21.94', '0', 0, '00:00:00'),
(6, 1, '21.94', '0', 0, '00:00:00'),
(7, 1, '21.94', '0', 0, '00:00:00'),
(8, 1, '21.94', '0', 0, '00:00:00'),
(9, 1, '21.94', '0', 0, '00:00:00'),
(10, 1, '21.94', '0', 0, '00:00:00'),
(11, 1, '21.94', '0', 0, '00:00:00'),
(12, 1, '21.94', '0', 0, '00:00:00'),
(13, 1, '21.94', '0', 0, '00:00:00'),
(14, 1, '21.94', '0', 0, '00:00:00'),
(15, 1, '21.94', '0', 0, '00:00:00'),
(16, 1, '21.94', '0', 0, '00:00:00'),
(17, 1, '21.94', '0', 0, '00:00:00'),
(18, 1, '21.94', '0', 0, '00:00:00'),
(19, 1, '21.94', '0', 0, '00:00:00'),
(20, 1, '21.94', '0', 0, '00:00:00'),
(21, 1, '21.94', '0', 0, '00:00:00'),
(22, 1, '21.94', '0', 0, '00:00:00'),
(23, 1, '21.94', '0', 0, '00:00:00'),
(24, 1, '21.94', '0', 0, '00:00:00'),
(25, 1, '21.94', '0', 0, '00:00:00'),
(26, 1, '21.94', '0', 0, '00:00:00'),
(27, 1, '21.94', '0', 0, '00:00:00'),
(28, 1, '21.94', '0', 0, '00:00:00'),
(29, 1, '21.94', '0', 0, '00:00:00'),
(30, 1, '21.94', '0', 0, '00:00:00'),
(31, 1, '21.94', '0', 0, '00:00:00'),
(32, 1, '21.94', '0', 0, '00:00:00'),
(33, 1, '21.94', '0', 0, '00:00:00'),
(34, 1, '21.94', '0', 0, '00:00:00'),
(35, 1, '21.94', '0', 0, '00:00:00'),
(36, 1, '21.94', '0', 0, '00:00:00'),
(37, 1, '21.94', '0', 0, '00:00:00'),
(38, 1, '21.94', '0', 0, '00:00:00'),
(39, 1, '21.94', '0', 0, '00:00:00'),
(40, 1, '21.94', '0', 0, '00:00:00'),
(41, 1, '21.94', '0', 0, '00:00:00'),
(42, 1, '21.94', '0', 0, '00:00:00'),
(43, 1, '21.94', '0', 0, '00:00:00'),
(44, 1, '21.94', '0', 0, '00:00:00'),
(45, 1, '21.94', '0', 0, '00:00:00'),
(46, 1, '21.94', '0', 0, '00:00:00'),
(47, 1, '21.94', '0', 0, '00:00:00'),
(48, 1, '21.94', '0', 0, '00:00:00'),
(49, 1, '21.94', '0', 0, '00:00:00'),
(50, 1, '21.94', '0', 0, '00:00:00'),
(51, 1, '21.94', '0', 0, '00:00:00'),
(52, 1, '21.94', '0', 0, '00:00:00'),
(53, 1, '21.94', '0', 0, '00:00:00'),
(54, 1, '21.94', '0', 0, '00:00:00'),
(55, 1, '21.94', '0', 0, '00:00:00'),
(56, 1, '21.94', '0', 0, '00:00:00'),
(57, 1, '21.94', '0', 0, '00:00:00'),
(58, 1, '21.94', '0', 0, '00:00:00'),
(59, 1, '21.94', '0', 0, '00:00:00'),
(60, 1, '21.94', '0', 0, '00:00:00'),
(61, 1, '21.94', '0', 0, '00:00:00'),
(62, 1, '21.94', '0', 0, '00:00:00'),
(63, 1, '21.94', '0', 0, '00:00:00'),
(64, 1, '21.94', '0', 0, '00:00:00'),
(65, 1, '21.94', '0', 0, '00:00:00'),
(66, 1, '21.94', '0', 0, '00:00:00'),
(67, 1, '21.94', '0', 0, '00:00:00'),
(68, 1, '21.94', '0', 0, '00:00:00'),
(69, 1, '21.94', '0', 0, '00:00:00'),
(70, 1, '21.94', '0', 0, '00:00:00'),
(71, 1, '21.94', '0', 0, '00:00:00'),
(72, 1, '21.94', '0', 0, '00:00:00'),
(73, 1, '21.94', '0', 0, '00:00:00'),
(74, 1, '21.94', '0', 0, '00:00:00'),
(75, 1, '21.94', '0', 0, '00:00:00'),
(76, 1, '21.94', '0', 0, '00:00:00'),
(77, 1, '21.94', '0', 0, '00:00:00'),
(78, 1, '21.94', '0', 0, '00:00:00'),
(79, 1, '21.94', '0', 0, '00:00:00'),
(80, 1, '21.94', '0', 0, '00:00:00'),
(81, 1, '21.94', '0', 0, '00:00:00'),
(82, 1, '21.94', '0', 0, '00:00:00'),
(83, 1, '21.94', '0', 0, '00:00:00'),
(84, 1, '21.94', '0', 0, '00:00:00'),
(85, 1, '21.94', '0', 0, '00:00:00'),
(86, 1, '21.94', '0', 0, '00:00:00'),
(87, 1, '21.94', '0', 0, '00:00:00'),
(88, 1, '21.94', '0', 0, '00:00:00'),
(89, 1, '21.94', '0', 0, '00:00:00'),
(90, 1, '21.94', '0', 0, '00:00:00'),
(91, 1, '21.94', '0', 0, '00:00:00'),
(92, 1, '21.94', '0', 0, '00:00:00'),
(93, 1, '21.94', '0', 0, '00:00:00'),
(94, 1, '21.94', '0', 0, '00:00:00'),
(95, 1, '21.94', '0', 0, '00:00:00'),
(96, 1, '21.94', '0', 0, '00:00:00'),
(97, 1, '21.94', '0', 0, '00:00:00'),
(98, 1, '21.94', '0', 0, '00:00:00'),
(99, 1, '21.94', '0', 0, '00:00:00'),
(100, 1, '21.94', '0', 0, '00:00:00'),
(101, 1, '21.94', '0', 0, '00:00:00'),
(102, 1, '21.94', '0', 0, '00:00:00'),
(103, 1, '21.94', '0', 0, '00:00:00'),
(104, 1, '21.94', '0', 0, '00:00:00'),
(105, 1, '21.94', '0', 0, '00:00:00'),
(106, 1, '21.94', '0', 0, '00:00:00'),
(107, 1, '21.94', '0', 0, '00:00:00'),
(108, 1, '21.94', '0', 0, '00:00:00'),
(109, 1, '21.94', '0', 0, '00:00:00'),
(110, 1, '21.94', '0', 0, '00:00:00'),
(111, 1, '21.94', '0', 0, '00:00:00'),
(112, 1, '21.94', '0', 0, '00:00:00'),
(113, 1, '21.94', '0', 0, '00:00:00'),
(114, 1, '21.94', '0', 0, '00:00:00'),
(115, 1, '21.94', '0', 0, '00:00:00'),
(116, 1, '21.94', '0', 0, '00:00:00'),
(117, 1, '21.94', '0', 0, '00:00:00'),
(118, 1, '21.94', '0', 0, '00:00:00'),
(119, 1, '21.94', '0', 0, '00:00:00'),
(120, 1, '21.94', '0', 0, '00:00:00'),
(121, 1, '21.94', '0', 0, '00:00:00'),
(122, 1, '21.94', '0', 0, '00:00:00'),
(123, 1, '21.94', '0', 0, '00:00:00'),
(124, 1, '21.94', '0', 0, '00:00:00'),
(125, 1, '21.94', '0', 0, '00:00:00'),
(126, 1, '21.94', '0', 0, '00:00:00'),
(127, 1, '21.94', '0', 0, '00:00:00'),
(128, 1, '21.94', '0', 0, '00:00:00'),
(129, 1, '21.94', '0', 0, '00:00:00'),
(130, 1, '21.94', '0', 0, '00:00:00'),
(131, 1, '21.94', '0', 0, '00:00:00'),
(132, 1, '21.94', '0', 0, '00:00:00'),
(133, 1, '21.94', '0', 0, '00:00:00'),
(134, 1, '21.94', '0', 0, '00:00:00'),
(135, 1, '21.94', '0', 0, '00:00:00'),
(136, 1, '21.94', '0', 0, '00:00:00'),
(137, 1, '21.94', '0', 0, '00:00:00'),
(138, 1, '21.94', '0', 0, '00:00:00'),
(139, 1, '21.94', '0', 0, '00:00:00'),
(140, 1, '21.94', '0', 0, '00:00:00'),
(141, 1, '21.94', '0', 0, '00:00:00'),
(142, 1, '21.94', '0', 0, '00:00:00'),
(143, 1, '21.94', '0', 0, '00:00:00'),
(144, 1, '21.94', '0', 0, '00:00:00'),
(145, 1, '21.94', '0', 0, '00:00:00'),
(146, 1, '21.94', '0', 0, '00:00:00'),
(147, 1, '21.94', '0', 0, '00:00:00'),
(148, 1, '21.94', '0', 0, '00:00:00'),
(149, 1, '21.94', '0', 0, '00:00:00'),
(150, 1, '21.94', '0', 0, '00:00:00'),
(151, 1, '21.94', '0', 0, '00:00:00'),
(152, 1, '21.94', '0', 0, '00:00:00'),
(153, 1, '21.94', '0', 0, '00:00:00'),
(154, 1, '21.94', '0', 0, '00:00:00'),
(155, 1, '21.94', '0', 0, '00:00:00'),
(156, 1, '21.94', '0', 0, '00:00:00'),
(157, 1, '21.94', '0', 0, '00:00:00'),
(158, 1, '21.94', '0', 0, '00:00:00'),
(159, 1, '21.94', '0', 0, '00:00:00'),
(160, 1, '21.94', '0', 0, '00:00:00'),
(161, 1, '21.94', '0', 0, '00:00:00'),
(162, 1, '21.94', '0', 0, '00:00:00'),
(163, 1, '21.94', '0', 0, '00:00:00'),
(164, 1, '21.94', '0', 0, '00:00:00'),
(165, 1, '21.94', '0', 0, '00:00:00'),
(166, 1, '21.94', '0', 0, '00:00:00'),
(167, 1, '21.94', '0', 0, '00:00:00'),
(168, 1, '21.94', '0', 0, '00:00:00'),
(169, 1, '21.94', '0', 0, '00:00:00'),
(170, 1, '21.94', '0', 0, '00:00:00'),
(171, 1, '21.94', '0', 0, '00:00:00'),
(172, 1, '21.94', '0', 0, '00:00:00'),
(173, 1, '21.94', '0', 0, '00:00:00'),
(174, 1, '21.94', '0', 0, '00:00:00'),
(175, 1, '21.94', '0', 0, '00:00:00'),
(176, 1, '21.94', '0', 0, '00:00:00'),
(177, 1, '21.94', '0', 0, '00:00:00'),
(178, 1, '21.94', '0', 0, '00:00:00'),
(179, 1, '21.94', '0', 0, '00:00:00'),
(180, 1, '21.94', '0', 0, '00:00:00'),
(181, 1, '21.94', '0', 0, '00:00:00'),
(182, 1, '21.94', '0', 0, '00:00:00'),
(183, 1, '21.94', '0', 0, '00:00:00'),
(184, 1, '21.94', '0', 0, '00:00:00'),
(185, 1, '21.94', '0', 0, '00:00:00'),
(186, 1, '21.94', '0', 0, '00:00:00'),
(187, 1, '21.94', '0', 0, '00:00:00'),
(188, 1, '21.94', '0', 0, '00:00:00'),
(189, 1, '21.94', '0', 0, '00:00:00'),
(190, 1, '21.94', '0', 0, '00:00:00'),
(191, 1, '21.94', '0', 0, '00:00:00'),
(192, 1, '21.94', '0', 0, '00:00:00'),
(193, 1, '21.94', '0', 0, '00:00:00'),
(194, 1, '21.94', '0', 0, '00:00:00'),
(195, 1, '21.94', '0', 0, '00:00:00'),
(196, 1, '21.94', '0', 0, '00:00:00'),
(197, 1, '21.94', '0', 0, '00:00:00'),
(198, 1, '21.94', '0', 0, '00:00:00'),
(199, 1, '21.94', '0', 0, '00:00:00'),
(200, 1, '21.94', '0', 0, '00:00:00'),
(201, 1, '21.94', '0', 0, '00:00:00'),
(202, 1, '21.94', '0', 0, '00:00:00'),
(203, 1, '21.94', '0', 0, '00:00:00'),
(204, 1, '21.94', '0', 0, '00:00:00'),
(205, 1, '21.94', '0', 0, '00:00:00'),
(206, 1, '21.94', '0', 0, '00:00:00'),
(207, 1, '21.94', '0', 0, '00:00:00'),
(208, 1, '21.94', '0', 0, '00:00:00'),
(209, 1, '21.94', '0', 0, '00:00:00'),
(210, 1, '21.94', '0', 0, '00:00:00'),
(211, 1, '21.94', '0', 0, '00:00:00'),
(212, 1, '21.94', '0', 0, '00:00:00'),
(213, 1, '21.94', '0', 0, '00:00:00'),
(214, 1, '21.94', '0', 0, '00:00:00'),
(215, 1, '21.94', '0', 0, '00:00:00'),
(216, 1, '21.94', '0', 0, '00:00:00'),
(217, 1, '21.94', '0', 0, '00:00:00'),
(218, 1, '21.94', '0', 0, '00:00:00'),
(219, 1, '21.94', '0', 0, '00:00:00'),
(220, 1, '21.94', '0', 0, '00:00:00'),
(221, 1, '21.94', '0', 0, '00:00:00'),
(222, 1, '21.94', '0', 0, '00:00:00'),
(223, 1, '21.94', '0', 0, '00:00:00'),
(224, 1, '21.94', '0', 0, '00:00:00'),
(225, 1, '21.94', '0', 0, '00:00:00'),
(226, 1, '21.94', '0', 0, '00:00:00'),
(227, 1, '21.94', '0', 0, '00:00:00'),
(228, 1, '21.94', '0', 0, '00:00:00'),
(229, 1, '21.94', '0', 0, '00:00:00'),
(230, 1, '21.94', '0', 0, '00:00:00'),
(231, 1, '21.94', '0', 0, '00:00:00'),
(232, 1, '21.94', '0', 0, '00:00:00'),
(233, 1, '21.94', '0', 0, '00:00:00'),
(234, 1, '21.94', '0', 0, '00:00:00'),
(235, 1, '21.94', '0', 0, '00:00:00'),
(236, 1, '21.94', '0', 0, '00:00:00'),
(237, 1, '21.94', '0', 0, '00:00:00'),
(238, 1, '21.94', '0', 0, '00:00:00'),
(239, 1, '21.94', '0', 0, '00:00:00'),
(240, 1, '21.94', '0', 0, '00:00:00'),
(241, 1, '21.94', '0', 0, '00:00:00'),
(242, 1, '21.94', '0', 0, '00:00:00'),
(243, 1, '21.94', '0', 0, '00:00:00'),
(244, 1, '21.94', '0', 0, '00:00:00'),
(245, 1, '21.94', '0', 0, '00:00:00'),
(246, 1, '21.94', '0', 0, '00:00:00'),
(247, 1, '21.94', '0', 0, '00:00:00'),
(248, 1, '21.94', '0', 0, '00:00:00'),
(249, 1, '21.94', '0', 0, '00:00:00'),
(250, 1, '21.94', '0', 0, '00:00:00'),
(251, 1, '21.94', '0', 0, '00:00:00'),
(252, 1, '21.94', '0', 0, '00:00:00'),
(253, 1, '21.94', '0', 0, '00:00:00'),
(254, 1, '21.94', '0', 0, '00:00:00'),
(255, 1, '21.94', '0', 0, '00:00:00'),
(256, 1, '21.94', '0', 0, '00:00:00'),
(257, 1, '21.94', '0', 0, '00:00:00'),
(258, 1, '21.94', '0', 0, '00:00:00'),
(259, 1, '21.94', '0', 0, '00:00:00'),
(260, 1, '21.94', '0', 0, '00:00:00'),
(261, 1, '21.94', '0', 0, '00:00:00'),
(262, 1, '21.94', '0', 0, '00:00:00'),
(263, 1, '21.94', '0', 0, '00:00:00'),
(264, 1, '21.94', '0', 0, '00:00:00'),
(265, 1, '21.94', '0', 0, '00:00:00'),
(266, 1, '21.94', '0', 0, '00:00:00'),
(267, 1, '21.94', '0', 0, '00:00:00'),
(268, 1, '21.94', '0', 0, '00:00:00'),
(269, 1, '21.94', '0', 0, '00:00:00'),
(270, 1, '21.94', '0', 0, '00:00:00'),
(271, 1, '21.94', '0', 0, '00:00:00'),
(272, 1, '21.94', '0', 0, '00:00:00'),
(273, 1, '21.94', '0', 0, '00:00:00'),
(274, 1, '21.94', '0', 0, '00:00:00'),
(275, 1, '21.94', '0', 0, '00:00:00'),
(276, 1, '21.94', '0', 0, '00:00:00'),
(277, 1, '21.94', '0', 0, '00:00:00'),
(278, 1, '21.94', '0', 0, '00:00:00'),
(279, 1, '21.94', '0', 0, '00:00:00'),
(280, 1, '21.94', '0', 0, '00:00:00'),
(281, 1, '21.94', '0', 0, '00:00:00'),
(282, 1, '21.94', '0', 0, '00:00:00'),
(283, 1, '21.94', '0', 0, '00:00:00'),
(284, 1, '21.94', '0', 0, '00:00:00'),
(285, 1, '21.94', '0', 0, '00:00:00'),
(286, 1, '21.94', '0', 0, '00:00:00'),
(287, 1, '21.94', '0', 0, '00:00:00'),
(288, 1, '21.94', '0', 0, '00:00:00'),
(289, 1, '21.94', '0', 0, '00:00:00'),
(290, 1, '21.94', '0', 0, '00:00:00'),
(291, 1, '21.94', '0', 0, '00:00:00'),
(292, 1, '21.94', '0', 0, '00:00:00'),
(293, 1, '21.94', '0', 0, '00:00:00'),
(294, 1, '21.94', '0', 0, '00:00:00'),
(295, 1, '21.94', '0', 0, '00:00:00'),
(296, 1, '21.94', '0', 0, '00:00:00'),
(297, 1, '21.94', '0', 0, '00:00:00'),
(298, 1, '21.94', '0', 0, '00:00:00'),
(299, 1, '21.94', '0', 0, '00:00:00'),
(300, 1, '21.94', '0', 0, '00:00:00'),
(301, 1, '21.94', '0', 0, '00:00:00'),
(302, 1, '21.94', '0', 0, '00:00:00'),
(303, 1, '21.94', '0', 0, '00:00:00'),
(304, 1, '21.94', '0', 0, '00:00:00'),
(305, 1, '21.94', '0', 0, '00:00:00'),
(306, 1, '21.94', '0', 0, '00:00:00'),
(307, 1, '21.94', '0', 0, '00:00:00'),
(308, 1, '21.94', '0', 0, '00:00:00'),
(309, 1, '21.94', '0', 0, '00:00:00'),
(310, 1, '21.94', '0', 0, '00:00:00'),
(311, 1, '21.94', '0', 0, '00:00:00'),
(312, 1, '21.94', '0', 0, '00:00:00'),
(313, 1, '21.94', '0', 0, '00:00:00'),
(314, 1, '21.94', '0', 0, '00:00:00'),
(315, 1, '21.94', '0', 0, '00:00:00'),
(316, 1, '21.94', '0', 0, '00:00:00'),
(317, 1, '21.94', '0', 0, '00:00:00'),
(318, 1, '21.94', '0', 0, '00:00:00'),
(319, 1, '21.94', '0', 0, '00:00:00'),
(320, 1, '21.94', '0', 0, '00:00:00'),
(321, 1, '21.94', '0', 0, '00:00:00'),
(322, 1, '21.94', '0', 0, '00:00:00'),
(323, 1, '21.94', '0', 0, '00:00:00'),
(324, 1, '21.94', '0', 0, '00:00:00'),
(325, 1, '21.94', '0', 0, '00:00:00'),
(326, 1, '21.94', '0', 0, '00:00:00'),
(327, 1, '21.94', '0', 0, '00:00:00'),
(328, 1, '21.94', '0', 0, '00:00:00'),
(329, 1, '21.94', '0', 0, '00:00:00'),
(330, 1, '21.94', '0', 0, '00:00:00'),
(331, 1, '21.94', '0', 0, '00:00:00'),
(332, 1, '21.94', '0', 0, '00:00:00'),
(333, 1, '21.94', '0', 0, '00:00:00'),
(334, 1, '21.94', '0', 0, '00:00:00'),
(335, 1, '21.94', '0', 0, '00:00:00'),
(336, 1, '21.94', '0', 0, '00:00:00'),
(337, 1, '21.94', '0', 0, '00:00:00'),
(338, 1, '21.94', '0', 0, '00:00:00'),
(339, 1, '21.94', '0', 0, '00:00:00'),
(340, 1, '21.94', '0', 0, '00:00:00'),
(341, 1, '21.94', '0', 0, '00:00:00'),
(342, 1, '21.94', '0', 0, '00:00:00'),
(343, 1, '21.94', '0', 0, '00:00:00'),
(344, 1, '21.94', '0', 0, '00:00:00'),
(345, 1, '21.94', '0', 0, '00:00:00'),
(346, 1, '21.94', '0', 0, '00:00:00'),
(347, 1, '21.94', '0', 0, '00:00:00'),
(348, 1, '21.94', '0', 0, '00:00:00'),
(349, 1, '21.94', '0', 0, '00:00:00'),
(350, 1, '21.94', '0', 0, '00:00:00'),
(351, 1, '21.94', '0', 0, '00:00:00'),
(352, 1, '21.94', '0', 0, '00:00:00'),
(353, 1, '21.94', '0', 0, '00:00:00'),
(354, 1, '21.94', '0', 0, '00:00:00'),
(355, 1, '21.94', '0', 0, '00:00:00'),
(356, 1, '21.94', '0', 0, '00:00:00'),
(357, 1, '21.94', '0', 0, '00:00:00'),
(358, 1, '21.94', '0', 0, '00:00:00'),
(359, 1, '21.94', '0', 0, '00:00:00'),
(360, 1, '21.94', '0', 0, '00:00:00'),
(361, 1, '21.94', '0', 0, '00:00:00'),
(362, 1, '21.94', '0', 0, '00:00:00'),
(363, 1, '21.94', '0', 0, '00:00:00'),
(364, 1, '21.94', '0', 0, '00:00:00'),
(365, 1, '21.94', '0', 0, '00:00:00'),
(366, 1, '21.94', '0', 0, '00:00:00'),
(367, 1, '21.94', '0', 0, '00:00:00'),
(368, 1, '21.94', '0', 0, '00:00:00'),
(369, 1, '21.94', '0', 0, '00:00:00'),
(370, 1, '21.94', '0', 0, '00:00:00'),
(371, 1, '21.94', '0', 0, '00:00:00'),
(372, 1, '21.94', '0', 0, '00:00:00'),
(373, 1, '21.94', '0', 0, '00:00:00'),
(374, 1, '21.94', '0', 0, '00:00:00'),
(375, 1, '21.94', '0', 0, '00:00:00'),
(376, 1, '21.94', '0', 0, '00:00:00'),
(377, 1, '21.94', '0', 0, '00:00:00'),
(378, 1, '21.94', '0', 0, '00:00:00'),
(379, 1, '21.94', '0', 0, '00:00:00'),
(380, 1, '21.94', '0', 0, '00:00:00'),
(381, 1, '21.94', '0', 0, '00:00:00'),
(382, 1, '21.94', '0', 0, '00:00:00'),
(383, 1, '21.94', '0', 0, '00:00:00'),
(384, 1, '21.94', '0', 0, '00:00:00'),
(385, 1, '21.94', '0', 0, '00:00:00'),
(386, 1, '21.94', '0', 0, '00:00:00'),
(387, 1, '21.94', '0', 0, '00:00:00'),
(388, 1, '21.94', '0', 0, '00:00:00'),
(389, 1, '21.94', '0', 0, '00:00:00'),
(390, 1, '21.94', '0', 0, '00:00:00'),
(391, 1, '21.94', '0', 0, '00:00:00'),
(392, 1, '21.94', '0', 0, '00:00:00'),
(393, 1, '21.94', '0', 0, '00:00:00'),
(394, 1, '21.94', '0', 0, '00:00:00'),
(395, 1, '21.94', '0', 0, '00:00:00'),
(396, 1, '21.94', '0', 0, '00:00:00'),
(397, 1, '21.94', '0', 0, '00:00:00'),
(398, 1, '21.94', '0', 0, '00:00:00'),
(399, 1, '21.94', '0', 0, '00:00:00'),
(400, 1, '21.94', '0', 0, '00:00:00'),
(401, 1, '21.94', '0', 0, '00:00:00'),
(402, 1, '21.94', '0', 0, '00:00:00'),
(403, 1, '21.94', '0', 0, '00:00:00'),
(404, 1, '21.94', '0', 0, '00:00:00'),
(405, 1, '21.94', '0', 0, '00:00:00'),
(406, 1, '21.94', '0', 0, '00:00:00'),
(407, 1, '21.94', '0', 0, '00:00:00'),
(408, 1, '21.94', '0', 0, '00:00:00'),
(409, 1, '21.94', '0', 0, '00:00:00'),
(410, 1, '21.94', '0', 0, '00:00:00'),
(411, 1, '21.94', '0', 0, '00:00:00'),
(412, 1, '21.94', '0', 0, '00:00:00'),
(413, 1, '21.94', '0', 0, '00:00:00'),
(414, 1, '21.94', '0', 0, '00:00:00'),
(415, 1, '21.94', '0', 0, '00:00:00'),
(416, 1, '21.94', '0', 0, '00:00:00'),
(417, 1, '21.94', '0', 0, '00:00:00'),
(418, 1, '21.94', '0', 0, '00:00:00'),
(419, 1, '21.94', '0', 0, '00:00:00'),
(420, 1, '21.94', '0', 0, '00:00:00'),
(421, 1, '21.94', '0', 0, '00:00:00'),
(422, 1, '21.94', '0', 0, '00:00:00'),
(423, 1, '21.94', '0', 0, '00:00:00'),
(424, 1, '21.94', '0', 0, '00:00:00'),
(425, 1, '21.94', '0', 0, '00:00:00'),
(426, 1, '21.94', '0', 0, '00:00:00'),
(427, 1, '21.94', '0', 0, '00:00:00'),
(428, 1, '21.94', '0', 0, '00:00:00'),
(429, 1, '21.94', '0', 0, '00:00:00'),
(430, 1, '21.94', '0', 0, '00:00:00'),
(431, 1, '21.94', '0', 0, '00:00:00'),
(432, 1, '21.94', '0', 0, '00:00:00'),
(433, 1, '21.94', '0', 0, '00:00:00'),
(434, 1, '21.94', '0', 0, '00:00:00'),
(435, 1, '21.94', '0', 0, '00:00:00'),
(436, 1, '21.94', '0', 0, '00:00:00'),
(437, 1, '21.94', '0', 0, '00:00:00'),
(438, 1, '21.94', '0', 0, '00:00:00'),
(439, 1, '21.94', '0', 0, '00:00:00'),
(440, 1, '21.94', '0', 0, '00:00:00'),
(441, 1, '21.94', '0', 0, '00:00:00'),
(442, 1, '21.94', '0', 0, '00:00:00'),
(443, 1, '21.94', '0', 0, '00:00:00'),
(444, 1, '21.94', '0', 0, '00:00:00'),
(445, 1, '21.94', '0', 0, '00:00:00'),
(446, 1, '21.94', '0', 0, '00:00:00'),
(447, 1, '21.94', '0', 0, '00:00:00'),
(448, 1, '21.94', '0', 0, '00:00:00'),
(449, 1, '21.94', '0', 0, '00:00:00'),
(450, 1, '21.94', '0', 0, '00:00:00'),
(451, 1, '21.94', '0', 0, '00:00:00'),
(452, 1, '21.94', '0', 0, '00:00:00'),
(453, 1, '21.94', '0', 0, '00:00:00'),
(454, 1, '21.94', '0', 0, '00:00:00'),
(455, 1, '21.94', '0', 0, '00:00:00'),
(456, 1, '21.94', '0', 0, '00:00:00'),
(457, 1, '21.94', '0', 0, '00:00:00'),
(458, 1, '21.94', '0', 0, '00:00:00'),
(459, 1, '21.94', '0', 0, '00:00:00'),
(460, 1, '21.94', '0', 0, '00:00:00'),
(461, 1, '21.94', '0', 0, '00:00:00'),
(462, 1, '21.94', '0', 0, '00:00:00'),
(463, 1, '21.94', '0', 0, '00:00:00'),
(464, 1, '21.94', '0', 0, '00:00:00'),
(465, 1, '21.94', '0', 0, '00:00:00'),
(466, 1, '21.94', '0', 0, '00:00:00'),
(467, 1, '21.94', '0', 0, '00:00:00'),
(468, 1, '21.94', '0', 0, '00:00:00'),
(469, 1, '21.94', '0', 0, '00:00:00'),
(470, 1, '21.94', '0', 0, '00:00:00'),
(471, 1, '21.94', '0', 0, '00:00:00'),
(472, 1, '21.94', '0', 0, '00:00:00'),
(473, 1, '21.94', '0', 0, '00:00:00'),
(474, 1, '21.94', '0', 0, '00:00:00'),
(475, 1, '21.94', '0', 0, '00:00:00'),
(476, 1, '21.94', '0', 0, '00:00:00'),
(477, 1, '21.94', '0', 0, '00:00:00'),
(478, 1, '21.94', '0', 0, '00:00:00'),
(479, 1, '21.94', '0', 0, '00:00:00'),
(480, 1, '21.94', '0', 0, '00:00:00'),
(481, 1, '21.94', '0', 0, '00:00:00'),
(482, 1, '21.94', '0', 0, '00:00:00'),
(483, 1, '21.94', '0', 0, '00:00:00'),
(484, 1, '21.94', '0', 0, '00:00:00'),
(485, 1, '21.94', '0', 0, '00:00:00'),
(486, 1, '21.94', '0', 0, '00:00:00'),
(487, 1, '21.94', '0', 0, '00:00:00'),
(488, 1, '21.94', '0', 0, '00:00:00'),
(489, 1, '21.94', '0', 0, '00:00:00'),
(490, 1, '21.94', '0', 0, '00:00:00'),
(491, 1, '21.94', '0', 0, '00:00:00'),
(492, 1, '21.94', '0', 0, '00:00:00'),
(493, 1, '21.94', '0', 0, '00:00:00'),
(494, 1, '21.94', '0', 0, '00:00:00'),
(495, 1, '21.94', '0', 0, '00:00:00'),
(496, 1, '21.94', '0', 0, '00:00:00'),
(497, 1, '21.94', '0', 0, '00:00:00'),
(498, 1, '21.94', '0', 0, '00:00:00'),
(499, 1, '21.94', '0', 0, '00:00:00'),
(500, 1, '21.94', '0', 0, '00:00:00');

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
(1, 1, 'Free', '2021-01-01 00:00:00'),
(2, 1, 'Free', '2021-01-01 00:00:00'),
(3, 1, 'Free', '2021-01-01 00:00:00'),
(4, 1, 'Free', '2021-01-01 00:00:00'),
(5, 1, 'Free', '2021-01-01 00:00:00');

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
