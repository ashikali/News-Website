-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: onno
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_foreign` (`user_id`),
  CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'wSLm1J3xyV9Tnn9yqraMLpf5JgCyQbfy',1,'2021-08-08 11:03:03','2021-08-08 11:03:03','2021-08-08 11:03:03');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_locations`
--

DROP TABLE IF EXISTS `ad_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ad_locations_unique_name_unique` (`unique_name`),
  KEY `ad_locations_ad_id_foreign` (`ad_id`),
  CONSTRAINT `ad_locations_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_locations`
--

LOCK TABLES `ad_locations` WRITE;
/*!40000 ALTER TABLE `ad_locations` DISABLE KEYS */;
INSERT INTO `ad_locations` VALUES (1,'Top Banner','top_banner',NULL,1,NULL,NULL),(2,'Home Page Middle','home_page_middle',NULL,1,NULL,NULL),(3,'Home Page Bottom','home_page_bottom',NULL,1,NULL,NULL),(4,'Widget','widget',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `ad_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ad_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ad_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ad_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ad_image_id` bigint unsigned DEFAULT NULL,
  `ad_code` longtext COLLATE utf8mb4_unicode_ci,
  `ad_text` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ads_ad_image_id_foreign` (`ad_image_id`),
  CONSTRAINT `ads_ad_image_id_foreign` FOREIGN KEY (`ad_image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (4,'Buy Now','970*90','image','',28,NULL,NULL,'2021-08-15 08:56:22','2021-08-15 09:10:31');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tabs` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cover image',
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cover image',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `albums_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'en','Advertisement','advertisement',NULL,0,NULL,NULL,'local','images/20210808153108_galleryImage_big16.png','images/20210808153108_galleryImage_thumb34.png','2021-08-08 12:31:08','2021-08-08 12:31:08'),(2,'en','Nature','nature','global',0,NULL,NULL,'local','images/20210809182021_galleryImage_big22.jpg','images/20210809182021_galleryImage_thumb28.jpg','2021-08-09 15:20:22','2021-08-09 15:20:22');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_intros`
--

DROP TABLE IF EXISTS `app_intros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_intros` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_intros`
--

LOCK TABLES `app_intros` WRITE;
/*!40000 ALTER TABLE `app_intros` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_intros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio`
--

DROP TABLE IF EXISTS `audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audio` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `audio_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio_mp3` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio_ogg` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio`
--

LOCK TABLES `audio` WRITE;
/*!40000 ALTER TABLE `audio` DISABLE KEYS */;
/*!40000 ALTER TABLE `audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio_post`
--

DROP TABLE IF EXISTS `audio_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audio_post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `audio_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_post`
--

LOCK TABLES `audio_post` WRITE;
/*!40000 ALTER TABLE `audio_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `audio_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(1) NOT NULL COMMENT '0 for not, 1 for featured',
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Product News','en','world',1,'Product News','Product News',1,'2021-08-08 11:03:04','2021-08-11 13:50:59'),(2,'Event News','en','event-news',0,'Event News','Event,News',1,'2021-08-08 11:35:08','2021-08-09 10:29:34'),(3,'Corporate News','en','corporate-news',0,'Corporate News','corporate news',1,'2021-08-08 11:36:18','2021-08-15 09:25:08'),(4,'Case Studies','en','case-studies-news',0,'Case Studies News','case,study,news',1,'2021-08-08 11:37:40','2021-08-08 11:37:40');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `comment_id` bigint unsigned DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_comment_id_foreign` (`comment_id`),
  CONSTRAINT `comments_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crons`
--

DROP TABLE IF EXISTS `crons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cron_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `video_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crons_video_id_foreign` (`video_id`),
  CONSTRAINT `crons_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crons`
--

LOCK TABLES `crons` WRITE;
/*!40000 ALTER TABLE `crons` DISABLE KEYS */;
INSERT INTO `crons` VALUES (1,'video_convert',NULL,NULL,1,'2021-08-11 13:36:37','2021-08-11 13:36:37'),(2,'video_convert',NULL,NULL,2,'2021-08-11 13:36:57','2021-08-11 13:36:57');
/*!40000 ALTER TABLE `crons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_body` longtext COLLATE utf8mb4_unicode_ci,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'registration','Registration successful','<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Account</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe.<br /> To open your {SITE_NAME} homepage, please follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{SITE_URL}\"><strong>{SITE_NAME} Account</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /><br />{SITE_URL}<br /><br /> Your username: {USERNAME}<br /> Your email address: {USER_EMAIL}<br /><br /><br />{SIGNATURE}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table>','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(2,'forgot_password','Forgot Password','<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Password</h4><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Forgot your password, huh? No big deal.<br />To create a new password, just follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{PASS_KEY_URL}\"><strong>Create new password</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /> {PASS_KEY_URL}<br /><br /> You received this email, because it was requested by a {SITE_NAME} user.This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same.<br /><br />Thank you,<br /><br /> Best Regards,<br /> {SITE_NAME}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\"><span style=\"font-size: 10px; color: #999999; font-family: Helvetica,Arial,sans-serif;\">{SIGNATURE}</span></td></tr></tbody></table></td></tr></tbody></table>','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(3,'activate_account','Activate Account','<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>Activate Account</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe. To verify your email address, please follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{ACTIVATE_URL}\"><strong>Complete Registration</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /> {ACTIVATE_URL}<br /><br /> Your username: {USERNAME}<br /> Your email address: {USER_EMAIL}<br /> Your password: {PASSWORD}<br /><br /><br /> {SIGNATURE}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table><p>&nbsp;</p>','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(4,'reset_password','Reset Password','<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Password</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">You have changed your password.<br />Please, keep it in your records so you don\'t forget it:<br />Your username: {USERNAME}<br />Your email address: {USER_EMAIL}<br />Your new password: {NEW_PASSWORD}<br /><br /><br /> Best Regards,<br /> {SITE_NAME}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\"><span style=\"font-size: 10px; color: #999999; font-family: Helvetica,Arial,sans-serif;\">{SIGNATURE}</span></td></tr></tbody></table></td></tr></tbody></table>','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(5,'registration','Registration successful','<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Account</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe.<br /> To open your {SITE_NAME} homepage, please follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{SITE_URL}\"><strong>{SITE_NAME} Account</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /><br />{SITE_URL}<br /><br /> Your username: {USERNAME}<br /> Your email address: {USER_EMAIL}<br /><br /><br />{SIGNATURE}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table>','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(6,'activate_account','Activate Account','<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Password</h4><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Forgot your password, huh? No big deal.<br />To create a new password, just follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{PASS_KEY_URL}\"><strong>Create new password</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /> {PASS_KEY_URL}<br /><br /> You received this email, because it was requested by a {SITE_NAME} user.This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same.<br /><br />Thank you,<br /><br /> Best Regards,<br /> {SITE_NAME}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\"><span style=\"font-size: 10px; color: #999999; font-family: Helvetica,Arial,sans-serif;\">{SIGNATURE}</span></td></tr></tbody></table></td></tr></tbody></table>','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(7,'reset_password','Reset Password','<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>Activate Account</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe. To verify your email address, please follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{ACTIVATE_URL}\"><strong>Complete Registration</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /> {ACTIVATE_URL}<br /><br /> Your username: {USERNAME}<br /> Your email address: {USER_EMAIL}<br /> Your password: {PASSWORD}<br /><br /><br /> {SIGNATURE}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table><p>&nbsp;</p>','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(8,'forgot_password','Forgot Password','<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Password</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">You have changed your password.<br />Please, keep it in your records so you don\'t forget it:<br />Your username: {USERNAME}<br />Your email address: {USER_EMAIL}<br />Your new password: {NEW_PASSWORD}<br /><br /><br /> Best Regards,<br /> {SITE_NAME}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\"><span style=\"font-size: 10px; color: #999999; font-family: Helvetica,Arial,sans-serif;\">{SIGNATURE}</span></td></tr></tbody></table></td></tr></tbody></table>','ar','2021-08-08 11:03:04','2021-08-08 11:03:04');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag_icons`
--

DROP TABLE IF EXISTS `flag_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag_icons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag_icons`
--

LOCK TABLES `flag_icons` WRITE;
/*!40000 ALTER TABLE `flag_icons` DISABLE KEYS */;
INSERT INTO `flag_icons` VALUES (1,'flag-icon flag-icon-ad','ad','2021-08-08 11:03:04','2021-08-08 11:03:04'),(2,'flag-icon flag-icon-ae','ae','2021-08-08 11:03:04','2021-08-08 11:03:04'),(3,'flag-icon flag-icon-af','af','2021-08-08 11:03:04','2021-08-08 11:03:04'),(4,'flag-icon flag-icon-ag','ag','2021-08-08 11:03:04','2021-08-08 11:03:04'),(5,'flag-icon flag-icon-ai','ai','2021-08-08 11:03:04','2021-08-08 11:03:04'),(6,'flag-icon flag-icon-al','al','2021-08-08 11:03:04','2021-08-08 11:03:04'),(7,'flag-icon flag-icon-am','am','2021-08-08 11:03:04','2021-08-08 11:03:04'),(8,'flag-icon flag-icon-ao','ao','2021-08-08 11:03:04','2021-08-08 11:03:04'),(9,'flag-icon flag-icon-aq','aq','2021-08-08 11:03:04','2021-08-08 11:03:04'),(10,'flag-icon flag-icon-ar','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(11,'flag-icon flag-icon-as','as','2021-08-08 11:03:04','2021-08-08 11:03:04'),(12,'flag-icon flag-icon-at','at','2021-08-08 11:03:04','2021-08-08 11:03:04'),(13,'flag-icon flag-icon-au','au','2021-08-08 11:03:04','2021-08-08 11:03:04'),(14,'flag-icon flag-icon-aw','aw','2021-08-08 11:03:04','2021-08-08 11:03:04'),(15,'flag-icon flag-icon-ax','ax','2021-08-08 11:03:04','2021-08-08 11:03:04'),(16,'flag-icon flag-icon-az','az','2021-08-08 11:03:04','2021-08-08 11:03:04'),(17,'flag-icon flag-icon-ba','ba','2021-08-08 11:03:04','2021-08-08 11:03:04'),(18,'flag-icon flag-icon-bb','bb','2021-08-08 11:03:04','2021-08-08 11:03:04'),(19,'flag-icon flag-icon-bd','bd','2021-08-08 11:03:04','2021-08-08 11:03:04'),(20,'flag-icon flag-icon-be','be','2021-08-08 11:03:04','2021-08-08 11:03:04'),(21,'flag-icon flag-icon-bf','bf','2021-08-08 11:03:04','2021-08-08 11:03:04'),(22,'flag-icon flag-icon-bg','bg','2021-08-08 11:03:04','2021-08-08 11:03:04'),(23,'flag-icon flag-icon-bh','bh','2021-08-08 11:03:04','2021-08-08 11:03:04'),(24,'flag-icon flag-icon-bi','bi','2021-08-08 11:03:04','2021-08-08 11:03:04'),(25,'flag-icon flag-icon-bj','bj','2021-08-08 11:03:04','2021-08-08 11:03:04'),(26,'flag-icon flag-icon-bl','bl','2021-08-08 11:03:04','2021-08-08 11:03:04'),(27,'flag-icon flag-icon-bm','bm','2021-08-08 11:03:04','2021-08-08 11:03:04'),(28,'flag-icon flag-icon-bn','bn','2021-08-08 11:03:04','2021-08-08 11:03:04'),(29,'flag-icon flag-icon-bo','bo','2021-08-08 11:03:04','2021-08-08 11:03:04'),(30,'flag-icon flag-icon-bq','bq','2021-08-08 11:03:04','2021-08-08 11:03:04'),(31,'flag-icon flag-icon-br','br','2021-08-08 11:03:04','2021-08-08 11:03:04'),(32,'flag-icon flag-icon-bs','bs','2021-08-08 11:03:04','2021-08-08 11:03:04'),(33,'flag-icon flag-icon-bt','bt','2021-08-08 11:03:04','2021-08-08 11:03:04'),(34,'flag-icon flag-icon-bv','bv','2021-08-08 11:03:04','2021-08-08 11:03:04'),(35,'flag-icon flag-icon-bw','bw','2021-08-08 11:03:04','2021-08-08 11:03:04'),(36,'flag-icon flag-icon-by','by','2021-08-08 11:03:04','2021-08-08 11:03:04'),(37,'flag-icon flag-icon-bz','bz','2021-08-08 11:03:04','2021-08-08 11:03:04'),(38,'flag-icon flag-icon-ca','ca','2021-08-08 11:03:04','2021-08-08 11:03:04'),(39,'flag-icon flag-icon-cc','cc','2021-08-08 11:03:04','2021-08-08 11:03:04'),(40,'flag-icon flag-icon-cd','cd','2021-08-08 11:03:04','2021-08-08 11:03:04'),(41,'flag-icon flag-icon-cf','cf','2021-08-08 11:03:04','2021-08-08 11:03:04'),(42,'flag-icon flag-icon-cg','cg','2021-08-08 11:03:04','2021-08-08 11:03:04'),(43,'flag-icon flag-icon-ch','ch','2021-08-08 11:03:04','2021-08-08 11:03:04'),(44,'flag-icon flag-icon-ci','ci','2021-08-08 11:03:04','2021-08-08 11:03:04'),(45,'flag-icon flag-icon-ck','ck','2021-08-08 11:03:04','2021-08-08 11:03:04'),(46,'flag-icon flag-icon-cl','cl','2021-08-08 11:03:04','2021-08-08 11:03:04'),(47,'flag-icon flag-icon-cm','cm','2021-08-08 11:03:04','2021-08-08 11:03:04'),(48,'flag-icon flag-icon-cn','cn','2021-08-08 11:03:04','2021-08-08 11:03:04'),(49,'flag-icon flag-icon-co','co','2021-08-08 11:03:04','2021-08-08 11:03:04'),(50,'flag-icon flag-icon-cr','cr','2021-08-08 11:03:04','2021-08-08 11:03:04'),(51,'flag-icon flag-icon-cu','cu','2021-08-08 11:03:04','2021-08-08 11:03:04'),(52,'flag-icon flag-icon-cv','cv','2021-08-08 11:03:04','2021-08-08 11:03:04'),(53,'flag-icon flag-icon-cw','cw','2021-08-08 11:03:04','2021-08-08 11:03:04'),(54,'flag-icon flag-icon-cx','cx','2021-08-08 11:03:04','2021-08-08 11:03:04'),(55,'flag-icon flag-icon-cy','cy','2021-08-08 11:03:04','2021-08-08 11:03:04'),(56,'flag-icon flag-icon-cz','cz','2021-08-08 11:03:04','2021-08-08 11:03:04'),(57,'flag-icon flag-icon-de','de','2021-08-08 11:03:04','2021-08-08 11:03:04'),(58,'flag-icon flag-icon-dj','dj','2021-08-08 11:03:04','2021-08-08 11:03:04'),(59,'flag-icon flag-icon-dk','dk','2021-08-08 11:03:04','2021-08-08 11:03:04'),(60,'flag-icon flag-icon-dm','dm','2021-08-08 11:03:04','2021-08-08 11:03:04'),(61,'flag-icon flag-icon-do','do','2021-08-08 11:03:04','2021-08-08 11:03:04'),(62,'flag-icon flag-icon-dz','dz','2021-08-08 11:03:04','2021-08-08 11:03:04'),(63,'flag-icon flag-icon-ec','ec','2021-08-08 11:03:04','2021-08-08 11:03:04'),(64,'flag-icon flag-icon-ee','ee','2021-08-08 11:03:04','2021-08-08 11:03:04'),(65,'flag-icon flag-icon-eg','eg','2021-08-08 11:03:04','2021-08-08 11:03:04'),(66,'flag-icon flag-icon-eh','eh','2021-08-08 11:03:04','2021-08-08 11:03:04'),(67,'flag-icon flag-icon-er','er','2021-08-08 11:03:04','2021-08-08 11:03:04'),(68,'flag-icon flag-icon-es','es','2021-08-08 11:03:04','2021-08-08 11:03:04'),(69,'flag-icon flag-icon-et','et','2021-08-08 11:03:04','2021-08-08 11:03:04'),(70,'flag-icon flag-icon-fi','fi','2021-08-08 11:03:04','2021-08-08 11:03:04'),(71,'flag-icon flag-icon-fj','fj','2021-08-08 11:03:04','2021-08-08 11:03:04'),(72,'flag-icon flag-icon-fk','fk','2021-08-08 11:03:04','2021-08-08 11:03:04'),(73,'flag-icon flag-icon-fm','fm','2021-08-08 11:03:04','2021-08-08 11:03:04'),(74,'flag-icon flag-icon-fo','fo','2021-08-08 11:03:04','2021-08-08 11:03:04'),(75,'flag-icon flag-icon-fr','fr','2021-08-08 11:03:04','2021-08-08 11:03:04'),(76,'flag-icon flag-icon-ga','ga','2021-08-08 11:03:04','2021-08-08 11:03:04'),(77,'flag-icon flag-icon-gb','gb','2021-08-08 11:03:04','2021-08-08 11:03:04'),(78,'flag-icon flag-icon-gd','gd','2021-08-08 11:03:04','2021-08-08 11:03:04'),(79,'flag-icon flag-icon-ge','ge','2021-08-08 11:03:04','2021-08-08 11:03:04'),(80,'flag-icon flag-icon-gf','gf','2021-08-08 11:03:04','2021-08-08 11:03:04'),(81,'flag-icon flag-icon-gg','gg','2021-08-08 11:03:04','2021-08-08 11:03:04'),(82,'flag-icon flag-icon-gh','gh','2021-08-08 11:03:04','2021-08-08 11:03:04'),(83,'flag-icon flag-icon-gi','gi','2021-08-08 11:03:04','2021-08-08 11:03:04'),(84,'flag-icon flag-icon-gl','gl','2021-08-08 11:03:04','2021-08-08 11:03:04'),(85,'flag-icon flag-icon-gm','gm','2021-08-08 11:03:04','2021-08-08 11:03:04'),(86,'flag-icon flag-icon-gn','gn','2021-08-08 11:03:04','2021-08-08 11:03:04'),(87,'flag-icon flag-icon-gp','gp','2021-08-08 11:03:04','2021-08-08 11:03:04'),(88,'flag-icon flag-icon-gq','gq','2021-08-08 11:03:04','2021-08-08 11:03:04'),(89,'flag-icon flag-icon-gr','gr','2021-08-08 11:03:04','2021-08-08 11:03:04'),(90,'flag-icon flag-icon-gs','gs','2021-08-08 11:03:04','2021-08-08 11:03:04'),(91,'flag-icon flag-icon-gt','gt','2021-08-08 11:03:04','2021-08-08 11:03:04'),(92,'flag-icon flag-icon-gu','gu','2021-08-08 11:03:04','2021-08-08 11:03:04'),(93,'flag-icon flag-icon-gw','gw','2021-08-08 11:03:04','2021-08-08 11:03:04'),(94,'flag-icon flag-icon-gy','gy','2021-08-08 11:03:04','2021-08-08 11:03:04'),(95,'flag-icon flag-icon-hk','hk','2021-08-08 11:03:05','2021-08-08 11:03:05'),(96,'flag-icon flag-icon-hm','hm','2021-08-08 11:03:05','2021-08-08 11:03:05'),(97,'flag-icon flag-icon-hn','hn','2021-08-08 11:03:05','2021-08-08 11:03:05'),(98,'flag-icon flag-icon-hr','hr','2021-08-08 11:03:05','2021-08-08 11:03:05'),(99,'flag-icon flag-icon-ht','ht','2021-08-08 11:03:05','2021-08-08 11:03:05'),(100,'flag-icon flag-icon-hu','hu','2021-08-08 11:03:05','2021-08-08 11:03:05'),(101,'flag-icon flag-icon-id','id','2021-08-08 11:03:05','2021-08-08 11:03:05'),(102,'flag-icon flag-icon-ie','ie','2021-08-08 11:03:05','2021-08-08 11:03:05'),(103,'flag-icon flag-icon-il','il','2021-08-08 11:03:05','2021-08-08 11:03:05'),(104,'flag-icon flag-icon-im','im','2021-08-08 11:03:05','2021-08-08 11:03:05'),(105,'flag-icon flag-icon-in','in','2021-08-08 11:03:05','2021-08-08 11:03:05'),(106,'flag-icon flag-icon-io','io','2021-08-08 11:03:05','2021-08-08 11:03:05'),(107,'flag-icon flag-icon-iq','iq','2021-08-08 11:03:05','2021-08-08 11:03:05'),(108,'flag-icon flag-icon-ir','ir','2021-08-08 11:03:05','2021-08-08 11:03:05'),(109,'flag-icon flag-icon-is','is','2021-08-08 11:03:05','2021-08-08 11:03:05'),(110,'flag-icon flag-icon-it','it','2021-08-08 11:03:05','2021-08-08 11:03:05'),(111,'flag-icon flag-icon-je','je','2021-08-08 11:03:05','2021-08-08 11:03:05'),(112,'flag-icon flag-icon-jm','jm','2021-08-08 11:03:05','2021-08-08 11:03:05'),(113,'flag-icon flag-icon-jo','jo','2021-08-08 11:03:05','2021-08-08 11:03:05'),(114,'flag-icon flag-icon-jp','jp','2021-08-08 11:03:05','2021-08-08 11:03:05'),(115,'flag-icon flag-icon-ke','ke','2021-08-08 11:03:05','2021-08-08 11:03:05'),(116,'flag-icon flag-icon-kg','kg','2021-08-08 11:03:05','2021-08-08 11:03:05'),(117,'flag-icon flag-icon-kh','kh','2021-08-08 11:03:05','2021-08-08 11:03:05'),(118,'flag-icon flag-icon-ki','ki','2021-08-08 11:03:05','2021-08-08 11:03:05'),(119,'flag-icon flag-icon-km','km','2021-08-08 11:03:05','2021-08-08 11:03:05'),(120,'flag-icon flag-icon-kn','kn','2021-08-08 11:03:05','2021-08-08 11:03:05'),(121,'flag-icon flag-icon-kp','kp','2021-08-08 11:03:05','2021-08-08 11:03:05'),(122,'flag-icon flag-icon-kr','kr','2021-08-08 11:03:05','2021-08-08 11:03:05'),(123,'flag-icon flag-icon-kw','kw','2021-08-08 11:03:05','2021-08-08 11:03:05'),(124,'flag-icon flag-icon-ky','ky','2021-08-08 11:03:05','2021-08-08 11:03:05'),(125,'flag-icon flag-icon-kz','kz','2021-08-08 11:03:05','2021-08-08 11:03:05'),(126,'flag-icon flag-icon-la','la','2021-08-08 11:03:05','2021-08-08 11:03:05'),(127,'flag-icon flag-icon-lb','lb','2021-08-08 11:03:05','2021-08-08 11:03:05'),(128,'flag-icon flag-icon-lc','lc','2021-08-08 11:03:05','2021-08-08 11:03:05'),(129,'flag-icon flag-icon-li','li','2021-08-08 11:03:05','2021-08-08 11:03:05'),(130,'flag-icon flag-icon-lk','lk','2021-08-08 11:03:05','2021-08-08 11:03:05'),(131,'flag-icon flag-icon-lr','lr','2021-08-08 11:03:05','2021-08-08 11:03:05'),(132,'flag-icon flag-icon-ls','ls','2021-08-08 11:03:05','2021-08-08 11:03:05'),(133,'flag-icon flag-icon-lt','lt','2021-08-08 11:03:05','2021-08-08 11:03:05'),(134,'flag-icon flag-icon-lu','lu','2021-08-08 11:03:05','2021-08-08 11:03:05'),(135,'flag-icon flag-icon-lv','lv','2021-08-08 11:03:05','2021-08-08 11:03:05'),(136,'flag-icon flag-icon-ly','ly','2021-08-08 11:03:05','2021-08-08 11:03:05'),(137,'flag-icon flag-icon-ma','ma','2021-08-08 11:03:05','2021-08-08 11:03:05'),(138,'flag-icon flag-icon-mc','mc','2021-08-08 11:03:05','2021-08-08 11:03:05'),(139,'flag-icon flag-icon-md','md','2021-08-08 11:03:05','2021-08-08 11:03:05'),(140,'flag-icon flag-icon-me','me','2021-08-08 11:03:05','2021-08-08 11:03:05'),(141,'flag-icon flag-icon-mf','mf','2021-08-08 11:03:05','2021-08-08 11:03:05'),(142,'flag-icon flag-icon-mg','mg','2021-08-08 11:03:05','2021-08-08 11:03:05'),(143,'flag-icon flag-icon-mh','mh','2021-08-08 11:03:05','2021-08-08 11:03:05'),(144,'flag-icon flag-icon-mk','mk','2021-08-08 11:03:05','2021-08-08 11:03:05'),(145,'flag-icon flag-icon-ml','ml','2021-08-08 11:03:05','2021-08-08 11:03:05'),(146,'flag-icon flag-icon-mm','mm','2021-08-08 11:03:05','2021-08-08 11:03:05'),(147,'flag-icon flag-icon-mn','mn','2021-08-08 11:03:05','2021-08-08 11:03:05'),(148,'flag-icon flag-icon-mo','mo','2021-08-08 11:03:05','2021-08-08 11:03:05'),(149,'flag-icon flag-icon-mp','mp','2021-08-08 11:03:05','2021-08-08 11:03:05'),(150,'flag-icon flag-icon-mq','mq','2021-08-08 11:03:05','2021-08-08 11:03:05'),(151,'flag-icon flag-icon-mr','mr','2021-08-08 11:03:05','2021-08-08 11:03:05'),(152,'flag-icon flag-icon-ms','ms','2021-08-08 11:03:05','2021-08-08 11:03:05'),(153,'flag-icon flag-icon-mt','mt','2021-08-08 11:03:05','2021-08-08 11:03:05'),(154,'flag-icon flag-icon-mu','mu','2021-08-08 11:03:05','2021-08-08 11:03:05'),(155,'flag-icon flag-icon-mv','mv','2021-08-08 11:03:05','2021-08-08 11:03:05'),(156,'flag-icon flag-icon-mw','mw','2021-08-08 11:03:05','2021-08-08 11:03:05'),(157,'flag-icon flag-icon-mx','mx','2021-08-08 11:03:05','2021-08-08 11:03:05'),(158,'flag-icon flag-icon-my','my','2021-08-08 11:03:05','2021-08-08 11:03:05'),(159,'flag-icon flag-icon-mz','mz','2021-08-08 11:03:05','2021-08-08 11:03:05'),(160,'flag-icon flag-icon-na','na','2021-08-08 11:03:05','2021-08-08 11:03:05'),(161,'flag-icon flag-icon-nc','nc','2021-08-08 11:03:05','2021-08-08 11:03:05'),(162,'flag-icon flag-icon-ne','ne','2021-08-08 11:03:05','2021-08-08 11:03:05'),(163,'flag-icon flag-icon-nf','nf','2021-08-08 11:03:05','2021-08-08 11:03:05'),(164,'flag-icon flag-icon-ng','ng','2021-08-08 11:03:05','2021-08-08 11:03:05'),(165,'flag-icon flag-icon-ni','ni','2021-08-08 11:03:05','2021-08-08 11:03:05'),(166,'flag-icon flag-icon-nl','nl','2021-08-08 11:03:05','2021-08-08 11:03:05'),(167,'flag-icon flag-icon-no','no','2021-08-08 11:03:05','2021-08-08 11:03:05'),(168,'flag-icon flag-icon-np','np','2021-08-08 11:03:05','2021-08-08 11:03:05'),(169,'flag-icon flag-icon-nr','nr','2021-08-08 11:03:05','2021-08-08 11:03:05'),(170,'flag-icon flag-icon-nu','nu','2021-08-08 11:03:05','2021-08-08 11:03:05'),(171,'flag-icon flag-icon-nz','nz','2021-08-08 11:03:05','2021-08-08 11:03:05'),(172,'flag-icon flag-icon-om','om','2021-08-08 11:03:05','2021-08-08 11:03:05'),(173,'flag-icon flag-icon-pa','pa','2021-08-08 11:03:05','2021-08-08 11:03:05'),(174,'flag-icon flag-icon-pe','pe','2021-08-08 11:03:05','2021-08-08 11:03:05'),(175,'flag-icon flag-icon-pf','pf','2021-08-08 11:03:05','2021-08-08 11:03:05'),(176,'flag-icon flag-icon-pg','pg','2021-08-08 11:03:05','2021-08-08 11:03:05'),(177,'flag-icon flag-icon-ph','ph','2021-08-08 11:03:05','2021-08-08 11:03:05'),(178,'flag-icon flag-icon-pk','pk','2021-08-08 11:03:05','2021-08-08 11:03:05'),(179,'flag-icon flag-icon-pl','pl','2021-08-08 11:03:05','2021-08-08 11:03:05'),(180,'flag-icon flag-icon-pm','pm','2021-08-08 11:03:05','2021-08-08 11:03:05'),(181,'flag-icon flag-icon-pn','pn','2021-08-08 11:03:05','2021-08-08 11:03:05'),(182,'flag-icon flag-icon-pr','pr','2021-08-08 11:03:05','2021-08-08 11:03:05'),(183,'flag-icon flag-icon-ps','ps','2021-08-08 11:03:05','2021-08-08 11:03:05'),(184,'flag-icon flag-icon-pt','pt','2021-08-08 11:03:05','2021-08-08 11:03:05'),(185,'flag-icon flag-icon-pw','pw','2021-08-08 11:03:05','2021-08-08 11:03:05'),(186,'flag-icon flag-icon-py','py','2021-08-08 11:03:05','2021-08-08 11:03:05'),(187,'flag-icon flag-icon-qa','qa','2021-08-08 11:03:05','2021-08-08 11:03:05'),(188,'flag-icon flag-icon-re','re','2021-08-08 11:03:05','2021-08-08 11:03:05'),(189,'flag-icon flag-icon-ro','ro','2021-08-08 11:03:05','2021-08-08 11:03:05'),(190,'flag-icon flag-icon-rs','rs','2021-08-08 11:03:05','2021-08-08 11:03:05'),(191,'flag-icon flag-icon-ru','ru','2021-08-08 11:03:05','2021-08-08 11:03:05'),(192,'flag-icon flag-icon-rw','rw','2021-08-08 11:03:05','2021-08-08 11:03:05'),(193,'flag-icon flag-icon-sa','sa','2021-08-08 11:03:05','2021-08-08 11:03:05'),(194,'flag-icon flag-icon-sb','sb','2021-08-08 11:03:05','2021-08-08 11:03:05'),(195,'flag-icon flag-icon-sc','sc','2021-08-08 11:03:05','2021-08-08 11:03:05'),(196,'flag-icon flag-icon-sd','sd','2021-08-08 11:03:05','2021-08-08 11:03:05'),(197,'flag-icon flag-icon-se','se','2021-08-08 11:03:05','2021-08-08 11:03:05'),(198,'flag-icon flag-icon-sg','sg','2021-08-08 11:03:05','2021-08-08 11:03:05'),(199,'flag-icon flag-icon-sh','sh','2021-08-08 11:03:05','2021-08-08 11:03:05'),(200,'flag-icon flag-icon-si','si','2021-08-08 11:03:05','2021-08-08 11:03:05'),(201,'flag-icon flag-icon-sj','sj','2021-08-08 11:03:05','2021-08-08 11:03:05'),(202,'flag-icon flag-icon-sk','sk','2021-08-08 11:03:05','2021-08-08 11:03:05'),(203,'flag-icon flag-icon-sl','sl','2021-08-08 11:03:05','2021-08-08 11:03:05'),(204,'flag-icon flag-icon-sm','sm','2021-08-08 11:03:05','2021-08-08 11:03:05'),(205,'flag-icon flag-icon-sn','sn','2021-08-08 11:03:05','2021-08-08 11:03:05'),(206,'flag-icon flag-icon-so','so','2021-08-08 11:03:05','2021-08-08 11:03:05'),(207,'flag-icon flag-icon-sr','sr','2021-08-08 11:03:05','2021-08-08 11:03:05'),(208,'flag-icon flag-icon-ss','ss','2021-08-08 11:03:05','2021-08-08 11:03:05'),(209,'flag-icon flag-icon-st','st','2021-08-08 11:03:05','2021-08-08 11:03:05'),(210,'flag-icon flag-icon-sv','sv','2021-08-08 11:03:05','2021-08-08 11:03:05'),(211,'flag-icon flag-icon-sx','sx','2021-08-08 11:03:05','2021-08-08 11:03:05'),(212,'flag-icon flag-icon-sy','sy','2021-08-08 11:03:05','2021-08-08 11:03:05'),(213,'flag-icon flag-icon-sz','sz','2021-08-08 11:03:05','2021-08-08 11:03:05'),(214,'flag-icon flag-icon-tc','tc','2021-08-08 11:03:05','2021-08-08 11:03:05'),(215,'flag-icon flag-icon-td','td','2021-08-08 11:03:05','2021-08-08 11:03:05'),(216,'flag-icon flag-icon-tf','tf','2021-08-08 11:03:05','2021-08-08 11:03:05'),(217,'flag-icon flag-icon-tg','tg','2021-08-08 11:03:05','2021-08-08 11:03:05'),(218,'flag-icon flag-icon-th','th','2021-08-08 11:03:05','2021-08-08 11:03:05'),(219,'flag-icon flag-icon-tj','tj','2021-08-08 11:03:05','2021-08-08 11:03:05'),(220,'flag-icon flag-icon-tk','tk','2021-08-08 11:03:05','2021-08-08 11:03:05'),(221,'flag-icon flag-icon-tl','tl','2021-08-08 11:03:05','2021-08-08 11:03:05'),(222,'flag-icon flag-icon-tm','tm','2021-08-08 11:03:05','2021-08-08 11:03:05'),(223,'flag-icon flag-icon-tn','tn','2021-08-08 11:03:05','2021-08-08 11:03:05'),(224,'flag-icon flag-icon-to','to','2021-08-08 11:03:05','2021-08-08 11:03:05'),(225,'flag-icon flag-icon-tr','tr','2021-08-08 11:03:05','2021-08-08 11:03:05'),(226,'flag-icon flag-icon-tt','tt','2021-08-08 11:03:05','2021-08-08 11:03:05'),(227,'flag-icon flag-icon-tv','tv','2021-08-08 11:03:05','2021-08-08 11:03:05'),(228,'flag-icon flag-icon-tw','tw','2021-08-08 11:03:05','2021-08-08 11:03:05'),(229,'flag-icon flag-icon-tz','tz','2021-08-08 11:03:05','2021-08-08 11:03:05'),(230,'flag-icon flag-icon-ua','ua','2021-08-08 11:03:05','2021-08-08 11:03:05'),(231,'flag-icon flag-icon-ug','ug','2021-08-08 11:03:05','2021-08-08 11:03:05'),(232,'flag-icon flag-icon-um','um','2021-08-08 11:03:05','2021-08-08 11:03:05'),(233,'flag-icon flag-icon-us','us','2021-08-08 11:03:05','2021-08-08 11:03:05'),(234,'flag-icon flag-icon-uy','uy','2021-08-08 11:03:05','2021-08-08 11:03:05'),(235,'flag-icon flag-icon-uz','uz','2021-08-08 11:03:05','2021-08-08 11:03:05'),(236,'flag-icon flag-icon-va','va','2021-08-08 11:03:05','2021-08-08 11:03:05'),(237,'flag-icon flag-icon-vc','vc','2021-08-08 11:03:05','2021-08-08 11:03:05'),(238,'flag-icon flag-icon-ve','ve','2021-08-08 11:03:05','2021-08-08 11:03:05'),(239,'flag-icon flag-icon-vg','vg','2021-08-08 11:03:05','2021-08-08 11:03:05'),(240,'flag-icon flag-icon-vi','vi','2021-08-08 11:03:05','2021-08-08 11:03:05'),(241,'flag-icon flag-icon-vn','vn','2021-08-08 11:03:05','2021-08-08 11:03:05'),(242,'flag-icon flag-icon-vu','vu','2021-08-08 11:03:05','2021-08-08 11:03:05'),(243,'flag-icon flag-icon-wf','wf','2021-08-08 11:03:05','2021-08-08 11:03:05'),(244,'flag-icon flag-icon-ws','ws','2021-08-08 11:03:05','2021-08-08 11:03:05'),(245,'flag-icon flag-icon-ye','ye','2021-08-08 11:03:05','2021-08-08 11:03:05'),(246,'flag-icon flag-icon-yt','yt','2021-08-08 11:03:05','2021-08-08 11:03:05'),(247,'flag-icon flag-icon-za','za','2021-08-08 11:03:05','2021-08-08 11:03:05'),(248,'flag-icon flag-icon-zm','zm','2021-08-08 11:03:05','2021-08-08 11:03:05'),(249,'flag-icon flag-icon-zw','zw','2021-08-08 11:03:05','2021-08-08 11:03:05');
/*!40000 ALTER TABLE `flag_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_images`
--

DROP TABLE IF EXISTS `gallery_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `album_id` bigint unsigned DEFAULT NULL,
  `tab` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_cover` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 no, 1 yes',
  `original_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_images_album_id_foreign` (`album_id`),
  CONSTRAINT `gallery_images_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_images`
--

LOCK TABLES `gallery_images` WRITE;
/*!40000 ALTER TABLE `gallery_images` DISABLE KEYS */;
INSERT INTO `gallery_images` VALUES (4,'local',2,'global',NULL,0,'images/20210809182101_galleryImage_big16.jpg','images/20210809182101_galleryImage_thumb35.jpg','2021-08-09 15:21:01','2021-08-09 15:21:01'),(5,'local',2,NULL,NULL,0,'images/20210809182947_galleryImage_big8.jpg','images/20210809182947_galleryImage_thumb37.jpg','2021-08-09 15:29:47','2021-08-09 15:29:47'),(6,'local',2,NULL,NULL,0,'images/20210809183156_galleryImage_big2.jpg','images/20210809183156_galleryImage_thumb41.jpg','2021-08-09 15:31:57','2021-08-09 15:31:57'),(7,'local',2,'global',NULL,0,'images/20210809183934_galleryImage_big37.jpg','images/20210809183934_galleryImage_thumb45.jpg','2021-08-09 15:39:34','2021-08-09 15:39:34'),(8,'local',2,'global',NULL,0,'images/20210809183957_galleryImage_big25.jpg','images/20210809183957_galleryImage_thumb27.jpg','2021-08-09 15:39:57','2021-08-09 15:39:57'),(9,'local',1,NULL,NULL,0,'images/20210809184014_galleryImage_big2.jpg','images/20210809184014_galleryImage_thumb35.jpg','2021-08-09 15:40:14','2021-08-09 15:40:14'),(10,'local',2,NULL,NULL,0,'images/20210809184034_galleryImage_big18.jpg','images/20210809184034_galleryImage_thumb32.jpg','2021-08-09 15:40:34','2021-08-09 15:40:34'),(11,'local',2,'global','waving-other',0,'images/20210810180604_galleryImage_big43.jpg','images/20210810180604_galleryImage_thumb49.jpg','2021-08-10 15:06:04','2021-08-10 15:06:04');
/*!40000 ALTER TABLE `gallery_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `og_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `big_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `big_image_two` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_image_two` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_image_three` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `small_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'local','images/20210808141446_original_19.webp','images/20210808141446_ogImage_8.png','images/20210808141446_thumbnail_100x100_4.webp','images/20210808141446_big_1080x1000_2.webp','images/20210808141446_big_730x400_1.webp','images/20210808141446_medium_358x215_4.webp','images/20210808141446_medium_350x190_11.webp','images/20210808141446_medium_255x175_33.webp','images/20210808141446_small_123x83_9.webp','2021-08-08 11:14:46','2021-08-08 11:14:46'),(2,'local','images/20210808144758_original_42.webp','images/20210808144758_ogImage_18.jpg','images/20210808144758_thumbnail_100x100_21.webp','images/20210808144758_big_1080x1000_13.webp','images/20210808144758_big_730x400_14.webp','images/20210808144758_medium_358x215_41.webp','images/20210808144758_medium_350x190_49.webp','images/20210808144758_medium_255x175_39.webp','images/20210808144758_small_123x83_35.webp','2021-08-08 11:47:59','2021-08-08 11:47:59'),(3,'local','images/20210810152652_original_18.webp','images/20210810152652_ogImage_2.jpg','images/20210810152652_thumbnail_100x100_27.webp','images/20210810152652_big_1080x1000_3.webp','images/20210810152652_big_730x400_36.webp','images/20210810152652_medium_358x215_3.webp','images/20210810152652_medium_350x190_15.webp','images/20210810152652_medium_255x175_32.webp','images/20210810152652_small_123x83_43.webp','2021-08-10 12:26:53','2021-08-10 12:26:53'),(4,'local','images/20210810152804_original_31.webp','images/20210810152804_ogImage_3.jpg','images/20210810152804_thumbnail_100x100_28.webp','images/20210810152804_big_1080x1000_9.webp','images/20210810152804_big_730x400_25.webp','images/20210810152804_medium_358x215_25.webp','images/20210810152804_medium_350x190_27.webp','images/20210810152804_medium_255x175_5.webp','images/20210810152804_small_123x83_35.webp','2021-08-10 12:28:07','2021-08-10 12:28:07'),(5,'local','images/20210810153045_original_11.webp','images/20210810153045_ogImage_15.jpg','images/20210810153045_thumbnail_100x100_22.webp','images/20210810153045_big_1080x1000_41.webp','images/20210810153045_big_730x400_1.webp','images/20210810153045_medium_358x215_8.webp','images/20210810153045_medium_350x190_36.webp','images/20210810153045_medium_255x175_3.webp','images/20210810153045_small_123x83_23.webp','2021-08-10 12:30:45','2021-08-10 12:30:45'),(6,'local','images/20210810153207_original_43.webp','images/20210810153207_ogImage_32.jpg','images/20210810153207_thumbnail_100x100_25.webp','images/20210810153207_big_1080x1000_50.webp','images/20210810153207_big_730x400_18.webp','images/20210810153207_medium_358x215_4.webp','images/20210810153207_medium_350x190_35.webp','images/20210810153207_medium_255x175_12.webp','images/20210810153207_small_123x83_20.webp','2021-08-10 12:32:09','2021-08-10 12:32:09'),(7,'local','images/20210810155102_original_33.webp','images/20210810155102_ogImage_38.jpg','images/20210810155102_thumbnail_100x100_31.webp','images/20210810155102_big_1080x1000_44.webp','images/20210810155102_big_730x400_2.webp','images/20210810155102_medium_358x215_9.webp','images/20210810155102_medium_350x190_21.webp','images/20210810155102_medium_255x175_49.webp','images/20210810155102_small_123x83_2.webp','2021-08-10 12:51:03','2021-08-10 12:51:03'),(8,'local','images/20210810155113_original_12.webp','images/20210810155113_ogImage_9.jpg','images/20210810155113_thumbnail_100x100_33.webp','images/20210810155113_big_1080x1000_22.webp','images/20210810155113_big_730x400_28.webp','images/20210810155113_medium_358x215_12.webp','images/20210810155113_medium_350x190_7.webp','images/20210810155113_medium_255x175_35.webp','images/20210810155113_small_123x83_22.webp','2021-08-10 12:51:14','2021-08-10 12:51:14'),(9,'local','images/20210810155124_original_43.webp','images/20210810155124_ogImage_29.jpg','images/20210810155124_thumbnail_100x100_34.webp','images/20210810155124_big_1080x1000_23.webp','images/20210810155124_big_730x400_43.webp','images/20210810155124_medium_358x215_28.webp','images/20210810155124_medium_350x190_49.webp','images/20210810155124_medium_255x175_33.webp','images/20210810155124_small_123x83_32.webp','2021-08-10 12:51:25','2021-08-10 12:51:25'),(10,'local','images/20210810155149_original_12.webp','images/20210810155149_ogImage_37.jpg','images/20210810155149_thumbnail_100x100_40.webp','images/20210810155149_big_1080x1000_19.webp','images/20210810155149_big_730x400_44.webp','images/20210810155149_medium_358x215_47.webp','images/20210810155149_medium_350x190_26.webp','images/20210810155149_medium_255x175_48.webp','images/20210810155149_small_123x83_20.webp','2021-08-10 12:51:50','2021-08-10 12:51:50'),(11,'local','images/20210810155205_original_24.webp','images/20210810155205_ogImage_35.jpg','images/20210810155205_thumbnail_100x100_42.webp','images/20210810155205_big_1080x1000_36.webp','images/20210810155205_big_730x400_6.webp','images/20210810155205_medium_358x215_7.webp','images/20210810155205_medium_350x190_46.webp','images/20210810155205_medium_255x175_45.webp','images/20210810155205_small_123x83_22.webp','2021-08-10 12:52:06','2021-08-10 12:52:06'),(12,'local','images/20210810155221_original_27.webp','images/20210810155221_ogImage_22.jpg','images/20210810155221_thumbnail_100x100_22.webp','images/20210810155221_big_1080x1000_42.webp','images/20210810155221_big_730x400_37.webp','images/20210810155221_medium_358x215_2.webp','images/20210810155221_medium_350x190_1.webp','images/20210810155221_medium_255x175_12.webp','images/20210810155221_small_123x83_17.webp','2021-08-10 12:52:22','2021-08-10 12:52:22'),(13,'local','images/20210810155231_original_21.webp','images/20210810155231_ogImage_23.jpg','images/20210810155231_thumbnail_100x100_12.webp','images/20210810155231_big_1080x1000_28.webp','images/20210810155231_big_730x400_22.webp','images/20210810155231_medium_358x215_29.webp','images/20210810155231_medium_350x190_43.webp','images/20210810155231_medium_255x175_37.webp','images/20210810155231_small_123x83_18.webp','2021-08-10 12:52:32','2021-08-10 12:52:32'),(14,'local','images/20210811174840_original_38.webp','images/20210811174840_ogImage_49.jpg','images/20210811174840_thumbnail_100x100_30.webp','images/20210811174840_big_1080x1000_18.webp','images/20210811174840_big_730x400_1.webp','images/20210811174840_medium_358x215_31.webp','images/20210811174840_medium_350x190_3.webp','images/20210811174840_medium_255x175_48.webp','images/20210811174840_small_123x83_33.webp','2021-08-11 14:48:41','2021-08-11 14:48:41'),(15,'local','images/20210811174847_original_31.webp','images/20210811174847_ogImage_2.jpg','images/20210811174847_thumbnail_100x100_50.webp','images/20210811174847_big_1080x1000_1.webp','images/20210811174847_big_730x400_39.webp','images/20210811174847_medium_358x215_34.webp','images/20210811174847_medium_350x190_6.webp','images/20210811174847_medium_255x175_39.webp','images/20210811174847_small_123x83_2.webp','2021-08-11 14:48:48','2021-08-11 14:48:48'),(16,'local','images/20210811174855_original_47.webp','images/20210811174855_ogImage_40.jpg','images/20210811174855_thumbnail_100x100_13.webp','images/20210811174855_big_1080x1000_14.webp','images/20210811174855_big_730x400_31.webp','images/20210811174855_medium_358x215_23.webp','images/20210811174855_medium_350x190_18.webp','images/20210811174855_medium_255x175_35.webp','images/20210811174855_small_123x83_25.webp','2021-08-11 14:48:57','2021-08-11 14:48:57'),(17,'local','images/20210811174903_original_25.webp','images/20210811174903_ogImage_3.jpg','images/20210811174903_thumbnail_100x100_45.webp','images/20210811174903_big_1080x1000_3.webp','images/20210811174903_big_730x400_39.webp','images/20210811174903_medium_358x215_45.webp','images/20210811174903_medium_350x190_41.webp','images/20210811174903_medium_255x175_9.webp','images/20210811174903_small_123x83_2.webp','2021-08-11 14:49:04','2021-08-11 14:49:04'),(18,'local','images/20210811174913_original_8.webp','images/20210811174913_ogImage_5.jpg','images/20210811174913_thumbnail_100x100_21.webp','images/20210811174913_big_1080x1000_34.webp','images/20210811174913_big_730x400_31.webp','images/20210811174913_medium_358x215_45.webp','images/20210811174913_medium_350x190_38.webp','images/20210811174913_medium_255x175_36.webp','images/20210811174913_small_123x83_36.webp','2021-08-11 14:49:14','2021-08-11 14:49:14'),(19,'local','images/20210811180240_original_29.webp','images/20210811180240_ogImage_6.jpg','images/20210811180240_thumbnail_100x100_39.webp','images/20210811180240_big_1080x1000_9.webp','images/20210811180240_big_730x400_27.webp','images/20210811180240_medium_358x215_7.webp','images/20210811180240_medium_350x190_17.webp','images/20210811180240_medium_255x175_12.webp','images/20210811180240_small_123x83_4.webp','2021-08-11 15:02:42','2021-08-11 15:02:42'),(20,'local','images/20210811180837_original_9.webp','images/20210811180837_ogImage_2.jpg','images/20210811180837_thumbnail_100x100_27.webp','images/20210811180837_big_1080x1000_1.webp','images/20210811180837_big_730x400_20.webp','images/20210811180837_medium_358x215_50.webp','images/20210811180837_medium_350x190_50.webp','images/20210811180837_medium_255x175_40.webp','images/20210811180837_small_123x83_11.webp','2021-08-11 15:08:38','2021-08-11 15:08:38'),(21,'local','images/20210811180853_original_29.webp','images/20210811180853_ogImage_48.jpg','images/20210811180853_thumbnail_100x100_40.webp','images/20210811180853_big_1080x1000_28.webp','images/20210811180853_big_730x400_10.webp','images/20210811180853_medium_358x215_16.webp','images/20210811180853_medium_350x190_38.webp','images/20210811180853_medium_255x175_1.webp','images/20210811180853_small_123x83_45.webp','2021-08-11 15:08:53','2021-08-11 15:08:53'),(22,'local','images/20210811180900_original_8.webp','images/20210811180900_ogImage_20.jpg','images/20210811180900_thumbnail_100x100_16.webp','images/20210811180900_big_1080x1000_15.webp','images/20210811180900_big_730x400_20.webp','images/20210811180900_medium_358x215_35.webp','images/20210811180900_medium_350x190_40.webp','images/20210811180900_medium_255x175_7.webp','images/20210811180900_small_123x83_4.webp','2021-08-11 15:09:01','2021-08-11 15:09:01'),(23,'local','images/20210811180917_original_26.webp','images/20210811180917_ogImage_43.jpg','images/20210811180917_thumbnail_100x100_25.webp','images/20210811180917_big_1080x1000_43.webp','images/20210811180917_big_730x400_31.webp','images/20210811180917_medium_358x215_21.webp','images/20210811180917_medium_350x190_4.webp','images/20210811180917_medium_255x175_25.webp','images/20210811180917_small_123x83_14.webp','2021-08-11 15:09:18','2021-08-11 15:09:18'),(24,'local','images/20210811180929_original_8.webp','images/20210811180929_ogImage_47.jpg','images/20210811180929_thumbnail_100x100_10.webp','images/20210811180929_big_1080x1000_24.webp','images/20210811180929_big_730x400_48.webp','images/20210811180929_medium_358x215_14.webp','images/20210811180929_medium_350x190_22.webp','images/20210811180929_medium_255x175_5.webp','images/20210811180929_small_123x83_19.webp','2021-08-11 15:09:30','2021-08-11 15:09:30'),(25,'local','images/20210811180949_original_39.webp','images/20210811180949_ogImage_18.jpg','images/20210811180949_thumbnail_100x100_42.webp','images/20210811180949_big_1080x1000_39.webp','images/20210811180949_big_730x400_4.webp','images/20210811180949_medium_358x215_26.webp','images/20210811180949_medium_350x190_15.webp','images/20210811180949_medium_255x175_4.webp','images/20210811180949_small_123x83_1.webp','2021-08-11 15:09:50','2021-08-11 15:09:50'),(26,'local','images/20210815112512_original_37.webp','images/20210815112512_ogImage_45.jpeg','images/20210815112512_thumbnail_100x100_43.webp','images/20210815112512_big_1080x1000_28.webp','images/20210815112512_big_730x400_26.webp','images/20210815112512_medium_358x215_17.webp','images/20210815112512_medium_350x190_16.webp','images/20210815112512_medium_255x175_13.webp','images/20210815112512_small_123x83_49.webp','2021-08-15 08:25:12','2021-08-15 08:25:12'),(27,'local','images/20210815115612_original_28.webp','images/20210815115612_ogImage_31.jpg','images/20210815115612_thumbnail_100x100_15.webp','images/20210815115612_big_1080x1000_5.webp','images/20210815115612_big_730x400_19.webp','images/20210815115612_medium_358x215_48.webp','images/20210815115612_medium_350x190_9.webp','images/20210815115612_medium_255x175_42.webp','images/20210815115612_small_123x83_45.webp','2021-08-15 08:56:13','2021-08-15 08:56:13'),(28,'local','images/20210815121019_original_1.webp','images/20210815121019_ogImage_49.jpeg','images/20210815121019_thumbnail_100x100_41.webp','images/20210815121019_big_1080x1000_28.webp','images/20210815121019_big_730x400_14.webp','images/20210815121019_medium_358x215_35.webp','images/20210815121019_medium_350x190_35.webp','images/20210815121019_medium_255x175_15.webp','images/20210815121019_small_123x83_29.webp','2021-08-15 09:10:19','2021-08-15 09:10:19');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_configs`
--

DROP TABLE IF EXISTS `language_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `script` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `native` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regional` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_configs`
--

LOCK TABLES `language_configs` WRITE;
/*!40000 ALTER TABLE `language_configs` DISABLE KEYS */;
INSERT INTO `language_configs` VALUES (1,1,'English','Latn','English','en_GB','2021-08-08 11:03:04','2021-08-08 11:03:04'),(2,2,'Arabic','Arb','عربى','ar_AR','2021-08-08 11:03:04','2021-08-08 11:03:04');
/*!40000 ALTER TABLE `language_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_direction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','active','flag-icon flag-icon-us','LTR','2021-08-08 11:03:04','2021-08-08 11:03:04');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ltm_translations`
--

DROP TABLE IF EXISTS `ltm_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ltm_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `key` text COLLATE utf8mb4_bin NOT NULL,
  `value` text COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ltm_translations`
--

LOCK TABLES `ltm_translations` WRITE;
/*!40000 ALTER TABLE `ltm_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ltm_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Primary Menu',NULL,'2021-08-08 11:03:05','2021-08-08 11:03:05'),(2,'Products','Security Products','2021-08-08 12:42:35','2021-08-08 12:42:35');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` bigint unsigned NOT NULL,
  `is_mega_menu` enum('no','tab','category') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'no = normal menu, tab = tab type mega menu, category = category type mega menu',
  `order` int NOT NULL DEFAULT '0',
  `parent` bigint unsigned DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_id` bigint unsigned DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `sub_category_id` bigint unsigned DEFAULT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `new_teb` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_item_parent_foreign` (`parent`),
  KEY `menu_item_menu_id_foreign` (`menu_id`),
  KEY `menu_item_category_id_foreign` (`category_id`),
  KEY `menu_item_page_id_foreign` (`page_id`),
  KEY `menu_item_post_id_foreign` (`post_id`),
  KEY `menu_item_sub_category_id_foreign` (`sub_category_id`),
  CONSTRAINT `menu_item_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_item_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_item_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_item_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `menu_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_item_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_item_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES (12,'News','en',1,'tab',1,NULL,'custom','/',NULL,NULL,NULL,NULL,1,0,'2021-08-13 21:15:23','2021-08-13 21:32:31'),(14,'Event News','en',1,'tab',4,12,'category',NULL,NULL,2,NULL,NULL,1,0,'2021-08-13 21:18:38','2021-08-13 21:32:31'),(20,'Product News','en',1,'no',2,12,'category',NULL,NULL,1,NULL,NULL,1,0,'2021-08-13 21:30:09','2021-08-13 21:32:31'),(21,'Corportate News','en',1,'no',3,12,'category',NULL,NULL,3,NULL,NULL,1,0,'2021-08-13 21:30:45','2021-08-13 21:32:31'),(22,'Case Studies','en',1,'no',5,12,'category',NULL,NULL,4,NULL,NULL,1,0,'2021-08-13 21:31:45','2021-08-13 21:32:31'),(23,'Products','en',1,'no',0,NULL,'custom','/',NULL,NULL,NULL,NULL,1,0,'2021-08-13 21:35:14','2021-08-13 21:35:14'),(24,'Companies','en',1,'no',0,NULL,'custom','/',NULL,NULL,NULL,NULL,1,0,'2021-08-13 21:35:23','2021-08-13 21:35:23'),(25,'Markets','en',1,'no',0,NULL,'custom','/',NULL,NULL,NULL,NULL,1,0,'2021-08-13 21:36:29','2021-08-13 21:36:29');
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_locations_unique_name_unique` (`unique_name`),
  KEY `menu_locations_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_locations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,'Primary','primary',1,'2021-08-08 11:03:05','2021-08-08 11:03:05');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_04_02_193005_create_translations_table',1),(2,'2014_06_04_000000_create_images_table',1),(3,'2014_06_12_000001_create_videos_table',1),(4,'2014_06_12_000002_create_audios_table',1),(5,'2014_07_02_230147_migration_cartalyst_sentinel',1),(6,'2019_08_19_000000_create_failed_jobs_table',1),(7,'2019_09_28_121115_create_Permissions_table',1),(8,'2019_10_02_101820_create_categories_table',1),(9,'2019_10_02_130602_create_sub_categories_table',1),(10,'2019_10_03_102624_create_posts_table',1),(11,'2019_10_13_160721_create_settings_table',1),(12,'2019_10_13_173518_create_languages_table',1),(13,'2019_10_13_180528_create_language_configs_table',1),(14,'2019_10_16_102855_create_flag_icon',1),(15,'2019_11_05_144716_create_email_templates_table',1),(16,'2019_11_16_155414_create_pages_table',1),(17,'2019_11_23_161232_create_menu_table',1),(18,'2019_11_23_161241_create_menu_item_table',1),(19,'2019_11_30_170502_create_menu_locations_table',1),(20,'2019_12_31_180342_create_ads_table',1),(21,'2020_01_01_151432_create_ad_locations_table',1),(22,'2020_01_05_160344_create_crons_table',1),(23,'2020_01_06_141735_create_polls_table',1),(24,'2020_01_06_145613_create_votes_table',1),(25,'2020_01_07_173342_create_widgets_table',1),(26,'2020_01_08_141817_create_contact_messages_table',1),(27,'2020_01_08_151731_create_comments_table',1),(28,'2020_02_27_171520_create_themes_table',1),(29,'2020_02_29_123626_create_theme_sections_table',1),(30,'2020_03_02_174040_create_tags_table',1),(31,'2020_07_07_005751_create_poll_options_table',1),(32,'2020_07_16_110239_create_jobs_table',1),(33,'2020_08_17_162145_create_social_media_table',1),(34,'2020_08_27_105041_create_poll_results_table',1),(35,'2020_09_24_140613_create_visitor_trackers_table',1),(36,'2020_11_07_144953_create_reactions_table',1),(37,'2020_11_16_144042_create_audio_post_table',1),(38,'2020_11_24_145954_create_albums_table',1),(39,'2020_11_24_150907_create_gallery_images_table',1),(40,'2020_12_03_125915_create_rss_feeds_table',1),(41,'2020_12_15_124608_column_update',1),(42,'2021_01_02_175930_column_update_2nd',1),(43,'2021_01_04_111845_create_app_intros_table',1),(44,'2021_01_13_154702_create_quiz_questions_table',1),(45,'2021_01_14_154705_create_quiz_results_table',1),(46,'2021_01_14_154717_create_quiz_answers_table',1),(47,'2021_02_23_104453_version_control',1),(48,'2021_02_23_104453_version_update',1),(49,'2021_02_23_104453_version_update_130',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image_id` bigint unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 default page, 2 contact us page',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1 without sidebar, 2 with right sidebar, 3 with left sidebar',
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_for_register` tinyint(1) NOT NULL,
  `show_title` tinyint(1) NOT NULL,
  `show_breadcrumb` tinyint(1) NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_image_id_foreign` (`image_id`),
  CONSTRAINT `pages_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,NULL,'Contact Us','en',2,'contact-us','Dormouse followed him: the March Hare. Alice was a little glass table. \'Now, I\'ll manage better this time,\' she said to Alice, they all looked so grave and anxious.) Alice could hardly hear the rattle of the Mock Turtle went on talking: \'Dear, dear! How queer everything is queer to-day.\' Just then she heard a voice of the deepest contempt. \'I\'ve seen hatters before,\' she said to live. \'I\'ve seen a good character, But said I could say if I might venture to ask the question?\' said the Duchess, who seemed too much pepper in my life!\' Just as she could. \'The Dormouse is asleep again,\' said the Mock Turtle, and to wonder what you\'re doing!\' cried Alice, jumping up in spite of all this time. \'I want a clean cup,\' interrupted the Gryphon. \'I\'ve forgotten the little dears came jumping merrily along hand in her pocket) till she shook the house, and wondering whether she could not think of anything to say, she simply bowed, and took the opportunity of showing off her unfortunate guests to execution--once more the pig-baby was sneezing and howling alternately without a cat! It\'s the most interesting, and perhaps as this before, never! And I declare it\'s too bad, that it would be like, \'--for they haven\'t got much evidence YET,\' she said to herself, \'whenever I eat one of the bread-and-butter. Just at this moment Five, who had got its head impatiently, and walked a little of the sea.\' \'I couldn\'t afford to learn it.\' said the King hastily said, and went on again:-- \'I didn\'t know that cats COULD grin.\' \'They all can,\' said the Duchess. \'I make you grow taller, and the little dears came jumping merrily along hand in hand with Dinah, and saying to herself as she could, \'If you didn\'t like cats.\' \'Not like cats!\' cried the Mouse, in a frightened tone. \'The Queen will hear you! You see, she came in with the grin, which remained some time in silence: at last the Mock Turtle angrily: \'really you are very dull!\' \'You ought to go on for some minutes. The Caterpillar and Alice thought she had never left off when they passed too close, and waving their forepaws to mark the time, while the rest of it altogether; but after a minute or two, she made her next remark. \'Then the words \'DRINK ME,\' but nevertheless she uncorked it and put it into one of the baby, the shriek of the water, and seemed to be a comfort, one way--never to be ashamed of yourself,\' said Alice, rather alarmed at the bottom of a tree in front of the tale was something like this:-- \'Fury said to herself, for she was playing against herself, for this time with great curiosity. \'Soles and eels, of course,\' the Gryphon whispered in a piteous tone. And she squeezed herself up on to the Hatter. \'You MUST remember,\' remarked the King, and the baby was howling so much already, that it is!\' As she said this, she was talking. \'How CAN I have to fly; and the procession moved on, three of the sort,\' said the Duchess; \'I never saw one, or heard of uglifying!\' it exclaimed. \'You know what &quot;it&quot; means well enough.','1','1',0,1,1,NULL,NULL,NULL,NULL,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(2,NULL,'About Us','en',1,'about-us','Cat said, waving its right ear and left foot, so as to bring but one; Bill\'s got to the three gardeners, oblong and flat, with their fur clinging close to her daughter \'Ah, my dear! Let this be a book written about me, that there ought! And when I grow up, I\'ll write one--but I\'m grown up now,\' she said, \'for her hair goes in such long ringlets, and mine doesn\'t go in at all?\' said Alice, a little of the window, and some of them can explain it,\' said the Cat. \'I said pig,\' replied Alice; \'and I do so like that curious song about the crumbs,\' said the Dormouse shall!\' they both sat silent and looked at the March Hare. \'Then it wasn\'t very civil of you to get out at all know whether it was labelled \'ORANGE MARMALADE\', but to get in?\' she repeated, aloud. \'I must be on the table. \'Nothing can be clearer than THAT. Then again--&quot;BEFORE SHE HAD THIS FIT--&quot; you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, a good deal to ME,\' said the Mock Turtle, suddenly dropping his voice; and the jury eagerly wrote down on her hand, watching the setting sun, and thinking of little animals and birds waiting outside. The poor little Lizard, Bill, was in such a thing. After a while, finding that nothing more happened, she decided on going into the roof of the wood for fear of their hearing her; and when she was quite impossible to say anything. \'Why,\' said the March Hare. Alice sighed wearily. \'I think you might do something better with the game,\' the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of the wood--(she considered him to you, Though they were IN the well,\' Alice said nothing: she had a head could be beheaded, and that if something wasn\'t done about it while the Mock Turtle to the seaside once in a tone of the room. The cook threw a frying-pan after her as she could. \'No,\' said Alice. \'Why, you don\'t explain it is I hate cats and dogs.\' It was so long since she had not gone (We know it to her full size by this time?\' she said aloud. \'I shall be a book written about me, that there ought! And when I grow up, I\'ll write one--but I\'m grown up now,\' she said, \'than waste it in with the tea,\' the March Hare was said to herself \'This is Bill,\' she gave one sharp kick, and waited till the puppy\'s bark sounded quite faint in the other. In the very tones of her voice, and see what I was a bright brass plate with the Queen, tossing her head to feel which way it was perfectly round, she found a little shriek, and went by without noticing her. Then followed the Knave \'Turn them over!\' The Knave shook his head contemptuously. \'I dare say there may be ONE.\' \'One, indeed!\' said the King said to herself \'Suppose it should be raving mad--at least not so mad as it was growing, and very nearly in the middle of one! There ought to have the experiment tried. \'Very true,\' said the Hatter, with an important air, \'are you all ready? This is the same thing as a boon, Was kindly permitted to pocket the spoon: While the Duchess sang the second.','1','1',0,1,1,NULL,NULL,NULL,NULL,'2021-08-08 11:03:04','2021-08-08 11:03:04');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'album_read','album','',NULL,NULL),(2,'album_write','album','',NULL,NULL),(3,'album_delete','album','',NULL,NULL),(4,'rss_read','rss','',NULL,NULL),(5,'rss_write','rss','',NULL,NULL),(6,'rss_delete','rss','',NULL,NULL),(7,'api_read','api','',NULL,NULL),(8,'api_write','api','',NULL,NULL),(9,'api_delete','api','',NULL,NULL),(10,'users_read','users','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(11,'users_write','users','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(12,'users_delete','users','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(13,'role_read','role','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(14,'role_write','role','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(15,'role_delete','role','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(16,'permission_read','permission','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(17,'permission_write','permission','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(18,'permission_delete','permission','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(19,'settings_read','settings','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(20,'settings_write','settings','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(21,'settings_delete','settings','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(22,'language_settings_read','language_settings','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(23,'language_settings_write','language_settings','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(24,'language_settings_delete','language_settings','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(25,'pages_read','pages','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(26,'pages_write','pages','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(27,'pages_delete','pages','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(28,'menu_read','menu','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(29,'menu_write','menu','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(30,'menu_delete','menu','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(31,'menu_item_read','menu_item','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(32,'menu_item_write','menu_item','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(33,'menu_item_delete','menu_item','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(34,'post_read','post','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(35,'post_write','post','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(36,'post_delete','post','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(37,'category_read','category','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(38,'category_write','category','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(39,'category_delete','category','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(40,'sub_category_read','sub_category','','2021-08-08 11:03:03','2021-08-08 11:03:03'),(41,'sub_category_write','sub_category','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(42,'sub_category_delete','sub_category','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(43,'widget_read','widget','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(44,'widget_write','widget','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(45,'widget_delete','widget','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(46,'newsletter_read','newsletter','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(47,'newsletter_write','newsletter','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(48,'newsletter_delete','newsletter','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(49,'notification_read','notification','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(50,'notification_write','notification','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(51,'notification_delete','notification','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(52,'contact_message_read','contact_message','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(53,'contact_message_write','contact_message','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(54,'contact_message_delete','contact_message','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(55,'ads_read','ads','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(56,'ads_write','ads','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(57,'ads_delete','ads','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(58,'theme_section_read','theme_section','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(59,'theme_section_write','theme_section','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(60,'theme_section_delete','theme_section','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(61,'socials_read','socials','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(62,'socials_write','socials','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(63,'socials_delete','socials','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(64,'polls_read','polls','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(65,'polls_write','polls','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(66,'polls_delete','polls','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(67,'comments_read','comments','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(68,'comments_write','comments','','2021-08-08 11:03:04','2021-08-08 11:03:04'),(69,'comments_delete','comments','','2021-08-08 11:03:04','2021-08-08 11:03:04');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistences`
--

DROP TABLE IF EXISTS `persistences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persistences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persistences_code_unique` (`code`),
  KEY `persistences_user_id_foreign` (`user_id`),
  CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistences`
--

LOCK TABLES `persistences` WRITE;
/*!40000 ALTER TABLE `persistences` DISABLE KEYS */;
INSERT INTO `persistences` VALUES (1,1,'DciHDhIFZoOXknjQv4c8H2jddrltJjvl','2021-08-08 11:04:14','2021-08-08 11:04:14'),(2,1,'GcQTnOff0DS0262Z3QEnullXEXyYNIO1','2021-08-09 08:25:20','2021-08-09 08:25:20'),(3,1,'7uTsxESpzmmVXdtHAqDwgtfGl9sg57qQ','2021-08-09 13:42:28','2021-08-09 13:42:28'),(4,1,'eg2KY9R5vPXnYXHTfro0PDzPwKvXYEIs','2021-08-10 12:04:20','2021-08-10 12:04:20'),(5,1,'t9WpuT4t4Kl0TdM1ionPYx6sK69z2nm8','2021-08-10 13:22:41','2021-08-10 13:22:41'),(6,1,'z3PK2iq555EkYfV2CGv6IXQwzVrBJGpL','2021-08-11 13:11:55','2021-08-11 13:11:55'),(7,1,'ayYyXrepfg9syjaWn8yp2joZCmMcG4aL','2021-08-12 11:30:41','2021-08-12 11:30:41'),(8,1,'ypZ4ohj2Y40y9n9sbFKR1tWm34RLUHIK','2021-08-13 20:56:17','2021-08-13 20:56:17'),(9,1,'8fQyt94i587AJY5LBCLTv4Dk5VpwHK3p','2021-08-15 08:08:05','2021-08-15 08:08:05');
/*!40000 ALTER TABLE `persistences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_options`
--

DROP TABLE IF EXISTS `poll_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poll_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` bigint unsigned DEFAULT NULL,
  `option` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_options_poll_id_foreign` (`poll_id`),
  CONSTRAINT `poll_options_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_options`
--

LOCK TABLES `poll_options` WRITE;
/*!40000 ALTER TABLE `poll_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_results`
--

DROP TABLE IF EXISTS `poll_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poll_results` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` bigint DEFAULT NULL,
  `poll_option_id` bigint unsigned DEFAULT NULL,
  `browser_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_results_poll_option_id_foreign` (`poll_option_id`),
  CONSTRAINT `poll_results_poll_option_id_foreign` FOREIGN KEY (`poll_option_id`) REFERENCES `poll_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_results`
--

LOCK TABLES `poll_results` WRITE;
/*!40000 ALTER TABLE `poll_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `auth_required` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls`
--

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `sub_category_id` bigint unsigned DEFAULT NULL,
  `post_type` enum('article','video','audio','trivia-quiz','personality-quiz') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 Non Submitted, 1 submitted',
  `image_id` bigint unsigned DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `auth_required` tinyint(1) NOT NULL DEFAULT '0',
  `slider` tinyint(1) NOT NULL DEFAULT '0',
  `slider_order` int NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `featured_order` int NOT NULL DEFAULT '0',
  `breaking` tinyint(1) NOT NULL DEFAULT '0',
  `breaking_order` int NOT NULL DEFAULT '0',
  `recommended` tinyint(1) NOT NULL DEFAULT '0',
  `recommended_order` int NOT NULL DEFAULT '0',
  `editor_picks` tinyint(1) NOT NULL DEFAULT '0',
  `editor_picks_order` int NOT NULL DEFAULT '0',
  `scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_date` timestamp NULL DEFAULT NULL,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `video_id` bigint unsigned DEFAULT NULL,
  `video_url_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` text COLLATE utf8mb4_unicode_ci,
  `video_thumbnail_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `total_hit` bigint NOT NULL DEFAULT '0',
  `contents` longtext COLLATE utf8mb4_unicode_ci COMMENT 'extra content',
  `read_more_link` text COLLATE utf8mb4_unicode_ci COMMENT 'rss post actual link',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_category_id_foreign` (`category_id`),
  KEY `posts_image_id_foreign` (`image_id`),
  KEY `posts_video_thumbnail_id_foreign` (`video_thumbnail_id`),
  KEY `posts_video_id_foreign` (`video_id`),
  KEY `posts_visibility_status_slider_language_auth_required_index` (`visibility`,`status`,`slider`,`language`,`auth_required`),
  KEY `posts_featured_breaking_recommended_editor_picks_tags_index` (`featured`,`breaking`,`recommended`,`editor_picks`,`tags`),
  KEY `posts_recommended_order_featured_order_id_index` (`recommended_order`,`featured_order`,`id`),
  KEY `posts_post_type_video_url_type_total_hit_index` (`post_type`,`video_url_type`,`total_hit`),
  KEY `posts_created_at_updated_at_index` (`created_at`,`updated_at`),
  KEY `posts_user_id_category_id_index` (`user_id`,`category_id`),
  KEY `posts_sub_category_id_video_thumbnail_id_index` (`sub_category_id`,`video_thumbnail_id`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `posts_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `posts_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `posts_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `posts_video_thumbnail_id_foreign` FOREIGN KEY (`video_thumbnail_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Sample article post','sample-article-post','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','en',1,1,1,'article',0,8,1,0,1,0,1,0,1,0,1,0,1,0,0,'Sample Product News','sample,product,news','This is products news page to test the page','products',NULL,'default',NULL,'','',NULL,1,3,NULL,NULL,'2021-08-08 11:03:04','2021-08-11 14:26:59'),(2,'Sample video post','sample-video-post','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','en',1,1,1,'video',0,10,1,0,0,0,1,0,1,0,1,0,1,0,0,'Sample video post',NULL,NULL,'politics,world',NULL,'default',NULL,'mp4_url','http://www.caminandes.com/download/03_caminandes_llamigos_1080p.mp4',6,1,8,NULL,NULL,'2021-08-08 11:03:04','2021-08-10 13:00:34'),(4,'Swann launches award-winning tracker camera & enforcer camera systems','Swann-CCTV-systems','<p>Swann, a global pioneer in do-it-yourself security, has announced the release of the award-winning&nbsp;Swann&nbsp;Tracker Security Camera&nbsp;as well as the&nbsp;Swann Enforcer&trade; Camera&nbsp;Systems&nbsp;in 4K resolution, a perfect indoor and outdoor security solution for any home or business.&nbsp;The 1080p resolution Enforcer Cameras are coming soon.</p>\r\n<p>The Swann Tracker Security Camera was first unveiled at the Consumer Electronics Show (CES) earlier this year and was named a CES 2020 Innovation Award Honoree as the world&rsquo;s first compact, a non-mechanical pan-tilt security camera that includes auto-tracking.</p>\r\n<p>The Enforcer&trade; is Swann&rsquo;s latest camera that includes motion-activated, red and blue flashing lights, spotlight, siren (on 4K variant), and additional features to deter intruders.</p>\r\n<p>Swann Welcomes Two New Additions to Their Security Line:</p>\r\n<h2>The Swann Wi-Fi Tracker Security Camera</h2>\r\n<ul>\r\n<li>World&rsquo;s first compact, non-mechanical pan-tilt indoor security camera uses innovative auto-tracking technology to track and record moving objects without physically having to pan or tilt.</li>\r\n<li>Auto-zoom capability ensures any suspicious activity is kept targeted and in focus for up to 2 objects at once within a second camera view while the main 180-degree widescreen full-room view remains onscreen via the Swann Security app.</li>\r\n<li>Infrared night vision can see in the dark up to 32ft / 10m, automatically turning on when the lights are off.</li>\r\n<li>Two-way audio- Greet visitors, talk to pets, or warn off intruders.</li>\r\n<li>Easy to install-just plug into power and connect through Wi-Fi.</li>\r\n</ul>\r\n<h2>The Swann&nbsp;Enforcer&trade; Security Systems</h2>\r\n<ul>\r\n<li>Motion-activated police-style, red and blue flashing lights-&nbsp;deters intruders, while their spotlights, sirens (4K version only), and mobile alerts ensure intruders are left with nowhere to hide.</li>\r\n<li>Night2Day&trade; color night vision-Available on the 1080P model, this ensures complete protection and peace of mind 24/7.</li>\r\n<li>True Detect&trade; Heat and Motion technology&ndash; sensing people and cars for more reliable security monitoring and fewer false alarms.</li>\r\n<li>Free local storage on DVR- up to 180 days onto a 2TB hard drive, plus the ability to upload clips to the cloud for free.</li>\r\n</ul>\r\n<h2>Easy to use a home security system</h2>\r\n<p><span class=\"pullquote float-right ml-3\">Swann Security app gives users a unique ability to control wired and wireless security devices from multiple sites</span></p>\r\n<p>&ldquo;<em>While many of us are staying home to reduce the spread of COVID-19, the need to safeguard our homes and small businesses has never been of greater importance. These next-generation Swann products offer advanced features to prevent and deter unwanted intruders outside and inside the house</em>&rdquo;, said Mike Lucas, CEO, Swann.</p>\r\n<p>&ldquo;<em>Swann&rsquo;s latest products continue the Swann tradition of providing consumers with easy to use, reliable, home security protection and 24/7 peace of mind</em>.&rdquo;</p>\r\n<h2>Security control in the palm of the hands</h2>\r\n<p>These new products are part of a complete security ecosystem that is managed under the &lsquo;Swann Security\'&nbsp;app. This gives users a unique ability to control wired and wireless security devices from multiple sites, stream live video, always receive rich notifications and know what&rsquo;s happening in one place.</p>\r\n<p>Swann is the only vendor that offers a complete lineup of inter-connectable wired and wireless security solutions that is also completely integrated with Google Assistant and Alexa.</p>','en',1,2,2,'article',0,2,1,0,1,0,1,0,1,0,1,0,1,0,0,'Swann launches award-winning tracker camera & enforcer camera systems','cctv','This is description','cctv',NULL,'default',NULL,NULL,NULL,NULL,1,6,NULL,NULL,'2021-08-08 11:50:38','2021-08-08 12:51:02'),(5,'waving-other','waving-the-other','<p>THAT direction,\' waving the other queer noises, would change to dull reality--the grass would be quite absurd for her to wink with one foot. \'Get up!\' said the Gryphon remarked: \'because they lessen from day to day.\' This was not easy to know when the race was over. However, when they liked, and left foot, so as to size,\' Alice hastily replied; \'at least--at least I mean what I should think very likely true.) Down, down, down. There was exactly one a-piece all round. \'But she must have got altered.\' \'It is a very little! Besides, SHE\'S she, and I\'m sure I don\'t remember where.\' \'Well, it must be growing small again.\' She got up and say \"Who am I to do?\' said Alice. \'Why not?\' said the Duchess. \'Everything\'s got a moral, if only you can have no sort of way to hear her try and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Hatter, and here the Mock Turtle: \'why, if a dish or kettle had been found and handed back to her: first, because the chimneys were shaped like ears and whiskers</p>','en',1,1,NULL,'article',0,6,1,0,1,0,0,0,0,0,0,0,0,0,0,'waving-other',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,4,'{\"1\":{\"image\":{\"image_id\":\"3\"}},\"2\":{\"image\":{\"image_id\":\"5\"}},\"3\":{\"image-text\":{\"image_id\":\"6\",\"text\":\"So she called softly after it, never once considering how in the pictures of him), while the rest of it in time,\' said the Pigeon in a game of croquet she was out of the jurors had a large pool all round the refreshments!\' But there seemed to be no doubt that it might injure the brain; But, now that I\'m perfectly sure I have none, Why, I do so like that curious song about the whiting!\' \'Oh, as to bring tears into her head. \'If I eat one of the Shark, But, when the race was over. Alice was not going to shrink any further: she felt unhappy. \'It was a dispute going on shrinking.\"}}}',NULL,'2021-08-10 12:32:44','2021-08-11 14:29:06'),(6,'Rivers','flowing-rivers','<p>A&nbsp;<strong>river</strong>&nbsp;is a natural flowing&nbsp;<a title=\"Watercourse\" href=\"https://en.wikipedia.org/wiki/Watercourse\">watercourse</a>, usually&nbsp;<a class=\"mw-redirect\" title=\"Freshwater\" href=\"https://en.wikipedia.org/wiki/Freshwater\">freshwater</a>, flowing towards an&nbsp;<a title=\"Ocean\" href=\"https://en.wikipedia.org/wiki/Ocean\">ocean</a>,&nbsp;<a title=\"Sea\" href=\"https://en.wikipedia.org/wiki/Sea\">sea</a>,&nbsp;<a title=\"Lake\" href=\"https://en.wikipedia.org/wiki/Lake\">lake</a>&nbsp;or another river. In some cases, a river flows into the ground and becomes dry at the end of its course without reaching another body of water. Small rivers can be referred to using names such as&nbsp;<a title=\"Stream\" href=\"https://en.wikipedia.org/wiki/Stream\">stream</a>, creek, brook, rivulet, and&nbsp;<a title=\"Rill\" href=\"https://en.wikipedia.org/wiki/Rill\">rill</a>. There are no official definitions for the generic term river as applied to&nbsp;<a title=\"Geographical feature\" href=\"https://en.wikipedia.org/wiki/Geographical_feature\">geographic features</a>,<sup id=\"cite_ref-GNIS_1-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/River#cite_note-GNIS-1\">[1]</a></sup>&nbsp;although in some countries or communities a stream is defined by its size. Many names for small rivers are specific to geographic location; examples are \"run\" in some parts of the United States, \"<a class=\"mw-redirect\" title=\"Burn (topography)\" href=\"https://en.wikipedia.org/wiki/Burn_(topography)\">burn</a>\" in Scotland and northeast England, and \"beck\" in northern England.</p>','en',1,2,2,'video',0,11,1,0,0,0,0,0,0,0,0,0,0,0,0,'Rivers',NULL,NULL,NULL,NULL,'default',NULL,'mp4_url',NULL,13,1,11,NULL,NULL,'2021-08-11 13:39:09','2021-08-11 13:50:10'),(7,'Product News 2','product-news-2','<p>Of course, every newsletter is different, and what works for some organizations won&rsquo;t necessarily work for you. But, it&rsquo;s still OK to take a look at other newsletter design examples to see what your inbox competition is doing. That way you can distill this inspiration into something that works for your own audience.</p>\r\n<p>With that in mind, we put together a list of the best email newsletter examples that will hopefully give you some great ideas. To make it easier, we broke them down into the following categories:</p>','en',1,1,NULL,'article',0,18,1,0,0,0,0,0,0,0,0,0,0,0,0,'Product News 2',NULL,NULL,NULL,NULL,'style_3',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'2021-08-11 14:49:58','2021-08-11 14:49:58'),(8,'Product News 3','product-news-3','<p><strong>Closed-circuit television</strong>&nbsp;(<strong>CCTV</strong>), also known as&nbsp;<strong>video surveillance</strong>,<sup id=\"cite_ref-1\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Closed-circuit_television#cite_note-1\">[1]</a></sup><sup id=\"cite_ref-2\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Closed-circuit_television#cite_note-2\">[2]</a></sup>&nbsp;is the use of&nbsp;<a title=\"Video camera\" href=\"https://en.wikipedia.org/wiki/Video_camera\">video cameras</a>&nbsp;to transmit a signal to a specific place, on a limited set of monitors. It differs from&nbsp;<a class=\"mw-redirect\" title=\"Broadcast television\" href=\"https://en.wikipedia.org/wiki/Broadcast_television\">broadcast television</a>&nbsp;in that the signal is not openly transmitted, though it may employ point-to-point (P2P), point-to-multipoint (P2MP), or&nbsp;<a title=\"Mesh networking\" href=\"https://en.wikipedia.org/wiki/Mesh_networking\">mesh</a>&nbsp;wired or&nbsp;<a title=\"Wireless\" href=\"https://en.wikipedia.org/wiki/Wireless\">wireless links</a>. Even though almost all video cameras fit this definition, the term is most often applied to those used for&nbsp;<a title=\"Surveillance\" href=\"https://en.wikipedia.org/wiki/Surveillance\">surveillance</a>&nbsp;in areas that require additional security or ongoing monitoring.</p>','en',1,1,NULL,'article',0,17,1,0,0,0,0,0,0,0,0,0,0,0,0,'Product News 3',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'2021-08-11 14:52:33','2021-08-11 14:52:33'),(9,'Event News 1','event-news-1','<p><strong>The shortlist for this year&rsquo;s prestigious miaList has been revealed by the&nbsp;<a href=\"http://www.mia-uk.org/\" target=\"_blank\" rel=\"noreferrer noopener\">Meetings Industry Association</a>&nbsp;(mia).</strong></p>\r\n<p>Celebrating its landmark tenth year, the miaList shines a spotlight on the inspiring and talented individuals and teams who go above and beyond the call of duty to support the success of their organisation and the wider business meetings and events sector. &nbsp;&nbsp;</p>','en',1,2,NULL,'article',0,19,1,0,0,0,0,0,0,0,0,0,0,0,0,'Event News 1',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,4,NULL,NULL,'2021-08-11 14:56:12','2021-08-11 15:02:54'),(10,'Event News 2','event-news-2','<p>Mouse, do you mean that you had been to the Caterpillar, just as I do,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising its voice to its feet, \'I move that the poor little feet, I wonder what they\'ll do next! If they had any dispute with the lobsters, out to sea. So they couldn\'t see it?\' So she tucked her arm affectionately into Alice\'s, and they went up to the Gryphon. \'How the creatures argue. It\'s enough to look about her repeating \'YOU ARE OLD, FATHER WILLIAM,\"\' said the Footman. \'That\'s the reason of that?\' \'In my youth,\' said the Caterpillar; and it was her turn or not. \'Oh, PLEASE mind what you\'re at!\" You know the way down one side and then the other, and growing sometimes taller and sometimes shorter,&nbsp;</p>','en',1,2,NULL,'video',0,23,1,0,0,0,0,0,0,0,0,0,0,0,0,'Event News 2',NULL,NULL,NULL,NULL,'default',2,NULL,NULL,25,1,0,NULL,NULL,'2021-08-11 15:10:43','2021-08-11 15:10:43'),(11,'Event News 3','event-news-4','<p>Rivers are part of the&nbsp;<a class=\"mw-redirect\" title=\"\" href=\"https://en.wikipedia.org/wiki/Hydrological_cycle\">hydrological cycle</a>. Water generally collects in a river from&nbsp;<a class=\"mw-redirect\" title=\"Precipitation (meteorology)\" href=\"https://en.wikipedia.org/wiki/Precipitation_(meteorology)\">precipitation</a>&nbsp;through a&nbsp;<a title=\"Drainage basin\" href=\"https://en.wikipedia.org/wiki/Drainage_basin\">drainage basin</a>&nbsp;from&nbsp;<a title=\"Surface runoff\" href=\"https://en.wikipedia.org/wiki/Surface_runoff\">surface runoff</a>&nbsp;and other sources such as&nbsp;<a title=\"Groundwater recharge\" href=\"https://en.wikipedia.org/wiki/Groundwater_recharge\">groundwater recharge</a>,&nbsp;<a class=\"mw-redirect\" title=\"Spring (hydrosphere)\" href=\"https://en.wikipedia.org/wiki/Spring_(hydrosphere)\">springs</a>, and the release of stored water in natural ice and snowpacks (e.g., from&nbsp;<a title=\"Glacier\" href=\"https://en.wikipedia.org/wiki/Glacier\">glaciers</a>).</p>\r\n<p>Rivers and streams are often considered major features within a landscape; however, they actually only cover around 0.1% of the land on Earth. They are made more obvious and significant to humans since many human cities and civilizations are built around the freshwater supplied by rivers and streams.<sup id=\"cite_ref-3\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/River#cite_note-3\">[3]</a></sup>&nbsp;Most of the&nbsp;<a title=\"List of largest cities\" href=\"https://en.wikipedia.org/wiki/List_of_largest_cities\">major cities of the world</a>&nbsp;are situated on the banks of rivers, as they are, or were, used as a&nbsp;<a title=\"Drinking water\" href=\"https://en.wikipedia.org/wiki/Drinking_water\">source of water</a>, for obtaining&nbsp;<a title=\"Seafood\" href=\"https://en.wikipedia.org/wiki/Seafood\">food</a>, for&nbsp;<a title=\"Maritime transport\" href=\"https://en.wikipedia.org/wiki/Maritime_transport\">transport</a>, as&nbsp;<a class=\"mw-redirect\" title=\"Borders\" href=\"https://en.wikipedia.org/wiki/Borders\">borders</a>, as a defensive measure, as a source of&nbsp;<a title=\"Hydropower\" href=\"https://en.wikipedia.org/wiki/Hydropower\">hydropower</a>&nbsp;to drive machinery, for&nbsp;<a title=\"Bathing\" href=\"https://en.wikipedia.org/wiki/Bathing\">bathing</a>, and as a means of disposing of&nbsp;<a title=\"Waste\" href=\"https://en.wikipedia.org/wiki/Waste\">waste</a>.</p>','en',1,2,NULL,'video',0,22,1,0,0,0,0,0,0,0,0,0,0,0,0,'Event News 3',NULL,NULL,NULL,NULL,'default',2,NULL,NULL,24,1,0,NULL,NULL,'2021-08-11 15:13:25','2021-08-11 15:13:25'),(12,'Event News 4','event-news-checking','<p>Rivers and streams are often considered major features within a landscape; however, they actually only cover around 0.1% of the land on Earth. They are made more obvious and significant to humans since many human cities and civilizations are built around the freshwater supplied by rivers and streams.<sup id=\"cite_ref-3\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/River#cite_note-3\">[3]</a></sup>&nbsp;Most of the&nbsp;<a title=\"List of largest cities\" href=\"https://en.wikipedia.org/wiki/List_of_largest_cities\">major cities of the world</a>&nbsp;are situated on the banks of rivers, as they are, or were, used as a&nbsp;<a title=\"Drinking water\" href=\"https://en.wikipedia.org/wiki/Drinking_water\">source of water</a>, for obtaining&nbsp;<a title=\"Seafood\" href=\"https://en.wikipedia.org/wiki/Seafood\">food</a>, for&nbsp;<a title=\"Maritime transport\" href=\"https://en.wikipedia.org/wiki/Maritime_transport\">transport</a>, as&nbsp;<a class=\"mw-redirect\" title=\"Borders\" href=\"https://en.wikipedia.org/wiki/Borders\">borders</a>, as a defensive measure, as a source of&nbsp;<a title=\"Hydropower\" href=\"https://en.wikipedia.org/wiki/Hydropower\">hydropower</a>&nbsp;to drive machinery, for&nbsp;<a title=\"Bathing\" href=\"https://en.wikipedia.org/wiki/Bathing\">bathing</a>, and as a means of disposing of&nbsp;<a title=\"Waste\" href=\"https://en.wikipedia.org/wiki/Waste\">waste</a>.</p>','en',1,2,NULL,'video',0,15,1,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'default',2,NULL,NULL,16,1,1,NULL,NULL,'2021-08-11 15:20:45','2021-08-11 15:20:45'),(13,'Event News 5','event-news-5','<p>Rivers and streams are often considered major features within a landscape; however, they actually only cover around 0.1% of the land on Earth. They are made more obvious and significant to humans since many human cities and civilizations are built around the freshwater supplied by rivers and streams.<sup id=\"cite_ref-3\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/River#cite_note-3\">[3]</a></sup>&nbsp;Most of the&nbsp;<a title=\"List of largest cities\" href=\"https://en.wikipedia.org/wiki/List_of_largest_cities\">major cities of the world</a>&nbsp;are situated on the banks of rivers, as they are, or were, used as a&nbsp;<a title=\"Drinking water\" href=\"https://en.wikipedia.org/wiki/Drinking_water\">source of water</a>, for obtaining&nbsp;<a title=\"Seafood\" href=\"https://en.wikipedia.org/wiki/Seafood\">food</a>, for&nbsp;<a title=\"Maritime transport\" href=\"https://en.wikipedia.org/wiki/Maritime_transport\">transport</a>, as&nbsp;<a class=\"mw-redirect\" title=\"Borders\" href=\"https://en.wikipedia.org/wiki/Borders\">borders</a>, as a defensive measure, as a source of&nbsp;<a title=\"Hydropower\" href=\"https://en.wikipedia.org/wiki/Hydropower\">hydropower</a>&nbsp;to drive machinery, for&nbsp;<a title=\"Bathing\" href=\"https://en.wikipedia.org/wiki/Bathing\">bathing</a>, and as a means of disposing of&nbsp;<a title=\"Waste\" href=\"https://en.wikipedia.org/wiki/Waste\">waste</a>.</p>','en',1,2,NULL,'article',0,11,1,0,0,0,0,0,0,0,0,0,0,0,0,'Event News 5',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'2021-08-12 11:33:21','2021-08-12 11:33:21'),(14,'Event News 6','event-news-6','<p>The&nbsp;<a class=\"mw-redirect\" title=\"Strahler Stream Order\" href=\"https://en.wikipedia.org/wiki/Strahler_Stream_Order\">Strahler Stream Order</a>&nbsp;ranks rivers based on the connectivity and hierarchy of contributing tributaries. Headwaters are first order while the&nbsp;<a title=\"Amazon River\" href=\"https://en.wikipedia.org/wiki/Amazon_River\">Amazon River</a>&nbsp;is twelfth order. Approximately 80% of the rivers and streams in the world are of the first and second order.</p>\r\n<p>In certain languages, distinctions are made among rivers based on their stream order. In French, for example, rivers that run to the sea are called&nbsp;<em>fleuve</em>, while other rivers are called&nbsp;<em>rivi&egrave;re</em>. For example, in&nbsp;<a title=\"Canada\" href=\"https://en.wikipedia.org/wiki/Canada\">Canada</a>, the&nbsp;<a title=\"Churchill River (Hudson Bay)\" href=\"https://en.wikipedia.org/wiki/Churchill_River_(Hudson_Bay)\">Churchill River</a>&nbsp;in&nbsp;<a title=\"Manitoba\" href=\"https://en.wikipedia.org/wiki/Manitoba\">Manitoba</a>&nbsp;is called&nbsp;<em>la rivi&egrave;re Churchill</em>&nbsp;as it runs to&nbsp;<a title=\"Hudson Bay\" href=\"https://en.wikipedia.org/wiki/Hudson_Bay\">Hudson Bay</a>, but the&nbsp;<a title=\"Churchill River (Atlantic)\" href=\"https://en.wikipedia.org/wiki/Churchill_River_(Atlantic)\">Churchill River</a>&nbsp;in&nbsp;<a title=\"Labrador\" href=\"https://en.wikipedia.org/wiki/Labrador\">Labrador</a>&nbsp;is called&nbsp;<em>le fleuve Churchill</em>&nbsp;as it runs to the&nbsp;<a title=\"Atlantic Ocean\" href=\"https://en.wikipedia.org/wiki/Atlantic_Ocean\">Atlantic Ocean</a>. As most rivers in France are known by their names only without the word&nbsp;<em>rivi&egrave;re</em>&nbsp;or&nbsp;<em>fleuve</em>&nbsp;</p>','en',1,2,2,'article',0,23,1,0,0,0,0,0,0,0,0,0,0,0,0,'Event News 6',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,3,NULL,NULL,'2021-08-12 14:57:04','2021-08-12 14:57:04'),(15,'Corporate News','corporate-news-1','<h3 class=\"section-title\">What is security?</h3>\r\n<p>Security for information technology (IT) refers to the methods, tools and personnel used to defend an organization\'s digital assets. The goal of IT security is to protect these assets, devices and services from being disrupted, stolen or exploited by unauthorized users, otherwise known as&nbsp;<a href=\"https://whatis.techtarget.com/definition/threat-actor\">threat actors</a>. These threats can be external or internal and malicious or accidental in both origin and nature.</p>','en',1,3,3,'article',0,14,1,0,0,0,0,0,0,0,0,0,0,0,0,'Corporate News',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'2021-08-15 09:14:21','2021-08-15 09:14:21'),(16,'Corporate News 2','corporate-news-2','<h3 class=\"section-title\">What is security?</h3>\r\n<p>Security for information technology (IT) refers to the methods, tools and personnel used to defend an organization\'s digital assets. The goal of IT security is to protect these assets, devices and services from being disrupted, stolen or exploited by unauthorized users, otherwise known as&nbsp;<a href=\"https://whatis.techtarget.com/definition/threat-actor\">threat actors</a>. These threats can be external or internal and malicious or accidental in both origin and nature.</p>','en',1,3,3,'article',0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'Corporate News 2',NULL,NULL,NULL,NULL,'style_2',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'2021-08-15 09:18:23','2021-08-15 09:19:07'),(17,'Case Studies 1','case-studies-news-1','<h3 class=\"section-title\">What is security?</h3>\r\n<p>Security for information technology (IT) refers to the methods, tools and personnel used to defend an organization\'s digital assets. The goal of IT security is to protect these assets, devices and services from being disrupted, stolen or exploited by unauthorized users, otherwise known as&nbsp;<a href=\"https://whatis.techtarget.com/definition/threat-actor\">threat actors</a>. These threats can be external or internal and malicious or accidental in both origin and nature.</p>','en',1,4,NULL,'article',0,23,1,0,0,0,0,0,0,0,0,0,0,0,0,'Case Studies 1',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'2021-08-15 09:31:29','2021-08-15 09:31:29'),(18,'Case Studies 2﻿​','case-studies-news-2','<p>An effective security strategy uses a range of approaches to minimize vulnerabilities and target many types of cyberthreats. Detection, prevention and response to security threats involve the use of&nbsp;<a href=\"https://searchsecurity.techtarget.com/definition/security-policy\">security policies</a>, software tools and IT services.</p>\r\n<p>Unfortunately, technological innovation benefits both IT defenders and&nbsp;<a href=\"https://searchsecurity.techtarget.com/definition/cybercrime\">cybercriminals</a>. To protect business assets, companies must routinely review, update and improve security to stay ahead of cyberthreats and increasingly sophisticated cybercriminals.</p>','en',1,4,NULL,'article',0,13,1,0,0,0,0,0,0,0,0,0,0,0,0,'Case Studies 2﻿​',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'2021-08-15 09:32:53','2021-08-15 09:32:53'),(19,'Case Studies ﻿3','case-studies-news-3','<p>An effective security strategy uses a range of approaches to minimize vulnerabilities and target many types of cyberthreats. Detection, prevention and response to security threats involve the use of&nbsp;<a href=\"https://searchsecurity.techtarget.com/definition/security-policy\">security policies</a>, software tools and IT services.</p>\r\n<p>Unfortunately, technological innovation benefits both IT defenders and&nbsp;<a href=\"https://searchsecurity.techtarget.com/definition/cybercrime\">cybercriminals</a>. To protect business assets, companies must routinely review, update and improve security to stay ahead of cyberthreats and increasingly sophisticated cybercriminals.</p>','en',1,4,NULL,'article',0,17,1,0,0,0,0,0,0,0,0,0,0,0,0,'Case Studies ﻿3',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'2021-08-15 09:35:58','2021-08-15 09:35:58'),(20,'Case Studies ﻿4','case-studies-news-4','<p>An effective security strategy uses a range of approaches to minimize vulnerabilities and target many types of cyberthreats. Detection, prevention and response to security threats involve the use of&nbsp;<a href=\"https://searchsecurity.techtarget.com/definition/security-policy\">security policies</a>, software tools and IT services.</p>\r\n<p>Unfortunately, technological innovation benefits both IT defenders and&nbsp;<a href=\"https://searchsecurity.techtarget.com/definition/cybercrime\">cybercriminals</a>. To protect business assets, companies must routinely review, update and improve security to stay ahead of cyberthreats and increasingly sophisticated cybercriminals.</p>','en',1,4,NULL,'article',0,6,1,0,0,0,0,0,0,0,0,0,0,0,0,'Case Studies ﻿4',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'2021-08-15 09:37:17','2021-08-15 09:37:17'),(21,'Case Studies ﻿5','case-studies-news-5','<p>An effective security strategy uses a range of approaches to minimize vulnerabilities and target many types of cyberthreats. Detection, prevention and response to security threats involve the use of&nbsp;<a href=\"https://searchsecurity.techtarget.com/definition/security-policy\">security policies</a>, software tools and IT services.</p>\r\n<p>Unfortunately, technological innovation benefits both IT defenders and&nbsp;<a href=\"https://searchsecurity.techtarget.com/definition/cybercrime\">cybercriminals</a>. To protect business assets, companies must routinely review, update and improve security to stay ahead of cyberthreats and increasingly sophisticated cybercriminals.</p>','en',1,4,NULL,'article',0,20,1,0,0,0,0,0,0,0,0,0,0,0,0,'Case Studies ﻿5',NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'2021-08-15 09:38:20','2021-08-15 09:38:20');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answers`
--

DROP TABLE IF EXISTS `quiz_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_answers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quiz_question_id` bigint unsigned DEFAULT NULL,
  `image_id` bigint unsigned DEFAULT NULL,
  `answer_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_correct` tinyint NOT NULL DEFAULT '0',
  `result_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_answers_quiz_question_id_foreign` (`quiz_question_id`),
  KEY `quiz_answers_image_id_foreign` (`image_id`),
  CONSTRAINT `quiz_answers_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `quiz_answers_quiz_question_id_foreign` FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answers`
--

LOCK TABLES `quiz_answers` WRITE;
/*!40000 ALTER TABLE `quiz_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_questions`
--

DROP TABLE IF EXISTS `quiz_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned DEFAULT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` bigint unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  `answer_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_questions_post_id_foreign` (`post_id`),
  KEY `quiz_questions_image_id_foreign` (`image_id`),
  CONSTRAINT `quiz_questions_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `quiz_questions_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questions`
--

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_results`
--

DROP TABLE IF EXISTS `quiz_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_results` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned DEFAULT NULL,
  `image_id` bigint unsigned DEFAULT NULL,
  `result_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `min_correct` int DEFAULT NULL,
  `max_correct` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_results_post_id_foreign` (`post_id`),
  KEY `quiz_results_image_id_foreign` (`image_id`),
  CONSTRAINT `quiz_results_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `quiz_results_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_results`
--

LOCK TABLES `quiz_results` WRITE;
/*!40000 ALTER TABLE `quiz_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_reaction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reactions_post_id_foreign` (`post_id`),
  CONSTRAINT `reactions_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactions`
--

LOCK TABLES `reactions` WRITE;
/*!40000 ALTER TABLE `reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reminders_user_id_foreign` (`user_id`),
  CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_role_id_foreign` (`role_id`),
  CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
INSERT INTO `role_users` VALUES (1,1,'2021-08-08 11:03:03','2021-08-08 11:03:03');
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'superadmin','Superadmin','{\"users_read\":true,\"users_write\":true,\"users_delete\":true,\"settings_read\":true,\"settings_write\":true,\"settings_delete\":true,\"role_read\":true,\"role_write\":true,\"role_delete\":true,\"permission_read\":true,\"permission_write\":true,\"permission_delete\":true,\"language_settings_read\":true,\"language_settings_write\":true,\"language_settings_delete\":true,\"pages_read\":true,\"pages_write\":true,\"pages_delete\":true,\"menu_read\":true,\"menu_write\":true,\"menu_delete\":true,\"menu_item_read\":true,\"menu_item_write\":true,\"menu_item_delete\":true,\"post_read\":true,\"post_write\":true,\"post_delete\":true,\"category_read\":true,\"category_write\":true,\"category_delete\":true,\"sub_category_read\":true,\"sub_category_write\":true,\"sub_category_delete\":true,\"widget_read\":true,\"widget_write\":true,\"widget_delete\":true,\"newsletter_read\":true,\"newsletter_write\":true,\"newsletter_delete\":true,\"notification_read\":true,\"notification_write\":true,\"notification_delete\":true,\"contact_message_read\":true,\"contact_message_write\":true,\"contact_message_delete\":true,\"ads_read\":true,\"ads_write\":true,\"ads_delete\":true,\"theme_section_read\":true,\"theme_section_write\":true,\"theme_section_delete\":true,\"polls_read\":true,\"polls_write\":true,\"polls_delete\":true,\"socials_read\":true,\"socials_write\":true,\"socials_delete\":true,\"comments_read\":true,\"comments_write\":true,\"comments_delete\":true,\"album_read\":true,\"album_write\":true,\"album_delete\":true,\"rss_read\":true,\"rss_write\":true,\"rss_delete\":true,\"api_read\":true,\"api_write\":true,\"api_delete\":true}','2021-08-08 11:03:03','2021-08-08 11:03:03'),(2,'admin','Admin','{\"users_read\":true,\"users_write\":true,\"settings_read\":true,\"settings_write\":true,\"role_read\":true,\"role_write\":true,\"permission_read\":true,\"permission_write\":true,\"language_settings_read\":true,\"language_settings_write\":true,\"pages_read\":true,\"pages_write\":true,\"menu_read\":true,\"menu_write\":true,\"menu_item_read\":true,\"menu_item_write\":true,\"post_read\":true,\"post_write\":true,\"category_read\":true,\"category_write\":true,\"sub_category_read\":true,\"sub_category_write\":true,\"widget_read\":true,\"widget_write\":true,\"newsletter_read\":true,\"newsletter_write\":true,\"notification_read\":true,\"notification_write\":true,\"contact_message_read\":true,\"contact_message_write\":true,\"ads_read\":true,\"ads_write\":true,\"theme_section_read\":true,\"theme_section_write\":true,\"polls_read\":true,\"polls_write\":true,\"socials_read\":true,\"socials_write\":true,\"comments_read\":true,\"comments_write\":true,\"album_read\":true,\"album_write\":true,\"rss_read\":true,\"rss_write\":true}','2021-08-08 11:03:03','2021-08-08 11:03:03'),(3,'editor','Editor','{\"pages_read\":true,\"pages_write\":true,\"menu_read\":true,\"menu_write\":true,\"menu_item_read\":true,\"menu_item_write\":true,\"post_read\":true,\"post_write\":true,\"category_read\":true,\"category_write\":true,\"sub_category_read\":true,\"sub_category_write\":true,\"widget_read\":true,\"widget_write\":true,\"newsletter_read\":true,\"newsletter_write\":true,\"notification_read\":true,\"notification_write\":true,\"contact_message_read\":true,\"contact_message_write\":true,\"ads_read\":true,\"ads_write\":true,\"polls_read\":true,\"polls_write\":true}','2021-08-08 11:03:03','2021-08-08 11:03:03'),(4,'user','User',NULL,'2021-08-08 11:03:03','2021-08-08 11:03:03'),(5,'subscriber','Subscriber',NULL,'2021-08-08 11:03:03','2021-08-08 11:03:03');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rss_feeds`
--

DROP TABLE IF EXISTS `rss_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rss_feeds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feed_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `sub_category_id` bigint unsigned DEFAULT NULL,
  `post_limit` smallint NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `show_read_more` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `keep_date` tinyint(1) NOT NULL DEFAULT '0',
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_date` timestamp NULL DEFAULT NULL,
  `layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rss_feeds_category_id_foreign` (`category_id`),
  KEY `rss_feeds_sub_category_id_foreign` (`sub_category_id`),
  CONSTRAINT `rss_feeds_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `rss_feeds_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rss_feeds`
--

LOCK TABLES `rss_feeds` WRITE;
/*!40000 ALTER TABLE `rss_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `rss_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'facebook_client_id','*****************','en',NULL,NULL),(2,'facebook_client_secretkey','******************','en',NULL,NULL),(3,'facebook_visibility','0','en',NULL,NULL),(4,'facebook_callback_url','https://example.net/login/facebook/callback','en',NULL,NULL),(5,'google_client_id','**********************','en',NULL,NULL),(6,'google_client_secretkey','***********************','en',NULL,NULL),(7,'google_visibility','0','en',NULL,NULL),(8,'google_callback_url','https://example.net/login/google/callback','en',NULL,NULL),(9,'preloader_option','1','en',NULL,NULL),(10,'submit_news_status','1','en',NULL,NULL),(11,'version','130','en',NULL,NULL),(12,'api_key_for_app','','en',NULL,NULL),(13,'latest_apk_version','','en',NULL,NULL),(14,'latest_apk_code','','en',NULL,NULL),(15,'apk_file_url','','en',NULL,NULL),(16,'whats_new_on_latest_apk','','en',NULL,NULL),(17,'apk_update_skipable_status','false','en',NULL,NULL),(18,'latest_ipa_version','','en',NULL,NULL),(19,'latest_ipa_code','','en',NULL,NULL),(20,'ipa_file_url','','en',NULL,NULL),(21,'whats_new_on_latest_ipa','','en',NULL,NULL),(22,'ios_update_skipable_status','','en',NULL,NULL),(23,'mandatory_login','false','en',NULL,NULL),(24,'intro_skippable','false','en',NULL,NULL),(25,'privacy_policy_url','','en',NULL,NULL),(26,'terms_n_condition_url','','en',NULL,NULL),(27,'support_url','','en',NULL,NULL),(28,'ads_enable','false','en',NULL,NULL),(29,'mobile_ads_network','','en',NULL,NULL),(30,'admob_app_id','','en',NULL,NULL),(31,'admob_banner_ads_id','','en',NULL,NULL),(32,'admob_interstitial_ads_id','','en',NULL,NULL),(33,'admob_native_ads_id','','en',NULL,NULL),(34,'fan_native_ads_placement_id','','en',NULL,NULL),(35,'fan_banner_ads_placement_id','','en',NULL,NULL),(36,'fan_interstitial_ads_placement_id','','en',NULL,NULL),(37,'startapp_app_id','','en',NULL,NULL),(38,'default_language','en','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(39,'timezone','Asia/Riyadh','en','2021-08-08 11:03:04','2021-08-15 09:53:22'),(40,'application_name','Security News','en','2021-08-08 11:03:04','2021-08-15 09:46:15'),(41,'mail_driver','smtp','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(42,'mail_host','smtp.gmail.com','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(43,'sendmail_path','/usr/bin/sendmail -bs','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(44,'mail_port','465','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(45,'mail_address','***********','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(46,'mail_name','Security News and Magazine','en','2021-08-08 11:03:04','2021-08-15 06:57:33'),(47,'mail_username','***********','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(48,'mail_password','***********','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(49,'mail_encryption','ssl','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(50,'default_storage','local','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(51,'aws_access_key_id','***********','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(52,'aws_secret_access_key','***************','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(53,'aws_default_region','ap-south-1','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(54,'aws_bucket','demo11223','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(55,'logo','images/20210815095534_logo_3.png','en','2021-08-08 11:03:04','2021-08-15 06:55:34'),(56,'favicon','images/favicon.png','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(57,'onesignal_api_key','****************','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(58,'onesignal_app_id','************','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(59,'onesignal_action_message','We\'d like to show you notifications for the latest updates.','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(60,'onesignal_accept_button','ALLOW','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(61,'onesignal_cancel_button','NO THANKS','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(62,'notification_status','1','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(63,'seo_title','Security News and Magazine','en','2021-08-08 11:03:04','2021-08-15 07:00:15'),(64,'seo_keywords',NULL,'en','2021-08-08 11:03:04','2021-08-15 07:00:15'),(65,'seo_meta_description',NULL,'en','2021-08-08 11:03:04','2021-08-15 07:00:15'),(66,'author_name','ArmTech','en','2021-08-08 11:03:04','2021-08-15 07:00:15'),(67,'og_title','Your Website Title','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(68,'og_description',NULL,'en','2021-08-08 11:03:04','2021-08-15 07:00:15'),(69,'og_image','images/20201018123322_og_image_49.png','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(70,'google_analytics_id','UA-xxxxxxxx-1','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(71,'page_detail_prefix','page','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(72,'article_detail_prefix','story','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(73,'url','http://127.0.0.1:8000','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(74,'address','Kerala','en','2021-08-08 11:03:04','2021-08-15 09:46:15'),(75,'email','info@securitynews.info','en','2021-08-08 11:03:04','2021-08-15 09:46:15'),(76,'phone','01400620055','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(77,'zip_code','1207','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(78,'city','Kozhikode','en','2021-08-08 11:03:04','2021-08-15 09:46:15'),(79,'state','Kerala','en','2021-08-08 11:03:04','2021-08-15 09:46:15'),(80,'country','India','en','2021-08-08 11:03:04','2021-08-15 09:46:15'),(81,'website','securitynews.info','en','2021-08-08 11:03:04','2021-08-15 09:46:15'),(82,'company_registration','123456789','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(83,'tax_number','123456789','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(84,'about_us_description','IS the same height as herself; and when she was considering in her life, and had to fall upon Alice, as she spoke; \'either you or your head must be kind to them,\' thought Alice, and, after folding his arms and legs in all directions, \'just like a steam-engine when she went slowly after it: \'I.','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(85,'captcha_secret','**********','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(86,'captcha_sitekey','***********','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(87,'captcha_visibility','0','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(88,'copyright_text','Copyright © 2021 Security News and Magazine - All Rights Reserved.','en','2021-08-08 11:03:04','2021-08-15 09:46:15'),(89,'signature','<p>Best Regards</p>','en','2021-08-08 11:03:04','2021-08-15 06:57:33'),(90,'addthis_public_id','','en','2021-08-08 11:03:04','2021-08-15 07:00:15'),(91,'addthis_toolbox','','en','2021-08-08 11:03:04','2021-08-15 07:00:15'),(92,'adthis_option','1','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(93,'inbuild_comment','1','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(94,'disqus_comment','0','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(95,'disqus_short_name','onno','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(96,'facebook_comment','0','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(97,'facebook_app_id','********','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(98,'predefined_header','','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(99,'custom_header_style','','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(100,'custom_footer_js','','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(101,'ffmpeg_status','0','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(102,'application_name','ONNO','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(103,'address','khilkhet','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(104,'phone','01400620055','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(105,'zip_code','1207','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(106,'city','Dhaka','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(107,'state','Dhaka','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(108,'country','Country','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(109,'website','spaGreen.net','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(110,'company_registration','123456789','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(111,'tax_number','123456789','en','2021-08-08 11:03:04','2021-08-08 11:03:04'),(112,'about_us_description','فيها الحار بالبارد، والرطب باليابس، امتزاج تكافؤ وتعادل في القوى. وكانت هذه الطينة المتخمرة كبيرة جداً وكان بعضها يفضل بعضاً في الأغصان، والورق، والزهر والثمر، والأفعال فكان يقيسها بالحيوان، ويعلم أن لها شيئاً واحداً من جميع الاتجاهات، فإذن لا يفهم تأخر العالم عن الزمان. وكذلك أيضاً كان يقول: إذا كان حادثاً، فلا بد له من المال، واشترى ببعضه مركباً تحمله إلى تلك الحال إن هو وجد ذلك العضو هو مطلوبه، فحاول هتك حجابه، وشق شغافه، فبكد واستكراه ما، قدر على ذلك، بعد استفراغ مجهوده. وجرد القلب فراه مصمتاً من كل واحد منهما معنى منفرد به عن الأخر زائد على الجسمية، فليس تكون فيه صفة من هذه الاضرب الثلاثة. آما الضرب الأول: أوصاف لها بالإضافة إلى ما اتفقت فيه. وكان يحكم بان الروح الذي لجميع ذلك النوع شيء واحد، إنما الغرض له التكثر بوجه ما. فكان يرى جنس الحيوان وجنس النبات، فيراهما جميعاً متفقين في الاغتذاء والنمو، ألا أن الحيوان يزيد على شدة قبوله للروح أنه يحكي الروح ويتصور بصورته وهو الإنسان خاصة. واليه الإشارة بقوله صلى الله عليه وسلم: &quot;إن الله خلق أدم على صورته&quot;. فان قويت في هذه الأرواح الحيوانية مستعداً لاتمم ما يكون في جنس ما يتغذى به. وأي شيء يكون وفي مقداره وفي المدة التي حددنا منتهاها بأحد وعشرين عاماً. ثم انه سنح لنظره غرابان يقتتلان حتى صرع أحدهما الآخر ميتاً. ثم جعل الحي يبحث في الأرض ولا اصغر من ذلك بالانفراد. وتعلق سلامان بملازمة الجماعة، ورجح القول فيها لما كان في طباعه من دوام الفكرة، وملازمة العبرة، والغوص على المعاني، وأكثر ما كان يراه ملازمة الجماعة، ويقول بتحريم العزلة، فشرع حي بن يقظان ولا يدري وجه الحكمة فيهما: أحدهما - لما ضرب هذا الرسول الأمثال للناس في أكثر ما كان قد وقف نظره عليها. فأول ما نظر إلى الكواكب والأفلاك فرآها كلها إنما تسعى في تحصيل صفاته لنفسه من أي وجه أمكن، وان يتخلق بأخلاقه ويقتدي بأفعاله، ويجد في تنفيذ إرادته، ويسلم الآمر له، ويرضى بجميع حكمه، رضى من قلبه ظاهراً وباطناً، بحيث يسر به وان كان ذلك أطول لبقائه إلا انه على كل حال قصير المدة. واتخذ من الصياصي البقر الوحشية شبه الاسنة، وركبها في القصب القوي، وفي عصي الزان وغيرها، واستعان في ذلك ولم يترجح عنده أحد الاعتقادين على الآخر. فإما أسال فلم يشك أنه من العباد المنقطعين، وصل تلك الجزيرة.','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(113,'copyright_text','حقوق النشر  © 2020 ONNO News and Magazine - كل الحقوق محفوظة.','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(114,'signature','Best Regards','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(115,'onesignal_action_message','We\'d like to show you notifications for the latest updates.','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(116,'onesignal_accept_button','ALLOW','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(117,'onesignal_cancel_button','NO THANKS','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(118,'seo_title','Your Website Title','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(119,'seo_keywords','','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(120,'seo_meta_description','','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(121,'author_name','SpaGreen','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(122,'og_title','Your Website Title','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(123,'og_description','','ar','2021-08-08 11:03:04','2021-08-08 11:03:04'),(124,'status',NULL,'en','2021-08-15 09:46:15','2021-08-15 09:46:15');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_bg_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_bg_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media`
--

LOCK TABLES `social_media` WRITE;
/*!40000 ALTER TABLE `social_media` DISABLE KEYS */;
INSERT INTO `social_media` VALUES (1,'Facebook','#','#0061C2','#056ED8','fa fa-facebook',1,'2021-08-08 11:03:02','2021-08-08 11:03:02'),(2,'Youtube','#','#FE031C','#E50017','fa fa-youtube-play',1,'2021-08-08 11:03:02','2021-08-08 11:03:02'),(3,'Twitter','#','#2391FF','#349AFF','fa fa-twitter',1,'2021-08-08 11:03:02','2021-08-08 11:03:02'),(4,'Linkedin','#','#349AFF','#349affd9','fa fa-linkedin',1,'2021-08-08 11:03:02','2021-08-08 11:03:02'),(5,'Skype','#','#4ba3fcd9','#4BA3FC','fa fa-skype',1,'2021-08-08 11:03:02','2021-08-08 11:03:02'),(6,'Pinterest','#','#C2000D','#c2000dd9','fa fa-pinterest-square',1,'2021-08-08 11:03:02','2021-08-08 11:03:02');
/*!40000 ALTER TABLE `social_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sub_category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_categories_slug_unique` (`slug`),
  KEY `sub_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'Bangladesh','politics',1,'en',NULL,NULL,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(2,'CCTV','CCTV',2,'en','CCTV News','CCTV Related News','2021-08-08 11:41:15','2021-08-08 11:41:15'),(3,'Company','company-news',3,'en','This is company News Section','news,company news','2021-08-08 11:43:18','2021-08-08 11:43:18');
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_hit` bigint unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Sports',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(2,'Football',12,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(3,'Cricket',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(4,'Education',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(5,'Business',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(6,'Technology',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(7,'Science',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(8,'Bangladesh',2,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(9,'World Cup',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(10,'Politics',6,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(11,'Computer',2,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(12,'Apple',3,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(13,'Microsoft',3,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(14,'Google',4,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(15,'Travel',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(16,'Virus',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(17,'Culture',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(18,'Culture',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(19,'Health',10,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(20,'Tree',5,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(21,'Environment',8,1,'2021-08-08 11:03:04','2021-08-08 11:03:04'),(22,'Pollution',6,1,'2021-08-08 11:03:04','2021-08-08 11:03:04');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_sections`
--

DROP TABLE IF EXISTS `theme_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` bigint NOT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `category_id` bigint unsigned DEFAULT NULL,
  `ad_id` bigint unsigned DEFAULT NULL,
  `post_amount` bigint unsigned DEFAULT NULL,
  `section_style` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_sections_ad_id_foreign` (`ad_id`),
  KEY `theme_sections_category_id_foreign` (`category_id`),
  CONSTRAINT `theme_sections_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `theme_sections_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_sections`
--

LOCK TABLES `theme_sections` WRITE;
/*!40000 ALTER TABLE `theme_sections` DISABLE KEYS */;
INSERT INTO `theme_sections` VALUES (1,1,0,'Primary Section',1,NULL,NULL,10,'style_1',1,1,NULL,'2021-08-08 11:03:05','2021-08-11 14:11:30'),(2,1,3,'latest_post',6,NULL,NULL,NULL,NULL,0,1,NULL,'2021-08-08 11:03:05','2021-08-08 11:03:05'),(3,1,1,'Product News',1,1,NULL,NULL,'style_1',0,1,'en','2021-08-11 13:57:05','2021-08-11 14:32:04'),(4,1,1,'Event News',1,2,NULL,NULL,'style_2',0,1,'en','2021-08-11 14:10:00','2021-08-11 14:10:00'),(5,1,1,'Corporate News',1,3,NULL,NULL,'style_5',0,1,'en','2021-08-15 09:33:40','2021-08-15 09:33:40'),(6,1,1,'Case Studies',1,4,NULL,NULL,'style_2',0,1,'en','2021-08-15 09:34:39','2021-08-15 09:43:00');
/*!40000 ALTER TABLE `theme_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '2' COMMENT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `themes_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'theme_one',NULL,'{\"header_style\":\"header_1\",\"footer_style\":\"footer_2\",\"primary_color\":\"#20bc70\",\"fonts\":\"Mulish\",\"mode\":\"\"}',1,'2021-08-08 11:03:05','2021-08-15 09:04:03');
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `throttle`
--

DROP TABLE IF EXISTS `throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `throttle`
--

LOCK TABLES `throttle` WRITE;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL COMMENT 'date of birth',
  `gender` tinyint(1) NOT NULL COMMENT '1 male, 2 female, 3 others',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'it will be array data',
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_id` bigint unsigned DEFAULT NULL,
  `newsletter_enable` tinyint(1) NOT NULL DEFAULT '1',
  `is_user_banned` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 banned, 1 unbanned',
  `is_password_set` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 not set, 1 set',
  `user_banned_reason` text COLLATE utf8mb4_unicode_ci,
  `is_subscribe_banned` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 banned, 1 unbanned',
  `subscribe_banned_reason` text COLLATE utf8mb4_unicode_ci,
  `about_us` text COLLATE utf8mb4_unicode_ci,
  `social_media` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'it will be array data',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 inactive user, 1 active user',
  `deactivate_reason` text COLLATE utf8mb4_unicode_ci,
  `firebase_auth_id` int unsigned DEFAULT NULL COMMENT 'this is for mobile app.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_image_id_foreign` (`image_id`),
  CONSTRAINT `users_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ashikali.m@gmail.com','','0000-00-00',0,'$2y$10$NBXXARuuzV/Piynve/8uWu8xRdqB6bKkKOsbo06D.jmzsEaYh05.G','{\"email_show\":0}','2021-08-15 08:08:05','Ashik','Ali',NULL,NULL,0,1,0,NULL,1,NULL,NULL,'',1,NULL,NULL,'2021-08-08 11:03:03','2021-08-15 08:08:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `video_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_thumbnail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_144p` text COLLATE utf8mb4_unicode_ci,
  `v_240p` text COLLATE utf8mb4_unicode_ci,
  `v_360p` text COLLATE utf8mb4_unicode_ci,
  `v_480p` text COLLATE utf8mb4_unicode_ci,
  `v_720p` text COLLATE utf8mb4_unicode_ci,
  `v_1080p` text COLLATE utf8mb4_unicode_ci,
  `video_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'20210811163637_original_29','','local','videos/20210811163637_original_29.mp4',NULL,NULL,NULL,NULL,NULL,NULL,'mp4','2021-08-11 13:36:37','2021-08-11 13:36:37'),(2,'20210811163657_original_23','','local','videos/20210811163657_original_23.mp4',NULL,NULL,NULL,NULL,NULL,NULL,'mp4','2021-08-11 13:36:57','2021-08-11 13:36:57');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_trackers`
--

DROP TABLE IF EXISTS `visitor_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor_trackers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_type` tinyint(1) DEFAULT NULL COMMENT '1, home page, 2 post details, 3 page detail',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_browser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_trackers`
--

LOCK TABLES `visitor_trackers` WRITE;
/*!40000 ALTER TABLE `visitor_trackers` DISABLE KEYS */;
INSERT INTO `visitor_trackers` VALUES (1,1,NULL,'http://localhost','http://localhost/install','::1','Google Chrome',NULL,'2021-08-08 11:03:05','2021-08-08 11:03:05'),(2,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-08 11:03:22','2021-08-08 11:03:22'),(3,1,NULL,'http://localhost','http://localhost/','::1','Google Chrome',NULL,'2021-08-08 11:03:49','2021-08-08 11:03:49'),(4,1,NULL,'http://localhost','http://localhost/login','::1','Google Chrome',NULL,'2021-08-08 11:04:14','2021-08-08 11:04:14'),(5,1,NULL,'http://localhost','http://localhost/login','::1','Google Chrome',NULL,'2021-08-08 11:04:54','2021-08-08 11:04:54'),(6,1,NULL,'http://localhost','http://localhost/','::1','Google Chrome',NULL,'2021-08-08 11:05:09','2021-08-08 11:05:09'),(7,1,NULL,'http://localhost','http://localhost/','::1','Google Chrome',NULL,'2021-08-08 11:05:12','2021-08-08 11:05:12'),(8,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-08 11:09:41','2021-08-08 11:09:41'),(9,1,NULL,'http://localhost:8000','http://localhost/author-social','127.0.0.1','Google Chrome',NULL,'2021-08-08 11:11:55','2021-08-08 11:11:55'),(10,1,NULL,'http://localhost','http://localhost:8000','::1','Google Chrome',NULL,'2021-08-08 11:13:17','2021-08-08 11:13:17'),(11,3,'contact-us','http://localhost/page/contact-us','http://localhost/my-profile','::1','Google Chrome','2021-08-08','2021-08-08 11:13:44','2021-08-08 11:13:44'),(12,3,'contact-us','http://localhost/page/contact-us','http://localhost/submit/news','::1','Google Chrome','2021-08-08','2021-08-08 11:14:58','2021-08-08 11:14:58'),(13,3,'about-us','http://localhost/page/about-us','http://localhost/page/contact-us','::1','Google Chrome','2021-08-08','2021-08-08 11:15:03','2021-08-08 11:15:03'),(14,1,NULL,'http://localhost','http://localhost/page/about-us','::1','Google Chrome',NULL,'2021-08-08 11:15:09','2021-08-08 11:15:09'),(15,1,NULL,'http://localhost','http://localhost/post/edit/video/2','::1','Google Chrome',NULL,'2021-08-08 11:26:12','2021-08-08 11:26:12'),(16,3,'about-us','http://localhost/page/about-us','http://localhost/','::1','Google Chrome','2021-08-08','2021-08-08 11:26:29','2021-08-08 11:26:29'),(17,3,'contact-us','http://localhost/page/contact-us','http://localhost/page/about-us','::1','Google Chrome','2021-08-08','2021-08-08 11:26:32','2021-08-08 11:26:32'),(18,3,'contact-us','http://localhost/page/contact-us','http://localhost/page/contact-us','::1','Google Chrome','2021-08-08','2021-08-08 11:26:58','2021-08-08 11:26:58'),(19,1,NULL,'http://localhost','http://localhost/page/contact-us','::1','Google Chrome',NULL,'2021-08-08 11:27:02','2021-08-08 11:27:02'),(20,2,'sample-article-post','http://localhost/story/sample-article-post','http://localhost/','::1','Google Chrome','2021-08-08','2021-08-08 11:27:20','2021-08-08 11:27:20'),(21,2,'sample-video-post','http://localhost/story/sample-video-post','http://localhost/story/sample-article-post','::1','Google Chrome','2021-08-08','2021-08-08 11:28:21','2021-08-08 11:28:21'),(22,1,NULL,'http://localhost','http://localhost/story/sample-video-post','::1','Google Chrome',NULL,'2021-08-08 11:28:21','2021-08-08 11:28:21'),(23,3,'contact-us','http://localhost/page/contact-us','http://localhost/story/sample-video-post','::1','Google Chrome','2021-08-08','2021-08-08 11:28:55','2021-08-08 11:28:55'),(24,3,'about-us','http://localhost/page/about-us','http://localhost/page/contact-us','::1','Google Chrome','2021-08-08','2021-08-08 11:29:00','2021-08-08 11:29:00'),(25,3,'contact-us','http://localhost/page/contact-us','http://localhost/page/about-us','::1','Google Chrome','2021-08-08','2021-08-08 11:29:17','2021-08-08 11:29:17'),(26,1,NULL,'http://localhost','http://localhost/page/contact-us','::1','Google Chrome',NULL,'2021-08-08 11:29:23','2021-08-08 11:29:23'),(27,1,NULL,'http://localhost','http://localhost','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 11:29:58','2021-08-08 11:29:58'),(28,3,'contact-us','http://localhost/page/contact-us','http://localhost/','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 11:30:37','2021-08-08 11:30:37'),(29,2,'sample-article-post','http://localhost/story/sample-article-post','http://localhost/','::1','Google Chrome','2021-08-08','2021-08-08 11:30:54','2021-08-08 11:30:54'),(30,1,NULL,'http://localhost','http://localhost/page/contact-us','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 11:31:37','2021-08-08 11:31:37'),(31,2,'sample-article-post','http://localhost/story/sample-article-post','http://localhost/','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 11:31:50','2021-08-08 11:31:50'),(32,1,NULL,'http://localhost','http://localhost/story/sample-article-post','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 11:32:20','2021-08-08 11:32:20'),(33,1,NULL,'http://localhost','http://localhost','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 11:36:45','2021-08-08 11:36:45'),(34,3,'contact-us','http://localhost/page/contact-us','http://localhost/','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 11:36:52','2021-08-08 11:36:52'),(35,5,NULL,'http://localhost/category/world','http://localhost/','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 11:39:02','2021-08-08 11:39:02'),(36,2,'sample-video-post','http://localhost/story/sample-video-post','http://localhost/category/world','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 11:39:13','2021-08-08 11:39:13'),(37,1,NULL,'http://localhost','http://localhost/story/sample-video-post','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 11:39:13','2021-08-08 11:39:13'),(38,1,NULL,'http://localhost','http://localhost','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 11:50:48','2021-08-08 11:50:48'),(39,1,NULL,'http://localhost','http://localhost','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 11:51:55','2021-08-08 11:51:55'),(40,2,'Swann-CCTV-systems','http://localhost/story/Swann-CCTV-systems','http://localhost/','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 11:52:53','2021-08-08 11:52:53'),(41,3,'contact-us','http://localhost/page/contact-us','http://localhost/story/Swann-CCTV-systems','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 11:53:14','2021-08-08 11:53:14'),(42,1,NULL,'http://localhost','http://localhost/page/contact-us','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 11:53:22','2021-08-08 11:53:22'),(43,1,NULL,'http://localhost','http://localhost/my-profile','::1','Google Chrome',NULL,'2021-08-08 11:53:52','2021-08-08 11:53:52'),(44,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-08 11:55:13','2021-08-08 11:55:13'),(45,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-08 11:55:16','2021-08-08 11:55:16'),(46,1,NULL,'http://localhost','http://localhost','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 12:33:58','2021-08-08 12:33:58'),(47,2,'Swann-CCTV-systems','http://localhost/story/Swann-CCTV-systems','http://localhost/','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 12:34:16','2021-08-08 12:34:16'),(48,1,NULL,'http://localhost','http://localhost/story/Swann-CCTV-systems','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 12:43:51','2021-08-08 12:43:51'),(49,2,'Swann-CCTV-systems','http://localhost/story/Swann-CCTV-systems','http://localhost/','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 12:45:07','2021-08-08 12:45:07'),(50,8,NULL,'http://localhost/date/2021-08-08','http://localhost/story/Swann-CCTV-systems','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 12:45:18','2021-08-08 12:45:18'),(51,5,NULL,'http://localhost/category/product-news','http://localhost/date/2021-08-08','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 12:45:30','2021-08-08 12:45:30'),(52,2,'Swann-CCTV-systems','http://localhost/story/Swann-CCTV-systems','http://localhost/category/product-news','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 12:45:41','2021-08-08 12:45:41'),(53,2,'Swann-CCTV-systems','http://localhost/story/Swann-CCTV-systems','http://localhost/category/product-news','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 12:49:44','2021-08-08 12:49:44'),(54,1,NULL,'http://localhost','http://localhost/story/Swann-CCTV-systems','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 12:49:55','2021-08-08 12:49:55'),(55,3,'contact-us','http://localhost/page/contact-us','http://localhost/','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 12:50:25','2021-08-08 12:50:25'),(56,3,'about-us','http://localhost/page/about-us','http://localhost/page/contact-us','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 12:50:27','2021-08-08 12:50:27'),(57,1,NULL,'http://localhost','http://localhost/page/about-us','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 12:50:37','2021-08-08 12:50:37'),(58,1,NULL,'http://localhost','http://localhost','127.0.0.1','Mozilla Firefox',NULL,'2021-08-08 12:51:06','2021-08-08 12:51:06'),(59,2,'Swann-CCTV-systems','http://localhost/story/Swann-CCTV-systems','http://localhost/','127.0.0.1','Mozilla Firefox','2021-08-08','2021-08-08 12:51:18','2021-08-08 12:51:18'),(60,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-09 08:12:42','2021-08-09 08:12:42'),(61,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-09 08:25:11','2021-08-09 08:25:11'),(62,1,NULL,'http://localhost','http://localhost/login','::1','Google Chrome',NULL,'2021-08-09 08:25:20','2021-08-09 08:25:20'),(63,1,NULL,'http://localhost','http://localhost/login','::1','Google Chrome',NULL,'2021-08-09 09:49:40','2021-08-09 09:49:40'),(64,1,NULL,'http://localhost','http://localhost/login','::1','Google Chrome',NULL,'2021-08-09 09:50:26','2021-08-09 09:50:26'),(65,1,NULL,'http://localhost','http://localhost/login','::1','Google Chrome',NULL,'2021-08-09 09:51:07','2021-08-09 09:51:07'),(66,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-09 09:51:23','2021-08-09 09:51:23'),(67,3,'about-us','http://localhost/page/about-us','http://localhost/','::1','Google Chrome','2021-08-09','2021-08-09 09:51:34','2021-08-09 09:51:34'),(68,3,'contact-us','http://localhost/page/contact-us','http://localhost/page/about-us','::1','Google Chrome','2021-08-09','2021-08-09 09:51:36','2021-08-09 09:51:36'),(69,1,NULL,'http://localhost','http://localhost/appearance/sections','::1','Google Chrome',NULL,'2021-08-09 10:03:01','2021-08-09 10:03:01'),(70,1,NULL,'http://localhost','http://localhost/appearance/edit/theme/section/2','::1','Google Chrome',NULL,'2021-08-09 10:24:05','2021-08-09 10:24:05'),(71,1,NULL,'http://localhost','http://localhost/login','::1','Google Chrome',NULL,'2021-08-09 13:42:28','2021-08-09 13:42:28'),(72,1,NULL,'http://localhost','http://localhost/appearance/menu-item','::1','Google Chrome',NULL,'2021-08-09 13:46:14','2021-08-09 13:46:14'),(73,1,NULL,'http://localhost','http://localhost/appearance/menu-item','::1','Google Chrome',NULL,'2021-08-09 13:47:11','2021-08-09 13:47:11'),(74,3,'products','http://localhost/page/products','http://localhost/','::1','Google Chrome','2021-08-09','2021-08-09 13:47:19','2021-08-09 13:47:19'),(75,3,'products','http://localhost/page/products','http://localhost/page/products','::1','Google Chrome','2021-08-09','2021-08-09 14:04:25','2021-08-09 14:04:25'),(76,3,'about-us','http://localhost/page/about-us','http://localhost/page/products','::1','Google Chrome','2021-08-09','2021-08-09 14:04:27','2021-08-09 14:04:27'),(77,3,'contact-us','http://localhost/page/contact-us','http://localhost/albums','::1','Google Chrome','2021-08-09','2021-08-09 14:04:31','2021-08-09 14:04:31'),(78,1,NULL,'http://localhost','http://localhost/page/contact-us','::1','Google Chrome',NULL,'2021-08-09 14:04:40','2021-08-09 14:04:40'),(79,3,'products','http://localhost/page/products','http://localhost/','::1','Google Chrome','2021-08-09','2021-08-09 14:05:03','2021-08-09 14:05:03'),(80,3,'contact-us','http://localhost/page/contact-us','http://localhost/page/products','::1','Google Chrome','2021-08-09','2021-08-09 14:05:09','2021-08-09 14:05:09'),(81,1,NULL,'http://localhost','http://localhost/page/contact-us','::1','Google Chrome',NULL,'2021-08-09 14:05:14','2021-08-09 14:05:14'),(82,3,'contact-us','http://localhost/page/contact-us','http://localhost/','::1','Google Chrome','2021-08-09','2021-08-09 14:07:48','2021-08-09 14:07:48'),(83,1,NULL,'http://localhost','http://localhost/page/contact-us','::1','Google Chrome',NULL,'2021-08-09 14:07:49','2021-08-09 14:07:49'),(84,1,NULL,'http://localhost','http://localhost/','::1','Google Chrome',NULL,'2021-08-09 14:07:53','2021-08-09 14:07:53'),(85,3,'contact-us','http://localhost/page/contact-us','http://localhost/','::1','Google Chrome','2021-08-09','2021-08-09 14:07:55','2021-08-09 14:07:55'),(86,1,NULL,'http://localhost','http://localhost/page/contact-us','::1','Google Chrome',NULL,'2021-08-09 14:07:59','2021-08-09 14:07:59'),(87,1,NULL,'http://localhost','http://localhost/page/contact-us','::1','Google Chrome',NULL,'2021-08-09 14:11:11','2021-08-09 14:11:11'),(88,3,'products','http://localhost/page/products','http://localhost/','::1','Google Chrome','2021-08-09','2021-08-09 14:18:31','2021-08-09 14:18:31'),(89,1,NULL,'http://localhost','http://localhost/page/products','::1','Google Chrome',NULL,'2021-08-09 14:19:07','2021-08-09 14:19:07'),(90,3,'products','http://localhost/page/products','http://localhost/','::1','Google Chrome','2021-08-09','2021-08-09 14:19:10','2021-08-09 14:19:10'),(91,3,'products','http://localhost/page/products','http://localhost/','::1','Google Chrome','2021-08-09','2021-08-09 14:19:28','2021-08-09 14:19:28'),(92,3,'products','http://localhost/page/products','http://localhost/page/products','::1','Google Chrome','2021-08-09','2021-08-09 14:25:51','2021-08-09 14:25:51'),(93,1,NULL,'http://localhost','http://localhost/page/products','::1','Google Chrome',NULL,'2021-08-09 14:25:57','2021-08-09 14:25:57'),(94,3,'products','http://localhost/page/products','http://localhost/','::1','Google Chrome','2021-08-09','2021-08-09 14:26:04','2021-08-09 14:26:04'),(95,1,NULL,'http://localhost','http://localhost/page/products','::1','Google Chrome',NULL,'2021-08-09 14:44:52','2021-08-09 14:44:52'),(96,3,'products','http://localhost/page/products','http://localhost/','::1','Google Chrome','2021-08-09','2021-08-09 14:44:56','2021-08-09 14:44:56'),(97,1,NULL,'http://localhost','http://localhost/page/products','::1','Google Chrome',NULL,'2021-08-09 14:44:58','2021-08-09 14:44:58'),(98,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-09 14:46:57','2021-08-09 14:46:57'),(99,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-10 10:02:35','2021-08-10 10:02:35'),(100,3,'contact-us','http://localhost/page/contact-us','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 10:02:49','2021-08-10 10:02:49'),(101,1,NULL,'http://localhost','http://localhost/page/contact-us','::1','Google Chrome',NULL,'2021-08-10 10:24:00','2021-08-10 10:24:00'),(102,1,NULL,'http://localhost','http://localhost/page/contact-us','::1','Google Chrome',NULL,'2021-08-10 10:24:05','2021-08-10 10:24:05'),(103,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-10 11:57:34','2021-08-10 11:57:34'),(104,1,NULL,'http://localhost','http://localhost/login','::1','Google Chrome',NULL,'2021-08-10 12:04:20','2021-08-10 12:04:20'),(105,1,NULL,'http://localhost','http://localhost/','::1','Google Chrome',NULL,'2021-08-10 12:04:26','2021-08-10 12:04:26'),(106,3,'products','http://localhost/page/products','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 12:04:28','2021-08-10 12:04:28'),(107,3,'about-us','http://localhost/page/about-us','http://localhost/page/products','::1','Google Chrome','2021-08-10','2021-08-10 12:04:31','2021-08-10 12:04:31'),(108,3,'contact-us','http://localhost/page/contact-us','http://localhost/album-gallery/nature','::1','Google Chrome','2021-08-10','2021-08-10 12:04:39','2021-08-10 12:04:39'),(109,1,NULL,'http://localhost','http://localhost/album-gallery/nature','::1','Google Chrome',NULL,'2021-08-10 12:32:59','2021-08-10 12:32:59'),(110,3,'products','http://localhost/page/products','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 12:33:02','2021-08-10 12:33:02'),(111,1,NULL,'http://localhost','http://localhost/page/products','::1','Google Chrome',NULL,'2021-08-10 12:33:04','2021-08-10 12:33:04'),(112,1,NULL,'http://localhost','http://localhost/page/products','::1','Google Chrome',NULL,'2021-08-10 12:34:41','2021-08-10 12:34:41'),(113,1,NULL,'http://localhost','http://localhost/page/products','::1','Google Chrome',NULL,'2021-08-10 12:35:41','2021-08-10 12:35:41'),(114,3,'products','http://localhost/page/products','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 12:35:59','2021-08-10 12:35:59'),(115,1,NULL,'http://localhost','http://localhost/page/products','::1','Google Chrome',NULL,'2021-08-10 12:36:02','2021-08-10 12:36:02'),(116,3,'about-us','http://localhost/page/about-us','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 12:36:05','2021-08-10 12:36:05'),(117,1,NULL,'http://localhost','http://localhost/albums','::1','Google Chrome',NULL,'2021-08-10 12:36:27','2021-08-10 12:36:27'),(118,5,NULL,'http://localhost/category/world','http://localhost/','::1','Google Chrome',NULL,'2021-08-10 12:36:41','2021-08-10 12:36:41'),(119,5,NULL,'http://localhost/category/world','http://localhost/','::1','Google Chrome',NULL,'2021-08-10 12:37:13','2021-08-10 12:37:13'),(120,3,'contact-us','http://localhost/page/contact-us','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 12:38:04','2021-08-10 12:38:04'),(121,3,'about-us','http://localhost/page/about-us','http://localhost/page/contact-us','::1','Google Chrome','2021-08-10','2021-08-10 12:38:07','2021-08-10 12:38:07'),(122,1,NULL,'http://localhost','http://localhost/page/about-us','::1','Google Chrome',NULL,'2021-08-10 12:38:10','2021-08-10 12:38:10'),(123,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-10 12:38:14','2021-08-10 12:38:14'),(124,1,NULL,'http://localhost','http://localhost','::1','Google Chrome',NULL,'2021-08-10 12:38:26','2021-08-10 12:38:26'),(125,2,'waving-the-other','http://localhost/story/waving-the-other','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 12:38:32','2021-08-10 12:38:32'),(126,2,'waving-the-other','http://localhost/story/waving-the-other','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 12:43:04','2021-08-10 12:43:04'),(127,1,NULL,'http://localhost','http://localhost/story/waving-the-other','::1','Google Chrome',NULL,'2021-08-10 12:43:35','2021-08-10 12:43:35'),(128,1,NULL,'http://localhost','http://localhost/story/waving-the-other','::1','Google Chrome',NULL,'2021-08-10 12:45:26','2021-08-10 12:45:26'),(129,1,NULL,'http://localhost','http://localhost/story/waving-the-other','::1','Google Chrome',NULL,'2021-08-10 12:45:42','2021-08-10 12:45:42'),(130,1,NULL,'http://localhost','http://localhost/story/waving-the-other','::1','Google Chrome',NULL,'2021-08-10 12:45:45','2021-08-10 12:45:45'),(131,5,NULL,'http://localhost/category/world','http://localhost/','::1','Google Chrome',NULL,'2021-08-10 12:45:48','2021-08-10 12:45:48'),(132,5,NULL,'http://localhost/category/world','http://localhost/','::1','Google Chrome',NULL,'2021-08-10 12:45:52','2021-08-10 12:45:52'),(133,1,NULL,'http://localhost','http://localhost/category/world','::1','Google Chrome',NULL,'2021-08-10 12:46:29','2021-08-10 12:46:29'),(134,1,NULL,'http://localhost','http://localhost/category/world','::1','Google Chrome',NULL,'2021-08-10 12:46:47','2021-08-10 12:46:47'),(135,2,'sample-video-post','http://localhost/story/sample-video-post','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 12:59:31','2021-08-10 12:59:31'),(136,2,'sample-video-post','http://localhost/story/sample-video-post','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 13:00:38','2021-08-10 13:00:38'),(137,1,NULL,'http://localhost','http://localhost/story/sample-video-post','::1','Google Chrome',NULL,'2021-08-10 13:00:48','2021-08-10 13:00:48'),(138,2,'sample-video-post','http://localhost/story/sample-video-post','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 13:00:57','2021-08-10 13:00:57'),(139,1,NULL,'http://localhost','http://localhost','127.0.0.1','Mozilla Firefox',NULL,'2021-08-10 13:22:13','2021-08-10 13:22:13'),(140,1,NULL,'http://localhost','http://localhost/login','127.0.0.1','Mozilla Firefox',NULL,'2021-08-10 13:22:41','2021-08-10 13:22:41'),(141,2,'sample-video-post','http://localhost/story/sample-video-post','http://localhost/','127.0.0.1','Mozilla Firefox','2021-08-10','2021-08-10 13:22:51','2021-08-10 13:22:51'),(142,1,NULL,'http://localhost','http://localhost/story/sample-video-post','::1','Google Chrome',NULL,'2021-08-10 13:33:40','2021-08-10 13:33:40'),(143,2,'waving-the-other','http://localhost/story/waving-the-other','http://localhost/','::1','Google Chrome','2021-08-10','2021-08-10 13:34:24','2021-08-10 13:34:24'),(144,1,NULL,'http://localhost','http://localhost/story/waving-the-other','::1','Google Chrome',NULL,'2021-08-10 13:34:31','2021-08-10 13:34:31'),(145,1,NULL,'http://localhost','http://localhost/gallery/images','::1','Google Chrome',NULL,'2021-08-10 13:50:07','2021-08-10 13:50:07'),(146,1,NULL,'http://localhost:8000','http://localhost/gallery/images','127.0.0.1','Google Chrome',NULL,'2021-08-10 13:50:10','2021-08-10 13:50:10'),(147,1,NULL,'http://localhost','http://localhost/','::1','Google Chrome',NULL,'2021-08-10 14:04:50','2021-08-10 14:04:50'),(148,1,NULL,'http://localhost','http://localhost/','::1','Google Chrome',NULL,'2021-08-10 14:04:59','2021-08-10 14:04:59'),(149,1,NULL,'http://localhost','http://localhost/post/create/article','::1','Google Chrome',NULL,'2021-08-10 14:22:25','2021-08-10 14:22:25'),(150,1,NULL,'http://localhost','http://localhost/post/create/video','::1','Google Chrome',NULL,'2021-08-10 14:31:51','2021-08-10 14:31:51'),(151,1,NULL,'http://localhost','http://localhost/post/create/video','::1','Google Chrome',NULL,'2021-08-10 14:55:25','2021-08-10 14:55:25'),(152,1,NULL,'http://localhost','http://localhost/post/create/video','::1','Google Chrome',NULL,'2021-08-10 15:00:05','2021-08-10 15:00:05'),(153,1,NULL,'http://localhost','http://localhost/dashboard','::1','Google Chrome',NULL,'2021-08-10 15:35:50','2021-08-10 15:35:50'),(154,1,NULL,'http://localhost','http://localhost/dashboard','::1','Google Chrome',NULL,'2021-08-10 15:39:17','2021-08-10 15:39:17'),(155,1,NULL,'http://localhost','http://localhost/post/create/video','::1','Google Chrome',NULL,'2021-08-10 15:42:12','2021-08-10 15:42:12'),(156,1,NULL,'http://localhost:8000','http://localhost/post/create/video','127.0.0.1','Google Chrome',NULL,'2021-08-10 15:45:02','2021-08-10 15:45:02'),(157,1,NULL,'http://localhost','http://localhost:8000/login','::1','Google Chrome',NULL,'2021-08-10 15:46:06','2021-08-10 15:46:06'),(158,1,NULL,'http://localhost:8000','http://localhost/post/create/video','127.0.0.1','Google Chrome',NULL,'2021-08-10 15:47:00','2021-08-10 15:47:00'),(159,1,NULL,'http://localhost/onno','http://localhost/','::1','Google Chrome',NULL,'2021-08-11 09:56:42','2021-08-11 09:56:42'),(160,1,NULL,'http://localhost:81','http://localhost/onno','::1','Google Chrome',NULL,'2021-08-11 09:57:03','2021-08-11 09:57:03'),(161,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-11 10:04:11','2021-08-11 10:04:11'),(162,2,'sample-video-post','http://localhost:81/story/sample-video-post','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 10:04:16','2021-08-11 10:04:16'),(163,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-11 10:06:25','2021-08-11 10:06:25'),(164,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-11 13:11:20','2021-08-11 13:11:20'),(165,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-11 13:11:55','2021-08-11 13:11:55'),(166,1,NULL,'http://localhost:8000','http://localhost:81/post/create/video','127.0.0.1','Google Chrome',NULL,'2021-08-11 13:28:39','2021-08-11 13:28:39'),(167,1,NULL,'http://localhost:81','http://localhost:81/post/create/video','::1','Google Chrome',NULL,'2021-08-11 13:39:14','2021-08-11 13:39:14'),(168,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 13:40:01','2021-08-11 13:40:01'),(169,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 13:43:41','2021-08-11 13:43:41'),(170,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 13:44:58','2021-08-11 13:44:58'),(171,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 13:45:33','2021-08-11 13:45:33'),(172,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 13:46:14','2021-08-11 13:46:14'),(173,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 13:46:15','2021-08-11 13:46:15'),(174,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 13:47:48','2021-08-11 13:47:48'),(175,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 13:47:48','2021-08-11 13:47:48'),(176,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 13:48:32','2021-08-11 13:48:32'),(177,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 13:48:32','2021-08-11 13:48:32'),(178,1,NULL,'http://localhost:81','http://localhost:81/story/flowing-rivers','::1','Google Chrome',NULL,'2021-08-11 13:50:17','2021-08-11 13:50:17'),(179,1,NULL,'http://localhost:81','http://localhost:81/story/flowing-rivers','::1','Google Chrome',NULL,'2021-08-11 13:50:17','2021-08-11 13:50:17'),(180,1,NULL,'http://localhost:81','http://localhost:81/story/flowing-rivers','::1','Google Chrome',NULL,'2021-08-11 13:51:02','2021-08-11 13:51:02'),(181,1,NULL,'http://localhost:81','http://localhost:81/story/flowing-rivers','::1','Google Chrome',NULL,'2021-08-11 13:51:02','2021-08-11 13:51:02'),(182,1,NULL,'http://localhost:81','http://localhost:81/story/flowing-rivers','::1','Google Chrome',NULL,'2021-08-11 13:57:11','2021-08-11 13:57:11'),(183,1,NULL,'http://localhost:81','http://localhost:81/story/flowing-rivers','::1','Google Chrome',NULL,'2021-08-11 13:57:11','2021-08-11 13:57:11'),(184,1,NULL,'http://localhost:81','http://localhost:81/story/flowing-rivers','::1','Google Chrome',NULL,'2021-08-11 14:10:13','2021-08-11 14:10:13'),(185,1,NULL,'http://localhost:81','http://localhost:81/story/flowing-rivers','::1','Google Chrome',NULL,'2021-08-11 14:11:03','2021-08-11 14:11:03'),(186,1,NULL,'http://localhost:81','http://localhost:81/story/flowing-rivers','::1','Google Chrome',NULL,'2021-08-11 14:11:22','2021-08-11 14:11:22'),(187,1,NULL,'http://localhost:81','http://localhost:81/widget/create','::1','Google Chrome',NULL,'2021-08-11 14:18:32','2021-08-11 14:18:32'),(188,1,NULL,'http://localhost:81','http://localhost:81/post/edit/article/1','::1','Google Chrome',NULL,'2021-08-11 14:27:05','2021-08-11 14:27:05'),(189,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-11 14:27:40','2021-08-11 14:27:40'),(190,2,'waving-the-other','http://localhost:81/story/waving-the-other','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 14:27:52','2021-08-11 14:27:52'),(191,1,NULL,'http://localhost:81','http://localhost:81/post/edit/article/5','::1','Google Chrome',NULL,'2021-08-11 14:29:14','2021-08-11 14:29:14'),(192,1,NULL,'http://localhost:81','http://localhost:81/appearance/sections','::1','Google Chrome',NULL,'2021-08-11 14:30:50','2021-08-11 14:30:50'),(193,1,NULL,'http://localhost:81','http://localhost:81/appearance/sections','::1','Google Chrome',NULL,'2021-08-11 14:31:28','2021-08-11 14:31:28'),(194,1,NULL,'http://localhost:81','http://localhost:81/appearance/sections','::1','Google Chrome',NULL,'2021-08-11 14:32:07','2021-08-11 14:32:07'),(195,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-11 14:40:09','2021-08-11 14:40:09'),(196,1,NULL,'http://localhost:81','http://localhost:81/post/create/article','::1','Google Chrome',NULL,'2021-08-11 14:50:02','2021-08-11 14:50:02'),(197,1,NULL,'http://localhost:81','http://localhost:81/post/create/article','::1','Google Chrome',NULL,'2021-08-11 14:52:42','2021-08-11 14:52:42'),(198,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-11 14:53:02','2021-08-11 14:53:02'),(199,1,NULL,'http://localhost:81','http://localhost:81/post/create/article','::1','Google Chrome',NULL,'2021-08-11 15:01:08','2021-08-11 15:01:08'),(200,2,'event-news-1','http://localhost:81/story/event-news-1','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 15:01:35','2021-08-11 15:01:35'),(201,2,'event-news-1','http://localhost:81/story/event-news-1','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 15:01:39','2021-08-11 15:01:39'),(202,1,NULL,'http://localhost:81','http://localhost:81/story/event-news-1','::1','Google Chrome',NULL,'2021-08-11 15:01:45','2021-08-11 15:01:45'),(203,1,NULL,'http://localhost:81','http://localhost:81/post/edit/article/9','::1','Google Chrome',NULL,'2021-08-11 15:02:59','2021-08-11 15:02:59'),(204,2,'event-news-1','http://localhost:81/story/event-news-1','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 15:03:03','2021-08-11 15:03:03'),(205,2,'event-news-1','http://localhost:81/story/event-news-1','http://localhost:81/','::1','Google Chrome','2021-08-11','2021-08-11 15:03:15','2021-08-11 15:03:15'),(206,1,NULL,'http://localhost:81','http://localhost:81/post/create/video','::1','Google Chrome',NULL,'2021-08-11 15:10:57','2021-08-11 15:10:57'),(207,1,NULL,'http://localhost:81','http://localhost:81/post/create/video','::1','Google Chrome',NULL,'2021-08-11 15:13:29','2021-08-11 15:13:29'),(208,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-11 15:13:49','2021-08-11 15:13:49'),(209,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-11 15:14:18','2021-08-11 15:14:18'),(210,1,NULL,'http://localhost:81','http://localhost:81/post/create/video','::1','Google Chrome',NULL,'2021-08-11 15:20:49','2021-08-11 15:20:49'),(211,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-12 09:18:31','2021-08-12 09:18:31'),(212,2,'event-news-checking','http://localhost:81/story/event-news-checking','http://localhost:81/','::1','Google Chrome','2021-08-12','2021-08-12 09:18:55','2021-08-12 09:18:55'),(213,2,'flowing-rivers','http://localhost:81/story/flowing-rivers','http://localhost:81/story/event-news-checking','::1','Google Chrome','2021-08-12','2021-08-12 09:19:14','2021-08-12 09:19:14'),(214,2,'sample-video-post','http://localhost:81/story/sample-video-post','http://localhost:81/story/flowing-rivers','::1','Google Chrome','2021-08-12','2021-08-12 09:20:33','2021-08-12 09:20:33'),(215,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-12 11:28:15','2021-08-12 11:28:15'),(216,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-12 11:28:29','2021-08-12 11:28:29'),(217,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-12 11:30:41','2021-08-12 11:30:41'),(218,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-12 11:33:29','2021-08-12 11:33:29'),(219,1,NULL,'http://localhost:81','http://localhost:81/post/create/article','::1','Google Chrome',NULL,'2021-08-12 14:42:07','2021-08-12 14:42:07'),(220,1,NULL,'http://localhost:81','http://localhost:81/post/create/article','::1','Google Chrome',NULL,'2021-08-12 14:57:09','2021-08-12 14:57:09'),(221,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-12 14:58:16','2021-08-12 14:58:16'),(222,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-12 14:58:58','2021-08-12 14:58:58'),(223,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-12 15:05:00','2021-08-12 15:05:00'),(224,3,'products','http://localhost:81/page/products','http://localhost:81/','::1','Google Chrome','2021-08-12','2021-08-12 15:06:55','2021-08-12 15:06:55'),(225,1,NULL,'http://localhost:81','http://localhost:81/page/products','::1','Google Chrome',NULL,'2021-08-12 15:06:58','2021-08-12 15:06:58'),(226,5,NULL,'http://localhost:81/category/event-news','http://localhost:81','::1','Google Chrome',NULL,'2021-08-12 15:07:52','2021-08-12 15:07:52'),(227,5,NULL,'http://localhost:81/category/event-news','http://localhost:81/category/event-news','::1','Google Chrome',NULL,'2021-08-12 15:08:53','2021-08-12 15:08:53'),(228,1,NULL,'http://localhost:81','http://localhost:81/appearance/menu-item','::1','Google Chrome',NULL,'2021-08-12 15:12:45','2021-08-12 15:12:45'),(229,3,'products','http://localhost:81/page/products','http://localhost:81/','::1','Google Chrome','2021-08-12','2021-08-12 15:12:53','2021-08-12 15:12:53'),(230,3,'about-us','http://localhost:81/page/about-us','http://localhost:81/albums','::1','Google Chrome','2021-08-12','2021-08-12 15:13:47','2021-08-12 15:13:47'),(231,3,'products','http://localhost:81/page/products','http://localhost:81/page/about-us','::1','Google Chrome','2021-08-12','2021-08-12 15:13:54','2021-08-12 15:13:54'),(232,3,'about-us','http://localhost:81/page/about-us','http://localhost:81/albums','::1','Google Chrome','2021-08-12','2021-08-12 15:22:34','2021-08-12 15:22:34'),(233,3,'products','http://localhost:81/page/products','http://localhost:81/page/about-us','::1','Google Chrome','2021-08-12','2021-08-12 15:22:37','2021-08-12 15:22:37'),(234,5,NULL,'http://localhost:81/category/event-news','http://localhost:81/appearance/menu-item','::1','Google Chrome',NULL,'2021-08-12 15:25:23','2021-08-12 15:25:23'),(235,6,NULL,'http://localhost:81/sub-category/CCTV','http://localhost:81/category/event-news','::1','Google Chrome',NULL,'2021-08-12 15:25:27','2021-08-12 15:25:27'),(236,3,'products','http://localhost:81/page/products','http://localhost:81/page/about-us','::1','Google Chrome','2021-08-12','2021-08-12 15:26:29','2021-08-12 15:26:29'),(237,3,'products','http://localhost:81/page/products','http://localhost:81/page/products','::1','Google Chrome','2021-08-12','2021-08-12 15:26:31','2021-08-12 15:26:31'),(238,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-13 20:56:00','2021-08-13 20:56:00'),(239,3,'products','http://localhost:81/page/products','http://localhost:81/','::1','Google Chrome','2021-08-13','2021-08-13 20:56:08','2021-08-13 20:56:08'),(240,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-13 20:56:17','2021-08-13 20:56:17'),(241,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-13 20:59:14','2021-08-13 20:59:14'),(242,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:00:08','2021-08-13 21:00:08'),(243,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-13 21:03:19','2021-08-13 21:03:19'),(244,2,'event-news-6','http://localhost:81/story/event-news-6','http://localhost:81/','::1','Google Chrome','2021-08-14','2021-08-13 21:03:23','2021-08-13 21:03:23'),(245,2,'event-news-6','http://localhost:81/story/event-news-6','http://localhost:81/','::1','Google Chrome','2021-08-14','2021-08-13 21:04:50','2021-08-13 21:04:50'),(246,1,NULL,'http://localhost:81','http://localhost:81/story/event-news-6','::1','Google Chrome',NULL,'2021-08-13 21:04:57','2021-08-13 21:04:57'),(247,1,NULL,'http://localhost:81','http://localhost:81/story/event-news-6','::1','Google Chrome',NULL,'2021-08-13 21:05:22','2021-08-13 21:05:22'),(248,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-13 21:08:00','2021-08-13 21:08:00'),(249,1,NULL,'http://localhost:81','http://localhost:81/appearance/menu-item','::1','Google Chrome',NULL,'2021-08-13 21:08:25','2021-08-13 21:08:25'),(250,1,NULL,'http://localhost:81','http://localhost:81/appearance/menu-item','::1','Google Chrome',NULL,'2021-08-13 21:10:16','2021-08-13 21:10:16'),(251,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:10:19','2021-08-13 21:10:19'),(252,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:15:52','2021-08-13 21:15:52'),(253,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:15:56','2021-08-13 21:15:56'),(254,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:16:19','2021-08-13 21:16:19'),(255,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:16:24','2021-08-13 21:16:24'),(256,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:16:54','2021-08-13 21:16:54'),(257,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:26:47','2021-08-13 21:26:47'),(258,5,NULL,'http://localhost:81/category/world','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:26:51','2021-08-13 21:26:51'),(259,5,NULL,'http://localhost:81/category/world','http://localhost:81/category/world','::1','Google Chrome',NULL,'2021-08-13 21:26:53','2021-08-13 21:26:53'),(260,5,NULL,'http://localhost:81/category/event-news','http://localhost:81/category/world','::1','Google Chrome',NULL,'2021-08-13 21:26:56','2021-08-13 21:26:56'),(261,5,NULL,'http://localhost:81/category/event-news','http://localhost:81/category/world','::1','Google Chrome',NULL,'2021-08-13 21:28:00','2021-08-13 21:28:00'),(262,5,NULL,'http://localhost:81/category/event-news','http://localhost:81/category/world','::1','Google Chrome',NULL,'2021-08-13 21:32:35','2021-08-13 21:32:35'),(263,1,NULL,'http://localhost:81','http://localhost:81/category/event-news','::1','Google Chrome',NULL,'2021-08-13 21:32:39','2021-08-13 21:32:39'),(264,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:32:56','2021-08-13 21:32:56'),(265,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:32:59','2021-08-13 21:32:59'),(266,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:33:02','2021-08-13 21:33:02'),(267,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-13 21:33:05','2021-08-13 21:33:05'),(268,1,NULL,'http://localhost:81','http://localhost:81/appearance/menu-item','::1','Google Chrome',NULL,'2021-08-13 21:36:40','2021-08-13 21:36:40'),(269,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 08:07:15','2021-08-15 08:07:15'),(270,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:08:05','2021-08-15 08:08:05'),(271,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:10:32','2021-08-15 08:10:32'),(272,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:11:14','2021-08-15 08:11:14'),(273,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:25:31','2021-08-15 08:25:31'),(274,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:25:50','2021-08-15 08:25:50'),(275,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:26:16','2021-08-15 08:26:16'),(276,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:26:38','2021-08-15 08:26:38'),(277,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:26:59','2021-08-15 08:26:59'),(278,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:27:59','2021-08-15 08:27:59'),(279,1,NULL,'http://localhost:81','http://localhost:81/ads/edit/2','::1','Google Chrome',NULL,'2021-08-15 08:30:28','2021-08-15 08:30:28'),(280,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:31:01','2021-08-15 08:31:01'),(281,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:32:35','2021-08-15 08:32:35'),(282,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:32:40','2021-08-15 08:32:40'),(283,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:37:56','2021-08-15 08:37:56'),(284,1,NULL,'http://localhost:81','http://localhost:81/login','::1','Google Chrome',NULL,'2021-08-15 08:39:10','2021-08-15 08:39:10'),(285,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 08:42:31','2021-08-15 08:42:31'),(286,1,NULL,'http://localhost:81','http://localhost:81/ads','::1','Google Chrome',NULL,'2021-08-15 08:45:19','2021-08-15 08:45:19'),(287,1,NULL,'http://localhost:81','http://localhost:81/ads/edit/2','::1','Google Chrome',NULL,'2021-08-15 08:47:04','2021-08-15 08:47:04'),(288,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 08:47:08','2021-08-15 08:47:08'),(289,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 08:47:11','2021-08-15 08:47:11'),(290,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 08:48:33','2021-08-15 08:48:33'),(291,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 08:49:05','2021-08-15 08:49:05'),(292,1,NULL,'http://localhost:81','http://localhost:81/ads','::1','Google Chrome',NULL,'2021-08-15 08:50:21','2021-08-15 08:50:21'),(293,1,NULL,'http://localhost:81','http://localhost:81/ads/create','::1','Google Chrome',NULL,'2021-08-15 08:56:28','2021-08-15 08:56:28'),(294,1,NULL,'http://localhost:81','http://localhost:81/widget','::1','Google Chrome',NULL,'2021-08-15 08:57:23','2021-08-15 08:57:23'),(295,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 08:57:27','2021-08-15 08:57:27'),(296,1,NULL,'http://localhost:81','http://localhost:81/admin/page','::1','Google Chrome',NULL,'2021-08-15 08:59:06','2021-08-15 08:59:06'),(297,1,NULL,'http://localhost:81','http://localhost:81/appearance/theme-options','::1','Google Chrome',NULL,'2021-08-15 09:01:49','2021-08-15 09:01:49'),(298,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 09:02:24','2021-08-15 09:02:24'),(299,1,NULL,'http://localhost:81','http://localhost:81/appearance/theme-options','::1','Google Chrome',NULL,'2021-08-15 09:03:29','2021-08-15 09:03:29'),(300,1,NULL,'http://localhost:81','http://localhost:81/appearance/theme-options','::1','Google Chrome',NULL,'2021-08-15 09:03:51','2021-08-15 09:03:51'),(301,1,NULL,'http://localhost:81','http://localhost:81/appearance/theme-options','::1','Google Chrome',NULL,'2021-08-15 09:04:06','2021-08-15 09:04:06'),(302,1,NULL,'http://localhost:81','http://localhost:81/appearance/theme-options','::1','Google Chrome',NULL,'2021-08-15 09:04:40','2021-08-15 09:04:40'),(303,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 09:04:45','2021-08-15 09:04:45'),(304,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:04:50','2021-08-15 09:04:50'),(305,1,NULL,'http://localhost:81','http://localhost:81/widget','::1','Google Chrome',NULL,'2021-08-15 09:07:12','2021-08-15 09:07:12'),(306,1,NULL,'http://localhost:81','http://localhost:81/ads/edit/4','::1','Google Chrome',NULL,'2021-08-15 09:08:24','2021-08-15 09:08:24'),(307,1,NULL,'http://localhost:81','http://localhost:81/widget','::1','Google Chrome',NULL,'2021-08-15 09:08:48','2021-08-15 09:08:48'),(308,1,NULL,'http://localhost:81','http://localhost:81/ads/edit/4','::1','Google Chrome',NULL,'2021-08-15 09:10:36','2021-08-15 09:10:36'),(309,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:11:05','2021-08-15 09:11:05'),(310,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:11:49','2021-08-15 09:11:49'),(311,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:14:37','2021-08-15 09:14:37'),(312,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:19:10','2021-08-15 09:19:10'),(313,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:23:55','2021-08-15 09:23:55'),(314,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:23:58','2021-08-15 09:23:58'),(315,2,'event-news-6','http://localhost:81/story/event-news-6','http://localhost:81/','::1','Google Chrome','2021-08-15','2021-08-15 09:24:06','2021-08-15 09:24:06'),(316,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:24:23','2021-08-15 09:24:23'),(317,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:30:03','2021-08-15 09:30:03'),(318,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:33:47','2021-08-15 09:33:47'),(319,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:34:50','2021-08-15 09:34:50'),(320,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:36:23','2021-08-15 09:36:23'),(321,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:37:21','2021-08-15 09:37:21'),(322,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:38:26','2021-08-15 09:38:26'),(323,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:40:59','2021-08-15 09:40:59'),(324,5,NULL,'http://localhost:81/category/world','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:41:05','2021-08-15 09:41:05'),(325,5,NULL,'http://localhost:81/category/corporate-news','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:41:20','2021-08-15 09:41:20'),(326,5,NULL,'http://localhost:81/category/world','http://localhost:81/category/corporate-news','::1','Google Chrome',NULL,'2021-08-15 09:41:23','2021-08-15 09:41:23'),(327,5,NULL,'http://localhost:81/category/case-studies-news','http://localhost:81/category/world','::1','Google Chrome',NULL,'2021-08-15 09:41:37','2021-08-15 09:41:37'),(328,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 09:43:04','2021-08-15 09:43:04'),(329,1,NULL,'http://localhost:81','http://localhost:81/setting/setting-social-login','::1','Google Chrome',NULL,'2021-08-15 09:47:41','2021-08-15 09:47:41'),(330,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 09:47:53','2021-08-15 09:47:53'),(331,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 06:53:27','2021-08-15 06:53:27'),(332,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 06:55:38','2021-08-15 06:55:38'),(333,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 06:58:31','2021-08-15 06:58:31'),(334,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 06:58:44','2021-08-15 06:58:44'),(335,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 06:58:51','2021-08-15 06:58:51'),(336,1,NULL,'http://localhost:81','http://localhost:81/setting/setting-seo','::1','Google Chrome',NULL,'2021-08-15 07:00:18','2021-08-15 07:00:18'),(337,1,NULL,'http://localhost:81','http://localhost:81/post/breaking','::1','Google Chrome',NULL,'2021-08-15 07:02:16','2021-08-15 07:02:16'),(338,1,NULL,'http://localhost:81','http://localhost:81','::1','Google Chrome',NULL,'2021-08-15 07:05:16','2021-08-15 07:05:16'),(339,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 07:05:26','2021-08-15 07:05:26'),(340,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 07:06:59','2021-08-15 07:06:59'),(341,1,NULL,'http://localhost:81','http://localhost:81/','::1','Google Chrome',NULL,'2021-08-15 07:08:00','2021-08-15 07:08:00'),(342,1,NULL,'http://localhost:81/public','http://localhost:81/public/images/logo.png','::1','Google Chrome',NULL,'2021-08-15 07:09:15','2021-08-15 07:09:15'),(343,1,NULL,'http://localhost:81','http://localhost:81/public/','::1','Google Chrome',NULL,'2021-08-15 07:09:39','2021-08-15 07:09:39');
/*!40000 ALTER TABLE `visitor_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` bigint unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `votes_poll_id_foreign` (`poll_id`),
  KEY `votes_user_id_foreign` (`user_id`),
  CONSTRAINT `votes_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '1',
  `location` int NOT NULL DEFAULT '1',
  `content_type` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_custom` tinyint(1) NOT NULL DEFAULT '1',
  `ad_id` bigint unsigned DEFAULT NULL,
  `poll_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widgets_short_code_unique` (`short_code`),
  KEY `widgets_ad_id_foreign` (`ad_id`),
  KEY `widgets_poll_id_foreign` (`poll_id`),
  CONSTRAINT `widgets_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `widgets_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'Popular Posts','en',NULL,'popular_posts',1,1,1,1,1,NULL,NULL,'2021-08-08 11:03:05','2021-08-08 11:03:05'),(2,'Follow Us','en',NULL,'follow_us',2,1,5,1,1,NULL,NULL,'2021-08-08 11:03:05','2021-08-08 11:03:05'),(3,'Newsletter','en',NULL,'newletter',3,1,4,1,1,NULL,NULL,'2021-08-08 11:03:05','2021-08-08 11:03:05'),(4,'Popular Posts','en',NULL,NULL,1,2,1,1,1,NULL,NULL,'2021-08-08 11:03:05','2021-08-08 11:03:05'),(5,'Newsletter','en',NULL,NULL,3,2,4,1,1,NULL,NULL,'2021-08-08 11:03:05','2021-08-08 11:03:05'),(8,'Advertisement','en','',NULL,5,1,9,1,1,4,NULL,'2021-08-15 08:57:10','2021-08-15 09:08:43'),(9,'Categories','en','',NULL,1,1,11,1,1,NULL,NULL,'2021-08-15 09:40:55','2021-08-15 09:40:55');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-15 10:14:06
