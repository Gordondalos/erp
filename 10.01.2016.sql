-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: erp
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Вася','+996777999666','Москва','gordondalos@gmail.com',NULL),(2,'Колян','555555','фывфыв','kolyan@buhoy.ru',NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_project`
--

DROP TABLE IF EXISTS `client_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` int(11) NOT NULL,
  `project` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_project`
--

LOCK TABLES `client_project` WRITE;
/*!40000 ALTER TABLE `client_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `client` int(11) DEFAULT NULL,
  `user` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `desctiption` text NOT NULL,
  `next_date_contact` datetime NOT NULL,
  `user_doer` int(11) DEFAULT NULL,
  `project` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'2011-01-01 00:00:00',0,2,1,'О будующем проектк','2011-01-01 00:00:00',3,1),(3,'2011-01-01 00:00:00',1,5,1,'струмент управления зависимостями для PHP приложений, то вы просто обязаны сделать это прямо сейчас. Благо, имеется эта замечательная статья, в которой рассмотрены основные моменты при работе с Composer. Также немного информации о создании собственной библиотеки и добавлении ее в Packagist.\r\nКроме того, доступен скринкаст по Composer, и на Хабре уже был пост об этом инструменте.\r\nComposer Уровень 2 — В посте расс','2011-01-01 00:00:00',0,1),(5,'2011-01-01 00:00:00',0,5,1,'фывфывфывфыв','2011-01-01 00:00:00',3,1),(7,'2011-01-01 00:00:00',0,2,1,'Текст сообщения','2011-01-01 00:00:00',4,1);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (2,'Василий Морковкин','василий морковкин','bondarenko.kg@mail.ru','bondarenko.kg@mail.ru',1,'i1yxvnmd4xwg8k0wgkcw0ko8coc0kow','$2y$13$i1yxvnmd4xwg8k0wgkcw0epTe7l47mBs.zt6poty8NkGpzFOq3PBS','2016-01-08 20:01:11',0,0,NULL,NULL,NULL,'a:1:{i:0;s:11:\"ROLE_MASTER\";}',0,NULL,'','sdfasdfasdfasdf',NULL,'+996777999029'),(3,'Александр Невский','александр невский','123@mail.ru','123@mail.ru',1,'6r7onivztxwc0k00skgw8kk0cs4cw0k','$2y$13$6r7onivztxwc0k00skgw8elJgjNspr5WxyIik6DyETapx4mutdTSK','2016-01-08 16:48:51',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_BOBIK\";}',0,NULL,'',NULL,NULL,'654987654'),(4,'Gordondalos','gordondalos','gordondalos@gmail.com','gordondalos@gmail.com',1,'lf12bisivq8gk0cc8g4ws4cogcc440g','$2y$13$lf12bisivq8gk0cc8g4wsumW.6YFDdwXHy1zi/pygHfpXU392JYjq','2016-01-09 15:07:22',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL,'',NULL,NULL,'123654'),(5,'Дядя Саша','дядя саша','sasha@mail.ru','sasha@mail.ru',0,'4i2rh4v6524g0480sgskss0s80okskc','$2y$13$4i2rh4v6524g0480sgsksezdPWrM5f7FRlhN/XGw1QydrNRyT/orq',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:12:\"ROLE_MANAGER\";}',0,NULL,'',NULL,NULL,'987987987'),(6,'Вован','вован','vova@mail.ru','vova@mail.ru',0,'sarqguesbi8w8s8o00o84wwsc48s4w4','$2y$13$sarqguesbi8w8s8o00o84uPb8IKDUr3P23axH3Dk3a6.fE1z/Sefq',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:11:\"ROLE_MASTER\";}',0,NULL,'',NULL,NULL,'321321321');
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_name` varchar(50) NOT NULL,
  `issue_description` text,
  `issue_autor` int(11) NOT NULL,
  `issue_executor` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_finish` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `summa` int(11) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (1,'Первая задача к первому проекту','струмент управления зависимостями для PHP приложений, то вы просто обязаны сделать это прямо сейчас. Благо, имеется эта замечательная статья, в которой рассмотрены основные моменты при работе с Composer. Также немного информации о создании собственной библиотеки и добавлении ее в Packagist.\r\nКроме того, доступен скринкаст по Composer, и на Хабре уже был пост об этом инструменте.\r\nComposer Уровень 2 — В посте расс',4,3,'2011-01-01 00:00:00',NULL,1,100,NULL,1),(2,'Вторая задача','струмент управления зависимостями для PHP приложений, то вы просто обязаны сделать это прямо сейчас. Благо, имеется эта замечательная статья, в которой рассмотрены основные моменты при работе с Composer. Также немного информации о создании собственной библиотеки и добавлении ее в Packagist.\r\nКроме того, доступен скринкаст по Composer, и на Хабре уже был пост об этом инструменте.\r\nComposer Уровень 2 — В посте расс',2,4,'2011-01-01 00:00:00',NULL,1,54,NULL,1),(3,'Задача второго проекта','Описнаие',2,3,'2011-01-01 00:00:00',NULL,1,1500,NULL,3),(4,'струмент управления зависимостями для PHP приложен','струмент управления зависимостями для PHP приложений, то вы просто обязаны сделать это прямо сейчас. Благо, имеется эта замечательная статья, в которой рассмотрены основные моменты при работе с Composer. Также немного информации о создании собственной библиотеки и добавлении ее в Packagist.\r\nКроме того, доступен скринкаст по Composer, и на Хабре уже был пост об этом инструменте.\r\nComposer Уровень 2 — В посте расс',2,2,'2011-01-01 00:00:00',NULL,1,NULL,'2016-01-07 00:01:00',1),(5,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(6,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(7,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(8,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(9,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(10,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(11,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(12,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(13,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(14,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(15,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(16,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(17,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(18,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(19,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(20,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(21,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(22,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(23,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(24,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(25,'Какая-то задача','Коротенькое описание',4,2,'2011-01-01 00:00:00',NULL,1,1540,NULL,2),(26,'Еще тестовая задача',NULL,4,2,'2011-01-01 00:00:00',NULL,1,NULL,NULL,2);
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_status`
--

DROP TABLE IF EXISTS `issue_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_status`
--

LOCK TABLES `issue_status` WRITE;
/*!40000 ALTER TABLE `issue_status` DISABLE KEYS */;
INSERT INTO `issue_status` VALUES (1,'Открыто'),(2,'В работе'),(3,'Закрыто');
/*!40000 ALTER TABLE `issue_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) NOT NULL,
  `project_description` text,
  `project_manager` int(11) NOT NULL,
  `project_creator` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_finish` datetime DEFAULT NULL,
  `client` int(11) DEFAULT NULL,
  `summ` int(11) DEFAULT NULL,
  `project_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Мой первый проект','Управление зависимостями на PHP с помощью Composer — Если вы еще не пробовали на ощупь Composer — инструмент управления зависимостями для PHP приложений, то вы просто обязаны сделать это прямо сейчас. Благо, имеется эта замечательная статья, микрофреймворке начинает расти? В посте автор дает рекомендации по рефакторингу приложения, написанного на Silex (микрофреймворк, построенный на компонентах Symfony2): контроллеры в отдельных файлах, вынесение логики в отдельные классы-«сервисы».\r\nDon\'t be STUPID, grasp SOLID — Слайды доклада о принципах SOLID c TrueNorthPHP. Кратко и очень наглядно об основных принципах проектирования ПО.\r\nАнализ узких мест — Слайды огромного и очень полезного доклада об анализе узких мест все с той же TrueNorthPHP.\r\nКэширование с помощью Memcached — И опять слайды доклада с TrueNorthPHP.\r\nЧего ожидать от от Laravel 4 — Скринкасты с демонстрацией возможностей грядущей версии фреймворка.\r\nPHP + Apache Stack vs Node.js — Как говорит сам автор: «Это сравнение яблока с апельсином». И, тем не менее, в статье рассмотрены сильные и слабые стороны PHP и Node.js, а также приведены рекомендации, в каких случаях, какая из технологий предпочтительней.\r\nМультиязычность на Symfony2 — В статье показано, как организовать поддержку мультиязыч',2,4,'2011-01-01 00:00:00',NULL,1,1500,0),(2,'Проект Второй','Проект ВАси',4,2,'2011-01-01 00:00:00',NULL,1,100500,0),(3,'Третий тестовый проект','Описание проекта',2,2,'2016-06-07 00:00:00',NULL,2,20000,0);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_command`
--

DROP TABLE IF EXISTS `project_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue` int(11) NOT NULL,
  `project` int(11) NOT NULL,
  `issue_executor` int(11) DEFAULT NULL,
  `issue_autor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_command`
--

LOCK TABLES `project_command` WRITE;
/*!40000 ALTER TABLE `project_command` DISABLE KEYS */;
INSERT INTO `project_command` VALUES (1,26,2,2,4),(2,26,2,2,4);
/*!40000 ALTER TABLE `project_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_status`
--

DROP TABLE IF EXISTS `project_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_status`
--

LOCK TABLES `project_status` WRITE;
/*!40000 ALTER TABLE `project_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_type`
--

DROP TABLE IF EXISTS `project_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_type`
--

LOCK TABLES `project_type` WRITE;
/*!40000 ALTER TABLE `project_type` DISABLE KEYS */;
INSERT INTO `project_type` VALUES (1,'Верстка'),(2,'Дизайн'),(3,'Seo'),(4,'Сайт на Opencart'),(5,'Сайт на WP'),(6,'Сайт на  DLE');
/*!40000 ALTER TABLE `project_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` varchar(255) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('ROLE_ADMIN','admin'),('ROLE_BOBIK','Бобик'),('ROLE_MANAGER','Менеджер'),('ROLE_MASTER','Мастер'),('ROLE_USER','user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_contact`
--

DROP TABLE IF EXISTS `type_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_contact`
--

LOCK TABLES `type_contact` WRITE;
/*!40000 ALTER TABLE `type_contact` DISABLE KEYS */;
INSERT INTO `type_contact` VALUES (1,'email'),(2,'Телефонный звонок'),(3,'Встреча у клиента'),(4,'Звонок skype'),(5,'Другой контакт');
/*!40000 ALTER TABLE `type_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_123`
--

DROP TABLE IF EXISTS `users_123`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_123` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(3) NOT NULL DEFAULT '1',
  `mail` varchar(255) DEFAULT NULL,
  `description` text,
  `avatar` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_123`
--

LOCK TABLES `users_123` WRITE;
/*!40000 ALTER TABLE `users_123` DISABLE KEYS */;
INSERT INTO `users_123` VALUES (1,'Gordondalos','Gordondalos','212354568789',2,'gordondalos@gmail.com','какоето описание',NULL,'+996777999029'),(2,'Вася Пупкин','Vasya','123456789',3,'vasya@example.com',NULL,NULL,'+654786541'),(3,'Коля','Kolya','123',4,'mail@example.ru',NULL,NULL,'65412365'),(4,'Администратор','admin','123',1,'asdasd','asdasd',NULL,'+996777999029');
/*!40000 ALTER TABLE `users_123` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-10 19:00:42
