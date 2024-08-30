-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: inventario
-- ------------------------------------------------------
-- Server version	8.0.39

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add equipo',1,'add_equipo'),(2,'Can change equipo',1,'change_equipo'),(3,'Can delete equipo',1,'delete_equipo'),(4,'Can view equipo',1,'view_equipo'),(5,'Can add equipo sede',2,'add_equiposede'),(6,'Can change equipo sede',2,'change_equiposede'),(7,'Can delete equipo sede',2,'delete_equiposede'),(8,'Can view equipo sede',2,'view_equiposede'),(9,'Can add responsable',3,'add_responsable'),(10,'Can change responsable',3,'change_responsable'),(11,'Can delete responsable',3,'delete_responsable'),(12,'Can view responsable',3,'view_responsable'),(13,'Can add sede',4,'add_sede'),(14,'Can change sede',4,'change_sede'),(15,'Can delete sede',4,'delete_sede'),(16,'Can view sede',4,'view_sede'),(17,'Can add tipo equipo',5,'add_tipoequipo'),(18,'Can change tipo equipo',5,'change_tipoequipo'),(19,'Can delete tipo equipo',5,'delete_tipoequipo'),(20,'Can view tipo equipo',5,'view_tipoequipo'),(21,'Can add log entry',6,'add_logentry'),(22,'Can change log entry',6,'change_logentry'),(23,'Can delete log entry',6,'delete_logentry'),(24,'Can view log entry',6,'view_logentry'),(25,'Can add permission',7,'add_permission'),(26,'Can change permission',7,'change_permission'),(27,'Can delete permission',7,'delete_permission'),(28,'Can view permission',7,'view_permission'),(29,'Can add group',8,'add_group'),(30,'Can change group',8,'change_group'),(31,'Can delete group',8,'delete_group'),(32,'Can view group',8,'view_group'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add content type',10,'add_contenttype'),(38,'Can change content type',10,'change_contenttype'),(39,'Can delete content type',10,'delete_contenttype'),(40,'Can view content type',10,'view_contenttype'),(41,'Can add session',11,'add_session'),(42,'Can change session',11,'change_session'),(43,'Can delete session',11,'delete_session'),(44,'Can view session',11,'view_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$dDWIYURt4XRj6Q7T1ZLrBi$HkGJ/MfxHMvkVpCgWNBCWhpk34oqVmFcojn3PifTCbY=','2024-08-26 16:59:38.062734',1,'soporte','','','',1,1,'2024-08-26 16:50:43.413801');
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-08-26 16:52:32.683298','1','Paipa',1,'[{\"added\": {}}]',4,1),(2,'2024-08-26 16:52:39.019553','2','Duitama',1,'[{\"added\": {}}]',4,1),(3,'2024-08-26 16:52:48.965397','1','PC',1,'[{\"added\": {}}]',5,1),(4,'2024-08-26 16:52:58.062546','2','IMPRESORA',1,'[{\"added\": {}}]',5,1),(5,'2024-08-26 17:05:11.735050','1','Edisson Camacho',1,'[{\"added\": {}}]',3,1),(6,'2024-08-26 17:05:18.789449','1','Aura',1,'[{\"added\": {}}]',1,1),(7,'2024-08-26 17:05:32.073742','1','Aura - Paipa',1,'[{\"added\": {}}]',2,1),(8,'2024-08-26 17:07:22.665403','1','Aura - Paipa',2,'[]',2,1),(9,'2024-08-26 17:07:46.944990','2','Michael',1,'[{\"added\": {}}]',1,1),(10,'2024-08-26 17:07:53.082914','2','Michael - Paipa',1,'[{\"added\": {}}]',2,1),(11,'2024-08-26 17:14:11.402099','3','Hercules',1,'[{\"added\": {}}]',1,1),(12,'2024-08-26 17:14:35.807615','3','Hercules - Duitama',1,'[{\"added\": {}}]',2,1),(13,'2024-08-27 15:08:39.537522','2','Duitama',3,'',4,1),(14,'2024-08-27 15:09:00.607315','2','Michael - Paipa',3,'',2,1),(15,'2024-08-27 15:09:00.607315','1','Aura - Paipa',3,'',2,1),(16,'2024-08-27 15:11:04.682930','3','Hercules',3,'',1,1),(17,'2024-08-27 15:11:04.682930','2','Michael',3,'',1,1),(18,'2024-08-27 15:11:04.682930','1','Aura',3,'',1,1),(19,'2024-08-27 15:11:15.902025','1','Edisson Camacho',3,'',3,1),(20,'2024-08-27 15:11:41.274158','3','MONITOR',1,'[{\"added\": {}}]',5,1),(21,'2024-08-27 15:14:17.788186','2','Soporte',1,'[{\"added\": {}}]',3,1),(22,'2024-08-27 15:14:46.012812','4','Optiplex 330 pantalla',1,'[{\"added\": {}}]',1,1),(23,'2024-08-27 15:16:11.835073','5','Horus',1,'[{\"added\": {}}]',1,1),(24,'2024-08-27 15:16:23.980129','4','Horus pantalla',2,'[{\"changed\": {\"fields\": [\"NombreEquipo\"]}}]',1,1),(25,'2024-08-27 15:18:54.236058','6','Laserjet pro mfp m125a',1,'[{\"added\": {}}]',1,1),(26,'2024-08-27 15:22:41.295220','7','Pantalla Camaras Rh',1,'[{\"added\": {}}]',1,1),(27,'2024-08-27 15:26:51.899599','8','Pantalla rh',1,'[{\"added\": {}}]',1,1),(28,'2024-08-27 15:27:47.615833','5','Horus',2,'[]',1,1),(29,'2024-08-27 15:32:35.893467','9','RECUSOS HUMANOS',1,'[{\"added\": {}}]',1,1),(30,'2024-08-27 15:36:13.468592','10','PC_CAMARAS_RH',1,'[{\"added\": {}}]',1,1),(31,'2024-08-27 15:39:17.444057','11','IMPRESORA LEGALIZACIONES',1,'[{\"added\": {}}]',1,1),(32,'2024-08-27 15:42:55.913168','12','PANTALLA LEGALIZACIONES',1,'[{\"added\": {}}]',1,1),(33,'2024-08-27 15:45:44.442797','13','LEGALIZACION',1,'[{\"added\": {}}]',1,1),(34,'2024-08-27 15:48:08.965590','14','IMPRESORA ARCHIVO',1,'[{\"added\": {}}]',1,1),(35,'2024-08-27 15:49:21.796181','14','IMPRESORA',2,'[{\"changed\": {\"fields\": [\"NombreEquipo\"]}}]',1,1),(36,'2024-08-27 15:53:12.102319','15','PANTALLA',1,'[{\"added\": {}}]',1,1),(37,'2024-08-27 15:56:46.568378','16','CONTABILIDAD',1,'[{\"added\": {}}]',1,1),(38,'2024-08-27 15:59:02.250310','17','ARCHIVO 1',1,'[{\"added\": {}}]',1,1),(39,'2024-08-27 16:01:39.396942','18','PANTALLA ARCHIVO 1',1,'[{\"added\": {}}]',1,1),(40,'2024-08-27 16:04:15.785615','19','IMPRESORA ARCHIVO',1,'[{\"added\": {}}]',1,1),(41,'2024-08-27 16:06:31.223109','20','ARCHIVO 2',1,'[{\"added\": {}}]',1,1),(42,'2024-08-27 16:09:06.419425','21','ARCHIVO 2',1,'[{\"added\": {}}]',1,1),(43,'2024-08-27 16:11:45.125012','22','ARCHIVO 3',1,'[{\"added\": {}}]',1,1),(44,'2024-08-27 16:16:05.720670','23','HPNEYPA',1,'[{\"added\": {}}]',1,1),(45,'2024-08-27 16:16:24.515095','4','Horus pantalla - Paipa',1,'[{\"added\": {}}]',2,1),(46,'2024-08-27 16:16:44.445333','5','HPNEYPA - Paipa',1,'[{\"added\": {}}]',2,1),(47,'2024-08-27 16:17:22.661095','6','ARCHIVO 3 - Paipa',1,'[{\"added\": {}}]',2,1),(48,'2024-08-27 16:17:35.409151','7','ARCHIVO 2 - Paipa',1,'[{\"added\": {}}]',2,1),(49,'2024-08-27 16:17:46.378676','8','ARCHIVO 2 - Paipa',1,'[{\"added\": {}}]',2,1),(50,'2024-08-27 16:17:58.102746','9','IMPRESORA ARCHIVO - Paipa',1,'[{\"added\": {}}]',2,1),(51,'2024-08-27 16:18:05.795730','10','PANTALLA ARCHIVO 1 - Paipa',1,'[{\"added\": {}}]',2,1),(52,'2024-08-27 16:18:16.589981','11','ARCHIVO 1 - Paipa',1,'[{\"added\": {}}]',2,1),(53,'2024-08-27 16:18:37.067957','12','CONTABILIDAD - Paipa',1,'[{\"added\": {}}]',2,1),(54,'2024-08-27 16:18:44.183546','13','PANTALLA - Paipa',1,'[{\"added\": {}}]',2,1),(55,'2024-08-27 16:18:51.639806','14','IMPRESORA - Paipa',1,'[{\"added\": {}}]',2,1),(56,'2024-08-27 16:19:13.638561','15','LEGALIZACION - Paipa',1,'[{\"added\": {}}]',2,1),(57,'2024-08-27 16:19:22.582128','16','PANTALLA LEGALIZACIONES - Paipa',1,'[{\"added\": {}}]',2,1),(58,'2024-08-27 16:19:31.544069','17','IMPRESORA LEGALIZACIONES - Paipa',1,'[{\"added\": {}}]',2,1),(59,'2024-08-27 16:19:39.597386','18','PC_CAMARAS_RH - Paipa',1,'[{\"added\": {}}]',2,1),(60,'2024-08-27 16:19:47.827947','19','RECUSOS HUMANOS - Paipa',1,'[{\"added\": {}}]',2,1),(61,'2024-08-27 16:19:57.935524','20','Pantalla rh - Paipa',1,'[{\"added\": {}}]',2,1),(62,'2024-08-27 16:20:06.913220','21','Pantalla Camaras Rh - Paipa',1,'[{\"added\": {}}]',2,1),(63,'2024-08-27 16:20:17.420028','22','Laserjet pro mfp m125a - Paipa',1,'[{\"added\": {}}]',2,1),(64,'2024-08-27 16:20:23.487049','23','Horus - Paipa',1,'[{\"added\": {}}]',2,1),(65,'2024-08-27 16:20:32.324888','24','Horus pantalla - Paipa',1,'[{\"added\": {}}]',2,1),(66,'2024-08-27 16:29:17.507583','4','Horus pantalla',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(67,'2024-08-27 16:29:34.178375','4','Horus pantalla',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(68,'2024-08-27 16:41:29.946016','4','Horus pantalla',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(69,'2024-08-27 16:41:35.414088','4','Horus pantalla',2,'[]',1,1),(70,'2024-08-27 16:41:41.804876','5','Horus',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(71,'2024-08-27 16:41:57.464559','6','Laserjet pro mfp m125a',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(72,'2024-08-27 16:42:06.462393','23','HPNEYPA',2,'[]',1,1),(73,'2024-08-27 16:42:23.570746','6','Laserjet pro mfp m125a',2,'[]',1,1),(74,'2024-08-27 16:42:35.315357','7','Pantalla Camaras Rh',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(75,'2024-08-27 16:42:42.174605','8','Pantalla rh',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(76,'2024-08-27 16:42:49.843236','9','RECUSOS HUMANOS',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(77,'2024-08-27 16:42:55.520576','10','PC_CAMARAS_RH',2,'[]',1,1),(78,'2024-08-27 16:43:01.143832','11','IMPRESORA LEGALIZACIONES',2,'[]',1,1),(79,'2024-08-27 16:43:48.279564','22','ARCHIVO 3',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(80,'2024-08-27 16:44:01.203735','21','ARCHIVO 2',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(81,'2024-08-27 17:28:24.085644','24','falso',1,'[{\"added\": {}}]',1,1),(82,'2024-08-27 17:28:38.577137','25','falso - Paipa',1,'[{\"added\": {}}]',2,1),(83,'2024-08-27 17:31:49.665326','25','falso - Paipa',3,'',2,1),(84,'2024-08-30 16:37:42.327474','25','Clio',1,'[{\"added\": {}}]',1,1),(85,'2024-08-30 16:37:51.013918','26','Clio - Paipa',1,'[{\"added\": {}}]',2,1),(86,'2024-08-30 16:38:51.629967','26','Gaia',1,'[{\"added\": {}}]',1,1),(87,'2024-08-30 16:38:56.585927','27','Gaia - Paipa',1,'[{\"added\": {}}]',2,1),(88,'2024-08-30 16:40:04.734336','27','Thalia',1,'[{\"added\": {}}]',1,1),(89,'2024-08-30 16:40:13.815877','28','Thalia - Paipa',1,'[{\"added\": {}}]',2,1),(90,'2024-08-30 16:41:02.835147','28','Ione',1,'[{\"added\": {}}]',1,1),(91,'2024-08-30 16:41:08.237212','29','Ione - Paipa',1,'[{\"added\": {}}]',2,1),(92,'2024-08-30 16:41:57.373640','29','Pallas',1,'[{\"added\": {}}]',1,1),(93,'2024-08-30 16:42:01.870107','30','Pallas - Paipa',1,'[{\"added\": {}}]',2,1),(94,'2024-08-30 16:43:00.425012','30','Urania',1,'[{\"added\": {}}]',1,1),(95,'2024-08-30 16:43:03.820507','31','Urania - Paipa',1,'[{\"added\": {}}]',2,1),(96,'2024-08-30 16:43:59.522217','31','Cora',1,'[{\"added\": {}}]',1,1),(97,'2024-08-30 16:44:04.211827','32','Cora - Paipa',1,'[{\"added\": {}}]',2,1),(98,'2024-08-30 16:44:46.640164','32','Harmonía',1,'[{\"added\": {}}]',1,1),(99,'2024-08-30 16:44:51.037968','33','Harmonía - Paipa',1,'[{\"added\": {}}]',2,1),(100,'2024-08-30 16:45:36.624409','33','Larissa',1,'[{\"added\": {}}]',1,1),(101,'2024-08-30 16:45:41.301166','34','Larissa - Paipa',1,'[{\"added\": {}}]',2,1),(102,'2024-08-30 16:46:33.928186','34','Calypso',1,'[{\"added\": {}}]',1,1),(103,'2024-08-30 16:46:39.545404','35','Calypso - Paipa',1,'[{\"added\": {}}]',2,1),(104,'2024-08-30 16:47:27.219475','35','Circe',1,'[{\"added\": {}}]',1,1),(105,'2024-08-30 16:47:31.380967','36','Circe - Paipa',1,'[{\"added\": {}}]',2,1),(106,'2024-08-30 16:48:20.383832','36','Erato',1,'[{\"added\": {}}]',1,1),(107,'2024-08-30 16:48:27.553821','37','Erato - Paipa',1,'[{\"added\": {}}]',2,1),(108,'2024-08-30 16:49:34.080010','37','Calliope',1,'[{\"added\": {}}]',1,1),(109,'2024-08-30 16:49:39.404885','38','Calliope - Paipa',1,'[{\"added\": {}}]',2,1),(110,'2024-08-30 16:50:30.593113','38','Alke',1,'[{\"added\": {}}]',1,1),(111,'2024-08-30 16:50:34.901591','39','Alke - Paipa',1,'[{\"added\": {}}]',2,1),(112,'2024-08-30 16:51:38.804965','39','Gauce',1,'[{\"added\": {}}]',1,1),(113,'2024-08-30 16:51:43.085266','40','Gauce - Paipa',1,'[{\"added\": {}}]',2,1),(114,'2024-08-30 16:53:07.674039','40','Alcippe',1,'[{\"added\": {}}]',1,1),(115,'2024-08-30 16:53:21.785378','41','Alcippe - Paipa',1,'[{\"added\": {}}]',2,1),(116,'2024-08-30 16:54:14.375523','41','Agave',1,'[{\"added\": {}}]',1,1),(117,'2024-08-30 16:54:18.552115','42','Agave - Paipa',1,'[{\"added\": {}}]',2,1),(118,'2024-08-30 16:55:00.074282','42','Asteria',1,'[{\"added\": {}}]',1,1),(119,'2024-08-30 16:55:05.131957','43','Asteria - Paipa',1,'[{\"added\": {}}]',2,1),(120,'2024-08-30 16:56:00.199796','43','Erebea',1,'[{\"added\": {}}]',1,1),(121,'2024-08-30 16:56:05.332446','44','Erebea - Paipa',1,'[{\"added\": {}}]',2,1),(122,'2024-08-30 16:56:53.833941','44','Evandre',1,'[{\"added\": {}}]',1,1),(123,'2024-08-30 16:56:57.875775','45','Evandre - Paipa',1,'[{\"added\": {}}]',2,1),(124,'2024-08-30 17:04:29.044671','39','Gauce',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(125,'2024-08-30 17:04:30.540788','40','Gauce - Paipa',2,'[]',2,1),(126,'2024-08-30 17:04:55.811083','41','Agave',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(127,'2024-08-30 17:05:32.615585','32','Harmonía',2,'[{\"changed\": {\"fields\": [\"UrlImagen\"]}}]',1,1),(128,'2024-08-30 17:06:48.487701','25','Clio',2,'[]',1,1),(129,'2024-08-30 17:07:06.582769','30','Urania',2,'[]',1,1),(130,'2024-08-30 17:07:26.709044','29','Pallas',2,'[]',1,1),(131,'2024-08-30 17:08:16.691309','28','Ione',2,'[]',1,1),(132,'2024-08-30 17:09:11.938103','27','Thalia',2,'[]',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(8,'auth','group'),(7,'auth','permission'),(9,'auth','user'),(10,'contenttypes','contenttype'),(1,'inventario_app','equipo'),(2,'inventario_app','equiposede'),(3,'inventario_app','responsable'),(4,'inventario_app','sede'),(5,'inventario_app','tipoequipo'),(11,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-26 16:48:52.817279'),(2,'auth','0001_initial','2024-08-26 16:48:53.786347'),(3,'admin','0001_initial','2024-08-26 16:48:54.032945'),(4,'admin','0002_logentry_remove_auto_add','2024-08-26 16:48:54.040850'),(5,'admin','0003_logentry_add_action_flag_choices','2024-08-26 16:48:54.066680'),(6,'contenttypes','0002_remove_content_type_name','2024-08-26 16:48:54.228283'),(7,'auth','0002_alter_permission_name_max_length','2024-08-26 16:48:54.315657'),(8,'auth','0003_alter_user_email_max_length','2024-08-26 16:48:54.349354'),(9,'auth','0004_alter_user_username_opts','2024-08-26 16:48:54.361668'),(10,'auth','0005_alter_user_last_login_null','2024-08-26 16:48:54.433842'),(11,'auth','0006_require_contenttypes_0002','2024-08-26 16:48:54.442710'),(12,'auth','0007_alter_validators_add_error_messages','2024-08-26 16:48:54.447629'),(13,'auth','0008_alter_user_username_max_length','2024-08-26 16:48:54.559384'),(14,'auth','0009_alter_user_last_name_max_length','2024-08-26 16:48:54.657532'),(15,'auth','0010_alter_group_name_max_length','2024-08-26 16:48:54.683558'),(16,'auth','0011_update_proxy_permissions','2024-08-26 16:48:54.704893'),(17,'auth','0012_alter_user_first_name_max_length','2024-08-26 16:48:54.813893'),(18,'inventario_app','0001_initial','2024-08-26 16:48:54.825048'),(19,'sessions','0001_initial','2024-08-26 16:48:54.896604');
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
INSERT INTO `django_session` VALUES ('nh8iok4qgc1tql3ns7y029zthb1onfbh','.eJxVjMsOwiAQRf-FtSEUOjxcuvcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mzGMTpd0uYH9x2QHdst1nmua3LlOSuyIN2eZ2Jn5fD_Tuo2Ou3NsEDKCIwdjRpsEolNtqhZ1u0KybbAGhZQwHt1Jg1BoIcHFlNyRcU7w--mDd-:1sid46:UtaZPfSD6AjkmsvdBiohEdHy3uRzZ3Jrg55b2u06vME','2024-09-09 16:59:38.068695');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `idEquipo` int NOT NULL AUTO_INCREMENT,
  `nombreEquipo` varchar(100) DEFAULT NULL,
  `modeloEquipo` varchar(100) DEFAULT NULL,
  `serialEquipo` varchar(100) DEFAULT NULL,
  `estadoOperatividad` varchar(100) DEFAULT NULL,
  `sistemaOperativo` varchar(100) DEFAULT NULL,
  `idTipoEquipo` int DEFAULT NULL,
  `caracteristivas` varchar(500) DEFAULT NULL,
  `idResponsable` int DEFAULT NULL,
  `urlImagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idEquipo`),
  KEY `idTipoEquipo` (`idTipoEquipo`),
  KEY `idResponsable` (`idResponsable`),
  CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idTipoEquipo`) REFERENCES `tipoequipo` (`idTipoEquipo`),
  CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`idResponsable`) REFERENCES `responsable` (`idResponsable`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (4,'Horus pantalla','Mtm:6207-HB1','0M0340393963046','Bueno','No contiene',3,'Pantalla negra',2,'pantallalenovo.jpeg'),(5,'Horus','Optiplex 330','na','Bueno','na',1,'na',2,'Horus.jpeg'),(6,'Laserjet pro mfp m125a','Laserjet pro mfp m125a','CNB6h58dgc','Bueno','na',2,'na',2,'ImpresoraRh.jpeg'),(7,'Pantalla Camaras Rh','l1908w','3CQ9181SBG','Bueno','NA',3,'NA',2,'Pcamarasrh.jpeg'),(8,'Pantalla rh','P19175','CN-09PX3G-TV100-88U-1Z8L-A09','Bueno','NA',3,'NA',2,'pantallarh.jpeg'),(9,'RECUSOS HUMANOS','HP PRODESK 600G1 SFF','2UA4471CRG','Bueno','Windows 10',1,'8 ram , i5 4590 , 300gb , 250gb',2,'PCRH.jpeg'),(10,'PC_CAMARAS_RH','THINKCENTRTE EDGE71','NA','Bueno','WINDOWS 8 MINIOS',1,'500 gb , 2 gb ram, windows 8  minios , i3 2130 3.40',2,'PC_CAMARAS_RH.jpeg'),(11,'IMPRESORA LEGALIZACIONES','PROXPRESS M3370FD','ZD80BJEJ5001HK','Bueno','NA',2,'NA',2,'IMPRESORALEGALIZACIONES.jpeg'),(12,'PANTALLA LEGALIZACIONES','FP1707','HSTND-2231-A','Bueno','NA',3,'NA',2,'PANTALLALEGALIZACIONES.jpeg'),(13,'LEGALIZACION','NA','NA','Bueno','Windows 10',1,'8 gb de ram , i5 6500 3.20 ghz , Disco 250 gb',2,'PCLEGALIZACION.jpeg'),(14,'IMPRESORA','M200','UKTY004832','Bueno','NA',2,'NA',2,'IMPRESORAARCHIVO.jpeg'),(15,'PANTALLA','l1908w','HSTND-2351-A','Bueno','NA',3,'NA',2,'PANTALLA.jpeg'),(16,'CONTABILIDAD','HP COMPAQ PRO 6300','MXL3289B3','Bueno','Windows 10',1,'240 gb , 500 gb , 8 gb ram , i7 3770 3. 40 ghz',2,'PCCONTABILIDAD.jpeg'),(17,'ARCHIVO 1','HP COMPAQ 6000 PRO','MXJ0002006R','Bueno','Windows 10',1,'inte core 2 duo , 2.93 ghz , 6 gb de ram',2,'ARCHIVO1.jpeg'),(18,'PANTALLA ARCHIVO 1','FP1707','CNC7061R1C','Bueno','NA',3,'NA',2,'PANTALLAARCHIVO1.jpeg'),(19,'IMPRESORA ARCHIVO','HP Laserjet P1006','VND4','Bueno','NA',2,'NA',2,'IMPRESORAARCHIVO1.jpeg'),(20,'ARCHIVO 2','HP PRODESK 600 G2 SFF','MXL6101711','Bueno','Windows 10',1,'500 gb , i5 6600 3.30ghz , 8 gb ram',2,'ARCHIVO2.jpeg'),(21,'ARCHIVO 2','FP1707','CNC7061SQW','Bueno','NA',3,'NA',2,'PANTALLAARCHIVO2.jpeg'),(22,'ARCHIVO 3','FP1707','CNC7061SDM','Bueno','NA',3,'NA',2,'PANTALLAARCHIIVO3.jpeg'),(23,'HPNEYPA','HP COMPAQ PRO 6300','MXL3472JK3','Bueno','Windows 10',1,'I3 - 3240 , 4gb de ram, 230 gb',2,'ARCHIVO3.jpeg'),(24,'falso','ssss','sss','sss','sss',1,'ssss',2,'ssss'),(25,'Clio','NA','NA','Bueno','NA',1,'no ram, no disco',2,'Clio.jpeg'),(26,'Gaia','NA','NA','Bueno','NA',1,'no ram, no disco ,  no 2032',2,'Gaia.jpeg'),(27,'Thalia','NA','NA','Bueno','NA',1,'Funcional 6 GB de ram, no disco',2,'Thalia.jpeg'),(28,'Ione','NA','NA','Bueno','NA',1,'Funcional, no disco , no ram',2,'Ione.jpeg'),(29,'Pallas','NA','NA','Bueno','NA',1,'Pc antiguo Angie 2 piso , Funcional',2,'Pallas.jpeg'),(30,'Urania','NA','NA','Malo','NA',1,'problema con board',2,'Urania.jpeg'),(31,'Cora','NA','NA','Bueno','NA',1,'Funcional, sin disco , sin ram',2,'Cora.jpeg'),(32,'Harmonía','NA','NA','Bueno','NA',1,'Funcional, sin disco , sin ram , sin 2032',2,'Harmonia.jpeg'),(33,'Larissa','NA','NA','Bueno','NA',1,'Funcional , sin ram , sin disco',2,'Larissa.jpeg'),(34,'Calypso','NA','NA','Bueno','NA',1,'Funcional no ram, no disco',2,'Calypso.jpeg'),(35,'Circe','NA','NA','Bueno','NA',1,'Funcional, no ram , no disco, no 2032',2,'Circe.jpeg'),(36,'Erato','NA','NA','Bueno','NA',1,'Erato , No ram , no disco ,funciona no 2032',2,'Erato.jpeg'),(37,'Calliope','NA','NA','Bueno','NA',1,'Funcional, no ram, no disco , no 2032',2,'Calliope.jpeg'),(38,'Alke','NA','NA','Bueno','NA',1,'Funcional, no disco, no ram , no 2032',2,'Alke.jpeg'),(39,'Gauce','NA','NA','Bueno','NA',1,'sin ram , sin disco',2,'Glauce.jpeg'),(40,'Alcippe','NA','NA','Bueno','NA',1,'Funcional , con disco y memorias',2,'Alcippe.jpeg'),(41,'Agave','NA','NA','Malo','NA',1,'Fuente dañada , no ram , no disco',2,'AGAVE.jpeg'),(42,'Asteria','NA','NA','Bueno','NA',1,'Funcional, no ram , no disco',2,'Asteria.jpeg'),(43,'Erebea','NA','NA','Malo','NA',1,'Fuente dañada , no ram, no disco',2,'Erebea.jpeg'),(44,'Evandre','NA','NA','Malo','NA',1,'sin board, solo chasis destruido',2,'Evandre.jpeg');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equiposede`
--

DROP TABLE IF EXISTS `equiposede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equiposede` (
  `idEquipoSede` int NOT NULL AUTO_INCREMENT,
  `idEquipo` int DEFAULT NULL,
  `idSede` int DEFAULT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEquipoSede`),
  KEY `idEquipo` (`idEquipo`),
  KEY `idSede` (`idSede`),
  CONSTRAINT `equiposede_ibfk_1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`),
  CONSTRAINT `equiposede_ibfk_2` FOREIGN KEY (`idSede`) REFERENCES `sede` (`idSede`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equiposede`
--

LOCK TABLES `equiposede` WRITE;
/*!40000 ALTER TABLE `equiposede` DISABLE KEYS */;
INSERT INTO `equiposede` VALUES (4,4,1,'Piso 3'),(5,23,1,'Piso 3'),(6,22,1,'Piso 3'),(7,21,1,'Piso 3'),(8,20,1,'Piso 3'),(9,19,1,'Piso 3'),(10,18,1,'Piso 3'),(11,17,1,'Piso 3'),(12,16,1,'Piso 3'),(13,15,1,'Piso 3'),(14,14,1,'Piso 3'),(15,13,1,'Piso 3'),(16,12,1,'Piso 3'),(17,11,1,'Piso 3'),(18,10,1,'Piso 3'),(19,9,1,'Piso 3'),(20,8,1,'Piso 3'),(21,7,1,'Piso 3'),(22,6,1,'Piso 3'),(23,5,1,'Piso 3'),(24,4,1,'Piso 3'),(26,25,1,'Bodega'),(27,26,1,'Bodega'),(28,27,1,'Bodega'),(29,28,1,'Bodega'),(30,29,1,'Bodega'),(31,30,1,'Bodega'),(32,31,1,'Bodega'),(33,32,1,'Bodega'),(34,33,1,'Bodega'),(35,34,1,'Bodega'),(36,35,1,'Bodega'),(37,36,1,'Bodega'),(38,37,1,'Bodega'),(39,38,1,'Bodega'),(40,39,1,'Bodega'),(41,40,1,'Bodega'),(42,41,1,'Bodega'),(43,42,1,'Bodega'),(44,43,1,'Bodega'),(45,44,1,'Bodega');
/*!40000 ALTER TABLE `equiposede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsable`
--

DROP TABLE IF EXISTS `responsable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsable` (
  `idResponsable` int NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(255) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idResponsable`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsable`
--

LOCK TABLES `responsable` WRITE;
/*!40000 ALTER TABLE `responsable` DISABLE KEYS */;
INSERT INTO `responsable` VALUES (2,'Soporte','soporte@gmail.com','12222112');
/*!40000 ALTER TABLE `responsable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `idSede` int NOT NULL AUTO_INCREMENT,
  `nombreSede` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSede`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Paipa');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoequipo`
--

DROP TABLE IF EXISTS `tipoequipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoequipo` (
  `idTipoEquipo` int NOT NULL AUTO_INCREMENT,
  `tipoEquipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idTipoEquipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoequipo`
--

LOCK TABLES `tipoequipo` WRITE;
/*!40000 ALTER TABLE `tipoequipo` DISABLE KEYS */;
INSERT INTO `tipoequipo` VALUES (1,'PC'),(2,'IMPRESORA'),(3,'MONITOR');
/*!40000 ALTER TABLE `tipoequipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 12:15:21
