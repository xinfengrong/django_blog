-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('8ae3c7df6af6');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `picture` varchar(300) DEFAULT NULL,
  `full_content` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `cid` (`cid`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'政府出实招 企业谋创新 各地有序复工复产劲头足','关系到实现全年经济社会发展目标任务，关系到全面建成小康社会和完成‘十三五’规划，关系到我国对外开放和世界经济稳定','2020-02-29 22:00:00',1,600,10,'image/feature-pic-1.jpeg',NULL),(2,'国务院联防联控机制介绍新冠肺炎防控和治疗有关情况','关系到实现全年经济社会发展目标任务，关系到全面建成小康社会和完成‘十三五’规划，关系到我国对外开放和世界经济稳定','2020-02-29 22:00:00',3,600,15,'image/feature-pic-2.jpeg',NULL),(3,'脱贫攻坚加把劲，不破楼兰终不还','关系到实现全年经济社会发展目标任务，关系到全面建成小康社会和完成‘十三五’规划，关系到我国对外开放和世界经济稳定','2020-02-29 22:00:00',3,600,12,'image/feature-pic-3.jpeg',NULL),(4,'微盟“删库”144小时，痛的不是股价，是信任','很多人认为SaaS市场会因为疫情而火爆的时候，微盟删库事件也让大家更加认识到云上数据安全的问题更需要引起足够的重视','2020-02-29 22:00:00',3,600,7,'image/blog-post-1.jpeg',NULL),(5,'关键时刻，苹果再失血？','据知情人士透露，制造设计副总裁尼克·弗伦扎（Nick Forlenza）已从退休，离开了原岗位，而另一位运营副总裁杜科·帕斯穆瓦（Duco Pasmooij）也在考虑未来离开苹果。','2020-02-29 22:00:00',1,600,12,'image/blog-post-3.jpeg',NULL),(6,'飞书遭微信全面封禁 申诉后三小时微信单方面修改封禁提示','2月29日，字节跳动旗下办公套件飞书发布官方公告称，飞书相关域名无故被微信全面封禁，并且被单方面关闭微信分享API接口','2020-02-29 22:00:00',2,600,13,'image/blog-post-4.jpeg',NULL),(7,'进一步指导各地落实分区分级差异化防控策略','就进一步指导各地准确分析把握疫情和经济社会发展形势，落实分区分级差异化防控策略，统筹推进疫情防控和经济社会发展工作，作出部署安排。','2020-02-29 22:00:00',1,600,1,'image/blog-2.jpg',NULL),(8,'《马哈迪时代的终结》','政治分分钟在变，在国阵、伊斯兰党及希盟拒绝支持马哈迪后，他终于在自己的布局下，终结了任相之路。','2020-02-29 22:00:00',4,600,NULL,'image/gallery-2.jpg',NULL),(9,'一个字节都得省的年代，人们是如何创造游戏人声的？','这台机器具备分析语音音调和共振的能力，原理是将声音编码后再进行传输。因为从本质来看，人声大体上可以解构成周期性的波形和谐波，声带、鼻子和喉咙则是改变声音振幅、频率的系统','2020-02-29 22:00:00',2,600,NULL,'image/feature-pic-2.jpeg',NULL),(10,'一个字节都得省的年代，请问是如何创造游戏人声的？','这台机器具备分析语音音调和共振的能力，原理是将声音编码后再进行传输。因为从本质来看，人声大体上可以解构成周期性的波形和谐波，声带、鼻子和喉咙则是改变声音振幅、频率的系统','2020-03-17 19:41:26',2,600,NULL,'images/bg.jpg',NULL),(11,'世卫组织表示病毒没有国界 不应同种族联系','世卫组织回应特朗普称新冠病毒为“中国病毒”：病毒没有国界，不应同种族相联系。',NULL,1,NULL,NULL,NULL,'当地时间3月18日，瑞士日内瓦，世卫组织回应特朗普称新冠病毒为“中国病毒”：病毒没有国界，不应同种族相联系。世卫组织卫生紧急项目负责人迈克尔·瑞安称，2009年（H1N1）流感大流行是始于北美，也没把它称作北美流感。所以当遇到其他病毒时，应采用同样的命名方式，避免同地域联系。'),(12,NULL,'3月上旬，纽约市长白思豪在接受媒体采访时表示，病毒检测试剂盒短缺 “是危机进一步恶化的根本原因”。美国《科学》杂志官网曾刊文称，美国的新冠病毒核酸检测试剂盒一度存在质量问题',NULL,1,NULL,NULL,NULL,'3月上旬，纽约市长白思豪在接受媒体采访时表示，病毒检测试剂盒短缺 “是危机进一步恶化的根本原因”。美国《科学》杂志官网曾刊文称，美国的新冠病毒核酸检测试剂盒一度存在质量问题'),(13,NULL,'测试测试测试',NULL,1,NULL,NULL,NULL,'测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试'),(14,'月亮与六便士','<p><span class=\"bjh-strong\" style=\"font-size: 18px; color: #333333; font-weight: bold; font-family: arial; text-align: justify;\">我那时还不了解人性多么矛盾，我不知道真挚中含有多少做作，高尚中蕴藏着多少卑鄙，或者，即使在邪恶里也找得着美德</span><span style=\"color: #333333; font-family: arial; font-size: 16px; text-align: justify;\">。</span><span class=\"bjh-strong\" style=\"font-size: 18px; color: #333333; font-weight: bold; font-family: arial; text-align: justify;\">卑鄙与伟大、恶毒与善良、仇恨与热爱是可以互不排斥地并存在同一颗心里的</span><span style=\"color: #333333; font-family: arial; font-size: 16px; text-align: justify;\">，这句话我们国人最容易理解，满嘴的&ldquo;仁义道德&rdquo;背后也有罪恶，表面的仁义何尝不是期待着回报？因此用道德谴责别人才是最不道德的行为。</span></p>','2020-03-23 08:50:06',1,NULL,NULL,'upload/1.png','<p><span class=\"bjh-strong\" style=\"font-size: 18px; color: #333333; font-weight: bold; font-family: arial; text-align: justify;\">我那时还不了解人性多么矛盾，我不知道真挚中含有多少做作，高尚中蕴藏着多少卑鄙，或者，即使在邪恶里也找得着美德</span><span style=\"color: #333333; font-family: arial; font-size: 16px; text-align: justify;\">。</span><span class=\"bjh-strong\" style=\"font-size: 18px; color: #333333; font-weight: bold; font-family: arial; text-align: justify;\">卑鄙与伟大、恶毒与善良、仇恨与热爱是可以互不排斥地并存在同一颗心里的</span><span style=\"color: #333333; font-family: arial; font-size: 16px; text-align: justify;\">，这句话我们国人最容易理解，满嘴的&ldquo;仁义道德&rdquo;背后也有罪恶，表面的仁义何尝不是期待着回报？因此用道德谴责别人才是最不道德的行为。</span></p>'),(20,'testing','testc','2020-03-21 22:35:51',NULL,NULL,NULL,NULL,'good good study day day up good good study day day up good good study day day up good good study day day up good good study day day up good good study day day up good good study day day up'),(21,'Testing','<p>测试呀</p>','2020-03-23 12:32:47',1,NULL,NULL,'upload/1.png','<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>'),(22,'与霍金一起了解宇宙','<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">英国著名物理学家史蒂芬&middot;霍金发出警告，称外星生物可能真的存在，但是人类与他们接触可能会带来毁灭性的后果。</span></p>','2020-03-22 15:10:48',9,NULL,NULL,NULL,'<p><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">8岁的霍金在片中谈论了他对宇宙外星生命问题的最新思考。他认为外星生命几乎肯定存在於宇宙的许多其他地方&mdash;&mdash;不仅是活在行星之上，甚至还可能存在於恒星中心，甚或是漂浮於行星间的广阔宇宙。</span><span style=\"color: #333333; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px;\">霍金认为外星人存在的理论依据，超乎寻常的简单。他指出，宇宙有1000亿个银河系，每个都包含上亿计恒星，在这样一个庞大空间裏，地球不大可能是唯一演化出生命的行星。&ldquo;我觉得，纯粹出於数学脑筋去想，单是如此巨大的数字，就足已令外星人存在的想法显得完全合理。真正的挑战是，去发现外星人到底是什么样子。</span></p>'),(23,'亲吻五星红旗后，总统把塞尔维亚和中国国旗紧紧系在一起','<p><span style=\"color: #262626; font-family: \'PingFang SC\', Helvetica, \'Microsoft YaHei\', Arial; font-size: 18px; letter-spacing: 1px; text-indent: 36px;\">当地时间3月21日，中国6人专家医疗队抵达塞尔维亚，随着专机带来的有中国政府紧急筹集的十几吨物资，塞尔维亚总统武契奇等多位政府官员在停机坪迎接。塞尔维亚总统亲吻五星红旗后，</span><span style=\"font-weight: bold; font-style: inherit; color: #262626; font-family: \'PingFang SC\', Helvetica, \'Microsoft YaHei\', Arial; font-size: 18px; letter-spacing: 1px; text-indent: 36px;\" data-scene=\"strong\">将国旗与五星红旗系在一起。</span></p>','2020-03-23 07:51:00',8,NULL,NULL,'upload/1.png','<p><span style=\"color: #262626; font-family: \'PingFang SC\', Helvetica, \'Microsoft YaHei\', Arial; font-size: 18px; letter-spacing: 1px; text-indent: 36px;\">当地时间3月21日，中国6人专家医疗队抵达塞尔维亚，随着专机带来的有中国政府紧急筹集的十几吨物资，塞尔维亚总统武契奇等多位政府官员在停机坪迎接。塞尔维亚总统亲吻五星红旗后，</span><span style=\"font-weight: bold; font-style: inherit; color: #262626; font-family: \'PingFang SC\', Helvetica, \'Microsoft YaHei\', Arial; font-size: 18px; letter-spacing: 1px; text-indent: 36px;\" data-scene=\"strong\">将国旗与五星红旗系在一起。</span></p>');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add article',7,'add_article'),(26,'Can change article',7,'change_article'),(27,'Can delete article',7,'delete_article'),(28,'Can view article',7,'view_article'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add mark',9,'add_mark'),(34,'Can change mark',9,'change_mark'),(35,'Can delete mark',9,'delete_mark'),(36,'Can view mark',9,'view_mark'),(37,'Can add tag',10,'add_tag'),(38,'Can change tag',10,'change_tag'),(39,'Can delete tag',10,'delete_tag'),(40,'Can view tag',10,'view_tag'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add captcha store',12,'add_captchastore'),(46,'Can change captcha store',12,'change_captchastore'),(47,'Can delete captcha store',12,'delete_captchastore'),(48,'Can view captcha store',12,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'世界',5),(2,'科技',2),(3,'财经',6),(4,'军事',7),(7,'外交',5),(8,'国际',10),(9,'宇宙',10);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'App','article'),(8,'App','category'),(9,'App','mark'),(10,'App','tag'),(11,'App','user'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'captcha','captchastore'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'App','0001_initial','2020-03-14 15:11:46.410229'),(2,'contenttypes','0001_initial','2020-03-14 15:11:47.050266'),(3,'auth','0001_initial','2020-03-14 15:11:48.839368'),(4,'admin','0001_initial','2020-03-14 15:11:56.522808'),(5,'admin','0002_logentry_remove_auto_add','2020-03-14 15:11:58.177902'),(6,'admin','0003_logentry_add_action_flag_choices','2020-03-14 15:11:58.215904'),(7,'contenttypes','0002_remove_content_type_name','2020-03-14 15:11:59.426974'),(8,'auth','0002_alter_permission_name_max_length','2020-03-14 15:12:00.212019'),(9,'auth','0003_alter_user_email_max_length','2020-03-14 15:12:01.428088'),(10,'auth','0004_alter_user_username_opts','2020-03-14 15:12:01.506093'),(11,'auth','0005_alter_user_last_login_null','2020-03-14 15:12:02.138129'),(12,'auth','0006_require_contenttypes_0002','2020-03-14 15:12:02.184131'),(13,'auth','0007_alter_validators_add_error_messages','2020-03-14 15:12:02.240135'),(14,'auth','0008_alter_user_username_max_length','2020-03-14 15:12:02.958176'),(15,'auth','0009_alter_user_last_name_max_length','2020-03-14 15:12:03.742221'),(16,'auth','0010_alter_group_name_max_length','2020-03-14 15:12:05.149301'),(17,'auth','0011_update_proxy_permissions','2020-03-14 15:12:05.215305'),(18,'sessions','0001_initial','2020-03-14 15:12:05.646329'),(19,'captcha','0001_initial','2020-03-16 21:45:57.120999');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8g0pjt9ljlmoh6fv5q0z8p1g6ls5wk4h','NzMxNTMzZmI3MmMzZWYzNTgzZjE4ZjA3NzAzMmVjMTFkMzdkMWI2Zjp7InVzZXJuYW1lIjoibW9uaWNhIn0=','2020-03-29 15:20:34.275705'),('9wcjq0u4add3vcjt4tzi2ngm85tdid2t','YzExNmQyMGY0MjIzZDg3MTQ4ZDFmNzA5OGQxNmZiNDFjM2UxM2RjZDp7InVzZXJuYW1lIjoibW9uaWNhIiwicGFzc3dvcmQiOiIxMjM0NTYifQ==','2020-04-05 23:15:04.119375'),('ig0amq9ifyb2pyrnjr9hp6qgbsxjyw7u','NzMxNTMzZmI3MmMzZWYzNTgzZjE4ZjA3NzAzMmVjMTFkMzdkMWI2Zjp7InVzZXJuYW1lIjoibW9uaWNhIn0=','2020-03-30 22:22:35.972766'),('lrn19z28tsyms0pkbxqj3w6my70lk2nq','YzExNmQyMGY0MjIzZDg3MTQ4ZDFmNzA5OGQxNmZiNDFjM2UxM2RjZDp7InVzZXJuYW1lIjoibW9uaWNhIiwicGFzc3dvcmQiOiIxMjM0NTYifQ==','2020-04-06 08:40:18.809607'),('ra0n5vk1w480sauvqwmx6b2m4nf14r2d','NzMxNTMzZmI3MmMzZWYzNTgzZjE4ZjA3NzAzMmVjMTFkMzdkMWI2Zjp7InVzZXJuYW1lIjoibW9uaWNhIn0=','2020-03-31 22:46:21.524804'),('rfn4kw8xnf32e70yjzp1dn8987ljx0oo','YzExNmQyMGY0MjIzZDg3MTQ4ZDFmNzA5OGQxNmZiNDFjM2UxM2RjZDp7InVzZXJuYW1lIjoibW9uaWNhIiwicGFzc3dvcmQiOiIxMjM0NTYifQ==','2020-04-06 12:31:56.404899'),('ucr6irw9dpsh6f2noxzj2wk0ow6zcsj0','NzMxNTMzZmI3MmMzZWYzNTgzZjE4ZjA3NzAzMmVjMTFkMzdkMWI2Zjp7InVzZXJuYW1lIjoibW9uaWNhIn0=','2020-03-31 17:02:08.339496'),('vs61osjw09qn8gheygm0n485m46310g2','YzExNmQyMGY0MjIzZDg3MTQ4ZDFmNzA5OGQxNmZiNDFjM2UxM2RjZDp7InVzZXJuYW1lIjoibW9uaWNhIiwicGFzc3dvcmQiOiIxMjM0NTYifQ==','2020-04-05 23:23:34.900590');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mark` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `marker_name` varchar(20) DEFAULT NULL,
  `marker_portrait` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `uid` (`uid`),
  CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mark`
--

LOCK TABLES `mark` WRITE;
/*!40000 ALTER TABLE `mark` DISABLE KEYS */;
INSERT INTO `mark` VALUES (1,'对待“新冠病毒”，我们应高度警惕、严阵以待；对待“新冠”字眼，则需保持平和理性心态，不宜望“字”生义，乱了分寸。\n实际上，这种平和理性恰恰能展现我们心理上的强大自信，而这也是我们最终战胜病毒的力量来源之一。','2020-02-29 22:30:00',1,'ross','image/avatar-1.jpg'),(2,'法治是疫情防控的最强大基石。防控疫情蔓延，依法是“从严”的前提，也是“从严”的保障。\n不久前召开的中央全面依法治国委员会第三次会议强调，“坚持依法防控，在法治轨道上统筹推进各项防控工作”','2020-02-29 22:30:00',1,'joey','image/avatar-2.jpg'),(3,'疫情防控正处于关键时期，越是到最吃劲的时候，越考验公职人员，尤其是基层干部的责任心。只有对怠政惰政干部及时、\n有效、严厉问责，才能让慵懒无处遁形，抓实抓细防控工作，最终打赢疫情防控阻击战','2020-03-01 09:00:00',1,'rachel','image/avatar-3.jpg'),(4,'1974 年时，美国人莫泽（Forrest Mozer）创造了一套基于集成电路的语音算法，他首先将这项技术授权给了 Telesensory Systems，后者在 1976 年打造了一款面向盲人的语音计算器。而作为首款具有语音合成功能的消费品，它内置的 TSI S14001A 芯片起到了关键作用。','2020-03-21 21:35:28',NULL,'rose',NULL),(5,'测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试','2020-03-21 21:51:58',NULL,'monica',NULL),(6,'<p>this world is suck but you will love it. welcome to the world of the adults.</p>','2020-03-22 20:12:47',NULL,'hello',NULL);
/*!40000 ALTER TABLE `mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `aid` (`aid`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'financial',2),(2,'financial',2),(3,'technology',6),(4,'military',8),(5,'world',5),(6,'world',7),(7,'financial',3),(8,'financial',4),(9,'technology',9),(10,'世界',11),(11,'世界',12),(12,'世界',13),(13,'宇宙',14),(14,'宇宙',22),(15,'世界',23);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `portrait` varchar(300) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `isforbid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'monica','123456','12345678901','123@qq.com','image/avatar-3.jpg','2020-02-29 08:00:00',0),(5,'caroline','7c4a8d09ca3762af61e59520943dc26494f8941b','15689765767','abc@qq.om',NULL,'2020-03-21 16:26:24',NULL),(7,'test1','654321','15689765767','1234@qq.com',NULL,'2020-03-21 16:36:22',NULL),(9,'ross','654321','15698567856','abcd@qq.om',NULL,'2020-03-21 17:15:00',NULL),(10,'max','654321','15689765767','1234@qq.com',NULL,'2020-03-21 17:16:43',NULL),(12,'sheldon','654321','15698567856','abc@qq.om',NULL,'2020-03-21 17:20:03',NULL),(15,'rose','246800','17865915921','hi@126.com',NULL,'2020-03-21 17:44:58',NULL),(16,'hii','654321','15698565656','hi@126.com','upload/2.png','2020-03-23 08:52:06',NULL),(17,'test2','654321','15698567856','abc@qq.om','upload/1.png','2020-03-23 08:51:00',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-23 20:29:36
