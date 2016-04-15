--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.0.54.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 03.04.2016 20:26:59
-- Версия сервера: 5.6.21
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
USE ereport;

--
-- Описание для таблицы area
--
DROP TABLE IF EXISTS area;
CREATE TABLE area (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name_area VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы form_report
--
DROP TABLE IF EXISTS form_report;
CREATE TABLE form_report (
  id INT(11) NOT NULL AUTO_INCREMENT,
  form_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 16
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы fos_group
--
DROP TABLE IF EXISTS fos_group;
CREATE TABLE fos_group (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  roles LONGTEXT NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (id),
  UNIQUE INDEX UNIQ_4B019DDB5E237E06 (name)
)
ENGINE = INNODB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

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
  phone VARCHAR(255) DEFAULT NULL,
  inn VARCHAR(25) DEFAULT NULL,
  number_socialn_fond VARCHAR(255) DEFAULT NULL,
  bank VARCHAR(255) DEFAULT NULL,
  bank_account VARCHAR(255) DEFAULT NULL,
  bank_bik VARCHAR(255) DEFAULT NULL,
  director VARCHAR(255) DEFAULT NULL,
  director_phone VARCHAR(255) DEFAULT NULL,
  buhgalter VARCHAR(255) DEFAULT NULL,
  buhgalterphone VARCHAR(255) DEFAULT NULL,
  phisical_adress VARCHAR(255) DEFAULT NULL,
  ur_adress VARCHAR(255) DEFAULT NULL,
  mail_adress VARCHAR(255) DEFAULT NULL,
  site VARCHAR(255) DEFAULT NULL,
  full_name_organization VARCHAR(255) DEFAULT NULL,
  short_name_organization VARCHAR(255) DEFAULT NULL,
  time_job VARCHAR(255) DEFAULT NULL,
  gns VARCHAR(255) DEFAULT NULL,
  okpo VARCHAR(255) DEFAULT NULL,
  director_post VARCHAR(255) DEFAULT NULL,
  date_registration DATE DEFAULT NULL,
  okved VARCHAR(255) DEFAULT NULL,
  curator_user_id INT(11) DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX IDX_957A6479854560A3 (curator_user_id),
  UNIQUE INDEX UNIQ_957A647992FC23A8 (username_canonical),
  UNIQUE INDEX UNIQ_957A6479A0D96FBF (email_canonical),
  CONSTRAINT FK_957A6479854560A3 FOREIGN KEY (curator_user_id)
    REFERENCES fos_user(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 21
AVG_ROW_LENGTH = 2730
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы news
--
DROP TABLE IF EXISTS news;
CREATE TABLE news (
  id INT(11) NOT NULL AUTO_INCREMENT,
  short_news TEXT NOT NULL,
  all_news TEXT NOT NULL,
  date_news DATE NOT NULL,
  news_title TEXT NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 8
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы organization
--
DROP TABLE IF EXISTS organization;
CREATE TABLE organization (
  id INT(11) NOT NULL AUTO_INCREMENT,
  organization_name VARCHAR(255) NOT NULL,
  organization_phone VARCHAR(255) DEFAULT NULL,
  organization_description LONGTEXT DEFAULT NULL,
  organization_short_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы report
--
DROP TABLE IF EXISTS report;
CREATE TABLE report (
  id INT(11) NOT NULL AUTO_INCREMENT,
  date_in DATETIME NOT NULL,
  description LONGTEXT DEFAULT NULL,
  organization INT(11) NOT NULL,
  status INT(11) NOT NULL,
  date_accepted DATETIME NOT NULL,
  type_report INT(11) NOT NULL,
  file_adress VARCHAR(255) NOT NULL,
  area INT(11) NOT NULL,
  form_report INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы status
--
DROP TABLE IF EXISTS status;
CREATE TABLE status (
  id INT(11) NOT NULL AUTO_INCREMENT,
  status_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы type_report
--
DROP TABLE IF EXISTS type_report;
CREATE TABLE type_report (
  id INT(11) NOT NULL AUTO_INCREMENT,
  type_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы base_forms
--
DROP TABLE IF EXISTS base_forms;
CREATE TABLE base_forms (
  id INT(11) NOT NULL AUTO_INCREMENT,
  type_report_id INT(11) NOT NULL,
  description LONGTEXT DEFAULT NULL,
  organization_id INT(11) NOT NULL,
  date_accepted DATETIME NOT NULL,
  image_name VARCHAR(255) NOT NULL,
  form_report_id INT(11) NOT NULL,
  create_user_id INT(11) NOT NULL,
  area_id INT(11) NOT NULL,
  is_report INT(11) DEFAULT NULL,
  status_id INT(11) DEFAULT NULL,
  curator_user_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  INDEX IDX_40148A2532C8A3DE (organization_id),
  INDEX IDX_40148A253AD21BCC (form_report_id),
  INDEX IDX_40148A256BF700BD (status_id),
  INDEX IDX_40148A25854560A3 (curator_user_id),
  INDEX IDX_40148A2585564492 (create_user_id),
  INDEX IDX_40148A25BD0F409C (area_id),
  INDEX IDX_40148A25FF14E5D0 (type_report_id),
  CONSTRAINT FK_40148A2532C8A3DE FOREIGN KEY (organization_id)
    REFERENCES organization(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_40148A253AD21BCC FOREIGN KEY (form_report_id)
    REFERENCES form_report(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_40148A256BF700BD FOREIGN KEY (status_id)
    REFERENCES status(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_40148A25854560A3 FOREIGN KEY (curator_user_id)
    REFERENCES fos_user(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_40148A2585564492 FOREIGN KEY (create_user_id)
    REFERENCES fos_user(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_40148A25BD0F409C FOREIGN KEY (area_id)
    REFERENCES area(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_40148A25FF14E5D0 FOREIGN KEY (type_report_id)
    REFERENCES type_report(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 90
AVG_ROW_LENGTH = 409
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

--
-- Описание для таблицы fos_user_group
--
DROP TABLE IF EXISTS fos_user_group;
CREATE TABLE fos_user_group (
  user_id INT(11) NOT NULL,
  group_id INT(11) NOT NULL,
  PRIMARY KEY (user_id, group_id),
  INDEX IDX_583D1F3EA76ED395 (user_id),
  INDEX IDX_583D1F3EFE54D947 (group_id),
  CONSTRAINT FK_583D1F3EA76ED395 FOREIGN KEY (user_id)
    REFERENCES fos_user(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_583D1F3EFE54D947 FOREIGN KEY (group_id)
    REFERENCES fos_group(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2730
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

-- 
-- Вывод данных для таблицы area
--
INSERT INTO area VALUES
(1, 'Первомайский'),
(2, 'Сверловский'),
(3, 'Октябрьский');

-- 
-- Вывод данных для таблицы form_report
--
INSERT INTO form_report VALUES
(1, 'FORM STI-017'),
(2, 'FORM STI-019'),
(3, 'FORM STI-058'),
(4, 'FORM STI-059'),
(5, 'FORM STI-062'),
(6, 'FORM STI-070'),
(7, 'FORM STI-106'),
(8, 'FORM STI-107'),
(9, 'FORM STI-108'),
(10, 'FORM STI-121'),
(11, 'FORM STI-123'),
(12, 'FORM STI-131'),
(13, 'FORM STI-134'),
(14, 'FORM STI-137'),
(15, 'FORM STI-143');

-- 
-- Вывод данных для таблицы fos_group
--
INSERT INTO fos_group VALUES
(3, 'Администраторы', 'a:1:{i:0;s:10:"ROLE_ADMIN";}'),
(4, 'Пользователи', 'a:0:{}');

-- 
-- Вывод данных для таблицы fos_user
--
INSERT INTO fos_user VALUES
(1, 'gordondalos', 'gordondalos', 'gordondalos@gmail.com', 'gordondalos@gmail.com', 1, '88ohmyni7a80csg0oc8kkk4oc0w4wg', '$2y$13$88ohmyni7a80csg0oc8kkembZUjoU6Sk3lklhBYeCSa5cQMr2L.au', '2016-04-03 20:17:08', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, 'Azure предлагает ежемесячное соглашение об уровне обслуживания с доступностью на уровне 99,95 % и позволяет тебе создавать и запускать высокодоступные приложения, не сосредотачивая внимания на инфраструктуре. Эта платформа обладает возможностью автоматического применения исправлений для операционной системы и служб, встроенной балансировкой сетевой нагрузки и устойчивостью к аппаратным сбоям. Она поддерживает модель развертывания, которая позволяет вам обновлять приложение с нулевым временем простоя.\r\n\r\nКомпоненты и службы предоставляются с помощью открытых протоколов REST. Клиентские библиотеки Azure доступны для нескольких языков программирования, выпускаются по лицензии с открытым исходным кодом и размещаются на сайте GitHub.', '+996777999029', '03003201010010', '3232220', 'Банк Азии', '3323365545875', '11245', 'Евгений Бондаренко', '0555777999', 'Василиса Прекрасная', '0777888888', 'Бишкек 151', 'Мароко 128', 'gordondalos@gmail.com', 'teamexpert.tk', 'ЗАО "Рога и Копыта"', 'Рожки', '15:30-17:30', 'Октябрьский 125', '12321', 'Директор', '2015-01-16', '123456', 1),
(2, 'Вася Пупкин', 'вася пупкин', 'vasa@mail.ru', 'vasa@mail.ru', 1, '88ohmyni7a80csg0oc8kkk4oc0w4wg', '$2y$13$88ohmyni7a80csg0oc8kkembZUjoU6Sk3lklhBYeCSa5cQMr2L.au', '2016-04-02 14:31:56', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, NULL, '045112354432544', '5456', 'РСК Банк', '011244501000112', '004', 'Дядя Вася', '0555555555', 'Плюшкина Елизавета Васильевна', '07755456321', 'Какой то адрес', 'Какой то адрес', 'Какой то адрес', NULL, 'Вася Корпорейшн', 'Вася Корпорейшн', NULL, 'Первомайская 001', '5426', 'Директор', '2011-01-01', '12345', 1),
(3, 'Колян', 'колян', 'kolyan@mail.ru', 'kolyan@mail.ru', 1, 'eev030e33tc84wkoggwowc0wwow08w4', '$2y$13$eev030e33tc84wkoggwowOYqiFtflmpXN3pkimOfatZyAuyR3Nlxa', '2016-03-27 17:40:12', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '456789', '1235654', '111111111', '445556-ьв', NULL, NULL, NULL, 'Шышкин Василий Петровч', '+99566541122', 'Василиса Васильевна', '987987987', 'Гдето в Аврике', 'гдето в Бишкеке', 'Почта туда не ходит', NULL, 'Тойота моторс', 'Тойота моторс', NULL, 'Первомайская 001', '22222', 'Председатель соверта директоров', '2011-01-01', '123456-уа', 1),
(7, 'Вини пух', 'вини пух', 'bondarenko.kg@mail.ru', 'bondarenko.kg@mail.ru', 1, '83195z9xd6w4kwws0g4kwo8kco8o4k0', '$2y$13$83195z9xd6w4kwws0g4kwebCfufTZC2x0IA3FOAf6iqYELoW7BHAu', '2016-04-03 19:33:05', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL, NULL, '0555555555', NULL, NULL, NULL, NULL, NULL, 'Василий Теркин', '0312545658', 'Вини Пух', '0555666999', 'Ул Коммунаров дом 112', 'Ул Коммунаров дом 112', 'Ул Коммунаров дом 112', NULL, 'Google', 'Google', NULL, NULL, NULL, 'Профессор', '2011-01-01', NULL, 1),
(16, 'Barbosa', 'barbosa', 'Barbosa@zxc.as', 'barbosa@zxc.as', 1, 'fszxgzq6hoo4cw0ockwoc488s8ksk8c', '$2y$13$fszxgzq6hoo4cw0ockwocupXERfZR4IwITtQAIzD3GVHisNxWBcGe', '2016-04-03 20:04:45', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, '123123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', NULL, 1),
(17, 'Teamwox', 'teamwox', 'Teamwox@Teamwox.fg', 'teamwox@teamwox.fg', 1, 'negwhcl6uysg08w4c40wsookg0w0c8o', '$2y$13$negwhcl6uysg08w4c40wsecWm2dwP8bx11IYh7YAkfzMOAA48qhC6', '2016-03-27 18:50:59', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, 'Teamwox', 'Teamwox', 'Teamwox', 'Teamwox', 'Teamwox', 'Teamwox', 'Teamwox', 'Teamwox', '111111', 'Teamwox', '222222', 'Teamwox Teamwox Teamwox', 'Teamwox Teamwox Teamwox', 'Teamwox Teamwox', 'Teamwox', 'Teamwox', 'Teamwox', 'Teamwox', 'Teamwox', 'Teamwox', 'Teamwox', '2011-01-01', 'Teamwox', 17),
(18, 'qweqwe', 'qweqwe', 'qweqwe@qwe', 'qweqwe@qwe', 1, 'ay145ynbcwwg08ok8wgoco4swwc4ko4', '$2y$13$ay145ynbcwwg08ok8wgocem0s4qlTkcrREfQCboY2icsxEukGjcXC', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, 'qweqwe', NULL, NULL, NULL, NULL, NULL, 'qweqwe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'qweqwe', 'qweqwe', NULL, NULL, NULL, NULL, '2011-01-01', NULL, 1),
(19, 'ddadmin', 'ddadmin', 'qwe@mail.ru', 'qwe@mail.ru', 1, 'r8r1bi18xy8kgg4k0gk44k88088co44', '$2y$13$r8r1bi18xy8kgg4k0gk44eTuXQS7p5s4LxG8zEeI/..VXPgQzwPKu', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, NULL, '0555555555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2011-01-01', NULL, NULL);

-- 
-- Вывод данных для таблицы news
--
INSERT INTO news VALUES
(1, 'The FOSUserBundle provides a number of command line utilities to help manage your application''s users. Commands are available for the following tasks:', 'The FOSUserBundle provides a number of command line utilities to help manage your application''s users. Commands are available for the following tasks:The FOSUserBundle provides a number of command line utilities to help manage your application''s users. Commands are available for the following tasks:The FOSUserBundle provides a number of command line utilities to help manage your application''s users. Commands are available for the following tasks:The FOSUserBundle provides a number of command line utilities to help manage your application''s users. Commands are available for the following tasks:', '2011-01-01', 'Заголовок Первой новости'),
(2, 'Чтобы Doctrine могла сделать это, надо просто создать “метаданные” или конфигурацию, которые в точности расскажут ей как класс Product и его свойства должны быть отображены в базу данных. Эти метаданные могут быть указаны в большом количестве форматов, включая YAML, XML или прямо внутри класса Product через аннотации:', 'Чтобы Doctrine могла сделать это, надо просто создать “метаданные” или конфигурацию, которые в точности расскажут ей как класс Product и его свойства должны быть отображены в базу данных. Эти метаданные могут быть указаны в большом количестве форматов, включая YAML, XML или прямо внутри класса Product через аннотации:Чтобы Doctrine могла сделать это, надо просто создать “метаданные” или конфигурацию, которые в точности расскажут ей как класс Product и его свойства должны быть отображены в базу данных. Эти метаданные могут быть указаны в большом количестве форматов, включая YAML, XML или прямо внутри класса Product через аннотации:Чтобы Doctrine могла сделать это, надо просто создать “метаданные” или конфигурацию, которые в точности расскажут ей как класс Product и его свойства должны быть отображены в базу данных. Эти метаданные могут быть указаны в большом количестве форматов, включая YAML, XML или прямо внутри класса Product через аннотации:Чтобы Doctrine могла сделать это, надо просто создать “метаданные” или конфигурацию, которые в точности расскажут ей как класс Product и его свойства должны быть отображены в базу данных. Эти метаданные могут быть указаны в большом количестве форматов, включая YAML, XML или прямо внутри класса Product через аннотации:', '2011-01-01', 'Заголовок Второй Новости'),
(5, 'Since you can store the locale of the user in the session, it may be tempting to use the same URL to display a resource in different languages based on the user''s locale. For example, http://www.example.com/contact could show content in English for one user and French for another user. Unfortunately, this violates a fundamental rule of the Web: that a particular URL returns the same resource regardless of the user. To further muddy the problem, which version of the content would be indexed by search engines?', 'Since you can store the locale of the user in the session, it may be tempting to use the same URL to display a resource in different languages based on the user''s locale. For example, http://www.example.com/contact could show content in English for one user and French for another user. Unfortunately, this violates a fundamental rule of the Web: that a particular URL returns the same resource regardless of the user. To further muddy the problem, which version of the content would be indexed by search engines?', '2016-03-27', 'Since you can store the locale of the user in the session, it may be tempting to use the same URL to display a resource in different languages based on the user''s locale.'),
(6, '<p>When you query for a particular type of object, you always use what&#39;s known as its &quot;repository&quot;. You can think of a repository as a PHP class whose only job is to help you fetch entities of a certain class. You can access the repository object for an entity class via:</p>\r\n\r\n<table>\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t<pre>\r\n1\r\n2</pre>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t<pre>\r\n$repository = $this-&gt;getDoctrine()\r\n    -&gt;getRepository(&#39;AppBundle:Product&#39;);\r\n</pre>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n\r\n<p>The&nbsp;<tt><code>AppBundle:Product</code></tt>&nbsp;string is a shortcut you can use anywhere in Doctrine instead of the full class name of the entity (i.e.&nbsp;<tt><code>AppBundle\\Entity\\Product</code></tt>). As long as your entity lives under the&nbsp;<tt><code>Entity</code></tt>&nbsp;namespace of your bundle, this will work.</p>\r\n\r\n<p>&nbsp;</p>', '<p>When you query for a particular type of object, you always use what&#39;s known as its &quot;repository&quot;. You can think of a repository as a PHP class whose only job is to help you fetch entities of a certain class. You can access the repository object for an entity class via:</p>\r\n\r\n<table>\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td>\r\n\t\t\t<pre>\r\n1\r\n2</pre>\r\n\t\t\t</td>\r\n\t\t\t<td>\r\n\t\t\t<pre>\r\n$repository = $this-&gt;getDoctrine()\r\n    -&gt;getRepository(&#39;AppBundle:Product&#39;);\r\n</pre>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n\r\n<p>The&nbsp;<tt><code>AppBundle:Product</code></tt>&nbsp;string is a shortcut you can use anywhere in Doctrine instead of the full class name of the entity (i.e.&nbsp;<tt><code>AppBundle\\Entity\\Product</code></tt>). As long as your entity lives under the&nbsp;<tt><code>Entity</code></tt>&nbsp;namespace of your bundle, this will work.</p>\r\n\r\n<p>&nbsp;</p>', '2016-03-27', '<p>Какая то новость про симфони</p>\r\n\r\n<p>&nbsp;</p>'),
(7, '<p>At times you may wish to change the default ordering direction sequence for columns (some or all of them) to be &#39;descending&#39; rather than DataTables&#39; default ascending. This can be done through the use of the&nbsp;<a href="https://datatables.net/reference/option/columns.orderSequence"><code>columns.orderSequence</code></a>&nbsp;initialisation parameter. This parameter also allows you to limit the ordering to a single direction, or you could add complex behaviour to the ordering interaction.</p>', '<p>At times you may wish to change the default ordering direction sequence for columns (some or all of them) to be &#39;descending&#39; rather than DataTables&#39; default ascending. This can be done through the use of the&nbsp;<a href="https://datatables.net/reference/option/columns.orderSequence"><code>columns.orderSequence</code></a>&nbsp;initialisation parameter. This parameter also allows you to limit the ordering to a single direction, or you could add complex behaviour to the ordering interaction.</p>', '2016-03-29', '<p>At times you may wish to change</p>');

-- 
-- Вывод данных для таблицы organization
--
INSERT INTO organization VALUES
(1, 'Государственная Налоговая Инспекция', '+996777777', '<p>Описание организации ++</p>', 'ГНС'),
(2, 'Социальный Фонд', '54565-54', '987987987', 'СФ'),
(3, 'Государственный Статистический Коммитет', '1223456', 'Принимают отчеты', 'СтатКом');

-- 
-- Вывод данных для таблицы report
--

-- Таблица ereport.report не содержит данных

-- 
-- Вывод данных для таблицы status
--
INSERT INTO status VALUES
(1, 'Новый'),
(2, 'Принят'),
(3, 'На рассмотрении'),
(4, 'Утвержден');

-- 
-- Вывод данных для таблицы type_report
--
INSERT INTO type_report VALUES
(1, 'Первоначальный'),
(2, 'Уточненный');

-- 
-- Вывод данных для таблицы base_forms
--
INSERT INTO base_forms VALUES
(71, 1, '<p>&nbsp;</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 1, '2016-03-30 21:24:46', '56fbefbe17ae3_STI – 017.xls', 1, 1, 1, NULL, 1, 1),
(72, 1, NULL, 1, '2016-03-30 21:25:22', '56fbefe2ce141_DocSTI19_Реестр испорченных бланков счет-фактур по НДС.xls', 2, 1, 1, NULL, 1, 1),
(73, 1, NULL, 1, '2016-03-30 21:26:10', '56fbf0121f722_STI – 058.xls', 3, 1, 1, NULL, 1, 1),
(74, 1, NULL, 1, '2016-03-30 21:26:43', '56fbf033d5504_STI – 059.xls', 4, 1, 1, NULL, 1, 1),
(75, 1, NULL, 1, '2016-03-30 21:28:10', '56fbf08a72e9d_FORMSTI070.xlsx', 6, 1, 1, NULL, 1, 1),
(76, 1, NULL, 1, '2016-03-30 21:29:02', '56fbf0bed54d2_STI 106.xlsx', 7, 1, 1, NULL, 1, 1),
(77, 1, NULL, 1, '2016-03-30 21:49:01', '56fbf56ddc85f_STI – 107.xls', 8, 1, 1, NULL, 1, 1),
(78, 1, NULL, 1, '2016-03-30 21:49:38', '56fbf592cc317_STI – 108.xls', 9, 1, 1, NULL, 1, 1),
(79, 1, NULL, 1, '2016-03-30 21:50:26', '56fbf5c291c73_STI – 121.xls', 10, 1, 1, NULL, 1, 1),
(80, 1, NULL, 1, '2016-03-30 21:51:37', '56fbf609b7e19_FORMSTI123.xlsx', 11, 1, 1, NULL, 1, 1),
(81, 1, NULL, 1, '2016-03-30 21:52:32', '56fbf640b6f0a_STI – 131.xls', 12, 1, 1, NULL, 1, 1),
(82, 1, NULL, 1, '2016-03-30 21:53:21', '56fbf6717c89f_STI 134.xlsx', 13, 1, 1, NULL, 1, 1),
(83, 1, NULL, 1, '2016-03-30 21:54:49', '56fbf6c9e3949_STI 137.xlsx', 14, 1, 1, NULL, 1, 1),
(84, 1, NULL, 1, '2016-03-30 21:57:50', '56fbf77e46eb5_FORMSTI143.xlsx', 15, 1, 1, NULL, 1, 1),
(85, 1, NULL, 1, '2016-03-31 13:28:32', '56fcd1a035e0c_Вопросы.txt', 1, 2, 1, 1, 1, 1),
(86, 1, '<p>Поскольку нам нужно протестировать функциональность кэша перед выпуском, мы можем активировать кэш для окружения&nbsp;<code>dev</code>&nbsp;или создать новое окружение. Напомним, что окружение определяется его именем (строка), связанным фронт-контроллером и опционально набором специальных значений конфигурации.</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 2, '2016-04-01 14:18:50', '56fe2eeaebd17_report-поиск работы.txt', 1, 1, 1, NULL, 1, 1),
(87, 1, '<p>Сегодня мы поговорим о кэшировании. У Symfony есть много встроенных стратегий кэширования. Например, конфигурационные YAML-файлы сначала конвертируются в PHP и затем кэшируются в файловой системе. Мы так же видели, что модули, созданные с помощью генератора админки, кэшируются для улучшения производительности.</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 3, '2016-04-01 14:21:08', '56fe2f74590e2_greensoft20160111.sql', 1, 1, 1, NULL, 1, 1),
(88, 1, '<p>&nbsp;</p>\r\n\r\n<div id="spoon-plugin-kncgbdglledmjmpnikebkagnchfdehbm-2" style="display:none">&nbsp;</div>', 1, '2016-04-01 14:26:04', '56fe309c4cd49_деньги.txt', 15, 2, 1, 1, 1, 1),
(89, 1, NULL, 2, '2016-04-01 15:04:33', '56fe39a174e36_report-logo2 (1).png', 1, 2, 1, 1, 1, 1);

-- 
-- Вывод данных для таблицы fos_user_group
--
INSERT INTO fos_user_group VALUES
(1, 4),
(2, 4),
(3, 4),
(7, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 3);

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;