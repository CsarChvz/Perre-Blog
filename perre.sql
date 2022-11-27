-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-11-2022 a las 00:34:17
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `perre`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('71ed78974cff');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `body` text DEFAULT NULL,
  `body_html` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `body`, `body_html`, `timestamp`, `disabled`, `author_id`, `post_id`) VALUES
(1, 'Comentario', 'Comentario', '2022-11-27 23:18:49', NULL, 7, 5),
(2, 'Puede ser pa?', 'Puede ser pa?', '2022-11-27 23:19:16', 1, 7, 5),
(3, 'Este es un comentario medio pete', 'Este es un comentario medio pete', '2022-11-27 23:25:14', 1, 6, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `follows`
--

CREATE TABLE `follows` (
  `follower_id` int(11) NOT NULL,
  `followed_id` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `follows`
--

INSERT INTO `follows` (`follower_id`, `followed_id`, `timestamp`) VALUES
(1, 1, '2022-11-27 22:54:12'),
(2, 2, '2022-11-27 22:54:12'),
(3, 3, '2022-11-27 22:54:12'),
(4, 4, '2022-11-27 22:54:12'),
(5, 5, '2022-11-27 22:54:12'),
(6, 6, '2022-11-27 22:54:12'),
(7, 6, '2022-11-27 13:30:05'),
(7, 7, '2022-11-27 22:54:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `body`, `timestamp`, `author_id`) VALUES
(1, 'ASDAS', '2022-11-25 17:59:19', 6),
(2, 'Andamos viendo cosas ', '2022-11-25 18:01:31', 6),
(3, 'SI, cro que si esta en drugs apoco ', '2022-11-25 20:21:12', 6),
(4, 'Un post XD', '2022-11-27 13:15:19', 7),
(5, 'Creo que no\r\n# Supongo que si', '2022-11-27 13:15:23', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `permissions` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `default`, `permissions`) VALUES
(2, 'Moderator', 0, 15),
(3, 'User', 1, 7),
(4, 'Administrator', 0, 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password_hash` varchar(128) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `about_me` text DEFAULT NULL,
  `member_since` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `avatar_hash` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `role_id`, `confirmed`, `name`, `location`, `about_me`, `member_since`, `last_seen`, `avatar_hash`) VALUES
(1, 'john@example.com', 'john', 'pbkdf2:sha256:260000$5AczG7nabbCLOkCo$96ea46976f2a302c7cb85dcf62b4f8fc02ad3070b3107f708f91fc5ed9513660', 3, 1, NULL, NULL, NULL, NULL, '2022-11-27 23:31:53', NULL),
(2, 'gang@gmail.com', 'Gang', 'pbkdf2:sha256:260000$NxfOPCKQnbUII2hq$0d9e776a1ad9ad2d90ab5cad8db5747d1cef5d94cdc361dd7e63513fc430e63e', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'vonowem722@xegge.com', 'Vonew', 'pbkdf2:sha256:260000$iZkXuJZQVb1ssMCZ$8a5e9008d778685e9e6b11aeaac483ade5d59b6935027fc7f892b8b7cc470383', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'rovok21748@turuma.com', 'Rovok', 'pbkdf2:sha256:260000$zI3OYY9UIZylU5ax$91acb14bcb88d71d982ca56525b167c1cc62a29ae023fd2efc7a5316b4c15c0c', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'gaetavirgenr@gmail.com', 'rororo', 'pbkdf2:sha256:260000$ptXG8LbFkWRMF0cB$4bfaad8523718153de56a9b166edc4f80071b715aba34ed56cd5c711c873a92e', 3, 1, 'Gaeta Virgen', 'Jalisco, México', 'ANdres', NULL, NULL, NULL),
(6, 'cesarconfigs@gmail.com', 'CesarChvz', 'pbkdf2:sha256:260000$JJ4I5lbxzh7PnLYQ$a6a43e9670448fcf1cae82ad94e212e6c4208057faeadf0b4c6da05b690a770f', 4, 1, 'César Chávez', 'Jalisco, México', 'Admon', NULL, '2022-11-27 23:29:51', NULL),
(7, 'cesar.chavez8728@alumnos.udg.mx', 'CsarChvz_V2', 'pbkdf2:sha256:260000$ljWeKyDejkXkMl6X$28d361ca4dad0b4ffa23a9f6e3bd7b464cf821d7723cfd342d7171f88b50e9f5', 3, 1, 'Ceśar Chávez', 'Zapopan, Jalisco', 'Segun perfil', '2022-11-27 13:12:32', '2022-11-27 23:21:06', '53e598c9ccddfbc0164a50c71672502d');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `ix_comments_timestamp` (`timestamp`);

--
-- Indices de la tabla `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`follower_id`,`followed_id`),
  ADD KEY `followed_id` (`followed_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `ix_posts_timestamp` (`timestamp`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `ix_roles_default` (`default`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_users_email` (`email`),
  ADD UNIQUE KEY `ix_users_username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Filtros para la tabla `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`followed_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
