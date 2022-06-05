-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2022 at 07:24 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_games`
--

-- --------------------------------------------------------

--
-- Table structure for table `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `genero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `generos`
--

INSERT INTO `generos` (`id`, `genero`) VALUES
(1, 'Ação'),
(2, 'Aventura'),
(3, 'Simulção'),
(4, 'Esporte'),
(5, 'Estrategia'),
(6, 'Tabuleiro'),
(7, 'RPG'),
(8, 'Mutiplayer'),
(9, 'Arcade'),
(10, 'Horror'),
(11, 'Puzzel'),
(12, 'Luta'),
(13, 'Musical'),
(14, 'Life Sim'),
(15, 'Sobrevivencia'),
(16, 'Educativos');

-- --------------------------------------------------------

--
-- Table structure for table `jogos`
--

CREATE TABLE `jogos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `descrição` tinytext NOT NULL,
  `nota` decimal(10,0) NOT NULL,
  `capa` varchar(20) NOT NULL,
  `genero` int(11) NOT NULL,
  `produtora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produtoras`
--

CREATE TABLE `produtoras` (
  `id` int(11) NOT NULL,
  `produtora` varchar(20) NOT NULL,
  `pais` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produtoras`
--

INSERT INTO `produtoras` (`id`, `produtora`, `pais`) VALUES
(1, 'Konamy', 'Japão'),
(2, 'Sony', 'Japão'),
(3, 'Microsft', 'EUA'),
(4, 'Apple', 'EUA'),
(5, 'Namco Bandai', 'Japão'),
(6, 'Nintendo', 'Japão'),
(7, 'Disney', 'EUA'),
(8, 'Activision', 'EUA'),
(9, 'Mixi', 'Japão'),
(10, 'CyberAgent', 'Japão'),
(11, 'Ubisoft', 'FRA'),
(12, 'Interactive Entertai', 'china'),
(13, 'Capcon', 'Japão'),
(14, 'EA', 'EUA'),
(15, 'Sega', 'Japão');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(20) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL DEFAULT 'editor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `jogos`
--
ALTER TABLE `jogos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `genero` (`genero`),
  ADD KEY `produtora` (`produtora`);

--
-- Indexes for table `produtoras`
--
ALTER TABLE `produtoras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jogos`
--
ALTER TABLE `jogos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jogos`
--
ALTER TABLE `jogos`
  ADD CONSTRAINT `jogos_ibfk_1` FOREIGN KEY (`genero`) REFERENCES `generos` (`id`),
  ADD CONSTRAINT `jogos_ibfk_2` FOREIGN KEY (`produtora`) REFERENCES `produtoras` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
