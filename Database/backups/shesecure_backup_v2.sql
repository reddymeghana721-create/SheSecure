-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shesecure
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Super Admin','Moderator','Support','Safety Officer','Police Liaison') DEFAULT 'Moderator',
  `phone` varchar(15) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Vedant Ghule','vedant_admin','vedant@shesecure.com','hash_v123','Super Admin','9876543210',1,NULL,'2026-04-27 16:51:43','2026-04-27 16:51:43'),(2,'Meghana Reddy','meghana_admin','meghana@shesecure.com','hash_m456','Safety Officer','9876543211',1,NULL,'2026-04-27 16:51:43','2026-04-27 16:51:43');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `message` text NOT NULL,
  `message_type` enum('text','image','location','sos','system') DEFAULT 'text',
  `is_read` tinyint(1) DEFAULT '0',
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `reply_to_message_id` int DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `reply_to_message_id` (`reply_to_message_id`),
  CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`reply_to_message_id`) REFERENCES `chats` (`message_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,1,2,'Are you reaching the safe zone shortly?','text',0,NULL,NULL,NULL,NULL,'2026-04-27 16:55:48'),(2,2,1,'Yes, just reached. Sending my current location.','text',0,NULL,NULL,NULL,NULL,'2026-04-27 16:55:48');
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category` enum('Harassment','Stalking','Ride Issue','Unsafe Area','Police Misconduct','App Bug','Fake Profile','Other') NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `priority` enum('Low','Medium','High','Critical') DEFAULT 'Medium',
  `evidence_url` varchar(255) DEFAULT NULL,
  `status` enum('Pending','In Review','Assigned','Resolved','Rejected') DEFAULT 'Pending',
  `admin_remarks` text,
  `assigned_to` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resolved_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (1,1,'App Bug','Location Delay','Live location updates are lagging by 30 seconds.','Medium',NULL,'In Review',NULL,NULL,'2026-04-27 16:56:43','2026-04-27 16:56:43',NULL),(2,2,'Harassment','Stalking Incident','Reported a suspicious vehicle following the ride.','Critical',NULL,'Assigned',NULL,NULL,'2026-04-27 16:56:43','2026-04-27 16:56:43',NULL);
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_locations`
--

DROP TABLE IF EXISTS `live_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `live_locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `accuracy_meters` decimal(6,2) DEFAULT NULL,
  `speed_kmph` decimal(6,2) DEFAULT NULL,
  `battery_level` int DEFAULT NULL,
  `is_sharing` tinyint(1) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `live_locations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_locations`
--

LOCK TABLES `live_locations` WRITE;
/*!40000 ALTER TABLE `live_locations` DISABLE KEYS */;
INSERT INTO `live_locations` VALUES (1,1,18.52043000,73.85674300,5.50,0.00,85,1,'2026-04-27 16:53:00'),(2,2,18.49120000,73.82240000,10.20,15.40,42,1,'2026-04-27 16:53:00');
/*!40000 ALTER TABLE `live_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sos_alerts`
--

DROP TABLE IF EXISTS `sos_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sos_alerts` (
  `alert_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `triggered_by` enum('button','shake','manual','voice') NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `emergency_message` varchar(255) DEFAULT 'Need Help!',
  `status` enum('Active','Resolved','Cancelled') DEFAULT 'Active',
  `battery_level` int DEFAULT NULL,
  `network_status` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `resolved_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`alert_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sos_alerts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sos_alerts`
--

LOCK TABLES `sos_alerts` WRITE;
/*!40000 ALTER TABLE `sos_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sos_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trusted_contacts`
--

DROP TABLE IF EXISTS `trusted_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trusted_contacts` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `relation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `trusted_contacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trusted_contacts`
--

LOCK TABLES `trusted_contacts` WRITE;
/*!40000 ALTER TABLE `trusted_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `trusted_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unsafe_area_reports`
--

DROP TABLE IF EXISTS `unsafe_area_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unsafe_area_reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `issue_type` enum('Harassment','Stalking','Theft','Dark Area','Suspicious Activity','No Police Presence','Unsafe Road','Other') NOT NULL,
  `description` text,
  `severity_level` enum('Low','Medium','High') DEFAULT 'Medium',
  `anonymous_report` tinyint(1) DEFAULT '0',
  `evidence_url` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Verified','Rejected','Resolved') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `unsafe_area_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unsafe_area_reports`
--

LOCK TABLES `unsafe_area_reports` WRITE;
/*!40000 ALTER TABLE `unsafe_area_reports` DISABLE KEYS */;
INSERT INTO `unsafe_area_reports` VALUES (1,1,18.53000000,73.86000000,'Dark Area','Street lights not working near the main gate.','High',0,NULL,'Pending','2026-04-27 16:54:32',NULL),(2,2,18.48000000,73.81000000,'Suspicious Activity','Group of people loitering near the transit point.','Medium',0,NULL,'Pending','2026-04-27 16:54:32',NULL);
/*!40000 ALTER TABLE `unsafe_area_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Vedant Ghule','9876543210','vedant@mitadt.edu.in','hash_v_123','2026-04-25 21:47:43'),(2,'Meghana Reddy','9123456789','meghana@dev.com','hash_m_456','2026-04-25 21:47:43');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shesecure'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-27 22:40:03
