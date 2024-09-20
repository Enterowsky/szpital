-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Wrz 20, 2024 at 01:48 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `szpital`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `choroba`
--

CREATE TABLE `choroba` (
  `id_choroby` int(11) NOT NULL,
  `nazwa` varchar(100) NOT NULL,
  `nazwa_angielska` varchar(100) DEFAULT NULL,
  `czy_wywolana_bakteria` tinyint(1) DEFAULT 0,
  `czy_wywolana_wirusem` tinyint(1) DEFAULT 0,
  `smiertelnosc` enum('niska','srednia','wysoka') NOT NULL,
  `id_pacjenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `choroba`
--

INSERT INTO `choroba` (`id_choroby`, `nazwa`, `nazwa_angielska`, `czy_wywolana_bakteria`, `czy_wywolana_wirusem`, `smiertelnosc`, `id_pacjenta`) VALUES
(1, 'Grypa', 'Influenza', 0, 1, 'niska', NULL),
(2, 'Gru?lica', 'Tuberculosis', 1, 0, 'srednia', NULL),
(3, 'Cholera', 'Cholera', 1, 0, 'wysoka', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekarz`
--

CREATE TABLE `lekarz` (
  `id_lekarza` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `adres` varchar(100) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `pesel` varchar(11) NOT NULL,
  `placa_podstawowa` decimal(10,2) NOT NULL,
  `specjalnosc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lekarz`
--

INSERT INTO `lekarz` (`id_lekarza`, `imie`, `nazwisko`, `adres`, `telefon`, `pesel`, `placa_podstawowa`, `specjalnosc`) VALUES
(1, 'Katarzyna', 'Mazur', 'ul. Szpitalna 4, Pozna?', '111222333', '69081234567', 12000.00, 'Kardiolog'),
(2, 'Tomasz', 'Wi?niewski', 'ul. Lekarska 8, Wroc?aw', '222333444', '74091023456', 15000.00, 'Chirurg'),
(3, 'Ewa', 'Jankowska', 'ul. Doktorska 6, ??d?', '333444555', '80030234567', 13000.00, 'Pediatra');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `operacja`
--

CREATE TABLE `operacja` (
  `id_operacji` int(11) NOT NULL,
  `opis` text NOT NULL,
  `data_operacji` date NOT NULL,
  `id_lekarza` int(11) DEFAULT NULL,
  `id_pacjenta` int(11) DEFAULT NULL,
  `id_pielegniarki` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operacja`
--

INSERT INTO `operacja` (`id_operacji`, `opis`, `data_operacji`, `id_lekarza`, `id_pacjenta`, `id_pielegniarki`) VALUES
(1, 'Usuni?cie wyrostka robaczkowego', '2024-07-15', 2, 1, 1),
(2, 'Operacja serca', '2024-08-02', 1, 3, 3),
(3, 'Zabieg ortopedyczny', '2024-09-10', 2, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pacjent`
--

CREATE TABLE `pacjent` (
  `id_pacjenta` int(11) NOT NULL,
  `imie` varchar(30) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  `adres` varchar(50) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `PESEL` varchar(11) NOT NULL,
  `id_choroby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pacjent`
--

INSERT INTO `pacjent` (`id_pacjenta`, `imie`, `nazwisko`, `adres`, `telefon`, `PESEL`, `id_choroby`) VALUES
(1, 'Jan', 'Kowalski', 'ul. Weso?a 10, Warszawa', '123456789', '85010112345', NULL),
(2, 'Anna', 'Nowak', 'ul. S?oneczna 5, Krak?w', '987654321', '90050598765', NULL),
(3, 'Piotr', 'Zieli?ski', 'ul. G?rska 12, Gda?sk', '555666777', '72031487653', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pielegniarka`
--

CREATE TABLE `pielegniarka` (
  `id_pielegniarki` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `adres` varchar(100) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `pesel` varchar(11) NOT NULL,
  `placa_podstawowa` decimal(10,2) NOT NULL,
  `dzial` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pielegniarka`
--

INSERT INTO `pielegniarka` (`id_pielegniarki`, `imie`, `nazwisko`, `adres`, `telefon`, `pesel`, `placa_podstawowa`, `dzial`) VALUES
(1, 'Magdalena', 'Kowalczyk', 'ul. Opieku?cza 9, Lublin', '444555666', '86052123456', 6000.00, 'Chirurgia'),
(2, 'Marcin', 'D?browski', 'ul. Medyczna 3, Katowice', '555666777', '92071898765', 6500.00, 'Pediatria'),
(3, 'Barbara', 'Nowicka', 'ul. Zdrowa 2, Bia?ystok', '666777888', '78120987654', 6200.00, 'Kardiologia');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `choroba`
--
ALTER TABLE `choroba`
  ADD PRIMARY KEY (`id_choroby`),
  ADD KEY `fk_choroba_pacjent` (`id_pacjenta`);

--
-- Indeksy dla tabeli `lekarz`
--
ALTER TABLE `lekarz`
  ADD PRIMARY KEY (`id_lekarza`),
  ADD UNIQUE KEY `pesel` (`pesel`);

--
-- Indeksy dla tabeli `operacja`
--
ALTER TABLE `operacja`
  ADD PRIMARY KEY (`id_operacji`),
  ADD KEY `id_lekarza` (`id_lekarza`),
  ADD KEY `id_pacjenta` (`id_pacjenta`),
  ADD KEY `id_pielegniarki` (`id_pielegniarki`);

--
-- Indeksy dla tabeli `pacjent`
--
ALTER TABLE `pacjent`
  ADD PRIMARY KEY (`id_pacjenta`),
  ADD UNIQUE KEY `PESEL` (`PESEL`),
  ADD KEY `fk_pacjent_choroba` (`id_choroby`);

--
-- Indeksy dla tabeli `pielegniarka`
--
ALTER TABLE `pielegniarka`
  ADD PRIMARY KEY (`id_pielegniarki`),
  ADD UNIQUE KEY `pesel` (`pesel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `choroba`
--
ALTER TABLE `choroba`
  MODIFY `id_choroby` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lekarz`
--
ALTER TABLE `lekarz`
  MODIFY `id_lekarza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `operacja`
--
ALTER TABLE `operacja`
  MODIFY `id_operacji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pacjent`
--
ALTER TABLE `pacjent`
  MODIFY `id_pacjenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pielegniarka`
--
ALTER TABLE `pielegniarka`
  MODIFY `id_pielegniarki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `choroba`
--
ALTER TABLE `choroba`
  ADD CONSTRAINT `fk_choroba_pacjent` FOREIGN KEY (`id_pacjenta`) REFERENCES `pacjent` (`id_pacjenta`);

--
-- Constraints for table `operacja`
--
ALTER TABLE `operacja`
  ADD CONSTRAINT `operacja_ibfk_1` FOREIGN KEY (`id_lekarza`) REFERENCES `lekarz` (`id_lekarza`),
  ADD CONSTRAINT `operacja_ibfk_2` FOREIGN KEY (`id_pacjenta`) REFERENCES `pacjent` (`id_pacjenta`),
  ADD CONSTRAINT `operacja_ibfk_3` FOREIGN KEY (`id_pielegniarki`) REFERENCES `pielegniarka` (`id_pielegniarki`);

--
-- Constraints for table `pacjent`
--
ALTER TABLE `pacjent`
  ADD CONSTRAINT `fk_pacjent_choroba` FOREIGN KEY (`id_choroby`) REFERENCES `choroba` (`id_choroby`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
