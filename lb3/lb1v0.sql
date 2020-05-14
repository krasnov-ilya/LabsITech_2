-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 04 2020 г., 19:04
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lb1v0`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `ID_Authors` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`ID_Authors`, `name`) VALUES
(1, 'Страуструп Б.'),
(2, 'Достоевский Ф.М.'),
(3, 'С. Кинг'),
(4, 'VOGUE');

-- --------------------------------------------------------

--
-- Структура таблицы `book_authors`
--

CREATE TABLE `book_authors` (
  `FID_Book` int(11) DEFAULT NULL,
  `FID_Authors` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book_authors`
--

INSERT INTO `book_authors` (`FID_Book`, `FID_Authors`) VALUES
(1, 1),
(2, 2),
(4, 3),
(4, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `literature`
--

CREATE TABLE `literature` (
  `ID_Book` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `ISBN` int(10) DEFAULT NULL,
  `number` int(10) DEFAULT NULL,
  `literate` enum('Book','Journal','Newspaper') DEFAULT NULL,
  `FID_Resourse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `literature`
--

INSERT INTO `literature` (`ID_Book`, `name`, `date`, `year`, `publisher`, `quantity`, `ISBN`, `number`, `literate`, `FID_Resourse`) VALUES
(1, 'Дизайн и эволюция С++', '2004-04-01', 2004, 'Бьерн Страуструп', 20000, 12351, 240, 'Book', 1),
(2, 'Идиот', '1869-01-01', 1968, 'Достоевский Федор Михайлович', 1000, 32141, 412, 'Book', 1),
(3, 'VOGUE', '2020-02-18', 2020, 'АО \"Конде Наст\"', 300000, 13214, 321, 'Journal', 2),
(4, 'VOGUE NEWS', '2020-01-03', 2020, 'АО \"Конде Наст\"', 32112, 32412, 31, 'Newspaper', 3),
(5, 'Сияние', '1977-01-01', 1977, 'Doubleday', 32144, 23144, 421, 'Book', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `resourse`
--

CREATE TABLE `resourse` (
  `ID_Resourse` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `resourse`
--

INSERT INTO `resourse` (`ID_Resourse`, `title`) VALUES
(1, 'Книга'),
(2, 'Журнал'),
(3, 'Газета');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`ID_Authors`);

--
-- Индексы таблицы `book_authors`
--
ALTER TABLE `book_authors`
  ADD KEY `Book_fk` (`FID_Book`),
  ADD KEY `Author_fk2` (`FID_Authors`);

--
-- Индексы таблицы `literature`
--
ALTER TABLE `literature`
  ADD PRIMARY KEY (`ID_Book`),
  ADD KEY `Resourse_fk` (`FID_Resourse`);

--
-- Индексы таблицы `resourse`
--
ALTER TABLE `resourse`
  ADD PRIMARY KEY (`ID_Resourse`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `ID_Authors` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `literature`
--
ALTER TABLE `literature`
  MODIFY `ID_Book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `resourse`
--
ALTER TABLE `resourse`
  MODIFY `ID_Resourse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `Author_fk2` FOREIGN KEY (`FID_Authors`) REFERENCES `literature` (`ID_Book`),
  ADD CONSTRAINT `Book_fk` FOREIGN KEY (`FID_Book`) REFERENCES `authors` (`ID_Authors`);

--
-- Ограничения внешнего ключа таблицы `literature`
--
ALTER TABLE `literature`
  ADD CONSTRAINT `Resourse_fk` FOREIGN KEY (`FID_Resourse`) REFERENCES `resourse` (`ID_Resourse`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
