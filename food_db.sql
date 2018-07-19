-- MySQL dump 10.13  Distrib 8.0.11, for osx10.13 (x86_64)
--
-- Host: localhost    Database: food_db
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand_home_banners`
--

DROP TABLE IF EXISTS `brand_home_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brand_home_banners` (
  `brand_home_banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `brand_home_banner_name` varchar(255) NOT NULL,
  `brand_home_banner_name_native` varchar(255) NOT NULL,
  `brand_home_banner_photo` varchar(255) NOT NULL,
  `brand_home_banner_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`brand_home_banner_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `brand_home_banners_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_home_banners`
--

LOCK TABLES `brand_home_banners` WRITE;
/*!40000 ALTER TABLE `brand_home_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_home_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_home_categories`
--

DROP TABLE IF EXISTS `brand_home_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brand_home_categories` (
  `brand_home_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `brand_home_name` varchar(255) NOT NULL,
  `brand_home_name_native` varchar(255) NOT NULL,
  PRIMARY KEY (`brand_home_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `brand_home_categories_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_home_categories`
--

LOCK TABLES `brand_home_categories` WRITE;
/*!40000 ALTER TABLE `brand_home_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_home_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_home_items_details`
--

DROP TABLE IF EXISTS `brand_home_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brand_home_items_details` (
  `brand_home_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`brand_home_id`,`item_id`),
  KEY `item_id` (`item_id`),
  KEY `brand_home_id` (`brand_home_id`),
  CONSTRAINT `brand_home_items_details_ibfk_1` FOREIGN KEY (`brand_home_id`) REFERENCES `brand_home_categories` (`brand_home_id`),
  CONSTRAINT `brand_home_items_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_home_items_details`
--

LOCK TABLES `brand_home_items_details` WRITE;
/*!40000 ALTER TABLE `brand_home_items_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_home_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_items_product_items_details`
--

DROP TABLE IF EXISTS `brand_items_product_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brand_items_product_items_details` (
  `item_id` int(11) NOT NULL,
  `product_item_id` int(11) NOT NULL,
  `product_item_size_id` int(11) NOT NULL,
  `amount_product_item` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`product_item_id`,`product_item_size_id`),
  KEY `item_id` (`item_id`),
  KEY `product_item_id` (`product_item_id`),
  KEY `product_item_size_id` (`product_item_size_id`),
  CONSTRAINT `brand_items_product_items_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `brand_items_product_items_details_ibfk_2` FOREIGN KEY (`product_item_id`) REFERENCES `product_items` (`product_item_id`),
  CONSTRAINT `brand_items_product_items_details_ibfk_3` FOREIGN KEY (`product_item_size_id`) REFERENCES `product_item_sizes` (`product_item_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_items_product_items_details`
--

LOCK TABLES `brand_items_product_items_details` WRITE;
/*!40000 ALTER TABLE `brand_items_product_items_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_items_product_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_name_native` varchar(255) NOT NULL,
  `brand_logo_photo` varchar(255) NOT NULL,
  `brand_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `country_id` (`country_id`),
  KEY `currency_id` (`currency_id`),
  CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON UPDATE CASCADE,
  CONSTRAINT `brands_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,1,2,'Bon Chon','ប៊ុន ចុន','bon_chon_logo.png',1);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands_categories_details`
--

DROP TABLE IF EXISTS `brands_categories_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brands_categories_details` (
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`,`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `brands_categories_details_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `brands_categories_details_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands_categories_details`
--

LOCK TABLES `brands_categories_details` WRITE;
/*!40000 ALTER TABLE `brands_categories_details` DISABLE KEYS */;
INSERT INTO `brands_categories_details` VALUES (1,1);
/*!40000 ALTER TABLE `brands_categories_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands_items_menus_details`
--

DROP TABLE IF EXISTS `brands_items_menus_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brands_items_menus_details` (
  `menu_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`,`item_id`),
  KEY `item_id` (`item_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `brands_items_menus_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `brands_items_menus_details_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands_items_menus_details`
--

LOCK TABLES `brands_items_menus_details` WRITE;
/*!40000 ALTER TABLE `brands_items_menus_details` DISABLE KEYS */;
INSERT INTO `brands_items_menus_details` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(3,12),(3,13),(3,14),(3,15),(4,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(5,23),(5,24),(5,25),(5,26),(5,27);
/*!40000 ALTER TABLE `brands_items_menus_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `category_name_native` varchar(255) NOT NULL,
  `category_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Casual dining','បរិភោគអាហារធម្មតា',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `city_name_native` varchar(255) NOT NULL,
  `city_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `province_id` (`province_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Chamkar Mon','ចំការមន',1),(2,1,'Tuol Kuok','ទួលគោក',1),(3,1,'Sen Sok','សែន សុខ',1);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  `country_name_native` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `country_short_code` varchar(255) NOT NULL,
  `country_enable` int(11) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Cambodia','កម្ពុជា','855','KH',1);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `currencies` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(255) NOT NULL,
  `currency_name_native` varchar(255) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `currency_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Khmer Rield','ខ្មែរ រៀល','KHR',1),(2,'US Dollar','ដុល្លារសហរដ្ឋអាមេរិក','USD',1);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `country_code` varchar(20) NOT NULL,
  `customer_code` varchar(255) NOT NULL,
  `customer_full_name` varchar(255) DEFAULT NULL,
  `customer_phone_number` varchar(255) NOT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_photo` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `customer_enable` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` text,
  `last_login_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_code` (`customer_code`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (14,1,'855','85570822245','Kyhov','070822245','engkyhov@gmail.com','assets/images/customer_profile_photo/5b5043c1a9e1d.jpg','$2y$10$Vcby9dGzOiTag4WY2Bfgyek5tkZXokm.awaSWI2dKOjUgHO/xBiq6',1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xOTIuMTY4LjEuMzY6ODAwMFwvYXBpXC9hdXRoXC9yZV9sb2dpbiIsImlhdCI6MTUzMTk5MDEzNSwiZXhwIjoxNTMxOTkzNzM1LCJuYmYiOjE1MzE5OTAxMzUsImp0aSI6IkwyMjV1UDRPNktMVWVEVUciLCJzdWIiOjE0LCJwcnYiOiI4YjQyMmU2ZjY1NzkzMmI4YWViY2IxYmYxZTM1NmRkNzZhMzY1YmYyIn0.rIF9Q6vek1qFh_S7IyVsEUpUR0Q0-iXIvBtQ_OPDoTE','2018-07-19 08:48:55');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_orders`
--

DROP TABLE IF EXISTS `customers_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`customer_id`),
  KEY `payment_id` (`payment_id`),
  CONSTRAINT `customers_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `customers_orders_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment_methods` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_orders`
--

LOCK TABLES `customers_orders` WRITE;
/*!40000 ALTER TABLE `customers_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_types`
--

DROP TABLE IF EXISTS `item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item_types` (
  `item_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type_name` varchar(255) NOT NULL,
  `item_type_name_native` varchar(255) NOT NULL,
  `item_type_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`item_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_types`
--

LOCK TABLES `item_types` WRITE;
/*!40000 ALTER TABLE `item_types` DISABLE KEYS */;
INSERT INTO `item_types` VALUES (1,'Single Item','មួយឯកត្តា',1),(2,'Group Items','ពហុឯកត្តា',1);
/*!40000 ALTER TABLE `item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_name_native` varchar(255) NOT NULL,
  `item_price` float NOT NULL,
  `item_photo` varchar(255) NOT NULL,
  `item_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `brand_id` (`brand_id`),
  KEY `item_type_id` (`item_type_id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`item_type_id`) REFERENCES `item_types` (`item_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,1,'FIRE CHICKEN','FIRE CHICKEN',8.5,'000001.jpg',1),(2,1,1,'SPICY PORK','SPICY PORK',8.5,'000002.jpg',1),(3,1,1,'BBQ BEEF','BBQ BEEF',8.5,'000003.jpg',1),(4,1,1,'PEPPER SQUID','PEPPER SQUID',8.5,'000004.jpg',1),(5,1,1,'PORK BULGOGI WRAP','សាច់ជ្រូកបែបកូរ៉េ',5,'000005.jpg',1),(6,1,1,'FRIED CALAMARI','មឹកបំពងម្សៅ',5,'000006.jpg',1),(7,1,1,'TAKOYAKI','តាកូយ៉ាគី',4.5,'000007.jpg',1),(8,1,1,'GARLIC FRIES','ដំទ្បូងបារាំងបំពងខ្ទឹមលីង',3.5,'000008.jpg',1),(9,1,1,'FRENCH FRIES','ដំទ្បូងបំពង',3,'000009.jpg',1),(10,1,1,'GYOZA','ខ្យូហ្សា',4.5,'000010.jpg',1),(11,1,1,'CHICKEN JOINT','ឆ្អឹងខ្ចីមាន់',5,'000011.jpg',1),(12,1,1,'CRISPY TAKO CAESAR SALAD','សាទ្បាដតាកូ',7,'000012.jpg',1),(13,1,1,'TOFU SALAD','សាទ្បាតាហ៊ូ',5,'000013.jpg',1),(14,1,1,'SPICY SEAWEED SALAD','សាទ្បាដសារាយសមុទ្រ',5.5,'000014.jpg',1),(15,1,1,'CRISPY CHICKEN SALAD','សាទ្បាដសាច់មាន់',6,'000015.jpg',1),(16,1,1,'TTEOBOKKI – SPICY RICE CAKE DISH SEAFOOD','តុប៉ុកគី ( គ្រឿងសមុទ្រ)',7,'000016.jpg',1),(17,1,1,'SOONDUBU – SOFT TOFU KIMCHI SOUP','ស៊ុបតៅហ៊ូកូរ៉េ',6.5,'000017.jpg',1),(18,1,1,'TTEOBOKKI – SPICY RICE CAKE DISH','តុប៉ុកគី',6.5,'000018.jpg',1),(19,1,1,'JAPCHAE – STIR-FRIED GLASS NOODLES','ចាប់ឈេ',6.5,'000019.jpg',1),(20,1,1,'PORK KIMCHI FRIED RICE & SEAWEED WRAP','បាយឆាសាច់ជ្រូកសារាយសមុទ្រ',6,'000020.jpg',1),(21,1,1,'HOT STONE BIBIMBAP – MIXED RICE POT','ប៊ីប៊ិបបាប់',5.5,'000021.jpg',1),(22,1,1,'BONCHON CRISPY FISH (6 PIECE)','ត្រីបំពងស្រួយ ( ៦ដុំ )',8.5,'000022.jpg',1),(23,1,1,'CHICKEN BURGER (SOY GARLIC OR HOT)','បឺហ្គឺ សាច់មាន់',3,'000023.jpg',1),(24,1,1,'CHICKEN FINGERS','សាច់មាន់ចំណិត',3,'000024.jpg',1),(25,1,1,'BEEF BULGOGI SLIDER','នំបុ័ងសាច់គោ',3,'000025.jpg',1),(26,1,1,'BEEF BULGOGI WRAP','នំបុ័ងខ្ចប់បន្លែ',3,'000026.jpg',1),(27,1,1,'BONCHON CHICKEN TACOS','សាច់មាន់ខ្ចប់បន្លែ',3,'000027.jpg',1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_product_items_details`
--

DROP TABLE IF EXISTS `items_product_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `items_product_items_details` (
  `item_id` int(11) NOT NULL,
  `product_item_id` int(11) NOT NULL,
  `product_item_size_id` int(11) NOT NULL,
  `product_item_amount` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`product_item_id`,`product_item_size_id`),
  KEY `item_id` (`item_id`,`product_item_id`,`product_item_size_id`),
  KEY `product_item_id` (`product_item_id`),
  KEY `product_item_size_id` (`product_item_size_id`),
  CONSTRAINT `items_product_items_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `items_product_items_details_ibfk_2` FOREIGN KEY (`product_item_id`) REFERENCES `product_items` (`product_item_id`),
  CONSTRAINT `items_product_items_details_ibfk_3` FOREIGN KEY (`product_item_size_id`) REFERENCES `product_item_sizes` (`product_item_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_product_items_details`
--

LOCK TABLES `items_product_items_details` WRITE;
/*!40000 ALTER TABLE `items_product_items_details` DISABLE KEYS */;
INSERT INTO `items_product_items_details` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,1),(7,7,1,1),(8,8,1,1),(9,9,1,1),(10,10,1,1),(11,11,1,1),(12,12,1,1),(13,13,1,1),(14,14,1,1),(15,15,1,1),(16,16,1,1),(17,17,1,1),(18,18,1,1),(19,19,1,1),(20,20,1,1),(21,21,1,1),(22,22,1,1),(23,23,1,1),(24,24,1,1),(25,25,1,1),(26,26,1,1),(27,27,1,1);
/*!40000 ALTER TABLE `items_product_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menus` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_name_native` varchar(255) NOT NULL,
  `menu_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,'NEW BULGOGI','NEW BULGOGI',1),(2,1,'APPETIZERS','APPETIZERS',1),(3,1,'SALADS','SALADS',1),(4,1,'MAINS','MAINS',1),(5,1,'BONCHON BITES','BONCHON BITES',1);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_brand_items_details`
--

DROP TABLE IF EXISTS `order_brand_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_brand_items_details` (
  `order_item_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`order_item_detail_id`),
  KEY `order_number` (`order_number`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `order_brand_items_details_ibfk_1` FOREIGN KEY (`order_number`) REFERENCES `orders_brands_details` (`order_number`),
  CONSTRAINT `order_brand_items_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_brand_items_details`
--

LOCK TABLES `order_brand_items_details` WRITE;
/*!40000 ALTER TABLE `order_brand_items_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_brand_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product_items_details`
--

DROP TABLE IF EXISTS `order_product_items_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_product_items_details` (
  `order_item_detail_id` int(11) NOT NULL,
  `product_item_id` int(11) NOT NULL,
  `product_item_size_id` int(11) NOT NULL,
  `amount_product_item` int(11) NOT NULL,
  PRIMARY KEY (`order_item_detail_id`,`product_item_id`,`product_item_size_id`),
  KEY `order_item_detail_id` (`order_item_detail_id`),
  KEY `product_item_id` (`product_item_id`),
  KEY `product_item_size_id` (`product_item_size_id`),
  CONSTRAINT `order_product_items_details_ibfk_1` FOREIGN KEY (`order_item_detail_id`) REFERENCES `order_brand_items_details` (`order_item_detail_id`),
  CONSTRAINT `order_product_items_details_ibfk_2` FOREIGN KEY (`product_item_id`) REFERENCES `product_items` (`product_item_id`),
  CONSTRAINT `order_product_items_details_ibfk_3` FOREIGN KEY (`product_item_size_id`) REFERENCES `product_item_sizes` (`product_item_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_items_details`
--

LOCK TABLES `order_product_items_details` WRITE;
/*!40000 ALTER TABLE `order_product_items_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_items_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_brands_details`
--

DROP TABLE IF EXISTS `orders_brands_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders_brands_details` (
  `order_number` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`order_number`),
  KEY `order_id` (`order_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `orders_brands_details_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `orders_brands_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `customers_orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_brands_details`
--

LOCK TABLES `orders_brands_details` WRITE;
/*!40000 ALTER TABLE `orders_brands_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_brands_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment_methods` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `payment_name` varchar(255) NOT NULL,
  `payment_name_native` varchar(255) NOT NULL,
  `payment_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `payment_methods_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,1,'Cash on delivery','ទូទាត់ពេលទំនិញដល់ដៃ',1),(2,1,'ABA Bank Account','ទូទាត់ជាមួយគណនី ធនាគារ អេ ប៊ី អេ',1),(3,1,'Pi-Pay Account','ទូទាត់ជាមួយគណនី ផាយ ភេ',1);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_item_sizes`
--

DROP TABLE IF EXISTS `product_item_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_item_sizes` (
  `product_item_size_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_item_size_name` varchar(255) NOT NULL,
  `product_item_size_name_native` varchar(255) NOT NULL,
  `product_item_size_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_item_size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_item_sizes`
--

LOCK TABLES `product_item_sizes` WRITE;
/*!40000 ALTER TABLE `product_item_sizes` DISABLE KEYS */;
INSERT INTO `product_item_sizes` VALUES (1,'Normal','ខ្នាតធម្មតា',1),(2,'Small','តូច',1),(3,'Medium','កណ្ដាល',1),(4,'Large','ធំ',1);
/*!40000 ALTER TABLE `product_item_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_items`
--

DROP TABLE IF EXISTS `product_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_items` (
  `product_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_item_name` varchar(255) NOT NULL,
  `product_item_name_native` varchar(255) NOT NULL,
  `product_item_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_items`
--

LOCK TABLES `product_items` WRITE;
/*!40000 ALTER TABLE `product_items` DISABLE KEYS */;
INSERT INTO `product_items` VALUES (1,'FIRE CHICKEN','FIRE CHICKEN',1),(2,'SPICY PORK','SPICY PORK',1),(3,'BBQ BEEF','BBQ BEEF',1),(4,'PEPPER SQUID','PEPPER SQUID',1),(5,'PORK BULGOGI WRAP','សាច់ជ្រូកបែបកូរ៉េ',1),(6,'FRIED CALAMARI','មឹកបំពងម្សៅ',1),(7,'TAKOYAKI','តាកូយ៉ាគី',1),(8,'GARLIC FRIES','ដំទ្បូងបារាំងបំពងខ្ទឹមលីង',1),(9,'FRENCH FRIES','ដំទ្បូងបំពង',1),(10,'GYOZA','ខ្យូហ្សា',1),(11,'CHICKEN JOINT','ឆ្អឹងខ្ចីមាន់',1),(12,'CRISPY TAKO CAESAR SALAD','សាទ្បាដតាកូ',1),(13,'TOFU SALAD','សាទ្បាតាហ៊ូ',1),(14,'SPICY SEAWEED SALAD','សាទ្បាដសារាយសមុទ្រ',1),(15,'CRISPY CHICKEN SALAD','សាទ្បាដសាច់មាន់',1),(16,'TTEOBOKKI – SPICY RICE CAKE DISH SEAFOOD','តុប៉ុកគី ( គ្រឿងសមុទ្រ)',1),(17,'SOONDUBU – SOFT TOFU KIMCHI SOUP','ស៊ុបតៅហ៊ូកូរ៉េ',1),(18,'TTEOBOKKI – SPICY RICE CAKE DISH','តុប៉ុកគី',1),(19,'JAPCHAE – STIR-FRIED GLASS NOODLES','ចាប់ឈេ',1),(20,'PORK KIMCHI FRIED RICE & SEAWEED WRAP','បាយឆាសាច់ជ្រូកសារាយសមុទ្រ',1),(21,'HOT STONE BIBIMBAP – MIXED RICE POT','ប៊ីប៊ិបបាប់',1),(22,'BONCHON CRISPY FISH (6 PIECE)','ត្រីបំពងស្រួយ ( ៦ដុំ )',1),(23,'CHICKEN BURGER (SOY GARLIC OR HOT)','បឺហ្គឺ សាច់មាន់',1),(24,'CHICKEN FINGERS','សាច់មាន់ចំណិត',1),(25,'BEEF BULGOGI SLIDER','នំបុ័ងសាច់គោ',1),(26,'BEEF BULGOGI WRAP','នំបុ័ងខ្ចប់បន្លែ',1),(27,'BONCHON CHICKEN TACOS','សាច់មាន់ខ្ចប់បន្លែ',1);
/*!40000 ALTER TABLE `product_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_items_sizes_details`
--

DROP TABLE IF EXISTS `product_items_sizes_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_items_sizes_details` (
  `product_id` int(11) NOT NULL,
  `product_item_size_id` int(11) NOT NULL,
  `item_size_descr` varchar(1024) NOT NULL,
  PRIMARY KEY (`product_id`,`product_item_size_id`),
  KEY `product_id` (`product_id`),
  KEY `product_item_size_id` (`product_item_size_id`),
  CONSTRAINT `product_items_sizes_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_items` (`product_item_id`),
  CONSTRAINT `product_items_sizes_details_ibfk_2` FOREIGN KEY (`product_item_size_id`) REFERENCES `product_item_sizes` (`product_item_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_items_sizes_details`
--

LOCK TABLES `product_items_sizes_details` WRITE;
/*!40000 ALTER TABLE `product_items_sizes_details` DISABLE KEYS */;
INSERT INTO `product_items_sizes_details` VALUES (1,1,''),(2,1,''),(3,1,''),(4,1,''),(5,1,''),(6,1,''),(7,1,''),(8,1,''),(9,1,''),(10,1,''),(11,1,''),(12,1,''),(13,1,''),(14,1,''),(15,1,''),(16,1,''),(17,1,''),(18,1,''),(19,1,''),(20,1,''),(21,1,''),(22,1,''),(23,1,''),(24,1,''),(25,1,''),(26,1,''),(27,1,'');
/*!40000 ALTER TABLE `product_items_sizes_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `provinces` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `province_name` varchar(255) NOT NULL,
  `province_name_native` varchar(255) NOT NULL,
  `province_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`province_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `provinces_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (1,1,'Phnom Penh','ភ្នំពេញ',1),(2,1,'Siem Reap','សៀមរាប',1);
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_holiday`
--

DROP TABLE IF EXISTS `restaurant_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `restaurant_holiday` (
  `restaurant_holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `restaurant_holiday_date` date NOT NULL,
  `restaurant_holiday_from_hour` time NOT NULL,
  `restaurant_holiday_to_hour` time NOT NULL,
  PRIMARY KEY (`restaurant_holiday_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `restaurant_holiday_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_holiday`
--

LOCK TABLES `restaurant_holiday` WRITE;
/*!40000 ALTER TABLE `restaurant_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_workdays`
--

DROP TABLE IF EXISTS `restaurant_workdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `restaurant_workdays` (
  `restaurant_id` int(11) NOT NULL,
  `workday_id` int(11) NOT NULL,
  `open_hour` time NOT NULL,
  `close_hour` time NOT NULL,
  `restaurant_workday_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`restaurant_id`,`workday_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `workday_id` (`workday_id`),
  CONSTRAINT `restaurant_workdays_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`),
  CONSTRAINT `restaurant_workdays_ibfk_2` FOREIGN KEY (`workday_id`) REFERENCES `workdays` (`workday_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_workdays`
--

LOCK TABLES `restaurant_workdays` WRITE;
/*!40000 ALTER TABLE `restaurant_workdays` DISABLE KEYS */;
INSERT INTO `restaurant_workdays` VALUES (1,1,'07:00:00','20:00:00',1),(1,2,'07:00:00','20:00:00',1),(1,3,'07:00:00','20:00:00',1),(1,4,'07:00:00','20:00:00',1),(1,5,'07:00:00','20:00:00',1),(1,6,'07:00:00','20:00:00',1),(1,7,'07:00:00','20:00:00',1);
/*!40000 ALTER TABLE `restaurant_workdays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `restaurants` (
  `restaurant_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `TimeZone` varchar(255) NOT NULL,
  `timezone_value` int(11) NOT NULL,
  `restaurant_name` varchar(255) NOT NULL,
  `restaurant_name_native` varchar(255) NOT NULL,
  `restaurant_address` varchar(255) NOT NULL,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `restaurant_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`restaurant_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `brand_id` (`brand_id`),
  KEY `province_id` (`province_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `restaurants_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`),
  CONSTRAINT `restaurants_ibfk_3` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`province_id`),
  CONSTRAINT `restaurants_ibfk_4` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,1,1,'+07:00',7,'Bonchon BKK','ប៊ុនចុន សាខា បឹងកេងកង','St. 306, Corner St. 51, Sangkat BKK1, Khan Chamkarmon\r\nPhnom Penh, Cambodia',1,3,1),(2,1,1,'+07:00',7,'Bonchon Phnom Penh Center','ប៊ុនចុន សាខា ភ្នំពេញ សិនធឺ','Phnom Penh Center, Sothearos Blvd. (Corner Sihanouk Blvd)\r\n(Near Build Bright University)',1,3,1),(3,1,1,'+07:00',7,'Bonchon AEON Mall','ប៊ុនចុន សាខា ផ្សារទំនើប អ៊ី អន មល','No. 132 Sothearos Blvd. Unit #0013\r\n(Located on the Ground Floor)',1,3,1),(4,1,1,'+07:00',7,'Bonchon Riverside','ប៊ុនចុន សាខា រីវើសាយ','Riverside, No. 386 Theamak Lethet Ouk (184)\r\nPhnom Penh, Cambodia',1,3,1),(5,1,1,'+07:00',7,'Bonchon AEON MaxValu Express','ប៊ុនចុន សាខា','No. 79, Street 315, Phum 6,\r\nSangkat Boeung Kok 2,\r\nKhan Toul Kork, Phnom Penh, Cambodia',1,3,1),(6,1,1,'+07:00',7,'Bonchon TK Avenue','ប៊ុនចុន សាខា ទួលគោក អេដ វិន ញូ','No. 80, Sangkat Beung Kak 1,\r\nKhan Toul Kork, Phnom Penh, Cambodia',1,3,1),(7,1,1,'+07:00',7,'Bonchon Exchange Square Mall','ប៊ុនចុន សាខា','#S3-01, Second Floor, St. 51-61 and St. 102-106, Sangkat Wat Phnom,\r\nKhan Daun Penh, Phnom Penh, Cambodia',1,3,1),(8,1,1,'+07:00',7,'Bonchon IFL','ប៊ុនចុន សាខា អាយ ហ្អ្វេស ហ្អ្វិល','No. 120C1, St. 110 (Russian Blvd.)\r\nSangkat Tek Laak 1, Khan Toul Kork, Phnom Penh, Cambodia',1,3,1),(9,1,1,'+07:00',7,'Bonchon Attwood','ប៊ុនចុន សាខា អ៊ែដ វ៉ួដ','Unit No. 15 #31E0, Russian Blvd, Sangkat Teok Thla, Khan Sen Sok, Phnom Penh, Cambodia',1,3,1),(10,1,1,'+07:00',7,'Bonchon Sovanna Shopping Center','ប៊ុនចុន សាខា ផ្សារទំនើប សូរិយា','Sovanna Shopping Center. Ground floor, Unit S1-02/06/08. #307-309, Street 271, Sangkat Tumnob Teuk, Khan Chamkar Morn, Phnom Penh, Cambodia',1,3,1),(11,1,1,'+07:00',7,'Bonchon Stung Meanchey','ប៊ុនចុន សាខា ស្ទឹងមានជ័យ','Lot 0013-2 #1024AE0, Street 217\r\nSangkat Stung Meanchey, Khan Meanchey\r\nPhnom Penh, Cambodia',1,3,1),(12,1,1,'+07:00',7,'Bonchon Sorya Center Point','ប៊ុនចុន សាខា ផ្សារទំនើប សូរិយា','Ground floor. Unit FG-F07-08, #13-61\r\nStreet 63, Sangkat Phsar Thmey I\r\nKhan Daun Penh, Phnom Penh, Cambodia',1,3,1);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vendors` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `vendor_first_name` varchar(255) NOT NULL,
  `vendor_last_name` varchar(255) NOT NULL,
  `vendor_gender` varchar(255) NOT NULL,
  `vendor_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`vendor_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `vendors_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,1,'Vendor 1','FOODSTORE','Male',1);
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors_brands_details`
--

DROP TABLE IF EXISTS `vendors_brands_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vendors_brands_details` (
  `vendor_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`vendor_id`,`brand_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `vendors_brands_details_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `vendors_brands_details_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors_brands_details`
--

LOCK TABLES `vendors_brands_details` WRITE;
/*!40000 ALTER TABLE `vendors_brands_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendors_brands_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workdays`
--

DROP TABLE IF EXISTS `workdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `workdays` (
  `workday_id` int(11) NOT NULL AUTO_INCREMENT,
  `workday_name` varchar(255) NOT NULL,
  `workday_name_native` varchar(255) NOT NULL,
  `workday_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`workday_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workdays`
--

LOCK TABLES `workdays` WRITE;
/*!40000 ALTER TABLE `workdays` DISABLE KEYS */;
INSERT INTO `workdays` VALUES (1,'Monday','',1),(2,'Tuesday','',1),(3,'Wednesday','',1),(4,'Thurday','',1),(5,'Friday','',1),(6,'Saturday','',1),(7,'Sunday','',1);
/*!40000 ALTER TABLE `workdays` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-19 16:33:55
