-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2015 at 01:33 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `konwent`
--
CREATE DATABASE IF NOT EXISTS `konwent` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `konwent`;

-- --------------------------------------------------------

--
-- Table structure for table `banery`
--

CREATE TABLE IF NOT EXISTS `banery` (
`id` int(11) NOT NULL,
  `obrazek` varchar(255) NOT NULL,
  `status` enum('widoczny','niewidoczny','','') NOT NULL,
  `url` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ostatnia_edycja` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edycja_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `banery_opisy`
--

CREATE TABLE IF NOT EXISTS `banery_opisy` (
  `main_id` int(11) NOT NULL,
  `jezyk` varchar(2) NOT NULL DEFAULT 'pl',
  `nazwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cytaty`
--

CREATE TABLE IF NOT EXISTS `cytaty` (
`id` int(11) NOT NULL,
  `edycja_id` int(11) NOT NULL,
  `status` enum('widoczny','niewidoczny','','') NOT NULL DEFAULT 'widoczny'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cytaty_opisy`
--

CREATE TABLE IF NOT EXISTS `cytaty_opisy` (
  `main_id` int(11) NOT NULL,
  `jezyk` varchar(2) NOT NULL DEFAULT 'pl',
  `cytat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `edycje`
--

CREATE TABLE IF NOT EXISTS `edycje` (
`id` int(11) NOT NULL,
  `data` date NOT NULL,
  `miejsce` varchar(255) NOT NULL,
  `data_koniec` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `edycje_opisy`
--

CREATE TABLE IF NOT EXISTS `edycje_opisy` (
  `main_id` int(11) NOT NULL,
  `jezyk` varchar(2) NOT NULL DEFAULT 'pl',
  `nazwa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jezyki`
--

CREATE TABLE IF NOT EXISTS `jezyki` (
  `jezyk` varchar(2) NOT NULL,
  `domyslny` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jezyki`
--

INSERT INTO `jezyki` (`jezyk`, `domyslny`) VALUES
('pl', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsy`
--

CREATE TABLE IF NOT EXISTS `newsy` (
`id` int(11) NOT NULL,
  `data` date NOT NULL,
  `zdjecie` varchar(255) NOT NULL,
  `status` enum('widoczny','niewidoczny','','') NOT NULL DEFAULT 'widoczny',
  `user_id` int(11) NOT NULL,
  `ostatnia_edycja` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edycja_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsy_opisy`
--

CREATE TABLE IF NOT EXISTS `newsy_opisy` (
  `main_id` int(11) NOT NULL,
  `jezyk` varchar(2) NOT NULL DEFAULT 'pl',
  `nazwa` varchar(255) NOT NULL,
  `opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `newsy_zdjecia`
--

CREATE TABLE IF NOT EXISTS `newsy_zdjecia` (
`id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `zdjecie` varchar(255) NOT NULL,
  `status` enum('widoczny','niewidoczny','','') NOT NULL DEFAULT 'widoczny'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsy_zdjecia_opisy`
--

CREATE TABLE IF NOT EXISTS `newsy_zdjecia_opisy` (
  `main_id` int(11) NOT NULL,
  `jezyk` varchar(2) NOT NULL DEFAULT 'pl',
  `nazwa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rejestracja`
--

CREATE TABLE IF NOT EXISTS `rejestracja` (
`id` int(11) NOT NULL,
  `edycja_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `nick` varchar(32) DEFAULT NULL,
  `telefon` varchar(16) DEFAULT NULL,
  `pelnoletni` tinyint(1) NOT NULL,
  `spanie` varchar(255) NOT NULL,
  `jedzenie` varchar(255) NOT NULL,
  `uwagi` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `strony`
--

CREATE TABLE IF NOT EXISTS `strony` (
`id` int(11) NOT NULL,
  `rodzic_id` int(11) DEFAULT NULL,
  `zdjecie` varchar(255) DEFAULT NULL,
  `status` enum('widoczny','niewidoczny','','') NOT NULL DEFAULT 'widoczny',
  `ostatnia_edycja` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `strony_opisy`
--

CREATE TABLE IF NOT EXISTS `strony_opisy` (
  `main_id` int(11) NOT NULL,
  `jezyk` varchar(2) NOT NULL DEFAULT 'pl',
  `nazwa` varchar(255) NOT NULL,
  `opis` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uzytkownicy`
--

CREATE TABLE IF NOT EXISTS `uzytkownicy` (
`id` int(11) NOT NULL,
  `login` varchar(32) NOT NULL,
  `haslo` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `zaakceptowany` tinyint(1) NOT NULL DEFAULT '0',
  `ostatnie_logowanie` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zdjecia`
--

CREATE TABLE IF NOT EXISTS `zdjecia` (
`id` int(11) NOT NULL,
  `zdjecie` varchar(255) NOT NULL,
  `edycja_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zdjecia_opisy`
--

CREATE TABLE IF NOT EXISTS `zdjecia_opisy` (
  `main_id` int(11) NOT NULL,
  `jezyk` varchar(2) NOT NULL DEFAULT 'pl',
  `nazwa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banery`
--
ALTER TABLE `banery`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`,`edycja_id`), ADD KEY `edycja_id` (`edycja_id`);

--
-- Indexes for table `banery_opisy`
--
ALTER TABLE `banery_opisy`
 ADD PRIMARY KEY (`main_id`,`jezyk`);

--
-- Indexes for table `cytaty`
--
ALTER TABLE `cytaty`
 ADD PRIMARY KEY (`id`), ADD KEY `edycja_id` (`edycja_id`);

--
-- Indexes for table `cytaty_opisy`
--
ALTER TABLE `cytaty_opisy`
 ADD PRIMARY KEY (`main_id`,`jezyk`);

--
-- Indexes for table `edycje`
--
ALTER TABLE `edycje`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edycje_opisy`
--
ALTER TABLE `edycje_opisy`
 ADD PRIMARY KEY (`main_id`,`jezyk`);

--
-- Indexes for table `jezyki`
--
ALTER TABLE `jezyki`
 ADD PRIMARY KEY (`jezyk`);

--
-- Indexes for table `newsy`
--
ALTER TABLE `newsy`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`,`edycja_id`), ADD KEY `edycja_id` (`edycja_id`);

--
-- Indexes for table `newsy_opisy`
--
ALTER TABLE `newsy_opisy`
 ADD PRIMARY KEY (`main_id`,`jezyk`);

--
-- Indexes for table `newsy_zdjecia`
--
ALTER TABLE `newsy_zdjecia`
 ADD PRIMARY KEY (`id`), ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `newsy_zdjecia_opisy`
--
ALTER TABLE `newsy_zdjecia_opisy`
 ADD PRIMARY KEY (`main_id`,`jezyk`);

--
-- Indexes for table `rejestracja`
--
ALTER TABLE `rejestracja`
 ADD PRIMARY KEY (`id`), ADD KEY `edycja_id` (`edycja_id`);

--
-- Indexes for table `strony`
--
ALTER TABLE `strony`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `rodzic_id` (`rodzic_id`);

--
-- Indexes for table `strony_opisy`
--
ALTER TABLE `strony_opisy`
 ADD PRIMARY KEY (`main_id`,`jezyk`);

--
-- Indexes for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `login` (`login`,`email`);

--
-- Indexes for table `zdjecia`
--
ALTER TABLE `zdjecia`
 ADD PRIMARY KEY (`id`), ADD KEY `edycja_id` (`edycja_id`);

--
-- Indexes for table `zdjecia_opisy`
--
ALTER TABLE `zdjecia_opisy`
 ADD PRIMARY KEY (`main_id`,`jezyk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banery`
--
ALTER TABLE `banery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cytaty`
--
ALTER TABLE `cytaty`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `edycje`
--
ALTER TABLE `edycje`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsy`
--
ALTER TABLE `newsy`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsy_zdjecia`
--
ALTER TABLE `newsy_zdjecia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rejestracja`
--
ALTER TABLE `rejestracja`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `strony`
--
ALTER TABLE `strony`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zdjecia`
--
ALTER TABLE `zdjecia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `banery`
--
ALTER TABLE `banery`
ADD CONSTRAINT `banery_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `uzytkownicy` (`id`),
ADD CONSTRAINT `banery_ibfk_2` FOREIGN KEY (`edycja_id`) REFERENCES `edycje` (`id`);

--
-- Constraints for table `banery_opisy`
--
ALTER TABLE `banery_opisy`
ADD CONSTRAINT `banery_opisy_ibfk_1` FOREIGN KEY (`main_id`) REFERENCES `banery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cytaty_opisy`
--
ALTER TABLE `cytaty_opisy`
ADD CONSTRAINT `cytaty_opisy_ibfk_1` FOREIGN KEY (`main_id`) REFERENCES `cytaty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `edycje_opisy`
--
ALTER TABLE `edycje_opisy`
ADD CONSTRAINT `edycje_opisy_ibfk_1` FOREIGN KEY (`main_id`) REFERENCES `edycje` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsy`
--
ALTER TABLE `newsy`
ADD CONSTRAINT `newsy_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `uzytkownicy` (`id`),
ADD CONSTRAINT `newsy_ibfk_2` FOREIGN KEY (`edycja_id`) REFERENCES `edycje` (`id`);

--
-- Constraints for table `newsy_opisy`
--
ALTER TABLE `newsy_opisy`
ADD CONSTRAINT `newsy_opisy_ibfk_1` FOREIGN KEY (`main_id`) REFERENCES `newsy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsy_zdjecia`
--
ALTER TABLE `newsy_zdjecia`
ADD CONSTRAINT `newsy_zdjecia_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `newsy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `strony`
--
ALTER TABLE `strony`
ADD CONSTRAINT `strony_ibfk_1` FOREIGN KEY (`rodzic_id`) REFERENCES `strony` (`id`),
ADD CONSTRAINT `strony_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `uzytkownicy` (`id`);

--
-- Constraints for table `strony_opisy`
--
ALTER TABLE `strony_opisy`
ADD CONSTRAINT `strony_opisy_ibfk_1` FOREIGN KEY (`main_id`) REFERENCES `strony` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zdjecia`
--
ALTER TABLE `zdjecia`
ADD CONSTRAINT `zdjecia_ibfk_1` FOREIGN KEY (`edycja_id`) REFERENCES `edycje` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
