-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: logins
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` int NOT NULL,
  `username_cart` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  KEY `FK32s0a5ksj6n4if2l2gr0cetj2` (`username_cart`),
  CONSTRAINT `FK32s0a5ksj6n4if2l2gr0cetj2` FOREIGN KEY (`username_cart`) REFERENCES `users` (`username`),
  CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,0,1,'john_doe'),(2,1,1,'john_doe'),(3,1,1,'john_doe'),(4,1,1,'john_doe'),(5,2,1,'john_doe'),(6,0,5,'john_doe'),(14,1,4,'venkatesh'),(15,1,3,'venkatesh');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_item_quantity` int DEFAULT NULL,
  `order_item_ids` varchar(255) DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK45807p752nliw18bwdbf53bnd` (`order_item_ids`),
  KEY `FKlf6f9q956mt144wiv6p1yko16` (`product_id`),
  CONSTRAINT `FK45807p752nliw18bwdbf53bnd` FOREIGN KEY (`order_item_ids`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FKlf6f9q956mt144wiv6p1yko16` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,0,'ORD-alexjames-94b0104a',2),(2,3,'ORD-alexjames-94b0104a',2),(3,3,'ORD-alexjames-94b0104a',4),(4,3,'ORD-alexjames-94b0104a',4),(5,0,'ORD-alexjames-92400530',2),(6,3,'ORD-alexjames-92400530',2),(7,3,'ORD-alexjames-92400530',4),(8,3,'ORD-alexjames-92400530',4),(9,0,'ORD-alexjames-d7c17510',2),(10,3,'ORD-alexjames-d7c17510',2),(11,3,'ORD-alexjames-d7c17510',4),(12,3,'ORD-alexjames-d7c17510',4),(13,0,'ORD-alexjames-7b8184b0',2),(14,3,'ORD-alexjames-7b8184b0',2),(15,3,'ORD-alexjames-7b8184b0',4),(16,3,'ORD-alexjames-7b8184b0',4),(17,3,'ORD-venkatesh-ee430e7f',5),(18,1,'ORD-venkatesh-ee430e7f',3),(19,1,'ORD-venkatesh-c68a29fd',4);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK342rpsyr8y2cvbi4sgwlo3eg1` (`user_name`),
  CONSTRAINT `FK342rpsyr8y2cvbi4sgwlo3eg1` FOREIGN KEY (`user_name`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('ORD-alexjames-521b421c','2025-01-05 15:43:57.530000','Ordered','alex_james'),('ORD-alexjames-7b8184b0','2025-01-05 20:33:27.657000','Ordered','alex_james'),('ORD-alexjames-92400530','2025-01-05 20:28:27.713000','Ordered','alex_james'),('ORD-alexjames-94b0104a','2025-01-05 16:05:42.481000','Ordered','alex_james'),('ORD-alexjames-d7c17510','2025-01-05 20:31:09.180000','Ordered','alex_james'),('ORD-venkatesh-c68a29fd','2025-02-20 17:57:50.344000','Ordered','venkatesh'),('ORD-venkatesh-ee430e7f','2025-02-20 17:47:04.574000','Ordered','venkatesh');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `price` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Noise-canceling over-ear headphones with Bluetooth connectivity.',NULL,100,'Wireless Headphones'),(2,'Fitness tracker with heart rate monitor, GPS, and smart notifications.',NULL,200,'Smartwatch'),(3,'Durable and spacious backpack for laptops up to 15 inches.',NULL,50,'Laptop Backpack'),(4,'Portable wireless speaker with 360-degree sound and waterproof design.',NULL,80,'Bluetooth Speaker'),(5,'Adjustable desk lamp with touch control and multiple brightness settings.',NULL,30,'LED Desk Lamp');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('alex_james','password2024'),('emily_smith','mySecurePassword!'),('john_doe','securePass123'),('michael_brown','Br0wnP@ssw0rd'),('sophia_lee','S0ph!@123'),('venkatesh','abc');
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

-- Dump completed on 2025-03-19 15:44:52
