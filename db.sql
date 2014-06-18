CREATE DATABASE  IF NOT EXISTS `ctec227_final` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ctec227_final`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: ctec227_final
-- ------------------------------------------------------
-- Server version	5.5.34

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `date_time` int(11) NOT NULL,
  `active` enum('0','1') NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `curuser`
--

DROP TABLE IF EXISTS `curuser`;
/*!50001 DROP VIEW IF EXISTS `curuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `curuser` (
  `user_id` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `active` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `pass` tinyint NOT NULL,
  `rank_id` tinyint NOT NULL,
  `rank` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `gettasks`
--

DROP TABLE IF EXISTS `gettasks`;
/*!50001 DROP VIEW IF EXISTS `gettasks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `gettasks` (
  `task` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `project` tinyint NOT NULL,
  `project id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`project_id`, `project_name`, `user_id`, `status_id`, `start_date`, `end_date`, `description`, `active`) VALUES (1,'Jino\'s project',31,1,1400104800,1402956000,'this is a description',1),(2,'Test Project',32,1,1399845600,1400623200,'This is a test description. dddddddddddddddd dddddddddd dddddddddddd dddddddddddddd dddddddddddd ddddddddd',1),(3,'project 2',31,2,1397253600,1398895200,'blah blah blah',1),(4,'Project 3',31,3,1397253600,1397944800,'blah, de-blah, vlah',1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(255) NOT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` (`rank_id`, `rank_name`) VALUES (1,'Admin'),(2,'Project Manager'),(3,'Task Worker');
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_title` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`status_id`, `status_title`) VALUES (1,'Open'),(2,'Completed'),(3,'Completed - Pending'),(4,'Closed');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` (`task_id`, `task_name`, `description`, `project_id`, `user_id`, `status_id`) VALUES (1,'Clean around counters','Cleaning up around the counters so counters can be removed',1,3,1),(2,'Vacuum closet','Vacuum closet so it is free of debris for remodel',2,5,2);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `theprojects`
--

DROP TABLE IF EXISTS `theprojects`;
/*!50001 DROP VIEW IF EXISTS `theprojects`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `theprojects` (
  `project_id` tinyint NOT NULL,
  `project_name` tinyint NOT NULL,
  `start_date` tinyint NOT NULL,
  `end_date` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `status_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `theusers`
--

DROP TABLE IF EXISTS `theusers`;
/*!50001 DROP VIEW IF EXISTS `theusers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `theusers` (
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `rank` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `active` enum('0','1') NOT NULL,
  `username` varchar(255) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `rank_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `active`, `username`, `pass`, `rank_id`) VALUES (1,'Madonna','Taylor','m.taylor@greenwell.com','1','m.taylor','TLE35YMQ6VF',1),(2,'August','Vaughan','a.vaughan@greenwell.com','1','a.vaughan','JEZ85UOM7UC',2),(3,'Demetria','Thompson','d.thompson@greenwell.com','1','d.thompson','GDZ24JHJ2QM',1),(4,'Caleb','Bridges','c.bridges@greenwell.com','0','c.bridges','UMS55YMO1ET',3),(5,'Chandler','Woodard','c.woodard@greenwell.com','0','c.woodard','ZCA67PEU5QO',2),(6,'Wang','Pierce','w.pierce@greenwell.com','1','w.pierce','MSC52FFQ3TP',3),(7,'Dominic','Boyd','d.boyd@greenwell.com','0','d.boyd','VKQ25CXZ3EG',1),(8,'Aaron','Hale','a.hale@greenwell.com','1','a.hale','IWD93OHJ9BR',3),(9,'Oliver','Campbell','o.campbell@greenwell.com','0','o.campbell','NOX07OLC5YE',2),(10,'Herrod','Blake','h.blake@greenwell.com','1','h.blake','ABD45VKX4EA',1),(11,'Coby','Whitehead','c.whitehead@greenwell.com','0','c.whitehead','HQO53PKQ2MY',1),(12,'Dorian','Kemp','d.kemp@greenwell.com','0','d.kemp','EEH18EMI9IE',1),(13,'Griffith','Tyson','g.tyson@greenwell.com','0','g.tyson','CGP53WQL1QN',2),(14,'Kylan','Montoya','k.montoya@greenwell.com','1','k.montoya','BLC53PAA0VW',1),(15,'Macey','Britt','m.britt@greenwell.com','0','m.britt','YGI96HJB1CO',2),(16,'Dean','Ortiz','d.ortiz@greenwell.com','1','d.ortiz','MLL19QUO4PZ',3),(17,'Tatum','Harris','t.harris@greenwell.com','1','t.harris','LBV73AOQ7LF',2),(18,'Brent','Holman','b.holman@greenwell.com','0','b.holman','IDI09TYC7EE',3),(19,'Abraham','Guy','a.guy@greenwell.com','1','a.guy','IBU85YEW7RD',1),(20,'Chandler','Estes','c.estes@greenwell.com','1','c.estes','MIQ81MVW4CO',2),(21,'Latifah','Rose','l.rose@greenwell.com','1','l.rose','SLO80NBD1JW',3),(22,'Wang','Daniels','w.daniels@greenwell.com','0','w.daniels','QBC76JVH2YO',2),(23,'Hedley','Fuller','h.fuller@greenwell.com','0','h.fuller','RBH24JRO6IN',2),(24,'Logan','Bass','l.bass@greenwell.com','0','l.bass','VLN19UDC6QJ',1),(25,'Alfonso','King','a.king@greenwell.com','0','a.king','RHF54JEA0YA',1),(26,'Silas','Cline','s.cline@greenwell.com','0','s.cline','CEI71IUD3FV',3),(27,'Ashely','Mcdonald','a.mcdonald@greenwell.com','1','a.mcdonald','EXY69KHJ4QW',1),(28,'Rae','Hall','r.hall@greenwell.com','1','r.hall','HMH11TKT0RA',3),(29,'Ulric','Woodard','u.woodard@greenwell.com','0','u.woodard','HGB96ZNI8CA',1),(30,'Holmes','Wilkins','h.wilkins@greenwell.com','1','h.wilkins','YMK04MJB3EV',2),(31,'Jino','Conklin','temporizer@gmail.com','1','j.conklin','5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8',1),(32,'Bruce','Elgort','b.elgort@greenwell.com','1','b.elgort','5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8',2),(33,'Cristi','Jenkins','c.jenkins@greenwell.com','1','c.jenkins','5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `curuser`
--

/*!50001 DROP TABLE IF EXISTS `curuser`*/;
/*!50001 DROP VIEW IF EXISTS `curuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `curuser` AS select `u`.`user_id` AS `user_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`email` AS `email`,`u`.`active` AS `active`,`u`.`username` AS `username`,`u`.`pass` AS `pass`,`u`.`rank_id` AS `rank_id`,`r`.`rank_name` AS `rank` from (`user` `u` join `rank` `r` on((`r`.`rank_id` = `u`.`rank_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gettasks`
--

/*!50001 DROP TABLE IF EXISTS `gettasks`*/;
/*!50001 DROP VIEW IF EXISTS `gettasks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gettasks` AS select `t`.`task_name` AS `task`,`t`.`description` AS `description`,`u`.`first_name` AS `name`,`s`.`status_title` AS `status`,`p`.`project_name` AS `project`,`p`.`project_id` AS `project id`,`t`.`user_id` AS `user_id` from (((`task` `t` join `user` `u` on((`t`.`user_id` = `u`.`user_id`))) join `status` `s` on((`t`.`status_id` = `s`.`status_id`))) join `project` `p` on((`t`.`project_id` = `p`.`project_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `theprojects`
--

/*!50001 DROP TABLE IF EXISTS `theprojects`*/;
/*!50001 DROP VIEW IF EXISTS `theprojects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `theprojects` AS select `p`.`project_id` AS `project_id`,`p`.`project_name` AS `project_name`,`p`.`start_date` AS `start_date`,`p`.`end_date` AS `end_date`,`p`.`description` AS `description`,concat(`u`.`first_name`,' ',`u`.`last_name`) AS `name`,`s`.`status_title` AS `status`,`s`.`status_id` AS `status_id`,`u`.`user_id` AS `user_id` from ((`project` `p` join `user` `u` on((`p`.`user_id` = `u`.`user_id`))) join `status` `s` on((`p`.`status_id` = `s`.`status_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `theusers`
--

/*!50001 DROP TABLE IF EXISTS `theusers`*/;
/*!50001 DROP VIEW IF EXISTS `theusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `theusers` AS select `u`.`user_id` AS `id`,concat(`u`.`first_name`,' ',`u`.`last_name`) AS `name`,`r`.`rank_name` AS `rank` from (`user` `u` join `rank` `r` on((`r`.`rank_id` = `u`.`rank_id`))) where (`u`.`active` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-17 15:04:40
