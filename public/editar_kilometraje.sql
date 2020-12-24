-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-12-2020 a las 12:53:03
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editar_kilometraje`
--

CREATE TABLE `editar_kilometraje` (
  `id` int(10) UNSIGNED NOT NULL,
  `kilometraje_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'kilometraje modificado',
  `unidad_id` int(10) UNSIGNED DEFAULT NULL,
  `agrupacion_id` int(10) UNSIGNED DEFAULT NULL,
  `empresa_id` int(10) UNSIGNED DEFAULT NULL,
  `estacion_id` int(10) UNSIGNED DEFAULT NULL,
  `operador_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'usuario que modifico',
  `km_entrada_anterior` int(11) DEFAULT NULL,
  `km_salida_anterior` int(11) DEFAULT NULL,
  `km_acumulado_anterior` int(11) DEFAULT NULL,
  `km_entrada_nuevo` int(11) DEFAULT NULL,
  `km_salida_nuevo` int(11) DEFAULT NULL,
  `km_acumulado_nuevo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `editar_kilometraje`
--
ALTER TABLE `editar_kilometraje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `editar_kilometraje_kilometraje_id_foreign` (`kilometraje_id`),
  ADD KEY `editar_kilometraje_unidad_id_foreign` (`unidad_id`),
  ADD KEY `editar_kilometraje_agrupacion_id_foreign` (`agrupacion_id`),
  ADD KEY `editar_kilometraje_empresa_id_foreign` (`empresa_id`),
  ADD KEY `editar_kilometraje_estacion_id_foreign` (`estacion_id`),
  ADD KEY `editar_kilometraje_operador_id_foreign` (`operador_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `editar_kilometraje`
--
ALTER TABLE `editar_kilometraje`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `editar_kilometraje`
--
ALTER TABLE `editar_kilometraje`
  ADD CONSTRAINT `editar_kilometraje_agrupacion_id_foreign` FOREIGN KEY (`agrupacion_id`) REFERENCES `agrupaciones_vehiculares` (`id`),
  ADD CONSTRAINT `editar_kilometraje_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `editar_kilometraje_estacion_id_foreign` FOREIGN KEY (`estacion_id`) REFERENCES `estaciones` (`id`),
  ADD CONSTRAINT `editar_kilometraje_kilometraje_id_foreign` FOREIGN KEY (`kilometraje_id`) REFERENCES `kilometrajes` (`id`),
  ADD CONSTRAINT `editar_kilometraje_operador_id_foreign` FOREIGN KEY (`operador_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `editar_kilometraje_unidad_id_foreign` FOREIGN KEY (`unidad_id`) REFERENCES `unidades` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
