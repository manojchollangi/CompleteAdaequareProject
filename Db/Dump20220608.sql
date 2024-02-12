-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: newsdb
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add news details',9,'add_newsdetails'),(26,'Can change news details',9,'change_newsdetails'),(27,'Can delete news details',9,'delete_newsdetails'),(28,'Can view news details',9,'view_newsdetails'),(29,'Can add news type',10,'add_newstype'),(30,'Can change news type',10,'change_newstype'),(31,'Can delete news type',10,'delete_newstype'),(32,'Can view news type',10,'view_newstype'),(33,'Can add Token',11,'add_token'),(34,'Can change Token',11,'change_token'),(35,'Can delete Token',11,'delete_token'),(36,'Can view Token',11,'view_token'),(37,'Can add token',12,'add_tokenproxy'),(38,'Can change token',12,'change_tokenproxy'),(39,'Can delete token',12,'delete_tokenproxy'),(40,'Can view token',12,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$RDiZwkdRwM0nkYWySM3RxJ$nsGIGcPn/F8idcvaZvmSh8oBlmYq3SYfCFNSmfOSAjU=','2022-06-08 09:43:16.591599',1,'mkchollangi','','','mkchollangi@adaequare.com',1,1,'2022-03-23 12:10:24.886290'),(3,'pbkdf2_sha256$260000$2AnufuQQ4ofxujNfIqHnAb$emgoOVfbRf/+jMfNo74GPOQRhOd/u9Kjo5uObCjyx3Q=',NULL,0,'mkchollangi1','','','',1,1,'2022-04-18 07:46:19.000000'),(5,'pbkdf2_sha256$260000$ePSe952RDiSsFmJZDr4gpz$jgxKIEK0zD1uJbSvF/0rO2MTqW2gofTcG6dlluqh5lE=','2022-06-08 09:27:45.655836',0,'krishna','krishna','veni','krishnaveni@gmail.com',0,1,'2022-05-31 12:46:24.000000'),(6,'pbkdf2_sha256$260000$ppmRVfoNnjnUUT2YTw10Js$oCFrxYYRD0xP6OYxtMhCD1Yojk7J6ZCm+RuzW1E86l4=',NULL,0,'swethasri','','','',0,1,'2022-06-03 11:47:55.105964');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('91290a77be0c74ec0e31bf80aa86bc251bf18361','2022-05-29 08:34:06.061886',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-03-23 12:14:00.996490','7','NewsType object (7)',1,'[{\"added\": {}}]',7,1),(2,'2022-03-23 12:14:41.055453','8','NewsType object (8)',1,'[{\"added\": {}}]',7,1),(3,'2022-03-23 12:14:47.276430','8','NewsType object (8)',2,'[]',7,1),(4,'2022-03-23 13:03:26.395271','1','NewsDetails object (1)',1,'[{\"added\": {}}]',8,1),(5,'2022-03-23 13:27:58.625356','8','NewsType object (8)',3,'',7,1),(6,'2022-03-27 05:13:18.387585','9','NewsType object (9)',1,'[{\"added\": {}}]',7,1),(7,'2022-03-27 05:16:02.923066','9','NewsType object (9)',2,'[{\"changed\": {\"fields\": [\"News type\"]}}]',7,1),(8,'2022-04-01 10:31:30.959495','2','NewsDetails object (2)',1,'[{\"added\": {}}]',8,1),(9,'2022-04-01 10:38:25.026425','3','NewsDetails object (3)',1,'[{\"added\": {}}]',8,1),(10,'2022-04-01 10:42:11.646573','4','NewsDetails object (4)',1,'[{\"added\": {}}]',8,1),(11,'2022-04-01 10:44:51.716285','5','NewsDetails object (5)',1,'[{\"added\": {}}]',8,1),(12,'2022-04-01 10:58:53.593220','6','NewsDetails object (6)',1,'[{\"added\": {}}]',8,1),(13,'2022-04-01 11:01:01.908415','7','NewsDetails object (7)',1,'[{\"added\": {}}]',8,1),(14,'2022-04-04 11:53:35.062997','8','NewsDetails object (8)',1,'[{\"added\": {}}]',8,1),(15,'2022-04-04 12:24:19.481003','9','NewsDetails object (9)',1,'[{\"added\": {}}]',8,1),(16,'2022-04-05 09:53:51.035091','10','NewsDetails object (10)',1,'[{\"added\": {}}]',8,1),(17,'2022-04-05 10:12:04.815591','11','NewsDetails object (11)',1,'[{\"added\": {}}]',8,1),(18,'2022-04-05 10:17:51.915354','12','NewsDetails object (12)',1,'[{\"added\": {}}]',8,1),(19,'2022-04-12 13:34:14.370078','14','NewsType object (14)',3,'',10,1),(20,'2022-04-12 13:34:14.381255','13','NewsType object (13)',3,'',10,1),(21,'2022-04-12 13:34:14.388178','12','NewsType object (12)',3,'',10,1),(22,'2022-04-12 13:34:14.392483','11','NewsType object (11)',3,'',10,1),(23,'2022-04-12 13:34:14.398007','10','NewsType object (10)',3,'',10,1),(24,'2022-04-13 09:18:23.183969','27','NewsType object (27)',3,'',10,1),(25,'2022-04-13 09:18:23.193874','26','NewsType object (26)',3,'',10,1),(26,'2022-04-13 09:18:23.198500','25','NewsType object (25)',3,'',10,1),(27,'2022-04-13 09:18:23.202609','24','NewsType object (24)',3,'',10,1),(28,'2022-04-13 09:18:23.206659','23','NewsType object (23)',3,'',10,1),(29,'2022-04-13 09:18:23.209964','22','NewsType object (22)',3,'',10,1),(30,'2022-04-13 09:18:23.212138','21','NewsType object (21)',3,'',10,1),(31,'2022-04-13 09:18:23.215321','20','NewsType object (20)',3,'',10,1),(32,'2022-04-13 09:18:23.218997','19','NewsType object (19)',3,'',10,1),(33,'2022-04-13 09:18:23.221671','18','NewsType object (18)',3,'',10,1),(34,'2022-04-13 09:18:23.223702','17','NewsType object (17)',3,'',10,1),(35,'2022-04-13 09:18:23.226909','16','NewsType object (16)',3,'',10,1),(36,'2022-04-13 09:18:23.229507','15','NewsType object (15)',3,'',10,1),(37,'2022-04-14 05:40:53.356628','29','NewsType object (29)',3,'',10,1),(38,'2022-04-14 05:40:53.367646','28','NewsType object (28)',3,'',10,1),(39,'2022-04-14 13:09:36.705882','35','NewsType object (35)',3,'',10,1),(40,'2022-04-14 13:09:36.711694','34','NewsType object (34)',3,'',10,1),(41,'2022-04-14 13:09:36.716563','33','NewsType object (33)',3,'',10,1),(42,'2022-04-14 13:09:36.724703','32','NewsType object (32)',3,'',10,1),(43,'2022-04-14 13:09:36.732021','31','NewsType object (31)',3,'',10,1),(44,'2022-04-14 13:09:36.734371','30','NewsType object (30)',3,'',10,1),(45,'2022-04-15 16:46:00.050963','47','NewsType object (47)',3,'',10,1),(46,'2022-04-15 16:46:00.058202','46','NewsType object (46)',3,'',10,1),(47,'2022-04-15 16:46:00.061854','45','NewsType object (45)',3,'',10,1),(48,'2022-04-15 16:46:00.067333','44','NewsType object (44)',3,'',10,1),(49,'2022-04-15 16:46:00.070882','43','NewsType object (43)',3,'',10,1),(50,'2022-04-15 16:46:00.074941','42','NewsType object (42)',3,'',10,1),(51,'2022-04-15 16:46:00.081313','41','NewsType object (41)',3,'',10,1),(52,'2022-04-15 16:46:00.084132','40','NewsType object (40)',3,'',10,1),(53,'2022-04-15 16:46:00.090949','39','NewsType object (39)',3,'',10,1),(54,'2022-04-15 16:46:00.095214','38','NewsType object (38)',3,'',10,1),(55,'2022-04-15 16:46:00.097787','37','NewsType object (37)',3,'',10,1),(56,'2022-04-15 16:46:00.102184','36','NewsType object (36)',3,'',10,1),(57,'2022-04-16 02:50:22.224985','54','NewsType object (54)',3,'',10,1),(58,'2022-04-16 02:50:22.234835','53','NewsType object (53)',3,'',10,1),(59,'2022-04-16 02:50:22.239085','52','NewsType object (52)',3,'',10,1),(60,'2022-04-16 02:50:22.244819','51','NewsType object (51)',3,'',10,1),(61,'2022-04-16 02:50:22.248150','50','NewsType object (50)',3,'',10,1),(62,'2022-04-16 02:50:22.252708','49','NewsType object (49)',3,'',10,1),(63,'2022-04-16 02:50:22.254824','48','NewsType object (48)',3,'',10,1),(64,'2022-04-16 05:28:25.676377','56','NewsType object (56)',3,'',10,1),(65,'2022-04-16 05:28:25.676377','55','NewsType object (55)',3,'',10,1),(66,'2022-04-16 05:59:33.550386','61','NewsType object (61)',3,'',10,1),(67,'2022-04-16 05:59:33.555980','60','NewsType object (60)',3,'',10,1),(68,'2022-04-16 05:59:33.562295','59','NewsType object (59)',3,'',10,1),(69,'2022-04-16 05:59:33.566460','58','NewsType object (58)',3,'',10,1),(70,'2022-04-16 05:59:33.570414','57','NewsType object (57)',3,'',10,1),(71,'2022-04-16 13:14:45.958621','67','NewsType object (67)',3,'',10,1),(72,'2022-04-16 13:14:45.963529','66','NewsType object (66)',3,'',10,1),(73,'2022-04-16 13:14:45.967512','65','NewsType object (65)',3,'',10,1),(74,'2022-04-16 13:14:45.971495','64','NewsType object (64)',3,'',10,1),(75,'2022-04-16 13:14:45.976604','63','NewsType object (63)',3,'',10,1),(76,'2022-04-16 13:14:45.981896','62','NewsType object (62)',3,'',10,1),(77,'2022-04-18 07:09:41.631307','69','NewsType object (69)',3,'',10,1),(78,'2022-04-18 07:09:41.637243','68','NewsType object (68)',3,'',10,1),(79,'2022-04-18 07:46:19.386941','3','mkchollangi1',1,'[{\"added\": {}}]',4,1),(80,'2022-04-19 07:36:19.505844','73','NewsType object (73)',3,'',10,1),(81,'2022-04-19 07:36:19.515788','72','NewsType object (72)',3,'',10,1),(82,'2022-04-19 07:36:19.523946','71','NewsType object (71)',3,'',10,1),(83,'2022-04-19 07:36:19.531963','70','NewsType object (70)',3,'',10,1),(84,'2022-04-19 07:40:46.632575','6','NewsType object (6)',3,'',10,1),(85,'2022-04-21 06:09:21.331390','76','NewsType object (76)',3,'',10,1),(86,'2022-04-21 06:09:21.334982','75','NewsType object (75)',3,'',10,1),(87,'2022-04-26 15:46:05.353699','34','NewsDetails object (34)',3,'',9,1),(88,'2022-04-26 15:46:05.363883','33','NewsDetails object (33)',3,'',9,1),(89,'2022-04-26 15:46:05.368263','32','NewsDetails object (32)',3,'',9,1),(90,'2022-04-26 15:46:05.372709','31','NewsDetails object (31)',3,'',9,1),(91,'2022-04-26 15:46:05.377081','30','NewsDetails object (30)',3,'',9,1),(92,'2022-04-26 15:46:05.381558','29','NewsDetails object (29)',3,'',9,1),(93,'2022-04-26 15:46:05.386040','28','NewsDetails object (28)',3,'',9,1),(94,'2022-04-26 15:46:05.389540','27','NewsDetails object (27)',3,'',9,1),(95,'2022-04-26 15:46:05.394814','26','NewsDetails object (26)',3,'',9,1),(96,'2022-04-28 09:20:53.518163','37','NewsDetails object (37)',3,'',9,1),(97,'2022-04-28 09:20:53.525501','36','NewsDetails object (36)',3,'',9,1),(98,'2022-04-28 09:20:53.533444','35','NewsDetails object (35)',3,'',9,1),(99,'2022-04-29 10:14:29.055806','74','NewsDetails object (74)',3,'',9,1),(100,'2022-04-29 10:14:29.065897','73','NewsDetails object (73)',3,'',9,1),(101,'2022-04-29 10:14:29.070675','72','NewsDetails object (72)',3,'',9,1),(102,'2022-04-29 10:14:29.074659','71','NewsDetails object (71)',3,'',9,1),(103,'2022-04-29 10:14:29.078405','70','NewsDetails object (70)',3,'',9,1),(104,'2022-04-29 10:14:29.082652','69','NewsDetails object (69)',3,'',9,1),(105,'2022-04-29 10:14:29.088893','68','NewsDetails object (68)',3,'',9,1),(106,'2022-04-29 10:14:29.088893','67','NewsDetails object (67)',3,'',9,1),(107,'2022-04-29 10:14:29.096350','66','NewsDetails object (66)',3,'',9,1),(108,'2022-04-29 10:14:29.101110','65','NewsDetails object (65)',3,'',9,1),(109,'2022-04-29 10:14:29.108384','64','NewsDetails object (64)',3,'',9,1),(110,'2022-04-29 10:14:29.112866','63','NewsDetails object (63)',3,'',9,1),(111,'2022-04-29 10:14:29.116328','62','NewsDetails object (62)',3,'',9,1),(112,'2022-04-29 10:14:29.123805','61','NewsDetails object (61)',3,'',9,1),(113,'2022-04-29 10:14:29.128642','60','NewsDetails object (60)',3,'',9,1),(114,'2022-04-29 10:14:29.129149','59','NewsDetails object (59)',3,'',9,1),(115,'2022-04-29 10:14:29.136162','58','NewsDetails object (58)',3,'',9,1),(116,'2022-04-29 10:14:29.142210','57','NewsDetails object (57)',3,'',9,1),(117,'2022-04-29 10:14:29.146272','56','NewsDetails object (56)',3,'',9,1),(118,'2022-04-29 10:14:29.148892','55','NewsDetails object (55)',3,'',9,1),(119,'2022-04-29 10:14:29.155507','54','NewsDetails object (54)',3,'',9,1),(120,'2022-04-29 10:14:29.157152','53','NewsDetails object (53)',3,'',9,1),(121,'2022-04-29 10:14:29.163265','52','NewsDetails object (52)',3,'',9,1),(122,'2022-04-29 10:14:29.168597','51','NewsDetails object (51)',3,'',9,1),(123,'2022-04-29 10:14:29.173551','50','NewsDetails object (50)',3,'',9,1),(124,'2022-04-29 10:14:29.178203','49','NewsDetails object (49)',3,'',9,1),(125,'2022-04-29 10:14:29.182776','48','NewsDetails object (48)',3,'',9,1),(126,'2022-04-29 10:14:29.189270','47','NewsDetails object (47)',3,'',9,1),(127,'2022-04-29 10:14:29.194317','46','NewsDetails object (46)',3,'',9,1),(128,'2022-04-29 10:14:29.198240','45','NewsDetails object (45)',3,'',9,1),(129,'2022-04-29 10:14:29.200952','44','NewsDetails object (44)',3,'',9,1),(130,'2022-04-29 10:14:29.207092','43','NewsDetails object (43)',3,'',9,1),(131,'2022-04-29 10:14:29.207592','42','NewsDetails object (42)',3,'',9,1),(132,'2022-04-29 10:14:29.215930','41','NewsDetails object (41)',3,'',9,1),(133,'2022-04-29 10:14:29.221994','40','NewsDetails object (40)',3,'',9,1),(134,'2022-04-29 10:14:29.228188','39','NewsDetails object (39)',3,'',9,1),(135,'2022-04-29 10:14:29.231556','38','NewsDetails object (38)',3,'',9,1),(136,'2022-04-29 10:36:44.623105','84','NewsDetails object (84)',3,'',9,1),(137,'2022-04-29 10:36:44.630297','83','NewsDetails object (83)',3,'',9,1),(138,'2022-04-29 10:36:44.635724','82','NewsDetails object (82)',3,'',9,1),(139,'2022-04-29 10:36:44.641929','81','NewsDetails object (81)',3,'',9,1),(140,'2022-04-29 10:36:44.645861','80','NewsDetails object (80)',3,'',9,1),(141,'2022-04-29 10:36:44.656524','79','NewsDetails object (79)',3,'',9,1),(142,'2022-04-29 10:36:44.662103','78','NewsDetails object (78)',3,'',9,1),(143,'2022-04-29 10:36:44.666100','77','NewsDetails object (77)',3,'',9,1),(144,'2022-04-29 10:36:44.666600','76','NewsDetails object (76)',3,'',9,1),(145,'2022-04-29 10:36:44.675741','75','NewsDetails object (75)',3,'',9,1),(146,'2022-05-02 07:23:32.495863','81','NewsType object (81)',3,'',10,1),(147,'2022-05-02 07:23:32.503958','80','NewsType object (80)',3,'',10,1),(148,'2022-05-02 07:23:32.510124','79','NewsType object (79)',3,'',10,1),(149,'2022-05-02 07:23:32.510672','78','NewsType object (78)',3,'',10,1),(150,'2022-05-05 14:44:28.607322','86','NewsDetails object (86)',3,'',9,1),(151,'2022-05-18 12:10:42.645342','90','NewsDetails object (90)',3,'',9,1),(152,'2022-05-18 12:10:42.650244','89','NewsDetails object (89)',3,'',9,1),(153,'2022-05-18 12:10:42.655849','88','NewsDetails object (88)',3,'',9,1),(154,'2022-05-18 12:10:42.664048','87','NewsDetails object (87)',3,'',9,1),(155,'2022-05-18 12:11:10.438937','3','NewsDetails object (3)',3,'',9,1),(156,'2022-05-29 08:34:06.074810','1','91290a77be0c74ec0e31bf80aa86bc251bf18361',1,'[{\"added\": {}}]',12,1),(157,'2022-05-29 09:23:04.446676','4','manojchollangi',3,'',4,1),(158,'2022-05-29 09:23:04.457296','2','nani',3,'',4,1),(159,'2022-05-29 09:26:43.476283','3','mkchollangi1',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(160,'2022-05-31 12:00:55.259424','28','Users object (28)',3,'',13,1),(161,'2022-05-31 12:00:55.268145','27','Users object (27)',3,'',13,1),(162,'2022-05-31 12:00:55.272643','26','Users object (26)',3,'',13,1),(163,'2022-05-31 12:00:55.277900','25','Users object (25)',3,'',13,1),(164,'2022-05-31 12:00:55.282101','24','Users object (24)',3,'',13,1),(165,'2022-05-31 12:00:55.283211','23','Users object (23)',3,'',13,1),(166,'2022-05-31 12:00:55.287619','22','Users object (22)',3,'',13,1),(167,'2022-05-31 12:00:55.287619','21','Users object (21)',3,'',13,1),(168,'2022-05-31 12:00:55.287619','20','Users object (20)',3,'',13,1),(169,'2022-05-31 12:00:55.297319','19','Users object (19)',3,'',13,1),(170,'2022-05-31 12:00:55.297319','18','Users object (18)',3,'',13,1),(171,'2022-05-31 12:00:55.305775','17','Users object (17)',3,'',13,1),(172,'2022-05-31 12:00:55.305775','16','Users object (16)',3,'',13,1),(173,'2022-05-31 12:00:55.313337','15','Users object (15)',3,'',13,1),(174,'2022-05-31 12:00:55.318071','14','Users object (14)',3,'',13,1),(175,'2022-05-31 12:00:55.318071','13','Users object (13)',3,'',13,1),(176,'2022-05-31 12:00:55.327803','12','Users object (12)',3,'',13,1),(177,'2022-05-31 12:00:55.332522','11','Users object (11)',3,'',13,1),(178,'2022-05-31 12:00:55.339174','10','Users object (10)',3,'',13,1),(179,'2022-05-31 12:00:55.341224','9','Users object (9)',3,'',13,1),(180,'2022-05-31 12:00:55.349299','8','Users object (8)',3,'',13,1),(181,'2022-05-31 12:00:55.352194','7','Users object (7)',3,'',13,1),(182,'2022-05-31 12:00:55.352194','6','Users object (6)',3,'',13,1),(183,'2022-05-31 12:00:55.360316','5','Users object (5)',3,'',13,1),(184,'2022-05-31 12:00:55.365602','4','Users object (4)',3,'',13,1),(185,'2022-05-31 12:00:55.365602','3','Users object (3)',3,'',13,1),(186,'2022-05-31 12:00:55.374424','2','Users object (2)',3,'',13,1),(187,'2022-05-31 12:00:55.376778','1','Users object (1)',3,'',13,1),(188,'2022-05-31 12:01:35.061072','29','Users object (29)',1,'[{\"added\": {}}]',13,1),(189,'2022-05-31 12:46:24.728169','5','krishna',1,'[{\"added\": {}}]',4,1),(190,'2022-05-31 12:46:56.379230','5','krishna',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(191,'2022-06-03 11:47:55.203675','6','swethasri',1,'[{\"added\": {}}]',4,1),(192,'2022-06-08 09:43:36.084191','97','NewsDetails object (97)',3,'',9,1),(193,'2022-06-08 09:43:36.090143','96','NewsDetails object (96)',3,'',9,1),(194,'2022-06-08 09:43:36.093797','95','NewsDetails object (95)',3,'',9,1),(195,'2022-06-08 09:44:06.322324','92','NewsDetails object (92)',3,'',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'authtoken','token'),(12,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(9,'newsapp','newsdetails'),(10,'newsapp','newstype'),(13,'newseditorapp','users'),(6,'sessions','session'),(8,'testapp','newsdetails'),(7,'testapp','newstype');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-23 12:09:26.985430'),(2,'auth','0001_initial','2022-03-23 12:09:27.985568'),(3,'admin','0001_initial','2022-03-23 12:09:28.230156'),(4,'admin','0002_logentry_remove_auto_add','2022-03-23 12:09:28.244898'),(5,'admin','0003_logentry_add_action_flag_choices','2022-03-23 12:09:28.261553'),(6,'contenttypes','0002_remove_content_type_name','2022-03-23 12:09:28.462844'),(7,'auth','0002_alter_permission_name_max_length','2022-03-23 12:09:28.555177'),(8,'auth','0003_alter_user_email_max_length','2022-03-23 12:09:28.584409'),(9,'auth','0004_alter_user_username_opts','2022-03-23 12:09:28.598915'),(10,'auth','0005_alter_user_last_login_null','2022-03-23 12:09:28.677239'),(11,'auth','0006_require_contenttypes_0002','2022-03-23 12:09:28.681380'),(12,'auth','0007_alter_validators_add_error_messages','2022-03-23 12:09:28.691487'),(13,'auth','0008_alter_user_username_max_length','2022-03-23 12:09:28.774747'),(14,'auth','0009_alter_user_last_name_max_length','2022-03-23 12:09:28.850459'),(15,'auth','0010_alter_group_name_max_length','2022-03-23 12:09:28.880632'),(16,'auth','0011_update_proxy_permissions','2022-03-23 12:09:28.893980'),(17,'auth','0012_alter_user_first_name_max_length','2022-03-23 12:09:28.990150'),(18,'sessions','0001_initial','2022-03-23 12:09:29.053367'),(19,'newsapp','0001_initial','2022-04-05 12:37:28.496864'),(20,'authtoken','0001_initial','2022-05-29 08:32:21.743013'),(21,'authtoken','0002_auto_20160226_1747','2022-05-29 08:32:21.771998'),(22,'authtoken','0003_tokenproxy','2022-05-29 08:32:21.785612');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('02ae6e0qnhaqfn8smrlsvllim6l6xj6b','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1nWzpf:bUH1KxW2wre_Pe5YHV7XovqN98zHa4neCXeiJHF12tM','2022-04-06 12:11:19.293961'),('0qdzvanz49w978l5dezpof6pepa9f2ej','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1nrIVO:4KYp3SNT8DG8vNRSnCLJg6uSkwwXjWcubizNuZxGGn8','2022-06-01 12:10:18.069055'),('2oplzekm6iutrqz03wp2sl0axg77un6b','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1nvIYs:1umHfTOIrSgB8cYfsYEIqHK-G4ogZEW44yjge6g4x0g','2022-06-12 13:02:26.367028'),('2tghxof6ukot32pxn4tjkxwh9dughfpb','.eJxVjEEOwiAQRe_C2hA6wwTq0r1nIAxMpWogKe3KeHdt0oVu_3vvv1SI21rC1mUJc1ZnRer0u3FMD6k7yPdYb02nVtdlZr0r-qBdX1uW5-Vw_w5K7OVbg-Ms7DFOZJ3FJAxkKJEDYDZsaLIIo4eMMCASisVBDIpLkpP1o3p_ANv2N2M:1nwitm:ePwgSZR5bi4a7Z2aZzmK-R8aO19pcjR7OUCmuqLXpnA','2022-06-16 11:21:54.535065'),('4bns97q6r9gj1p4ivdziheca7qrs4yfb','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1ngiOf:d31_KsTfDQcLQEaSNIfGcpQo_JgjKiC70XtsEMFXVO4','2022-05-03 07:35:37.973233'),('7t1spzxyn4x0rgejid4o9x8rjhhpbz03','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1nfiFj:ceAgKQZ0XmVumFJAMPyaTrMlL1bHsTu4vUpDEjoQuTg','2022-04-30 13:14:15.176119'),('a88go798m4n1fpopylfrg841voosgw8p','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1ngM69:V9EVff0ZTqSSl7lkzXpE5bApSMY6dOg2d12dxFCpSBA','2022-05-02 07:47:01.847250'),('at9dbw8g1u6v4m3z3fx3kh76f4kr2dlg','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1neHMa:HbZuiO0Do-pECZQmsQp3cth4Ph--MvWJLtFtVNBQ42Y','2022-04-26 14:19:24.655102'),('e9gui7acbsdihzjkk1al5nvf5ekf9k4a','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1nlQOS:fDXkZI2PqgXFMIvFC54124o7DovQt829MAiU4hoTUV8','2022-05-16 07:22:52.924032'),('hzcbtspwfkpwjbm7gq6gxssyy1c6ngv2','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1njNNb:JQMDA8ONBW-dg_DEIjM8eX2UZuZHjVadpn5KjT3bznE','2022-05-10 15:45:31.793451'),('qc92neu9ew3f5dmew1quk9aytkcyour2','e30:1nwLk0:P-b0PIlNpZSBVVpSizuUdSAjgp6AWOtKegPvRm7xJcE','2022-06-15 10:38:16.214500'),('x2sf2rf6mltt4d2tncmvaoaiip4o6fch','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1nkNz2:Mc5kVdJbdd784th23TiFkBUsOPFZxR3DmPeuBYZpygs','2022-05-13 10:36:20.785557'),('x85etzy232xr7vt9smsj3m4l18c1pdu4','.eJxVjDsOwjAQRO_iGlle_01JnzNYXq-DA8iR4qRC3J1ESgHFNPPezJvFtK01br0scSJ2ZcAuvx2m_CztAPRI7T7zPLd1mZAfCj9p58NM5XU73b-Dmnrd18Ebkqi8R5XA-XE0ZC2IIAsGsFL7PSBAaZWTcag0GBDokAQpjdmxzxe0_jak:1nkNcd:ygpG9pCZhymS0nDz65K0QyIWepdYunAw79nS5xn2bKg','2022-05-13 10:13:11.041425');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_details`
--

DROP TABLE IF EXISTS `news_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_details` (
  `slno` int NOT NULL AUTO_INCREMENT,
  `news_header` varchar(500) DEFAULT NULL,
  `news_data` text,
  `news_type` varchar(50) DEFAULT NULL,
  `news_images_urls` varchar(500) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `record_start_date` date DEFAULT NULL,
  `record_end_date` date DEFAULT NULL,
  PRIMARY KEY (`slno`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_details`
--

LOCK TABLES `news_details` WRITE;
/*!40000 ALTER TABLE `news_details` DISABLE KEYS */;
INSERT INTO `news_details` VALUES (1,'Pushkar singh Dami new  chief minister for Utharakand','Pushkar Singh Dhami on Wednesday was sworn in as the Chief Minister of Uttarakhand for a second term. Governor Gurmit Singh administered the oath of office at a function at Parade Ground in Dehradun to Dhami.And amit shah attended the cermony.','NATIONAL','https://images.hindustantimes.com/img/2021/07/04/1600x900/Pushkar_Singh_Dhami_1625366276683_1625366298794.jpg','2022-05-23','2022-05-20','2022-06-21'),(2,'110 in Group-1, 182 in Group-2 State Government issued orders 9 months ago Only 36 jobs were allowed to rise, raising fierce opposition among the unemployed','The state government has allowed APPSC to replace 110 jobs in Group-1 and 182 jobs in Group-2. The government on Thursday issued orders to this effect. In fact, in June last year, Group-1 announced the replacement of Group-2 posts. Of these, only 31 Group-1 posts and 5 Group-2 posts were declared. The unemployed were outraged. With this, the government ordered to increase those posts somewhat.','JOBS','https://ajnews.andhrajyothy.com/appimg/galleries/1822040110432918/04012022104513n1.jpg','2022-04-28','2022-04-28','2022-04-30'),(4,'Email to NIA that Modi will be assassinated and NIA is finding that culprit','The National Investigation Agency (NIA) has received an email from an intruder threatening to assassinate Narendra Modi. The NIA was alerted. The assailant claimed in the mail that he also had 20 kg of RDX to kill thousands of people.','NATIONAL','https://th.bing.com/th/id/OIP.6RqDgR3iSkaAAfPx-O8HNwHaJg?pid=ImgDet&rs=1','2022-04-20','2022-04-20','2022-05-06'),(5,'Thank you Modiji for bringing Achche Dinh! TS IT & MUNCIPAL MINISTER MR KTR SLAMS MODI THAT HE IS BEEING IMPOSING SANTIONS ON TS','KTR FIRES ON PM NARENDRA MODI TO IMPLEMENT SANCTION ON TELANGANA AND THEY ARE BEENING FOLLOWING DIVIDE AND RULE POLICY','TELANGANA','https://ajnews.andhrajyothy.com/appimg/galleries/1822040103122692/04012022053603n91.jpg','2022-04-20','2022-04-20','2022-05-07'),(6,'Another new play by CM Jagan on the abolition of CPS. AS WE KNOW CM Jagan is a Businessman','CM Jagan opens another drama on the abolition of CPS (Contributory Pension Scheme). Another scam is being perpetrated in the name of the Joint Staff Council. Vuhanne, who followed suit in the case of the PRC, is being re-enforced. It was rumored that the CPS would be abolished within a week of coming to power. Tira is now timed with committees.','ANDHRA','https://ajnews.andhrajyothy.com/appimg/galleries/1822040112273123/04012022123059n46.jpg','2022-04-20','2022-04-20','2022-04-30'),(7,'Radiology classes desperately online','Dr. Vemuri Varaprasad, a renowned radiologist from Vijayawada who has conducted continuous radiology classes online, has set a world record and earned a place in the World Book of Records and India Book Records. Varaprasad, Chairman, Indian College of Radiology and Imaging (ICRI) Radiology under the auspices of Indian Radiological and Imaging Association','EDUCATIONAL','https://ajnews.andhrajyothy.com/appimg/galleries/1','2022-04-01','2022-04-01','2022-04-01'),(8,'The government is attacking the people on the day of the opening of new districts in AP','The government started cracking down on the people on the day of the opening of new districts in AP. The government has increased the market value in the district centers. Allows registration ‌ branch to increase market‌ value. Special Chief Secretary Rajat Bhargava issued orders increasing the market value in the district centers. Increased market value in the newly formed 13 district centers. The government has ordered an increase of 20 to 50 per cent in the respective district centers depending on the current value.','ANDHRA','https://ajnews.andhrajyothy.com/appimg/galleries/1822040404464223/04042022164834n23.jpg','2022-04-04','2022-04-04','2022-04-04'),(9,'Telangana government to fill 80000 jobs, coaching classes launched for aspirants','Telangana government is all set to fill up 80000 jobs in the state soon. The vacancies will be filled on highest priority as directed by the Chief Minister KCR. In this regard, to help the aspirants, the state government has launched coaching classes for competitive exams. The coaching classes was launched by State Education Minister P. Sabita Indra Reddy. ','JOBS','https://images.hindustantimes.com/img/2022/04/21/550x309/KCR_1643800437559_1650519388801.jpg','2022-04-04','2022-04-04','2022-04-04'),(10,'\'Tired of Waiting\': Son of Sonia\'s Top Lieutenant Ahmed Patel \'Opens His Options\' Before Gujarat Polls','Faisal Patel, son of late veteran Congress leader Ahmed Patel, had openly expressed his resentment against the grand-old party and added that he is keeping his options open as “he has been tired of waiting”.\r\n\r\nIn a cryptic tweet targeted at Congress, Patel said, “Tired of waiting around. No encouragement from the top brass. Keeping my options open.”','POLITICAL','https://images.news18.com/ibnlive/uploads/2022/04/1600-x-1600-69-16491460933x2.jpg?impolicy=website&width=510&height=356','2022-04-05','2022-04-05','2022-04-05'),(11,'UP CM Yogi Adityanath to Review 100-Day Action Plan by Ministers Today','In the first meeting of the council of ministers after the swearing-in on March 25, the ministers were asked by CM Yogi Adityanath to prepare a target of 100 days for their respective departments.Inn no mood to leave any room for laxity, Uttar Pradesh Chief Minister Yogi Adityanath has asked all the ministers in his cabinet to be ready with an action plan for next 100 days. CM Yogi Adityanath will also be taking a presentation on the 100-day plan from ministers on Tuesday in Lucknow.\r\n\r\nIn the first meeting of the council of ministers after the swearing-in on March 25, the ministers were asked by CM Yogi Adityanath to prepare a target of 100 days for their respective departments. For this, ministers were also asked to prepare the status of their respective departments and chalk out agenda for the coming 100 days.\r\n\r\nThe 100-day action plan will be presented by the ministers and reviewed by CM Yogi Adityanath on Tuesday at Lok Bhawan in Lucknow.\r\n\r\nThe ministers have also been asked to present the account of their department.','POLITICAL','https://images.news18.com/ibnlive/uploads/2022/03/yogi-adityanath-4-16476161773x2.jpg?impolicy=website&width=510&height=356','2022-04-05','2022-04-05','2022-04-05'),(12,'Ukraine crisis: Indian Banks’ Association to asses impact of outstanding student loans','₹121 crore owed by 1,319 students forced to return due to conflict\r\nUnion Finance Minister Nirmala Sitharaman on Monday told Parliament that the government has decided to ask the Indian Banks’ Association (IBA) to assess the impact of the conflict in Ukraine on outstanding education loans of the students who were forced to return from that country. The Association will initiate stakeholder consultations in this regard.\r\n\r\nAs many as 1,319 students had availed of education loans for study in Ukraine with an outstanding balance of ₹121.61 crore, the Minister said in a written reply to Lok Sabha. She was quoting information provided by the IBA from public sector banks and 21 private sector banks as on December 31, 2021.','NATIONAL','https://www.thehindu.com/incoming/nzmjbh/article65290288.ece/alternates/FREE_1200/IMG_Indian_students_retu_2_1_VE9J9GCP.jpg','2022-04-05','2022-04-05','2022-04-05'),(13,'Under the YCP rule .. the state was destroyed','TDP chief Chandrababu said the state was devastated by the YCP rule. Neutrals were invited to come into the TDP. The party wants new blood. Expatriates, experts in various fields are urged to play a role of influencing those around them .. even if they are not able to work directly in direct politics .. to mobilize the society through social media.','ANDHRA','https://i1.wp.com/www.socialnews.xyz/wp-content/uploads/2019/05/20/4f6982aeb5897872ada1364f06ea9253.jpg?quality=80&zoom=1&ssl=1','2022-04-22','2022-04-22','2022-04-24'),(14,'Governor‌ .. decreasing','The Governor, who has been dealing with the state government as if it were a \'Pantam Needa Nada Sai\', has further sharpened his approach. Recently, she held a press meet in Delhi and lashed out at the state government and the CM\'s practice. Recently, she sought comprehensive reports from the government on various issues. Governments usually report to governors on any key issues. In some cases governors give only when requested.','TELANGANA','https://gumlet.assettype.com/freepressjournal/2021-02/2daa3168-b424-4799-8af0-ac1b5ee0700e/tamli_sai.jpg?format=webp&w=400&dpr=2.6','2022-04-22','2022-04-22','2022-04-30'),(15,'Can Modi be called a battebaj‌, a scoundrel?','Throw the ministerial post like a left-footed sandal. If the calculations I say prove to be wrong I will resign and continue as a regular MLA. Guts for BJP leaders. Do you have the courage to answer my calculations? ”Asked KTR Sawal, Minister of State for Municipalities and IT. In a public meeting organized in .. BJP state president Bandi Sanjay.','TELANGANA','https://www.oneindia.com/img/2018/12/kcr5-1544519534.jpg','2022-04-22','2022-04-22','2022-04-30'),(16,'U.K. PM’s inauguration of JCB factory ignorant, says Amnesty','Amnesty India on Thursday slammed British Prime Minister Boris Johnson for inaugurating a JCB factory in Gujarat, just a day after bulldozers made by the company were used for demolitions at the violence-hit Jahangirpuri in Delhi. Terming the move as “ignorant”, the group called on the United Kingdom government not to remain silent.','WORLD','https://www.thehindu.com/incoming/qe9qlm/article65342342.ece/alternates/FREE_1200/1240124649.jpg','2022-04-22','2022-04-22','2022-04-30'),(17,'Russian actions in Ukraine may amount to war crimes: UN','Russian actions in Ukraine, which have included summary executions of civilians and levelling of civilian infrastructure, may amount to war crimes, the U.N. said on Friday.','WORLD','https://www.thehindu.com/news/international/hao8tu/article65344768.ece/alternates/FREE_1200/2022-04-04T123947Z_1923428167_RC2CGT9QXIFM_RTRMADP_3_UKRAINE-CRISIS-UN-RIGHTS.JPG','2022-04-22','2022-04-22','2022-04-30'),(18,'Imran Khan issues ultimatum to hold fresh elections in Pakistan','In a veiled warning to Pakistan\'s military establishment, former prime minister Imran Khan has given an ultimatum to those who have ousted him to rectify their \"mistake\" by holding early elections or else his supporters will reach the capital to overthrow the \"imported government\".','WORLD','https://www.thehindu.com/incoming/uyahjs/article65344346.ece/alternates/FREE_1200/2022-04-21T215150Z_1258983814_RC2XRT9UGV51_RTRMADP_3_PAKISTAN-POLITICS.JPG','2022-04-22','2022-04-22','2022-04-30'),(19,'Prashant Kishor holds talks with Telangana CM KCR','Poll strategist and founder of the Indian Political Action Committee (I-PAC) Prashant Kishor held talks with the chief minister of Telangana, K Chandrashekhar Rao on Saturday. The two had a lengthy one-on-one discussion and were later joined by KCR\'s son, K. T. Rama Rao.   This came amidst talks that the Congress had asked Prashant Kishor to join the party. According to sources, Kishor gave a detailed presentation on the 2024 Lok Sabha elections during the meeting of top Congress leaders at part','TELANGANA','https://akm-img-a-in.tosshub.com/indiatoday/images/story/202204/Prashant_Kishor_1200x768_0_1200x768.jpeg?gra3mQdzzRwZfZWKVAJrj5tl79s0ASMS&size=770:433','2022-04-24','2022-04-24','2022-04-25'),(20,'Pant told Amre: ‘Sir will you go and talk to the umpires or I shall go’','“Sir, will you go and talk to the umpires or shall I go?” That is what Delhi Capitals skipper Rishabh Pant is believed to have told coach Praveen Amre while protesting against the much-talked about umpiring decision during the game against Rajasthan Royals last night.  After DC batsman Rovmen Powell had hit the third six off RR pacer Obed McCoy, Pant, along with others around him in the dugout, were seen gesturing to the umpire, asking for a referral to check for no-ball. At that stage, DC, need','SPORTS','https://wallpapercave.com/wp/wp9025538.jpg','2022-04-24','2022-04-24','2022-04-30'),(21,'Match 37, LSG vs MI Match Prediction – Who will win today’s IPL match between LSG and MI?','Lucknow Super Giants will take on the Mumbai Indians in an exciting fixture at the Wankhede Stadium in Match 37 of IPL 2022. Both teams have had contrasting results so far with the Lucknow Super Giants losing their previous game against the Royal Challengers Bangalore by a close margin, however, their overall campaign has been really good so far. With four wins in seven games, LSG is placed fourth in the points table and is unlikely to make changes to their playing XI.','SPORTS','https://image.crictracker.com/wp-content/uploads/2022/04/Mumbai-Indians-7.jpg','2022-04-24','2022-04-24','2022-04-30'),(22,'Wasim Jaffer posts hilarious meme depicting Virat Kohli’s recent luck with bat','Former Royal Challengers Bangalore (RCB) skipper Virat Kohli’s struggle with the bat continued in a group stage match against the Lucknow Super Giants, as he scored a golden duck. To note, run-machine Kohli has been going through a hard phase in his international career as well and has not been able to produce the kind of performances that cricket fans are used to seeing from him.','SPORTS','https://image.crictracker.com/wp-content/uploads/2022/04/Wasim-Jaffer-and-Virat-Kohli.jpg','2022-04-24','2022-04-24','2022-04-30'),(23,'TPCC Chief takes the responsibility of holding AICC president Rahul\'s meeting at warangal','TPCC chief Revanth reddy has made an announcement that he is holding the responsibility of meeting conducted by TPCC and mr komatireddy will holds the remaining details','POLITICAL','https://assets.thehansindia.com/h-upload/2020/05/20/970732-revanth.jpg','2022-04-25','2022-04-25','2022-04-30'),(24,'Refused Free Hand, Prashant Kishor Turns Down Offer To Join Congress','33\r\nNew Delhi: Election strategist Prashant Kishor said a firm \"no\" to the Congress today as the party indicated that it was not ready for any sweeping change. Offered a slot on the party\'s \"Empowered Action Group\", Mr Kishor declined, with pointed remarks about the Congress\'s need for leadership and \"collective will to fix deep rooted structural problems\". Sources indicated that the 137-year-old party had refused to give him a free hand, despite internally agreeing that they need a fresh face','POLITICAL','https://gumlet.assettype.com/swarajya/2022-03/778c7217-8a5c-43ba-b271-8315338461f2/pjimage__87_.jpg?w=1200&h=750&auto=format%2Ccompress&fit=max','2022-04-26','2022-04-26','2022-04-25'),(25,'Ukraine crisis could be \'wake-up\' call for Europe to also look at developments in Asia: Jaishankar','Ukraine crisis could be \'wake-up\' call for Europe to also look at developments in Asia: Jaishankar\r\nUkraine crisis could be \'wake-up\' call for Europe to also look at developments in Asia: Jaishankar','WORLD','https://www.oneindia.com/politicians/image/302x100x402x1/subrahmanyam-jaishankar-71755.jpg','2022-04-26','2022-04-26',NULL),(91,'The Gyanvapi Mosque-Kashi Vishwanath dispute and the current case','The decades-old Gyanvapi mosque- Kashi Vishwanath case reached the Supreme Court on May 13 after a local court in Varanasi directed that a videography survey at the religious complex be allowed to continue\r\nThe story so far:  On May 16, a local court in Varanasi directed the district administration to seal the spot in the Gyanvapi Masjid complex where a “shivling” was reportedly found during a court-mandated videography survey.','POLITICAL','https://images.dinamani.com/uploads/user/imagelibrary/2022/5/14/original/pti05_14_2022_000146b083334.jpg','2022-06-20','2022-05-20','2022-06-30');
/*!40000 ALTER TABLE `news_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_type`
--

DROP TABLE IF EXISTS `news_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_type` (
  `slno` int NOT NULL AUTO_INCREMENT,
  `news_type` varchar(50) DEFAULT NULL,
  `new_type_display` varchar(100) DEFAULT NULL,
  `record_start_date` date DEFAULT NULL,
  `record_end_date` date DEFAULT NULL,
  PRIMARY KEY (`slno`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_type`
--

LOCK TABLES `news_type` WRITE;
/*!40000 ALTER TABLE `news_type` DISABLE KEYS */;
INSERT INTO `news_type` VALUES (1,'POLITICAL','POLITICAL','2022-04-27','2022-05-30'),(2,'NATIONAL','NATIONAL','2022-05-01','2022-05-05'),(3,'SPORTS','SPORTS','2022-04-19','2022-04-30'),(4,'TELANGANA','TELANGANA','2022-03-03','2022-03-03'),(5,'WORLD','WORLD','2022-04-19','2022-04-30'),(7,'JOBS','JOBS','2022-03-11','2022-03-31'),(9,'EDUCATIONAL','EDUCATION','2022-03-27','2022-03-27'),(74,'ANDHRA','ANDHRA','2022-04-21','2022-04-30'),(77,'FILMS','FILMS','2022-04-22','2022-04-23');
/*!40000 ALTER TABLE `news_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `SLNO` int NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(20) NOT NULL,
  `FIRST_NAME` varchar(50) NOT NULL,
  `LAST_NAME` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `RE_ENTER_PASSWORD` varchar(100) NOT NULL,
  PRIMARY KEY (`SLNO`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (29,'Manoj Kumar','Manoj','Chollangi','mkchollangi@gmail.com','9989M@nu','9989M@nu');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08 15:25:36
