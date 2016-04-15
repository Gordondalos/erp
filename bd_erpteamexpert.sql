-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: erp
-- ------------------------------------------------------
-- Server version	5.6.27-0ubuntu0.15.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (3,'Метизстрой','9197716667','Москва','nigmatullov@mail.ru','Продажи метизов, Фундаментных болтов, гаек');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (4,'Gordondalos','gordondalos','gordondalos@gmail.com','gordondalos@gmail.com',1,'lf12bisivq8gk0cc8g4ws4cogcc440g','$2y$13$lf12bisivq8gk0cc8g4wsumW.6YFDdwXHy1zi/pygHfpXU392JYjq','2016-01-16 09:05:06',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL,'',NULL,NULL,'-996777999029'),(7,'Павел','павел','paulic@list.ru','paulic@list.ru',1,'lqgg9i5qfc0gk4c8c0g8wg0o8084gk4','$2y$13$lqgg9i5qfc0gk4c8c0g8wewBHqLPOnyLvkUl2KY1iLi8no2ekl3RK',NULL,0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL,'',NULL,NULL,'+996555911124'),(8,'Матвей','матвей','nigmatullov@mail.ru','nigmatullov@mail.ru',1,'j7hisxpsg34s8ssswokgwcsw40ssokk','$2y$13$j7hisxpsg34s8ssswokgwOdCn0NutncCRcVUz.k/K76CZz7cqDhzO','2016-01-16 08:49:58',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL,'',NULL,NULL,'+79197716667'),(9,'Galina','galina','lina_j@rambler.ru','lina_j@rambler.ru',1,'8bccsv7x4b8cg8gckcc4w4g488skk8s','$2y$13$8bccsv7x4b8cg8gckcc4wuYVA2QyTWlrBXphNwDX92kJw2X8ZXHiK','2016-01-15 15:13:05',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL,'',NULL,NULL,'+996555774697');
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (38,'Использовать систему','Необходимо использовать данную систему находить в ней те моменты которые являются нелогичными и ставить задачи на их устранение',4,7,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(39,'Использовать систему','Необходимо использовать данную систему находить в ней те моменты которые являются нелогичными и ставить задачи на их устранение',4,8,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(40,'Использовать систему','Необходимо использовать данную систему находить в ней те моменты которые являются нелогичными и ставить задачи на их устранение',4,9,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(41,'Сделать редирект после создания задачи','обратно в проект',4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(42,'Сделать поле для имени задачи длинее',NULL,4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(43,'Сделать красоту при создании задач и проектов',NULL,4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(44,'сделать фильтр мои задачи в проекте по умолчанию','по кнопке все задачи',4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(45,'Подготовить материал для размещения в портфолио','и разместить его',4,7,'2011-01-01 00:00:00',NULL,1,NULL,NULL,5),(46,'Подготовить материал для размещения в портфолио','и разместить его',4,8,'2011-01-01 00:00:00',NULL,1,NULL,NULL,5),(47,'Сделать напоминалки',NULL,4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(48,'Сделать повторяющиеся задачи',NULL,4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(49,'Подготовить материал для размещения в портфолио','и разместить его',4,9,'2011-01-01 00:00:00',NULL,1,NULL,NULL,5),(50,'Вывод доп информации','Нужно вывести дополнительную информацию в вид проектов чтобы было видно\r\n1. День проекта\r\n2. Количество открытых задач\r\n3. Количество просроченных задач',4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(51,'Сделать возможность сортировать задачи',NULL,4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(52,'Вывести переход к файловой системе',NULL,4,4,'2011-01-01 00:00:00','2016-01-16 23:16:00',3,NULL,NULL,4),(53,'Зделать вывод только открытых задач','Всех остальных  по клику',4,4,'2011-01-01 00:00:00',NULL,2,NULL,NULL,4),(54,'Сделать сортировщик','для всех таблиц',4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(55,'Делать чтобы при закрытии задачи','автоматом проставлялась дата закрытия',4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(56,'Сделать загрузку на сервер картинок и файлов прямо',NULL,4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(57,'Сделать чтобы статус включен выключен пользователь',NULL,4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(58,'Сделать чтобы отображение контактов было только то',NULL,4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(59,'Приделать Gmail к системе, для уведомлений','В последующем сделать чтобы можно было читать почту через систему',4,4,'2011-01-01 00:00:00',NULL,1,NULL,NULL,4),(60,'Региональные сайты','Настроить региональные домены',4,4,'2011-01-01 00:00:00',NULL,1,3000,NULL,6);
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
  `project_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (4,'ERP','Разработка собственной системы управления предприятием',4,4,'2016-01-15 00:00:00',NULL,NULL,NULL,7,1),(5,'Наш Сайт','Данный проект посвящен развитию нашего сайта',4,4,'2016-01-15 00:00:00',NULL,NULL,NULL,6,1),(6,'metizstroy.ru','Продажа метизов.',8,8,'2016-01-16 00:00:00','2011-01-01 00:00:00',3,NULL,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_command`
--

LOCK TABLES `project_command` WRITE;
/*!40000 ALTER TABLE `project_command` DISABLE KEYS */;
INSERT INTO `project_command` VALUES (1,26,2,2,4),(2,26,2,2,4),(3,27,2,5,4),(4,28,1,4,2),(5,29,3,4,2),(6,36,2,2,4),(7,37,1,2,4),(8,38,4,7,4),(9,39,4,8,4),(10,40,4,9,4),(11,41,4,4,4),(12,42,4,4,4),(13,43,4,4,4),(14,44,4,4,4),(15,45,5,7,4),(16,46,5,8,4),(17,47,4,4,4),(18,48,4,4,4),(19,49,5,9,4),(20,50,4,4,4),(21,51,4,4,4),(22,52,4,4,4),(23,53,4,4,4),(24,54,4,4,4),(25,55,4,4,4),(26,56,4,4,4),(27,57,4,4,4),(28,58,4,4,4),(29,59,4,4,4),(30,60,6,4,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_status`
--

LOCK TABLES `project_status` WRITE;
/*!40000 ALTER TABLE `project_status` DISABLE KEYS */;
INSERT INTO `project_status` VALUES (1,'Отктыт'),(2,'В работе'),(3,'Закрыт');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_type`
--

LOCK TABLES `project_type` WRITE;
/*!40000 ALTER TABLE `project_type` DISABLE KEYS */;
INSERT INTO `project_type` VALUES (1,'Верстка'),(2,'Дизайн'),(3,'Seo'),(4,'Сайт на Opencart'),(5,'Сайт на WP'),(6,'Сайт на  DLE'),(7,'Разработка приложения');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-16 15:55:38
