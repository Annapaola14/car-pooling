-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Mar 16, 2024 alle 13:19
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_pooling`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Automobile`
--

CREATE TABLE `Automobile` (
  `targa` varchar(10) NOT NULL,
  `casa_produttrice` varchar(100) DEFAULT NULL,
  `modello` varchar(100) DEFAULT NULL,
  `numero_posti` int(11) DEFAULT NULL,
  `colore` varchar(50) DEFAULT NULL,
  `anno_immatricolazione` int(11) DEFAULT NULL,
  `chilometri` decimal(10,2) DEFAULT NULL,
  `carburante` varchar(50) DEFAULT NULL,
  `cilindrata` int(11) DEFAULT NULL,
  `id_utente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Citta`
--

CREATE TABLE `Citta` (
  `id` int(11) NOT NULL,
  `cap` varchar(10) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Passa_Da`
--

CREATE TABLE `Passa_Da` (
  `id_viaggio` int(11) NOT NULL,
  `id_citta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Prenotazione`
--

CREATE TABLE `Prenotazione` (
  `id` int(11) NOT NULL,
  `accettata` tinyint(1) DEFAULT NULL,
  `id_viaggio` int(11) DEFAULT NULL,
  `id_utente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Recensione`
--

CREATE TABLE `Recensione` (
  `id` int(11) NOT NULL,
  `giudizio` text DEFAULT NULL,
  `voto` int(11) DEFAULT NULL,
  `id_utente_scrittore` int(11) DEFAULT NULL,
  `id_utente_ricevente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Utente`
--

CREATE TABLE `Utente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `indirizzo` varchar(100) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  `luogo_nascita` varchar(100) DEFAULT NULL,
  `numero_patente` varchar(20) DEFAULT NULL,
  `numero_documento_identita` varchar(20) DEFAULT NULL,
  `data_scadenza_patente` date DEFAULT NULL,
  `numero_telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fotografia` blob DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `Viaggio`
--

CREATE TABLE `Viaggio` (
  `id` int(11) NOT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `numero_soste` int(11) DEFAULT NULL,
  `aperto` tinyint(1) DEFAULT NULL,
  `prezzo_passeggero` decimal(10,2) DEFAULT NULL,
  `animali` int(11) DEFAULT NULL,
  `bagaglio` int(11) DEFAULT NULL,
  `fumatori` tinyint(1) DEFAULT NULL,
  `numero_posti_disponibili` int(11) DEFAULT NULL,
  `id_utente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Automobile`
--
ALTER TABLE `Automobile`
  ADD PRIMARY KEY (`targa`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `Citta`
--
ALTER TABLE `Citta`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Passa_Da`
--
ALTER TABLE `Passa_Da`
  ADD PRIMARY KEY (`id_viaggio`,`id_citta`),
  ADD KEY `id_citta` (`id_citta`);

--
-- Indici per le tabelle `Prenotazione`
--
ALTER TABLE `Prenotazione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_viaggio` (`id_viaggio`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `Recensione`
--
ALTER TABLE `Recensione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utente_scrittore` (`id_utente_scrittore`),
  ADD KEY `id_utente_ricevente` (`id_utente_ricevente`);

--
-- Indici per le tabelle `Utente`
--
ALTER TABLE `Utente`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Viaggio`
--
ALTER TABLE `Viaggio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_utente` (`id_utente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Citta`
--
ALTER TABLE `Citta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Prenotazione`
--
ALTER TABLE `Prenotazione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Recensione`
--
ALTER TABLE `Recensione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Utente`
--
ALTER TABLE `Utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Viaggio`
--
ALTER TABLE `Viaggio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Automobile`
--
ALTER TABLE `Automobile`
  ADD CONSTRAINT `Automobile_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `Utente` (`id`);

--
-- Limiti per la tabella `Passa_Da`
--
ALTER TABLE `Passa_Da`
  ADD CONSTRAINT `Passa_Da_ibfk_1` FOREIGN KEY (`id_viaggio`) REFERENCES `Viaggio` (`id`),
  ADD CONSTRAINT `Passa_Da_ibfk_2` FOREIGN KEY (`id_citta`) REFERENCES `Citta` (`id`);

--
-- Limiti per la tabella `Prenotazione`
--
ALTER TABLE `Prenotazione`
  ADD CONSTRAINT `Prenotazione_ibfk_1` FOREIGN KEY (`id_viaggio`) REFERENCES `Viaggio` (`id`),
  ADD CONSTRAINT `Prenotazione_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `Utente` (`id`);

--
-- Limiti per la tabella `Recensione`
--
ALTER TABLE `Recensione`
  ADD CONSTRAINT `Recensione_ibfk_1` FOREIGN KEY (`id_utente_scrittore`) REFERENCES `Utente` (`id`),
  ADD CONSTRAINT `Recensione_ibfk_2` FOREIGN KEY (`id_utente_ricevente`) REFERENCES `Utente` (`id`);

--
-- Limiti per la tabella `Viaggio`
--
ALTER TABLE `Viaggio`
  ADD CONSTRAINT `Viaggio_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `Utente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
