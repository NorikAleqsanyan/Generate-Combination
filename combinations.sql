-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 17 2025 г., 17:30
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `combinationgenerator.db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `combinations`
--

CREATE TABLE `combinations` (
  `id` int(11) NOT NULL,
  `combination` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`combination`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `combinations`
--

INSERT INTO `combinations` (`id`, `combination`) VALUES
(1, '[[\"A1\",\"B1\"],[\"A1\",\"B2\"],[\"A1\",\"C1\"],[\"B1\",\"C1\"],[\"B2\",\"C1\"]]'),
(2, '[[\"A1\",\"B1\"],[\"A1\",\"B2\"],[\"A1\",\"C1\"],[\"A2\",\"B1\"],[\"A2\",\"B2\"],[\"A2\",\"C1\"],[\"B1\",\"C1\"],[\"B2\",\"C1\"]]');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `combinations`
--
ALTER TABLE `combinations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `combinations`
--
ALTER TABLE `combinations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
