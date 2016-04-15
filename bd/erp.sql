﻿--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.0.54.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 09.04.2016 21:42:43
-- Версия сервера: 5.6.27-0ubuntu0.15.04.1
-- Версия клиента: 4.1
--


-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

-- 
-- Установка базы данных по умолчанию
--
USE erp;

--
-- Описание для таблицы client
--
DROP TABLE IF EXISTS client;
CREATE TABLE client (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  adress VARCHAR(255) DEFAULT NULL,
  email VARCHAR(50) NOT NULL,
  description TEXT DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 7
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы client_project
--
DROP TABLE IF EXISTS client_project;
CREATE TABLE client_project (
  id INT(11) NOT NULL AUTO_INCREMENT,
  client INT(11) NOT NULL,
  project INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы comment
--
DROP TABLE IF EXISTS comment;
CREATE TABLE comment (
  id INT(11) NOT NULL AUTO_INCREMENT,
  text TEXT NOT NULL,
  issue_id INT(11) DEFAULT NULL,
  project_id INT(11) DEFAULT NULL,
  date DATETIME NOT NULL,
  user INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы contact
--
DROP TABLE IF EXISTS contact;
CREATE TABLE contact (
  id INT(11) NOT NULL AUTO_INCREMENT,
  date DATETIME NOT NULL,
  client INT(11) DEFAULT NULL,
  user INT(11) NOT NULL,
  type INT(11) NOT NULL,
  desctiption TEXT NOT NULL,
  next_date_contact DATETIME NOT NULL,
  user_doer INT(11) DEFAULT NULL,
  project INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 10
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы fos_user
--
DROP TABLE IF EXISTS fos_user;
CREATE TABLE fos_user (
  id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  username_canonical VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  email_canonical VARCHAR(255) NOT NULL,
  enabled TINYINT(1) NOT NULL,
  salt VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  last_login DATETIME DEFAULT NULL,
  locked TINYINT(1) NOT NULL,
  expired TINYINT(1) NOT NULL,
  expires_at DATETIME DEFAULT NULL,
  confirmation_token VARCHAR(255) DEFAULT NULL,
  password_requested_at DATETIME DEFAULT NULL,
  roles LONGTEXT NOT NULL COMMENT '(DC2Type:array)',
  credentials_expired TINYINT(1) NOT NULL,
  credentials_expire_at DATETIME DEFAULT NULL,
  description TEXT DEFAULT NULL,
  avatar VARCHAR(255) DEFAULT NULL,
  phone VARCHAR(255) DEFAULT NULL,
  skill LONGTEXT DEFAULT NULL,
  portfolio LONGTEXT DEFAULT NULL,
  price LONGTEXT DEFAULT NULL,
  pricevchas VARCHAR(255) DEFAULT NULL,
  watch VARCHAR(255) DEFAULT NULL,
  experience VARCHAR(255) DEFAULT NULL,
  anotheCommand VARCHAR(255) DEFAULT NULL,
  rekvisitOplat VARCHAR(255) DEFAULT NULL,
  reiting INT(11) DEFAULT NULL,
  adress LONGTEXT DEFAULT NULL,
  dateRegistration DATETIME DEFAULT NULL,
  predoplata LONGTEXT DEFAULT NULL,
  platejsistem VARCHAR(255) DEFAULT NULL,
  ege VARCHAR(255) DEFAULT NULL,
  gender VARCHAR(255) DEFAULT NULL,
  fio VARCHAR(255) DEFAULT NULL,
  informwhy LONGTEXT DEFAULT NULL,
  sekret LONGTEXT DEFAULT NULL,
  predpochteniyajob LONGTEXT DEFAULT NULL,
  instrument LONGTEXT DEFAULT NULL,
  paralelJob LONGTEXT DEFAULT NULL,
  samOrCommand LONGTEXT DEFAULT NULL,
  skolkochasovvnedelu VARCHAR(255) DEFAULT NULL,
  celiVrabote LONGTEXT DEFAULT NULL,
  hobbi LONGTEXT DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX UNIQ_957A647992FC23A8 (username_canonical),
  UNIQUE INDEX UNIQ_957A6479A0D96FBF (email_canonical)
)
ENGINE = INNODB
AUTO_INCREMENT = 51
AVG_ROW_LENGTH = 1950
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы issue
--
DROP TABLE IF EXISTS issue;
CREATE TABLE issue (
  id INT(11) NOT NULL AUTO_INCREMENT,
  issue_name TEXT NOT NULL,
  issue_description TEXT DEFAULT NULL,
  issue_autor INT(11) NOT NULL,
  issue_executor INT(11) NOT NULL,
  date_create DATETIME NOT NULL,
  date_finish DATETIME DEFAULT NULL,
  status INT(11) DEFAULT NULL,
  summa INT(11) DEFAULT NULL,
  date_start DATETIME DEFAULT NULL,
  project INT(11) DEFAULT NULL,
  issue_prioritet INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 178
AVG_ROW_LENGTH = 661
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы issue_status
--
DROP TABLE IF EXISTS issue_status;
CREATE TABLE issue_status (
  id INT(11) NOT NULL AUTO_INCREMENT,
  status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы project
--
DROP TABLE IF EXISTS project;
CREATE TABLE project (
  id INT(11) NOT NULL AUTO_INCREMENT,
  project_name TEXT NOT NULL,
  project_description TEXT DEFAULT NULL,
  project_manager INT(11) NOT NULL,
  project_creator INT(11) NOT NULL,
  date_create DATETIME NOT NULL,
  date_finish DATETIME DEFAULT NULL,
  client INT(11) DEFAULT NULL,
  summ INT(11) DEFAULT NULL,
  project_type INT(11) NOT NULL,
  project_status INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 19
AVG_ROW_LENGTH = 1820
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы project_command
--
DROP TABLE IF EXISTS project_command;
CREATE TABLE project_command (
  id INT(11) NOT NULL AUTO_INCREMENT,
  issue INT(11) NOT NULL,
  project INT(11) NOT NULL,
  issue_executor INT(11) DEFAULT NULL,
  issue_autor INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 148
AVG_ROW_LENGTH = 111
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы project_status
--
DROP TABLE IF EXISTS project_status;
CREATE TABLE project_status (
  id INT(11) NOT NULL AUTO_INCREMENT,
  status_name VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы project_type
--
DROP TABLE IF EXISTS project_type;
CREATE TABLE project_type (
  id INT(11) NOT NULL AUTO_INCREMENT,
  type_name VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 8
AVG_ROW_LENGTH = 2340
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы role
--
DROP TABLE IF EXISTS role;
CREATE TABLE role (
  id VARCHAR(255) NOT NULL,
  role_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 3276
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы type_contact
--
DROP TABLE IF EXISTS type_contact;
CREATE TABLE type_contact (
  id INT(11) NOT NULL AUTO_INCREMENT,
  type_name VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 3276
CHARACTER SET utf8
COLLATE utf8_general_ci;

-- 
-- Вывод данных для таблицы client
--
INSERT INTO client VALUES
(3, 'Метизстрой', '9197716667', 'Москва', 'nigmatullov@mail.ru', 'Продажи метизов, Фундаментных болтов, гаек'),
(4, 'Контур', '9197716667', 'Москва', 'kontur@expert56.ru', 'Федеральная компания контур разработчик on-line сервисов'),
(5, 'teamexpert', '+996777999666', 'teamexpert.tk', 'gordondalos@gmail.com', NULL),
(6, 'Анатолий Помазной', '0773543366 (Дима)', NULL, 'Анатолий Помазной <anatoliipomaznoi@gmail.com>', 'Система Ерепорт, Руководитель Дмитрий Дмитриевич скайп Димы - dd.inteco');

-- 
-- Вывод данных для таблицы client_project
--

-- Таблица erp.client_project не содержит данных

-- 
-- Вывод данных для таблицы comment
--

-- Таблица erp.comment не содержит данных

-- 
-- Вывод данных для таблицы contact
--

-- Таблица erp.contact не содержит данных

-- 
-- Вывод данных для таблицы fos_user
--
INSERT INTO fos_user VALUES
(4, 'Gordondalos', 'gordondalos', 'gordondalos@gmail.com', 'gordondalos@gmail.com', 1, 'lf12bisivq8gk0cc8g4ws4cogcc440g', '$2y$13$lf12bisivq8gk0cc8g4wsumW.6YFDdwXHy1zi/pygHfpXU392JYjq', '2016-04-09 15:11:57', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Евгений бондаренко</p>\r\n\r\n<p>Ключевые навыки:&nbsp;Верстка, Css, sass, scss, WP, Водпрес, DLE, jade, html, php, symfony2, opencart, Опенкарт, Дле, js, javascrypt, jquery,</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', NULL, '+996777999029 skype: gordondalos.kg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'paulic', 'paulic', 'paulic@list.ru', 'paulic@list.ru', 1, 'lqgg9i5qfc0gk4c8c0g8wg0o8084gk4', '$2y$13$lqgg9i5qfc0gk4c8c0g8we2Wfc/ELZgO8OnKfktIVi8e0VF49I1xK', '2016-01-21 08:51:59', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<ul>\r\n\t<li>SEO, Продвижение сайтов в поисковиках&nbsp;- от 15000 руб</li>\r\n\t<li>Семантическое ядро - от 3500 руб</li>\r\n\t<li>Анализ сайта. - от 3500 руб</li>\r\n</ul>', NULL, '+996555911124', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Матвей', 'матвей', 'nigmatullov@mail.ru', 'nigmatullov@mail.ru', 1, 'j7hisxpsg34s8ssswokgwcsw40ssokk', '$2y$13$j7hisxpsg34s8ssswokgwOdCn0NutncCRcVUz.k/K76CZz7cqDhzO', '2016-01-22 08:51:44', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Менеджер</p>', NULL, '+79197716667 skype focus5611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Galina', 'galina', 'lina_j@rambler.ru', 'lina_j@rambler.ru', 1, '8bccsv7x4b8cg8gckcc4w4g488skk8s', '$2y$13$8bccsv7x4b8cg8gckcc4wuYVA2QyTWlrBXphNwDX92kJw2X8ZXHiK', '2016-01-15 15:13:05', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Галина Желнина</p>\r\n\r\n<p>Ключевые навыки: Журналист, Редактор, Написание текста, рерайт, копирайт, ведение блогов</p>', NULL, '+996555774697 skype: galina_jelnina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Валера', 'валера', 'eternitywisher@gmail.com', 'eternitywisher@gmail.com', 1, '9yf4f9hica0o84c8goso4cs8gc8ck80', '$2y$13$9yf4f9hica0o84c8goso4OlN7ucvdgWVNxr6JG7nUhQ.h9YN.hUxm', '2016-01-21 18:31:43', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Ключевые навыки: PHP, Javascript symfony2</p>', NULL, 'skype: eternitywisher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'hedin', 'hedin', 'login.hedin@gmail.com', 'login.hedin@gmail.com', 1, 'b5fyg2kqj34g0wkoks80wocsgc0sswc', '$2y$13$b5fyg2kqj34g0wkoks80weJkU.qaTr7f4gtLHReQ.hSiL5hYqbACG', '2016-03-05 14:27:33', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>&nbsp;</p>\r\n\r\n<p>Калинин Алексей</p>\r\n\r\n<p>Админ</p>\r\n\r\n<p>Ruby on rails</p>', NULL, '+996555595923', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Дмитрий', 'дмитрий', 'Example@example.rur', 'example@example.rur', 1, 'jycpg9ra98gwgg0cscs4ss84sgs4o8k', '$2y$13$jycpg9ra98gwgg0cscs4seDZmNEtBuXSSEuBMUJHQIIIbgvplpl7G', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Админ</p>\r\n\r\n<p>Ruby on rails, Symfony, php, js</p>', NULL, '+996701345601 skype: dima-scs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'enlighted_inkvisitor', 'enlighted_inkvisitor', 'enlighted@yandex.ru', 'enlighted@yandex.ru', 1, 'opx4a5kwgao0ooosocs8s8csccww8cc', '$2y$13$opx4a5kwgao0ooosocs8suYoh/0cZgZ2kzIkK7Kcu3Hhe8EgjnZvm', '2016-01-17 14:11:56', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Женя Мокиенко</p>\r\n\r\n<p>Ключевые навыки</p>\r\n\r\n<p>Полиграфическая верстка, графическое макетирование, Установка ЦМС, Администрирование сайтов, Admin, Админ</p>', NULL, 'skype: enlighted_inkvisitor +996555774697', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Богдан', 'богдан', 'Example@example2.ru', 'example@example2.ru', 1, 'qu8vmqvl2cggs8owg0ws0c00wwwgk08', '$2y$13$qu8vmqvl2cggs8owg0ws0ObwNcZf7YF6um7mWTDxK/yMpi/7ZyYYG', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Богдан Сбитнев</p>\r\n\r\n<p>admin, Админ</p>', NULL, '+996553982755 skype: architector.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'testuser', 'testuser', 'testuser@mail.ru', 'testuser@mail.ru', 0, 'b1u3wnt99j40wossckw4kk4w4wgssc8', '$2y$13$b1u3wnt99j40wossckw4keRTC2aCeXXvY01kJQPHMl7SsYo5cCrhm', '2016-01-19 07:48:29', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:12:"ROLE_MANAGER";}', 0, NULL, '<p>Тестовый юзер</p>', NULL, '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Николай', 'николай', 'hudyakovnikolai1981@bk.ru', 'hudyakovnikolai1981@bk.ru', 1, 'd0bzkr1yor48c0ksscw0cwgw0c4cc0s', '$2y$13$d0bzkr1yor48c0ksscw0cuVh9IcW5Lx3.Qb01GxNfnqX1YomamSL6', '2016-03-05 17:39:45', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Менеджер&nbsp;Николай Худяков тел:89114823630 (+7911482360)</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', NULL, 'skype -madagaskar39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Кучерюк Николай', 'кучерюк николай', 'jonydes@ya.ru', 'jonydes@ya.ru', 0, '7pjs50743csg804wogs0oowkg4g0ws0', '$2y$13$7pjs50743csg804wogs0oes/fX1yKLZdAF0DUDuHqq4G9f782NHJm', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>Скайп Johny Des</p>\r\n\r\n<p>Веб дизайнер графика.</p>\r\n\r\n<p>2000рублей страница</p>', NULL, 'Скайп Johny Des', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Шхалахов Александр', 'шхалахов александр', 'misterjones47@gmail.com', 'misterjones47@gmail.com', 0, 'dcc1jpoqjhsso0cwg8s4gs40okgkg4o', '$2y$13$dcc1jpoqjhsso0cwg8s4gePZd/v5Aozb4HIEy3ACipWG9qiGn4.MO', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_MASTER";}', 0, NULL, '<p>озвучивание видео. Перевод текстов, видео и аудио с английского на русский и украинский / на английский с русского и украинского</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Кузьменко Николай', 'кузьменко николай', 'nikolai_kuzmenko80@mail.ru', 'nikolai_kuzmenko80@mail.ru', 0, 'l3372bsr14gskosgccoww0sokccos04', '$2y$13$l3372bsr14gskosgccowwun/RvbggxmDgtCBLpSF0g7yGlal0yMf.', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:11:"ROLE_MASTER";}', 0, NULL, '<p>Разрабатываю сайты &quot;под ключ&quot; , дизайн сайтов, делаю баннеры, логотипы, фирменный стиль и наружную рекламу</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Бульхин Айрат', 'бульхин айрат', 'bulkhin_airat@mail.ru', 'bulkhin_airat@mail.ru', 0, 'r312vhp5f1wcsko4sooockk0w084k44', '$2y$13$r312vhp5f1wcsko4soooceAFjQwz43ttztgbTgJp8SQEILTntzWdC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Графический дизайнер, веб-дизайнер, Ux-дизайнер</p>\r\n\r\n<p>Сайт портфолио&nbsp;https://www.behance.net/Bulkhinairat</p>\r\n\r\n<p>&nbsp;</p>', NULL, 'скайп : bulkhina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Гостюхин Андрей', 'гостюхин андрей', 'me@torinasakura.name', 'me@torinasakura.name', 0, '3xuzwccionswscso80o8ww0kgc4s8ww', '$2y$13$3xuzwccionswscso80o8wuA8YhFskf3cSPoRi3.MPlcggmYPqcddu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p><strong>О себе : Живу в Москве.</strong></p>\r\n\r\n<ul>\r\n\t<li>Идеалист</li>\r\n\t<li>Трудоголик со стажем</li>\r\n\t<li>Перфекционист</li>\r\n\t<li>Не работаю в офисах&nbsp;</li>\r\n</ul>\r\n\r\n<p><strong>Template Engine</strong></p>\r\n\r\n<ul>\r\n\t<li>Jade</li>\r\n\t<li>Jinja</li>\r\n\t<li>Handlebars</li>\r\n</ul>\r\n\r\n<p><strong>PreProccesors</strong></p>\r\n\r\n<ul>\r\n\t<li>SASS</li>\r\n\t<li>Stylus</li>\r\n\t<li>LESS</li>\r\n</ul>\r\n\r\n<p><strong>JS</strong></p>\r\n\r\n<ul>\r\n\t<li>Backbone</li>\r\n\t<li>React</li>\r\n\t<li>Riot</li>\r\n</ul>\r\n\r\n<p><strong>Software:</strong></p>\r\n\r\n<ul>\r\n\t<li>Mac OS X 10.11.3</li>\r\n\t<li>Intellij IDEA 15</li>\r\n\t<li>Wordpress Calypso (Для любителей работать с Wordpress)</li>\r\n\t<li>Zeplil</li>\r\n</ul>\r\n\r\n<p>Навыки</p>\r\n\r\n<p><a href="http://brainstorage.me/torinasakura/recommendations?tags=frontend" title="frontend">frontend</a></p>\r\n\r\n<p>2</p>\r\n\r\n<p><a href="http://brainstorage.me/torinasakura/recommendations?tags=team+lead" title="team lead">team lead</a></p>\r\n\r\n<p>0</p>\r\n\r\n<p><a href="http://brainstorage.me/torinasakura/recommendations?tags=python" title="python">python</a></p>\r\n\r\n<p>0</p>\r\n\r\n<p><a href="http://brainstorage.me/torinasakura/recommendations?tags=node.js" title="node.js">node.js</a></p>\r\n\r\n<p>0</p>\r\n\r\n<p><a href="http://brainstorage.me/torinasakura/recommendations?tags=react.js" title="react.js">react.js</a></p>\r\n\r\n<p>0</p>\r\n\r\n<p><a href="http://brainstorage.me/torinasakura/recommendations?tags=javascript" title="javascript">javascript</a></p>\r\n\r\n<p>0</p>\r\n\r\n<p><a href="http://brainstorage.me/torinasakura/recommendations?tags=backbone.js" title="backbone.js">backbone.js</a></p>\r\n\r\n<p>0</p>\r\n\r\n<p><a href="http://brainstorage.me/torinasakura/recommendations?tags=django" title="django">django</a></p>', NULL, 'skype :torin.asakura', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Василевич Татьяна', 'василевич татьяна', 'mvpress@mail.ru', 'mvpress@mail.ru', 0, '8qbg3gd7mr4swwwk00k8c8wk804wg88', '$2y$13$8qbg3gd7mr4swwwk00k8cuitykVg96kDH.BElkp5ZBclvFmB2VExa', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>Дизайнер</p>', NULL, 'skype : dvoeznik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Певцов Михаил', 'певцов михаил', 'mih.born@gmail.com', 'mih.born@gmail.com', 0, 'lmtwqlstkw00s88cws8s4c80wcwsccw', '$2y$13$lmtwqlstkw00s88cws8s4OzuiPoW3VQJNeEtaeGO9ImuGjwNVJxjC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>&nbsp;проектировка пользовательских интерфейсов (прототипы статические и динамические), web дизайн, дизайн мобильных приложений, дизайн цифровых интерфейсов. При необходимости могу делать сайты под ключ (есть опытная команда разработки).</p>', NULL, 'skype :mihael.born', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Елупова Юлия', 'елупова юлия', 'revoletta@ya.ru', 'revoletta@ya.ru', 0, '801rc2189xwc0wkw0w8gkcscgkkgckw', '$2y$13$801rc2189xwc0wkw0w8gkODd09OTs4yanVQTnc6FlauZvUOxgJTaK', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Россия Москва</p>\r\n\r\n<p>Умею жить в позитиве, веселая добродушная девушка с позитивным настроением.</p>\r\n\r\n<p>Проффесионально занимаюсь&nbsp;видео-инфографикой, 3D-видео, статичной инфографикой, презентаций, макеты для полиграфии</p>', NULL, 'skype :revoletta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Деречин Кирилл', 'деречин кирилл', 'SinnerKirill@yandex.ru', 'sinnerkirill@yandex.ru', 0, 'rnjqoorbzlcsw0s4k4o0co44gcskc8o', '$2y$13$rnjqoorbzlcsw0s4k4o0ceop2Nqqyqa3LhdYvNjxDYo5Mx8ix3.6i', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>копирайтер</p>', NULL, 'skype :Sinner-lance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Грачиков Валерий', 'грачиков валерий', 'valgr@bk.ru', 'valgr@bk.ru', 0, 'teoed9zcc9c84k0sowowkgosko0kwoc', '$2y$13$teoed9zcc9c84k0sowowke2fJ5rJu/FwBOhi.i/HD/HwAamCvjlrS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>написание текстов</p>', NULL, 'skype: valerongrach', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Калинин Михаил', 'калинин михаил', 'hello@mkalinin.ru', 'hello@mkalinin.ru', 0, '3px4awj89tq8ossgs8808cokwsg8kw0', '$2y$13$3px4awj89tq8ossgs8808OvoDzxaJUP4A/7WWhLRbagBJDkrKrzva', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>проектированиет страниц, дизайн, редизайн, верстка</p>', NULL, 'skype: Kalinin__M (два подчеркивания', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Синкевич Кирилл', 'синкевич кирилл', 'mail@frexin.ru', 'mail@frexin.ru', 0, 'r67n55eekusso0coccw4g8wc8wcwk08', '$2y$13$r67n55eekusso0coccw4guIZP7fSc3f6PHC.KSXg0ZAH63ZKX/vkm', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Я профессионально занимаюсь веб-разработкой уже более восьми лет. За это время мной был накоплен огромный опыт в проектировании, создании и поддержке проектов из самых разных предметных областей и уровней сложности. Сегодня я рад предложить весь этот опыт и свои знания вам. Я оказываю услуги по разработке новых проектов, поддержке существующих, консалтингу и рекрутингу.</p>\r\n\r\n<p>В сферу моей основной компетенции входит создание сервисов, сайтов, интернет-магазинов, программных модулей, API и прочих решений. При этом я говорю о разработке полного цикла, которая включает программирование backend, frontend, верстку и администрирование. В общем всё, за исключением дизайна. Более подробно узнать о моем опыте, используемых языках и технологиях вы можете из моего резюме.</p>\r\n\r\n<p>Разработка сайтов, сервисов, интернет-магазинов, плагинов, API и т.д &nbsp;( yii / yii 2, laravel, symfony, zend фраймворк для php</p>', NULL, 'skype: frexin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Костромской Владимир', 'костромской владимир', 'deeesign@mail.ru', 'deeesign@mail.ru', 0, 'sczim6n4ri8w8ckgcg4okwcww0c0wg', '$2y$13$sczim6n4ri8w8ckgcg4okuaZhn1OMWIJXIQsCvQcuY7YHnuTxBtx6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>Вэб дизайн, сайт под ключ, графический дизайн.</p>', NULL, 'skype: kostromitsky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'Грязнов Илья', 'грязнов илья', 'rayformxx@gmail.com', 'rayformxx@gmail.com', 0, 'dstk996hb1ssggsg8kswogwwgcoo4oo', '$2y$13$dstk996hb1ssggsg8kswoeFKj842IwbUyvjjNEl/XBB4VuUy6ii1y', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>графическое оформление от рекламного плаката до дизайна сайта. Также работаю в adobe after effects, делаю шейповую графику, анимацию.</p>', NULL, 'skype: milky1way', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'Беглецов Володя', 'беглецов володя', 'vova@vova-beg.ru', 'vova@vova-beg.ru', 0, 'o6hcft8g7uo4gkok00cggcgg0kkckk4', '$2y$13$o6hcft8g7uo4gkok00cggOg.DuQw/73c.5rBSuAcEXavCNKtkNjg2', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>&nbsp;разработкой сайтов на движке 1С Битрикс и ModX Evo, начиная с готового макета дизайна.&nbsp;</p>\r\n\r\n<p>Сайт портфолио :&nbsp;http://vova-beg.ru/raboti/</p>\r\n\r\n<p>Разработка</p>\r\n\r\n<ul>\r\n\t<li>Занимаюсь разработкой прикладных программ и сайтов.</li>\r\n\t<li>Оказываю консультации в области технической реализации какой-либо идеи.</li>\r\n\t<li>Люблю необычные проекты. Они заводят, изменяют мышление, заставляют развиваться.</li>\r\n\t<li>95% задач реализуемы, вопрос лишь во времени и бюджете.</li>\r\n\t<li>Разработки делаю по техническому заданию (ТЗ) или по пожеланиям заказчика, результатом которых так же является ТЗ.</li>\r\n</ul>\r\n\r\n<p>Сертификаты</p>\r\n\r\n<p><a href="http://vova-beg.ru/files_image/233.pdf">1С-Битрикс. Элементы управления (обучающий курс)</a></p>\r\n\r\n<p><a href="http://vova-beg.ru/files_image/234.pdf">1С-Битрикс. Контент-менеджер</a></p>\r\n\r\n<p><a href="http://vova-beg.ru/files_image/232.pdf">1С-Битрикс. Администратор корпоративного портала</a></p>', NULL, 'skype: vova-beglecov', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'Москаленко Яна', 'москаленко яна', 'ianamoor17@gmail.com', 'ianamoor17@gmail.com', 0, '93zxbebhbo08o0kocsgc48ssg00sc04', '$2y$13$93zxbebhbo08o0kocsgc4u7zIAoBfz0jwOTv0PoqZkdE.zQ4bcR1G', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>web design, mobile design, ui/ux, Рисую интерфейсы</p>', NULL, 'skype: iana_moor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'Орел Эдуард', 'орел эдуард', 'EDITART@MAIL.RU', 'editart@mail.ru', 0, '2raxp6evw7eossko0s4c0848kk80wgs', '$2y$13$2raxp6evw7eossko0s4c0u849/naWOt20G3P/9oSWFoTVwgv1ceJ6', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>10 лет опыта работы в сфере дизайна.</p>\r\n\r\n<p><em>Качество, идейность, любовь к деталям, лояльная ценовая политика, ответственность, скорость исполнения поставленной задачи, постоянный он-лайн - это то, что Вам нужно, это то, что я могу Вам предоставить.</em><br />\r\n<br />\r\n<strong>Профессиональные навыки:</strong></p>\r\n\r\n<ul>\r\n\t<li><em>полиграфический дизайн</em></li>\r\n\t<li><em>фирменный стиль</em></li>\r\n\t<li><em>дизайн сайтов</em></li>\r\n\t<li><em>дизайн наружной рекламы</em></li>\r\n\t<li><em>разработка логотипов/знаков/эмблем/гербов</em></li>\r\n\t<li><em>дизайн презентаций</em></li>\r\n\t<li><em>разработка иконок</em></li>\r\n\t<li><em>дизайн упаковки</em></li>\r\n\t<li><em>брендинг</em></li>\r\n\t<li><em>векторная графика</em></li>\r\n\t<li><em>дизайн выставочных стендов</em></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', NULL, 'TEL. +38 067 621 97 98 > SKYPE - EDMIXED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Попов Михаил', 'попов михаил', 'mikhail.popov.90@bk.ru', 'mikhail.popov.90@bk.ru', 0, 'rla4r8ngyrk0sos4cwo4cww08ccs0ws', '$2y$13$rla4r8ngyrk0sos4cwo4cu/xs8fE6zQB309kueDHgad7WJtN4D8x6', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>Разработкой логотипов, визиток и всего фирменного стиля.&nbsp;</p>', NULL, 'skype: mishanya199030', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Коваль Андрей', 'коваль андрей', 'andrey.koval@digitalpromo.com.ua', 'andrey.koval@digitalpromo.com.ua', 0, 'd21wu8qx2rk0koo0kk4s00w80gow8wo', '$2y$13$d21wu8qx2rk0koo0kk4s0uj7J.2ODOUsPJ4BIUCYn5AMRcY1VCxCC', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<ul>\r\n\t<li>Готовые решения для служб такси</li>\r\n\t<li>Клиентские приложения под EvoS</li>\r\n\t<li>Разработка и внедрение систем CRM</li>\r\n\t<li>Разработка сайтов на 1С-Битрикс: Управление сайтом\r\n\t<p>создание сайтов на 1с-битрикс</p>\r\n\t</li>\r\n\t<li>Разработка дизайна для сайтов и приложений</li>\r\n\t<li>Разработка мобильных приложений под Android</li>\r\n\t<li>Разработка мобильных приложений под iOS</li>\r\n\t<li>СЕО оптимизация и продвижение\r\n\t<p>продвижение сайта, сео оптимизация</p>\r\n\t</li>\r\n\t<li>Контекстная реклама</li>\r\n</ul>\r\n\r\n<p>Портфолио&nbsp;http://digitalpromo.com.ua/</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'Иванов Дмитрий', 'иванов дмитрий', 'cruisermissile@gmail.com', 'cruisermissile@gmail.com', 0, 'np8b8tqfzu8ooswcko4goo0oo4sg880', '$2y$13$np8b8tqfzu8ooswcko4goeUCg4Ba2DmeMvQ/CrW9Pv9Fpu7.7RJGG', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Живу в Ростове на Дону. Делаю технический дизайн (ретушь изображений, коллаж, иллюстрации, иконки, инфографика, векторные изображения и пр.), веб-дизайн, брендинг (логотипы, фирменные стили), полиграфия (визитки, брошюры, постеры и т.д. кроме многостраничной, хотя ее тоже умею делать, но малоинтересно т.к. работа такого формата слишком рутинна).</p>\r\n\r\n<p>портфолио:&nbsp;https://www.behance.net/korrektor</p>\r\n\r\n<h3>ФОКУС</h3>\r\n\r\n<p><a href="https://www.behance.net/search?field=44" title="Графический дизайн">Графический дизайн</a>,&nbsp;<a href="https://www.behance.net/search?field=48" title="Иллюстрация">Иллюстрация</a>,&nbsp;<a href="https://www.behance.net/search?field=109" title="Бренды">Бренды</a></p>\r\n\r\n<h4><strong>Жизненная позиция</strong></h4>\r\n\r\n<p><a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9%20%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD">графический дизайн</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D1%82%D0%B5%D1%85%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD%20%D0%B8%20%D0%B2%D1%81%D1%8F%D0%BA%D0%B8%D0%B9%20%D1%80%D0%B0%D0%B7%D0%BD%D1%8B%D0%B9%20%D0%B4%D1%80%D1%83%D0%B3%D0%BE%D0%B9%20%28%D0%BA%D1%80%D0%BE%D0%BC%D0%B5%20%D0%BF%D1%80%D0%BE%D0%BC%D1%8B%D1%88%D0%BB%D0%B5%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE">техдизайн и всякий разный другой (кроме промышленного</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%BC%D0%B5%D0%B1%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B8%20%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD%D0%B0%20%D0%BE%D0%B4%D0%B5%D0%B6%D0%B4%D1%8B%29">мебельного и дизайна одежды)</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD%D0%B5%D1%80">дизайнер</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=x177">x177</a></p>\r\n\r\n<p>Интересы:</p>\r\n\r\n<p><a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%A2%D0%B5%D1%85%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD">Техдизайн</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%BF%D0%BE%D0%BB%D0%B8%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D1%8F">полиграфия</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%BB%D0%BE%D0%B3%D0%BE%D1%82%D0%B8%D0%BF">логотип</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D1%84%D0%B8%D1%80%D1%81%D1%82%D0%B8%D0%BB%D1%8C">фирстиль</a>,<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%B8%D0%BB%D0%BB%D1%8E%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D0%B8">иллюстрации</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%B8%D0%BA%D0%BE%D0%BD%D0%BA%D0%B8">иконки</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%B1%D0%B0%D0%BD%D0%BD%D0%B5%D1%80%D1%8B">баннеры</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%BA%D0%BE%D0%BB%D0%BB%D0%B0%D0%B6%D0%B8">коллажи</a>,<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D1%80%D0%B5%D1%82%D1%83%D1%88%D1%8C">ретушь</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%B2%D0%B5%D0%B1-%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD">веб-дизайн</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD%D0%B5%D1%80">дизайнер</a>,&nbsp;<a href="http://vk.com/search?c[name]=0&amp;c[section]=people&amp;c[q]=x177">x177</a></p>', NULL, 'skype : g.eisenhorn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'Пауль (Пауль маул)', 'пауль (пауль маул)', 'webinfo@wbm-pm.ru', 'webinfo@wbm-pm.ru', 0, 'hiusweqikgg8o8sc8w4c0o0oog0o4k0', '$2y$13$hiusweqikgg8o8sc8w4c0ezETqd6CO.42n0CFhDrj3qyzF7qIhZDe', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>Paul Maul - это мой сетевой псевдоним под ним и работаю, уже не одну пятилетку, в т.ч. и пока работал в студии, т.к. я самостоятельно работаю лишь последние года 3 примерно, а в реальной жизни Пауль, Россия, г.Екатеринбург.<br />\r\n&nbsp;специализируюсь на:<br />\r\n- SEO<br />\r\n- SMO<br />\r\n- Webmastering<br />\r\n- Сборка сайтов<br />\r\n- Раскрутка и любая реклама в интернете<br />\r\n1) avtovazsalon.ru - полностью переделывался шаблон, переписывал и дополнял сайт новыми текстами, размещал ссылки и др.<br />\r\n&nbsp;&nbsp;2) sport-2015.ru - полностью переделывался шаблон и запускал рекламную кампанию на 1 или 2 месяца примерно.<br />\r\n&nbsp;&nbsp;3) profitmn72.ru - полностью переделывался шаблон, периодически раз в 1-2 месяца для этого сайта провожу какие-то мелко-срочные правки и др.<br />\r\n&nbsp;&nbsp;4) yamaluraldel.ru - создавался с нуля и продвигался мной 1 месяц примерно&nbsp;</p>\r\n\r\n<p>фраймворк для php -&nbsp;WordPress</p>', NULL, 'skype: wbm.pm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Чуль Андрей Дмитриевич', 'чуль андрей дмитриевич', 'andymitrich@gmail.com', 'andymitrich@gmail.com', 0, 'rrdq8oscpz40oc0wkow8gkowoswc4wo', '$2y$13$rrdq8oscpz40oc0wkow8ge2G/IzzEQSz/1/ViPDpsKkPLXH82N6TS', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Я профессиональный программист на&nbsp;<strong>php</strong>&nbsp;и&nbsp;<strong>python</strong>. Опыт работы - более пяти лет. Люблю качественный код, стараюсь избегать костылей.<br />\r\nВладею:<br />\r\n-&nbsp;PHP5, Python 2/3,&nbsp;SQL, JavaScript.<br />\r\nPHP-фреймворки: Yii, Symfony 2.<br />\r\nPython-фреймвоорки: Django, Flask.<br />\r\nJS-фреймворки: jQuery, знаком с node.js, angular.js, backbone.js.<br />\r\nБД: MySQL, знаком с PostgreSQL.<br />\r\nКэширование: memcached.<br />\r\nNoSQL: знаком с MongoDB и Redis.<br />\r\nШаблонизаторы: Twig, Smarty, Jinja, Jade, EJS.<br />\r\nТестирование: phpUnit + Selenium, знаком с TDD, BDD.<br />\r\nVCS: svn/git/mercurial + опыт командной разработки.<br />\r\n<br />\r\nПлюс к этому имею глубокие знания в теории алгоритмов, ООП, паттернах проектирования; обладаю хорошими навыками оптимизации и рефакторинга кода.</p>\r\n\r\n<p>Ссылки</p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp;<a href="https://github.com/andymitrich/" target="_blank">https://github.com/andymitrich/</a>&nbsp;портфолио</p>\r\n\r\n<p>&nbsp;Любой backend на PHP, Python. Алгоритмы Machine Learning, Data MIning</p>\r\n\r\n<p>фраимворк для php -&nbsp;Yii, Symfony 2</p>', NULL, 'skype: andymitrich', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Смирнов Евгений', 'смирнов евгений', 'eusmirnov51@gmail.com', 'eusmirnov51@gmail.com', 0, 'nty6tqch9vk4o4s8gwks04c4wssgk4g', '$2y$13$nty6tqch9vk4o4s8gwks0u0IIJM4RpWA8R7NVuX4WgJYJh5bWPrka', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p dir="ltr">Смирнов Евгений, Россия, г. Воронеж, заканчиваю обучение в Воронежском Государственном Университете, факультет компьютерных наук.</p>\r\n\r\n<p dir="ltr"><a href="http://povezet36.ru/" target="_blank">povezet36.ru</a>,&nbsp;<a href="http://nagornaya.me/" target="_blank">nagornaya.me</a>,&nbsp;<a href="http://kafedraspace.ru/" target="_blank">kafedraspace.ru</a>, реальнаяшкола.рф</p>\r\n\r\n<p dir="ltr">Меня зовут Смирнов Евгений, занимаюсь&nbsp;<br />\r\nсозданием сайтов самых разных тематик.<br />\r\n<br />\r\nОсновные преимущества:<br />\r\n&bull; соблюдение сроков выполнения задачи<br />\r\n&bull; доступность в указанное рабочее время и не только<br />\r\n&bull; выполнение задачи лучше, чем Вы предполагали<br />\r\n&bull; участие в жизни проекта даже после сдачи<br />\r\n<br />\r\nЯ могу предложить:<br />\r\n&bull; Сайты &quot;под ключ&quot;<br />\r\n&bull; Верстка готовых макетов<br />\r\n&bull; Установка и настройка CMS (WordPress, Joomla, DLE и т.д.)<br />\r\n&bull; Хостинг игровых серверов (а также их настройка)</p>\r\n\r\n<p>Ссылки</p>\r\n\r\n<ul>\r\n\t<li><a href="http://eusmirnov.ru/">eusmirnov.ru/</a></li>\r\n</ul>\r\n\r\n<p>Профессиональные навыки</p>\r\n\r\n<ul>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bhtml%5D">html</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bcss%5D">css</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bphp%5D">php</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bjavascript%5D">javascript</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bcms%5D">cms</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bwordpress%5D">wordpress</a></li>\r\n</ul>', NULL, 'skype:sevgeny8564', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Оганян Алик Манукович', 'оганян алик манукович', 'alik.oganyan@gmail.com', 'alik.oganyan@gmail.com', 0, 'terk6x4ify84w848wo4wwsgs8w4wswc', '$2y$13$terk6x4ify84w848wo4wweTGIqk/8NN1SqFmi/m.p83mQa70gDHUS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>Оганян Алик Манукович, Армения/Ереван, мне 22 года я более 3 лет занимаюсь web разработкой любой сложности&nbsp;</p>\r\n\r\n<p>Портфолио</p>\r\n\r\n<p><a href="http://brainstorage.me/alikohanyan/recommendations/" target="_blank">http://brainstorage.me/alikohanyan/recommendations/</a><br />\r\n<a href="https://www.fl.ru/users/alikoganyan/opinions/" target="_blank">https://www.fl.ru/users/alikoganyan/opinions/</a><br />\r\n&nbsp;&bull; PHP: Yii2, Laravel, CodeIgniter, CakePHP, Phalcon :<br />\r\n&bull; JavaScript: AngularJS, JQuery, Node.js, Grunt.js, Gulp.js&nbsp;<br />\r\n&bull; CSS: Bootstrap, Less, Sass&nbsp;<br />\r\n&bull; API: Facebook, twitter, google(youtube), Steam, VK, Instagram , Yandex, Robokassa, PayPal, RESTful API и многое другое.&nbsp;<br />\r\n&bull; GIT, Bitbucket<br />\r\nНа каких фраимворках пишите для PHP? Если да тогда пишите&nbsp;<br />\r\nYii2, Laravel, CodeIgniter, CakePHP, Phalcon</p>', NULL, 'skype: alik.oganyan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Долганов Николай', 'долганов николай', 'ip.dolganov.nn@gmail.com', 'ip.dolganov.nn@gmail.com', 0, '1f7vja9kyov4cco0sckww88wkgog4c8', '$2y$13$1f7vja9kyov4cco0sckwwuSZNrN8VMBN2/yERmZw5JsC8mA8OwSOu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>Оказываю услуги по разработке и сопровождению программных продуктов. Работаю с Python: Django, Flask, PyQt. Для ваших Web-приложений возможно использование Angular.js, Backbone.js и других фреймворков. Сервер может быть настроен в соответствии с концепцией непрерывной интеграции (Git, Jenkins), оснащён дополнительными решениями для управления файлами, потоками, данными (Tornado, Celery, Redis, Gulp и другие решения из семейства node.js &amp; npm-based packages). Работаю с HTML5, CSS3 по вашему желанию или по потребности. Возможно использование БЭМ-like методологий именования селекторов, либо LESS CSS, SaSS и т.д.Живу в Хабаровскке<br />\r\n<br />\r\nПроизвожу разработку парсеров сторонних ресурсов под ключ (Scrapy, PyQt + requests, Celery).<br />\r\n<br />\r\nРаботаю с такими ORM, как Peewee, SQLAlchemy, Django ORM (при необходимости ускорить разработку внедрением Django проекта - с использованием методов оптимизации запросов по необходимости).</p>\r\n\r\n<p>Профессиональные навыки</p>\r\n\r\n<p>web-программирование, вёрстка. Backend, Frontend, Fullstack. &nbsp;PHP: Silex<br />\r\nPython: Django<br />\r\nJS: Angular.js, Backbone.js<br />\r\nCSS: Sass/Compass</p>', NULL, 'skype: sirnikolasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'Кулистов Сергей', 'кулистов сергей', 'sergey@kulistov.com', 'sergey@kulistov.com', 0, '7gqt85mtwn8ko840o8sowg0ockw8ggk', '$2y$13$7gqt85mtwn8ko840o8sowePAQL7q7nzhLu3LHWoDEU2v5jA5Rl/ju', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Живу в городе Иваново.</p>\r\n\r\n<p>Дизайн<br />\r\n<br />\r\nПривет, меня зовут Сергей и я обожаю то, чем занимаюсь. Отдаюсь работе по полной.<br />\r\nПортфолио &mdash;&nbsp;<a href="http://kulistov.com/" rel="nofollow">http://kulistov.com</a></p>\r\n\r\n<p>Ссылки</p>\r\n\r\n<ul>\r\n\t<li><a href="http://kulistov.com/">kulistov.com</a></li>\r\n\t<li><a href="http://kulistov.tumblr.com/">kulistov.tumblr.com/</a></li>\r\n\t<li><a href="http://dribbble.com/Kulistov">dribbble.com/Kulistov</a></li>\r\n\t<li><a href="http://revision.ru/a/kulistov">revision.ru/a/kulistov</a></li>\r\n</ul>\r\n\r\n<p>Профессиональные навыки</p>\r\n\r\n<ul>\r\n\t<li>digital</li>\r\n\t<li>illustration</li>\r\n\t<li>web design</li>\r\n\t<li>flat</li>\r\n\t<li>logo</li>\r\n\t<li>branding</li>\r\n\t<li>art direction</li>\r\n\t<li>web</li>\r\n</ul>', NULL, 'skype: sergey_kulistov', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'Кропоткин Данила', 'кропоткин данила', 'jkorme@yandex.ru', 'jkorme@yandex.ru', 0, 'so8v5amuunkogw40sc08soss44g88oc', '$2y$13$so8v5amuunkogw40sc08sekO0wXqIDPhaR.t3SOih31nQfxbbCwiy', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>Здравствуйте! Меня зовут Данила Кропоткин. Живу в Москве. Общительный, позитивный человек.&nbsp;</p>\r\n\r\n<p>Мое портфолио:&nbsp;https://www.behance.net/danilakropotkin</p>\r\n\r\n<p>Я занимаюсь веб-дизайном 3 года. Сейчас активно развиваюсь в области<strong>UI/UX</strong>&nbsp;дизайна. Занимаюсь&nbsp;<strong>проектированием, дизайном сайтов и мобильных интерфейсов</strong>. Ответственно и бережно отношусь к срокам, внимателен к деталям и мелочам.&nbsp;</p>', NULL, 'skype: jkoroed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Данилов Даниил', 'данилов даниил', 'rozenleft@gmail.com', 'rozenleft@gmail.com', 0, '39j6raz7lxgk84osco0wwwgokswsg8s', '$2y$13$39j6raz7lxgk84osco0wwuP.dKgIYmPKLtWZWfgJ6L2y6a1bV3pbK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>Портфолио нет !!! Не дает....</p>\r\n\r\n<p>разработка&nbsp;приложений&nbsp;на платформе Microsoft .NET Framework. (С#) &nbsp;WPF, WCF, ADO.NET Entity</p>\r\n\r\n<p>Framework, XML, ASP.NET.&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>Специализируюсь, на разработке приложение на платформе .NET Framework. (С#)</li>\r\n</ul>\r\n\r\n<p>WPF, WCF, ADO.NET Entity Framework, XML, ASP.NET.&nbsp;<br />\r\n<br />\r\n- Бизнес ПО&nbsp;<br />\r\n<br />\r\n- Информационно-справочное ПО&nbsp;<br />\r\n<br />\r\n- Производственное ПО&nbsp;<br />\r\n<br />\r\n- Построители отчётов&nbsp;<br />\r\n<br />\r\n- Инженерно-исследовательское&nbsp;<br />\r\n<br />\r\n- Торговое ПО&nbsp;<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>Написание требований к ПО, ТЗ и UIRD. (Результат написания UIRD - sketch user interface diagrams с подробным описанием)</li>\r\n</ul>\r\n\r\n<p>Профессиональные навыки</p>\r\n\r\n<ul>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bc%23%5D">c#</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bwpf%5D">wpf</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bwcf%5D">wcf</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bmvvm%5D">mvvm</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Bc%23+winforms%5D">c# winforms</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5B%D0%BF%D1%80%D0%BE%D1%82%D0%BE%D1%82%D0%B8%D0%BF%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%5D">прототипирование</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5Buird%5D">uird</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5B%D0%BD%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5+%D1%82%D0%B7%5D">написание тз</a></li>\r\n\t<li><a href="http://freelansim.ru/freelancers?q=%5B.net%5D">.net</a></li>\r\n</ul>', NULL, 'skype: danila.danilov.174', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'Женя', 'женя', 'sims518@mail.ru', 'sims518@mail.ru', 1, 'sfovaqxeoqoww4o8sogcog4k0ww88g4', '$2y$13$sfovaqxeoqoww4o8sogcoeV4qU3MNhs3mkz5u16zfVV66JO.I8jtm', '2016-03-01 07:25:59', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, '<p>Евгения Бондаренко</p>\r\n\r\n<p>Менеджер на все руки</p>', NULL, '+996555729024, скайп bond_evgeniya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'Бигаева Диана Юрьевна', 'бигаева диана юрьевна', 'bigaevad@gmail.com', 'bigaevad@gmail.com', 0, '15gby0fmh4pw0wkwogwscksgssgw8g4', '$2y$13$15gby0fmh4pw0wkwogwsceZFPTS.whpV2YpJBtdBcTUauwLFmUAUS', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p><u>Основная информация</u>:&nbsp;арт-директор / креативный дизайнер.&nbsp;</p>\r\n\r\n<p><u>Опыт работы</u>&nbsp;более 12 лет.&nbsp;</p>\r\n\r\n<p><u>Образование:</u>&nbsp;МГАХИ им. В.Сурикова, факультет Графики.&nbsp;<br />\r\n<u>Специализация:</u>&nbsp;корпоративный, продуктовый и HR-брендинг.&nbsp;</p>\r\n\r\n<p>Работаю в паре с копирайтером и, если нужно, привлекаю технического дизайнера, программиста, верстальщика, обеспечивая полное сопровождение проекта.&nbsp;</p>\r\n\r\n<p>Все делаем оперативно, качественно и с удовольствием!&nbsp;<br />\r\n<u>Принцип работы:</u>&nbsp;стабильная дизайн-поддержка и неотложная дизайн-помощь.<br />\r\n<u>Портфолио</u>:&nbsp;<a href="https://www.behance.net/didesign" rel="nofollow nofollow" target="_blank">https://www.behance.net/didesign</a></p>\r\n\r\n<p><u>Сайт:</u>&nbsp;<a href="http://l.facebook.com/l.php?u=http%3A%2F%2Fwww.didesign.org%2F&amp;h=7AQHAPxe1&amp;s=1" rel="nofollow nofollow" target="_blank">http://www.didesign.org</a></p>\r\n\r\n<p>По поводу PHP и т.д., программирование не является моей специализацией.</p>\r\n\r\n<p>Я работаю с креативом &ndash; разрабатываю рекламные концепции для<a href="http://www.didesign.org/#!business-directions/c1x6e" target="_blank">&nbsp;основных каналов коммуникации</a>&nbsp;&gt;&gt;</p>\r\n\r\n<p>Если для реализации проекта необходимы сопутствующие направления, выходящие за рамки моих компетенций, я привлекаю специалистов извне.</p>\r\n\r\n<p>Как-то так...</p>\r\n\r\n<p>&nbsp;</p>', NULL, 'skype: diana.bigaeva', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'Главницкий Евгений', 'главницкий евгений', 'eugene@glavnicky.com', 'eugene@glavnicky.com', 0, '9g4dglr0wcg0o8sow8wg8wk4ok8o4kg', '$2y$13$9g4dglr0wcg0o8sow8wg8uLUNUaXWevINFCfTx3/JxECrSYBR5EfK', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '<p>Москва</p>\r\n\r\n<p>Дизайн сайтов: корпоративных, новостных, интернет-магазины и т.п.</p>\r\n\r\n<p>http://webgram.co/glavnicky</p>\r\n\r\n<p>Специализация:&nbsp;&nbsp;<a href="https://www.fl.ru/freelancers/razrabotka-sajtov/">Разработка сайтов</a>&nbsp;/&nbsp;<a href="https://www.fl.ru/freelancers/web-dizajner-razrabotka-sajtov/">Дизайн сайтов</a></p>\r\n\r\n<p>Дополнительные специализации:&nbsp;&nbsp;<a href="https://www.fl.ru/freelancers/dizajn/">Дизайн и Арт</a>&nbsp;/&nbsp;<a href="https://www.fl.ru/freelancers/dizayn-interfeysov-prilojeniy/">Дизайн интерфейсов приложений</a>,&nbsp;<a href="https://www.fl.ru/freelancers/razrabotka-sajtov/">Разработка сайтов</a>&nbsp;/&nbsp;<a href="https://www.fl.ru/freelancers/razrabotchik-wap-pda-sajtov/">Wap/PDA-сайты</a>,&nbsp;<a href="https://www.fl.ru/freelancers/dizajn/">Дизайн и Арт</a>&nbsp;/<a href="https://www.fl.ru/freelancers/dizajner-logotipov/">Логотипы</a></p>\r\n\r\n<p>Опыт работы:&nbsp;&nbsp;8 лет</p>\r\n\r\n<p><strong>МОИ ПРИНЦИПЫ РАБОТЫ</strong>&nbsp;<br />\r\n<br />\r\nДелаю упор на правильность и удобность восприятия информации на сайте. В активе более 300 реализованных дизайнов сайтов. Подробнее можно прочесть на вкладке &laquo;Информация&raquo;, либо по ссылке:&nbsp;<strong><a href="https://goo.gl/EUHSBC" rel="nofollow" target="_blank" title="https://goo.gl/EUHSBC">goo.gl/EUHSBC</a></strong>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, 'skype: glavnicky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- 
-- Вывод данных для таблицы issue
--
INSERT INTO issue VALUES
(38, 'Использовать систему!', '<p>Необходимо использовать данную систему находить в ней те моменты которые являются нелогичными и ставить задачи на их устранение</p>', 4, 7, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 1, NULL, '2011-01-01 00:00:00', 4, 1),
(39, 'Использовать систему', 'Необходимо использовать данную систему находить в ней те моменты которые являются нелогичными и ставить задачи на их устранение', 4, 8, '2011-01-01 00:00:00', NULL, 1, NULL, NULL, 4, 1),
(40, 'Использовать систему', '<p>Необходимо использовать данную систему находить в ней те моменты которые являются нелогичными и ставить задачи на их устранение</p>', 4, 9, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 1, NULL, '2011-01-01 00:00:00', 4, 1),
(41, 'Сделать редирект', '<p>после создания задачи обратно в проект</p>\r\n\r\n<ol>\r\n\t<li>после создания задачи обратно в проект</li>\r\n\t<li>после создания задачи обратно в проект</li>\r\n\t<li>после создания задачи обратно в проект</li>\r\n</ol>', 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 3, NULL, '2011-01-01 00:00:00', 4, 1),
(42, 'Сделать поле для имени задачи длинее', NULL, 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 3, NULL, '2011-01-01 00:00:00', 4, 1),
(43, 'Сделать красоту при создании задач и проектов', NULL, 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 3, NULL, '2011-01-01 00:00:00', 4, 1),
(44, 'сделать фильтр мои задачи в проекте по умолчанию', '<p>по кнопке все задачи</p>', 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 3, NULL, '2011-01-01 00:00:00', 4, 1),
(47, 'Сделать напоминалки', NULL, 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 1, NULL, '2011-01-01 00:00:00', 4, 4),
(48, 'Сделать повторяющиеся задачи', NULL, 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 1, NULL, '2011-01-01 00:00:00', 4, 3),
(50, 'Вывод доп информации', '<p>Нужно вывести дополнительную информацию в вид проектов чтобы было видно 1. День проекта 2. Количество открытых задач 3. Количество просроченных задач</p>', 4, 4, '2016-01-17 00:00:00', '2011-01-01 00:00:00', 1, NULL, '2011-01-01 00:00:00', 4, 4),
(52, 'Вывести переход к файловой системе', NULL, 4, 4, '2011-01-01 00:00:00', '2016-01-16 23:16:00', 3, NULL, NULL, 4, 1),
(54, 'Сделать сортировщик', '<p>для всех таблиц</p>', 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 3, NULL, '2011-01-01 00:00:00', 4, 1),
(55, 'Делать чтобы при закрытии задачи', '<p>автоматом проставлялась дата закрытия</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 4, 4, '2011-01-01 00:00:00', '2016-01-14 00:00:00', 1, NULL, '2011-01-01 00:00:00', 4, 3),
(56, 'Сделать загрузку на сервер картинок и файлов прямо', NULL, 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 1, NULL, '2011-01-01 00:00:00', 4, 4),
(57, 'Сделать чтобы статус включен выключен пользователь', NULL, 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 3, NULL, '2011-01-01 00:00:00', 4, 1),
(58, 'Сделать чтобы отображение контактов было только то', NULL, 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 3, NULL, '2011-01-01 00:00:00', 4, 1),
(59, 'Приделать Gmail к системе, для уведомлений', '<p>В последующем сделать чтобы можно было читать почту через систему</p>', 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 1, NULL, '2011-01-01 00:00:00', 4, 2),
(60, 'Региональные сайты', '<p>Настроить региональный сайт Самары&nbsp;, чтобы были свои title, дискрипшн и кейворд, а также h1 с названием города и лента новостей Самары вот с этого сайта&nbsp;http://regionsamara.ru/</p>', 4, 4, '2011-01-01 00:00:00', '2011-01-01 00:00:00', 3, 3000, '2011-01-01 00:00:00', 6, 1),
(66, 'Сделать функционал крайний срок, переименовать дату завершения и выводить ее там где надо', NULL, 4, 4, '2016-01-16 19:57:00', '2016-01-16 19:57:00', 1, NULL, '2016-01-16 19:57:00', 4, 3),
(67, 'Слайдер', '<p>Сделать слвайдер на 4-6 катинок на главной странице по центру под горизонтальным меню. Можно использовать это&nbsp;http://www.metizstroy.ru/proizvodstvo.html в конце страницы производство.</p>', 4, 4, '2016-01-17 09:06:00', '2016-01-17 09:06:00', 3, NULL, '2016-01-17 09:06:00', 6, 1),
(68, '4 ряда', '<p>Разместить категории в 4 ряда вместо трех</p>', 4, 4, '2016-01-17 09:10:00', '2016-01-17 09:10:00', 3, NULL, '2016-01-17 09:10:00', 6, 1),
(69, 'Поменять цвет кнопки', '<p>Поменять цвет кнопки на страниче товара во вкладке &quot;Мнения покупателей&quot; и &quot;Задайте вопрос по этому товару&quot;</p>', 4, 4, '2016-01-17 09:12:00', '2016-01-17 09:12:00', 3, NULL, '2016-01-17 09:12:00', 6, 1),
(70, 'Убрать слово"Цена"', '<p>Убрать слово&quot;Цена&quot; на странице товара&nbsp;</p>\r\n\r\n<p>http://www.metizstroy.ru/magazin/bolti-fundamentnie/tip-1-2/bolt-fundamentniy-izognutiy-1-2-gost-24379-1-80.html</p>', 4, 4, '2016-01-17 09:15:00', '2016-01-17 09:15:00', 3, NULL, '2016-01-17 09:15:00', 6, 1),
(71, 'Доступы', '<p>Сайт kontur.expert56.ru</p>\r\n\r\n<p>Админка сайта &nbsp;kontur<br />\r\nПароль &nbsp; &nbsp; &nbsp; &nbsp; OF3dZqQM</p>\r\n\r\n<p>Хостинг&nbsp;<br />\r\nhttp://188.40.65.10:2222/<br />\r\nЛогин&nbsp;&nbsp; &nbsp;: nig517<br />\r\nПароль&nbsp;&nbsp; &nbsp;: TfXDeBhbk</p>\r\n\r\n<p>База данных Имя Базы Данных: nig517_kontur<br />\r\nпользователь nig517_mig_1<br />\r\nпароль &nbsp; OF3dZqQM</p>\r\n\r\n<p>&nbsp;&nbsp; &nbsp;</p>', 4, 4, '2016-01-17 10:01:00', '2016-01-17 10:01:00', 3, NULL, '2016-01-17 10:01:00', 12, 1),
(72, 'Разделы', '<p>Разделы уже созданы в админке сайта. Их нужно привязать к шаблону. &nbsp;</p>', 4, 4, '2016-01-17 10:02:00', '2016-01-17 10:02:00', 3, NULL, '2016-01-17 10:02:00', 12, 1),
(73, 'Банеры', '<p>Банеры по всем продуктам должны быть кликабельны. Ссылки ведут на сайт разработчика и имеют в себе код сервисного центра и регистрация закрепляет пользователя за СЦ. Это &nbsp;важно.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Реферальные ссылки, которые вы можете вшивать в баннеры, тексты своего сайта:</p>\r\n\r\n<p>- для Контур.Эльбы: http://www.e-kontur.ru/?p=0787 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;, где 0787 &nbsp;&ndash; ваш промокод;</p>\r\n\r\n<p>- для Контур.Бухгалтерии: http://www.b-kontur.ru/?p=0787 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;, где 0787 &nbsp;&ndash; ваш промокод.<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 4, 4, '2016-01-17 10:24:00', '2016-01-17 10:24:00', 3, NULL, '2016-01-17 10:24:00', 12, 1),
(74, 'Калькулятор', '<p>Калькулятор расчета стоимости. Инструкция прилагается</p>', 4, 4, '2016-01-17 10:38:00', '2016-01-17 10:38:00', 3, NULL, '2016-01-17 10:38:00', 12, 1),
(75, 'Доплнительные материалы', '<p>Доплнительные материалы для сайта в&nbsp;</p>\r\n\r\n<p>http://files.teamexpert.tk/index.php/apps/files/?dir=%2FKontur#editor</p>', 4, 4, '2016-01-17 10:45:00', '2016-01-17 10:45:00', 3, NULL, '2016-01-17 10:45:00', 12, 1),
(80, 'Разместить материал в раздел сотрудничество', '<p>Материал береш с гринсофта, делаеш его читабельным и чтобы прямо сильно хотелось работать с нами, теперь с нами есть настоящий журналист-редактор зовут ее Галина, ей дадим на уточнение мылей и редактирование данного материала, но нужно чтобы исходный материал был на сайте, чтобы она могла его вычитать</p>', 4, 4, '2016-01-17 12:03:00', '2016-01-17 12:03:00', 1, NULL, '2016-01-17 12:03:00', 5, 3),
(81, 'Подготовить брифи для размещения на сайте', '<p>и разместить его</p>', 4, 4, '2016-01-17 12:15:00', '2016-01-17 12:15:00', 3, NULL, '2016-01-17 12:15:00', 5, 1),
(83, 'Сделать на сайте рубрику прайс листы', '<p>По каждому направлению услуг сделать прайслисты, рубрика с прайслистами будет выывешена на сайте, так чтобы клиенты могли понимать сколько стоят те или иные услуги.</p>\r\n\r\n<p>Также сделать как минимум 5 пакетных предложений. В пакетном предложении должен быть лейдинг, сайт на дле, сайт на вордпресе, магазин на опенкарте</p>\r\n\r\n<p>В каждом пакете должно быть несколько составляющийх 1. Создание сайта, 2.Администрирвоание сайта 3 Контент сайта, Сео сайта. и так далее</p>\r\n\r\n<p>Саты могут быть разделены на сайты одностарничники, товарные сайты, сайты организаций и так далее. Каждый пакет должен быть нацелен на 6 - 12 месяцев сотрудничества, в пакете должен бытьб включена покупа домена и хостинг на соответсвующий период.</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 4, 4, '2016-01-17 12:22:00', '2016-01-17 12:22:00', 1, NULL, '2016-01-17 12:22:00', 5, 3),
(84, 'Стать партнером как минимум 5 ведущих хостинговых компаний', '<p>Разработка разработкой а мы должны деньги с хостинга тоже получать, нужно проситать партнерские предложения хостингов и выбрать и подписаться на те в которых есть ежемесячные выплоты например а не разовая маржа.&nbsp;</p>\r\n\r\n<p>Подготовить список партнеров, взять их банеры для размещения.</p>\r\n\r\n<p>рассмотреть возможность партнерства с вот этой компанией</p>\r\n\r\n<p>https://ru.wix.com/</p>\r\n\r\n<p>это самая популярная и быстрая платформа, на ней можно с огромной скоростью заработать свои деньги на лейдингах которые у нас обязательно будут. (изуть суть вопроса, стать партнером, отчитаться)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 4, 4, '2016-01-17 12:29:00', '2016-01-17 12:29:00', 1, NULL, '2016-01-17 12:29:00', 5, 5),
(85, 'Стать партнерами самых популярныч ЦМС', '<p>В том числе платных, подготовить выбрать перспективное направление</p>', 4, 4, '2016-01-17 12:35:00', '2016-01-17 12:35:00', 1, NULL, '2016-01-17 12:35:00', 5, 1),
(86, 'Персонал', '<p>1. Сделать классификатор персонала который ищем, и соответсвенно классификатор направлений работы и соответсвенно полный спектр оказываемых услуг, который можно поправить на сайте в том числе.</p>\r\n\r\n<p>2. Подготовить анкеты для персонала</p>\r\n\r\n<p>3. Подготовить писма которые нужно будет посылать приглашаемому специалисту, так чтобы он понял что ему предлогают и как ему работать с нами</p>\r\n\r\n<p>4. Найти минимум 50 человек. по всем направлениям</p>\r\n\r\n<p>5. Найти несколько друзей знакомых которые будут ежедневно в начале уделять минимум 2 часа нашему проекту занимаясь продажами и чтением фрилансовых бирж</p>\r\n\r\n<p>6. Сделать список фрилансвых бирж.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 4, 4, '2016-01-17 12:37:00', '2016-01-17 12:37:00', 1, NULL, '2016-01-17 12:37:00', 5, 1),
(89, 'Разработать правила и этапы прохождения заказа', '<p>В правилах должно быть написано кто что делает и на каких этапах, чем дотошнее тем лучше.</p>\r\n\r\n<p>проработать сроки разработки включая саму разработку, тестрирование, размещение на хостинге, внесение материалов на сайт.</p>\r\n\r\n<p>Обязательно должна быть памятка для разработчика и правила на момент принятия заказа.</p>\r\n\r\n<p>в кратце так - разработчик &nbsp;при выполнении заказа должен быть всегда на связи, если его нет на связи 6 часов менеджер обязан передать заказ другому разработчику и соответсвенно деньги тоже. Разработчик взявший заказ обязан отдавать проекту минимум 3 часа в сутки на разработку. Разработчик &nbsp;обязан делать как минимум один комит в корпоративную систему в сутки с материалами которые он разработал, включая букап базы данных. В каждом комите должно быть написано что было сделлано на данном этапе.</p>\r\n\r\n<p>Также нужно продумать обязаности для менеджера.</p>', 4, 4, '2016-01-17 12:52:00', '2016-01-17 12:52:00', 1, NULL, '2016-01-17 12:52:00', 5, 1),
(90, 'Разработать теги специализации  для сотрудников и рейтинг', '<p>Критерии для повышения / понижения репутации фрилансера:</p>\r\n\r\n<ul>\r\n\t<li>участие в opensource, ссылки\r\n\t<ul>\r\n\t\t<li>анализ кода, используемых решений\r\n\t\t<ul>\r\n\t\t\t<li>Есть автосервисы, которые анализируют качество кода</li>\r\n\t\t</ul>\r\n\t\t</li>\r\n\t\t<li>популярность opensource-проектов</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>публикации на habrahabr, stackoverflow, блог</li>\r\n\t<li>время отклика в скайпе в часы, отмеченные самим фрилансером, как рабочие.</li>\r\n\t<li>время выполнения 1 типовой задачи</li>\r\n\t<li><strong>само собой: история работы менеджера с фрилансером.</strong></li>\r\n</ul>', 4, 4, '2016-01-17 13:01:00', '2016-01-17 13:01:00', 1, NULL, '2016-01-17 13:01:00', 4, 3),
(91, 'Внести все категории и ссылки на страницы в меню на сайте teameexpert.tk', NULL, 4, 8, '2016-01-17 13:02:00', '2016-01-17 13:02:00', 3, NULL, '2016-01-17 13:02:00', 5, 1),
(92, 'Разработать совместно с Павлом семантическое ядро стратегию продвижения чтобы не делать лишнего', NULL, 4, 4, '2016-01-17 13:07:00', '2016-01-17 13:07:00', 1, NULL, '2016-01-17 13:07:00', 5, 1),
(93, 'Сделать программу курса и записать курс по html', '<p>Разместить его на сайте и записать курс и разместить его на ютубе</p>', 4, 4, '2016-01-17 13:08:00', '2016-01-17 13:08:00', 1, NULL, '2016-01-17 13:08:00', 5, 1),
(94, 'Зарегестрирвать канал на ютубе', NULL, 4, 4, '2016-01-17 13:09:00', '2016-01-17 13:09:00', 3, NULL, '2016-01-17 13:09:00', 5, 1),
(95, 'Залить весь полезный хлам на сайт', NULL, 4, 4, '2016-01-17 13:10:00', '2016-01-17 13:10:00', 1, NULL, '2016-01-17 13:10:00', 5, 4),
(96, 'Сделать возможность ставить задачу нескольким людям чтобы не дублировать одно и тоже', NULL, 4, 4, '2016-01-17 13:11:00', '2016-01-17 13:11:00', 1, NULL, '2016-01-17 13:11:00', 4, 3),
(97, 'Ознакомиться с системой', NULL, 4, 15, '2016-01-17 14:15:00', '2016-01-17 14:15:00', 1, NULL, '2016-01-17 14:15:00', 4, 1),
(105, 'Развернуть википедию', '<p>Сделать там основные постулаты для новых сотрудников и краткий инструктаж</p>', 4, 4, '2016-01-17 18:32:00', '2016-01-17 18:32:00', 3, NULL, '2016-01-17 18:32:00', 4, 1),
(107, 'Категория', '<p>Создать категорию Болт фундаментный 4.3</p>', 4, 4, '2016-01-18 12:54:00', '2016-01-18 12:54:00', 3, NULL, '2016-01-18 12:54:00', 6, 1),
(108, 'Создать страницу товара', '<p>Создать страницу товара Болт фундаментный 4.3</p>', 4, 4, '2016-01-18 12:55:00', '2016-01-18 12:55:00', 3, NULL, '2016-01-18 12:55:00', 6, 1),
(109, 'ознакомиться с системой', NULL, 4, 10, '2016-01-19 05:44:00', '2016-01-19 05:44:00', 1, NULL, '2016-01-19 05:44:00', 4, 1),
(111, 'сделать статусы у пользователей', NULL, 4, 4, '2016-01-19 07:02:00', '2016-01-19 07:02:00', 1, NULL, '2016-01-19 07:02:00', 4, 2),
(112, 'Заагетировать', '<p>&nbsp;Диму Иванова он же Суров в скайпе</p>\r\n\r\n<p>Репецкого Евгения</p>\r\n\r\n<p>Важинского Александра</p>\r\n\r\n<p>Евегния Вахитова</p>\r\n\r\n<p>Егор Лукянов</p>\r\n\r\n<p>Светачева Екатерина</p>\r\n\r\n<p>Елена прекрасная</p>\r\n\r\n<p>Тарас Шинкарев</p>\r\n\r\n<p>Аня бойко</p>\r\n\r\n<p>Василий &nbsp;скайп&nbsp;vasika8888</p>\r\n\r\n<p>Татьяна из достека</p>\r\n\r\n<p>Виталий Цветков</p>\r\n\r\n<p>Наталья волик</p>\r\n\r\n<p>Степан</p>\r\n\r\n<p>Татьяна прудникова</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 4, 4, '2016-01-19 07:20:00', '2016-01-19 07:20:00', 3, NULL, '2016-01-19 07:20:00', 5, 1),
(113, 'Сделать возможность отслеживать задачи поставленные мной и сроки их исполнения', '<p>&nbsp;</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 4, 4, '2016-01-19 07:32:00', '2016-01-19 07:32:00', 3, NULL, '2016-01-19 07:32:00', 5, 0),
(114, 'Настроить доменное имя и сервер', '<p>Поднять баинд, настроить сервак, залить готовый проект</p>', 4, 4, '2016-01-19 07:39:00', '2016-01-19 07:39:00', 3, NULL, '2016-01-19 07:39:00', 14, 1),
(115, 'Внести подготовленные материалы на сайт', '<p>Материалы будут загружены в филес в папку юнион как только их даст заказчик</p>', 4, 4, '2016-01-19 07:41:00', '2016-01-19 07:41:00', 3, NULL, '2016-01-19 07:41:00', 14, 1),
(116, 'Перенести раздел документы в раздел меню', NULL, 4, 4, '2016-01-19 07:42:00', '2016-01-19 07:42:00', 3, NULL, '2016-01-19 07:42:00', 14, 1),
(117, 'Настроить права пользователей', '<p>Все видят главную, файлы, Википедию</p>\r\n\r\n<p>Админ - видит все</p>\r\n\r\n<p>Менеджер &nbsp;- Команду, Проекты, Клиенты, Контакты</p>\r\n\r\n<p>Мастер видит только только проекты</p>', 4, 4, '2016-01-19 07:52:00', '2016-01-19 07:52:00', 1, NULL, '2016-01-19 07:52:00', 5, 2),
(118, 'Сделать возможность активировать пользователей из системы после регистрации и отключать их тамже', NULL, 4, 4, '2016-01-19 08:00:00', '2016-01-19 08:00:00', 3, NULL, '2016-01-19 08:00:00', 4, 1),
(121, 'быстрые задачи', '<p>Суть: выкидываю задачу на любую тему без указания исполнителя и проекта, любой желающий может написать коммнтарий к заданию и после чего я назначу понравившего исполнителем. также в любой момент я могу включить это задание &nbsp;в какой-то проект.</p>\r\n\r\n<p>http://prntscr.com/9rzzqy</p>\r\n\r\n<p><img alt="" src="http://prntscr.com/9rzzqy" /></p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 4, 4, '2016-01-19 08:56:00', '2016-01-19 08:56:00', 1, NULL, '2016-01-19 08:56:00', 4, 1),
(122, 'Периодичность задач', '<p>Одна и также задача может повторяться каждую неделю! или какой-то другой период! она должна появляться в системе в указнное время</p>', 4, 4, '2016-01-19 08:58:00', '2016-01-19 08:58:00', 1, NULL, '2016-01-19 08:58:00', 4, 3),
(124, 'Развернуть форум', NULL, 4, 4, '2016-01-19 10:32:00', '2016-01-19 10:32:00', 1, NULL, '2016-01-19 10:32:00', 4, 1),
(128, 'Разработать правила работ', NULL, 4, 4, '2016-01-19 10:43:00', '2016-01-19 10:43:00', 1, NULL, '2016-01-19 10:43:00', 5, 4),
(129, 'Сдеать кнопку сделать еще задачу после поставки какой либо', NULL, 4, 4, '2016-01-19 10:44:00', '2016-01-19 10:44:00', 3, NULL, '2016-01-19 10:44:00', 4, 1),
(131, 'Ознакомление с системой', NULL, 4, 18, '2016-02-23 06:34:00', '2016-02-23 06:34:00', 1, NULL, '2016-02-23 06:34:00', 4, 1),
(132, 'Ознакомление с системой', NULL, 4, 18, '2016-02-23 06:37:00', '2016-02-23 06:37:00', 3, NULL, '2016-02-23 06:37:00', 5, 1),
(134, 'Занести в википедию и на сайт, полезные утилиты', '<p>http://vova-beg.ru/instrumenti/</p>', 4, 4, '2016-02-25 14:48:00', '2016-02-25 14:48:00', 3, NULL, '2016-02-25 14:48:00', 5, 1),
(135, 'Изменить ссылку на сайте teamexpert.tk', '<p>Сотрудник Савенко заменить ссылку на портфолио&nbsp;https://freelance.ru/savenko123</p>', 18, 4, '2016-02-25 15:23:00', '2016-02-25 15:23:00', 3, NULL, '2016-02-25 15:23:00', 5, 1),
(136, 'Изменить ссылку на портфолио Долганов Николай', '<p>Убрать ссылку с портфолио !!!!&nbsp;</p>', 18, 4, '2016-02-25 15:29:00', '2016-02-25 15:29:00', 3, NULL, '2016-02-25 15:29:00', 5, 1),
(137, 'Поменять у Костромского портфолио', '<p>Заменить ссылку на портфолио&nbsp;https://freelance.ru/vladimirkos/?work=1360757</p>', 18, 4, '2016-02-25 15:45:00', '2016-02-25 15:45:00', 3, NULL, '2016-02-25 15:45:00', 5, 1),
(138, 'Изменение фото', '<p>У Худякова Николая поменять фото. Взять его из папки в системе</p>', 18, 4, '2016-02-25 16:03:00', '2016-02-25 16:03:00', 3, NULL, '2016-02-25 16:03:00', 5, 1),
(139, 'Занести нового человека', '<p>Занести нового человека Иванова Дмитрия, а так же ссылку портфолио&nbsp;https://www.behance.net/korrektor</p>\r\n\r\n<p>Фото в отдельной папке Худякова Н.</p>', 18, 4, '2016-02-25 16:54:00', '2016-02-25 16:54:00', 3, NULL, '2016-02-25 16:54:00', 5, 1),
(140, 'Редактирование', '<p>Отредактировать Синкевич Кирилла. Занести новые данные посмотрев в систему об нем.</p>', 18, 4, '2016-02-25 17:10:00', '2016-02-25 17:10:00', 3, NULL, '2016-02-25 17:10:00', 5, 1),
(141, 'Добавить Данные Гостюхина Андрея', '<p>Прошу добавить&nbsp;данные Гостюхина Андрея. Посмотреть в системе.</p>', 18, 4, '2016-02-25 17:26:00', '2016-02-25 17:26:00', 3, NULL, '2016-02-25 17:26:00', 5, 1),
(142, 'Изменения', '<p>Прошу изменить фамилию Грязнова на Грознова</p>', 18, 4, '2016-02-25 17:30:00', '2016-02-25 17:30:00', 3, NULL, '2016-02-25 17:30:00', 5, 1),
(143, 'Добавить адресс', '<p>Женя прошу добавать ссылки портфолио на его страницу&nbsp;</p>\r\n\r\n<p>Николай Долганов</p>\r\n\r\n<p>poiskznakov.ru<br />\r\nkwambio.com<br />\r\nuturnfund.com<br />\r\nМожно назвать bookit.kg, хотя я там был на доработках фронтэнд части.</p>', 18, 4, '2016-02-26 04:53:00', '2016-02-26 04:53:00', 3, NULL, '2016-02-26 04:53:00', 5, 1),
(144, 'Занести нового человека', '<p>Прошу занести нового человека Пауля &nbsp;в систеиу и его на сайт. Фото в папке Худяков</p>', 18, 4, '2016-02-26 06:09:00', '2016-02-26 06:09:00', 3, NULL, '2016-02-26 06:09:00', 5, 1),
(145, 'Создание по отдельности людей', '<p>Прошу продумать об том чтобы было быстрее находимость человека в системе. Надо сделать людей чем они занимаются по подпунктам.</p>', 18, 4, '2016-02-26 06:13:00', '2016-02-26 06:13:00', 3, NULL, '2016-02-26 06:13:00', 5, 1),
(146, 'Занесение нового клиента', '<p>Прошу занести нового клиента на сайт Чуль Андрей. Фото в папке</p>', 18, 4, '2016-02-26 09:02:00', '2016-02-26 09:02:00', 3, NULL, '2016-02-26 09:02:00', 5, 1),
(147, 'Внимание!!!!', '<p>Прошу как то продумать о том чтобы вел конкретно заказ не то чтобы менеджер а изготовитель ,&nbsp;</p>\r\n\r\n<p>есть какие то камни которые не в силах знать менеджер а только проффессионал. Работа должна осуществляться на полном доверии между участниками и менеджером.</p>', 18, 4, '2016-02-27 05:39:00', '2016-02-27 05:39:00', 3, NULL, '2016-02-27 05:39:00', 5, 1),
(148, 'Изменить Николая Долганова', '<p>Прошу внести коррективы на Николая Долганова из системы</p>', 18, 4, '2016-02-28 06:32:00', '2016-02-28 06:32:00', 3, NULL, '2016-02-28 06:32:00', 5, 1),
(149, 'Прочитать внимательно и вынести вердикт стоит ли так делать или нет!!!!', '<p>Это предложение одного из участников!!!!!!!!!!!!!!!!</p>\r\n\r\n<p>Смотри, разработку по проектам можно условно разделить на:<br />\r\n- Мелкий фриланс (незначительные задачи)<br />\r\n- Промышленная (конвейерная) разработка<br />\r\n- Разработка под ключ<br />\r\n- Про-фриланс<br />\r\n- Про-аутсорс<br />\r\n- Профессиональная командная разработка.</p>\r\n\r\n<p>&nbsp;</p>', 18, 4, '2016-02-28 11:57:00', '2016-02-28 11:57:00', 3, NULL, '2016-02-28 11:57:00', 5, 1),
(150, 'Внесение новых людей', '<p>Попрошу внести новых людей.</p>\r\n\r\n<p>Кулистов Сергей,</p>\r\n\r\n<p>Орел Эдуард</p>\r\n\r\n<p>Елупова Юлия</p>\r\n\r\n<p>Кропоткин Данила</p>\r\n\r\n<p>Данилов Даниил</p>\r\n\r\n<p>Смирнов Евгений</p>\r\n\r\n<p>Фото их в папке моей.</p>', 18, 4, '2016-02-28 14:49:00', '2016-02-28 14:49:00', 3, NULL, '2016-02-28 14:49:00', 5, 1),
(151, 'Найти 5 Дизайнеров и проработать с ними на счет цены, может быть получить опросный лист (бриф)', '<p>Узнать на сколько они свободны, поделить дизайнеров с Колей и проработать во всем вариантам. Контакты Николая Худякова&nbsp;есть в системе.</p>\r\n\r\n<p>В результате должно получиться или опросные листы для клиента,&nbsp;или цены и сроки на разработку данного интерфейса и текущей страницы.</p>', 4, 48, '2016-03-01 07:26:00', '2016-03-01 07:26:00', 1, NULL, '2016-03-01 07:26:00', 17, 1),
(152, 'Найти 5 Дизайнеров и проработать с ними на счет цены, может быть получить опросный лист (бриф)', '<p>Узнать на сколько они свободны, и проработать по всем вариантам.&nbsp;</p>\r\n\r\n<p>В результате должно получиться или опросные листы для клиента,&nbsp;или цены и сроки на разработку данного интерфейса и текущей страницы.</p>\r\n\r\n<p>Я беру первых 4 из списка :<a href="http://erp.teamexpert.tk/users/22/show">Бульхин Айрат</a>,<a href="http://erp.teamexpert.tk/users/24/show">Василевич Татьяна</a>,<a href="http://erp.teamexpert.tk/users/33/show">Грязнов Илья</a>,<a href="http://erp.teamexpert.tk/users/39/show">Иванов Дмитрий</a>. Остальные 5 Ваши.</p>', 48, 18, '2016-03-01 07:50:00', '2016-03-01 07:50:00', 1, NULL, '2016-03-01 07:50:00', 17, 1),
(154, 'Завести партнеров в хостинге', NULL, 4, 4, '2016-03-06 04:57:00', '2016-03-06 04:57:00', 1, NULL, '2016-03-06 04:57:00', 5, 1),
(155, 'ознакомиться с системой', '<p>Посмотри и другие задачи по этому приложению</p>\r\n\r\n<p>Нужно починить базу данных и выяснить почему ошибка возникла при добавлении юзеров, и почему они не открываются, только при помощи запросов</p>', 4, 11, '2016-03-06 05:20:00', '2016-03-06 05:20:00', 1, NULL, '2016-03-06 05:20:00', 4, 1),
(156, 'Ознакомление с системой', NULL, 4, 11, '2016-03-07 10:36:00', '2016-03-07 10:36:00', 1, NULL, '2016-03-07 10:36:00', 13, 1),
(157, 'Разделить ERP на подсистемы', '<p>На данный момент ERP пытается охватить issue-tracker, crm, а wiki вынесена в MediaWiki.</p>\r\n\r\n<p>Предлагаю реорганизовать:</p>\r\n\r\n<p>В качестве IssueTracker-а выбрать Redmine, который даст:</p>\r\n\r\n<ul>\r\n\t<li>Многофункциональный IssueTracker</li>\r\n\t<li>Браузер внутренних git/svn и пр. репозиториев.</li>\r\n\t<li>Wiki для каждого проекта.</li>\r\n</ul>\r\n\r\n<p>Сделать один проект Redmine публичным, и в ключить в него модуль википедии только.</p>\r\n\r\n<p>MediaWiki - удалить.</p>\r\n\r\n<p>CRM + Личный кабинет + биллинг -- надо писать и интегрировать с Redmine отдельно, через Redmine API.</p>\r\n\r\n<p>Сделать единый центр авторизации, чтобы в нашей системе был только 1 аккаунт для всех сервисов</p>\r\n\r\n<ul>\r\n\t<li>Сделать возможность авторизации через google / yandex.</li>\r\n</ul>', 4, 4, '2016-03-07 10:56:00', '2016-03-07 10:56:00', 1, NULL, '2016-03-07 10:56:00', 4, 1),
(158, 'Настроить переключение языка', NULL, 4, 4, '2016-04-02 10:30:00', '2016-04-02 10:30:00', 3, NULL, '2016-04-02 10:30:00', 17, 0),
(159, 'Привязать права к группам', NULL, 4, 4, '2016-04-02 10:31:00', '2016-04-02 10:31:00', 2, NULL, '2016-04-02 10:31:00', 17, 0),
(160, 'Сделать поиск пользователя', '<p>Сделать поиск пользователя</p>', 4, 4, '2016-04-02 10:32:00', '2016-04-02 10:32:00', 3, NULL, '2016-04-02 10:32:00', 17, 0),
(161, 'Сделать отображение квитанции при загрузке отчета', NULL, 4, 4, '2016-04-02 10:32:00', '2016-04-02 10:32:00', 1, NULL, '2016-04-02 10:32:00', 17, 0),
(162, 'Убрать лишний курс валют', NULL, 4, 4, '2016-04-02 10:35:00', '2016-04-02 10:35:00', 3, NULL, '2016-04-02 10:35:00', 14, 1),
(163, 'Убрать лишний курс валют', NULL, 4, 4, '2016-04-02 10:35:00', '2016-04-02 10:35:00', 1, NULL, '2016-04-02 10:35:00', 14, 0),
(164, 'Внести тексты подготовленные толиком на главную страницу сайта', NULL, 4, 4, '2016-04-02 10:55:00', '2016-04-02 10:55:00', 3, NULL, '2016-04-02 10:55:00', 17, 0),
(165, 'Сделать магазин по прожаде софта - систем управления сайтами', NULL, 4, 4, '2016-04-02 16:08:00', '2011-01-01 00:00:00', 1, NULL, '2011-01-01 00:00:00', 5, 1),
(168, 'Доделать Суперлатив', NULL, 4, 4, '2016-04-02 17:07:51', NULL, 1, NULL, NULL, 18, 0),
(169, 'Развернуть репозиторий для работы', NULL, 4, 4, '2016-04-02 17:47:26', NULL, 1, NULL, NULL, 4, 2),
(170, 'Сделать быстрый поиск исполнителя в проектах erp и ereport', '<p>&nbsp;</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 4, 4, '2016-04-02 17:52:16', '2016-04-02 17:51:00', 1, NULL, '2016-04-02 17:51:00', 4, 1),
(171, 'Сделать чтобы в проекте задачи сортировались согласно приоритету', NULL, 4, 4, '2016-04-02 17:52:35', '2016-04-02 17:52:00', 1, NULL, '2016-04-02 17:52:00', 4, 1),
(172, 'В списке иходящих задач отобразить пользователя и дедлайн', NULL, 4, 4, '2016-04-02 18:02:00', '2011-01-01 00:00:00', 1, NULL, '2011-01-01 00:00:00', 4, 0),
(173, 'Сделать анкету фрилансера', NULL, 4, 4, '2016-04-06 05:04:00', '2011-01-01 00:00:00', 3, NULL, '2011-01-01 00:00:00', 4, 0),
(174, 'Сделать бриф клиента', NULL, 4, 4, '2016-04-06 05:04:49', NULL, 1, NULL, NULL, 4, 0),
(175, 'Сделать голосовалку технологий', NULL, 4, 4, '2016-04-06 05:05:41', NULL, 1, NULL, NULL, 4, 0),
(176, 'Сделать черный список заказчиков', NULL, 4, 4, '2016-04-06 05:07:05', NULL, 1, NULL, NULL, 4, 0),
(177, 'Открыть поле паролей', NULL, 4, 4, '2016-04-06 05:08:00', '2011-01-01 00:00:00', 1, NULL, '2011-01-01 00:00:00', 17, 0);

-- 
-- Вывод данных для таблицы issue_status
--
INSERT INTO issue_status VALUES
(1, 'Открыто'),
(2, 'В работе'),
(3, 'Закрыто');

-- 
-- Вывод данных для таблицы project
--
INSERT INTO project VALUES
(4, 'ERP', '<p>Разработка собственной системы управления предприятием</p>', 4, 4, '2016-01-15 00:00:00', '2011-01-01 00:00:00', 5, NULL, 7, 1),
(5, 'Teamexpert.tk', '<p>Данный проект посвящен развитию нашей системы Наш сайт находится тут&nbsp;http://teamexpert.tk/</p>\r\n\r\n<p>&nbsp;</p>', 4, 4, '2016-01-15 00:00:00', '2011-01-01 00:00:00', 5, NULL, 7, 1),
(6, 'metizstroy.ru', '<p>Доступ с системе:</p>\r\n\r\n<p>Панель администратора&nbsp;<br />\r\nАдминка&nbsp;<a href="http://www.metizstroy.ru/administrator/">http://www.metizstroy.ru/administrator/</a><br />\r\nЛогин: admin772<br />\r\nПароль: f86e7f6a</p>\r\n\r\n<p>Админка&nbsp;<a href="http://www.metizstroy.ru/administrator/">http://www.metizstroy.ru/administrator/</a><br />\r\nЛогин admin<br />\r\nНовый пароль Faxer8*56</p>\r\n\r\n<p>[8:38:10] Матвей: Хостинг beget.ru:&nbsp;<br />\r\npixelt<br />\r\nНовый пароль Faxer8*56<br />\r\n[8:38:44] Матвей: ftp нет</p>\r\n\r\n<p>Яндекс почта:<br />\r\n<a href="mailto:metizmsk@yandex.ru">metizmsk@yandex.ru</a><br />\r\nНовый пароль Faxer8*56</p>\r\n\r\n<p>Google<br />\r\n<a href="mailto:metizmsk@gmail.com">metizmsk@gmail.com</a><br />\r\nНовый пароль Faxer8*56</p>\r\n\r\n<p>[15:43:19] Матвей 89197716667:&nbsp;<a href="https://admin.siteheart.com/">https://admin.siteheart.com/</a><br />\r\n[15:43:22] Матвей 89197716667:&nbsp;<a href="mailto:metizmsk@yandex.ru">metizmsk@yandex.ru</a><br />\r\nНовый пароль Faxer8*56</p>', 8, 8, '2016-01-16 00:00:00', '2011-01-01 00:00:00', 3, NULL, 1, 3),
(12, 'kontur.expert56.ru', '<p>Создание промо сайтов для продвижения сервисов компании Контур</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Сайт kontur.expert56.ru</p>\r\n\r\n<p>Админка сайта &nbsp;kontur<br />\r\nПароль &nbsp; &nbsp; &nbsp; &nbsp; OF3dZqQM</p>\r\n\r\n<p>Хостинг&nbsp;<br />\r\nhttp://188.40.65.10:2222/<br />\r\nЛогин&nbsp;&nbsp; &nbsp;: nig517<br />\r\nПароль&nbsp;&nbsp; &nbsp;: TfXDeBhbk</p>\r\n\r\n<p>База данных Имя Базы Данных: nig517_kontur<br />\r\nпользователь nig517_mig_1<br />\r\nпароль &nbsp; OF3dZqQM</p>', 4, 8, '2016-01-17 00:00:00', '2016-02-01 00:00:00', 4, NULL, 6, 3),
(13, 'Реквизиты от системы', '<p>Создан новый виртуальный сервер - VPS 43735!</p>\r\n\r\n<p>Подключиться к виртуальному серверу можно используя следующие параметры:<br />\r\nIP: 85.143.223.204<br />\r\nLogin: root<br />\r\nPassword: hlK34Lmc</p>\r\n\r\n<p>https://panel.simplecloud.ru/servers/#vnc/43735</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Веб-адрес панели:&nbsp;<a href="https://panel.simplecloud.ru/" target="_blank">https://panel.simplecloud.ru</a><br />\r\nВаш логин:&nbsp;<a href="mailto:gordondalos@gmail.com" target="_blank">gordondalos@gmail.com</a><br />\r\nВаш пароль: 212354568789</p>\r\n\r\n<p><em>DNS&nbsp;</em><em><a href="http://ns1.simplecloud.ru/" target="_blank">ns1.simplecloud.ru</a>&nbsp;<a href="http://ns2.simplecloud.ru/" target="_blank">ns2.simplecloud.ru</a></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em>Доменные имена</em></p>\r\n\r\n<p>https://my.freenom.com/clientarea.php?action=domains</p>\r\n\r\n<p>gordondalos@gmail.com</p>\r\n\r\n<p>2123...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 4, 4, '2016-01-19 00:00:00', '2011-01-01 00:00:00', 5, NULL, 7, 1),
(14, 'Юнион', '<p>Сайт для компании Юнион</p>\r\n\r\n<p>Сайт будет хоститься на нашем серваке.</p>\r\n\r\n<p>разработанный ресурс лежит тут</p>\r\n\r\n<p>/var/www/union</p>\r\n\r\n<p>Адрес сайта пока тут</p>\r\n\r\n<p>http://union.teamexpert.tk/</p>\r\n\r\n<p>Вход&nbsp;http://union.teamexpert.tk/admin.php</p>\r\n\r\n<p>логин union</p>\r\n\r\n<p>пароль unionPa$$word</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>доступ к корпоративной почте</p>\r\n\r\n<p>union_plast@mail.ru</p>\r\n\r\n<p>0701303132n&nbsp;</p>\r\n\r\n<p>для смены домена</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 4, 4, '2016-01-19 00:00:00', '2011-01-01 00:00:00', 3, 9000, 6, 1),
(15, 'Внесение нового человека', '<p>Прошу внести нового человека Аганян Алик . Фото пока нет но в ближайщее время будет.&nbsp;</p>', 18, 4, '2016-02-27 00:00:00', '2011-01-01 00:00:00', 3, NULL, 1, 3),
(16, 'Фото Оганяна Алика', '<p>Фото Оганяна Алика в моей папке. Прошу выставить на сайт.</p>', 18, 4, '2016-02-28 00:00:00', '2011-01-01 00:00:00', 3, NULL, 1, 3),
(17, 'Система электронной отчетности EREPORT.KG', '<p>Клиенту нужено два дизайна</p>\r\n\r\n<p>1. Дизайн одностраничника по концепции и тематике похожий на систему электронной отчетности эльба &nbsp;http://www.e-kontur.ru/</p>\r\n\r\n<p>2. Дизайн самого приложения.</p>\r\n\r\n<p>На даннный момент приложение будет позволять клиенту</p>\r\n\r\n<p>1. Найти подходящую форму для ее заполенния и последующей сдачи</p>\r\n\r\n<p>Применыйй интерфейс или дизайн вот такой, или лучше&nbsp;https://kontur.ru/elba/features/business (там есть картинка)</p>\r\n\r\n<p>2. Загрузить заполненную форму в систему</p>\r\n\r\n<p>3. Посмотреть что он загрузил</p>\r\n\r\n<p>4. По запросу клиенту будет предоставлен выбранный отчет, чтобы получить доступ к отчету клиенту нужно будет на первоначальном этапе ввести свой пароль в системе, на последующих этапах ему придет смс с пин-кодом и нужно будет ввести пароль. В ответ на это система даст клиенту доступ к его отчету в виде ссылки на скачивание.</p>', 4, 4, '2016-03-01 00:00:00', '2011-01-01 00:00:00', 6, NULL, 2, 1),
(18, 'Без проекта', '<p>В этом проекте лежат общие задачи которые не имеют отношение ни к какому проекту</p>', 4, 4, '2016-04-02 00:00:00', '2011-01-01 00:00:00', 3, NULL, 1, 1);

-- 
-- Вывод данных для таблицы project_command
--
INSERT INTO project_command VALUES
(1, 26, 2, 2, 4),
(2, 26, 2, 2, 4),
(3, 27, 2, 5, 4),
(4, 28, 1, 4, 2),
(5, 29, 3, 4, 2),
(6, 36, 2, 2, 4),
(7, 37, 1, 2, 4),
(8, 38, 4, 7, 4),
(9, 39, 4, 8, 4),
(10, 40, 4, 9, 4),
(11, 41, 4, 4, 4),
(12, 42, 4, 4, 4),
(13, 43, 4, 4, 4),
(14, 44, 4, 4, 4),
(15, 45, 5, 7, 4),
(16, 46, 5, 8, 4),
(17, 47, 4, 4, 4),
(18, 48, 4, 4, 4),
(19, 49, 5, 9, 4),
(20, 50, 4, 4, 4),
(21, 51, 4, 4, 4),
(22, 52, 4, 4, 4),
(23, 53, 4, 4, 4),
(24, 54, 4, 4, 4),
(25, 55, 4, 4, 4),
(26, 56, 4, 4, 4),
(27, 57, 4, 4, 4),
(28, 58, 4, 4, 4),
(29, 59, 4, 4, 4),
(30, 60, 6, 4, 4),
(31, 61, 4, 4, 4),
(32, 62, 4, 4, 4),
(33, 63, 4, 4, 4),
(34, 64, 4, 4, 4),
(35, 65, 4, 4, 4),
(36, 66, 4, 4, 4),
(37, 67, 6, 4, 4),
(38, 68, 6, 4, 4),
(39, 69, 6, 4, 4),
(40, 70, 6, 4, 4),
(41, 71, 12, 4, 4),
(42, 72, 12, 4, 4),
(43, 73, 12, 4, 4),
(44, 74, 12, 4, 4),
(45, 75, 12, 4, 4),
(46, 76, 12, 4, 4),
(47, 77, 5, 8, 4),
(48, 78, 5, 8, 4),
(49, 79, 5, 8, 4),
(50, 80, 5, 8, 4),
(51, 81, 5, 8, 4),
(52, 82, 5, 8, 4),
(53, 83, 5, 8, 4),
(54, 84, 5, 8, 4),
(55, 85, 5, 8, 4),
(56, 86, 5, 8, 4),
(57, 87, 5, 7, 4),
(58, 88, 5, 8, 4),
(59, 89, 5, 8, 4),
(60, 90, 5, 4, 4),
(61, 91, 5, 8, 4),
(62, 92, 5, 8, 4),
(63, 93, 5, 4, 4),
(64, 94, 5, 4, 4),
(65, 95, 5, 4, 4),
(66, 96, 4, 4, 4),
(67, 97, 4, 15, 4),
(68, 98, 5, 15, 4),
(69, 99, 5, 15, 4),
(70, 100, 5, 15, 4),
(71, 101, 5, 9, 4),
(72, 102, 5, 10, 4),
(73, 103, 5, 11, 4),
(74, 104, 5, 14, 4),
(75, 105, 4, 4, 4),
(76, 106, 5, 9, 4),
(77, 107, 6, 4, 4),
(78, 108, 6, 4, 4),
(79, 109, 4, 10, 4),
(80, 110, 5, 10, 4),
(81, 111, 4, 4, 4),
(82, 112, 5, 4, 4),
(83, 113, 5, 4, 4),
(84, 114, 14, 4, 4),
(85, 115, 14, 4, 4),
(86, 116, 14, 4, 4),
(87, 117, 5, 4, 4),
(88, 118, 4, 4, 4),
(89, 119, 4, 4, 4),
(90, 120, 4, 4, 4),
(91, 121, 4, 4, 4),
(92, 122, 4, 4, 4),
(93, 123, 4, 4, 10),
(94, 124, 4, 4, 4),
(95, 125, 4, 4, 4),
(96, 126, 5, 4, 4),
(97, 127, 5, 4, 4),
(98, 128, 5, 4, 4),
(99, 129, 4, 4, 4),
(100, 130, 4, 4, 4),
(101, 131, 4, 18, 4),
(102, 132, 5, 18, 4),
(103, 133, 5, 18, 4),
(104, 134, 5, 4, 4),
(105, 135, 5, 4, 18),
(106, 136, 5, 4, 18),
(107, 137, 5, 4, 18),
(108, 138, 5, 4, 18),
(109, 139, 5, 4, 18),
(110, 140, 5, 4, 18),
(111, 141, 5, 4, 18),
(112, 142, 5, 4, 18),
(113, 143, 5, 4, 18),
(114, 144, 5, 4, 18),
(115, 145, 5, 4, 18),
(116, 146, 5, 4, 18),
(117, 147, 5, 4, 18),
(118, 148, 5, 4, 18),
(119, 149, 5, 4, 18),
(120, 150, 5, 4, 18),
(121, 151, 17, 48, 4),
(122, 152, 17, 18, 48),
(123, 153, 5, 4, 18),
(124, 154, 5, 4, 4),
(125, 155, 4, 11, 4),
(126, 156, 13, 11, 4),
(127, 157, 4, 4, 4),
(128, 158, 17, 4, 4),
(129, 159, 17, 4, 4),
(130, 160, 17, 4, 4),
(131, 161, 17, 4, 4),
(132, 162, 14, 4, 4),
(133, 163, 14, 4, 4),
(134, 164, 17, 4, 4),
(135, 165, 4, 4, 4),
(136, 166, 4, 4, 4),
(137, 167, 4, 4, 4),
(138, 168, 18, 4, 4),
(139, 169, 4, 4, 4),
(140, 170, 4, 4, 4),
(141, 171, 4, 4, 4),
(142, 172, 4, 4, 4),
(143, 173, 4, 4, 4),
(144, 174, 4, 4, 4),
(145, 175, 4, 4, 4),
(146, 176, 4, 4, 4),
(147, 177, 4, 4, 4);

-- 
-- Вывод данных для таблицы project_status
--
INSERT INTO project_status VALUES
(1, 'Отктыт'),
(2, 'В работе'),
(3, 'Закрыт');

-- 
-- Вывод данных для таблицы project_type
--
INSERT INTO project_type VALUES
(1, 'Верстка'),
(2, 'Дизайн'),
(3, 'Seo'),
(4, 'Сайт на Opencart'),
(5, 'Сайт на WP'),
(6, 'Сайт на  DLE'),
(7, 'Разработка приложения');

-- 
-- Вывод данных для таблицы role
--
INSERT INTO role VALUES
('ROLE_ADMIN', 'admin'),
('ROLE_BOBIK', 'Бобик'),
('ROLE_MANAGER', 'Менеджер'),
('ROLE_MASTER', 'Мастер'),
('ROLE_USER', 'user');

-- 
-- Вывод данных для таблицы type_contact
--
INSERT INTO type_contact VALUES
(1, 'email'),
(2, 'Телефонный звонок'),
(3, 'Встреча у клиента'),
(4, 'Звонок skype'),
(5, 'Другой контакт');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;