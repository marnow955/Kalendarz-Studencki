-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Maj 2017, 17:52
-- Wersja serwera: 10.1.19-MariaDB
-- Wersja PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `bhl`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `organizacje`
--

CREATE TABLE `organizacje` (
  `idorganizacji` int(11) NOT NULL,
  `nazwa` text COLLATE utf8_polish_ci NOT NULL,
  `zalozyciel` text COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `adres` text COLLATE utf8_polish_ci NOT NULL,
  `www` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `organizacje`
--

INSERT INTO `organizacje` (`idorganizacji`, `nazwa`, `zalozyciel`, `opis`, `adres`, `www`) VALUES
(1, 'Elektryczny', 'prof. Georgij Wulf', 'Wydział Politechniki Warszawskiej', 'Pl. Politechniki 1,\r\n00-661 Warszawa', 'http://www.ee.pw.edu.pl/'),
(4, 'KNI', 'Brak informacji', 'KNI - Koło Naukowe Informatyków przy wydziale MiNI Politechniki Warszawskiej', 'Koszykowa 75, 00-662 Warszawa', 'http://kni.mini.pw.edu.pl/wiki.php?file=index'),
(5, 'BEST', 'Magdalena Zwolińska', 'Stowarzyszenie studentów best', 'Pl. Politechniki 1, pok. 142\r\n00-661 Warszawa', 'http://new.best.warszawa.pl/');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przynaleznosc`
--

CREATE TABLE `przynaleznosc` (
  `idprzy` int(11) NOT NULL,
  `iduzytkownika` int(11) NOT NULL,
  `idorganizacji` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `przynaleznosc`
--

INSERT INTO `przynaleznosc` (`idprzy`, `iduzytkownika`, `idorganizacji`, `status`) VALUES
(1, 3, 1, 1),
(3, 5, 4, 0),
(4, 3, 4, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `iduzytkownika` int(11) NOT NULL,
  `imie` text COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8_polish_ci NOT NULL,
  `email` text COLLATE utf8_polish_ci NOT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`iduzytkownika`, `imie`, `nazwisko`, `email`, `haslo`) VALUES
(1, 'Jan', 'Nowak', 'jan.nowak@gmail.com', '$2a04$qItCp885lXglo/Misro73eqD..bx/wOGkexEVd0GxUF6dkseiwP/K'),
(3, 'Marcin', 'Kowalski', 'marcin.kowalski@gmail.com', '$2a$04$IFkyxX3hwkMA8iHSYL/vy.ptLY09/3kaDaHcieJJV29WdBxtwKLMm'),
(5, 'Anna', 'Marcinowska', 'anna.marcinowska@o2.pl', '$2a$04$OK1ACS./oRn6rkXgq6r5ueCMBgTvPrBP8jQcTFhNDtWaCURocHh7i');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydarzenia`
--

CREATE TABLE `wydarzenia` (
  `idwydarzenia` int(11) NOT NULL,
  `idorganizacji` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `data` date NOT NULL,
  `miejsce` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wydarzenia`
--

INSERT INTO `wydarzenia` (`idwydarzenia`, `idorganizacji`, `status`, `opis`, `data`, `miejsce`) VALUES
(1, 4, 1, 'Wydarzenie dotyczące czegos', '2017-05-26', 'Nowowiejska 15/19, 00-665 Warszawa'),
(3, 5, 0, 'BEST HACKING LEAGUE', '2017-05-27', 'Rektorska 4, 00-614 Warszawa'),
(5, 1, 0, 'Kolokwium z ASK2', '2017-06-08', 'pl. Politechniki 1\r\n00-661 Warszawa'),
(6, 1, 0, 'Kolokwium z ASK2', '2017-06-08', 'pl. Politechniki 1\r\n00-661 Warszawa');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `organizacje`
--
ALTER TABLE `organizacje`
  ADD PRIMARY KEY (`idorganizacji`);

--
-- Indexes for table `przynaleznosc`
--
ALTER TABLE `przynaleznosc`
  ADD PRIMARY KEY (`idprzy`);

--
-- Indexes for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`iduzytkownika`);

--
-- Indexes for table `wydarzenia`
--
ALTER TABLE `wydarzenia`
  ADD PRIMARY KEY (`idwydarzenia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `organizacje`
--
ALTER TABLE `organizacje`
  MODIFY `idorganizacji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT dla tabeli `przynaleznosc`
--
ALTER TABLE `przynaleznosc`
  MODIFY `idprzy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `iduzytkownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT dla tabeli `wydarzenia`
--
ALTER TABLE `wydarzenia`
  MODIFY `idwydarzenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
