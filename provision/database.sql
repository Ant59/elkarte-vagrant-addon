-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: elkarte
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.12.04.1

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
-- Database: `elkarte`
--
CREATE DATABASE IF NOT EXISTS `elkarte` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `elkarte`;

--
-- Table structure for table `elkarte_antispam_questions`
--

DROP TABLE IF EXISTS `elkarte_antispam_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_antispam_questions` (
  `id_question` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `language` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_question`),
  KEY `language` (`language`(30))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_antispam_questions`
--

LOCK TABLES `elkarte_antispam_questions` WRITE;
/*!40000 ALTER TABLE `elkarte_antispam_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_antispam_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_approval_queue`
--

DROP TABLE IF EXISTS `elkarte_approval_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_approval_queue` (
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_attach` int(10) unsigned NOT NULL DEFAULT '0',
  `id_event` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_approval_queue`
--

LOCK TABLES `elkarte_approval_queue` WRITE;
/*!40000 ALTER TABLE `elkarte_approval_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_approval_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_attachments`
--

DROP TABLE IF EXISTS `elkarte_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_attachments` (
  `id_attach` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_thumb` int(10) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_folder` tinyint(3) NOT NULL DEFAULT '1',
  `attachment_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `file_hash` varchar(40) NOT NULL DEFAULT '',
  `fileext` varchar(8) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `width` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `height` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(20) NOT NULL DEFAULT '',
  `approved` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_attach`),
  UNIQUE KEY `id_member` (`id_member`,`id_attach`),
  KEY `id_msg` (`id_msg`),
  KEY `attachment_type` (`attachment_type`),
  KEY `id_thumb` (`id_thumb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_attachments`
--

LOCK TABLES `elkarte_attachments` WRITE;
/*!40000 ALTER TABLE `elkarte_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_ban_groups`
--

DROP TABLE IF EXISTS `elkarte_ban_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_ban_groups` (
  `id_ban_group` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `ban_time` int(10) unsigned NOT NULL DEFAULT '0',
  `expire_time` int(10) unsigned DEFAULT NULL,
  `cannot_access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cannot_register` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cannot_post` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cannot_login` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reason` varchar(255) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  PRIMARY KEY (`id_ban_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_ban_groups`
--

LOCK TABLES `elkarte_ban_groups` WRITE;
/*!40000 ALTER TABLE `elkarte_ban_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_ban_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_ban_items`
--

DROP TABLE IF EXISTS `elkarte_ban_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_ban_items` (
  `id_ban` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_ban_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_low1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_high1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_low2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_high2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_low3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_high3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_low4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_high4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_low5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_high5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_low6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_high6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_low7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_high7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_low8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_high8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hostname` varchar(255) NOT NULL DEFAULT '',
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ban`),
  KEY `id_ban_group` (`id_ban_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_ban_items`
--

LOCK TABLES `elkarte_ban_items` WRITE;
/*!40000 ALTER TABLE `elkarte_ban_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_ban_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_board_permissions`
--

DROP TABLE IF EXISTS `elkarte_board_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_board_permissions` (
  `id_group` smallint(5) NOT NULL DEFAULT '0',
  `id_profile` smallint(5) unsigned NOT NULL DEFAULT '0',
  `permission` varchar(30) NOT NULL DEFAULT '',
  `add_deny` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_group`,`id_profile`,`permission`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_board_permissions`
--

LOCK TABLES `elkarte_board_permissions` WRITE;
/*!40000 ALTER TABLE `elkarte_board_permissions` DISABLE KEYS */;
INSERT INTO `elkarte_board_permissions` VALUES (-1,1,'poll_view',1),(0,1,'remove_own',1),(0,1,'like_posts',1),(0,1,'lock_own',1),(0,1,'mark_any_notify',1),(0,1,'mark_notify',1),(0,1,'modify_own',1),(0,1,'poll_add_own',1),(0,1,'poll_edit_own',1),(0,1,'poll_lock_own',1),(0,1,'poll_post',1),(0,1,'poll_view',1),(0,1,'poll_vote',1),(0,1,'post_attachment',1),(0,1,'post_new',1),(0,1,'post_draft',1),(0,1,'postby_email',1),(0,1,'post_autosave_draft',1),(0,1,'post_reply_any',1),(0,1,'post_reply_own',1),(0,1,'post_unapproved_topics',1),(0,1,'post_unapproved_replies_any',1),(0,1,'post_unapproved_replies_own',1),(0,1,'post_unapproved_attachments',1),(0,1,'delete_own',1),(0,1,'report_any',1),(0,1,'send_topic',1),(0,1,'view_attachments',1),(2,1,'like_posts',1),(2,1,'moderate_board',1),(2,1,'post_new',1),(2,1,'post_draft',1),(2,1,'post_autosave_draft',1),(2,1,'post_reply_own',1),(2,1,'post_reply_any',1),(2,1,'post_unapproved_topics',1),(2,1,'post_unapproved_replies_any',1),(2,1,'post_unapproved_replies_own',1),(2,1,'post_unapproved_attachments',1),(2,1,'poll_post',1),(2,1,'poll_add_any',1),(2,1,'poll_remove_any',1),(2,1,'poll_view',1),(2,1,'poll_vote',1),(2,1,'poll_lock_any',1),(2,1,'poll_edit_any',1),(2,1,'report_any',1),(2,1,'lock_own',1),(2,1,'send_topic',1),(2,1,'mark_any_notify',1),(2,1,'mark_notify',1),(2,1,'delete_own',1),(2,1,'modify_own',1),(2,1,'make_sticky',1),(2,1,'lock_any',1),(2,1,'remove_any',1),(2,1,'move_any',1),(2,1,'merge_any',1),(2,1,'split_any',1),(2,1,'delete_any',1),(2,1,'modify_any',1),(2,1,'approve_posts',1),(2,1,'post_attachment',1),(2,1,'view_attachments',1),(3,1,'like_posts',1),(3,1,'moderate_board',1),(3,1,'post_new',1),(3,1,'post_draft',1),(3,1,'post_autosave_draft',1),(3,1,'post_reply_own',1),(3,1,'post_reply_any',1),(3,1,'post_unapproved_topics',1),(3,1,'post_unapproved_replies_any',1),(3,1,'post_unapproved_replies_own',1),(3,1,'post_unapproved_attachments',1),(3,1,'poll_post',1),(3,1,'poll_add_any',1),(3,1,'poll_remove_any',1),(3,1,'poll_view',1),(3,1,'poll_vote',1),(3,1,'poll_lock_any',1),(3,1,'poll_edit_any',1),(3,1,'report_any',1),(3,1,'lock_own',1),(3,1,'send_topic',1),(3,1,'mark_any_notify',1),(3,1,'mark_notify',1),(3,1,'delete_own',1),(3,1,'modify_own',1),(3,1,'make_sticky',1),(3,1,'lock_any',1),(3,1,'remove_any',1),(3,1,'move_any',1),(3,1,'merge_any',1),(3,1,'split_any',1),(3,1,'delete_any',1),(3,1,'modify_any',1),(3,1,'approve_posts',1),(3,1,'post_attachment',1),(3,1,'view_attachments',1),(-1,2,'poll_view',1),(0,2,'remove_own',1),(0,2,'like_posts',1),(0,2,'lock_own',1),(0,2,'mark_any_notify',1),(0,2,'mark_notify',1),(0,2,'modify_own',1),(0,2,'poll_view',1),(0,2,'poll_vote',1),(0,2,'post_attachment',1),(0,2,'post_new',1),(0,2,'postby_email',1),(0,2,'post_draft',1),(0,2,'post_autosave_draft',1),(0,2,'post_reply_any',1),(0,2,'post_reply_own',1),(0,2,'post_unapproved_topics',1),(0,2,'post_unapproved_replies_any',1),(0,2,'post_unapproved_replies_own',1),(0,2,'post_unapproved_attachments',1),(0,2,'delete_own',1),(0,2,'report_any',1),(0,2,'send_topic',1),(0,2,'view_attachments',1),(2,2,'like_posts',1),(2,2,'moderate_board',1),(2,2,'post_new',1),(2,2,'post_draft',1),(2,2,'post_autosave_draft',1),(2,2,'post_reply_own',1),(2,2,'post_reply_any',1),(2,2,'post_unapproved_topics',1),(2,2,'post_unapproved_replies_any',1),(2,2,'post_unapproved_replies_own',1),(2,2,'post_unapproved_attachments',1),(2,2,'poll_post',1),(2,2,'poll_add_any',1),(2,2,'poll_remove_any',1),(2,2,'poll_view',1),(2,2,'poll_vote',1),(2,2,'poll_lock_any',1),(2,2,'poll_edit_any',1),(2,2,'report_any',1),(2,2,'lock_own',1),(2,2,'send_topic',1),(2,2,'mark_any_notify',1),(2,2,'mark_notify',1),(2,2,'delete_own',1),(2,2,'modify_own',1),(2,2,'make_sticky',1),(2,2,'lock_any',1),(2,2,'remove_any',1),(2,2,'move_any',1),(2,2,'merge_any',1),(2,2,'split_any',1),(2,2,'delete_any',1),(2,2,'modify_any',1),(2,2,'approve_posts',1),(2,2,'post_attachment',1),(2,2,'view_attachments',1),(3,2,'like_posts',1),(3,2,'moderate_board',1),(3,2,'post_new',1),(3,2,'post_draft',1),(3,2,'post_autosave_draft',1),(3,2,'post_reply_own',1),(3,2,'post_reply_any',1),(3,2,'post_unapproved_topics',1),(3,2,'post_unapproved_replies_any',1),(3,2,'post_unapproved_replies_own',1),(3,2,'post_unapproved_attachments',1),(3,2,'poll_post',1),(3,2,'poll_add_any',1),(3,2,'poll_remove_any',1),(3,2,'poll_view',1),(3,2,'poll_vote',1),(3,2,'poll_lock_any',1),(3,2,'poll_edit_any',1),(3,2,'report_any',1),(3,2,'lock_own',1),(3,2,'send_topic',1),(3,2,'mark_any_notify',1),(3,2,'mark_notify',1),(3,2,'delete_own',1),(3,2,'modify_own',1),(3,2,'make_sticky',1),(3,2,'lock_any',1),(3,2,'remove_any',1),(3,2,'move_any',1),(3,2,'merge_any',1),(3,2,'split_any',1),(3,2,'delete_any',1),(3,2,'modify_any',1),(3,2,'approve_posts',1),(3,2,'post_attachment',1),(3,2,'view_attachments',1),(-1,3,'poll_view',1),(0,3,'remove_own',1),(0,3,'lock_own',1),(0,3,'like_posts',1),(0,3,'mark_any_notify',1),(0,3,'mark_notify',1),(0,3,'modify_own',1),(0,3,'poll_view',1),(0,3,'poll_vote',1),(0,3,'post_attachment',1),(0,3,'post_reply_any',1),(0,3,'post_reply_own',1),(0,3,'post_unapproved_replies_any',1),(0,3,'post_unapproved_replies_own',1),(0,3,'post_unapproved_attachments',1),(0,3,'delete_own',1),(0,3,'report_any',1),(0,3,'send_topic',1),(0,3,'view_attachments',1),(2,3,'like_posts',1),(2,3,'moderate_board',1),(2,3,'post_new',1),(2,3,'post_draft',1),(2,3,'post_autosave_draft',1),(2,3,'post_reply_own',1),(2,3,'post_reply_any',1),(2,3,'post_unapproved_topics',1),(2,3,'post_unapproved_replies_any',1),(2,3,'post_unapproved_replies_own',1),(2,3,'post_unapproved_attachments',1),(2,3,'poll_post',1),(2,3,'poll_add_any',1),(2,3,'poll_remove_any',1),(2,3,'poll_view',1),(2,3,'poll_vote',1),(2,3,'poll_lock_any',1),(2,3,'poll_edit_any',1),(2,3,'report_any',1),(2,3,'lock_own',1),(2,3,'send_topic',1),(2,3,'mark_any_notify',1),(2,3,'mark_notify',1),(2,3,'delete_own',1),(2,3,'modify_own',1),(2,3,'make_sticky',1),(2,3,'lock_any',1),(2,3,'remove_any',1),(2,3,'move_any',1),(2,3,'merge_any',1),(2,3,'split_any',1),(2,3,'delete_any',1),(2,3,'modify_any',1),(2,3,'approve_posts',1),(2,3,'post_attachment',1),(2,3,'view_attachments',1),(3,3,'like_posts',1),(3,3,'moderate_board',1),(3,3,'post_new',1),(3,3,'post_draft',1),(3,3,'post_autosave_draft',1),(3,3,'post_reply_own',1),(3,3,'post_reply_any',1),(3,3,'post_unapproved_topics',1),(3,3,'post_unapproved_replies_any',1),(3,3,'post_unapproved_replies_own',1),(3,3,'post_unapproved_attachments',1),(3,3,'poll_post',1),(3,3,'poll_add_any',1),(3,3,'poll_remove_any',1),(3,3,'poll_view',1),(3,3,'poll_vote',1),(3,3,'poll_lock_any',1),(3,3,'poll_edit_any',1),(3,3,'report_any',1),(3,3,'lock_own',1),(3,3,'send_topic',1),(3,3,'mark_any_notify',1),(3,3,'mark_notify',1),(3,3,'delete_own',1),(3,3,'modify_own',1),(3,3,'make_sticky',1),(3,3,'lock_any',1),(3,3,'remove_any',1),(3,3,'move_any',1),(3,3,'merge_any',1),(3,3,'split_any',1),(3,3,'delete_any',1),(3,3,'modify_any',1),(3,3,'approve_posts',1),(3,3,'post_attachment',1),(3,3,'view_attachments',1),(-1,4,'poll_view',1),(0,4,'mark_any_notify',1),(0,4,'mark_notify',1),(0,4,'poll_view',1),(0,4,'poll_vote',1),(0,4,'report_any',1),(0,4,'send_topic',1),(0,4,'view_attachments',1),(2,4,'like_posts',1),(2,4,'moderate_board',1),(2,4,'post_new',1),(2,4,'post_draft',1),(2,4,'post_autosave_draft',1),(2,4,'post_reply_own',1),(2,4,'post_reply_any',1),(2,4,'post_unapproved_topics',1),(2,4,'post_unapproved_replies_any',1),(2,4,'post_unapproved_replies_own',1),(2,4,'post_unapproved_attachments',1),(2,4,'poll_post',1),(2,4,'poll_add_any',1),(2,4,'poll_remove_any',1),(2,4,'poll_view',1),(2,4,'poll_vote',1),(2,4,'poll_lock_any',1),(2,4,'poll_edit_any',1),(2,4,'report_any',1),(2,4,'lock_own',1),(2,4,'send_topic',1),(2,4,'mark_any_notify',1),(2,4,'mark_notify',1),(2,4,'delete_own',1),(2,4,'modify_own',1),(2,4,'make_sticky',1),(2,4,'lock_any',1),(2,4,'remove_any',1),(2,4,'move_any',1),(2,4,'merge_any',1),(2,4,'split_any',1),(2,4,'delete_any',1),(2,4,'modify_any',1),(2,4,'approve_posts',1),(2,4,'post_attachment',1),(2,4,'view_attachments',1),(3,4,'like_posts',1),(3,4,'moderate_board',1),(3,4,'post_new',1),(3,4,'post_draft',1),(3,4,'post_autosave_draft',1),(3,4,'post_reply_own',1),(3,4,'post_reply_any',1),(3,4,'post_unapproved_topics',1),(3,4,'post_unapproved_replies_any',1),(3,4,'post_unapproved_replies_own',1),(3,4,'post_unapproved_attachments',1),(3,4,'poll_post',1),(3,4,'poll_add_any',1),(3,4,'poll_remove_any',1),(3,4,'poll_view',1),(3,4,'poll_vote',1),(3,4,'poll_lock_any',1),(3,4,'poll_edit_any',1),(3,4,'report_any',1),(3,4,'lock_own',1),(3,4,'send_topic',1),(3,4,'mark_any_notify',1),(3,4,'mark_notify',1),(3,4,'delete_own',1),(3,4,'modify_own',1),(3,4,'make_sticky',1),(3,4,'lock_any',1),(3,4,'remove_any',1),(3,4,'move_any',1),(3,4,'merge_any',1),(3,4,'split_any',1),(3,4,'delete_any',1),(3,4,'modify_any',1),(3,4,'approve_posts',1),(3,4,'post_attachment',1),(3,4,'view_attachments',1);
/*!40000 ALTER TABLE `elkarte_board_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_boards`
--

DROP TABLE IF EXISTS `elkarte_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_boards` (
  `id_board` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_cat` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `child_level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `id_parent` smallint(5) unsigned NOT NULL DEFAULT '0',
  `board_order` smallint(5) NOT NULL DEFAULT '0',
  `id_last_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_msg_updated` int(10) unsigned NOT NULL DEFAULT '0',
  `member_groups` varchar(255) NOT NULL DEFAULT '-1,0',
  `id_profile` smallint(5) unsigned NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `num_topics` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `count_posts` tinyint(4) NOT NULL DEFAULT '0',
  `id_theme` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `override_theme` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `unapproved_posts` smallint(5) NOT NULL DEFAULT '0',
  `unapproved_topics` smallint(5) NOT NULL DEFAULT '0',
  `redirect` varchar(255) NOT NULL DEFAULT '',
  `deny_member_groups` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_board`),
  UNIQUE KEY `categories` (`id_cat`,`id_board`),
  KEY `id_parent` (`id_parent`),
  KEY `id_msg_updated` (`id_msg_updated`),
  KEY `member_groups` (`member_groups`(48))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_boards`
--

LOCK TABLES `elkarte_boards` WRITE;
/*!40000 ALTER TABLE `elkarte_boards` DISABLE KEYS */;
INSERT INTO `elkarte_boards` VALUES (1,1,0,0,1,1,1,'-1,0,2',1,'General Discussion','Feel free to talk about anything and everything in this board.',1,1,0,0,0,0,0,'','');
/*!40000 ALTER TABLE `elkarte_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_calendar`
--

DROP TABLE IF EXISTS `elkarte_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_calendar` (
  `id_event` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL DEFAULT '0001-01-01',
  `end_date` date NOT NULL DEFAULT '0001-01-01',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_event`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `topic` (`id_topic`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_calendar`
--

LOCK TABLES `elkarte_calendar` WRITE;
/*!40000 ALTER TABLE `elkarte_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_calendar_holidays`
--

DROP TABLE IF EXISTS `elkarte_calendar_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_calendar_holidays` (
  `id_holiday` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `event_date` date NOT NULL DEFAULT '0001-01-01',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_holiday`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_calendar_holidays`
--

LOCK TABLES `elkarte_calendar_holidays` WRITE;
/*!40000 ALTER TABLE `elkarte_calendar_holidays` DISABLE KEYS */;
INSERT INTO `elkarte_calendar_holidays` VALUES (1,'0004-01-01','New Year\'s'),(2,'0004-12-25','Christmas'),(3,'0004-02-14','Valentine\'s Day'),(4,'0004-03-17','St. Patrick\'s Day'),(5,'0004-04-01','April Fools'),(6,'0004-04-22','Earth Day'),(7,'0004-10-24','United Nations Day'),(8,'0004-10-31','Halloween'),(9,'2010-05-09','Mother\'s Day'),(10,'2011-05-08','Mother\'s Day'),(11,'2012-05-13','Mother\'s Day'),(12,'2013-05-12','Mother\'s Day'),(13,'2014-05-11','Mother\'s Day'),(14,'2015-05-10','Mother\'s Day'),(15,'2016-05-08','Mother\'s Day'),(16,'2017-05-14','Mother\'s Day'),(17,'2018-05-13','Mother\'s Day'),(18,'2019-05-12','Mother\'s Day'),(19,'2020-05-10','Mother\'s Day'),(20,'2008-06-15','Father\'s Day'),(21,'2009-06-21','Father\'s Day'),(22,'2010-06-20','Father\'s Day'),(23,'2011-06-19','Father\'s Day'),(24,'2012-06-17','Father\'s Day'),(25,'2013-06-16','Father\'s Day'),(26,'2014-06-15','Father\'s Day'),(27,'2015-06-21','Father\'s Day'),(28,'2016-06-19','Father\'s Day'),(29,'2017-06-18','Father\'s Day'),(30,'2018-06-17','Father\'s Day'),(31,'2019-06-16','Father\'s Day'),(32,'2020-06-21','Father\'s Day'),(33,'2010-06-21','Summer Solstice'),(34,'2011-06-21','Summer Solstice'),(35,'2012-06-20','Summer Solstice'),(36,'2013-06-21','Summer Solstice'),(37,'2014-06-21','Summer Solstice'),(38,'2015-06-21','Summer Solstice'),(39,'2016-06-20','Summer Solstice'),(40,'2017-06-20','Summer Solstice'),(41,'2018-06-21','Summer Solstice'),(42,'2019-06-21','Summer Solstice'),(43,'2020-06-20','Summer Solstice'),(44,'2010-03-20','Vernal Equinox'),(45,'2011-03-20','Vernal Equinox'),(46,'2012-03-20','Vernal Equinox'),(47,'2013-03-20','Vernal Equinox'),(48,'2014-03-20','Vernal Equinox'),(49,'2015-03-20','Vernal Equinox'),(50,'2016-03-19','Vernal Equinox'),(51,'2017-03-20','Vernal Equinox'),(52,'2018-03-20','Vernal Equinox'),(53,'2019-03-20','Vernal Equinox'),(54,'2020-03-19','Vernal Equinox'),(55,'2010-12-21','Winter Solstice'),(56,'2011-12-22','Winter Solstice'),(57,'2012-12-21','Winter Solstice'),(58,'2013-12-21','Winter Solstice'),(59,'2014-12-21','Winter Solstice'),(60,'2015-12-21','Winter Solstice'),(61,'2016-12-21','Winter Solstice'),(62,'2017-12-21','Winter Solstice'),(63,'2018-12-21','Winter Solstice'),(64,'2019-12-21','Winter Solstice'),(65,'2020-12-21','Winter Solstice'),(66,'2010-09-22','Autumnal Equinox'),(67,'2011-09-23','Autumnal Equinox'),(68,'2012-09-22','Autumnal Equinox'),(69,'2013-09-22','Autumnal Equinox'),(70,'2014-09-22','Autumnal Equinox'),(71,'2015-09-23','Autumnal Equinox'),(72,'2016-09-22','Autumnal Equinox'),(73,'2017-09-22','Autumnal Equinox'),(74,'2018-09-22','Autumnal Equinox'),(75,'2019-09-23','Autumnal Equinox'),(76,'2020-09-22','Autumnal Equinox'),(77,'0004-07-04','Independence Day'),(78,'0004-05-05','Cinco de Mayo'),(79,'0004-06-14','Flag Day'),(80,'0004-11-11','Veterans Day'),(81,'0004-02-02','Groundhog Day'),(82,'2010-11-25','Thanksgiving'),(83,'2011-11-24','Thanksgiving'),(84,'2012-11-22','Thanksgiving'),(85,'2013-11-28','Thanksgiving'),(86,'2014-11-27','Thanksgiving'),(87,'2015-11-26','Thanksgiving'),(88,'2016-11-24','Thanksgiving'),(89,'2017-11-23','Thanksgiving'),(90,'2018-11-22','Thanksgiving'),(91,'2019-11-28','Thanksgiving'),(92,'2020-11-26','Thanksgiving'),(93,'2010-05-31','Memorial Day'),(94,'2011-05-30','Memorial Day'),(95,'2012-05-28','Memorial Day'),(96,'2013-05-27','Memorial Day'),(97,'2014-05-26','Memorial Day'),(98,'2015-05-25','Memorial Day'),(99,'2016-05-30','Memorial Day'),(100,'2017-05-29','Memorial Day'),(101,'2018-05-28','Memorial Day'),(102,'2019-05-27','Memorial Day'),(103,'2020-05-25','Memorial Day'),(104,'2010-09-06','Labor Day'),(105,'2011-09-05','Labor Day'),(106,'2012-09-03','Labor Day'),(107,'2013-09-02','Labor Day'),(108,'2014-09-01','Labor Day'),(109,'2015-09-07','Labor Day'),(110,'2016-09-05','Labor Day'),(111,'2017-09-04','Labor Day'),(112,'2018-09-03','Labor Day'),(113,'2019-09-02','Labor Day'),(114,'2020-09-07','Labor Day'),(115,'0004-06-06','D-Day');
/*!40000 ALTER TABLE `elkarte_calendar_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_categories`
--

DROP TABLE IF EXISTS `elkarte_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_categories` (
  `id_cat` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `cat_order` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `can_collapse` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_cat`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_categories`
--

LOCK TABLES `elkarte_categories` WRITE;
/*!40000 ALTER TABLE `elkarte_categories` DISABLE KEYS */;
INSERT INTO `elkarte_categories` VALUES (1,0,'General Category',1);
/*!40000 ALTER TABLE `elkarte_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_collapsed_categories`
--

DROP TABLE IF EXISTS `elkarte_collapsed_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_collapsed_categories` (
  `id_cat` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cat`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_collapsed_categories`
--

LOCK TABLES `elkarte_collapsed_categories` WRITE;
/*!40000 ALTER TABLE `elkarte_collapsed_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_collapsed_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_custom_fields`
--

DROP TABLE IF EXISTS `elkarte_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_custom_fields` (
  `id_field` smallint(5) NOT NULL AUTO_INCREMENT,
  `col_name` varchar(12) NOT NULL DEFAULT '',
  `field_name` varchar(40) NOT NULL DEFAULT '',
  `field_desc` varchar(255) NOT NULL DEFAULT '',
  `field_type` varchar(8) NOT NULL DEFAULT 'text',
  `field_length` smallint(5) NOT NULL DEFAULT '255',
  `field_options` text NOT NULL,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `show_reg` tinyint(3) NOT NULL DEFAULT '0',
  `show_display` tinyint(3) NOT NULL DEFAULT '0',
  `show_memberlist` tinyint(3) NOT NULL DEFAULT '0',
  `show_profile` varchar(20) NOT NULL DEFAULT 'forumprofile',
  `private` tinyint(3) NOT NULL DEFAULT '0',
  `active` tinyint(3) NOT NULL DEFAULT '1',
  `bbc` tinyint(3) NOT NULL DEFAULT '0',
  `can_search` tinyint(3) NOT NULL DEFAULT '0',
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `enclose` text NOT NULL,
  `placement` tinyint(3) NOT NULL DEFAULT '0',
  `vieworder` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`),
  UNIQUE KEY `col_name` (`col_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_custom_fields`
--

LOCK TABLES `elkarte_custom_fields` WRITE;
/*!40000 ALTER TABLE `elkarte_custom_fields` DISABLE KEYS */;
INSERT INTO `elkarte_custom_fields` VALUES (1,'cust_aim','AOL Instant Messenger','This is your AOL Instant Messenger nickname.','text',50,'','regex~[a-z][0-9a-z.-]{1,31}~i',0,1,0,'forumprofile',0,1,0,0,'','<a class=\"aim\" href=\"aim:goim?screenname={INPUT}&message=Hello!+Are+you+there?\" target=\"_blank\" title=\"AIM - {INPUT}\"><img src=\"{IMAGES_URL}/profile/aim.png\" alt=\"AIM - {INPUT}\"></a>',1,0),(2,'cust_icq','ICQ','This is your ICQ number.','text',12,'','regex~[1-9][0-9]{4,9}~i',0,1,0,'forumprofile',0,1,0,0,'','<a class=\"icq\" href=\"http://www.icq.com/whitepages/about_me.php?uin={INPUT}\" target=\"_blank\" title=\"ICQ - {INPUT}\"><img src=\"http://status.icq.com/online.gif?img=5&icq={INPUT}\" alt=\"ICQ - {INPUT}\" width=\"18\" height=\"18\"></a>',1,0),(3,'cust_skye','Skype','This is your Skype account name','text',32,'','regex~[a-z][0-9a-z.-]{1,31}~i',0,1,0,'forumprofile',0,1,0,0,'','<a href=\"skype:{INPUT}?call\"><img src=\"http://mystatus.skype.com/smallicon/{INPUT}\" alt=\"Skype - {INPUT}\" title=\"Skype - {INPUT}\" /></a>',1,0),(4,'cust_fbook','Facebook Profile','Enter your Facebook username.','text',50,'','regex~[a-z][0-9a-z.-]{1,31}~i',0,1,0,'forumprofile',0,1,0,0,'','<a target=\"_blank\" href=\"https://www.facebook.com/{INPUT}\"><img src=\"{DEFAULT_IMAGES_URL}/profile/facebook.png\" alt=\"{INPUT}\" /></a>',1,0),(5,'cust_twitt','Twitter Profile','Enter your Twitter username.','text',50,'','regex~[a-z][0-9a-z.-]{1,31}~i',0,1,0,'forumprofile',0,1,0,0,'','<a target=\"_blank\" href=\"https://www.twitter.com/{INPUT}\"><img src=\"{DEFAULT_IMAGES_URL}/profile/twitter.png\" alt=\"{INPUT}\" /></a>',1,0),(6,'cust_linked','LinkedIn Profile','Set your LinkedIn Public profile link. You must set a Custom public url for this to work.','text',255,'','nohtml',0,1,0,'forumprofile',0,1,0,0,'','<a target={INPUT}\"><img src=\"{DEFAULT_IMAGES_URL}/profile/linkedin.png\" alt=\"LinkedIn profile\" /></a>',1,0),(7,'cust_gplus','Google+ Profile','This is your Google+ profile url.','text',255,'','nohtml',0,1,0,'forumprofile',0,1,0,0,'','<a target=\"_blank\" href=\"{INPUT}\"><img src=\"{DEFAULT_IMAGES_URL}/profile/gplus.png\" alt=\"G+ profile\" /></a>',1,0),(8,'cust_yim','Yahoo! Messenger','This is your Yahoo! Instant Messenger nickname.','text',50,'','email',0,1,0,'forumprofile',0,1,0,0,'','<a class=\"yim\" href=\"http://edit.yahoo.com/config/send_webmesg?.target={INPUT}\" target=\"_blank\" title=\"Yahoo! Messenger - {INPUT}\"><img src=\"http://opi.yahoo.com/online?m=g&t=0&u={INPUT}\" alt=\"Yahoo! Messenger - {INPUT}\"></a>',1,0);
/*!40000 ALTER TABLE `elkarte_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_custom_fields_data`
--

DROP TABLE IF EXISTS `elkarte_custom_fields_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_custom_fields_data` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `variable` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id_member`,`variable`(30)),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_custom_fields_data`
--

LOCK TABLES `elkarte_custom_fields_data` WRITE;
/*!40000 ALTER TABLE `elkarte_custom_fields_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_custom_fields_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_follow_ups`
--

DROP TABLE IF EXISTS `elkarte_follow_ups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_follow_ups` (
  `follow_up` int(10) unsigned NOT NULL DEFAULT '0',
  `derived_from` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`follow_up`,`derived_from`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_follow_ups`
--

LOCK TABLES `elkarte_follow_ups` WRITE;
/*!40000 ALTER TABLE `elkarte_follow_ups` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_follow_ups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_group_moderators`
--

DROP TABLE IF EXISTS `elkarte_group_moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_group_moderators` (
  `id_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_group`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_group_moderators`
--

LOCK TABLES `elkarte_group_moderators` WRITE;
/*!40000 ALTER TABLE `elkarte_group_moderators` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_group_moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_actions`
--

DROP TABLE IF EXISTS `elkarte_log_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_actions` (
  `id_action` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_log` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(16) NOT NULL DEFAULT '',
  `action` varchar(30) NOT NULL DEFAULT '',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `extra` text NOT NULL,
  PRIMARY KEY (`id_action`),
  KEY `id_log` (`id_log`),
  KEY `log_time` (`log_time`),
  KEY `id_member` (`id_member`),
  KEY `id_board` (`id_board`),
  KEY `id_msg` (`id_msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_actions`
--

LOCK TABLES `elkarte_log_actions` WRITE;
/*!40000 ALTER TABLE `elkarte_log_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_activity`
--

DROP TABLE IF EXISTS `elkarte_log_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_activity` (
  `date` date NOT NULL DEFAULT '0001-01-01',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topics` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posts` smallint(5) unsigned NOT NULL DEFAULT '0',
  `registers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `most_on` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pm` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`),
  KEY `most_on` (`most_on`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_activity`
--

LOCK TABLES `elkarte_log_activity` WRITE;
/*!40000 ALTER TABLE `elkarte_log_activity` DISABLE KEYS */;
INSERT INTO `elkarte_log_activity` VALUES ('2015-07-12',0,1,1,1,2,0,0);
/*!40000 ALTER TABLE `elkarte_log_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_badbehavior`
--

DROP TABLE IF EXISTS `elkarte_log_badbehavior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_badbehavior` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` char(19) NOT NULL,
  `date` int(10) NOT NULL DEFAULT '0',
  `request_method` varchar(255) NOT NULL,
  `request_uri` varchar(255) NOT NULL,
  `server_protocol` varchar(255) NOT NULL,
  `http_headers` text NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `request_entity` varchar(255) NOT NULL,
  `valid` varchar(255) NOT NULL,
  `id_member` mediumint(8) unsigned NOT NULL,
  `session` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_badbehavior`
--

LOCK TABLES `elkarte_log_badbehavior` WRITE;
/*!40000 ALTER TABLE `elkarte_log_badbehavior` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_badbehavior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_banned`
--

DROP TABLE IF EXISTS `elkarte_log_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_banned` (
  `id_ban_log` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(16) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_ban_log`),
  KEY `log_time` (`log_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_banned`
--

LOCK TABLES `elkarte_log_banned` WRITE;
/*!40000 ALTER TABLE `elkarte_log_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_boards`
--

DROP TABLE IF EXISTS `elkarte_log_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_boards` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_member`,`id_board`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_boards`
--

LOCK TABLES `elkarte_log_boards` WRITE;
/*!40000 ALTER TABLE `elkarte_log_boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_comments`
--

DROP TABLE IF EXISTS `elkarte_log_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_comments` (
  `id_comment` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_name` varchar(80) NOT NULL DEFAULT '',
  `comment_type` varchar(8) NOT NULL DEFAULT 'warning',
  `id_recipient` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `recipient_name` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(10) NOT NULL DEFAULT '0',
  `id_notice` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `counter` tinyint(3) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `id_recipient` (`id_recipient`),
  KEY `log_time` (`log_time`),
  KEY `comment_type` (`comment_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_comments`
--

LOCK TABLES `elkarte_log_comments` WRITE;
/*!40000 ALTER TABLE `elkarte_log_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_digest`
--

DROP TABLE IF EXISTS `elkarte_log_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_digest` (
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `note_type` varchar(10) NOT NULL DEFAULT 'post',
  `daily` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `exclude` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_digest`
--

LOCK TABLES `elkarte_log_digest` WRITE;
/*!40000 ALTER TABLE `elkarte_log_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_digest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_errors`
--

DROP TABLE IF EXISTS `elkarte_log_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_errors` (
  `id_error` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(16) NOT NULL DEFAULT '',
  `url` text NOT NULL,
  `message` text NOT NULL,
  `session` char(64) NOT NULL DEFAULT '',
  `error_type` char(15) NOT NULL DEFAULT 'general',
  `file` varchar(255) NOT NULL DEFAULT '',
  `line` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_error`),
  KEY `log_time` (`log_time`),
  KEY `id_member` (`id_member`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_errors`
--

LOCK TABLES `elkarte_log_errors` WRITE;
/*!40000 ALTER TABLE `elkarte_log_errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_errors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_floodcontrol`
--

DROP TABLE IF EXISTS `elkarte_log_floodcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_floodcontrol` (
  `ip` char(16) NOT NULL DEFAULT '',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `log_type` varchar(10) NOT NULL DEFAULT 'post',
  PRIMARY KEY (`ip`,`log_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_floodcontrol`
--

LOCK TABLES `elkarte_log_floodcontrol` WRITE;
/*!40000 ALTER TABLE `elkarte_log_floodcontrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_floodcontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_group_requests`
--

DROP TABLE IF EXISTS `elkarte_log_group_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_group_requests` (
  `id_request` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `time_applied` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  PRIMARY KEY (`id_request`),
  UNIQUE KEY `id_member` (`id_member`,`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_group_requests`
--

LOCK TABLES `elkarte_log_group_requests` WRITE;
/*!40000 ALTER TABLE `elkarte_log_group_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_group_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_karma`
--

DROP TABLE IF EXISTS `elkarte_log_karma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_karma` (
  `id_target` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_executor` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_target`,`id_executor`),
  KEY `log_time` (`log_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_karma`
--

LOCK TABLES `elkarte_log_karma` WRITE;
/*!40000 ALTER TABLE `elkarte_log_karma` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_likes`
--

DROP TABLE IF EXISTS `elkarte_log_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_likes` (
  `action` char(1) NOT NULL DEFAULT '0',
  `id_target` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_target`,`id_member`),
  KEY `log_time` (`log_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_likes`
--

LOCK TABLES `elkarte_log_likes` WRITE;
/*!40000 ALTER TABLE `elkarte_log_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_mark_read`
--

DROP TABLE IF EXISTS `elkarte_log_mark_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_mark_read` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_member`,`id_board`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_mark_read`
--

LOCK TABLES `elkarte_log_mark_read` WRITE;
/*!40000 ALTER TABLE `elkarte_log_mark_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_mark_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_member_notices`
--

DROP TABLE IF EXISTS `elkarte_log_member_notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_member_notices` (
  `id_notice` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  PRIMARY KEY (`id_notice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_member_notices`
--

LOCK TABLES `elkarte_log_member_notices` WRITE;
/*!40000 ALTER TABLE `elkarte_log_member_notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_member_notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_mentions`
--

DROP TABLE IF EXISTS `elkarte_log_mentions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_mentions` (
  `id_mention` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_target` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_accessible` tinyint(1) NOT NULL DEFAULT '0',
  `id_member_from` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `mention_type` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_mention`),
  KEY `id_member_status` (`id_member`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_mentions`
--

LOCK TABLES `elkarte_log_mentions` WRITE;
/*!40000 ALTER TABLE `elkarte_log_mentions` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_mentions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_notify`
--

DROP TABLE IF EXISTS `elkarte_log_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_notify` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_member`,`id_topic`,`id_board`),
  KEY `id_topic` (`id_topic`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_notify`
--

LOCK TABLES `elkarte_log_notify` WRITE;
/*!40000 ALTER TABLE `elkarte_log_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_online`
--

DROP TABLE IF EXISTS `elkarte_log_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_online` (
  `session` varchar(64) NOT NULL DEFAULT '',
  `log_time` int(10) NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_spider` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `url` text NOT NULL,
  PRIMARY KEY (`session`),
  KEY `log_time` (`log_time`),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_online`
--

LOCK TABLES `elkarte_log_online` WRITE;
/*!40000 ALTER TABLE `elkarte_log_online` DISABLE KEYS */;
INSERT INTO `elkarte_log_online` VALUES ('c0hr1ptvvfleg248s2us66qf87',1436706271,1,0,167772674,'a:1:{s:10:\"USER_AGENT\";s:68:\"Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0\";}'),('ip10.0.2.2',1436706481,0,0,167772674,'a:1:{s:10:\"USER_AGENT\";s:68:\"Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0\";}');
/*!40000 ALTER TABLE `elkarte_log_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_packages`
--

DROP TABLE IF EXISTS `elkarte_log_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_packages` (
  `id_install` int(10) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `package_id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `id_member_installed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_installed` varchar(255) NOT NULL DEFAULT '',
  `time_installed` int(10) NOT NULL DEFAULT '0',
  `id_member_removed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `member_removed` varchar(255) NOT NULL DEFAULT '',
  `time_removed` int(10) NOT NULL DEFAULT '0',
  `install_state` tinyint(3) NOT NULL DEFAULT '1',
  `failed_steps` text NOT NULL,
  `themes_installed` varchar(255) NOT NULL DEFAULT '',
  `db_changes` text NOT NULL,
  `credits` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_install`),
  KEY `filename` (`filename`(15))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_packages`
--

LOCK TABLES `elkarte_log_packages` WRITE;
/*!40000 ALTER TABLE `elkarte_log_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_polls`
--

DROP TABLE IF EXISTS `elkarte_log_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_polls` (
  `id_poll` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_choice` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id_poll` (`id_poll`,`id_member`,`id_choice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_polls`
--

LOCK TABLES `elkarte_log_polls` WRITE;
/*!40000 ALTER TABLE `elkarte_log_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_reported`
--

DROP TABLE IF EXISTS `elkarte_log_reported`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_reported` (
  `id_report` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `membername` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` mediumtext NOT NULL,
  `time_started` int(10) NOT NULL DEFAULT '0',
  `time_updated` int(10) NOT NULL DEFAULT '0',
  `num_reports` mediumint(6) NOT NULL DEFAULT '0',
  `closed` tinyint(3) NOT NULL DEFAULT '0',
  `ignore_all` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_report`),
  KEY `id_member` (`id_member`),
  KEY `id_topic` (`id_topic`),
  KEY `closed` (`closed`),
  KEY `time_started` (`time_started`),
  KEY `id_msg` (`id_msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_reported`
--

LOCK TABLES `elkarte_log_reported` WRITE;
/*!40000 ALTER TABLE `elkarte_log_reported` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_reported` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_reported_comments`
--

DROP TABLE IF EXISTS `elkarte_log_reported_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_reported_comments` (
  `id_comment` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_report` mediumint(8) NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `membername` varchar(255) NOT NULL DEFAULT '',
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `member_ip` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `time_sent` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_comment`),
  KEY `id_report` (`id_report`),
  KEY `id_member` (`id_member`),
  KEY `time_sent` (`time_sent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_reported_comments`
--

LOCK TABLES `elkarte_log_reported_comments` WRITE;
/*!40000 ALTER TABLE `elkarte_log_reported_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_reported_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_scheduled_tasks`
--

DROP TABLE IF EXISTS `elkarte_log_scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_scheduled_tasks` (
  `id_log` mediumint(8) NOT NULL AUTO_INCREMENT,
  `id_task` smallint(5) NOT NULL DEFAULT '0',
  `time_run` int(10) NOT NULL DEFAULT '0',
  `time_taken` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_log`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_scheduled_tasks`
--

LOCK TABLES `elkarte_log_scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `elkarte_log_scheduled_tasks` DISABLE KEYS */;
INSERT INTO `elkarte_log_scheduled_tasks` VALUES (1,2,1436706273,0.124),(2,3,1436706482,0.011),(3,4,1436706487,0.023);
/*!40000 ALTER TABLE `elkarte_log_scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_search_messages`
--

DROP TABLE IF EXISTS `elkarte_log_search_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_search_messages` (
  `id_search` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_search`,`id_msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_search_messages`
--

LOCK TABLES `elkarte_log_search_messages` WRITE;
/*!40000 ALTER TABLE `elkarte_log_search_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_search_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_search_results`
--

DROP TABLE IF EXISTS `elkarte_log_search_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_search_results` (
  `id_search` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `relevance` smallint(5) unsigned NOT NULL DEFAULT '0',
  `num_matches` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_search`,`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_search_results`
--

LOCK TABLES `elkarte_log_search_results` WRITE;
/*!40000 ALTER TABLE `elkarte_log_search_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_search_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_search_subjects`
--

DROP TABLE IF EXISTS `elkarte_log_search_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_search_subjects` (
  `word` varchar(20) NOT NULL DEFAULT '',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word`,`id_topic`),
  KEY `id_topic` (`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_search_subjects`
--

LOCK TABLES `elkarte_log_search_subjects` WRITE;
/*!40000 ALTER TABLE `elkarte_log_search_subjects` DISABLE KEYS */;
INSERT INTO `elkarte_log_search_subjects` VALUES ('elkarte',1),('to',1),('welcome',1);
/*!40000 ALTER TABLE `elkarte_log_search_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_search_topics`
--

DROP TABLE IF EXISTS `elkarte_log_search_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_search_topics` (
  `id_search` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_search`,`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_search_topics`
--

LOCK TABLES `elkarte_log_search_topics` WRITE;
/*!40000 ALTER TABLE `elkarte_log_search_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_search_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_spider_hits`
--

DROP TABLE IF EXISTS `elkarte_log_spider_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_spider_hits` (
  `id_hit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_spider` smallint(5) unsigned NOT NULL DEFAULT '0',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `processed` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_hit`),
  KEY `id_spider` (`id_spider`),
  KEY `log_time` (`log_time`),
  KEY `processed` (`processed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_spider_hits`
--

LOCK TABLES `elkarte_log_spider_hits` WRITE;
/*!40000 ALTER TABLE `elkarte_log_spider_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_spider_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_spider_stats`
--

DROP TABLE IF EXISTS `elkarte_log_spider_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_spider_stats` (
  `id_spider` smallint(5) unsigned NOT NULL DEFAULT '0',
  `page_hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `last_seen` int(10) unsigned NOT NULL DEFAULT '0',
  `stat_date` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`stat_date`,`id_spider`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_spider_stats`
--

LOCK TABLES `elkarte_log_spider_stats` WRITE;
/*!40000 ALTER TABLE `elkarte_log_spider_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_spider_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_subscribed`
--

DROP TABLE IF EXISTS `elkarte_log_subscribed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_subscribed` (
  `id_sublog` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_subscribe` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_member` int(10) NOT NULL DEFAULT '0',
  `old_id_group` smallint(5) NOT NULL DEFAULT '0',
  `start_time` int(10) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `payments_pending` tinyint(3) NOT NULL DEFAULT '0',
  `pending_details` text NOT NULL,
  `reminder_sent` tinyint(3) NOT NULL DEFAULT '0',
  `vendor_ref` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_sublog`),
  UNIQUE KEY `id_subscribe` (`id_subscribe`,`id_member`),
  KEY `end_time` (`end_time`),
  KEY `reminder_sent` (`reminder_sent`),
  KEY `payments_pending` (`payments_pending`),
  KEY `status` (`status`),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_subscribed`
--

LOCK TABLES `elkarte_log_subscribed` WRITE;
/*!40000 ALTER TABLE `elkarte_log_subscribed` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_subscribed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_log_topics`
--

DROP TABLE IF EXISTS `elkarte_log_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_log_topics` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `unwatched` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_member`,`id_topic`),
  KEY `id_topic` (`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_log_topics`
--

LOCK TABLES `elkarte_log_topics` WRITE;
/*!40000 ALTER TABLE `elkarte_log_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_log_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_mail_queue`
--

DROP TABLE IF EXISTS `elkarte_mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_mail_queue` (
  `id_mail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_sent` int(10) NOT NULL DEFAULT '0',
  `recipient` varchar(255) NOT NULL DEFAULT '',
  `body` mediumtext NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `headers` text NOT NULL,
  `send_html` tinyint(3) NOT NULL DEFAULT '0',
  `priority` tinyint(3) NOT NULL DEFAULT '1',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `message_id` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_mail`),
  KEY `time_sent` (`time_sent`),
  KEY `mail_priority` (`priority`,`id_mail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_mail_queue`
--

LOCK TABLES `elkarte_mail_queue` WRITE;
/*!40000 ALTER TABLE `elkarte_mail_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_mail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_member_logins`
--

DROP TABLE IF EXISTS `elkarte_member_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_member_logins` (
  `id_login` int(10) NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  `ip` varchar(255) NOT NULL DEFAULT '0',
  `ip2` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_login`),
  KEY `id_member` (`id_member`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_member_logins`
--

LOCK TABLES `elkarte_member_logins` WRITE;
/*!40000 ALTER TABLE `elkarte_member_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_member_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_membergroups`
--

DROP TABLE IF EXISTS `elkarte_membergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_membergroups` (
  `id_group` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(80) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `online_color` varchar(20) NOT NULL DEFAULT '',
  `min_posts` mediumint(9) NOT NULL DEFAULT '-1',
  `max_messages` smallint(5) unsigned NOT NULL DEFAULT '0',
  `icons` varchar(255) NOT NULL DEFAULT '',
  `group_type` tinyint(3) NOT NULL DEFAULT '0',
  `hidden` tinyint(3) NOT NULL DEFAULT '0',
  `id_parent` smallint(5) NOT NULL DEFAULT '-2',
  PRIMARY KEY (`id_group`),
  KEY `min_posts` (`min_posts`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_membergroups`
--

LOCK TABLES `elkarte_membergroups` WRITE;
/*!40000 ALTER TABLE `elkarte_membergroups` DISABLE KEYS */;
INSERT INTO `elkarte_membergroups` VALUES (1,'Administrator','','#CD0000',-1,0,'5#iconadmin.png',1,0,-2),(2,'Global Moderator','','#0066FF',-1,0,'5#icongmod.png',0,0,-2),(3,'Moderator','','',-1,0,'5#iconmod.png',0,0,-2),(4,'Newbie','','',0,0,'1#icon.png',0,0,-2),(5,'Jr. Member','','',50,0,'2#icon.png',0,0,-2),(6,'Full Member','','',100,0,'3#icon.png',0,0,-2),(7,'Sr. Member','','',250,0,'4#icon.png',0,0,-2),(8,'Hero Member','','',500,0,'5#icon.png',0,0,-2);
/*!40000 ALTER TABLE `elkarte_membergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_members`
--

DROP TABLE IF EXISTS `elkarte_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_members` (
  `id_member` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `member_name` varchar(80) NOT NULL DEFAULT '',
  `date_registered` int(10) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `lngfile` varchar(255) NOT NULL DEFAULT '',
  `last_login` int(10) unsigned NOT NULL DEFAULT '0',
  `real_name` varchar(255) NOT NULL DEFAULT '',
  `personal_messages` smallint(5) NOT NULL DEFAULT '0',
  `mentions` smallint(5) NOT NULL DEFAULT '0',
  `unread_messages` smallint(5) NOT NULL DEFAULT '0',
  `new_pm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `buddy_list` text NOT NULL,
  `pm_ignore_list` varchar(255) NOT NULL DEFAULT '',
  `pm_prefs` mediumint(8) NOT NULL DEFAULT '2',
  `mod_prefs` varchar(20) NOT NULL DEFAULT '',
  `message_labels` text NOT NULL,
  `passwd` varchar(64) NOT NULL DEFAULT '',
  `openid_uri` text NOT NULL,
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `personal_text` varchar(255) NOT NULL DEFAULT '',
  `gender` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `birthdate` date NOT NULL DEFAULT '0001-01-01',
  `website_title` varchar(255) NOT NULL DEFAULT '',
  `website_url` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `hide_email` tinyint(4) NOT NULL DEFAULT '0',
  `show_online` tinyint(4) NOT NULL DEFAULT '1',
  `time_format` varchar(80) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `time_offset` float NOT NULL DEFAULT '0',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `pm_email_notify` tinyint(4) NOT NULL DEFAULT '0',
  `karma_bad` smallint(5) unsigned NOT NULL DEFAULT '0',
  `karma_good` smallint(5) unsigned NOT NULL DEFAULT '0',
  `likes_given` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `likes_received` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `usertitle` varchar(255) NOT NULL DEFAULT '',
  `notify_announcements` tinyint(4) NOT NULL DEFAULT '1',
  `notify_regularity` tinyint(4) NOT NULL DEFAULT '1',
  `notify_send_body` tinyint(4) NOT NULL DEFAULT '0',
  `notify_types` tinyint(4) NOT NULL DEFAULT '2',
  `member_ip` varchar(255) NOT NULL DEFAULT '',
  `member_ip2` varchar(255) NOT NULL DEFAULT '',
  `secret_question` varchar(255) NOT NULL DEFAULT '',
  `secret_answer` varchar(64) NOT NULL DEFAULT '',
  `id_theme` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `is_activated` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `validation_code` varchar(10) NOT NULL DEFAULT '',
  `id_msg_last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `additional_groups` varchar(255) NOT NULL DEFAULT '',
  `smiley_set` varchar(48) NOT NULL DEFAULT '',
  `id_post_group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_time_logged_in` int(10) unsigned NOT NULL DEFAULT '0',
  `password_salt` varchar(255) NOT NULL DEFAULT '',
  `ignore_boards` text NOT NULL,
  `warning` tinyint(4) NOT NULL DEFAULT '0',
  `passwd_flood` varchar(12) NOT NULL DEFAULT '',
  `receive_from` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `otp_secret` varchar(16) NOT NULL DEFAULT '',
  `enable_otp` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_member`),
  KEY `member_name` (`member_name`),
  KEY `real_name` (`real_name`),
  KEY `date_registered` (`date_registered`),
  KEY `id_group` (`id_group`),
  KEY `birthdate` (`birthdate`),
  KEY `posts` (`posts`),
  KEY `last_login` (`last_login`),
  KEY `lngfile` (`lngfile`(30)),
  KEY `id_post_group` (`id_post_group`),
  KEY `warning` (`warning`),
  KEY `total_time_logged_in` (`total_time_logged_in`),
  KEY `id_theme` (`id_theme`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_members`
--

LOCK TABLES `elkarte_members` WRITE;
/*!40000 ALTER TABLE `elkarte_members` DISABLE KEYS */;
INSERT INTO `elkarte_members` VALUES (1,'admin',1436706263,0,1,'',1436706271,'admin',0,0,0,0,'','',2,'','','$2a$10$CH8cXrkbMcN2zVGteRaJJuwimIZLeGLRLaGxry9CzX3TFPwh/upei','','admin@example.com','',0,'0001-01-01','','','',0,1,'','',0,'',0,0,0,0,0,'',1,1,0,2,'10.0.2.2','10.0.2.2','','',0,1,'',1,'','',0,0,'2e4b','',0,'',1,'',0);
/*!40000 ALTER TABLE `elkarte_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_message_icons`
--

DROP TABLE IF EXISTS `elkarte_message_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_message_icons` (
  `id_icon` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `filename` varchar(80) NOT NULL DEFAULT '',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `icon_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_icon`),
  KEY `id_board` (`id_board`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_message_icons`
--

LOCK TABLES `elkarte_message_icons` WRITE;
/*!40000 ALTER TABLE `elkarte_message_icons` DISABLE KEYS */;
INSERT INTO `elkarte_message_icons` VALUES (1,'Standard','xx',0,0),(2,'Thumb Up','thumbup',0,1),(3,'Thumb Down','thumbdown',0,2),(4,'Exclamation point','exclamation',0,3),(5,'Question mark','question',0,4),(6,'Lamp','lamp',0,5),(7,'Smiley','smiley',0,6),(8,'Angry','angry',0,7),(9,'Cheesy','cheesy',0,8),(10,'Grin','grin',0,9),(11,'Sad','sad',0,10),(12,'Wink','wink',0,11),(13,'Poll','poll',0,12);
/*!40000 ALTER TABLE `elkarte_message_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_message_likes`
--

DROP TABLE IF EXISTS `elkarte_message_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_message_likes` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_msg` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_poster` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `like_timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_msg`,`id_member`),
  KEY `id_member` (`id_member`),
  KEY `id_poster` (`id_poster`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_message_likes`
--

LOCK TABLES `elkarte_message_likes` WRITE;
/*!40000 ALTER TABLE `elkarte_message_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_message_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_messages`
--

DROP TABLE IF EXISTS `elkarte_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_messages` (
  `id_msg` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `poster_time` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_msg_modified` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `poster_name` varchar(255) NOT NULL DEFAULT '',
  `poster_email` varchar(255) NOT NULL DEFAULT '',
  `poster_ip` varchar(255) NOT NULL DEFAULT '',
  `smileys_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `modified_time` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_name` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `icon` varchar(16) NOT NULL DEFAULT 'xx',
  `approved` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_msg`),
  UNIQUE KEY `topic` (`id_topic`,`id_msg`),
  UNIQUE KEY `id_board` (`id_board`,`id_msg`),
  UNIQUE KEY `id_member` (`id_member`,`id_msg`),
  KEY `approved` (`approved`),
  KEY `ip_index` (`poster_ip`(15),`id_topic`),
  KEY `participation` (`id_member`,`id_topic`),
  KEY `show_posts` (`id_member`,`id_board`),
  KEY `id_topic` (`id_topic`),
  KEY `id_member_msg` (`id_member`,`approved`,`id_msg`),
  KEY `current_topic` (`id_topic`,`id_msg`,`id_member`,`approved`),
  KEY `related_ip` (`id_member`,`poster_ip`,`id_msg`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_messages`
--

LOCK TABLES `elkarte_messages` WRITE;
/*!40000 ALTER TABLE `elkarte_messages` DISABLE KEYS */;
INSERT INTO `elkarte_messages` VALUES (1,1,1,1436706218,0,1,'Welcome to ElkArte!','Elkarte','info@elkarte.net','127.0.0.1',1,0,'','Welcome to ElkArte!<br /><br />We hope you enjoy using this software and building your community.&nbsp; If you have any problems, please feel free to [url=http://www.elkarte.net/index.php]ask us for assistance[/url].<br /><br />Thanks!<br />The ElkArte Community.','xx',1);
/*!40000 ALTER TABLE `elkarte_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_moderators`
--

DROP TABLE IF EXISTS `elkarte_moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_moderators` (
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_board`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_moderators`
--

LOCK TABLES `elkarte_moderators` WRITE;
/*!40000 ALTER TABLE `elkarte_moderators` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_notifications_pref`
--

DROP TABLE IF EXISTS `elkarte_notifications_pref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_notifications_pref` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notification_level` tinyint(1) NOT NULL DEFAULT '1',
  `mention_type` varchar(12) NOT NULL DEFAULT '',
  UNIQUE KEY `mention_member` (`id_member`,`mention_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_notifications_pref`
--

LOCK TABLES `elkarte_notifications_pref` WRITE;
/*!40000 ALTER TABLE `elkarte_notifications_pref` DISABLE KEYS */;
INSERT INTO `elkarte_notifications_pref` VALUES (0,1,'buddy'),(0,1,'likemsg'),(0,1,'quotedmem'),(0,1,'rlikemsg'),(0,1,'mentionmem');
/*!40000 ALTER TABLE `elkarte_notifications_pref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_openid_assoc`
--

DROP TABLE IF EXISTS `elkarte_openid_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_openid_assoc` (
  `server_url` text NOT NULL,
  `handle` varchar(255) NOT NULL DEFAULT '',
  `secret` text NOT NULL,
  `issued` int(10) NOT NULL DEFAULT '0',
  `expires` int(10) NOT NULL DEFAULT '0',
  `assoc_type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`server_url`(125),`handle`(125)),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_openid_assoc`
--

LOCK TABLES `elkarte_openid_assoc` WRITE;
/*!40000 ALTER TABLE `elkarte_openid_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_openid_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_package_servers`
--

DROP TABLE IF EXISTS `elkarte_package_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_package_servers` (
  `id_server` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_server`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_package_servers`
--

LOCK TABLES `elkarte_package_servers` WRITE;
/*!40000 ALTER TABLE `elkarte_package_servers` DISABLE KEYS */;
INSERT INTO `elkarte_package_servers` VALUES (1,'ElkArte Third-party Add-ons Site','http://addons.elkarte.net/package.json');
/*!40000 ALTER TABLE `elkarte_package_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_pending_notifications`
--

DROP TABLE IF EXISTS `elkarte_pending_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_pending_notifications` (
  `notification_type` varchar(10) NOT NULL,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_time` int(10) NOT NULL DEFAULT '0',
  `frequency` varchar(1) NOT NULL DEFAULT '',
  `snippet` text NOT NULL,
  UNIQUE KEY `types_member` (`notification_type`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_pending_notifications`
--

LOCK TABLES `elkarte_pending_notifications` WRITE;
/*!40000 ALTER TABLE `elkarte_pending_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_pending_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_permission_profiles`
--

DROP TABLE IF EXISTS `elkarte_permission_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_permission_profiles` (
  `id_profile` smallint(5) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_permission_profiles`
--

LOCK TABLES `elkarte_permission_profiles` WRITE;
/*!40000 ALTER TABLE `elkarte_permission_profiles` DISABLE KEYS */;
INSERT INTO `elkarte_permission_profiles` VALUES (1,'default'),(2,'no_polls'),(3,'reply_only'),(4,'read_only');
/*!40000 ALTER TABLE `elkarte_permission_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_permissions`
--

DROP TABLE IF EXISTS `elkarte_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_permissions` (
  `id_group` smallint(5) NOT NULL DEFAULT '0',
  `permission` varchar(30) NOT NULL DEFAULT '',
  `add_deny` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_group`,`permission`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_permissions`
--

LOCK TABLES `elkarte_permissions` WRITE;
/*!40000 ALTER TABLE `elkarte_permissions` DISABLE KEYS */;
INSERT INTO `elkarte_permissions` VALUES (-1,'search_posts',1),(-1,'calendar_view',1),(-1,'view_stats',1),(-1,'profile_view_any',1),(0,'view_mlist',1),(0,'search_posts',1),(0,'profile_view_own',1),(0,'profile_view_any',1),(0,'pm_read',1),(0,'pm_send',1),(0,'calendar_view',1),(0,'view_stats',1),(0,'who_view',1),(0,'profile_identity_own',1),(0,'profile_extra_own',1),(0,'profile_remove_own',1),(0,'profile_set_avatar',1),(0,'send_email_to_members',1),(0,'karma_edit',1),(2,'view_mlist',1),(2,'search_posts',1),(2,'profile_view_own',1),(2,'profile_view_any',1),(2,'pm_read',1),(2,'pm_send',1),(2,'pm_draft',1),(2,'pm_autosave_draft',1),(2,'calendar_view',1),(2,'view_stats',1),(2,'who_view',1),(2,'profile_identity_own',1),(2,'profile_extra_own',1),(2,'profile_remove_own',1),(2,'send_email_to_members',1),(2,'profile_title_own',1),(2,'calendar_post',1),(2,'calendar_edit_any',1),(2,'karma_edit',1),(2,'access_mod_center',1);
/*!40000 ALTER TABLE `elkarte_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_personal_messages`
--

DROP TABLE IF EXISTS `elkarte_personal_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_personal_messages` (
  `id_pm` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pm_head` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member_from` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `deleted_by_sender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `from_name` varchar(255) NOT NULL DEFAULT '',
  `msgtime` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  PRIMARY KEY (`id_pm`),
  KEY `id_member` (`id_member_from`,`deleted_by_sender`),
  KEY `msgtime` (`msgtime`),
  KEY `id_pm_head` (`id_pm_head`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_personal_messages`
--

LOCK TABLES `elkarte_personal_messages` WRITE;
/*!40000 ALTER TABLE `elkarte_personal_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_personal_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_pm_recipients`
--

DROP TABLE IF EXISTS `elkarte_pm_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_pm_recipients` (
  `id_pm` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `labels` varchar(60) NOT NULL DEFAULT '-1',
  `bcc` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_read` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pm`,`id_member`),
  UNIQUE KEY `id_member` (`id_member`,`deleted`,`id_pm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_pm_recipients`
--

LOCK TABLES `elkarte_pm_recipients` WRITE;
/*!40000 ALTER TABLE `elkarte_pm_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_pm_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_pm_rules`
--

DROP TABLE IF EXISTS `elkarte_pm_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_pm_rules` (
  `id_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` int(10) unsigned NOT NULL DEFAULT '0',
  `rule_name` varchar(60) NOT NULL DEFAULT '',
  `criteria` text NOT NULL,
  `actions` text NOT NULL,
  `delete_pm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_or` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rule`),
  KEY `id_member` (`id_member`),
  KEY `delete_pm` (`delete_pm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_pm_rules`
--

LOCK TABLES `elkarte_pm_rules` WRITE;
/*!40000 ALTER TABLE `elkarte_pm_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_pm_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_poll_choices`
--

DROP TABLE IF EXISTS `elkarte_poll_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_poll_choices` (
  `id_poll` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_choice` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL DEFAULT '',
  `votes` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_poll`,`id_choice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_poll_choices`
--

LOCK TABLES `elkarte_poll_choices` WRITE;
/*!40000 ALTER TABLE `elkarte_poll_choices` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_poll_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_polls`
--

DROP TABLE IF EXISTS `elkarte_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_polls` (
  `id_poll` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `voting_locked` tinyint(1) NOT NULL DEFAULT '0',
  `max_votes` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  `hide_results` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `change_vote` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest_vote` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `num_guest_voters` int(10) unsigned NOT NULL DEFAULT '0',
  `reset_poll` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_poll`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_polls`
--

LOCK TABLES `elkarte_polls` WRITE;
/*!40000 ALTER TABLE `elkarte_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_postby_emails`
--

DROP TABLE IF EXISTS `elkarte_postby_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_postby_emails` (
  `id_email` varchar(50) NOT NULL DEFAULT '',
  `time_sent` int(10) NOT NULL DEFAULT '0',
  `email_to` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_postby_emails`
--

LOCK TABLES `elkarte_postby_emails` WRITE;
/*!40000 ALTER TABLE `elkarte_postby_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_postby_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_postby_emails_error`
--

DROP TABLE IF EXISTS `elkarte_postby_emails_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_postby_emails_error` (
  `id_email` int(10) NOT NULL AUTO_INCREMENT,
  `error` varchar(255) NOT NULL DEFAULT '',
  `data_id` varchar(255) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `id_message` int(10) NOT NULL DEFAULT '0',
  `id_board` smallint(5) NOT NULL DEFAULT '0',
  `email_from` varchar(50) NOT NULL DEFAULT '',
  `message_type` char(10) NOT NULL DEFAULT '',
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`id_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_postby_emails_error`
--

LOCK TABLES `elkarte_postby_emails_error` WRITE;
/*!40000 ALTER TABLE `elkarte_postby_emails_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_postby_emails_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_postby_emails_filters`
--

DROP TABLE IF EXISTS `elkarte_postby_emails_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_postby_emails_filters` (
  `id_filter` int(10) NOT NULL AUTO_INCREMENT,
  `filter_style` char(6) NOT NULL DEFAULT '',
  `filter_type` varchar(255) NOT NULL DEFAULT '',
  `filter_to` varchar(255) NOT NULL DEFAULT '',
  `filter_from` varchar(255) NOT NULL DEFAULT '',
  `filter_name` varchar(255) NOT NULL DEFAULT '',
  `filter_order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_filter`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_postby_emails_filters`
--

LOCK TABLES `elkarte_postby_emails_filters` WRITE;
/*!40000 ALTER TABLE `elkarte_postby_emails_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_postby_emails_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_scheduled_tasks`
--

DROP TABLE IF EXISTS `elkarte_scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_scheduled_tasks` (
  `id_task` smallint(5) NOT NULL AUTO_INCREMENT,
  `next_time` int(10) NOT NULL DEFAULT '0',
  `time_offset` int(10) NOT NULL DEFAULT '0',
  `time_regularity` smallint(5) NOT NULL DEFAULT '0',
  `time_unit` varchar(1) NOT NULL DEFAULT 'h',
  `disabled` tinyint(3) NOT NULL DEFAULT '0',
  `task` varchar(24) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_task`),
  UNIQUE KEY `task` (`task`),
  KEY `next_time` (`next_time`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_scheduled_tasks`
--

LOCK TABLES `elkarte_scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `elkarte_scheduled_tasks` DISABLE KEYS */;
INSERT INTO `elkarte_scheduled_tasks` VALUES (1,1436716800,0,2,'h',0,'approval_notification'),(2,1437264000,0,7,'d',0,'auto_optimize'),(3,1436832060,60,1,'d',0,'daily_maintenance'),(4,1436832000,0,1,'d',0,'daily_digest'),(5,0,0,1,'w',0,'weekly_digest'),(6,0,0,1,'d',1,'birthdayemails'),(7,0,0,1,'w',0,'weekly_maintenance'),(8,0,120,1,'d',1,'paid_subscriptions'),(9,0,120,1,'d',0,'remove_temp_attachments'),(10,0,180,1,'d',0,'remove_topic_redirect'),(11,0,240,1,'d',0,'remove_old_drafts'),(12,0,0,6,'h',0,'remove_old_followups'),(13,0,360,10,'m',1,'maillist_fetch_IMAP'),(14,0,30,1,'h',0,'user_access_mentions');
/*!40000 ALTER TABLE `elkarte_scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_sessions`
--

DROP TABLE IF EXISTS `elkarte_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_sessions` (
  `session_id` char(64) NOT NULL,
  `last_update` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_sessions`
--

LOCK TABLES `elkarte_sessions` WRITE;
/*!40000 ALTER TABLE `elkarte_sessions` DISABLE KEYS */;
INSERT INTO `elkarte_sessions` VALUES ('c0hr1ptvvfleg248s2us66qf87',1436706487,'installer_temp_lang|s:19:\"Install.english.php\";mc|a:7:{s:4:\"time\";i:1436706481;s:2:\"id\";i:0;s:2:\"gq\";s:3:\"0=1\";s:2:\"bq\";s:3:\"0=1\";s:2:\"ap\";a:0:{}s:2:\"mb\";a:0:{}s:2:\"mq\";s:3:\"0=1\";}login_ElkArteCookie700|s:115:\"a:4:{i:0;i:1;i:1;s:64:\"3078b8c1e6583762dd1751d1c90d5c4a0b72abb19d07d5002fab15aede317ca6\";i:2;i:1625922263;i:3;i:0;}\";session_value|s:32:\"dc1fe201ea7ec1b67a3922de74a5a7c7\";session_var|s:7:\"c544a23\";id_msg_last_visit|s:1:\"1\";rc|a:3:{s:2:\"id\";i:1;s:4:\"time\";i:1436706273;s:7:\"reports\";s:1:\"0\";}log_time|i:1436706481;timeOnlineUpdated|i:1436706271;unread_messages|i:0;old_url|s:22:\"http://127.0.0.1:8932/\";USER_AGENT|s:68:\"Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0\";token|a:1:{s:10:\"post-login\";a:4:{i:0;s:9:\"ec650e363\";i:1;s:32:\"329268ea26c0bffd5780d05bc381856f\";i:2;i:1436706481;i:3;s:32:\"78c983d7bd86bcd784fa4f8970c4bf52\";}}ban|a:5:{s:12:\"last_checked\";i:1436706487;s:9:\"id_member\";i:0;s:2:\"ip\";s:8:\"10.0.2.2\";s:3:\"ip2\";s:8:\"10.0.2.2\";s:5:\"email\";s:0:\"\";}');
/*!40000 ALTER TABLE `elkarte_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_settings`
--

DROP TABLE IF EXISTS `elkarte_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_settings` (
  `variable` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`variable`(30))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_settings`
--

LOCK TABLES `elkarte_settings` WRITE;
/*!40000 ALTER TABLE `elkarte_settings` DISABLE KEYS */;
INSERT INTO `elkarte_settings` VALUES ('elkVersion','1.1'),('news','ElkArte - Just Installed!'),('detailed-version.js','https://elkarte.github.io/Elkarte/site/detailed-version.js'),('compactTopicPagesContiguous','5'),('compactTopicPagesEnable','1'),('todayMod','1'),('likes_enabled','1'),('likeDisplayLimit','5'),('likeMinPosts','5'),('karmaMode','0'),('karmaTimeRestrictAdmins','1'),('enablePreviousNext','1'),('pollMode','1'),('modules_display','poll,verification,random'),('modules_post','poll,attachments,verification,random'),('modules_personalmessage','verification'),('modules_register','verification'),('enableVBStyleLogin','1'),('enableCompressedOutput','1'),('karmaWaitTime','1'),('karmaMinPosts','0'),('karmaLabel','Karma:'),('karmaSmiteLabel','[smite]'),('karmaApplaudLabel','[applaud]'),('attachmentSizeLimit','128'),('attachmentPostLimit','192'),('attachmentNumPerPostLimit','4'),('attachmentDirSizeLimit','10240'),('attachmentDirFileLimit','1000'),('attachmentUploadDir','a:1:{i:1;s:20:\"/var/www/attachments\";}'),('attachmentExtensions','doc,gif,jpg,mpg,pdf,png,txt,zip'),('attachmentCheckExtensions','0'),('attachmentShowImages','1'),('attachmentEnable','1'),('attachmentEncryptFilenames','1'),('attachmentThumbnails','1'),('attachmentThumbWidth','150'),('attachmentThumbHeight','150'),('use_subdirectories_for_attachments','1'),('censorIgnoreCase','1'),('mostOnline','2'),('mostOnlineToday','2'),('mostDate','1436706487'),('allow_disableAnnounce','1'),('trackStats','1'),('userLanguage','1'),('titlesEnable','1'),('topicSummaryPosts','15'),('enableErrorLogging','1'),('max_image_width','0'),('max_image_height','0'),('onlineEnable','0'),('cal_enabled','0'),('cal_maxyear','2020'),('cal_minyear','2008'),('cal_daysaslink','0'),('cal_defaultboard',''),('cal_showholidays','1'),('cal_showbdays','1'),('cal_showevents','1'),('cal_showweeknum','0'),('cal_maxspan','7'),('smtp_host',''),('smtp_port','25'),('smtp_username',''),('smtp_password',''),('mail_type','0'),('timeLoadPageEnable','0'),('totalMembers','1'),('totalTopics','1'),('totalMessages','1'),('censor_vulgar',''),('censor_proper',''),('enablePostHTML','0'),('theme_allow','1'),('theme_default','1'),('theme_guests','1'),('xmlnews_enable','1'),('xmlnews_limit','5'),('xmlnews_maxlen','255'),('hotTopicPosts','15'),('hotTopicVeryPosts','25'),('registration_method','0'),('send_validation_onChange','0'),('send_welcomeEmail','1'),('allow_editDisplayName','1'),('admin_session_lifetime','10'),('allow_hideOnline','1'),('spamWaitTime','5'),('pm_spam_settings','10,5,20'),('reserveWord','0'),('reserveCase','1'),('reserveUser','1'),('reserveName','1'),('reserveNames','Admin\\nWebmaster\\nGuest\\nroot'),('autoLinkUrls','1'),('banLastUpdated','0'),('smileys_dir','/var/www/smileys'),('smileys_url','http://127.0.0.1:8932/smileys'),('avatar_default','0'),('avatar_stored_enabled','1'),('avatar_external_enabled','1'),('avatar_gravatar_enabled','1'),('avatar_upload_enabled','1'),('avatar_directory','/var/www/avatars'),('avatar_url','http://127.0.0.1:8932/avatars'),('avatar_max_height','65'),('avatar_max_width','65'),('avatar_action_too_large','option_resize'),('avatar_download_png','1'),('gravatar_rating','g'),('failed_login_threshold','3'),('oldTopicDays','120'),('edit_wait_time','90'),('edit_disable_time','0'),('autoFixDatabase','1'),('allow_guestAccess','1'),('time_format','%B %d, %Y, %I:%M:%S %p'),('number_format','1234.00'),('enableBBC','1'),('max_messageLength','20000'),('signature_settings','1,300,0,0,0,0,0,0:'),('autoOptMaxOnline','0'),('defaultMaxMessages','15'),('defaultMaxTopics','20'),('defaultMaxMembers','30'),('enableParticipation','1'),('enableFollowup','1'),('recycle_enable','0'),('recycle_board','0'),('maxMsgID','1'),('enableAllMessages','0'),('fixLongWords','0'),('knownThemes','1,2,3'),('who_enabled','1'),('time_offset','0'),('cookieTime','60'),('jquery_source','local'),('lastActive','15'),('smiley_sets_known','default'),('smiley_sets_names','Fugue\\\'s Set'),('smiley_sets_default','default'),('cal_days_for_index','7'),('requireAgreement','1'),('unapprovedMembers','0'),('default_personal_text',''),('package_make_backups','1'),('databaseSession_enable','1'),('databaseSession_loose','1'),('databaseSession_lifetime','2880'),('search_cache_size','50'),('search_results_per_page','30'),('search_weight_frequency','30'),('search_weight_age','25'),('search_weight_length','20'),('search_weight_subject','15'),('search_weight_first_message','10'),('search_max_results','1200'),('search_floodcontrol_time','5'),('permission_enable_deny','0'),('permission_enable_postgroups','0'),('mail_next_send','0'),('mail_recent','0000000000|0'),('settings_updated','0'),('next_task_time','0'),('warning_settings','1,20,0'),('warning_watch','10'),('warning_moderate','35'),('warning_mute','60'),('admin_features',''),('last_mod_report_action','0'),('pruningOptions','30,180,180,180,30,7,0'),('cache_enable','1'),('reg_verification','1'),('visual_verification_type','3'),('visual_verification_num_chars','6'),('enable_buddylist','1'),('birthday_email','happy_birthday'),('dont_repeat_theme_core','1'),('dont_repeat_smileys_20','1'),('dont_repeat_buddylists','1'),('attachment_image_reencode','1'),('attachment_image_paranoid','0'),('attachment_thumb_png','1'),('avatar_reencode','1'),('avatar_paranoid','0'),('enable_unwatch','0'),('mentions_enabled','1'),('mentions_buddy','0'),('mentions_dont_notify_rlike','0'),('badbehavior_enabled','0'),('badbehavior_logging','1'),('badbehavior_ip_wl','a:3:{i:2;s:10:\"10.0.0.0/8\";i:5;s:13:\"172.16.0.0/12\";i:6;s:14:\"192.168.0.0/16\";}'),('badbehavior_ip_wl_desc','a:3:{i:2;s:18:\"RFC 1918 addresses\";i:5;s:18:\"RFC 1918 addresses\";i:6;s:18:\"RFC 1918 addresses\";}'),('badbehavior_url_wl','a:1:{i:0;s:18:\"/subscriptions.php\";}'),('badbehavior_url_wl_desc','a:1:{i:0;s:15:\"Payment Gateway\";}'),('notification_methods','a:4:{s:5:\"buddy\";a:4:{s:12:\"notification\";s:1:\"1\";s:5:\"email\";s:1:\"1\";s:11:\"email_daily\";s:1:\"1\";s:12:\"email_weekly\";s:1:\"1\";}s:7:\"likemsg\";a:1:{s:12:\"notification\";s:1:\"1\";}s:10:\"mentionmem\";a:4:{s:12:\"notification\";s:1:\"1\";s:5:\"email\";s:1:\"1\";s:11:\"email_daily\";s:1:\"1\";s:12:\"email_weekly\";s:1:\"1\";}s:9:\"quotedmem\";a:4:{s:12:\"notification\";s:1:\"1\";s:5:\"email\";s:1:\"1\";s:11:\"email_daily\";s:1:\"1\";s:12:\"email_weekly\";s:1:\"1\";}}'),('global_character_set','UTF-8'),('default_timezone','Etc/GMT0'),('memberlist_updated','1436706263'),('latestMember','1'),('latestRealName','admin'),('currentAttachmentUploadDir','1'),('rand_seed','2106514305'),('mostOnlineUpdated','2015-07-12');
/*!40000 ALTER TABLE `elkarte_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_smileys`
--

DROP TABLE IF EXISTS `elkarte_smileys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_smileys` (
  `id_smiley` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '',
  `filename` varchar(48) NOT NULL DEFAULT '',
  `description` varchar(80) NOT NULL DEFAULT '',
  `smiley_row` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_smiley`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_smileys`
--

LOCK TABLES `elkarte_smileys` WRITE;
/*!40000 ALTER TABLE `elkarte_smileys` DISABLE KEYS */;
INSERT INTO `elkarte_smileys` VALUES (1,':)','smiley.gif','Smiley',0,0,0),(2,';)','wink.gif','Wink',0,1,0),(3,':D','cheesy.gif','Cheesy',0,2,0),(4,';D','grin.gif','Grin',0,3,0),(5,'>:(','angry.gif','Angry',0,4,0),(6,':(','sad.gif','Sad',0,5,0),(7,':o','shocked.gif','Shocked',0,6,0),(8,'8)','cool.gif','Cool',0,7,0),(9,'???','huh.gif','Huh?',0,8,0),(10,'::)','rolleyes.gif','Roll Eyes',0,9,0),(11,':P','tongue.gif','Tongue',0,10,0),(12,':-[','embarrassed.gif','Embarrassed',0,11,0),(13,':-X','lipsrsealed.gif','Lips Sealed',0,12,0),(14,':-\\','undecided.gif','Undecided',0,13,0),(15,':-*','kiss.gif','Kiss',0,14,0),(16,':\'(','cry.gif','Cry',0,15,0),(17,'>:D','evil.gif','Evil',0,16,1),(18,'^-^','azn.gif','Azn',0,17,1),(19,'O0','afro.gif','Afro',0,18,1),(20,':))','laugh.gif','Laugh',0,19,1),(21,'C:-)','police.gif','Police',0,20,1),(22,'O:)','angel.gif','Angel',0,21,1);
/*!40000 ALTER TABLE `elkarte_smileys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_spiders`
--

DROP TABLE IF EXISTS `elkarte_spiders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_spiders` (
  `id_spider` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `spider_name` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `ip_info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_spider`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_spiders`
--

LOCK TABLES `elkarte_spiders` WRITE;
/*!40000 ALTER TABLE `elkarte_spiders` DISABLE KEYS */;
INSERT INTO `elkarte_spiders` VALUES (1,'Google','googlebot',''),(2,'Yahoo!','Yahoo! Slurp',''),(3,'MSN','msnbot',''),(4,'Bing','bingbot',''),(5,'Google (Mobile)','Googlebot-Mobile',''),(6,'Google (Image)','Googlebot-Image',''),(7,'Google (AdSense)','Mediapartners-Google',''),(8,'Google (Adwords)','AdsBot-Google',''),(9,'Yahoo! (Mobile)','YahooSeeker/M1A1-R2D2',''),(10,'Yahoo! (Image)','Yahoo-MMCrawler',''),(11,'Yahoo! (Blogs)','Yahoo-Blogs',''),(12,'Yahoo! (Feeds)','YahooFeedSeeker',''),(13,'MSN (Mobile)','MSNBOT_Mobile',''),(14,'MSN (Media)','msnbot-media',''),(15,'Cuil','twiceler',''),(16,'Ask','Teoma',''),(17,'Baidu','Baiduspider',''),(18,'Gigablast','Gigabot',''),(19,'InternetArchive','ia_archiver-web.archive.org',''),(20,'Alexa','ia_archiver',''),(21,'Omgili','omgilibot',''),(22,'EntireWeb','Speedy Spider',''),(23,'Yandex','YandexBot',''),(24,'Yandex (Images)','YandexImages',''),(25,'Yandex (Video)','YandexVideo',''),(26,'Yandex (Blogs)','YandexBlogs',''),(27,'Yandex (Media)','YandexMedia','');
/*!40000 ALTER TABLE `elkarte_spiders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_subscriptions`
--

DROP TABLE IF EXISTS `elkarte_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_subscriptions` (
  `id_subscribe` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `cost` text NOT NULL,
  `length` varchar(6) NOT NULL DEFAULT '',
  `id_group` smallint(5) NOT NULL DEFAULT '0',
  `add_groups` varchar(40) NOT NULL DEFAULT '',
  `active` tinyint(3) NOT NULL DEFAULT '1',
  `repeatable` tinyint(3) NOT NULL DEFAULT '0',
  `allow_partial` tinyint(3) NOT NULL DEFAULT '0',
  `reminder` tinyint(3) NOT NULL DEFAULT '0',
  `email_complete` text NOT NULL,
  PRIMARY KEY (`id_subscribe`),
  KEY `active` (`active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_subscriptions`
--

LOCK TABLES `elkarte_subscriptions` WRITE;
/*!40000 ALTER TABLE `elkarte_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_themes`
--

DROP TABLE IF EXISTS `elkarte_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_themes` (
  `id_member` mediumint(8) NOT NULL DEFAULT '0',
  `id_theme` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `variable` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id_theme`,`id_member`,`variable`(30)),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_themes`
--

LOCK TABLES `elkarte_themes` WRITE;
/*!40000 ALTER TABLE `elkarte_themes` DISABLE KEYS */;
INSERT INTO `elkarte_themes` VALUES
(0,1,'name','ElkArte Default Theme'),
(0,1,'theme_url','http://127.0.0.1:8932/themes/default'),
(0,1,'images_url','http://127.0.0.1:8932/themes/default/images'),
(0,1,'theme_dir','/var/www/themes/default'),
(0,1,'show_bbc','1'),
(0,1,'show_latest_member','1'),
(0,1,'show_modify','1'),
(0,1,'show_user_images','1'),
(0,1,'show_blurb','1'),
(0,1,'show_gender','0'),
(0,1,'number_recent_posts','0'),
(0,1,'linktree_link','1'),
(0,1,'show_profile_buttons','1'),
(0,1,'show_mark_read','1'),
(0,1,'show_stats_index','1'),
(0,1,'newsfader_time','5000'),
(0,1,'allow_no_censored','0'),
(0,1,'additional_options_collapsable','1'),
(0,1,'use_image_buttons','1'),
(0,1,'enable_news','1'),
(0,1,'forum_width','90%'),
(-1,1,'display_quick_reply','2'),
(-1,1,'view_newest_pm_first','1'),
(-1,1,'return_to_post','1'),
(-1,1,'drafts_autosave_enabled','1'),
(0, 2, 'additional_options_collapsible', '0'),
(0, 2, 'default_variant', 'normal'),
(0, 2, 'disable_user_variant', '0'),
(0, 2, 'display_who_viewing', '2'),
(0, 2, 'enable_news', '1'),
(0, 2, 'forum_width', '90%'),
(0, 2, 'header_layout', '0'),
(0, 2, 'header_logo_url', 'http://127.0.0.1:8932/themes/xydre/images/logo.png'),
(0, 2, 'hide_post_group', '1'),
(0, 2, 'images_url', 'http://127.0.0.1:8932/themes/xydre/images'),
(0, 2, 'linktree_link', '1'),
(0, 2, 'name', 'Xydre'),
(0, 2, 'newsfader_time', '5000'),
(0, 2, 'number_recent_posts', '5'),
(0, 2, 'show_bbc', '1'),
(0, 2, 'show_blurb', '1'),
(0, 2, 'show_gender', '0'),
(0, 2, 'show_group_key', '0'),
(0, 2, 'show_latest_member', '1'),
(0, 2, 'show_mark_read', '1'),
(0, 2, 'show_modify', '1'),
(0, 2, 'show_profile_buttons', '1'),
(0, 2, 'show_stats_index', '1'),
(0, 2, 'show_user_images', '1'),
(0, 2, 'site_slogan', ''),
(0, 2, 'smiley_sets_default', ''),
(0, 2, 'theme_dir', '/var/www/themes/xydre'),
(0, 2, 'theme_layers', 'html,body'),
(0, 2, 'theme_templates', 'index'),
(0, 2, 'theme_url', 'http://127.0.0.1:8932/themes/xydre');
/*!40000 ALTER TABLE `elkarte_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_topics`
--

DROP TABLE IF EXISTS `elkarte_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_topics` (
  `id_topic` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `is_sticky` tinyint(4) NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_first_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_last_msg` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member_started` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_member_updated` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_poll` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_previous_board` smallint(5) NOT NULL DEFAULT '0',
  `id_previous_topic` mediumint(8) NOT NULL DEFAULT '0',
  `num_replies` int(10) unsigned NOT NULL DEFAULT '0',
  `num_views` int(10) unsigned NOT NULL DEFAULT '0',
  `num_likes` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `redirect_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `id_redirect_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `unapproved_posts` smallint(5) NOT NULL DEFAULT '0',
  `approved` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_topic`),
  UNIQUE KEY `last_message` (`id_last_msg`,`id_board`),
  UNIQUE KEY `first_message` (`id_first_msg`,`id_board`),
  UNIQUE KEY `poll` (`id_poll`,`id_topic`),
  KEY `is_sticky` (`is_sticky`),
  KEY `approved` (`approved`),
  KEY `id_board` (`id_board`),
  KEY `member_started` (`id_member_started`,`id_board`),
  KEY `last_message_sticky` (`id_board`,`is_sticky`,`id_last_msg`),
  KEY `board_news` (`id_board`,`id_first_msg`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_topics`
--

LOCK TABLES `elkarte_topics` WRITE;
/*!40000 ALTER TABLE `elkarte_topics` DISABLE KEYS */;
INSERT INTO `elkarte_topics` VALUES (1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1);
/*!40000 ALTER TABLE `elkarte_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elkarte_user_drafts`
--

DROP TABLE IF EXISTS `elkarte_user_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elkarte_user_drafts` (
  `id_draft` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id_reply` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `poster_time` int(10) unsigned NOT NULL DEFAULT '0',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `smileys_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `body` mediumtext NOT NULL,
  `icon` varchar(16) NOT NULL DEFAULT 'xx',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(4) NOT NULL DEFAULT '0',
  `to_list` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_draft`),
  UNIQUE KEY `id_member` (`id_member`,`id_draft`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elkarte_user_drafts`
--

LOCK TABLES `elkarte_user_drafts` WRITE;
/*!40000 ALTER TABLE `elkarte_user_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `elkarte_user_drafts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-12 13:08:53
