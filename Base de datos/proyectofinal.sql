-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 04, 2023 at 11:31 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyectofinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `devolucion`
--

CREATE TABLE `devolucion` (
  `idDevolucion` int(11) NOT NULL,
  `estadoLibro` varchar(45) DEFAULT NULL,
  `tiempoTotal` datetime DEFAULT NULL,
  `costoExtra` decimal(10,0) DEFAULT NULL,
  `costoFinal` decimal(10,0) DEFAULT NULL,
  `idRenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `editorial`
--

CREATE TABLE `editorial` (
  `idEditorial` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `idSucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `sueldo` decimal(10,0) DEFAULT NULL,
  `turno` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `libro`
--

CREATE TABLE `libro` (
  `idLibro` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `isbn` int(25) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `autor` varchar(45) DEFAULT NULL,
  `fechaPublicacion` date DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `idEditorial` int(11) DEFAULT NULL,
  `idSucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `libro`
--

INSERT INTO `libro` (`idLibro`, `nombre`, `isbn`, `tipo`, `autor`, `fechaPublicacion`, `cantidad`, `idEditorial`, `idSucursal`) VALUES
(1, 'It', 813025, 'Terror', 'Stephen King', '1986-09-15', 3, NULL, NULL),
(2, 'Los Juegos del Hambre', 23481, 'Ciencia Ficción', 'Suzanne Collins', '2008-09-14', 5, NULL, NULL),
(3, 'The Maze Runner', 737944, 'Ciencia Ficción', 'James Dashner', '2009-10-06', 10, NULL, NULL),
(4, 'Coraline', 575915, 'Fantasía Oscura', 'Neil Gaiman', '2002-07-02', 13, NULL, NULL),
(5, 'El Esclavo', 366137, 'Novela Psicológica', 'Anand Dílvar', '2006-12-20', 20, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promocion`
--

CREATE TABLE `promocion` (
  `idPromocion` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promocion`
--

INSERT INTO `promocion` (`idPromocion`, `nombre`, `descripcion`) VALUES
(1, 'prueba', 'esto es una prueba a ver si funciona');

-- --------------------------------------------------------

--
-- Table structure for table `renta`
--

CREATE TABLE `renta` (
  `idRenta` int(11) NOT NULL,
  `tiempoRenta` datetime DEFAULT NULL,
  `costo` decimal(10,0) DEFAULT NULL,
  `disponibilidad` int(11) DEFAULT NULL,
  `idLibro` int(11) DEFAULT NULL,
  `idSucursal` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sucursal`
--

CREATE TABLE `sucursal` (
  `idSucursal` int(11) NOT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `idEditorial` int(11) DEFAULT NULL,
  `idPromocion` int(11) DEFAULT NULL,
  `idEmpleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sucursal`
--

INSERT INTO `sucursal` (`idSucursal`, `ciudad`, `estado`, `direccion`, `idEditorial`, `idPromocion`, `idEmpleado`) VALUES
(1, 'Monterrey', 'Nuevo León', 'Av. Francisco I. Madero 450, Centro, 64000 Monterrey, N.L.', NULL, NULL, NULL),
(2, 'Ciudad de México', 'DF', 'José María Pino Suárez S/N Transito, Local 11, Centro, Cuauhtémoc, 06010 CDMX', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `edad` varchar(15) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `nombreLibro` varchar(45) DEFAULT NULL,
  `tiempoRenta` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `apellido`, `edad`, `correo`, `celular`, `nombreLibro`, `tiempoRenta`) VALUES
(19, 'prueba', '123', '32', 'correo@gmail.com', '444958', 'Los juegos del hambre', 'Fri Dec 01 2023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`idDevolucion`),
  ADD KEY `FK_Devolucion_Renta_idx` (`idRenta`);

--
-- Indexes for table `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`idEditorial`),
  ADD KEY `FK_Editorial_Sucursal_idx` (`idSucursal`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indexes for table `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`idLibro`),
  ADD KEY `FK_Libro_Editorial_idx` (`idEditorial`),
  ADD KEY `FK_Libro_Sucursal_idx` (`idSucursal`);

--
-- Indexes for table `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`idPromocion`);

--
-- Indexes for table `renta`
--
ALTER TABLE `renta`
  ADD PRIMARY KEY (`idRenta`),
  ADD KEY `FK_Renta_Libro_idx` (`idLibro`),
  ADD KEY `FK_Renta_Sucursal_idx` (`idSucursal`),
  ADD KEY `FK_Renta_Usuario_idx` (`idUsuario`);

--
-- Indexes for table `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`idSucursal`),
  ADD KEY `FK_Editorial_idx` (`idEditorial`),
  ADD KEY `FK_Promocion_idx` (`idPromocion`),
  ADD KEY `FK_Empleado_idx` (`idEmpleado`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `FK_Devolucion_Renta` FOREIGN KEY (`idRenta`) REFERENCES `renta` (`idRenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `editorial`
--
ALTER TABLE `editorial`
  ADD CONSTRAINT `FK_Editorial_Sucursal` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `FK_Libro_Editorial` FOREIGN KEY (`idEditorial`) REFERENCES `editorial` (`idEditorial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Libro_Sucursal` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `renta`
--
ALTER TABLE `renta`
  ADD CONSTRAINT `FK_Renta_Libro` FOREIGN KEY (`idLibro`) REFERENCES `libro` (`idLibro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Renta_Sucursal` FOREIGN KEY (`idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Renta_Usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `FK_Sucursal_Editorial` FOREIGN KEY (`idEditorial`) REFERENCES `editorial` (`idEditorial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Sucursal_Empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Sucursal_Promocion` FOREIGN KEY (`idPromocion`) REFERENCES `promocion` (`idPromocion`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
